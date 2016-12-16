module(..., package.seeall)

function onPlayerEnter(map,player)
	if server.get_kuafu_state() == 1 then
		player:set_timer(23,1000);
		--设置战场信息
		local totalsj = 60;
		if util.stvn("kuafuzhan") == 1 then
			local setsj = util.stvn("kuafuzhansj");
			if setsj > 0 then
				totalsj = setsj;
			end
		end
		local second = os.time() - util.svn("server_kuafu_timer");
		local minute = math.ceil(second/60);
		local s = minute*60-second;
		local timestring = ""..(totalsj-minute).."分"..s.."秒";

		local timestring2 = "00:00";
		if util.svn("kuafuownertime") > 0 then
			local second2 = os.time() - util.svn("kuafuownertime");
			local minute2 = math.floor(second2/60);
			local s2 = second2-minute2*60;
			timestring2 = ""..minute2.."分"..s2.."秒";
		end

		local curguild = server.get_var("kuafuowner");
		if curguild == "" then
			curguild = "尚无占领行会";
		end
		player:set_panel_data("panelkuafutime","panelkuafutime","panel_visible","true");
		player:set_panel_data("panelkuafutime","tpoint","htmlText",timestring);
		player:set_panel_data("panelkuafutime","rpoint","htmlText",curguild);
		player:set_panel_data("panelkuafutime","bpoint","htmlText",timestring2);
		player:push_ckpanel_data("kuafutime","panelkuafutime");
	end
	--隐藏翅膀和法宝
	player:set_panel_data("panelminimap","btnhideavat","visible","false");
	player:set_panel_data("panelminimap","btnshowavat","visible","true");
	player:set_panel_data("panelminimap","minimap","oPanelName","998");
	player:push_ckpanel_data("minimap","panelminimap");
end

function onPlayerLeave(map,player)
	newgui.lingdi.kuafustop(player);
end

function onTimer1(map)
	local area,kg = map:find_hold_kuafu_guild();
	if area ~= "" or kg ~= "" then
		if kg ~= server.get_stronger_kuafu_guild() or area ~= server.get_stronger_kuafu_area() then
			server.set_var("kuafuowner",area.."-"..kg);
			server.set_var("kuafuownertime",tostring(os.time()));
			server.set_stronger_kuafu_guild(kg);
			server.set_stronger_kuafu_area(area);
			server.info(10000,0,"跨服战内城占领者 "..area.."区行会"..kg);
		end
	end
	if server.get_kuafu_state() > 0 then
		map:set_timer(1,3000);
	end
end