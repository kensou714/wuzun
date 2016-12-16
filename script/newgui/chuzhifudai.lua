module(..., package.seeall)
local ACTIONSET_NAME="chuzhifudai";
local PANEL_ACTIONSET_NAME="panelchuzhifudai";

local CHUZHI_hd_shop_items={
	[1]={name="玄晶福袋",	 id=const.PP_CHUZHI_LIMIT1,	 price=28888 ,     dhnum=1},
	[2]={name="宝石福袋",	 id=const.PP_CHUZHI_LIMIT2,	 price=28888 ,     dhnum=1},
	[3]={name="天书福袋",	 id=const.PP_CHUZHI_LIMIT3,  price=12888 ,     dhnum=1},
	[4]={name="玉佩福袋",	 id=const.PP_CHUZHI_LIMIT4,  price=12888 ,     dhnum=1},
	[5]={name="披风福袋",	 id=const.PP_CHUZHI_LIMIT5,	 price=12888 ,     dhnum=1},
	[6]={name="护符福袋",	 id=const.PP_CHUZHI_LIMIT6,  price=12888 ,     dhnum=1},	
	[7]={name="经验福袋",	 id=const.PP_CHUZHI_LIMIT7,	 price=1688  ,     dhnum=1},	
	[8]={name="灵羽福袋",	 id=const.PP_CHUZHI_LIMIT8,	 price=38888 ,     dhnum=1},
	};

function chuzhifudai_click( player,actionset,panelid,actionid )
	if activity.isChunZhiFuDai() then
		for i=1,10 do
			if actionid== "btnCZFD"..i then
				if player:get_vcoin()>=CHUZHI_hd_shop_items[i].price then
					if player:num_bag_black()>1 then
						if util.ppn(player,CHUZHI_hd_shop_items[i].id)<CHUZHI_hd_shop_items[i].dhnum then
							player:sub_vcoin(CHUZHI_hd_shop_items[i].price,"newyear_hd_"..i);
							player:add_item(CHUZHI_hd_shop_items[i].name,1,1);
							player:alert(1,1,"获得物品:[<b><font color='#00ff00'>"..CHUZHI_hd_shop_items[i].name.."</font></b>]");
							player:set_param(CHUZHI_hd_shop_items[i].id,util.ppn(player,CHUZHI_hd_shop_items[i].id)+1);
						else
							player:alert(1,1,"每个福袋只能购买一次噢!");
						end
					else
						player:alert(1,1,"您的背包不足一格 请先行整理!");
					end
				else
					player:alert(1,1,"元宝不足!");
				end
			end
		end
	else
		player:alert(1,1,"不在活动开启时间范围内 时间:2015-02-14 至 2015-02-17");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,chuzhifudai_click);

