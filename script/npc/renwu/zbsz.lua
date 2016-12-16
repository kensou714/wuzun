module(..., package.seeall)

function onTalk100(npc,player)
	local map = server.find_map("wlzb");
	local jy = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*624.27);
	npc:echo([[--------------------------------------
   <font color="#ffff00">武林争霸,谁与争锋</font>
--------------------------------------
<font color="#ccbb77">盟主特权:</font>
--------------------------------------
<font color="#C0FF3E">专用封号: <font color='#FF00FF'>★武林盟主★</font></font>
<font color="#C0FF3E">荣誉增加: <font color='#FF00ff'>10000点</font></font>
<font color="#C0FF3E">属性提升: 攻击+300 魔法+300 道术+300</font>
<font color="#C0FF3E">多倍经验: 杀怪经验1.5倍</font>
--------------------------------------
<font color="#C0FF3E">经验增加: ]]..jy..[[</font>
--------------------------------------
当前武林争霸大厅共有 <font color="#ff0000">]]..map:num_player()..[[</font> 名玩家
--------------------------------------
<font color="#CD00CD">只需要打败所有玩家,即可成为武林盟主!</font>
--------------------------------------]]);
	if server.get_temp_var("wlzb") == "2" then
		npc:echo([[
       <a href='event:talk_cwwlmz'>领取武林盟主封号</a>      <a href='event:talk_lqwljl'>领行会奖励并回城</a>
--------------------------------------]]);
	else
		npc:echo([[ 
<font color='#ffaa00'>比赛时间内才可领取[武林盟主]称号!</font>
--------------------------------------
<font color='#ff00ff'>武林争霸活动将于13点10分正式开始!</font>
--------------------------------------]]);
	end
end


function onTalklqwljl(n,player)
	if server.get_temp_var("wlzb") == "2" and player:get_map():get_id() == "wlzb" then
		local map = server.find_map("wlzb");
		local kg = map:find_hold_guild();
		if player:get_guild() ~= "" then
			if kg ~= "" then
				if map:num_player() >= 2 then
					local jy = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*624.27);
					player:alert(11,1,"成功领取武林行会奖励,获得:");
					player:alert(11,0,"经验值增加:<font color='#ff0000'>"..jy.."</font>");
					server.info(100,1,"[<font color='#FF0000'>"..player:get_name().."</font>]在争霸使者领取武林争霸奖励!");
					player:add_exp(jy);
					player:go_home();
				else
				player:alert(11,1,"地图里没人了!!你不想成为武林盟主吗?")
				end
			else
				player:alert(11,1,"先把其他行会的勇士全都打败了再来吧!")
			end
		else
			player:alert(1,1,"你都没有加入行会!怎么领取?");
		end
	else
		player:alert(1,1,"非比赛时间,无法领取武林争霸行会奖励!");
	end
end


function onTalkcwwlmz(n,player)
	if server.get_temp_var("wlzb") == "2" then
		local map = server.find_map("wlzb");
		if map:num_player() == 1 then
			if util.ppn(player,const.PP_WLZBRY) ~= today() then
				local jy = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*624.27);
				player:set_param(const.PP_WLZBRY,today());
				player:alert(11,1,"经验值增加: <font color='#ff0000'>"..jy.."</font>");
				player:add_exp(jy);
				server.set_temp_var("wlzb",0);
				server.set_var("wlmz",player:get_name());
				player:add_honor(10000);
				player:alert(11,0,"荣誉值增加: <font color='#FF00ff'>10000点</font>");
				npc.renwu.fenghao.youxifh(player);
				server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成为新一任的武林盟主!获得荣誉值10000点,属性提升300点,杀怪经验1.5倍!");
				server.info(10000,0,"恭喜["..player:get_name().."]成为新一任的武林盟主!获得荣誉值10000点,属性提升300点,杀怪经验1.5倍!");
			else
				player:alert(11,1,"一天只可成为一次武林盟主哦!")
			end
			player:go_home();
		else
			player:alert(1,1,"这里还有其他人?你赶紧检查下,小心他把你给偷袭了!!!");
		end
	else
		player:alert(1,1,"非比赛时间,无法获得武林盟主封号!");
	end
end

