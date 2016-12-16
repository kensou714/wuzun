module(..., package.seeall)
local KAOHUO_MAP="v003";
local KAOHUO_X=97;
local KAOHUO_Y=100;
local KAOHUO_RANGE=20;
local KAOHUO_MUL=1;
local JIU_TYPE_NAME={
	[0]="当前未饮酒",
	"女儿红",
	"女儿红(5年)",
	"女儿红(10年)",
	"女儿红(20年)",
};
function onTalk100(npc,player)
	item.jiu.check_jiu_day(player);
	local add_exp = get_exp(player,1,1);
	npc:echo([[火堆:

     哈哈,我是温暖的篝火堆,当我熊熊燃烧的时候,可以帮您驱赶严寒!

     <font color="#FFaa00">火堆全天开放,每饮用1瓶[女儿红]就可以获得五分钟烤火时间!喝酒后每10秒获得一次经验,喝的酒越好,经验则越高!
     <font color="#FF0000">在土城安全区内才可获得烤火经验</font>

     <font color="#FF0000">组队人数越多,烤火获得经验越多!</font>

     [女儿红]可在副本和BOSS身上获得!</font><br>
当前饮酒类型:[<s='r'>]].. JIU_TYPE_NAME[util.ppn(player,const.PP_JIUTYPE)] ..[[</s>]
剩余烤火时间:[<s='r'>]].. util.ppn(player,const.PP_JIULI) ..[[秒</s>]
每10秒可增加:[<s='r'>]].. add_exp .. [[</s>]经验
今日还可饮酒:[<s='r'>]]..const.JIU_MAX_NUM-util.ppn(player,const.PP_JIU_NUM)..[[</s>]瓶]]);
		show_merge(npc,player);
end
function handleLogin(player)
	if util.ptpn(player,const.PTP_KAOHUO) == 1 then return;end;
	if util.ppn(player,const.PP_JIULI) >= 10 then
		player:set_temp_param(const.PTP_KAOHUO,1);
		player:set_timer(const.PT_HUODUI,10000);
	end
end
login.add_login_listener(handleLogin);
function onTalkbegin(npc,player)
	if util.ptpn(player,const.PTP_KAOHUO) == 1 then return;end;
	if util.ppn(player,const.PP_JIULI) >= 10 then
		player:set_temp_param(const.PTP_KAOHUO,1);
		player:set_timer(const.PT_HUODUI,10000);
	else
		player:alert(1,1,"您的饮酒时间不足.");
	end
	return 100;
end
function onTalkend(npc,player)
	player:set_param(const.PP_JIUTYPE,"");
	player:set_temp_param(const.PTP_KAOHUO,0);
	player:set_timer(const.PT_HUODUI,0);
	return 100;
end
function get_exp(player,mul,st)
	local jtype=util.ppn(player,const.PP_JIUTYPE);
	local pdjy= math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*0.1272);
	local sysexp = 1;
	if server.get_temp_var("kaohuoexp") == "open" then
		sysexp = 1.5;
	end
	if jtype == 1 then
		return math.floor(sysexp*mul*st*1*pdjy*(1+(player:get_group_size()*0.02)));
	end
	if jtype == 2 then
		return math.floor(sysexp*mul*st*2*pdjy*(1+(player:get_group_size()*0.02)));
	end
	if jtype == 3 then
		return math.floor(sysexp*mul*st*4*pdjy*(1+(player:get_group_size()*0.02)));
	end
	if jtype == 4 then
		return math.floor(sysexp*mul*st*8*pdjy*(1+(player:get_group_size()*0.02)));
	end
	return 0;
end
function DoKao(player)
	local mul=0;
	local x,y=player:get_pos();
	local st=1;
	if player:get_map():get_id() == KAOHUO_MAP then
		if (math.abs(x-KAOHUO_X)+math.abs(y-KAOHUO_Y))< KAOHUO_RANGE then
			mul=KAOHUO_MUL;
		end
	end
	--经验倍数 if player:get_status_param(7) == 10000 then st=2;end
	local jiuli=util.ppn(player,const.PP_JIULI);
	if jiuli >= 10 then
		player:set_param(const.PP_JIULI,jiuli-10);
		player:set_timer(const.PT_HUODUI,10000);
		if mul == 0 then
			return ;
		end
		player:add_exp(get_exp(player,mul,st));
	else
		player:set_param(const.PP_JIUTYPE,"");
		player:set_temp_param(const.PTP_KAOHUO,0);
		player:set_timer(const.PT_HUODUI,0);
	end
end
function show_merge(npc,player)
	npc:echo("\n\n<s='e'>请选择您想要合成的酒:</s>\n<a href='event:talk_merge2'>女儿红(5年)</a> :需要<font color='#FFff00'>女儿红*5</font>       [<font color='#FF0000'>2倍</font>]\n");
	npc:echo("<a href='event:talk_merge2'>女儿红(10年)</a>:需要<font color='#FFff00'>女儿红(5年)*5</font>  [<font color='#FF0000'>4倍</font>]\n");
	npc:echo("<a href='event:talk_merge2'>女儿红(20年)</a>:需要<font color='#FFff00'>女儿红(10年)*5</font> [<font color='#FF0000'>8倍</font>]\n<font color='#FFaa00'>请注意:合成需要缴纳[5万金币]的费用!</font>");
end
function onTalkmerge2(npc,player)
	player:alert(1,1,"打开[熔炉]可以合成您所需要的酒!");
	onTalk100(npc,player);
end