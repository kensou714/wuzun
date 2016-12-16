module(..., package.seeall)

local ACTIONSET_NAME="xjday";
local PANEL_ACTIONSET_NAME="panelxjday";

function process_xuanj_day(player,actionset,panelid,actionid)
	if actionid == "btnXjDay" then
		if not activity.isNewYearOpen() then player:alert(1,1,"当前不在活动时间!"); return; end
		if util.ppn(player,const.PP_CONGZI_DAY) == today() then
			if util.ppn(player,const.PP_DAILY_XUANJ) ~= today() then
				if util.ppn(player,const.PP_DAILY_CONGZI) >= 10000 then
					player:set_param(const.PP_DAILY_XUANJ,today());
					player:add_item_log("四级攻击玄晶",246,1);
					player:add_item_log("四级物防玄晶",246,1);
					player:add_item_log("四级魔防玄晶",246,1);
					player:add_item_log("四级生命玄晶",246,1);
						
					player:alert(1,1,"恭喜您成功领取今日玄晶礼包到玄晶界面!");
					fresh_xjday_btn(player);
				else
					player:alert(1,1,"您今日的充值不足10000元宝!");return;
				end
			end
		else
			player:alert(1,1,"对不起,您今天尚未充值!");
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_xuanj_day);

function fresh_xjday_btn(player)
	if activity.isNewYearOpen() then
		if util.ppn(player,const.PP_DAILY_XUANJ) == today() then
			player:set_panel_data("panelminimapfun","btnXjLb","visible","false");
			player:set_panel_data("panelminimapfun","btnHBox","visible","true");

			player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","false");
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		else
			if ymd() == 20140209 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"xjfday","bgid","4309");
			end
			if ymd() == 20140210 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"xjfday","bgid","4308");
			end
			if ymd() == 20140211 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"xjfday","bgid","4307");
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	else
		player:set_panel_data("panelminimapfun","btnXjLb","visible","false");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	end
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end