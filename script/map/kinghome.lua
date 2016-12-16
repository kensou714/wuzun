module(..., package.seeall)

function close_show(player)
	player:set_panel_data("panelminimap","minimap","oPanelName","998");
	player:set_panel_data("panelminimap","btnshowavat","visible","true");
	player:set_panel_data("panelminimap","btnhideavat","visible","false");
	player:push_ckpanel_data("minimap","panelminimap");
end

function open_show(player)
	player:set_panel_data("panelminimap","minimap","oPanelName","999");
	player:set_panel_data("panelminimap","btnhideavat","visible","true");
	player:set_panel_data("panelminimap","btnshowavat","visible","false");
	player:push_ckpanel_data("minimap","panelminimap");
end

function onPlayerEnter(map,player)
	if server.get_war_state() == 1 then
		if player:get_level() >= 50 then
			player:set_status(14,5400,10000,15,11);
		end
		go.rand(player);
		
	end
	close_show(player);
	player:alert(110,1,"攻城期间,为提高游戏流畅度,主动为您隐藏翅膀!<br>如需显示,请设置小地图[隐/显]开关!");
end

function onPlayerLeave(map,player)
	player:set_status(14,0,0,60,11);
	--open_show(player);
end

function onTimer1(map)
	local kg = map:find_hold_guild();
	if kg ~= "" and kg ~= server.get_king_guild() then
		server.set_king_guild(kg);
		server.info(10000,0,"王城的皇宫已经被 "..kg.." 行会占领了,"..kg.." 成为新一代王城霸主。");
	end
	if server.get_war_state() > 0 then
		map:set_timer(1,3000);
	end
end

function onTimer2(map)
	local num = map:num_monster();
	server.info(10010,0,"王城怪物攻城还剩余" .. num .. "只怪物");
	if( num > 10 ) then
		map:set_timer(2,60000);
	end
end


function onTimer3(map)
	if server.get_war_state() > 0 then
		server.info(10000,0,"王城攻城战正在火热进行中,请玩家到传送员那进入王城参加攻城战");
		map:set_timer(3,600000);
	end
end