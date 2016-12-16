module(..., package.seeall)
local ACTIONSET_NAME="YearEnd";
local PANEL_ACTIONSET_NAME="panelYearEnd";

function process_YearEnd(player,actionset,panelid,actionid,data)
	if actionid == "btnYearEndSD" then
		btnYearEndSD(player);
		return;
	end
	
	if actionid == "btnYearEndCZ" then
		btnYearEndCZ(player);
		return;
	end
	if actionid == "btnYearEndSJ1" then
		btnYearEndSJ1(player);
		return;
	end
	if actionid == "btnYearEndSJ2" then
		btnYearEndSJ2(player);
		return;
	end
	if actionid == "btnYearEndDYSJ" then
		btnYearEndDYSJ(player);
		return;
	end


	if actionid == "btnYearEndCZCX1" then
		btnYearEndCZCX1(player);
		return;
	end
	if actionid == "btnYearEndCZCX2" then
		btnYearEndCZCX2(player);
		return;
	end
	if actionid == "btnYearEndCZCX3" then
		btnYearEndCZCX3(player);
		return;
	end
	if actionid == "btnYearEndCZCX4" then
		btnYearEndCZCX4(player);
		return;
	end
	if actionid == "btnYearEndCZCX5" then
		btnYearEndCZCX5(player);
		return;
	end
	if actionid == "btnYearEndCZCX6" then
		btnYearEndCZCX6(player);
		return;
	end



	if actionid == "btnYearEndSCZK1" then
		btnYearEndSCZK1(player);
		return;
	end
	if actionid == "btnYearEndSCZK2" then
		btnYearEndSCZK2(player);
		return;
	end
	if actionid == "btnYearEndSCZK3" then
		btnYearEndSCZK3(player);
		return;
	end
	if actionid == "btnYearEndSCZK4" then
		btnYearEndSCZK4(player);
		return;
	end
	if actionid == "btnYearEndSCZK5" then
		btnYearEndSCZK5(player);
		return;
	end
	if actionid == "btnYearEndSCZK6" then
		btnYearEndSCZK6(player);
		return;
	end



	if actionid == "btnYearEndLPJJ1" then
		btnYearEndLPJJ1(player);
		return;
	end
	if actionid == "btnYearEndLPJJ2" then
		btnYearEndLPJJ2(player);
		return;
	end
	if actionid == "btnYearEndLPJJ3" then
		btnYearEndLPJJ3(player);
		return;
	end
	if actionid == "btnYearEndLPJJ4" then
		btnYearEndLPJJ4(player);
		return;
	end
	if actionid == "btnYearEndLPJJ5" then
		btnYearEndLPJJ5(player);
		return;
	end
	if actionid == "btnYearEndLPJJ6" then
		btnYearEndLPJJ6(player);
		return;
	end
	if actionid == "btnYearEndLPJJ7" then
		btnYearEndLPJJ7(player);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_YearEnd);

function btnYearEndSD(player)
	if ymd() >= 20131221 and ymd() <= 20131225 then
		if player:get_level() >= 50 then
			if player:num_bag_black() >= 5 then
				if util.ppn(player,const.PP_BAIFUHAOHUALB) <= 25 then
					player:set_param(const.PP_BAIFUHAOHUALB,26);
					player:add_item("四倍宝典",1,1);
					player:add_item("聚灵珠",1,1);
					player:add_item("魂石令牌(500)",1,1);
					player:add_item("坐骑经验丹(大)",1,1);
					player:add_item("荣誉令牌(10000)",1,1);
					player:add_vcoin_bind(2000);
					player:add_gamemoney_bind(500000);
					player:alert(11,1,"成功领取[圣诞感恩回馈礼包]!");
					player:alert(10,0,"四倍宝典       *1");
					player:alert(10,0,"聚 灵 珠       *1");
					player:alert(10,0,"魂石令牌(500)  *1");
					player:alert(10,0,"坐骑经验丹(大) *1");
					player:alert(10,0,"荣誉令牌(10000)*1");
					player:alert(10,0,"绑定元宝    *2000");
					player:alert(10,0,"绑定金币  *500000");
				else
					player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
				end
			else
				player:alert(1,1,"背包空格不足5格,无法领取!");
			end
		else
			player:alert(1,1,"领取该礼包需要等级达到50级以上!");
		end
	else
		player:alert(1,1,"该礼包只可在12月21日-12月25日领取!");
	end
end

function btnYearEndCZ(player)
	if util.ppn(player,const.PP_131204CHONGZHITJ) >= 10000 then
		if player:num_bag_black() >= 6 then
			if util.ppn(player,const.PP_CHONGZHIHUIKUILB) <= 13 then
				player:set_param(const.PP_CHONGZHIHUIKUILB,14);
				player:add_item("六级灵羽",1,1);
				player:add_item("聚灵珠",1,1);
				player:add_item("进阶石",100,1);
				player:add_item("镇魔令大包",1,1);
				player:add_item("经验珠(5000万)",1,1);
				player:add_vcoin_bind(3000);
				player:add_gamemoney_bind(500000);
				player:alert(11,1,"成功领取[充值回馈豪华礼包]!");
				player:alert(10,0,"六级灵羽       *1");
				player:alert(10,0,"聚 灵 珠       *1");
				player:alert(10,0,"进 阶 石     *100");
				player:alert(10,0,"镇魔令大包     *1");
				player:alert(10,0,"经验珠(5000万) *1");
				player:alert(10,0,"绑定元宝    *3000");
				player:alert(10,0,"绑定金币 *1000000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足6格,无法领取!");
		end
	else
	player:alert(1,1,"您已充值的元宝不足10000,无法领取该礼包!!")
	end
end

function btnYearEndSJ1(player)
	if ymd() >= 20131221 and ymd() <= 20131225 then
		if util.ppn(player,const.PP_JINGYANDAN5000) <= 2 then
			if player:get_vcoin() >= 990 then
				if player:num_bag_black() >= 1 then
					player:set_param(const.PP_JINGYANDAN5000,util.ppn(player,const.PP_JINGYANDAN5000)+1);
					player:sub_vcoin(990,"shangcheng");
					player:add_item("经验珠(5000万)",1,1);
					player:alert(11,1,"成功使用[990]元宝购买[经验珠(5000万)]!");
				else
					player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
				end
			else
				player:alert(11,1,"您的元宝不足[990],无法购买[经验珠(5000万)]!");
			end
		else
			player:alert(11,1,"每人每天最多只可购买3颗[经验珠(5000万)]!");
		end
	else
	player:alert(1,1,"该物品只可在12月21日-12月25日购买!");
	end
end

function btnYearEndSJ2(player)
	if ymd() >= 20131221 and ymd() <= 20131225 then
		if util.ppn(player,const.PP_JINGYANDAN2000) <= 2 then
			if player:get_vcoin() >= 400 then
				if player:num_bag_black() >= 1 then
					player:set_param(const.PP_JINGYANDAN2000,util.ppn(player,const.PP_JINGYANDAN2000)+1);
					player:sub_vcoin(400,"shangcheng");
					player:add_item("经验珠(2000万)",1,1);
					player:alert(11,1,"成功使用[400]元宝购买[经验珠(2000万)]!");
				else
					player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
				end
			else
				player:alert(11,1,"您的元宝不足[400],无法购买[经验珠(2000万)]!");
			end
		else
			player:alert(11,1,"每人每天最多只可购买3颗[经验珠(2000万)]!");
		end
	else
	player:alert(1,1,"该物品只可在12月21日-12月25日购买!");
	end
end

function btnYearEndDYSJ(player)
	if util.ppn(player,const.PP_131204CHONGZHITJ) >= 2000000 then
		if util.ppn(player,const.PP_0802CHONGZHILB) <= 17 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_0802CHONGZHILB,18);
				player:add_item("镇西白虎王戒卷",1,1);
				newgui.yearend.fresh_DYSJ_info(player);
				player:alert(11,1,"成功领取[<font color='#ee00ee'>镇西白虎王戒卷</font>]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
			end
		else
		player:alert(1,1,"您已经领取过该卷轴,无法再领取!")
		end
	else
	player:alert(1,1,"您已充值的元宝不足2000000,无法领取!")
	end
end

function fresh_DYSJ_info(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"yearendDYSJ","text",util.ppn(player,const.PP_131204CHONGZHITJ));
end

function btnYearEndCZCX1(player)
	ybgmdj(player,350,"五级宝石",1);
end
function btnYearEndCZCX2(player)
	ybgmdj(player,1200,"六级宝石",1);
end
function btnYearEndCZCX3(player)
	ybgmdj(player,3960,"七级宝石",1);
end
function btnYearEndCZCX4(player)
	ybgmdj(player,13068,"八级宝石",1);
end
function btnYearEndCZCX5(player)
	ybgmdj(player,39204,"九级宝石",1);
end
function btnYearEndCZCX6(player)
	 ybgmdj(player,600,"幸运神符(30%)",1);
end


function btnYearEndSCZK1(player)
	ybgmdj(player,1200,"幸运神符(40%)",2); 
end
function btnYearEndSCZK2(player)
	ybgmdj(player,2400,"幸运神符(50%)",2);
end
function btnYearEndSCZK3(player)
	ybgmdj(player,24000,"幸运神符(100%)",2);
end
function btnYearEndSCZK4(player)
	ybgmdj(player,2342,"中级融合符",2);
end
function btnYearEndSCZK5(player)
	 ybgmdj(player,8100,"高级融合符",2);
end
function btnYearEndSCZK6(player)
	 ybgmdj(player,16200,"超级融合符",2); 
end

function ybgmdj(player,a,b,c)
	if ymd() >= 20131221 and ymd() <= 20131225 then
		if player:get_vcoin() >= a then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(a,"shangcheng");
				player:add_item(b,1);
				player:alert(11,1,"成功使用["..a.."]元宝购买["..b.."]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足["..a.."],无法购买["..b.."]!");
		end
	else
	player:alert(1,1,"该物品只可在12月21日-12月25日购买!");
	end
end


function btnYearEndLPJJ1(player)
	if player:num_item("紫阳令(6级)",10) >= 1 or player:num_item("混元令(7级)",10) >= 1 or player:num_item("伏龙令(8级)",10) >= 1 or player:num_item("通天令(9级)",10) >= 1 or player:num_item("刑天令(10级)",10) >= 1 or player:num_item("虎魄天晶令(11级)",10) >= 1 or player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO1) == 0 then
				player:set_param(const.PP_LINGPAILIBAO1,1);
				player:add_item("六级宝石",1,1);
				player:alert(11,1,"成功领取[紫阳令礼包]");
				player:alert(11,0,"获得:六级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[紫阳令(6级)],无法领取!")
	end
end
function btnYearEndLPJJ2(player)
	if player:num_item("混元令(7级)",10) >= 1 or player:num_item("伏龙令(8级)",10) >= 1 or player:num_item("通天令(9级)",10) >= 1 or player:num_item("刑天令(10级)",10) >= 1 or player:num_item("虎魄天晶令(11级)",10) >= 1 or player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO2) == 0 then
				player:set_param(const.PP_LINGPAILIBAO2,1);
				player:add_item("七级宝石",1,1);
				player:alert(11,1,"成功领取[混元令礼包]");
				player:alert(11,0,"获得:七级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[混元令(7级)],无法领取!")
	end
end
function btnYearEndLPJJ3(player)
	if player:num_item("伏龙令(8级)",10) >= 1 or player:num_item("通天令(9级)",10) >= 1 or player:num_item("刑天令(10级)",10) >= 1 or player:num_item("虎魄天晶令(11级)",10) >= 1 or player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO3) == 0 then
				player:set_param(const.PP_LINGPAILIBAO3,1);
				player:add_item("八级宝石",1,1);
				player:alert(11,1,"成功领取[伏龙令礼包]");
				player:alert(11,0,"获得:八级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[伏龙令(8级)],无法领取!")
	end
end
function btnYearEndLPJJ4(player)
	if player:num_item("通天令(9级)",10) >= 1 or player:num_item("刑天令(10级)",10) >= 1 or player:num_item("虎魄天晶令(11级)",10) >= 1 or player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO4) == 0 then
				player:set_param(const.PP_LINGPAILIBAO4,1);
				player:add_item("九级宝石",1,1);
				player:alert(11,1,"成功领取[通天令礼包]");
				player:alert(11,0,"获得:九级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[通天令(9级)],无法领取!")
	end
end
function btnYearEndLPJJ5(player)
	if player:num_item("刑天令(10级)",10) >= 1 or player:num_item("虎魄天晶令(11级)",10) >= 1 or player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO5) == 0 then
				player:set_param(const.PP_LINGPAILIBAO5,1);
				player:add_item("十级宝石",1,1);
				player:alert(11,1,"成功领取[刑天令礼包]");
				player:alert(11,0,"获得:十级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[刑天令(10级)],无法领取!")
	end
end
function btnYearEndLPJJ6(player)
	if player:num_item("虎魄天晶令(11级)",10) >= 1 or player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO6) == 0 then
				player:set_param(const.PP_LINGPAILIBAO6,1);
				player:add_item("十一级宝石",1,1);
				player:alert(11,1,"成功领取[虎魄天晶令礼包]");
				player:alert(11,0,"获得:十一级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[虎魄天晶令(11级)],无法领取!")
	end
end
function btnYearEndLPJJ7(player)
	if player:num_item("凛日星幻令(12级)",10) >= 1 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_LINGPAILIBAO7) == 0 then
				player:set_param(const.PP_LINGPAILIBAO7,1);
				player:add_item("十二级宝石",1,1);
				player:alert(11,1,"成功领取[凛日星幻令礼包]");
				player:alert(11,0,"获得:十二级宝石*1");
			else
				player:alert(1,1,"对不起,您已经领取过该物品,无法再次领取!!")
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您没有佩戴令牌或者令牌等级没有达到[凛日星幻令(12级)],无法领取!")
	end
end