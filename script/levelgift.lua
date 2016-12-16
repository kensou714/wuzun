module(..., package.seeall)
--升级奖励面板
local ACTIONSET_NAME="levelgift";
local PANEL_ACTIONSET_NAME="panelLevelGift";

local gift_table = {
	[0] = {{20001,1,1},{20002,2,1},{20003,1,1},{20001,1,1}},
	[10] = {{30001,1,1},{30002,1,1},{30003,1,1},{30004,1,1},{30005,2,1}},
};
--设置升级奖励物品信息,0对应10级礼包,以此类推,最多设5个奖励物品

function fresh_levelgift_info(player)
	for i=1,5 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lgift"..i,"visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"giftinfo","text","");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
	local nowGift=util.ppn(player,const.PP_HELP_LEVELGIFT);
	if gift_table[nowGift] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"giftinfo","htmlText",""..(nowGift+10).."级可以领取");
		if player:get_level()>=nowGift+10 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"giftinfo","color","0x00FF00");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"giftinfo","color","0xFF0000");
		end
		for i=1,#gift_table[nowGift] do
			player:push_item_info(gift_table[nowGift][i][1]);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lgift"..i,"visible","true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lgift"..i,"num",gift_table[nowGift][i][2]);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lgift"..i,"typeid",gift_table[nowGift][i][1]);
		end
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		show_panel(player,0);
		show_button(player,0);
	end
end

function show_button(player,flag)
	if flag>0 then
		player:set_panel_data("panelminimapfun","btnLevelGift","visible","true");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnLevelGift","visible","false");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	end
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end

function show_panel(player,flag)
	if flag>0 then
		fresh_levelgift_info(player);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelLevelGift","panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelLevelGift","panel_visible","false");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function process_levelgift(player,actionset,panelid,actionid)
	if actionid == "btnLevelGift" then
			fresh_levelgift_info(player);
			player:set_panel_data("panelminimapfun","effLevelGift","visible","false");
			player:set_panel_data("panelminimapfun","btnHBox","visible","true");
			player:push_ckpanel_data(PANEL_ACTIONSET_NAME,"minimapfun","panelminimapfun");
			
			player:set_panel_data(PANEL_ACTIONSET_NAME,"panelLevelGift","panel_visible","revert");
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		return;
	end
	if actionid=="btnGetGift" then
		local nowGift=util.ppn(player,const.PP_HELP_LEVELGIFT);
		if player:get_level()>=nowGift+10 then
			for i=1,#gift_table[nowGift] do
				player:add_item_log(gift_table[nowGift][i][1],204,gift_table[nowGift][i][2],gift_table[nowGift][i][3]);
			end
			player:set_param(const.PP_HELP_LEVELGIFT,nowGift+10);
			fresh_levelgift_info(player);
			player:alert(11,1,"成功领取"..(nowGift+10).."级礼包");
		else
			player:alert(11,1,"您的等级不足"..(nowGift+10).."级,无法领取");
		end
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_levelgift);