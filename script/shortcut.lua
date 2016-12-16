module(..., package.seeall)
--底部message图标
local ACTIONSET_NAME="shortcut";
local PANEL_ACTIONSET_NAME="panelshortcut";

local btn_table={"btnTiao","btnMan","btnJiao","btnShou","btnYao","btnZu"};
local eff_table={"effTiao","effMan","effJiao","effShou","effYao","effZu"};
--1：腾跃术

function show(player,index,flag,eff)
	if flag>0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,btn_table[index],"visible","true");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,btn_table[index],"visible","false");
	end
	if flag>0 and eff>0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,eff_table[index],"visible","true");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,eff_table[index],"visible","false");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hbmsglist","visible","true");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function  freshqinggong(player)
	if player:get_level() >= 50 and player:skill_level(614) == 0 then
		show(player,1,0,0);return;
	end
end
login.add_login_listener(freshqinggong);
function process_message(player,actionset,panelid,actionid)
	if actionid == "btnTiao" then
		if player:get_level() >= 50 and player:skill_level(614) == 0 then
			show(player,1,0,0);
			player:add_skill(614);
			player:alert(11,1,"成功领悟新技能:<font color='#ff0000'>轻功</font>");
		else
			if player:skill_level(614) == 1 then
				show(player,1,0,0);return;
			end
			player:alert(11,1,"等级达到50级将领悟新技能[轻功]");
			return;
		end
	end
	if actionid == "btnPet" then
		newgui.pet.open_pet_panel(player);
	end
	if actionid == "btnbladesoul" then
		if util.ppn(player,const.PP_SHENQI_JIELV) >= 5 then
			newgui.bladesoul.open_sword_panel(player);
		else
			player:alert(11,1,"法宝等级达到5阶后开启剑灵系统!");return;
		end	
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_message);
