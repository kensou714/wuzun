module(..., package.seeall)
local ACTIONSET_NAME="lucky";
local PANEL_ACTIONSET_NAME="panellucky";

function process_xinqu_lucky(player,actionset,panelid,actionid,data)
	if actionid == "btnOne" then
		xqLuckyChjiang(player);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_xinqu_lucky);

function check_xqbtn_show(player)
	--检测符合新区抽奖 显示界面按钮
	if not is_merge_server() then
		if  server_open_day()  >= 15911 then
			if server_start_day() <= 4 then
				player:set_panel_data("panelminimapfun","btnxqcj","visible","true");
			else
				if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
					player:set_panel_data("panelminimapfun","btnxqcj","visible","true");
				else
					player:set_panel_data("panelminimapfun","btnxqcj","visible","false");
				end
			end
			player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
			player:push_ckpanel_data("minimapfun","panelminimapfun");
		end
	end
end
--login.add_login_listener(check_xqbtn_show);

function xqfreshChoujNum(player)
	if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hefuchoujiang","action","canuse");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hefuchoujiang","action","cantuse");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxqcjs","htmlText","您当前可以抽奖 [ "..util.ppn(player,const.PP_HF_CJ_NUM).." ] 次");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
--login.add_login_listener(freshxqChoujNum);

function xqLuckyChjiang(player)
	--合服幸运抽奖
	if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
		if player:num_bag_black() >= 1 then
			DoXinquChouJiang(player);
			player:set_param(const.PP_HF_CJ_NUM,util.ppn(player,const.PP_HF_CJ_NUM)-1);
			if util.ppn(player,const.PP_HF_CJ_NUM) == 0 then
				if server_start_day() > 4 then
					check_xqbtn_show(player);
				end
			end
		else
			player:alert(11,1,"背包空格不满一格!");
		end
	else
		player:alert(11,1,"您的抽奖次数为0!");
	end
	xqfreshChoujNum(player);
end

function DoXinquChouJiang(player)
	--这里是抽奖的逻辑
	newgui.lucky.xunbao(player)
end