module(..., package.seeall)

local ACTIONSET_NAME="czday2";
local PANEL_ACTIONSET_NAME="panelczday2";

local cz_data={
	[1]={needcz=1000,num=6,bg=4210,x=100,y=60,con=const.PP_DAILY_GIFT,award={
				{name="绑定元宝",id=19009,number=1000},
				{name="经验珠(500万)",id=10207,number=1},
				{name="祈福令牌(小)",id=15071,number=1},
				{name="坐骑经验丹(大)",id=15037,number=1},
				{name="三级攻击玄晶",id=10226,number=1},
				{name="招财神符(大)",id=10220,number=1},
				{name="五级宝石",id=10139,number=1},
				},
		     },
	[2]={needcz=5000,num=7,bg=4211,x=100,y=80,con=const.PP_DAYCZ_NO2,award={
				{name="绑定元宝",id=19009,number=1000},
				{name="经验珠(1000万)",id=10176,number=1},
				{name="祈福令牌(小)",id=15071,number=4},
				{name="坐骑经验丹(大)",id=15037,number=2},
				{name="三级攻击玄晶",id=10226,number=2},
				{name="进阶石",id=10209,number=100},
				{name="六级宝石",id=10140,number=1},
				},
		     },
	[3]={needcz=10000,num=7,bg=4212,x=100,y=80,con=const.PP_DAYCZ_NO3,award={
				{name="绑定元宝",id=19009,number=2000},
				{name="经验珠(2000万)",id=10177,number=1},
				{name="祈福令牌(中)",id=15072,number=1},
				{name="坐骑经验丹(大)",id=15037,number=4},
				{name="三级攻击玄晶",id=10226,number=4},
				{name="进阶石",id=10209,number=200},
				{name="七级宝石",id=10141,number=1},
				},
		     },
	[4]={needcz=50000,num=7,bg=4213,x=100,y=80,con=const.PP_DAYCZ_NO4,award={
				{name="绑定元宝",id=19009,number=5000},
				{name="经验珠(5000万)",id=10178,number=1},
				{name="祈福令牌(大)",id=15073,number=4},
				{name="坐骑经验丹(大)",id=15037,number=8},
				{name="三级攻击玄晶",id=10226,number=8},
				{name="进阶石",id=10209,number=400},
				{name="八级宝石",id=10142,number=1},
				},
		     },
};

--19009 15007 15037 15044  10226  15015  15028
--绑定元宝1000 四倍宝典 坐骑经验丹(大) 魂石令牌(500) 三级攻击玄晶 玛雅令牌  招财神符

function process_daycz2_award(player,actionset,panelid,actionid)
	if actionid == "btnCZgift" then
		if util.ppn(player,const.PP_CONGZI_DAY) == today() then
			for i=1,#cz_data do
				local dcz = cz_data[i];
				if dcz then
					if util.ppn(player,dcz.con) ~= today() then
						if util.ppn(player,const.PP_DAILY_CONGZI) >= dcz.needcz then
							if player:num_bag_black() >= dcz.num then
								player:set_param(dcz.con,today());
								for j=1,#dcz.award do
									player:add_item_log(dcz.award[j].name,238,dcz.award[j].number,1);
								end
								player:alert(1,1,"恭喜您成功领取该充值礼包!");
								fresh_czday_info(player);
								if i == 4 then
									player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","false");
									player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
								end
								return;
							else
								player:alert(1,1,"您的背包不足"..dcz.num.."格,您也不想这些好东西都掉下地吧!");return;
							end
								
						else
							player:alert(1,1,"您今日的充值不足"..dcz.needcz.."元宝!");return;
						end
					end
				end
			end
			player:alert(1,1,"您已全部领取完每日充值奖励!");
			player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","false");
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		else
			player:alert(1,1,"对不起,您今天尚未充值!");
		end
		
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_daycz2_award);

function fresh_czday_info(player)
	if util.ppn(player,const.PP_DAYCZ_NO4) == today() then
		player:set_panel_data("panelminimapfun","btnDayGift","visible","false");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
		return;
	end
	for i=1,#cz_data do
		local dcz = cz_data[i];
		if dcz then
			if util.ppn(player,dcz.con) ~= today() then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"topinfo","bgid",dcz.bg);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"topinfo","x",dcz.x);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"topinfo","y",dcz.y);
				for j=1,#dcz.award do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"czgift"..j,"typeid",dcz.award[j].id);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"czgift"..j,"num",dcz.award[j].number);
				end
				player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
				return;
			end
		end
	end
end
--login.add_login_listener(fresh_czday_info);

---------------------------------------------------------------------------------------------------------------------------------------
function process_dayCZ_award(player,actionset,panelid,actionid)
	if string.sub(actionid,1,8) == "btnDayCZ" then
		local title = tonumber(string.sub(actionid,9));
		local dcz = cz_data[title];
		if dcz then
			if util.ppn(player,const.PP_CONGZI_DAY) == today() then
				if util.ppn(player,dcz.con) ~= today() then
					if util.ppn(player,const.PP_DAILY_CONGZI) >= dcz.needcz then
						if player:num_bag_black() >= dcz.num then
							player:set_param(dcz.con,today());
							for i=1,#dcz.award do
								player:add_item_log(dcz.award[i].name,238,dcz.award[i].number,1);
							end
							player:alert(1,1,"恭喜您成功领取该充值礼包!");
						else
							player:alert(1,1,"您的背包不足"..dcz.num.."格,您也不想这些好东西都掉下地吧!");
						end
							
					else
						player:alert(1,1,"您今日的充值不足"..dcz.needcz.."元宝!");
					end
				else
					player:alert(1,1,"对不起,您已经领取过该充值礼包!");
				end
			else
				player:alert(1,1,"对不起,您今天尚未充值!");
			end
		end
	end
end
--ckpanel.add_listener(ACTIONSET_NAME,process_dayCZ_award);