module(..., package.seeall)

function onPlayerEnter(map,player)
	if tonumber(weekday()) ~= 1 then
		return;
	end
	if server.get_temp_var("ldzdzopen") ~= "1" then
		return;
	end
	player:set_timer(22,1000);
	local second = os.time() - util.svn("server_ld_timer");
	local minute = math.ceil(second/60);
	local s = minute*60-second;
	local timestring = ""..(60-minute).."分"..s.."秒";

	local timestring2 = "00:00";
	if util.svn("ownertime") > 0 then
		local second2 = os.time() - util.svn("ownertime");
		local minute2 = math.floor(second2/60);
		local s2 = second2-minute2*60;
		timestring2 = ""..minute2.."分"..s2.."秒";
	end

	local curguild = server.get_var("curldowner");
	if curguild == "" then
		curguild = "尚无占领行会";
	end
	player:set_panel_data("panelldtime","panelldtime","panel_visible","true");
	player:set_panel_data("panelldtime","tpoint","htmlText",timestring);
	player:set_panel_data("panelldtime","rpoint","htmlText",curguild);
	player:set_panel_data("panelldtime","bpoint","htmlText",timestring2);
	player:push_ckpanel_data("ldtime","panelldtime");
end

function onPlayerLeave(map,player)
	if tonumber(weekday()) ~= 1 then
		return;
	end
	if server.get_temp_var("ldzdzopen") ~= "1" then
		return;
	end
	player:set_timer(22,0);
	player:set_panel_data("panelldtime","panelldtime","panel_visible","false");
	player:push_ckpanel_data("ldtime","panelldtime");
end