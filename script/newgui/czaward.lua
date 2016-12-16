module(..., package.seeall)
local ACTIONSET_NAME="czaward";
local PANEL_ACTIONSET_NAME="panelczaward";

local cz_data={
	["btnLQCZ1"]={needcz=100,num=6,con=const.PP_SCCZLB,award={
				{name="绑定元宝",number=2000},
				{name="天璇仙魄(70级)",number=1},
				{name="四倍宝典",number=1},
				{name="聚灵珠(小)",number=1},
				{name="首充金条(100万)",number=1},
				{name="玛雅令牌",number=1},
				},
		     },
	["btnLQCZ2"]={needcz=10000,num=7,con=const.PP_CZAWARD_LQ100,award={
				{name="绑定元宝",number=2000},
				{name="三级宝石",number=1},
				{name="四级宝石",number=1},
				{name="五级宝石",number=1},
				{name="坐骑经验丹(大)",number=1},
				{name="魂石令牌(500)",number=1},
				{name="荣誉令牌(10000)",number=1},
				{name="成就令牌",number=1},
				},
		     },
	["btnLQCZ3"]={needcz=50000,num=7,con=const.PP_CZAWARD_LQ500,award={
				{name="绑定元宝",number=10000},
				{name="四级宝石",number=1},
				{name="五级宝石",number=1},
				{name="六级宝石",number=1},
				{name="八倍宝典",number=1},
				{name="聚灵珠",number=1},
				{name="镇魔令大包",number=1},
				},
		     },
	["btnLQCZ4"]={needcz=100000,num=9,con=const.PP_HELP_CZLIBAO1000,award={
				{name="绑定元宝",number=10000},
				{name="天璇仙魄(80级)",number=1},
				{name="六级宝石",number=1},
				{name="七级宝石",number=1},
				{name="八级宝石",number=1},
				{name="八倍宝典",number=2},
				{name="聚灵珠",number=2},
				{name="礼包金条(100万)",number=1},
				},
		     },
};

local show_czaward1={
	["warrior"]={id=21000,number=1},
	["wizard"]={id=21001,number=1},
	["taoist"]={id=21002,number=1},
};
local show_czaward3={
	["warrior"]={id=20409,number=1},
	["wizard"]={id=20410,number=1},
	["taoist"]={id=20411,number=1},
};
function fresh_czaward_info(player)
	local showid = show_czaward1[player:get_job_name()];
	if showid then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"ljobgift","typeid",showid.id);
	end
	local showid2 = show_czaward3[player:get_job_name()];
	if showid2 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"giftfk","typeid",showid2.id);
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_czaward_info);

function process_lqaward(player,actionset,panelid,actionid,data)
	if actionid == "btnLJCZ" then
		player:open_panel(122);return;
	end
	local d = cz_data[actionid];
	if d then
		check_czaward_panel(player);
		if util.ppn(player,d.con) == 0 then
			if player:get_vcoin_accu() >= d.needcz then
				if player:num_bag_black() < d.num then player:alert(1,1,"背包不足"..d.num.."格,请清理后再来领取!");return; end
				player:set_param(d.con,1)
				if actionid == "btnLQCZ1" then
					local jobgift1={["warrior"]="天之屠龙刀",["wizard"]="天之魔魂杖",["taoist"]="天之玄天剑"};
					player:add_item_log(jobgift1[player:get_job_name()],237,1);
				end
				if actionid == "btnLQCZ3" then
					local jobgift2={["warrior"]="破空斩·武威",["wizard"]="破空斩·烈焰",["taoist"]="破空斩·无极"};
					player:add_item_log(jobgift2[player:get_job_name()],237,1);
				end
				for i=1,#d.award do
					player:add_item_log(d.award[i].name,237,d.award[i].number,1);
				end
				check_czaward_panel(player);
				player:alert(1,1,"您已成功领取奖励"..d.needcz.."元宝充值礼包!");return;
			else
				player:alert(1,1,"您的累计充值不足"..d.needcz.."元宝");return;
			end
		else
			player:alert(1,1,"对不起,您已经领取过该等级奖励!");return;
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lqaward);

function fresh_award_info(player)
	local vc = player:get_vcoin_accu();
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtLJCZYB","htmlText","您已经充值：<font color='#FFFF00'>"..vc.."</font> 元宝 ");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_award_info);

function show_button(player,flag)
	if flag>0 then
		player:set_panel_data("panelminimapfun","btnCZWard","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnCZWard","visible","false");
	end
	player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end

function show_panel(player,flag)
	if flag>0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelczaward","panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelczaward","panel_visible","false");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function check_czaward_panel(player)
	local check_panel = 0;
	for j=1,4 do
		local str = "btnLQCZ"..j;
		local dt = cz_data[str];
		if dt then
			if util.ppn(player,dt.con) == 0 then
				check_panel = 1;
			end
		end
	end
	if check_panel == 0 then
		show_panel(player,0);
		show_button(player,0);
	end
end
login.add_login_listener(check_czaward_panel);