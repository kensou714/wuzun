module(..., package.seeall)
local ACTIONSET_NAME="xuyuanshop";
local PANEL_ACTIONSET_NAME="panelxuyuanshop";

--神器积分 为节点出的物品
--frist 当出现物品的数量超过frist的时候 则才出该物品
--cooldown 该物品抽奖出现之后 必须再出cooldown个其他物品之后 才能再次出现该物品

--jl = math.random(1,5000);

local xuyuanchi_shop_items={
	[1]={name="七彩石",		  id=const.PPC_XUYUANSHOP_qicaishi,		    	price=500   },
	[2]={name="八倍宝典",	  id=const.PPC_XUYUANSHOP_babeibaodian, 		price=468   },
	[3]={name="四倍宝典",	  id=const.PPC_XUYUANSHOP_sibeibaodian, 		price=93    },
	[4]={name="幸运神符(50%)",id=const.PPC_XUYUANSHOP_xingyunshenfu50,	    price=600   },
	[5]={name="幸运神符(40%)",id=const.PPC_XUYUANSHOP_xingyunshenfu40,	    price=300   },	
	[6]={name="幸运神符(30%)",id=const.PPC_XUYUANSHOP_xingyunshenfu30,	    price=150    },	
	[7]={name="聚灵珠",		  id=const.PPC_XUYUANSHOP_julingzhu,			price=160   },
	[8]={name="转生石",		  id=const.PPC_XUYUANSHOP_zhuanshengshi,		price=18    },
	};
function fresh_xuyuanshop_panel( player )
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyjb","text",player:num_item("许愿金币"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyjf","text",util.ppn(player,const.PP_JF_XUYUANCHI));
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function xuyuanshop_click(player,actionset,panelid,actionid)
	-- body
	if activity.isxuyuanchi() then
		for i=1,8 do
			if(actionid== "btnxycdh"..i)then
				if(player:num_bag_black()>1)then
					if(util.ppn(player,const.PP_JF_XUYUANCHI)>=xuyuanchi_shop_items[i].price)then
						player:add_item(xuyuanchi_shop_items[i].name,1);
						player:set_param(const.PP_JF_XUYUANCHI,util.ppn(player,const.PP_JF_XUYUANCHI)-xuyuanchi_shop_items[i].price);
						server.log_count(3,xuyuanchi_shop_items[i].id,1);
						fresh_xuyuanshop_panel(player);
						player:alert(1,1,"获得物品:[<b><font color='#00ff00'>"..xuyuanchi_shop_items[i].name.."</b>]");
						newgui.xuyuanchi.fresh_panel(player,0,-1);
					else
						player:alert(1,1,"您的许愿积分不足[<font color='#ff0000'>"..xuyuanchi_shop_items[i].price.."</font>]哦 快去许愿吧");
					end
				else
					player:alert(1,1,"您的背包不足一格 请先行整理");
				end
			end
		end
	else
		player:alert(1,1,"非活动时间，谢谢参与！");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,xuyuanshop_click);