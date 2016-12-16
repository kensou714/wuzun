module(..., package.seeall)
local ACTIONSET_NAME="svip";
local PANEL_ACTIONSET_NAME="panelsvip";

function process_svip(player,actionset,panelid,actionid,data)
	if actionid == "btnSVIP" then
		fresh_panel(player);return;
	end
	if actionid == "btnReceive" then
		receive(player);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_svip);

function receive(player)
	local num = util.ppn(player,const.PP_SVIP_STATUS);
	if num == 0 then
		player:alert(11,1,"您还未成为超级会员,无法领取!");
		return;
	end
	if num == 2 then
		player:alert(11,1,"您已领取专属奖励!");
		return;
	end
	if num == 1 then
		if player:num_bag_black() >= 1 then
			player:add_item("VIP礼包",1);
			player:alert(11,1,"成功领取VIP礼包!");
			player:set_param(const.PP_SVIP_STATUS,2);
		else
			player:alert(1,1,"您的背包空格不足1格,无法领取!")
		end
	end
end

function fresh_panel(player)
	if util.ppn(player,const.PP_SVIP_STATUS) ~= 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mcPic","visible","true");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mcQQ","visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function cz_fresh_data(player,add)
	if util.ppn(player,const.PP_SVIP_STATUS) == 0 then
		if add >= 200000 or util.ppn(player,const.PP_QIANDAO_CZ_TAG) >= 300000 then
			player:set_param(const.PP_SVIP_STATUS,1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mcPic","visible","true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mcQQ","visible","true");
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	end
end