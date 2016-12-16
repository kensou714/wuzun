module(..., package.seeall)
local ACTIONSET_NAME="cqaward";
local PANEL_ACTIONSET_NAME="panelcqaward";

local cz_data={
	[1]={needcz=100,num=6,con=const.PP_CZAWARD_1,titleid="",swfid="",award={
				{name="绑定元宝",typeid="19009",number=2000},
				{name="天璇仙魄(70级)",typeid="10127",number=1},
				{name="玄光翼(1级)",typeid="190001",number=1},
				{name="四倍宝典",typeid="15007",number=1},
				{name="聚灵珠(小)",typeid="10130",number=1},
				{name="首充金条(100万)",typeid="10128",number=1},
				{name="玛雅令牌",typeid="15015",number=1},
				},
		     },
	[2]={needcz=10000,num=7,con=const.PP_CZAWARD_2,titleid="",swfid="",award={
				{name="绑定元宝",typeid="19009",number=2000},
				{name="三级宝石",typeid="10137",number=1},
				{name="四级宝石",typeid="10138",number=1},
				{name="五级宝石",typeid="10139",number=1},
				{name="至尊屠龙刀",typeid="20463",number=1},
				{name="魂石令牌(500)",typeid="15044",number=1},
				{name="荣誉令牌(10000)",typeid="15047",number=1},
				{name="成就令牌",typeid="15054",number=1},
				},
		     },
	[3]={needcz=50000,num=7,con=const.PP_CZAWARD_3,titleid="",swfid="",award={
				{name="绑定元宝",typeid="19009",number=10000},
				{name="至尊屠龙甲",typeid="30064",number=1},--female 至尊屠龙衣 35064
				{name="四级宝石",typeid="10138",number=1},
				{name="五级宝石",typeid="10139",number=1},
				{name="六级宝石",typeid="10140",number=1},
				{name="八倍宝典",typeid="15010",number=1},
				{name="聚灵珠",typeid="15011",number=1},
				{name="镇魔令大包",typeid="15050",number=1},
				},
		     },
	[4]={needcz=100000,num=9,con=const.PP_CZAWARD_4,titleid="",swfid="",award={
				{name="绑定元宝",typeid="19009",number=10000},
				{name="天璇仙魄(80级)",typeid="10134",number=1},
				{name="六级宝石",typeid="10139",number=1},
				{name="七级宝石",typeid="10140",number=1},
				{name="八级宝石",typeid="10141",number=1},
				{name="八倍宝典",typeid="15010",number=2},
				{name="聚灵珠",typeid="15011",number=2},
				{name="礼包金条(100万)",typeid="10131",number=1},
				},
		     },
};

function process_lqaward(player,actionset,panelid,actionid,data)	
	if actionid == "btnCQPlay" then
		--领取奖励
		for j=1,#cz_data do
			local d = cz_data[j];
			if d then
				if util.ppn(player,d.con) == 0 then
					if util.ppn(player,const.PP_CONGZHI_TJ) >= d.needcz then
						if player:num_bag_black() < d.num then player:alert(1,1,"背包不足"..d.num.."格,请清理后再来领取!");return; end
						player:set_param(d.con,1)
						if j==3 then
							setAwardCloth(player);
						end
						for i=1,#d.award do
							--print(d.award[i].typeid);
							if d.award[i].typeid == "20463" or d.award[i].typeid == "30064" or d.award[i].typeid == "35064" then 
								--print(111);
								player:add_item_log(d.award[i].name,237,d.award[i].number);							
							else
								player:add_item_log(d.award[i].name,237,d.award[i].number,1);
							end
							
						end						
						player:alert(1,1,"您已成功领取奖励"..d.needcz.."元宝充值礼包!");break;
					else
						player:alert(1,1,"您的累计充值不足"..d.needcz.."元宝");			
						--goToCz(player);
						break;
					end
				else
					if j==4 then
						player:alert(1,1,"对不起,您已经领取完所有奖励!");
					end
				end
			end
			
			--return;
		end
		check_czaward_panel(player);
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lqaward);

function setAwardCloth(player)	
	local sex = player:get_gender_name(); --male  female
	if sex == "female" then
		local d = cz_data[3].award[2];
		d.name="至尊屠龙衣";
		d.typeid="35064";
	else
		local d = cz_data[3].award[2];
		d.name="至尊屠龙甲";
		d.typeid="30064";
	end
end

function check_czaward_panel(player)
	for j=1,#cz_data do
		local d = cz_data[j];
		if d then
			if util.ppn(player,d.con) == 0 then
				if j==3 then
					setAwardCloth(player);
				end
				setPanelData(player,j);
				if util.ppn(player,const.PP_CONGZHI_TJ) < d.needcz then
					goToCz(player,true);
				else
					goToCz(player,false);
				end

				break;
			end
		end
		
	end
	freshBtnCq(player);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);	
end

function setPanelData(player,index)	
	for i=1,4 do
		if i == index then 
			player:set_panel_data(PANEL_ACTIONSET_NAME,"cqClip"..i,"visible","true");
		else			
			player:set_panel_data(PANEL_ACTIONSET_NAME,"cqClip"..i,"visible","false");
		end
	end
	
end

function afterGetAllAward(player)
	player:set_panel_data("panelminimapfun","btnCqaward","visible","false");
	player:set_panel_data("panelminimapfun","btnHBox","visible","false");
	player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end

function goToCz(player,flag)
	--player:set_panel_data("panelminimap","minimap","oPanelName","6");
	--player:push_ckpanel_data("minimap","panelminimap");
	if flag then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnCQPlay","across","panelminimap:minimap:AC2");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnCQPlay","across"," 	");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

end

function freshBtnCq(player)
	if util.ppn(player,const.PP_CZAWARD_4)==1 then
		afterGetAllAward(player);
	end
end
login.add_login_listener(freshBtnCq);