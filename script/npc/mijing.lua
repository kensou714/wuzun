module(..., package.seeall)
local data={
	{need_lv=40,  map_name="mijing40";};
	{need_lv=50,  map_name="mijing50";};
	{need_lv=60,  map_name="mijing60";};
	{need_lv=70,  map_name="mijing70";};
	{need_lv=80,  map_name="mijing80";};
	{need_lv=90,  map_name="mijing90";};
	{need_lv=100, map_name="mijing100";};
};
function onTalk100(npc,player)
	check_mijing_day(player);
	npc:echo([[--------------------------------------
地图名称: <font color="#FFFF00">练级场</font>(挂机地图)
--------------------------------------
地图说明: <font color="#FFaa00">禁止PK,死亡后不掉任何装备</font>
--------------------------------------
地图分配: <font color="#FFaa00">根据等级分配到对应的练级场</font>
--------------------------------------
需要等级: <font color="#FFaa00">进入练级场需要达到[<font color="#FF0000">40</font>]级</font>
--------------------------------------
剩余时间: <font color="#FFaa00">您今天的修炼时间还剩<font color="#FF0000">]]..(const.MIJING_MAX_NUM-util.ppn(player,const.PP_MIJING_NUM))..[[</font>分钟</font>
--------------------------------------
普通玩家: <font color="#FFaa00">每天系统赠送修炼时间480分钟</font>
--------------------------------------
会员玩家: <font color="#FFff00">每天系统赠送修炼时间<font color="#FF0000">24小时</font>!</font>
--------------------------------------
点击进入: <a href="event:talk_entermijing">进入练级场开始修炼</a>
--------------------------------------]]);
end
function onTalkentermijing(npc,player)
	local mn = "";
	for i=1,#data do
		if data[i].need_lv <= player:get_level() then
			mn= data[i].map_name;
		end
	end
	if mn ~= "" then
		if const.MIJING_MAX_NUM > util.ppn(player,const.PP_MIJING_NUM) then
			player:enter_map(mn,300,300);
		else
			player:alert(1,1,"您今天的修炼时间不足,无法进入练级场!");
			onTalk100(npc,player);
		end
	end
	player:alert(1,1,"您的修炼时间还剩:"..const.MIJING_MAX_NUM - util.ppn(player,const.PP_MIJING_NUM)+1 .."分钟");
end
function check_mijing_day(player)
	if util.ppn(player,const.PP_MIJING_DAY) ~= today() then
		player:set_param(const.PP_MIJING_DAY,today());
		player:set_param(const.PP_MIJING_NUM,0);
		if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_MIJING_NUM,util.ppn(player,const.PP_MIJING_NUM)-960); end;
	end
end