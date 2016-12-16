module(..., package.seeall)

local ACTIONSET_NAME="accgift";
local PANEL_ACTIONSET_NAME="panelaccgift";

local czmr_data={
	["btnagt1"]={needcz=5000,num=4,con=const.PP_LEIJICZLB0,award={
				{name="绑定元宝",number=2000},
				{name="小型宝石宝箱",number=1},
				{name="经验珠(500万)",number=1},
				{name="灵羽宝箱",number=1},
				},
		     },
	["btnagt2"]={needcz=10000,num=5,con=const.PP_LEIJICZLB1,award={
				{name="绑定元宝",number=5000},
				{name="小型宝石宝箱",number=2},
				{name="经验珠(1000万)",number=1},
				{name="装备宝箱",number=1},
				{name="灵羽宝箱",number=1},
				},
		     },
	["btnagt3"]={needcz=30000,num=5,con=const.PP_LEIJICZLB2,award={
				{name="绑定元宝",number=5000},
				{name="中型宝石宝箱",number=1},
				{name="经验珠(2000万)",number=1},
				{name="装备宝箱",number=2},
				{name="灵羽宝箱",number=2},
				},
		     },
	["btnagt4"]={needcz=50000,num=5,con=const.PP_LEIJICZLB3,award={
				{name="绑定元宝",number=5000},
				{name="中型宝石宝箱",number=2},
				{name="经验珠(2000万)",number=1},
				{name="装备宝箱",number=2},
				{name="灵羽宝箱",number=2},
				},
		     },
	["btnagt5"]={needcz=100000,num=5,con=const.PP_LEIJICZLB4,award={
				{name="绑定元宝",number=5000},
				{name="大型宝石宝箱",number=1},
				{name="经验珠(5000万)",number=1},
				{name="装备宝箱",number=5},
				{name="六级灵羽",number=1},
				},
		     },
	["btnagt6"]={needcz=300000,num=5,con=const.PP_LEIJICZLB5,award={
				{name="绑定元宝",number=5000},
				{name="大型宝石宝箱",number=2},
				{name="经验珠(5000万)",number=2},
				{name="祈福令牌(大)",number=1},
				{name="七级灵羽",number=1},
				},
		     },
	["btnagt7"]={needcz=500000,num=5,con=const.PP_LEIJICZLB6,award={
				{name="绑定元宝",number=5000},
				{name="超级宝石宝箱",number=1},
				{name="经验珠(5000万)",number=2},
				{name="祈福令牌(大)",number=2},
				{name="八级灵羽",number=1},
				},
		     },
};

function reset_player_mrczlj_info(player)
	if util.ppn(player,const.PP_MRCZLJ_TAG) ~= today() then
		player:set_param(const.PP_MRCZLJ_TAG,today());
		player:set_param(const.PP_LEIJICZJL,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end

function process_lqMerRIaward(player,actionset,panelid,actionid,data)
	if not activity.isBaifuSjieOpen() then
		player:alert(1,1,"当前不在活动时间!");return;
	end
	reset_player_mrczlj_info(player);

	local d = czmr_data[actionid];
	if d then
		if util.ppn(player,const.PP_LEIJICZJL) >= d.needcz then
			if player:num_bag_black() >= d.num then
				if util.ppn(player,d.con) ~= today() then
					player:set_param(d.con,today());
					for i=1,#d.award do
						player:add_item(d.award[i].name,d.award[i].number,1);
						player:alert(11,0,"恭喜您成功领取"..d.award[i].name.."*"..d.award[i].number);
					end	
				else
					player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
				end
			else
				player:alert(1,1,"背包空格不足"..(d.num).."格,无法领取!")
			end
		else
			player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
		end
	end
end
--ckpanel.add_listener(ACTIONSET_NAME,process_lqMerRIaward);


function fresh_mrcaward_info(player)
	if activity.isBaifuSjieOpen() then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"accgt","htmlText","今日累积充值元宝: <font color='#FFFF00'>"..util.ppn(player,const.PP_LEIJICZJL).."</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"accgt","htmlText","活动时间已过,感谢您的参与!");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
--login.add_login_listener(fresh_mrcaward_info);