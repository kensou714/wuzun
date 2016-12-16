module(..., package.seeall)
local task_id=const.TASK_ID_RICHANG;
local task_data={
	ttype="日常",		focus=false,		autogo=false,
	[1	]={need_level=25,	max_level=50,	need_target="百足长虫2",},
	[2	]={need_level=25,	max_level=50,	need_target="恶蛆虫2",},
	[3	]={need_level=25,	max_level=50,	need_target="穿山甲2",},
	[4	]={need_level=25,	max_level=50,	need_target="杀人蜂2",},
	[5	]={need_level=25,	max_level=50,	need_target="蠕虫2",},
	[6	]={need_level=30,	max_level=55,	need_target="食人蛾2",},
	[7	]={need_level=30,	max_level=55,	need_target="红猪妖2",},
	[8	]={need_level=30,	max_level=55,	need_target="黑猪妖2",},
	[9	]={need_level=35,	max_level=60,	need_target="蛇蝎2",},
	[10	]={need_level=35,	max_level=60,	need_target="猛犸雕像2",},
	[11	]={need_level=35,	max_level=60,	need_target="猛犸卫士2",},
	[12	]={need_level=45,	max_level=1000,	need_target="牛头妖2",},
	[13	]={need_level=45,	max_level=1000,	need_target="蛮牛战士2",},
	[14	]={need_level=45,	max_level=1000,	need_target="蛮牛斗士2",},
	[15	]={need_level=45,	max_level=1000,	need_target="蛮牛侍卫2",},
	[16	]={need_level=45,	max_level=1000,	need_target="蛮牛法师2",},
	[17	]={need_level=45,	max_level=1000,	need_target="蛮牛将军2",},
	[18	]={need_level=45,	max_level=1000,	need_target="蛮牛祭司2",},
	[19	]={need_level=50,	max_level=1000,	need_target="狼牙蜘蛛2",},
	[20	]={need_level=50,	max_level=1000,	need_target="妖魔蜘蛛2",},
	[21	]={need_level=50,	max_level=1000,	need_target="钢刺蜘蛛2",},
	[22	]={need_level=50,	max_level=1000,	need_target="妖毒蜘蛛2",},
	[23	]={need_level=50,	max_level=1000,	need_target="赤锷蜘蛛2",},
	[24	]={need_level=55,	max_level=1000,	need_target="巨灵勇士2",},
	[25	]={need_level=55,	max_level=1000,	need_target="巨灵战士2",},
	[26	]={need_level=55,	max_level=1000,	need_target="巨灵战斧2",},
	[27	]={need_level=60,	max_level=1000,	need_target="雪狼勇士2",},
	[28	]={need_level=60,	max_level=1000,	need_target="雪狼战士2",},
	[29	]={need_level=60,	max_level=1000,	need_target="雪狼斗士2",},
	[30	]={need_level=65,	max_level=1000,	need_target="地狱战士2",},
	[31	]={need_level=65,	max_level=1000,	need_target="地狱护卫2",},
	[32	]={need_level=65,	max_level=1000,	need_target="地狱战将2",},
	[33	]={need_level=70,	max_level=1000,	need_target="混沌斗士2",},
	[34	]={need_level=70,	max_level=1000,	need_target="混沌侍卫2",},
	[35	]={need_level=70,	max_level=1000,	need_target="混沌将军2",},
};
local task_state_data={};
local fresh_mul={1,1.2,1.4,1.6,1.8,2,2.2,2.4,2.6,3};

for i=1,#task_data do
	task_data[i].tid=i;task_data[i].nid=i;
	task_data[i].name="降妖除魔";
	task_data[i].accepter="伏魔使者";
	task_data[i].doner="伏魔使者";
	task_data[i].need_type="mon";
	task_data[i].need_num=10;
	task_data[i].accept_talk=function (npc,player,td)
		local ret = "苍茫大地,妖魔四起!值此乱世之秋,希望你能尽自己的一份绵薄之力以造福苍生!您愿意帮助我降妖除魔吗?";
		ret = ret .. "\n\n<font color='#ff0000'>您今天还可以接受[<font color='#ffff00'>".. const.RICHANG_MAX_NUM - util.ppn(player,const.PP_RICHANG_NUM) .. "</font>]次降妖除魔任务!</font><br><font color='#ffff00'>VIP会员每天可额外增加降妖除魔[1]次!</font><br><br><font color='#ffff00'>每次任务奖励2点行会贡献 2点行会经验!</font>";
		ret = ret .. "\n\n当前任务等级: ("..util.ppn(player,const.PP_XYCM_TASKLV).."/10) <a href='event:talk_T3002sj'>刷新任务等级</a><br><font color='#ff0000'>注意:刷新任务等级将会消耗20000金币!</font>"
		return ret;
	end;
	task_data[i].done_talk  =function (npc,player,td) return "看你的能力真是不可小觑啊!这么一会功夫就完成任务啦!这是给你的奖励!\n\n<font color='#ff0000'>您今天还可以接受[<font color='#ffff00'>".. const.RICHANG_MAX_NUM - util.ppn(player,const.PP_RICHANG_NUM) .. "</font>]次降妖除魔任务!</font>";end;
	task_data[i].award={alert=true;
		{name="经验",		num=function(target,player) return math.floor(util.ppn(player,const.PP_RICHANG_LV)*fresh_mul[util.ppn(player,const.PP_XYCM_TASKLV)]*math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*102.17));end,},
		{name="荣誉",		num=function(target,player) return math.floor(math.min(80,player:get_level())*21.3);end,	fun=function(player,data,num) player:add_honor(num);end;},
	};
	task_data[i].complate_hook=function(n,player,td) player:alert(11,1,"您已完成本次降妖除魔任务!");player:set_free_direct_fly(player:get_free_direct_fly()+1);end
	--task_data[i].accept_hook=function (npc,player,td) posmon.fly(player,td.need_target); end;
end

function onGetTaskName(player)
	local s=player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG_NUM)
	if const.RICHANG_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG_MAX_NUM == n) then
		task.util.show_task_name(player,player,task_id,task_data);
	end
end
function onGetTaskShortDesp(player)
	local s=player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG_NUM)
	if const.RICHANG_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG_MAX_NUM == n) then
		task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);
	end
end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(npc,player)			task.util.show_task_title(npc,player,task_id,task_state_data,task_data);end
function get_npc_flags(npc,player)
	local s=player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG_NUM)
	if const.RICHANG_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG_MAX_NUM == n) then
		return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);
	end
	return 0;
end

function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)
	check_richang_day(player);
	if player:get_task_state(task_id) == 0 then
		if player:get_level() >= 40 then
			local nid = gen_next_id(player);
			player:set_task_state(task_id,task.util.ts(nid,const.TSACCE));
			player:push_task_data(task_id,0);
		end
	end
	task.util.check_level(player,lv,task_id,task_state_data,task_data);
end
function check_richang_day(player)
	player:set_param(const.PP_RICHANG_LV,1);
	if util.ppn(player,const.PP_XYCM_TASKLV) == 0 then
		player:set_param(const.PP_XYCM_TASKLV,1);
	end
	if util.ppn(player,const.PP_RICHANG_DAY) ~= today() then
		player:set_param(const.PP_RICHANG_DAY,today());
		player:set_param(const.PP_RICHANG_NUM,0);
		if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_RICHANG_NUM,util.ppn(player,const.PP_RICHANG_NUM)-1); end;
		player:set_task_state(task_id,player:get_task_state(task_id));
		player:push_task_data(task_id,0);
		player:refresh_npc_show_flags_inview();
	end
end
function gen_next_id(player)
	local a={};
	local pl = player:get_level();
	for i=1,#task_data do
		if pl >= task_data[i].need_level and pl <= task_data[i].max_level then
			a[#a+1]=i;
		end
	end
	if #a > 0 then return a[math.random(1,#a)]; end;
	return 1;
end
_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do2']=function (npc,player)
	if 1==player:sub_gamemoney_bind(100000) then
		player:alert(1,1,"使用[100000绑定金币]成功领取双倍经验奖励!");
		player:set_param(const.PP_RICHANG_LV,2);
		return task.util.task_done(npc,player,task_id,task_state_data,task_data);
	else
		if 1==player:sub_gamemoney(100000) then
			player:alert(1,1,"使用[100000金币]成功领取双倍经验奖励!");
			player:set_param(const.PP_RICHANG_LV,2);
			return task.util.task_done(npc,player,task_id,task_state_data,task_data);
		else
		player:alert(1,1,"您的金币不足100000,无法领取双倍经验奖励!");
		return 100;
		end
	end
end
_M['onTalkT'..task_id..'Do3']=function (npc,player) 
	if 1==player:sub_gamemoney_bind(300000) then
		player:alert(1,1,"使用[300000绑定金币]成功领取三倍经验奖励!");
		player:set_param(const.PP_RICHANG_LV,3);
		return task.util.task_done(npc,player,task_id,task_state_data,task_data);
	else
		if 1==player:sub_gamemoney(300000) then
			player:alert(1,1,"使用[300000金币]成功领取三倍经验奖励!");
			player:set_param(const.PP_RICHANG_LV,3);
			return task.util.task_done(npc,player,task_id,task_state_data,task_data);
		else
		player:alert(1,1,"您的金币不足[300000],无法领取三倍经验奖励!");
		return 100;
		end
	end
end
cklevel.add_listener(check_level);
for i=1,#task_data do
	local td = task_data[i];
	task.util.build_task_state(task_id,task_data[i],task_data,task_state_data);
	if task_data[i].need_type == "mon" then
		if task_data[i].need_target == "" then
			ckmon.add_all_listener(check_mon_kill);
		else
			ckmon.add_listener(posmon.n(task_data[i].need_target),check_mon_kill);
		end
	end
	if task_data[i].need_type == "item" then
		ckitem.add_listener(task_data[i].need_item,check_item_change);
	end
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done2 = task_state_data[task.util.ts(td.tid,const.TSACCE)].done;
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done=function(npc,player)
		player:set_param(const.PP_RICHANG_LV,1);
		if util.ppn(player,const.PP_RICHANG_NUM) < const.RICHANG_MAX_NUM then
			player:set_param(const.PP_RICHANG_NUM,util.ppn(player,const.PP_RICHANG_NUM)+1);
			return task_state_data[task.util.ts(td.tid,const.TSACCE)].done2(npc,player);
		else
			player:alert(1,0,"对不起,您今天的降妖除魔任务已经全部完成!");
			return 100;
		end
	end
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].alltalk=function (target,player,n)
		local s=player:get_task_state(task_id);
		local b=math.floor(s / const.TASK_STATE_NUM);
		local d=math.fmod(s,const.TASK_STATE_NUM);
		local k = task_state_data[task.util.ts(td.tid,const.TSCOMP)];
		target:echo("<br>");
		task.util.show_task_type(target,player,task_id,task_data);
		task.util.show_task_name(target,player,task_id,task_data);
		target:echo("<br><br>");
		if type(k.talk)=="string" then target:echo(k.talk); end
		if type(k.talk)=="function" then target:echo(k.talk(target,player,n)); end
		if d == const.TSACCE then
			target:echo("<br><br>		    <a href='event:talk_T"..task_id.."Do'>btn_accept</a>");
		end
		if d == const.TSCOMP then
			target:echo("<br><br>                      <a href='event:talk_T"..task_id.."Do'>btn_complate</a>");
			target:echo("<br><br>      <font color='#ffaa00'>10万绑定金币领取</font><a href='event:talk_T"..task_id.."Do2'>【两倍经验奖励】</a>");
			target:echo("<br><br>      <font color='#ffaa00'>30万绑定金币领取</font><a href='event:talk_T"..task_id.."Do3'>【三倍经验奖励】</a><br><br>      <font color='#ff0000'>当绑定金币不足时将使用金币支付!</font>");
		end
		if td.focus then target:echo("<f>点击此处继续任务</f>");end
		target:echo("<br>");
		if n.award then
			--target:echo("<s='l'><l></s>");
			task.util.show_award(target,player,n.award);
		end
		return 1;
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp=posnpc.fp(td.doner);
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done=function (npc,player)
		player:alert(1,1,"成功完成[降妖除魔]任务,获得奖励:");

		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM1,util.ppn(player,const.PP_HUOYUEDU_NUM1)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM1)==5 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
		end
		
		task.util.give_award(player,td.award);
--		fresh_task_level(player);
		local nid = gen_next_id(player);
		player:set_task_state(task_id,task.util.ts(nid,const.TSACCE));
		player:push_task_data(task_id,0);
		player:set_param(const.PP_RICHANG_LV,1);
		player:set_param(const.PP_XYCM_TASKLV,1);
		newgui.guild.AddGuildExpGongxianSame(player,2);
		return 100;
	end;
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;
--下面这个函数可以用来确保任务还有多少次.用在主线或支线里面放置任务做完了卡住.
function maintask_fix(player,num)
	if util.ppn(player,const.PP_RICHANG_NUM) >= const.RICHANG_MAX_NUM then
		player:set_param(const.PP_RICHANG_NUM,util.ppn(player,const.PP_RICHANG_NUM)-num);
		task.util.check_level(player,player:get_level(),task_id,task_state_data,task_data);
	end
end
function show_fly(npc,player) show_fly2(npc,player,task_id,task_state_data,task_data);end
function show_fly2(target,player,task_id,data,td)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=data[s];
	local n=td[b];
	if k and n then
		if d == const.TSACED then
			target:echo("<br>");
			target:echo("我能将您传送到"..posmon.mp(player,n.need_target).."出没的地方!你现在确定要前往吗??");
			target:echo("<br><br>                      <a href='event:talk_T"..task_id.."Go'>【点击立刻前往】</a><br>");
			target:echo("<br>        <a href='event:talk_T"..task_id.."DirectDo'>使用[".. get_direct_comp_price(player) .."]元宝直接完成(3倍经验)</a>");
		end
	end
end
function get_direct_comp_price(player)
	return 50;
end
_M['onTalkT'..task_id..'DirectDo']=function (npc,player)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=task_state_data[s];
	local n=task_data[b];
	if k and n then
		if d == const.TSACED then
			if 1== player:sub_vcoin(get_direct_comp_price(player)) then
				player:set_param(const.PP_RICHANG_LV,3);
				player:set_task_state(task_id,task.util.ts(b,const.TSCOMP));
				player:push_task_data(task_id,0);
				return task.util.task_done(npc,player,task_id,task_state_data,task_data);
			else
				player:alert(1,1,"元宝不足"..get_direct_comp_price(player).."个,无法直接完成");
				return 100;
			end
		else
			player:alert(1,1,"不在已接受任务状态");
			return 100;
		end
	else
		player:alert(1,1,"没有任务数据");
		return 100;
	end
	return 100;
end
_M['onTalkT'..task_id..'Go']=function (npc,player)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=task_state_data[s];
	local n=task_data[b];
	if d == const.TSACED then
		posmon.fly(player,n.need_target);
	end
end
