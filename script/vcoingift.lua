module(..., package.seeall)
--首充大礼面板
local ACTIONSET_NAME="vcoingift";
local PANEL_ACTIONSET_NAME="panelVcoinGift";

local vg_item={
["warrior"]={{10127,1,1},{21000,1,1},{15007,1,1},{10130,1,1},{10129,1,1},{10128,1,1},{15015,1,1}},
["wizard"]={{10127,1,1},{21001,1,1},{15007,1,1},{10130,1,1},{10129,1,1},{10128,1,1},{15015,1,1}},
["taoist"]={{10127,1,1},{21002,1,1},{15007,1,1},{10130,1,1},{10129,1,1},{10128,1,1},{15015,1,1}}
};

--这里设置首充大礼面板显示的物品信息（7个）

function fresh_vcoingift_info(player)
	if util.ppn(player,const.PP_SCCZLB) == 0 then
		show_button(player,1);
	end
	for i=1,#vg_item[player:get_job_name()] do
		player:push_item_info(vg_item[player:get_job_name()][i][1]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"vgift"..i,"num",""..vg_item[player:get_job_name()][i][2]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"vgift"..i,"typeid",vg_item[player:get_job_name()][i][1]);
		
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function show_button(player,flag)
	if flag>0 then
		player:set_panel_data("panelminimapfun","btnVcoinGift","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnVcoinGift","visible","false");
	end
	player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end

function show_panel(player,flag)
	if flag>0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelVcoinGift","panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelVcoinGift","panel_visible","false");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function process_vcoingift(player,actionset,panelid,actionid)
	if actionid=="btnVcoinGift" then
		player:set_panel_data("panelminimapfun","effVcoinGift","visible","false");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");

		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelVcoinGift","panel_visible","revert");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		return;
	end
	if actionid == "btnGoVcoin" then
		player:open_panel(122);
		return;
	end
	if actionid=="btnGetGift" then
		if util.ppn(player,const.PP_SCCZLB) == 0 then
		local x={["warrior"]="天之屠龙刀",["wizard"]="天之魔魂杖",["taoist"]="天之玄天剑"};
			if player:get_vcoin_accu()>0 then
				if player:num_bag_black() >= 8 then
					player:set_param(const.PP_SCCZLB,1);
					for i=1,#vg_item[player:get_job_name()] do
						player:add_item_log(vg_item[player:get_job_name()][i][1],209,vg_item[player:get_job_name()][i][2],vg_item[player:get_job_name()][i][3]);
					end
					show_panel(player,0);
					show_button(player,0);
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]领取首次充值礼包!");
					player:alert(11,1,"恭喜您成功领取[首次充值礼包]<br>四倍宝典        数量:1<br>玛雅令牌        数量:1<br>天璇仙魄(70级)  数量:1<br>"..x[player:get_job_name()].."      数量:1<br>聚灵珠(小)      数量:1<br>首充元宝(2000)  数量:1<br>首充金条(100万) 数量:1");
				else
					player:alert(1,1,"您的背包不足8格,您也不想这些好东西都掉下地吧!");
				end
			else
				player:alert(11,1,"您尚未充值,无法领取");
			end
			return;
		else
		player:alert(1,1,"对不起,您已经领取过首次充值礼包!");
		show_panel(player,0);
		show_button(player,0);
		end
	end
	return;
end
ckpanel.add_listener(ACTIONSET_NAME,process_vcoingift);