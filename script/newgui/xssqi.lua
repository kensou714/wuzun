module(..., package.seeall)

local ACTIONSET_NAME="xstj";
local PANEL_ACTIONSET_NAME="panelxstj";


function process_shenqi_xbuy(player,actionset,panelid,actionid)
	if not activity.isXSshenqiSale() then
		player:alert(1,1,"活动有效时间已过,感谢您的参与!");
		return;
	end
	if actionid=="bnsqjl1" then
		if util.ppn(player,const.PP_SHENQI_SALE_1) ~= today() then
			if player:get_vcoin() >= 1588 then
				player:sub_vcoin(1588,"SQjflb");
				player:set_param(const.PP_SHENQI_SALE_1,today());
				player:add_item("绑定元宝",1000,1);
				player:add_item("四级生命玄晶",1);
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+10);
				--server.log_count(3,const.PPC_TEJIEJIFEN,10);
				player:alert(11,0,"获得[绑定元宝*1000，神器积分*10，四级生命玄晶*1]");
				player:alert(11,0,"神器积分可到神器使者升级神器");
				player:alert(11,0,"玄晶放入玄晶合成面板玄晶仓库");
			else
				player:alert(11,1,"元宝不足1588,无法购买!");
			end
		else
			player:alert(11,1,"该礼包每日限购一个!");
		end
	elseif actionid=="bnsqjl2" then
		if util.ppn(player,const.PP_SHENQI_SALE_2) ~= today() then
			if player:get_vcoin() >= 4588 then
				player:sub_vcoin(4588,"SQjflb");
				player:set_param(const.PP_SHENQI_SALE_2,today());
				player:add_item("绑定元宝",2000,1);
				player:add_item("五级生命玄晶",1);
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+35);
				--server.log_count(3,const.PPC_TEJIEJIFEN,35);
				player:alert(11,0,"获得[绑定元宝*2000，神器积分*35，五级生命玄晶*1]");
				player:alert(11,0,"神器积分可到神器使者升级神器");
				player:alert(11,0,"玄晶放入玄晶合成面板玄晶仓库");
			else
				player:alert(11,1,"元宝不足4588,无法购买!");
			end
		else
			player:alert(11,1,"该礼包每日限购一个!");
		end
	elseif actionid=="bnsqjl3" then
		if util.ppn(player,const.PP_SHENQI_SALE_3) ~= today() then
			if player:get_vcoin() >= 18888 then
				player:sub_vcoin(18888,"SQjflb");
				player:set_param(const.PP_SHENQI_SALE_3,today());
				player:add_item("绑定元宝",5000,1);
				player:add_item("六级生命玄晶",1);
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+150);
				--server.log_count(3,const.PPC_TEJIEJIFEN,150);
				player:alert(11,0,"获得[绑定元宝*5000，神器积分*150，六级生命玄晶*1]");
				player:alert(11,0,"神器积分可到神器使者升级神器");
				player:alert(11,0,"玄晶放入玄晶合成面板玄晶仓库");
			else
				player:alert(11,1,"元宝不足18888,无法购买!");
			end
		else
			player:alert(11,1,"该礼包每日限购一个!");
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_shenqi_xbuy);