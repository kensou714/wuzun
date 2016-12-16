module(..., package.seeall)
local ACTIONSET_NAME="suimojuhui";
local PANEL_ACTIONSET_NAME="panelsuimojuhui";


local heishi_shop_items={
	[1]={name="聚灵珠",				id=15011,	price=688},
	[2]={name="红色龙蛋",			id=10307,	price=11888},
	[3]={name="银色弓箭",			id=10308,	price=11888},
	[4]={name="羊驼娃娃",			id=10314,	price=11888},
	[5]={name="麒麟果",				id=10322,	price=11888},
	[6]={name="斯巴达之盾",			id=10323,	price=11888},
	[7]={name="万圣节彩袍(永久)",	id=150005,	price=10800},
	[8]={name="万圣节彩衣(永久)",	id=155005,	price=10800},
	[9]={name="烈焰死神袍(永久)",	id=150007,	price=10800},
	[10]={name="烈焰死神衣(永久)",	id=155007,	price=10800},
	[11]={name="侠客行袍(永久)",	id=150009,	price=10800},
	[12]={name="侠客行衣(永久)",	id=155009,	price=10800},
	[13]={name="世界杯战袍(永久)",	id=150011,	price=10800},
	[14]={name="世界杯战衣(永久)",	id=155011,	price=10800},
	[15]={name="足球先生(永久)",	id=150013,	price=10800},
	[16]={name="足球宝贝(永久)",	id=155013,	price=10800},
	[17]={name="傲世妖狐(永久)",	id=150015,	price=10800},
	[18]={name="魅世妖狐(永久)",	id=155015,	price=10800},
	[19]={name="魔道教师(永久)",	id=150018,	price=10800},
	[20]={name="魔魂教师(永久)",	id=155018,	price=10800},
	[21]={name="斯巴达战甲(永久)",	id=150021,	price=10800},
	[22]={name="斯巴达战衣(永久)",	id=155021,	price=10800},
	};
function suimojuhui_click(player,actionset,panelid,actionid)
	if string.sub(actionid,1,5)=="btnsm" then
		local index= tonumber(string.sub(actionid,6));
		suimoBuy(player,index);
	end
end
ckpanel.add_listener(ACTIONSET_NAME,suimojuhui_click);

function suimoBuy(player,index)
	local data=heishi_shop_items[index];
	if data then
		if activity.isSuiMoJuHui() then
			if player:get_vcoin() >= data.price then
				if player:num_bag_black() >= 1 then
					player:sub_vcoin(data.price);
					player:add_item(data.id, 1);
					player:alert(1,1,"恭喜您成功购买"..data.name.."!");
				else
					player:alert(1,1,"您的背包不足1格,无法购买!");
				end
			else
				player:alert(1,1,"您的元宝不足"..data.price.."，无法购买!");
			end
		else
			player:alert(1,1,"当前不在活动日期内!");
		end
	end
	freshSMyuanbao(player);
	player:push_ckpanel_data("suimojuhui","panelsuimojuhui");	
end

function freshSMyuanbao(player)
	local num=player:get_vcoin();
	player:set_panel_data("panelsuimojuhui","suimoYB","text",num);
end