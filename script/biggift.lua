module(..., package.seeall)
--首充大礼面板
local ACTIONSET_NAME="biggift";
local PANEL_ACTIONSET_NAME="panelBigGift";

local itb={[1]=1,[2]=1,[3]=1,[4]=1,[5]=1,[6]=1,[7]=2,[8]=2,[9]=2};
local item_table={
	[1] = {{30016,1,0},{41020,1,0},{71030,1,0},{61026,2,0},{51032,2,0},{91010,1,0},{101010,1,0},{10140,1,0},{15037,1,1},{18002,1,1}},
	[2] = {{35016,1,0},{41020,1,0},{71030,1,0},{61026,2,0},{51032,2,0},{91010,1,0},{101010,1,0},{10140,1,0},{15037,1,1},{18002,1,1}},
	[3] = {{30017,1,0},{41021,1,0},{71031,1,0},{61027,2,0},{51033,2,0},{91011,1,0},{101011,1,0},{10140,1,0},{15037,1,1},{18002,1,1}},
	[4] = {{35017,1,0},{41021,1,0},{71031,1,0},{61027,2,0},{51033,2,0},{91011,1,0},{101011,1,0},{10140,1,0},{15037,1,1},{18002,1,1}},
	[5] = {{30018,1,0},{41022,1,0},{71032,1,0},{61028,2,0},{51034,2,0},{91012,1,0},{101012,1,0},{10140,1,0},{15037,1,1},{18002,1,1}},
	[6] = {{35018,1,0},{41022,1,0},{71032,1,0},{61028,2,0},{51034,2,0},{91012,1,0},{101012,1,0},{10140,1,0},{15037,1,1},{18002,1,1}},

	[7] = {{10134,1,1},{10141,1,1},{10140,1,1},{10139,1,1},{15010,1,1},{15010,1,1},{15011,1,1},{15011,1,1},{10132,1,1},{10131,1,1}},
	[8] = {{10134,1,1},{10141,1,1},{10140,1,1},{10139,1,1},{15010,1,1},{15010,1,1},{15011,1,1},{15011,1,1},{10132,1,1},{10131,1,1}},
	[9] = {{10134,1,1},{10141,1,1},{10140,1,1},{10139,1,1},{15010,1,1},{15010,1,1},{15011,1,1},{15011,1,1},{10132,1,1},{10131,1,1}},
};

local name={
	[1]={"豪华大礼包",998},
	[2]={"充值大礼包(1000元)",100000},
};
local need_bag={
	[1]=12,
	[2]=10,
};
local bg_image={
	[1]="bigbg/bigbag2.png",
	[2]="bigbg/bigbag3.png",
};
local info_text={
	[1]="<font color='#ffff00'>新区超级豪华大礼包,助您成就王城霸业!</font><br><br><font color='#ff0000'>领取只需[998]元宝,超值优惠,千万别错过!</font>",
	[2]=" ",
};

function fresh_biggift_info(player,index)
	player:set_param(const.PP_HELP_BIGGIFT,index);
	for i=1,10 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"bgImage","imgid",bg_image[itb[index]]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"bgift"..i,"visible","false");
	end
	for i=1,#bg_image do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnGetGift"..i,"visible","false");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"btnGetGift"..index,"visible","true");
	--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	if index>=7 and index<=9 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"giftinfo","htmlText","<font color='#ffff00'>您当前已累计充值[<font color='#ff00ff'>"..player:get_vcoin_accu().."</font>]元宝! </font><br><br><font color='#ff0000'>累计充值达到[<font color='#ff00ff'>100000</font>]元宝即可领取!</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"giftinfo","htmlText",info_text[itb[index]]);
	end

	for i=1,#item_table[index] do
		player:push_item_info(item_table[index][i][1]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"bgift"..i,"visible","true");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"bgift"..i,"num",""..item_table[index][i][2]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"bgift"..i,"typeid",item_table[index][i][1]);
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function show_panel(player,index,flag)
	if flag>0 then
		fresh_biggift_info(player,index);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelBigGift","panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panelBigGift","panel_visible","false");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function process_biggift(player,actionset,panelid,actionid)
	if actionid == "btnGoVcoin" then
		player:open_panel(122);
		return;
	end
	if actionid == "btnGetGift" then
		local index=util.ppn(player,const.PP_HELP_BIGGIFT);
		if index<=0 then
			return;
		end
		if itb[index]==1 then
			if player:get_vcoin() >= name[itb[index]][2] then
				if player:num_item(name[itb[index]][1],1) >= 1 then
					if player:num_bag_black() >= need_bag[itb[index]] then
						player:remove_item(name[itb[index]][1],1);
						player:sub_vcoin(name[itb[index]][2],"haohualibao");
						for i=1,#item_table[index] do
							player:add_item_log(item_table[index][i][1],201,item_table[index][i][2],item_table[index][i][3]);
						end
						player:alert(11,1,"恭喜您成功领取"..name[itb[index]][1]);
						show_panel(player,0,0);
					else
						player:alert(1,1,"您的背包不足"..need_bag[itb[index]].."格,您也不想这些好东西都掉下地吧!");
					end
				else
					player:alert(1,1,"你的"..name[itb[index]][1].."呢???");
				end
			else
				player:alert(1,1,"您的元宝不足["..name[itb[index]][2].."],无法领取");
			end
		elseif itb[index]==2 then
			if util.ppn(player,const.PP_HELP_CZLIBAO1000)==0 then
				if player:get_vcoin_accu() >= name[itb[index]][2] then
					if player:num_item(name[itb[index]][1],1) >= 1 then
						if player:num_bag_black() >= need_bag[itb[index]] then
							player:remove_item(name[itb[index]][1],1);
							player:set_param(const.PP_HELP_CZLIBAO1000,1);
							for i=1,#item_table[index] do
								player:add_item_log(item_table[index][i][1],202,item_table[index][i][2],item_table[index][i][3]);
							end
							player:alert(11,1,"恭喜您成功领取"..name[itb[index]][1]);
							show_panel(player,0,0);
						else
							player:alert(1,1,"您的背包不足"..need_bag[itb[index]].."格,您也不想这些好东西都掉下地吧!");
						end
					else
						player:alert(1,1,"你的"..name[itb[index]][1].."呢???");
					end
				else
					player:alert(11,1,"您累计充值元宝不足["..name[itb[index]][2].."],无法领取");
				end
			else
				player:remove_item(name[itb[index]][1],1);
				show_panel(player,0,0);
				player:alert(1,1,"对不起,您已经领取过"..name[itb[index]][1]..",无法重复领取!");
			end
		end
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_biggift);

