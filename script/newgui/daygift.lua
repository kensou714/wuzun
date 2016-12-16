module(..., package.seeall)

local ACTIONSET_NAME="daygift";
local PANEL_ACTIONSET_NAME="panelDayGift";

local day_item={
	[1]={id=19009,number=1000},
	[2]={id=15007,number=1},
	[3]={id=15037,number=1},
	[4]={id=15044,number=1},
	[5]={id=15047,number=1},
	[6]={id=15015,number=1},
	[7]={id=15028,number=1},
};
--19009 15007 15037 15044  15047  15015  15028
--绑定元宝1000 四倍宝典 坐骑经验丹(大) 魂石令牌(500) 荣誉令牌(10000) 玛雅令牌  招财神符

function fresh_daygift_info(player)
	if util.ppn(player,const.PP_DAILY_GIFT) == 0 then
		show_button(player,1);
	end
	for i=1,#day_item do
		player:push_item_info(day_item[i].id);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"daygift"..i,"typeid",day_item[i].id);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"daygift"..i,"num",day_item[i].number);
		
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function show_button(player,flag)
	if flag>0 then
		player:set_panel_data("panelminimapfun","btnDayGift","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnDayGift","visible","false");
	end
	player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end

function show_panel(player,flag)
	if flag>0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelDayGift","panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelDayGift","panel_visible","false");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function process_daygift(player,actionset,panelid,actionid)
	if panelid == "panelminimapfun" and actionid=="btnDayGift" then
		player:set_panel_data("panelminimapfun","effDayGift","visible","false");
		player:push_ckpanel_data("minimapfun","panelminimapfun");

		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelDayGift","panel_visible","revert");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		return;
	end
	if actionid == "btnDayVcoin" then
		player:open_panel(122);
		return;
	end
	if panelid == "panelDayGift" and actionid=="btnDayGift" then
		if util.ppn(player,const.PP_CONGZI_DAY) == today() then
			if util.ppn(player,const.PP_DAILY_GIFT) == 0 then
				if util.ppn(player,const.PP_DAILY_CONGZI) >= 1000 then
					if player:num_bag_black() >= 6 then
						player:set_param(const.PP_DAILY_GIFT,1);
						show_panel(player,0);
						show_button(player,0);
						for i=1,#day_item do
							player:add_item_log(day_item[i].id,239,day_item[i].number,1);
						end
						server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]领取每日充值礼包!");
						player:alert(11,1,"恭喜您成功领取[每日充值礼包]<br>四倍宝典        数量:1<br>玛雅令牌        数量:1<br>坐骑经验丹(大)  数量:1<br>魂石令牌(500)      数量:1<br>绑定元宝(1000)  数量:1<br>荣誉令牌(10000) 数量:1<br>招财神符    数量:1");
					else
						player:alert(1,1,"您的背包不足6格,您也不想这些好东西都掉下地吧!");
					end	
				else
					player:alert(1,1,"您今日的充值不足1000元宝哦!");
				end
			else
				player:alert(1,1,"对不起,您已经领取过每日充值礼包!");
				show_panel(player,0);
				show_button(player,0);
			end
		else
			player:alert(1,1,"对不起,您今天还未充值呢!");
		end
	end
end
--ckpanel.add_listener(ACTIONSET_NAME,process_daygift);