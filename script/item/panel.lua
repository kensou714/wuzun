module(..., package.seeall)

function zuoqipanel(player)
	player:set_panel_data("panelzuoqi","panelzuoqi","panel_visible","true");	
	player:push_ckpanel_data("zuoqi","panelzuoqi");
	return 0;
end

function lingzhu(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:set_panel_data("panelfuse","guifusetabcontrol","selected","8");
	player:push_ckpanel_data("fuse","panelfuse");
	return 0;
end

function qilingyu(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:set_panel_data("panelfuse","guifusetabcontrol","selected","5");
	player:push_ckpanel_data("fuse","panelfuse");
	return 0;
end

function jinjieshi(player)
	player:set_panel_data("panelshenqi","panelshenqi","panel_visible","true");	
	player:push_ckpanel_data("shenqi","panelshenqi");
	return 0;
end

function stone(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:set_panel_data("panelfuse","guifusetabcontrol","selected","1");
	player:push_ckpanel_data("fuse","panelfuse");
	return 0;
end

function hecheng(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:set_panel_data("panelfuse","guifusetabcontrol","selected","7");
	player:push_ckpanel_data("fuse","panelfuse");
	return 0;
end

function huishou(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:set_panel_data("panelfuse","guifusetabcontrol","selected","6");
	player:push_ckpanel_data("fuse","panelfuse");
end

function jinglian(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:set_panel_data("panelfuse","guifusetabcontrol","selected","2");
	player:push_ckpanel_data("fuse","panelfuse");
end

function zhshshi(player)
	player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
	player:set_panel_data("panelshowproperty","panelselfshowarr","selected","false");
	player:set_panel_data("panelshowproperty","xinfa","selected","false");
	player:set_panel_data("panelshowproperty","zhuansheng","selected","true");
	--player:set_panel_data("panelshowproperty","danyao","selected","false");
	player:push_ckpanel_data("showproperty","panelshowproperty");
	return 0;
end

function openDanYaoPanel(player)
	player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
	player:set_panel_data("panelshowproperty","panelselfshowarr","selected","false");
	player:set_panel_data("panelshowproperty","xinfa","selected","false");
	player:set_panel_data("panelshowproperty","zhuansheng","selected","false");
	player:set_panel_data("panelshowproperty","danyao","selected","true");
	player:push_ckpanel_data("showproperty","panelshowproperty");
end

local dydata={
	[1]={bl=const.PP_DANYAO_1PNUM,attr=10,slot=1},
	[2]={bl=const.PP_DANYAO_2PNUM,attr=20,slot=2},
	[3]={bl=const.PP_DANYAO_3PNUM,attr=30,slot=3},
	[4]={bl=const.PP_DANYAO_4PNUM,attr=40,slot=4},
	[5]={bl=const.PP_DANYAO_5PNUM,attr=50,slot=5},
	[6]={bl=const.PP_DANYAO_6PNUM,attr=60,slot=6},
	[7]={bl=const.PP_DANYAO_7PNUM,attr=70,slot=7},
	[8]={bl=const.PP_DANYAO_8PNUM,attr=80,slot=8},
	[9]={bl=const.PP_DANYAO_9PNUM,attr=90,slot=9},
	[10]={bl=const.PP_DANYAO_10PNUM,attr=100,slot=10},
}

function freshDanyaoAttrInfo(player)
	for i=1,10 do
		local cdd = dydata[i];
		if cdd then
			for j = 1,cdd.slot do
				if util.ppn(player,cdd.bl) < j then
					player:set_panel_data("panelshowproperty","dao"..i.."yao"..j,"grayFilter","true");
					--print("panelshowproperty","dao"..i.."yao"..j,"grayFilter","true")
				else
					player:set_panel_data("panelshowproperty","dao"..i.."yao"..j,"grayFilter","false");
					--print("panelshowproperty","dao"..i.."yao"..j,"grayFilter","false")
				end
			end
		end
	end
	player:push_ckpanel_data("showproperty","panelshowproperty");
end
login.add_login_listener(freshDanyaoAttrInfo);

function danyao1p(player)  if process_daoyao_calattr(player,1) == 0 then return 0; end end
function danyao2p(player)  if process_daoyao_calattr(player,2) == 0 then return 0; end end
function danyao3p(player)  if process_daoyao_calattr(player,3) == 0 then return 0; end end
function danyao4p(player)  if process_daoyao_calattr(player,4) == 0 then return 0; end end
function danyao5p(player)  if process_daoyao_calattr(player,5) == 0 then return 0; end end
function danyao6p(player)  if process_daoyao_calattr(player,6) == 0 then return 0; end end
function danyao7p(player)  if process_daoyao_calattr(player,7) == 0 then return 0; end end
function danyao8p(player)  if process_daoyao_calattr(player,8) == 0 then return 0; end end
function danyao9p(player)  if process_daoyao_calattr(player,9) == 0 then return 0; end end
function danyao10p(player)  if process_daoyao_calattr(player,10) == 0 then return 0; end end

function process_daoyao_calattr(player,yao)
	local cdt = dydata[yao];
	if cdt then
		if util.ppn(player,cdt.bl) < cdt.slot then
			player:set_param(cdt.bl,util.ppn(player,cdt.bl)+1);
			if player:get_job_name() == "warrior" then
				player:add_reincarnate_mdcmax(cdt.attr);
				player:alert(11,1,"成功激活"..yao.."品丹药属性,物理攻击+"..cdt.attr);
			end
			if player:get_job_name() == "wizard" then
				player:add_reincarnate_mmcmax(cdt.attr);
				player:alert(11,1,"成功激活"..yao.."品丹药属性,魔法攻击+"..cdt.attr);
			end
			if player:get_job_name() == "taoist" then
				player:add_reincarnate_mscmax(cdt.attr);
				player:alert(11,1,"成功激活"..yao.."品丹药属性,道术攻击+"..cdt.attr);
			end
			freshDanyaoAttrInfo(player);
			--openDanYaoPanel(player);
			return 1;
		else
			--openDanYaoPanel(player);
			player:alert(11,1,""..yao.."品丹药最多使用"..cdt.slot.."次!");
		end
	end
	return 0;
end

function pet(player)
	newgui.pet.open_pet_panel(player);
	return 0;
end