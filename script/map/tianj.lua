module(..., package.seeall)

function onPlayerEnter(map,player)
	player:set_status(14,1800,25000,15,11);
	player:set_attack_mode(105);
	player:set_lock_attack_mode(1);
	player:set_timer(20,10000);
	player:set_timer(21,1000);

	local second = os.time() - util.svn("server_tj_timer");
	local minute = math.ceil(second/60);
	local s = minute*60-second;
	local timestring = ""..(20-minute).."分"..s.."秒";
	player:set_panel_data("paneltimer","paneltimer","panel_visible","true");
	player:set_panel_data("paneltimer","tpoint","htmlText",timestring);
	player:set_panel_data("paneltimer","rpoint","htmlText",""..server.get_temp_var("szzy").."分");
	player:set_panel_data("paneltimer","bpoint","htmlText",""..server.get_temp_var("mzzy").."分");
	player:set_panel_data("paneltimer","fpoint","htmlText",server.get_var("smzcpmd1"));
	player:set_panel_data("paneltimer","mpoint","htmlText",""..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)");
	player:push_ckpanel_data("timer","paneltimer");
	local h = os.date("%H%M",os.time());
	if tonumber(h) >= 1430 and tonumber(h) <= 1500 then
		if util.ppn(player,const.PP_COUNT_SHENMOZHANCHANG) ~= hour() then
			player:set_param(const.PP_COUNT_SHENMOZHANCHANG,hour());
			server.log_count(2,activity.ACT_COUNT_SHENMOZHANCHANG,1);
		end
	end
	local h = os.date("%H%M",os.time());
	if tonumber(h) >= 1900 and tonumber(h) <= 1930 then
		if util.ppn(player,const.PP_COUNT_SHENMOZHANCHANG) ~= hour() then
			player:set_param(const.PP_COUNT_SHENMOZHANCHANG,hour());
			server.log_count(2,activity.ACT_COUNT_SHENMOZHANCHANG,1);
		end
	end
end

function onPlayerLeave(map,player)
	player:set_timer(20,0);
	player:set_timer(21,0);
	player:set_status(14,0,0,60,11);
	player:set_team_info(0,"");
	player:set_lock_attack_mode(0);
	player:set_attack_mode(100);
	player:black_board(0,"","");
	player:set_panel_data("paneltimer","paneltimer","panel_visible","false");
	player:push_ckpanel_data("timer","paneltimer");
end