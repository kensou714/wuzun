module(..., package.seeall)
local ACTIONSET_NAME="sevenLogin";--
local PANEL_ACTIONSET_NAME="panelsevenDay";

local zy_data = {
["warrior"]={wq = "破空斩·武威",wqid = "20409",jns="破天斩(1级)",jnsid = "10272",},
["wizard"]={wq = "破空斩·烈焰",wqid = "20410",jns="龙息气焰(1级)",jnsid = "10278",},
["taoist"]={wq = "破空斩·无极",wqid = "20411",jns="气功波(1级)",jnsid = "10284",},
};

function process_sevendayActivity(player,actionset,panelid,actionid,data)
	if actionid == "sevendayget1" then--888元礼包
		getAward(player,1);return;
	end
	if actionid == "sevendayget2" then--70级武器
		getAward(player,2);return;
	end
	if actionid == "sevendayget3" then--专属称号
		getAward(player,3);return;
	end
	if actionid == "sevendayget4" then--3天VIP卡
		getAward(player,4);return;
	end
	if actionid == "sevendayget5" then--高级技能书
		--local lv = tonumber(string.sub(actionid,9));
		getAward(player,5);return;
	end
	if actionid == "sevendayget6" then--免伤官印
		getAward(player,6);return;
	end
	if actionid == "sevendayget7" then--复活令牌
		getAward(player,7);return;
	end
	if actionid == "sevenday1" then
		showGuiMovieClip(player,1);
	end
	if actionid == "sevenday2" then	
		showGuiMovieClip(player,2);
	end
	if actionid == "sevenday3" then
		showGuiMovieClip(player,3);
	end
	if actionid == "sevenday4" then
		showGuiMovieClip(player,4);
	end
	if actionid == "sevenday5" then
		showGuiMovieClip(player,5);
	end
	if actionid == "sevenday6" then
		showGuiMovieClip(player,6);
	end
	if actionid == "sevenday7" then
		showGuiMovieClip(player,7);
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_sevendayActivity);



local jlwp_data = {
	[1]={
			title = "888元礼包",con=const.SEVEN_DAY_ACTIVITY_LB,wpaward={
				[1] ={attr = "成长进阶礼包", sl = 1},
				[2] ={attr = "四倍宝典", sl = 1},
				[3] ={attr = "聚灵珠", sl = 1},
				[4] ={attr = "坐骑经验丹(大)", sl = 1},
			},bdybaward = "500",bdjbaward = "100000",needbags = 4,
	},
	[2]={
			title = "70级武器",con=const.SEVEN_DAY_ACTIVITY_WQ,wpaward={
				[1] ={attr = "70级武器", sl = 1},
				[2] ={attr = "四倍宝典", sl = 2},
				[3] ={attr = "聚灵珠", sl = 2},
				[4] ={attr = "坐骑经验丹(大)", sl = 2},
			},bdybaward = "1000",bdjbaward = "200000",needbags = 4,
	},
	[3]={title = "专属称号",con=const.SEVEN_DAY_ACTIVITY_ZSCH,wpaward={
				[1] ={attr = "唯武独尊称号", sl = 1},
				[2] ={attr = "四倍宝典", sl = 3},
				[3] ={attr = "聚灵珠", sl = 3},
				[4] ={attr = "坐骑经验丹(大)", sl = 2},
			},bdybaward = "1500",bdjbaward = "300000",needbags = 4,
	},
	[4]={title = "3天VIP卡",con=const.SEVEN_DAY_ACTIVITY_VIPCARD,wpaward={
				[1] ={attr = "VIP会员(3天)", sl = 1},
				[2] ={attr = "四倍宝典", sl = 4},
				[3] ={attr = "聚灵珠", sl = 4},
				[4] ={attr = "坐骑经验丹(大)", sl = 3},
			},bdybaward = "2000",bdjbaward = "400000",needbags = 4,
	},
	[5]={title = "高级技能书",con=const.SEVEN_DAY_ACTIVITY_GJJNS,wpaward={
				[1] ={attr = "高级技能书", sl = 1},
				[2] ={attr = "八倍宝典", sl = 1},
				[3] ={attr = "经验珠(5000万)", sl = 1},
				[4] ={attr = "坐骑经验丹(大)", sl = 3},
			},bdybaward = "2500",bdjbaward = "500000",needbags = 4,
	},
	[6]={title = "免伤官印",con=const.SEVEN_DAY_ACTIVITY_MSGY,wpaward={
				[1] ={attr = "九品将兵官印", sl = 1},
				[2] ={attr = "八倍宝典", sl = 2},
				[3] ={attr = "经验珠(5000万)", sl = 2},
				[4] ={attr = "坐骑经验丹(大)", sl = 5},
			},bdybaward = "3000",bdjbaward = "700000",needbags = 4,
	},
	[7]={title = "复活令牌",con=const.SEVEN_DAY_ACTIVITY_FHLP,wpaward={
				[1] ={attr = "青铜令(1级)", sl = 1},
				[2] ={attr = "八倍宝典", sl = 3},
				[3] ={attr = "经验珠(5000万)", sl = 3},
				[4] ={attr = "坐骑经验丹(大)", sl = 5},
			},bdybaward = "3500",bdjbaward = "1000000",needbags = 4,
	},
};

function effButton(player)
	local loginDays = util.ppn(player,const.PP_LEIJI_LOGINDAYS);
	local isAllReceive = 1;
	for i=1,7 do
		if util.ppn (player,jlwp_data[i].con) == 0 then
			isAllReceive = 0;
			break;
		end
	end

	if loginDays >= 10 and isAllReceive == 1 then
		player:set_panel_data("panelminimapfun","btnsevenDay","visible","false");
		player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
	else
		player:set_panel_data("panelminimapfun","btnsevenDay","visible","true");
		player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
	end
end
login.add_login_listener(effButton);

function showGuiMovieClip(player,pic)
	local buttonTag = "sevenday"..pic;
	local texiaoTag = "texiao"..pic;
	local dtexiaoTag = "dtexiao"..pic;
	judgebutton(player);
	for i=1,7,1 do
		local picTag = "sevendaypic"..i;
		local visibleTag = "false";
		if(i==pic) then
			visibleTag = "true";
		end
		player:set_panel_data("panelsevenDay",picTag,"visible",visibleTag);
	end
	
	if util.ppn(player,jlwp_data[pic].con)==0 then
		player:set_panel_data("panelsevenDay",buttonTag,"bgid",1207);
		player:set_panel_data("panelsevenDay",texiaoTag,"visible","false");
		player:set_panel_data("panelsevenDay",dtexiaoTag,"visible","true");
	else	
		player:set_panel_data("panelsevenDay",texiaoTag,"visible","false");
		player:set_panel_data("panelsevenDay",dtexiaoTag,"visible","false");
		player:set_panel_data("panelsevenDay",buttonTag,"bgid",1208);
	end

	player:push_ckpanel_data("sevenLogin","panelsevenDay");
end

function getAward(player,day)
	local loginDays = util.ppn(player,const.PP_LEIJI_LOGINDAYS);
	local picTag = "kelingqu"..day;
	local buttonTag = "sevenday"..day;
	local texiaoTag = "texiao"..day;
	local dtexiaoTag = "dtexiao"..day;
	
	if loginDays < day or day > server_start_day()+1 then
		player:alert(1,1,"您的累计登录天数不足"..day.."天,奖励物品无法领取!"); 
		return;
	end

	local data = jlwp_data[day];
	if util.ppn(player,data.con) == 0 then
		if player:num_bag_black() >= data.needbags then
			local  awardwp = data.wpaward;
			local  info = "恭喜您成功领取["..data.title.."]";
			if day==2 then
				player:add_item(zy_data[player:get_job_name()].wq,awardwp[1].sl,1);
				info=info.."<br>"..zy_data[player:get_job_name()].wq.."        数量:"..awardwp[1].sl;
			else
				if day == 5 then
					player:add_item(zy_data[player:get_job_name()].jns,awardwp[1].sl,1);
					info=info.."<br>"..zy_data[player:get_job_name()].jns.."        数量:"..awardwp[1].sl;
				else
					if day == 3 then
						player:set_param(const.PP_WWDZCH,1);
						npc.renwu.fenghao.youxifh(player);
					else
						player:add_item(awardwp[1].attr,awardwp[1].sl,1);
					end
					info=info.."<br>"..awardwp[1].attr.."        数量:"..awardwp[1].sl;
				end
			end

			if day ==6 then
				player:set_panel_data("panelshowpost","panelshowpost","panel_visible","true");
				player:set_panel_data("panelshowpost","btnpost","visible","true");
				player:set_panel_data("panelshowpost","dhlinngpai2","visible","true");
				player:set_param(const.PP_GUANZHI_START,1);
				player:push_ckpanel_data("showpost","panelshowpost");
			end

			if day ==7 then
				player:set_panel_data("panelshowproperty","btnDHlpai","visible","true");
				player:set_panel_data("panelshowproperty","dhlinngpai1","visible","true");
				player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
				player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","4");
				player:push_ckpanel_data("showproperty","panelshowproperty");
			end
			
			for i=2,#awardwp do
				player:add_item(awardwp[i].attr,awardwp[i].sl,1);
				info=info.."<br>"..awardwp[i].attr.."        数量:"..awardwp[i].sl;
			end
			player:add_vcoin_bind(data.bdybaward);
			info= info.."<br>绑定元宝("..data.bdybaward..")  数量:1";
			player:add_gamemoney_bind(data.bdjbaward);
			info=info.."<br>绑定金币("..data.bdjbaward..") 数量:1";
			server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]".."获得"..data.title.."!");
			player:alert(11,1,info);
			player:set_param(data.con,1);
			player:set_panel_data("panelsevenDay",picTag,"bgid",20011);
			player:set_panel_data("panelsevenDay",buttonTag,"bgid",1208);
			player:set_panel_data("panelsevenDay",texiaoTag,"visible","false");
			player:set_panel_data("panelsevenDay",dtexiaoTag,"visible","false");
			player:push_ckpanel_data("sevenLogin","panelsevenDay");
		else
			player:alert(1,1,"您的背包不足"..data.needbags.."格,您也不想这些好东西都掉下地吧!");
		end
	else
		player:alert(1,1,"对不起,您已经领取过"..data.title.."!");
	end
end

function judgebutton(player)
	for i = 1, 7 do
		local texiaoTag = "texiao"..i;
		local buttonTag = "sevenday"..i;
		local dtexiaoTag = "dtexiao"..i;
		if util.ppn(player,jlwp_data[i].con)==0 then
			player:set_panel_data("panelsevenDay",buttonTag,"bgid",1205);
			player:set_panel_data("panelsevenDay",texiaoTag,"visible","true");
			player:set_panel_data("panelsevenDay",dtexiaoTag,"visible","false");
		else
			player:set_panel_data("panelsevenDay",texiaoTag,"visible","false");
			player:set_panel_data("panelsevenDay",dtexiaoTag,"visible","false");
			player:set_panel_data("panelsevenDay",buttonTag,"bgid",1206);
		end		
	end
	player:push_ckpanel_data("sevenLogin","panelsevenDay");
end

