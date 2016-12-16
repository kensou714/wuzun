module(..., package.seeall)
local ACTIONSET_NAME="vip";
local PANEL_ACTIONSET_NAME="panelvip";

function process_vip(player,actionset,panelid,actionid,data)
	if actionid == "btnBuyVip" then
		buyVipFuc(player);return;
	end
	if actionid == "btnVipCZ" then
		player:open_panel(122);return;
	end
	if actionid == "btnVipMRFL" then
		player:script_exe_code("newgui.self.processVipMRFL");
	end
	if actionid == "btnVipDTCS" then
		player:script_exe_code("newgui.self.processVipDTCS");
	end
	if actionid == "btnVipHYSD" then
		player:script_exe_code("newgui.self.processVipHYSD");
	end
	if actionid == "btnVipSSCK" then
		player:script_exe_code("newgui.self.processVipSSCK");
	end
	if actionid == "btnVipHHZT" then
		player:script_exe_code("newgui.self.processVipHHZT");
	end
	if actionid == "btnVipYJMC" then
		player:script_exe_code("newgui.self.processVipYJMC");
	end
	if actionid == "btnVipYJXL" then
		player:script_exe_code("newgui.self.processVipYJXL");
	end
	if actionid == "btnVipOthers" then
		--player:script_exe_code("newgui.self.processVipOthers");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_vip);

function buyVipFuc(player)
	if player:get_vcoin() >= 4500 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin(4500,"huiyuan");
			player:add_item("VIP会员(30天)",1);
			player:alert(11,1,"成功购买[VIP会员(30天)]");
		else
			player:alert(1,1,"您的背包空格不足1格.无法购买!")
		end
	else
		player:alert(11,1,"您的元宝不足[4500],无法购买!");
	end
end