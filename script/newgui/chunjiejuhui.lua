module(..., package.seeall)
local ACTIONSET_NAME="chunjiejuhui";
local PANEL_ACTIONSET_NAME="panelchunjiejuhui";


--聚灵珠	688元宝	10
--四倍宝典	488元宝	10
--八倍宝典	1888元宝	10
--玉石原石	2888元宝	5
--星石	2888元宝	5
--装备灵魂石(500)	3888元宝	5
--天书精华	2888元宝	5
--天蚕精华	2888元宝	5

local chunjiejuhui_shop_items={
	[1]={name="聚灵珠",		 	 id=const.PP_CHUNJIEJUHUI_JULINGZHU_NUM,		    	 price=688    ,dhnum=10},
	[2]={name="四倍宝典",	 	 id=const.PP_CHUNJIEJUHUI_4BEIBAODIAN_NUM, 				 price=488    ,dhnum=10},
	[3]={name="八倍宝典",	 	 id=const.PP_CHUNJIEJUHUI_8BEIBAODIAN_NUM, 				 price=1888   ,dhnum=10},
	[4]={name="玉石原石",		 id=const.PP_CHUNJIEJUHUI_YUSHIYUANSHI_NUM,				 price=2888   ,dhnum=5},
	[5]={name="星石",			 id=const.PP_CHUNJIEJUHUI_XINGSHI_NUM,		    		 price=2888   ,dhnum=5},	
	[6]={name="装备灵魂石(500)", id=const.PP_CHUNJIEJUHUI_500ZHUANGBEILINGHUNSHI_NUM,  	 price=3888   ,dhnum=5},	
	[7]={name="天书精华",		 id=const.PP_CHUNJIEJUHUIT_TIANSHUJINGHUA_NUM,	  		 price=2888   ,dhnum=5},
	[8]={name="天蚕精华",		 id=const.PP_CHUNJIEJUHUI_TIANCANJINGHUA_NUM,			 price=2888   ,dhnum=5},
	};

function chunjiejuhui_click(player,actionset,panelid,actionid)
	if(util.ppn(player,const.PP_CHUNJIEJUHUI_TODAY)~=today())then
		player:set_param(const.PP_CHUNJIEJUHUI_TODAY,today());
		for i=1,8 do
			player:set_param(chunjiejuhui_shop_items[i].id,0);
		end
	end
	for i=1,8 do
		if(actionid== "btncjjh"..i)then
			if activity.isChunJieJuHui() then
				if(player:num_bag_black()>1)then
					if(util.ppn(player,chunjiejuhui_shop_items[i].id)<chunjiejuhui_shop_items[i].dhnum)then
						if(player:get_vcoin()>=chunjiejuhui_shop_items[i].price)then
							player:sub_vcoin(chunjiejuhui_shop_items[i].price,"chunjiejuhui"..i);
							player:add_item(chunjiejuhui_shop_items[i].name,1,1);
							player:set_param(chunjiejuhui_shop_items[i].id,util.ppn(player,chunjiejuhui_shop_items[i].id)+1);
							player:alert(1,1,"恭喜您成功购买:[<b><font color='#00ff00'>"..chunjiejuhui_shop_items[i].name.."</font></b>]");
						else
							player:alert(1,1,"元宝不足"..chunjiejuhui_shop_items[i].price..",无法购买！");
						end
					else
						player:alert(1,1,chunjiejuhui_shop_items[i].name.."每日只能购买["..chunjiejuhui_shop_items[i].dhnum.."]次");
					end
				else
					player:alert(1,1,"您的背包不足一格 请先行整理");
				end
				break;
			else
				player:alert(1,1,"当前不在活动日期内!");
			end
			
		end
	end
	freshCJJHyuanbao(player);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
ckpanel.add_listener(ACTIONSET_NAME,chunjiejuhui_click);

function freshCJJHyuanbao(player)
	local num=player:get_vcoin();
	player:set_panel_data("panelchunjiejuhui","chunjiejuhuiYB","text",num);
end