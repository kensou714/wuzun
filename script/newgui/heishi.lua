module(..., package.seeall)
local ACTIONSET_NAME="heishi";
local PANEL_ACTIONSET_NAME="panelheishi";

--神器积分 为节点出的物品
--frist 当出现物品的数量超过frist的时候 则才出该物品
--cooldown 该物品抽奖出现之后 必须再出cooldown个其他物品之后 才能再次出现该物品

--jl = math.random(1,5000);
-- 七级攻击玄晶	18888	2
-- 七级物防玄晶	18888	2
-- 七级魔防玄晶	18888	2
-- 七级生命玄晶	18888	2
-- 八级宝石	18888	2
-- 九级宝石	55888	1
-- 幸运神符（50%）	3888	5
-- 经验珠（5000万）	990	3
local heishi_shop_items={
	[1]={name="七级攻击玄晶",		 id=const.PP_HEISHI_7GONGJI_NUM,		log=const.PPC_HEISHI_7GONGJI_NUM, price=18888   ,dhnum=2},
	[2]={name="七级物防玄晶",	 	 id=const.PP_HEISHI_7WUFANG_NUM, 		log=const.PPC_HEISHI_7WUFANG_NUM, price=18888   ,dhnum=2},
	[3]={name="七级魔防玄晶",	 	 id=const.PP_HEISHI_7MOFANG_NUM, 		log=const.PPC_HEISHI_7MOFANG_NUM, price=18888   ,dhnum=2},
	[4]={name="七级生命玄晶",		 id=const.PP_HEISHI_7SHENGMING_NUM,		log=const.PPC_HEISHI_7SHENGMING_NUM, price=18888  ,dhnum=2},
	[5]={name="八级宝石",			 id=const.PP_HEISHI_8BAOSHI_NUM,		log=const.PPC_HEISHI_8BAOSHI_NUM, price=18888   ,dhnum=2},	
	[6]={name="九级宝石",			 id=const.PP_HEISHI_9BAOSHI_NUM,		log=const.PPC_HEISHI_9BAOSHI_NUM, 	price=55888   ,dhnum=1},	
	[7]={name="幸运神符(50%)",		 id=const.PP_HEISHIT_50XINGYUNFU_NUM,	log=const.PPC_HEISHIT_50XINGYUNFU_NUM, price=3888 ,dhnum=5},
	[8]={name="经验珠(5000万)",		 id=const.PP_HEISHI_5KW_JINGYAN_NUM,	log=const.PPC_HEISHI_5KW_JINGYAN_NUM, price=990    ,dhnum=3},
	};
function fresh_xuyuanshop_panel( player )
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyjb","text",player:num_item("许愿金币"));
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyjf","text",util.ppn(player,const.PP_JF_heishi));
	--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function heishishop_click(player,actionset,panelid,actionid)
	-- body
	if(util.ppn(player,const.PP_HEISHI_TODAY)~=today())then
		player:set_param(const.PP_HEISHI_TODAY,today());
		for i=1,8 do
			player:set_param(heishi_shop_items[i].id,0);
		end
	end
	for i=1,8 do
		if(actionid== "btnhsdh"..i)then
			if(player:num_bag_black()>1)then
				if(util.ppn(player,heishi_shop_items[i].id)<heishi_shop_items[i].dhnum)then
					if(player:get_vcoin()>=heishi_shop_items[i].price)then
						player:sub_vcoin(heishi_shop_items[i].price,"heishi"..i);
						player:add_item(heishi_shop_items[i].name,1,1);
						player:set_param(heishi_shop_items[i].id,util.ppn(player,heishi_shop_items[i].id)+1);
						player:alert(1,1,"获得物品:[<b><font color='#00ff00'>"..heishi_shop_items[i].name.."</font></b>]");
						server.log_count(3,heishi_shop_items[i].log,1);
					else
						player:alert(1,1,"元宝不足");
					end
				else
					player:alert(1,1,heishi_shop_items[i].name.."每日只能购买["..heishi_shop_items[i].dhnum.."]次");
				end
			else
				player:alert(1,1,"您的背包不足一格 请先行整理");
			end
			break;
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,heishishop_click);