module(..., package.seeall)

function onTalk100(npc,player)
	local jy = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*624.27);
	npc:echo([[--------------------------------------
活动名称: <font color="#FFFF00">武林争霸</font>
--------------------------------------
活动时间:
<font color="#FFFF00">13:00-13:10</font>为报名时间(禁止PK)
<font color="#FFFF00">13:10-14:00</font>为比赛时间(自由PK)
--------------------------------------
参与奖励: 
<font color="#FF0000">活动开始,大厅所有人获得大量经验和荣誉</font>
--------------------------------------
活动规则
<font color="#FFaa00">武林争霸大厅内自由PK,死亡不掉装备</font>
<font color="#FFaa00">当争霸大厅只剩1人时则成为武林盟主</font>
--------------------------------------
点击进入: <a href="event:talk_gos">立刻进入武林争霸大厅</a>
--------------------------------------
盟主特权
<font color="#C0FF3E">专用封号: <font color='#FF00FF'>★武林盟主★</font>
荣誉增加: <font color='#FF00ff'>10000点</font>
属性提升: 攻击+300 魔法+300 道术+300
多倍经验: 杀怪经验1.5倍
经验增加: ]]..jy..[[</font>
--------------------------------------
]]);
	if "" == server.get_var("wlmz") then
	else
		npc:echo([[本届武林盟主为:<font color="#ff0000">]]..server.get_var("wlmz")..[[</font>
--------------------------------------]]);
	end
end

function onTalkgos(npc,player)
	if server.get_temp_var("wlzb") == "2" then
			player:alert(1,1,"武林争霸活动已经开始,入口已经关闭");
			onTalk100(npc,player);
	else
		if server.get_temp_var("wlzb") == "1" then
			if player:get_level() >= 40 then
			local map = server.find_map("wlzb");
				local x,y;
				x,y=map:gen_rand_position();
				if( x and y )then
					player:enter_map("wlzb",x,y);
				end
				player:alert(1,1,"武林争霸赛将于[13:10]正式开始!请做好准备!")
				server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了武林争霸大厅!");
			else
			player:alert(1,1,"对不起,参与武林争霸活动需要达到40级!");
			onTalk100(npc,player);
			end
		else
			player:alert(1,1,"现在不是报名时间,请到报名时间再来找我吧!");
			onTalk100(npc,player);
		end
	end
end

function wlmzontime(player)
	if player:get_name() == server.get_var("wlmz") then
		server.set_var("wlmz","");
		player:set_status(32,1,1,1,0);
		npc.renwu.fenghao.youxifh(player);
	end
end

function wlzbjiangli(player)
	if player:get_name() == server.get_var("wlmz") then
		server.set_var("wlmz","");
		player:set_status(32,1,1,1,0);
		npc.renwu.fenghao.youxifh(player);
	end
	if player:get_map():get_id() == "wlzb" then
		local jy = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*312.69);
		local ry = math.floor(math.min(80,player:get_level())*62.33);
		player:alert(11,1,"[武林争霸]活动已经开始,获得:");
		player:alert(11,0,"荣誉值增加:<font color='#ff0000'>"..ry.."</font>");
		player:alert(11,0,"经验值增加:<font color='#ff0000'>"..jy.."</font>");
		player:add_exp(jy);
		player:add_honor(ry);
	end
end

function cwlmz(player)
		local map = server.find_map("wlzb");
		if map:num_player() == 1 then
			if player:get_map():get_id() == "wlzb" then
				if util.ppn(player,const.PP_WLZBRY) ~= today() then
					player:set_param(const.PP_WLZBRY,today());
					server.set_var("wlmz",player:get_name());
					player:add_honor(10000);
					player:alert(10,1,"荣誉增加: <font color='#FF00ff'>10000点</font>")
					npc.renwu.fenghao.youxifh(player);
					server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成为新一任的武林盟主!获得荣誉值10000点,属性提升300点,杀怪经验1.5倍!");
					server.info(10000,0,"恭喜["..player:get_name().."]成为新一任的武林盟主!获得荣誉值10000点,属性提升300点,杀怪经验1.5倍!");
				else
				player:alert(11,1,"一天只可成为一次武林盟主哦!")
				end
			end
		else
			player:alert(11,1,"很抱歉,本场武林争霸没有决出武林盟主,请明日再来吧!");
		end
		player:set_timer(6,1000);
end