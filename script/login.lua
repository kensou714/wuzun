module(..., package.seeall)
local first_login_data={};
function add_first_login_listener(fun)
	first_login_data[fun] = fun;
end
function first_login(player)
	for i,v in pairs(first_login_data) do
		v(player);
	end
end
--------------------------------------------------------------------
local everyday_login_data={};
function add_everyday_login_listener(fun) everyday_login_data[fun] = fun; end;
function everyday_first_login(player) for i,v in pairs(everyday_login_data) do v(player); end; end;
--------------------------------------------------------------------
function load_player(player)
end
--------------------------------------------------------------------
local login_data={};
function add_login_listener(fun)
	login_data[fun] = fun;
end
function enter_game(player)
	for i,v in pairs(login_data) do
		v(player);
	end
	cklevel.triger_level(player,player:get_level());
end
--------------------------------------------------------------------
local logout_data={};
function add_logout_listener(fun)
	logout_data[fun] = fun;
end
function leave_game(player)
	for i,v in pairs(logout_data) do
		v(player);
	end
end
--------------------------------------------------------------------
function unload_player(player)
end

function process_first_login(player)
	player:set_free_direct_fly(200);
end
add_first_login_listener(process_first_login);
function push_task_info(player)
	player:set_task_state(1,1);
	player:push_panel_info(100,"");
end
add_first_login_listener(push_task_info);

function process_start_game(player,actionset,panel,actionid)
	if actionid == "btnLoginGo" then
		posnpc.go(player,"云天河");
		player:set_panel_data("panelloginprompt","panelloginprompt","panel_visible","false");
		player:push_ckpanel_data("loginprompt","panelloginprompt");
		return;
	end
	if actionid == "btnLoginExitGo" then
		posnpc.go(player,"云天河");
		player:set_panel_data("panelloginprompt","panelloginprompt","panel_visible","false");
		player:push_ckpanel_data("loginprompt","panelloginprompt");
		return;
	end
end
ckpanel.add_listener("loginprompt",process_start_game);

--处理面板的初始化信息
function fresh_panel_init_info(player)
	newgui.property.fresh_rein_info(player);
	lottery.fresh_lottery_info(player);
	newgui.fuse.pushFilterInfo(player);
	--vcoingift.fresh_vcoingift_info(player);
	newgui.property.fresh_zhuansheng_info(player);
	newgui.theworldcup.refresh_worldcup_panel(player);
	if player:skill_level(614) == 0 then
		shortcut.show(player,1,1,1);
	end
	newgui.shenqi.fresh_preview_sqinfo(player,util.ppn(player,const.PP_SHENQI_JIELV)+1);

	if server_open_day() >= 16171 then
		if util.ppn(player,const.SEVEN_DAY_ACTIVITY_MSGY) ==1 then
			player:set_panel_data("panelshowpost","btnpost","visible","true");
			player:push_ckpanel_data("showpost","panelshowpost");
		end
		if util.ppn(player,const.SEVEN_DAY_ACTIVITY_FHLP) == 1 then
			player:set_panel_data("panelshowproperty","btnDHlpai","visible","true");
			player:push_ckpanel_data("showproperty","panelshowproperty");
		end
	else
		player:set_panel_data("panelshowpost","btnpost","visible","true");
		player:push_ckpanel_data("showpost","panelshowpost");
		player:set_panel_data("panelshowproperty","btnDHlpai","visible","true");
		player:push_ckpanel_data("showproperty","panelshowproperty");
	end

	--if not is_merge_server() then  
		--player:set_panel_data("panelminimapfun","btnNewhefu","visible","false");
	--else
		--player:set_panel_data("panelminimapfun","btnNewhefu","visible","true");
	--end
	--player:push_ckpanel_data("minimapfun","panelminimapfun");

end
add_login_listener(fresh_panel_init_info);
--每日赠送玩家免费转生次数
function process_everyday_add_zhuanshen(player)
	if player:get_free_rein_times() < 3 then
		player:set_free_rein_times(3);
	end
end
add_everyday_login_listener(process_everyday_add_zhuanshen);

--刷新一些状态
function process_leijiXiuFu(player)
	if util.ppn(player,const.PP_LEIJI_LOGIN_CHECK) == 0 then
		player:set_param(const.PP_LEIJI_LOGIN_CHECK,1);
		local day = util.ppn(player,const.PP_QIANDAO_DAY_NUM);
		player:set_param(const.PP_ACHIEVE_LOGINDAYS,math.max(day,1));
		player:set_param(const.PP_LAST_LOGINDAY,today());
		leijiLoginDays(player);
	end
end
add_login_listener(process_leijiXiuFu);

function process_everyday_fresh(player)
	if util.ppn(player,const.PP_LAST_LOGINDAY) == today()-1 then
		player:set_param(const.PP_ACHIEVE_LOGINDAYS,util.ppn(player,const.PP_ACHIEVE_LOGINDAYS)+1);
	else
		player:set_param(const.PP_ACHIEVE_LOGINDAYS,1);
	end
	player:set_param(const.PP_LAST_LOGINDAY,today());
	leijiLoginDays(player);
	--if  util.ppn(player,const.PP_JUDGE_LEIJI_LOGINDAYS) == 0 then
		--player:set_param(const.PP_LEIJI_LOGINDAYS,util.ppn(player,const.PP_LEIJI_LOGINDAYS)+1);
	--end
	--player:set_param(const.PP_JUDGE_LEIJI_LOGINDAYS,1);
end
add_everyday_login_listener(process_everyday_fresh);

function leijiLoginDays(player)
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 10 and util.ppn(player,const.PP_ACHIEVE_LOGIN10) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN10,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 9 and util.ppn(player,const.PP_ACHIEVE_LOGIN9) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN9,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 8 and util.ppn(player,const.PP_ACHIEVE_LOGIN8) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN8,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 7 and util.ppn(player,const.PP_ACHIEVE_LOGIN7) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN7,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 6 and util.ppn(player,const.PP_ACHIEVE_LOGIN6) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN6,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 5 and util.ppn(player,const.PP_ACHIEVE_LOGIN5) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN5,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 4 and util.ppn(player,const.PP_ACHIEVE_LOGIN4) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN4,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 3 and util.ppn(player,const.PP_ACHIEVE_LOGIN3) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN3,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 2 and util.ppn(player,const.PP_ACHIEVE_LOGIN2) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN2,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
	if util.ppn(player,const.PP_ACHIEVE_LOGINDAYS) >= 1 and util.ppn(player,const.PP_ACHIEVE_LOGIN1) == 0 then
		player:set_param(const.PP_ACHIEVE_LOGIN1,10);
		newgui.achieve.fresh_achieve_title(player,7);
	end
end