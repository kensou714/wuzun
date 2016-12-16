module(..., package.seeall)
local item_name="女儿红";
local jiulist={
	[0]="当前未饮酒",
	"女儿红",
	"女儿红(5年)",
	"女儿红(10年)",
	"女儿红(20年)",
}
function open(player)
	return doopen(player,1);
end
function doopen(player,jiuid)
	item.jiu.check_jiu_day(player);
	local jt = util.ppn(player,const.PP_JIUTYPE);
	local add_exp = get_exp(player,1,1);
	if jt ~= 0 and jt ~= jiuid then
		player:echo([[您当前已经有醉酒状态,具体信息如下:

当前饮酒类型:[<font color='#FFaa00'>]]..jiulist[jt]..[[</font>]
剩余醉酒时间:[<font color='#FFaa00'>]]..util.ppn(player,const.PP_JIULI)..[[秒</font>]
每10秒可增加:[<s='r'>]].. add_exp .. [[</s>]经验

今日还可饮酒:[<s='r'>]]..const.JIU_MAX_NUM-util.ppn(player,const.PP_JIU_NUM)..[[</s>]瓶

您是否要饮用:[<font color='#FFaa00'>]]..jiulist[jiuid]..[[</font>],这将会覆盖现有的醉酒状态.确认继续?

<font color='#FF0000'>请注意:醉酒需在土城安全区才可获得经验</font>

              <a href='event:talk_commitjiu'>我要饮用[]]..jiulist[jiuid]..[[]</a>

              <a href='event:local_exit'>我还是先不饮用了!</a>]]);
	show_merge(player,player);
		return 0;
	end
	player:echo([[您当前的醉酒状态具体信息如下:

当前饮酒类型:[<font color='#FFaa00'>]]..jiulist[jt]..[[</font>]
剩余醉酒时间:[<font color='#FFaa00'>]]..util.ppn(player,const.PP_JIULI)..[[秒</font>]

今日还可饮酒:[<s='r'>]]..const.JIU_MAX_NUM-util.ppn(player,const.PP_JIU_NUM)..[[</s>]瓶

饮用[<font color='#FFaa00'>]]..jiulist[jiuid]..[[</font>]将增加醉酒[<font color='#FFaa00'>300</font>]秒!

您要现在就饮用[<font color='#FFaa00'>]]..jiulist[jiuid]..[[</font>]吗?

<font color='#FF0000'>请注意:醉酒需在土城安全区才可获得经验</font>

              <a href='event:talk_commitjiu'>我要饮用[]]..jiulist[jiuid]..[[]</a>

              <a href='event:local_exit'>我还是先不饮用了!</a>]]);
	show_merge(player,player);
	return 0;
	--return item.jiu["jiu"..jiuid](player);
end
function onTalkcommitjiu(player)
	local num = player:num_item(item_name);
	if num > 0 then
		if 0 ~= item.jiu.jiu1(player) then
			player:remove_item(item_name,1);
		end
	end
end
function show_merge(npc,player)
	npc:echo("\n\n<s='e'>请选择您想要合成的酒:</s>\n<a href='event:talk_merge2'>女儿红(5年)</a> :需要<font color='#FFff00'>女儿红*5</font>       [<font color='#FF0000'>2倍</font>]\n");
	npc:echo("<a href='event:talk_merge2'>女儿红(10年)</a>:需要<font color='#FFff00'>女儿红(5年)*5</font>  [<font color='#FF0000'>4倍</font>]\n");
	npc:echo("<a href='event:talk_merge2'>女儿红(20年)</a>:需要<font color='#FFff00'>女儿红(10年)*5</font> [<font color='#FF0000'>8倍</font>]\n<font color='#FFaa00'>请注意:合成需要缴纳[5万金币]的费用!</font>");
end
function onTalkmerge2(player)
	player:alert(1,1,"打开[熔炉]可以合成您所需要的酒!");
	item.item10078.open(player);
end


function get_exp(player,mul,st)
	local jtype=util.ppn(player,const.PP_JIUTYPE);
	local pdjy= math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*0.1272);
	if jtype == 1 then
		return (mul*st*1*pdjy);
	end
	if jtype == 2 then
		return (mul*st*2*pdjy);
	end
	if jtype == 3 then
		return (mul*st*4*pdjy);
	end
	if jtype == 4 then
		return (mul*st*8*pdjy);
	end
	return 0;
end