module(..., package.seeall)

function cjbclb(player)
	player:set_param(const.PP_HF_CJ_NUM,util.ppn(player,const.PP_HF_CJ_NUM)+1);
	--newgui.hequ.freshChoujNum(player);
	player:alert(1,1,"恭喜您获得一次幸运抽奖机会,祝您游戏愉快!");
end

function wangzhelb(player)
	if util.ppn(player,const.PP_WANGZHELIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_WANGZHELIBAO,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("五级灵珠",1,1);
			player:add_item("坐骑经验丹(大)",3,1);
			player:add_vcoin_bind(3000);
			player:alert(11,1,"成功打开[王者礼包]!");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"八倍宝典        *1");
			player:alert(10,0,"五级灵珠        *1");
			player:alert(10,0,"坐骑经验丹(大)  *3");
			player:alert(10,0,"绑定元宝     *3000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function zhizunlb(player)
	if util.ppn(player,const.PP_ZHIZUNLIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_ZHIZUNLIBAO,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("女儿红(20年)",1,1);
			player:add_item("荣誉令牌(10000)",3,1);
			player:add_vcoin_bind(2000);
			player:alert(11,1,"成功打开[至尊礼包]!");
			player:alert(10,0,"八倍宝典        *1");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"女儿红(20年)    *1");
			player:alert(10,0,"荣誉令牌(10000) *3");
			player:alert(10,0,"绑定元宝     *2000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function bazhelb(player)
	if util.ppn(player,const.PP_BAZHELIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_BAZHELIBAO,1);
			player:add_item("进阶石",100,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("紫金镖令",1,1);
			player:add_item("魂石令牌(500)",3,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功打开[霸者礼包]!");
			player:alert(10,0,"进 阶 石      *100");
			player:alert(10,0,"八倍宝典        *1");
			player:alert(10,0,"紫金镖令        *1");
			player:alert(10,0,"魂石令牌(500)   *3");
			player:alert(10,0,"绑定元宝     *1000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function xinnian265glb(player)
	if util.ppn(player,const.PP_265GXINNIANLIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_265GXINNIANLIBAO,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("进阶石",50,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功打开[霸者礼包]!");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"进 阶 石       *50");
			player:alert(10,0,"八倍宝典        *1");
			player:alert(10,0,"玛雅令牌        *1");
			player:alert(10,0,"绑定元宝     *1000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function yuandanlb(player)
	if util.ppn(player,const.PP_YUANDANLIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_YUANDANLIBAO,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("进阶石",100,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功打开[元旦豪华礼包]!");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"进阶石        *100");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function jinshanznqlb(player)
	if util.ppn(player,const.PP_JINSHANZNQLB) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_JINSHANZNQLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("进阶石",100,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功打开[金山周年庆特权礼包]!");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"进阶石        *100");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function wangxinlibao(player)
	if util.ppn(player,const.PP_WANGXINLIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_WANGXINLIBAO,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功打开[武尊旺信礼包]!");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end



function zhuanshulibao(player)
	if util.ppn(player,const.PP_ZHUANSHULIBAO) <= 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_ZHUANSHULIBAO,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("成就令牌",1,1);
			player:add_item("修为令牌",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功打开[37wan专属礼包]!");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"玛雅令牌        *1");
			player:alert(10,0,"成就令牌        *1");
			player:alert(10,0,"修为令牌        *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end




function baifuyylb(player)
	if util.ppn(player,const.PP_BAIFUYYLB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_BAIFUYYLB,1);
			player:add_item("进阶石",50,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(2000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功打开[百服预约礼包]!");
			player:alert(10,0,"进 阶 石       *50");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"绑定元宝     *2000");
			player:alert(10,0,"绑定金币   *500000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function guanggunjielb(player)
	if util.ppn(player,const.PP_WANSHENGJIELIBAO) <= 1 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_WANSHENGJIELIBAO,2);
			player:add_item("进阶石",100,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功打开[光棍节礼包]!");
			player:alert(10,0,"进 阶 石      *100");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
			player:alert(10,0,"绑定金币   *500000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function wanshengjielb(player)
	if util.ppn(player,const.PP_WANSHENGJIELIBAO) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_WANSHENGJIELIBAO,1);
			player:add_item("进阶石",100,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功打开[万圣节礼包]!");
			player:alert(10,0,"进 阶 石      *100");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
			player:alert(10,0,"绑定金币   *500000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function showlibao(player)
	if util.ppn(player,const.PP_SHOWLIBAO) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_SHOWLIBAO,1);
			player:add_item("进阶石",50,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功打开[SHOW礼包]!");
			player:alert(10,0,"进 阶 石       *50");
			player:alert(10,0,"镇魔令大包      *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
			player:alert(10,0,"绑定金币   *500000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function xinniantblb(player)
	if util.ppn(player,const.PP_XINNIANTBLB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_XINNIANTBLB,1);
			player:add_item("祈灵玉",5,1);
			player:add_item("镇魔令大包",5,1);
			player:add_item("幸运神符(30%)",5,1);
			player:add_item("经验珠(5000万)",3,1);
			player:alert(11,1,"成功打开[新年特别礼包]!");
			player:alert(10,0,"祈灵玉          *5");
			player:alert(10,0,"镇魔令大包      *5");
			player:alert(10,0,"幸运神符(30%)   *5");
			player:alert(10,0,"经验珠(5000万)  *3");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function youxijiekhlb(player)
	if util.ppn(player,const.PP_YOUXIJIEKHLB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_YOUXIJIEKHLB,1);
			player:add_item("祈灵玉",2,1);
			player:add_item("紫金镖令",2,1);
			player:add_item("四级物防玄晶",1);
			player:add_item("四级魔防玄晶",1);
			player:alert(11,1,"成功打开[游戏节狂欢礼包]!");
			player:alert(10,0,"祈灵玉          *2");
			player:alert(10,0,"紫金镖令        *2");
			player:alert(10,0,"四级物防玄晶    *1");
			player:alert(10,0,"四级魔防玄晶    *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function dujialibaoa07073(player)
	if util.ppn(player,const.PP_07073DUJIALIBAOA) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_07073DUJIALIBAOA,1);
			player:add_item("修为令牌",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"成功打开[07073独家礼包A]!");
			player:alert(10,0,"修为令牌        *1");
			player:alert(10,0,"聚灵珠          *1");
			player:alert(10,0,"祈福令牌(小)    *1");
			player:alert(10,0,"玛雅令牌        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function dujialibaob07073(player)
	if util.ppn(player,const.PP_07073DUJIALIBAOB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_07073DUJIALIBAOB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("进阶石包",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"成功打开[07073独家礼包B]!");
			player:alert(10,0,"修为令牌        *1");
			player:alert(10,0,"进阶石包        *1");
			player:alert(10,0,"祈福令牌(小)    *1");
			player:alert(10,0,"四倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function dujialibaoc07073(player)
	if util.ppn(player,const.PP_07073DUJIALIBAOC) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_07073DUJIALIBAOC,1);
			player:add_item("修为令牌",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("三级魔防玄晶",1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"成功打开[07073独家礼包C]!");
			player:alert(10,0,"修为令牌        *1");
			player:alert(10,0,"聚灵珠          *1");
			player:alert(10,0,"三级魔防玄晶    *1");
			player:alert(10,0,"八倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function dujialibaoa37wan(player)
	if util.ppn(player,const.PP_37WANDUJIALIBAOA) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_37WANDUJIALIBAOA,1);
			player:add_item("修为令牌",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"成功打开[37WAN独家礼包A]!");
			player:alert(10,0,"修为令牌        *1");
			player:alert(10,0,"聚灵珠          *1");
			player:alert(10,0,"玛雅令牌        *1");
			player:alert(10,0,"八倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function dujialibaob37wan(player)
	if util.ppn(player,const.PP_37WANDUJIALIBAOB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_37WANDUJIALIBAOB,1);
			player:add_item("五级生命玄晶",1);
			player:add_item("进阶石包",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"成功打开[37WAN独家礼包B]!");
			player:alert(10,0,"五级生命玄晶    *1");
			player:alert(10,0,"进阶石包        *1");
			player:alert(10,0,"玛雅令牌        *1");
			player:alert(10,0,"八倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function dujialibaoc37wan(player)
	if util.ppn(player,const.PP_37WANDUJIALIBAOC) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_37WANDUJIALIBAOC,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"成功打开[37WAN独家礼包C]!");
			player:alert(10,0,"聚灵珠          *1");
			player:alert(10,0,"祈福令牌(小)    *1");
			player:alert(10,0,"玛雅令牌        *1");
			player:alert(10,0,"四倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function jinshanbjlb(player)
	if util.ppn(player,const.PP_JINSHANBJLB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_JINSHANBJLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"成功打开[金山铂金礼包]!");
			player:alert(10,0,"聚灵珠          *1");
			player:alert(10,0,"祈福令牌(小)    *1");
			player:alert(10,0,"玛雅令牌        *1");
			player:alert(10,0,"四倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function jinshanhylb(player)
	if util.ppn(player,const.PP_JINSHANHYLB) == 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_JINSHANHYLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("四级物防玄晶",1,1);
			player:add_item("四倍宝典",1,1);
                        player:add_item("三级生命玄晶",1,1);
			player:alert(11,1,"成功打开[金山会员超级礼包]!");
			player:alert(10,0,"聚灵珠          *1");
			player:alert(10,0,"祈福令牌(中)    *1");
			player:alert(10,0,"四级物防玄晶    *1");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"三级生命玄晶    *1");
		else
		player:alert(1,1,"您的背包不足5格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function chengzhangjjlb(player)
	if util.ppn(player,const.PP_CHENGZHANGJJLB) == 0 then
		if player:get_vcoin() >= 998 then
			if player:num_bag_black() >= 7 then
				player:sub_vcoin(998,"chengzhang");
				player:set_param(const.PP_CHENGZHANGJJLB,1);
				player:add_item("坐骑经验丹(大)",3,1);
				player:add_item("进阶石",150,1);
				player:add_item("修为令牌",3,1);
				player:add_item("魂石令牌(500)",3,1);
                                player:add_item("八倍宝典",1,1);
				player:add_item("聚灵珠",1,1);
				player:alert(11,1,"成功打开[成长进阶礼包]!");
				player:alert(10,0,"坐骑经验丹(大)  *3");
				player:alert(10,0,"进阶石          *150");
				player:alert(10,0,"修为令牌        *3");
				player:alert(10,0,"魂石令牌(500)   *3");
                                player:alert(10,0,"八倍宝典        *1");
				player:alert(10,0,"聚灵珠          *1");
			else
			player:alert(1,1,"您的背包不足7格,无法领取!");
			return 0;
			end
		else
			player:alert(1,1,"元宝不足998,无法打开哦!");
			return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function zssbao(player)
	if util.ppn(player,const.PP_ZHUANSHENGSHILB) <= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_ZHUANSHENGSHILB,util.ppn(player,const.PP_ZHUANSHENGSHILB)+1);
			player:add_item("转生石",1,1);
			player:alert(11,1,"成功打开[转生石包]");
			player:alert(10,0,"获得物品: 转生石*1");
			player:alert(10,0,"今天已打开"..util.ppn(player,const.PP_ZHUANSHENGSHILB).."次转生石包!");
		else
		player:alert(1,1,"您的背包不足1格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"每人每天最多只可打开2次[转生石包]!");
	return 0;
	end
end


function guoqingqd1tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",10,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功打开[国庆签到1天礼包]!");
			player:alert(10,0,"进 阶 石       *10");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1000");
			player:alert(10,0,"绑定金币   *500000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function guoqingqd2tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",55,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1500);
			player:add_gamemoney_bind(600000);
			player:alert(11,1,"成功打开[国庆签到2天礼包]!");
			player:alert(10,0,"进 阶 石       *55");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *1");
			player:alert(10,0,"坐骑经验丹(大)  *1");
			player:alert(10,0,"荣誉令牌(10000) *1");
			player:alert(10,0,"绑定元宝     *1500");
			player:alert(10,0,"绑定金币   *600000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function guoqingqd3tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",100,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",2,1);
			player:add_item("坐骑经验丹(大)",2,1);
			player:add_item("荣誉令牌(10000)",2,1);
			player:add_vcoin_bind(1500);
			player:add_gamemoney_bind(600000);
			player:alert(11,1,"成功打开[国庆签到3天礼包]!");
			player:alert(10,0,"进 阶 石      *100");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *2");
			player:alert(10,0,"坐骑经验丹(大)  *2");
			player:alert(10,0,"荣誉令牌(10000) *2");
			player:alert(10,0,"绑定元宝     *1500");
			player:alert(10,0,"绑定金币   *600000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function guoqingqd4tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",150,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",2,1);
			player:add_item("坐骑经验丹(大)",2,1);
			player:add_item("荣誉令牌(10000)",2,1);
			player:add_vcoin_bind(2000);
			player:add_gamemoney_bind(600000);
			player:alert(11,1,"成功打开[国庆签到4天礼包]!");
			player:alert(10,0,"进 阶 石      *150");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *2");
			player:alert(10,0,"坐骑经验丹(大)  *2");
			player:alert(10,0,"荣誉令牌(10000) *2");
			player:alert(10,0,"绑定元宝     *2000");
			player:alert(10,0,"绑定金币   *600000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function guoqingqd5tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",200,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",2,1);
			player:add_item("坐骑经验丹(大)",2,1);
			player:add_item("荣誉令牌(10000)",2,1);
			player:add_vcoin_bind(2500);
			player:add_gamemoney_bind(600000);
			player:alert(11,1,"成功打开[国庆签到5天礼包]!");
			player:alert(10,0,"进 阶 石      *200");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *2");
			player:alert(10,0,"坐骑经验丹(大)  *2");
			player:alert(10,0,"荣誉令牌(10000) *2");
			player:alert(10,0,"绑定元宝     *2500");
			player:alert(10,0,"绑定金币   *600000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function guoqingqd6tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",200,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("魂石令牌(500)",3,1);
			player:add_item("坐骑经验丹(大)",3,1);
			player:add_item("荣誉令牌(10000)",3,1);
			player:add_vcoin_bind(2500);
			player:add_gamemoney_bind(600000);
			player:alert(11,1,"成功打开[国庆签到6天礼包]!");
			player:alert(10,0,"进 阶 石      *200");
			player:alert(10,0,"四倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *3");
			player:alert(10,0,"坐骑经验丹(大)  *3");
			player:alert(10,0,"荣誉令牌(10000) *3");
			player:alert(10,0,"绑定元宝     *2500");
			player:alert(10,0,"绑定金币   *600000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end


function guoqingqd7tlb(player)
	if util.ppn(player,const.PP_GUOQINGQDLB) <= 6 then
		if player:num_bag_black() >= 7 then
			player:set_param(const.PP_GUOQINGQDLB,util.ppn(player,const.PP_GUOQINGQDLB)+1);
			player:add_item("进阶石",300,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("魂石令牌(500)",5,1);
			player:add_item("坐骑经验丹(大)",5,1);
			player:add_item("荣誉令牌(10000)",5,1);
			player:add_vcoin_bind(3000);
			player:add_gamemoney_bind(1000000);
			player:alert(11,1,"成功打开[国庆签到7天礼包]!");
			player:alert(10,0,"进 阶 石      *300");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"八倍宝典        *1");
			player:alert(10,0,"魂石令牌(500)   *5");
			player:alert(10,0,"坐骑经验丹(大)  *5");
			player:alert(10,0,"荣誉令牌(10000) *5");
			player:alert(10,0,"绑定元宝     *3000");
			player:alert(10,0,"绑定金币  *1000000");
		else
		player:alert(1,1,"您的背包不足7格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function xyzhounianqlb(player)
	if util.ppn(player,const.PP_XYZHOUNIANQLB) <= 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_XYZHOUNIANQLB,1);
			player:add_item("进阶石",100,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("魂石令牌(500)",3,1);
			player:add_item("坐骑经验丹(大)",3,1);
			player:add_item("荣誉令牌(10000)",3,1);
			player:add_vcoin_bind(3000);
			player:add_gamemoney_bind(1000000);
			player:alert(11,1,"成功打开[XY周年庆礼包]!");
			player:alert(10,0,"进 阶 石      *100");
			player:alert(10,0,"聚 灵 珠        *1");
			player:alert(10,0,"魂石令牌(500)   *3");
			player:alert(10,0,"坐骑经验丹(大)  *3");
			player:alert(10,0,"荣誉令牌(10000) *3");
			player:alert(10,0,"绑定元宝     *3000");
			player:alert(10,0,"绑定金币  *1000000");
		else
		player:alert(1,1,"您的背包不足6格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function jjscxb(player)
	if player:num_bag_black() >= 2 then
		player:add_item("进阶石",1000,1);
		player:alert(11,1,"成功打开进阶石促销包!");
		player:alert(11,0,"获得物品:进阶石x1000");
	else
		player:alert(1,1,"您的背包不足2格,无法领取!");
		return 0;
	end
end

function gqjqhglb(player)
	if ymd() >= 20131008 then
		if util.ppn(player,const.PP_GUOQINGHGLB) <= 2 then
			if player:num_bag_black() >= 6 then
				player:set_param(const.PP_GUOQINGHGLB,3);
				player:add_item("八倍宝典",1,1);
				player:add_item("聚灵珠",1,1);
				player:add_item("魂石令牌(500)",10,1);
				player:add_item("坐骑经验丹(大)",10,1);
				player:add_item("荣誉令牌(10000)",10,1);
				player:add_vcoin_bind(20000);
				player:add_gamemoney_bind(5000000);
				player:alert(11,1,"成功打开[国庆假期回归礼包]!");
				player:alert(10,0,"八倍宝典        *1");
				player:alert(10,0,"聚 灵 珠        *1");
				player:alert(10,0,"魂石令牌(500)  *10");
				player:alert(10,0,"坐骑经验丹(大) *10");
				player:alert(10,0,"荣誉令牌(10000)*10");
				player:alert(10,0,"绑定元宝    *20000");
				player:alert(10,0,"绑定金币  *5000000");
			else
			player:alert(1,1,"背包空格不足6格,无法领取!");
			return 0;
			end
		else
		player:alert(1,1,"该礼包每人只可打开1次哦?")
		end
	else
	player:alert(1,1,"对不起,该礼包只可在10月8日以后打开!")
	return 0;
	end
end




function jslbpflb(player)
	if util.ppn(player,const.PP_JSLBPIFULB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_JSLBPIFULB,1);
			player:add_item("进阶石",100,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功领取[金山猎豹皮肤礼包]!");
			player:alert(11,0,"进 阶 石     x100");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"绑定金币  x500000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"金山猎豹皮肤礼包每人只可使用一次!")
	end
end



function yygamelb1(player)
	if util.ppn(player,const.PP_YYGAMELB1) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_YYGAMELB1,1);
			player:add_item("进阶石",100,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功领取[YYGAME武尊礼包]!");
			player:alert(11,0,"进 阶 石     x100");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"绑定金币  x500000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"YYGAME武尊礼包每人只可使用一次!")
	end
end





function yygamelb2(player)
	if util.ppn(player,const.PP_YYGAMELB2) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_YYGAMELB2,1);
			player:add_item("进阶石",200,1);
			player:add_item("聚灵珠",3,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("镇魔令大包",3,1);
			player:add_item("坐骑经验丹(大)",3,1);
			player:add_vcoin_bind(2000);
			player:add_gamemoney_bind(800000);
			player:alert(11,1,"成功领取[YYGAME武尊尊贵礼包]!");
			player:alert(11,0,"进 阶 石     x200");
			player:alert(11,0,"聚 灵 珠       x3");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x3");
			player:alert(11,0,"坐骑经验丹(大) x3");
			player:alert(11,0,"绑定元宝    x2000");
			player:alert(11,0,"绑定金币  x800000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"YYGAME武尊尊贵礼包每人只可使用一次!")
	end
end





function yygamelb3(player)
	if util.ppn(player,const.PP_YYGAMELB3) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_YYGAMELB3,1);
			player:add_item("进阶石",500,1);
			player:add_item("聚灵珠",5,1);
			player:add_item("八倍宝典",2,1);
			player:add_item("镇魔令大包",5,1);
			player:add_item("坐骑经验丹(大)",5,1);
			player:add_vcoin_bind(5000);
			player:add_gamemoney_bind(1000000);
			player:alert(11,1,"成功领取[YYGAME武尊至尊礼包]!");
			player:alert(11,0,"进 阶 石     x500");
			player:alert(11,0,"聚 灵 珠       x5");
			player:alert(11,0,"八倍宝典       x2");
			player:alert(11,0,"镇魔令大包     x5");
			player:alert(11,0,"坐骑经验丹(大) x5");
			player:alert(11,0,"绑定元宝    x5000");
			player:alert(11,0,"绑定金币 x1000000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"YYGAME武尊至尊礼包每人只可使用一次!")
	end
end





function zhongqiulb(player)
	if util.ppn(player,const.PP_ZHONGQIULB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_ZHONGQIULB,1);
			player:add_item("进阶石",200,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功领取中秋节礼包!");
			player:alert(11,0,"进 阶 石     x200");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"魂石令牌(500)  x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"绑定金币  x500000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"中秋节礼包每人只可使用一次!")
	end
end


function qiandao7libao(player)
	if util.ppn(player,const.PP_QIANDAO7LB) == 0 then
		if player:num_bag_black() >= 8 then
			player:set_param(const.PP_QIANDAO7LB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("进阶石",10,1);
			player:add_item("招财神符",2,1);
			player:add_item("双倍宝典",1,1);
			player:add_item("镇魔令包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_vcoin_bind(500);
			player:alert(11,1,"成功领取[7天签到]礼包!");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"进 阶 石      x10");
			player:alert(11,0,"招财神符       x2");
			player:alert(11,0,"双倍宝典       x1");
			player:alert(11,0,"镇魔令包       x1");
			player:alert(11,0,"魂石令牌(500)  x1");
			player:alert(11,0,"绑定元宝     x500");
		else
			player:alert(1,1,"您的背包不足8格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[7天签到]礼包每人只可使用一次!")
	end
end




function qiandao15libao(player)
	if util.ppn(player,const.PP_QIANDAO15LB) == 0 then
		if player:num_bag_black() >= 8 then
			player:set_param(const.PP_QIANDAO15LB,1);
			player:add_item("聚灵珠",2,1);
			player:add_item("进阶石",50,1);
			player:add_item("招财神符",5,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功领取[15天签到]礼包!");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"进 阶 石      x50");
			player:alert(11,0,"招财神符       x5");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x1000");
		else
			player:alert(1,1,"您的背包不足8格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[15天签到]礼包每人只可使用一次!")
	end
end




function qiandao40libao(player)
	if util.ppn(player,const.PP_QIANDAO40LB) == 0 then
		if player:num_bag_black() >= 8 then
			player:set_param(const.PP_QIANDAO40LB,1);
			player:add_item("聚灵珠",4,1);
			player:add_item("进阶石",200,1);
			player:add_item("招财神符",10,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("镇魔令大包",5,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:add_vcoin_bind(1500);
			player:alert(11,1,"成功领取[40天签到]礼包!");
			player:alert(11,0,"聚 灵 珠       x4");
			player:alert(11,0,"进 阶 石     x200");
			player:alert(11,0,"招财神符      x10");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x5");
			player:alert(11,0,"荣誉令牌(10000)x1");
			player:alert(11,0,"绑定元宝    x1500");
		else
			player:alert(1,1,"您的背包不足8格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[40天签到]礼包每人只可使用一次!")
	end
end




function qiandao60libao(player)
	if util.ppn(player,const.PP_QIANDAO60LB) == 0 then
		if player:num_bag_black() >= 8 then
			player:set_param(const.PP_QIANDAO60LB,1);
			player:add_item("聚灵珠",8,1);
			player:add_item("进阶石",500,1);
			player:add_item("修为令牌",1,1);
			player:add_item("招财神符",20,1);
			player:add_item("八倍宝典",2,1);
			player:add_item("镇魔令大包",10,1);
			player:add_vcoin_bind(2000);
			player:alert(11,1,"成功领取[60天签到]礼包!");
			player:alert(11,0,"聚 灵 珠       x8");
			player:alert(11,0,"进 阶 石     x500");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"招财神符      x20");
			player:alert(11,0,"八倍宝典       x2");
			player:alert(11,0,"镇魔令大包    x10");
			player:alert(11,0,"绑定元宝    x2000");
		else
			player:alert(1,1,"您的背包不足8格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[60天签到]礼包每人只可使用一次!")
	end
end




function baifulb(player)
	if util.ppn(player,const.PP_BAIFULB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_BAIFULB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("修为令牌",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(2000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功领取百服礼包!");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x2000");
			player:alert(11,0,"绑定金币  x500000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"百服礼包每人只可使用一次!")
	end
end

function djlb9991(player)
	if util.ppn(player,const.PP_9991WANLB) == 0 then
		if player:num_bag_black() >= 9 then
			player:set_param(const.PP_9991WANLB,1);
			player:add_item("VIP会员(3天)",1,1);
			player:add_item("八倍宝典",2,1);
			player:add_item("聚灵珠",2,1);
			player:add_item("玛雅令牌",2,1);
			player:add_item("镇魔令大包",2,1);
			player:add_vcoin_bind(2000);
			player:alert(11,1,"成功领取[9991wan]独家礼包!");
			player:alert(11,0,"聚 灵 珠       x2");
			player:alert(11,0,"VIP会员(3天)   x1");
			player:alert(11,0,"八倍宝典       x2");
			player:alert(11,0,"玛雅令牌       x2");
			player:alert(11,0,"镇魔令大包     x2");
			player:alert(11,0,"绑定元宝    x2000");
		else
			player:alert(1,1,"您的背包不足9格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[9991wan]独家礼包每人只可使用一次!")
	end
end

function jjslb(player)
	if util.ppn(player,const.PP_JJSLB) ~= today()  then
		if player:num_bag_black() >= 2 then
			player:set_param(const.PP_JJSLB,today());
			player:add_item("进阶石",200,1);
			player:alert(11,1,"成功打开进阶石礼包!");
			player:alert(11,0,"获得物品:进阶石x200");
		else
			player:alert(1,1,"您的背包不足2格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"进阶石包每人每天只可使用一次!")
		return 0;
	end
end

function jjslb100(player)
		if player:num_bag_black() >= 2 then
			player:add_item("进阶石",100,1);
			player:alert(11,1,"成功打开进阶石包(100)!");
			player:alert(11,0,"获得物品:进阶石x100");
		else
			player:alert(1,1,"您的背包不足2格,无法领取!");
			return 0;
		end
end

function jjslb200(player)
		if player:num_bag_black() >= 2 then
			player:add_item("进阶石",200,1);
			player:alert(11,1,"成功打开进阶石包(200)!");
			player:alert(11,0,"获得物品:进阶石x200");
		else
			player:alert(1,1,"您的背包不足2格,无法领取!");
			return 0;
		end
end

function jjslb300(player)
		if player:num_bag_black() >= 2 then
			player:add_item("进阶石",300,1);
			player:alert(11,1,"成功打开进阶石包(300)!");
			player:alert(11,0,"获得物品:进阶石x300");
		else
			player:alert(1,1,"您的背包不足2格,无法领取!");
			return 0;
		end
end

function jjslb500(player)
		if player:num_bag_black() >= 2 then
			player:add_item("进阶石",500,1);
			player:alert(11,1,"成功打开进阶石包(500)!");
			player:alert(11,0,"获得物品:进阶石x500");
		else
			player:alert(1,1,"您的背包不足2格,无法领取!");
			return 0;
		end
end

function xdqslb(player)
	if util.ppn(player,const.PP_XDQSLB) == 0 then
		if player:num_bag_black() >= 8 then
			player:set_param(const.PP_XDQSLB,1);
			player:add_item("赎罪药水",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("招财神符",1,1);
			player:add_item("疗伤药(包)",5,1);
			player:add_vcoin_bind(500);
			player:alert(11,1,"成功领取兄弟情深礼包!");
			player:alert(11,0,"赎罪药水       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"招财神符       x1");
			player:alert(11,0,"疗伤药(包)     x5");
			player:alert(11,0,"绑定元宝     x500");
		else
			player:alert(1,1,"您的背包不足8格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"兄弟情深礼包每人只可使用一次!")
	end
end

function jf360dlb(player)
	if util.ppn(player,const.PP_360JFDLB) == 0 then
		if player:num_bag_black() >= 9 then
			player:set_param(const.PP_360JFDLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("招财神符",5,1);
			player:add_item("镇魔令大包",1,1);
			player:add_vcoin_bind(2000);
			player:alert(11,1,"成功领取360积分大礼包!");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"招财神符       x5");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"绑定元宝    x2000");
		else
			player:alert(1,1,"您的背包不足9格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"360积分大礼包每人只可使用一次!")
	end
end

function qx360lb(player)
	if util.ppn(player,const.PP_360QXLB) == 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_360QXLB,1);
			player:add_item("双倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("招财神符",2,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功领取360七夕礼包!");
			player:alert(11,0,"双倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"招财神符       x2");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x1000");
		else
			player:alert(1,1,"您的背包不足5格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"360七夕礼包每人只可使用一次!")
	end
end

function jf360lb(player)
	if util.ppn(player,const.PP_360JFLB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_360JFLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("修为令牌",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(2000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功领取360积分礼包!");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x2000");
			player:alert(11,0,"绑定金币  x500000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"360积分礼包每人只可使用一次!")
	end
end


function chinajoylb(player)
	if util.ppn(player,const.PP_CHINAJOYLB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_CHINAJOYLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("蓝玉镖令",1,1);
			player:add_item("女儿红(10年)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_vcoin_bind(2000);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"成功领取CHINAJOY礼包!");
			player:alert(11,0,"聚 灵 珠       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"蓝玉镖令       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"女儿红(10年)   x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"绑定元宝    x2000");
			player:alert(11,0,"绑定金币  x500000");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"CHINAJOY礼包每人只可使用一次!")
	end
end

function duanwulb(player)
	if util.ppn(player,const.PP_DUANWULB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_DUANWULB,1);
			player:add_item("双倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("蓝玉镖令",1,1);
			player:add_item("女儿红(10年)",1,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(300000);
			player:alert(11,1,"成功领取端午节礼包!");
			player:alert(11,0,"双倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"蓝玉镖令       x1");
			player:alert(11,0,"女儿红(10年)   x1");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"绑定金币  x300000");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"端午节礼包每人只可使用一次!")
	end
end

function zuanshilb(player)
	if util.ppn(player,const.PP_ZUANSHILB) == 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_ZUANSHILB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:alert(11,1,"成功领取钻石礼包!");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"魂石令牌(500)  x1");
		else
			player:alert(1,1,"您的背包不足5格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"钻石礼包每人只可使用一次!")
	end
end


function huangjinlb(player)
	if util.ppn(player,const.PP_HUANGJINLB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_HUANGJINLB,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:alert(11,1,"成功领取黄金礼包!");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"聚灵珠(小)     x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"荣誉令牌(10000)x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"黄金礼包每人只可使用一次!")
	end
end

function baiyinlb(player)
	if util.ppn(player,const.PP_BAIYINLB) == 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_BAIYINLB,1);
			player:add_item("双倍宝典",1,1);
			player:add_item("镇魔令包",1,1);
			player:add_item("成就令牌",2,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取白银礼包!");
			player:alert(11,0,"双倍宝典       x1");
			player:alert(11,0,"镇魔令包       x1");
			player:alert(11,0,"成就令牌       x2");
			player:alert(11,0,"坐骑经验丹(大) x1");
		else
			player:alert(1,1,"您的背包不足5格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"白银礼包每人只可使用一次!")
	end
end

function gwdyrlb(player)
	if util.ppn(player,const.PP_GWDAIYANRENLB) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_GWDAIYANRENLB,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:alert(11,1,"成功领取官网代言人礼包!");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"魂石令牌(500)  x1");
			player:alert(11,0,"荣誉令牌(10000)x1");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"官网代言人礼包每人只可使用一次!")
	end
end


function xsklb(player)
	if util.ppn(player,const.PP_XSKLB) == 0 then
		if player:num_bag_black() >= 10 then
			player:set_param(const.PP_XSKLB,1);
			player:add_item("还魂丹",1,1);
			player:add_item("招财神符",1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("魔血石[50W]",1,1);
			player:add_item("疗伤药(包)",5,1);
			player:add_item("双倍宝典",1,1);
			player:alert(11,1,"成功领取新手卡豪华礼包!");
			player:alert(11,0,"还魂丹      x1");
			player:alert(11,0,"招财神符    x1");
			player:alert(11,0,"玛雅令牌    x1");
			player:alert(11,0,"魔血石[50W] x1");
			player:alert(11,0,"疗伤药(包)  x5");
			player:alert(11,0,"双倍宝典    x1");
		else
			player:alert(1,1,"您的背包不足10格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"新手卡礼包每人只可使用一次!")
	end
end

function cbxlb(player)
	if util.ppn(player,const.PP_CBXLB) == 0 then
		if player:num_bag_black() >= 2 then
			if player:get_vcoin() >= 1500 then
				player:set_param(const.PP_CBXLB,1);
				player:sub_vcoin(1500,"choujiang");
				player:add_item("藏宝箱",10,1);
				player:alert(11,1,"使用1500元宝领取10个藏宝箱!");
			else
			player:alert(1,1,"您的元宝不足[1500],无法领取!");
			return 0;
			end
		else
			player:alert(1,1,"您的背包不足2格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"对不起,该礼包每人只可打开一次!")
	end
end

local hhlb={
	["warrior"]={["male"]=1,["female"]=2,},
	["wizard"]={["male"]=3,["female"]=4,},
	["taoist"]={["male"]=5,["female"]=6,},
};

function haohualb(player)
	biggift.show_panel(player,hhlb[player:get_job_name()][player:get_gender_name()],1);
	return 0;
end

local czlb={
	["warrior"]=7,
	["wizard"]=8,
	["taoist"]=9,
};

function cz1000(player)
	biggift.show_panel(player,czlb[player:get_job_name()],1);
	return 0;
end

function mtlb1(player)
	if util.ppn(player,const.PP_MEITILIBAO1) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_MEITILIBAO1,1);
			player:add_vcoin_bind(2000);
			player:add_item("聚灵珠(大)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:add_item("荣誉令牌(10000)",1,1);
			player:alert(11,1,"成功领取首服预约礼包!");
			player:alert(11,0,"绑定元宝    x2000");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"聚灵珠(大)     x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
			player:alert(11,0,"荣誉令牌(10000)x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"首服预约礼包每人只可使用一次!")
	end
end

function mtlb2(player)
	if util.ppn(player,const.PP_MEITILIBAO2) == 0 then
		if player:num_bag_black() >= 3 then
			player:set_param(const.PP_MEITILIBAO2,1);
			player:add_vcoin_bind(1500);
			player:add_gamemoney_bind(200000);
			player:add_item("四倍宝典",1,1);
			player:add_item("紫金镖令",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"成功领取265G独家礼包!");
			player:alert(11,0,"绑定元宝    x1500");
			player:alert(11,0,"绑定金币  x200000");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"紫金镖令       x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(1,1,"您的背包不足3格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"265G独家礼包每人只可使用一次!")
	end
end

function mtlb3(player)
	if util.ppn(player,const.PP_MEITILIBAO3) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_MEITILIBAO3,1);
			player:add_vcoin_bind(1000);
			player:add_item("赎罪药水",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("女儿红(20年)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取17173独家礼包!");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"赎罪药水       x1");
			player:alert(11,0,"聚灵珠(小)     x1");
			player:alert(11,0,"女儿红(20年)   x1");
			player:alert(11,0,"坐骑经验丹(大) x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"17173独家礼包每人只可使用一次!")
	end
end

function mtlb4(player)
	if util.ppn(player,const.PP_MEITILIBAO4) == 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_MEITILIBAO4,1);
			player:add_vcoin_bind(500);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",2,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("超级英雄帖",1,1);
			player:alert(11,1,"成功领取07073独家礼包!");
			player:alert(11,0,"绑定元宝   x500");
			player:alert(11,0,"四倍宝典     x1");
			player:alert(11,0,"玛雅令牌     x2");
			player:alert(11,0,"聚灵珠(小)   x1");
			player:alert(11,0,"超级英雄帖   x1");
		else
			player:alert(1,1,"您的背包不足5格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"07073独家礼包每人只可使用一次!")
	end
end

function mtlb5(player)
	if util.ppn(player,const.PP_MEITILIBAO5) == 0 then
		if player:num_bag_black() >= 5 then
			player:set_param(const.PP_MEITILIBAO5,1);
			player:add_vcoin_bind(1000);
			player:add_gamemoney_bind(1000000);
			player:add_item("玛雅令牌",2,1);
			player:add_item("魔血石[50W]",1,1);
			player:add_item("魂石令牌(500)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取多玩独家礼包!");
			player:alert(11,0,"绑定元宝       x500");
			player:alert(11,0,"绑定金币   x1000000");
			player:alert(11,0,"玛雅令牌         x2");
			player:alert(11,0,"魔血石[50W]      x1");
			player:alert(11,0,"魂石令牌(500)    x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足5格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"多玩独家礼包每人只可使用一次!")
	end
end

function mtlb6(player)
	if util.ppn(player,const.PP_MEITILIBAO6) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_MEITILIBAO6,1);
			player:add_vcoin_bind(1000);
			player:add_item("赎罪药水",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("女儿红(20年)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取腾讯独家礼包!");
			player:alert(11,0,"绑定元宝      x1000");
			player:alert(11,0,"赎罪药水         x1");
			player:alert(11,0,"聚灵珠(小)       x1");
			player:alert(11,0,"女儿红(20年)     x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"腾讯独家礼包每人只可使用一次!")
	end
end

function mtlb7(player)
	if util.ppn(player,const.PP_MEITILIBAO7) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_MEITILIBAO7,1);
			player:add_vcoin_bind(1000);
			player:add_item("赎罪药水",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("超级英雄帖",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取新浪独家礼包!");
			player:alert(11,0,"绑定元宝      x1000");
			player:alert(11,0,"赎罪药水         x1");
			player:alert(11,0,"聚灵珠(小)       x1");
			player:alert(11,0,"超级英雄帖       x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"新浪独家礼包每人只可使用一次!")
	end
end

function mtlb8(player)
	if util.ppn(player,const.PP_MEITILIBAO8) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_MEITILIBAO8,1);
			player:add_vcoin_bind(1000);
			player:add_item("赎罪药水",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("紫金镖令",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取媒体礼包!");
			player:alert(11,0,"绑定元宝      x1000");
			player:alert(11,0,"赎罪药水         x1");
			player:alert(11,0,"紫金镖令         x1");
			player:alert(11,0,"聚灵珠(小)       x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"媒体礼包每人只可使用一次!")
	end
end

function mtlb9(player)
	if util.ppn(player,const.PP_MEITILIBAO9) == 0 then
		if player:num_bag_black() >= 3 then
			player:set_param(const.PP_MEITILIBAO9,1);
			player:add_vcoin_bind(1000);
			player:add_item("四倍宝典",1,1);
			player:add_item("赎罪药水",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取公会礼包!");
			player:alert(11,0,"绑定元宝      x1000");
			player:alert(11,0,"四倍宝典         x1");
			player:alert(11,0,"赎罪药水         x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足3格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"公会礼包每人只可使用一次!")
	end
end

function shoujilb(player)
	if util.ppn(player,const.PP_SHOUJIBDLB) == 0 then
		if player:num_bag_black() >= 4 then
			local x={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};
			player:set_param(const.PP_SHOUJIBDLB,1);
			player:add_gamemoney_bind(200000);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item(x[player:get_job_name()],1,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"成功领取手机绑定礼包!");
			player:alert(11,0,x[player:get_job_name()].."           x1");
			player:alert(11,0,"四倍宝典         x1");
			player:alert(11,0,"玛雅令牌         x1");
			player:alert(11,0,"聚灵珠(小)       x1");
			player:alert(11,0,"绑定金币    x200000");
		else
			player:alert(1,1,"您的背包不足3格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"手机绑定礼包每人只可使用一次!")
	end
end

function mtlb10(player)
	if util.ppn(player,const.PP_MEITILIBAO10) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_MEITILIBAO10,1);
			player:add_vcoin_bind(1000);
			player:add_item("四倍宝典",1,1);
			player:add_item("女儿红(20年)",1,1);
			player:add_item("赎罪药水",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取[265G]战神礼包!");
			player:alert(11,0,"绑定元宝      x1000");
			player:alert(11,0,"四倍宝典         x1");
			player:alert(11,0,"赎罪药水         x1");
			player:alert(11,0,"女儿红(20年)     x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足4格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[265G]战神礼包每人只可使用一次!")
	end
end

function qrjlb(player)
	if util.ppn(player,const.PP_QINGRENJIELB) == 0 then
		if player:num_bag_black() >= 3 then
			player:set_param(const.PP_QINGRENJIELB,1);
			player:add_gamemoney_bind(200000);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("女儿红(20年)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取情人节礼包!");
			player:alert(11,0,"绑定金币    x200000");
			player:alert(11,0,"聚灵珠(小)       x1");
			player:alert(11,0,"女儿红(20年)     x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足3格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[情人节礼包]每人只可使用一次!")
	end
end

function mtlbjin(player)
	if util.ppn(player,const.PP_MEITILIBAOJIN) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_MEITILIBAOJIN,1);
			player:add_vcoin_bind(5000);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("女儿红(20年)",1,1);
			player:add_item("坐骑经验丹(大)",2,1);
			player:alert(11,1,"成功领取媒体礼包(金)!");
			player:alert(11,0,"绑定元宝      x5000");
			player:alert(11,0,"聚灵珠           x1");
			player:alert(11,0,"八倍宝典         x1");
			player:alert(11,0,"镇魔令大包       x1");
			player:alert(11,0,"女儿红(20年)     x1");
			player:alert(11,0,"坐骑经验丹(大)   x2");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[媒体礼包(金)]每人只可使用一次!")
	end
end

function mtlbyin(player)
	if util.ppn(player,const.PP_MEITILIBAOYIN) == 0 then
		if player:num_bag_black() >= 10 then
			player:set_param(const.PP_MEITILIBAOYIN,1);
			player:add_vcoin_bind(2000);
			player:add_item("镇魔令包",5,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:add_item("女儿红(10年)",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功领取媒体礼包(银)!");
			player:alert(11,0,"绑定元宝      x2000");
			player:alert(11,0,"镇魔令包         x5");
			player:alert(11,0,"玛雅令牌         x1");
			player:alert(11,0,"四倍宝典         x1");
			player:alert(11,0,"聚灵珠(小)       x1");
			player:alert(11,0,"女儿红(10年)     x1");
			player:alert(11,0,"坐骑经验丹(大)   x1");
		else
			player:alert(1,1,"您的背包不足10格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[媒体礼包(银)]每人只可使用一次!")
	end
end

function mtlbtong(player)
	if util.ppn(player,const.PP_MEITILIBAOTONG) == 0 then
		if player:num_bag_black() >= 6 then
			player:set_param(const.PP_MEITILIBAOTONG,1);
			player:add_vcoin_bind(1000);
			player:add_item("镇魔令包",3,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("双倍宝典",1,1);
			player:add_item("聚灵珠(小)",1,1);
			player:alert(11,1,"成功领取媒体礼包(铜)!");
			player:alert(11,0,"绑定元宝      x1000");
			player:alert(11,0,"镇魔令包         x3");
			player:alert(11,0,"玛雅令牌         x1");
			player:alert(11,0,"双倍宝典         x1");
			player:alert(11,0,"聚灵珠(小)       x1");
		else
			player:alert(1,1,"您的背包不足6格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[媒体礼包(铜)]每人只可使用一次!")
	end
end

function cjviplb(player)
	if util.ppn(player,const.PP_CHAOJIVIPLIBAO) == 0 then
		if player:num_bag_black() >= 13 then
			player:set_param(const.PP_CHAOJIVIPLIBAO,1);
			player:add_item("女儿红",5,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("双倍宝典",3,1);
			player:add_item("开心富贵虎",2,1);
			player:add_item("镇魔令包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功打开超级VIP礼包!");
		else
			player:alert(1,1,"您的背包不足13格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[超级VIP礼包]每人只可使用一次!")
	end
end

function cjviplb(player)
	if util.ppn(player,const.PP_CHAOJIVIPLIBAO) == 0 then
		if player:num_bag_black() >= 13 then
			player:set_param(const.PP_CHAOJIVIPLIBAO,1);
			player:add_item("女儿红",5,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("双倍宝典",3,1);
			player:add_item("开心富贵虎",2,1);
			player:add_item("镇魔令包",1,1);
			player:add_item("坐骑经验丹(大)",1,1);
			player:alert(11,1,"成功打开超级VIP礼包!");
		else
			player:alert(1,1,"您的背包不足13格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[超级VIP礼包]每人只可使用一次!")
	end
end

function cjvipsrlb(player)
	if util.ppn(player,const.PP_VIPSHENGRLIBAO) == 0 then
		if player:num_bag_black() >= 12 then
			player:set_param(const.PP_VIPSHENGRLIBAO,1);
			player:add_item("黄金镖令",3,1);
			player:add_item("双倍宝典",3,1);
			player:add_item("五级宝石",2,1);
			player:add_item("魔血石[50W]",1,1);
			player:add_item("坐骑经验丹(大)",3,1);
			player:alert(11,1,"成功打开超级VIP生日礼包!");
		else
			player:alert(1,1,"您的背包不足12格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"[超级VIP生日礼包]每人只可使用一次!")
	end
end

function choujianglb1(player)
	if player:num_bag_black() >= 3 then
		player:add_item("藏宝箱",10,1);
		player:add_item("魂石令牌(500)",5,1);
		player:alert(11,1,"成功打开黄金祝福礼包!");
		player:alert(11,0,"藏 宝 箱        x10");
		player:alert(11,0,"魂石令牌(500)    x5");
	else
	player:alert(1,1,"您的背包不足3格,无法领取!");
	return 0;
	end
end

function choujianglb2(player)
	if player:num_bag_black() >= 3 then
		player:add_item("藏宝箱",10,1);
		player:add_item("灵羽宝箱",1,1);
		player:alert(11,1,"成功打开幸运礼包(小)!");
		player:alert(11,0,"藏 宝 箱        x10");
		player:alert(11,0,"灵羽宝箱         x1");
	else
	player:alert(1,1,"您的背包不足3格,无法领取!");
	return 0;
	end
end

function choujianglb3(player)
	if player:num_bag_black() >= 3 then
		player:add_item("藏宝箱",15,1);
		player:add_item("灵羽宝箱",1,1);
		player:alert(11,1,"成功打开幸运礼包(中)!");
		player:alert(11,0,"藏 宝 箱        x15");
		player:alert(11,0,"灵羽宝箱         x1");
	else
	player:alert(1,1,"您的背包不足3格,无法领取!");
	return 0;
	end
end

function choujianglb4(player)
	if player:num_bag_black() >= 3 then
		player:add_item("藏宝箱",20,1);
		player:add_item("灵羽宝箱",3,1);
		player:alert(11,1,"成功打开幸运礼包(大)!");
		player:alert(11,0,"藏 宝 箱        x20");
		player:alert(11,0,"灵羽宝箱         x3");
	else
	player:alert(1,1,"您的背包不足3格,无法领取!");
	return 0;
	end
end

function choujianglb5(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("破天游龙刀·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>破天游龙刀·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("破天游龙刀·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>破天游龙刀·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("破天游龙刀·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>破天游龙刀·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function choujianglb6(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("惊世龙渊剑·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>惊世龙渊剑·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("惊世龙渊剑·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>惊世龙渊剑·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("惊世龙渊剑·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>惊世龙渊剑·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function choujianglb7(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("九黎诛仙剑·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>九黎诛仙剑·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("九黎诛仙剑·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>九黎诛仙剑·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("九黎诛仙剑·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>九黎诛仙剑·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function choujianglb8(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("龙皇离火剑·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>龙皇离火剑·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("龙皇离火剑·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>龙皇离火剑·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("龙皇离火剑·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>龙皇离火剑·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function choujianglb9(player)
	if player:num_bag_black() >= 1 then
		player:add_item("十级宝石",1,1);
		player:alert(11,1,"成功打开十级宝石礼包!");
		player:alert(11,0,"十级宝石         x1");
	else
	player:alert(1,1,"您的背包不足1格,无法领取!");
	return 0;
	end
end

function choujianglb10(player)
	if player:num_bag_black() >= 2 then
		player:add_item("经验珠(5000万)",10,1);
		player:alert(11,1,"成功打开超级经验礼包!");
		player:alert(11,0,"经验珠(5000万)    x10");
	else
	player:alert(1,1,"您的背包不足2格,无法领取!");
	return 0;
	end
end

function qhtqlb2(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_360TQLB2) == 0 then
			player:set_param(const.PP_360TQLB2,1);
			player:add_item("招财神符",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[360二级特权礼包]!");
			player:alert(11,0,"招财神符       x1");
			player:alert(11,0,"祈福令牌(小)    x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function qhtqlb6(player)
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_360TQLB6) == 0 then
			player:set_param(const.PP_360TQLB6,1);
			player:set_param(const.PP_360TEQUANCH,1);
			npc.renwu.fenghao.youxifh(player);
			player:add_item("金条",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("一级灵珠",40,1);
			player:add_item("进阶石包",1,1);
			player:alert(11,1,"恭喜你成功打开[360六级特权礼包]!");
			player:alert(11,0,"金条         x1");
			player:alert(11,0,"祈福令牌(小)    x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"一级灵珠       x40");
			player:alert(11,0,"进阶石包       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function qhtqlb7(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_360TQLB7) == 0 then
			player:set_param(const.PP_360TQLB7,1);
			player:set_param(const.PP_360TEQUANCH,1);
			npc.renwu.fenghao.youxifh(player);
			player:add_item("镇魔令大包",1,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("女儿红",30,1);
			player:add_vcoin_bind(500);
			player:alert(11,1,"恭喜你成功打开[360七级特权礼包]!");
			player:alert(11,0,"绑定元宝       x500");
			player:alert(11,0,"祈福令牌(中)   x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"镇魔令大包     x1");
			player:alert(11,0,"女儿红         x30");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function qhtqlb8(player)
	if player:num_bag_black() >= 7 then
		if util.ppn(player,const.PP_360TQLB8) == 0 then
			player:set_param(const.PP_360TQLB8,1);
			player:set_param(const.PP_360TEQUANCH,1);
			npc.renwu.fenghao.youxifh(player);
			player:add_item("金条",2,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("祈灵玉",1,1);
			player:add_item("随机传送石",40);
			player:add_item("修为令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[360八级特权礼包]!");
			player:alert(11,0,"金条         x2");
			player:alert(11,0,"祈福令牌(中)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"祈灵玉         x1");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"随机传送石     x40");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足7格,无法打开礼包!");
		return 0;
	end
end

function qhtqlb9(player)
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_360TQLB9) == 0 then
			player:set_param(const.PP_360TQLB9,1);
			player:set_param(const.PP_360TEQUANCH,1);
			npc.renwu.fenghao.youxifh(player);
			player:add_vcoin_bind(1000);
			player:add_item("祈福令牌(大)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("七彩石",1,1);
			player:add_item("五级生命玄晶",1);
			player:add_item("修为令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[360九级特权礼包]!");
			player:alert(11,0,"绑定元宝       x1000");
			player:alert(11,0,"祈福令牌(大)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"七彩石         x1");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"五级生命玄晶   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end


function yurenjielb(player)
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_YURENJIE) == 0 then
			player:set_param(const.PP_YURENJIE,1);
			player:add_vcoin_bind(1000);
			player:add_item("祈福令牌(大)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("五级生命玄晶",1);
			player:add_item("修为令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[愚人节礼包]!");
			player:alert(11,0,"绑定元宝       x1000");
			player:alert(11,0,"祈福令牌(大)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"五级生命玄晶   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function qhtqlb15(player)
	if player:num_bag_black() >= 6 then
		if util.ppn(player,const.PP_360TQLB15) == 0 then
			player:set_param(const.PP_360TQLB15,1);
			player:set_param(const.PP_360TEQUANCH,1);
			npc.renwu.fenghao.youxifh(player);
			player:add_item("金砖",1,1);
			player:add_item("祈福令牌(大)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("六级攻击玄晶",1);
			player:add_item("七级魔防玄晶",1);
			local job=player:get_job_name();
			if job=="warrior" then
				player:add_item("君王守卫·武威(360专属)",1);
				player:alert(11,0,"君王守卫·武威(360专属)    x1");
			end
			if job=="wizard" then
				player:add_item("君王守卫·烈焰(360专属)",1);
				player:alert(11,0,"君王守卫·烈焰(360专属)    x1");
			end
			if job=="taoist" then
				player:add_item("君王守卫·无极(360专属)",1);
				player:alert(11,0,"君王守卫·无极(360专属)    x1");
			end
			player:alert(11,1,"恭喜你成功打开[360十五级特权礼包]!");
			player:alert(11,0,"金砖         x1");
			player:alert(11,0,"祈福令牌(大)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"六级攻击玄晶   x1");
			player:alert(11,0,"七级魔防玄晶   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足6格,无法打开礼包!");
		return 0;
	end
end

function liebaohllb(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_LIEBAOHLLB) == 0 then
			player:set_param(const.PP_LIEBAOHLLB,1);
			player:add_item("招财神符",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[猎豹欢乐礼包]!");
			player:alert(11,0,"招财神符       x1");
			player:alert(11,0,"祈福令牌(小)    x1");
			player:alert(11,0,"四倍宝典       x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function liebaobflb(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_LIEBAOBFLB) == 0 then
			player:set_param(const.PP_LIEBAOBFLB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[猎豹缤纷礼包]!");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"祈福令牌(小    x1");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function liebaoczlb(player)
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_LIEBAOCZLB) == 0 then
			player:set_param(const.PP_LIEBAOCZLB,1);
			player:add_item("绑定元宝",1000,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("修为令牌",1,1);
                        player:add_item("五级生命玄晶",1,1);
			player:alert(11,1,"恭喜你成功打开[猎豹超值礼包]!");
			player:alert(11,0,"绑定元宝       x1000");
			player:alert(11,0,"祈福令牌(中)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"五级生命玄晶   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function liebaomhlb(player)
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_LIEBAOMHLB) == 0 then
			player:set_param(const.PP_LIEBAOMHLB,1);
			player:add_item("绑定元宝",2000,1);
			player:add_item("祈福令牌(大)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("祈灵玉",1,1);
                        player:add_item("五级攻击玄晶",1,1);
			player:alert(11,1,"恭喜你成功打开[猎豹梦幻礼包]!");
			player:alert(11,0,"绑定元宝       x2000");
			player:alert(11,0,"祈福令牌(大)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"祈灵玉         x1");
			player:alert(11,0,"五级攻击玄晶   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function haodongznlb(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_HAODONGZNLB) == 0 then
			player:set_param(const.PP_HAODONGZNLB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[5399周年礼包]!");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"祈福令牌(小    x1");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function kuaiwanznlb(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_KUAIWANZNLB) == 0 then
			player:set_param(const.PP_KUAIWANZNLB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[快玩周年礼包]!");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"祈福令牌(小    x1");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function zhounianqinglb(player)
	if util.ppn(player,const.PP_ZHOUNIANQINGLB) == 0 then
		if player:num_bag_black() >= 4 then
			player:set_param(const.PP_ZHOUNIANQINGLB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("进阶石包",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"成功打开[周年庆礼包]!");
			player:alert(10,0,"修为令牌        *1");
			player:alert(10,0,"进阶石包        *1");
			player:alert(10,0,"祈福令牌(小)    *1");
			player:alert(10,0,"四倍宝典        *1");
		else
		player:alert(1,1,"您的背包不足4格,无法领取!");
		return 0;
		end
	else
	player:alert(1,1,"想作弊,没门!");
	end
end

function jifenhuangjinlb(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_JIFENHUANGJINLB) == 0 then
			player:set_param(const.PP_JIFENHUANGJINLB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[积分商城黄金礼包]!");
			player:alert(11,0,"修为令牌       x1");
			player:alert(11,0,"祈福令牌(小)   x1");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"玛雅令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function jifenzuanshilb(player)
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_JIFENZUANSHILB) == 0 then
			player:set_param(const.PP_JIFENZUANSHILB,1);
			player:add_item("祈灵玉",1,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"恭喜你成功打开[积分商城钻石礼包]!");
			player:alert(11,0,"祈灵玉         x1");
			player:alert(11,0,"祈福令牌(中)   x1");
			player:alert(11,0,"聚灵珠         x1");
			player:alert(11,0,"八倍宝典       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function LieBaoVIPlb(player)	--金山猎豹VIP礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_LIEBAO_VIPLB) == 0 then
			player:set_param(const.PP_LIEBAO_VIPLB,1);
			player:add_item("祈灵玉",1,1);
			player:add_item("六级宝石",1,1);
			player:add_item("幸运神符(30%)",1,1);
			player:add_item("祈福令牌(大)",1,1);
			player:alert(11,1,"恭喜你成功打开[VIP礼包]!");
			player:alert(11,0,"祈灵玉         x1");
			player:alert(11,0,"六级宝石       x1");
			player:alert(11,0,"幸运神符(30%)  x1");
			player:alert(11,0,"祈福令牌(大)   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function DuanWuHuanLeLB(player)		--端午欢乐礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_DUANWU_HUANLELB) == 0 then
			player:set_param(const.PP_DUANWU_HUANLELB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[端午欢乐礼包]!");
			player:alert(11,0,"修为令牌      x1");
			player:alert(11,0,"祈福令牌(小)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"玛雅令牌      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function DuanWuXingFuLB(player)		--端午幸福礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_DUANWU_XINGFULB) == 0 then
			player:set_param(const.PP_DUANWU_XINGFULB,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"恭喜你成功打开[端午幸福礼包]!");
			player:alert(11,0,"镇魔令大包    x1");
			player:alert(11,0,"祈福令牌(小)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"四倍宝典      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function DuanWuHaoHuaLB(player)		--端午豪华礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_DUANWU_HAOHUALB) == 0 then
			player:set_param(const.PP_DUANWU_HAOHUALB,1);
			player:add_vcoin_bind(1000);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("修为令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[端午豪华礼包]!");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"祈福令牌(中)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"修为令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

local tMingRenTangLB = {
	{szLbName = "名人堂第一名礼包", nBagBlack = 8, award = {{name = "套装积分", num = 999}, {name = "十二级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 5}, {name = "名人卡", num = 1}, {name = "双倍经验卡(15天)", num = 1},},},
	{szLbName = "名人堂第二名礼包", nBagBlack = 6, award = {{name = "套装积分", num = 888}, {name = "十一级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 3}, {name = "名人卡", num = 1}, {name = "双倍经验卡(10天)", num = 1},},},
	{szLbName = "名人堂第三名礼包", nBagBlack = 5, award = {{name = "套装积分", num = 666}, {name = "十级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 2}, {name = "名人卡", num = 1}, {name = "双倍经验卡(7天)", num = 1},},},
	{szLbName = "名人堂第四~六名礼包", nBagBlack = 4, award = {{name = "套装积分", num = 555}, {name = "九级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 1}, {name = "名人卡", num = 1}, {name = "双倍经验卡(5天)", num = 1},},},
	{szLbName = "名人堂第七~十名礼包", nBagBlack = 4, award = {{name = "套装积分", num = 333}, {name = "九级攻击玄晶", num = 1}, {name = "真气丹(5000)", num = 1}, {name = "名人卡", num = 1}, {name = "双倍经验卡(3天)", num = 1},},},
	{szLbName = "名人堂参与礼包", nBagBlack = 4, award = {{name = "套装积分", num = 200}, {name = "八级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 3},},},
	{szLbName = "[37]名人堂七月礼包·一", nBagBlack = 10, award = {{name = "套装积分", num = 1111}, {name = "十二级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 5}, {name = "灵气珠(10000)", num = 2}, {name = "兽灵精华(10000)", num = 2}, {name = "名人卡", num = 1}, {name = "双倍经验卡(15天)", num = 1}, {name = "十一级灵羽", num = 1},},},
	{szLbName = "[37]名人堂七月礼包·二", nBagBlack = 8, award = {{name = "套装积分", num = 888}, {name = "十一级攻击玄晶", num = 1},{name = "真气丹(10000)", num = 3}, {name = "灵气珠(10000)", num = 1}, {name = "兽灵精华(10000)", num = 1}, {name = "名人卡", num = 1}, {name = "双倍经验卡(10天)", num = 1}, {name = "十级灵羽", num = 1},},},
	{szLbName = "[37]名人堂七月礼包·三", nBagBlack = 7, award = {{name = "套装积分", num = 666}, {name = "十级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 2}, {name = "灵气珠(1000)", num = 5}, {name = "兽灵精华(1000)", num = 5}, {name = "名人卡", num = 1}, {name = "双倍经验卡(7天)", num = 1}, {name = "九级灵羽", num = 1},},},
	{szLbName = "[37]名人堂七月礼包·四至六", nBagBlack = 6, award = {{name = "套装积分", num = 555}, {name = "九级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 1}, {name = "灵气珠(1000)", num = 3}, {name = "兽灵精华(1000)", num = 3}, {name = "名人卡", num = 1}, {name = "双倍经验卡(5天)", num = 1}, {name = "八级灵羽", num = 1},},},
	{szLbName = "[37]名人堂七月礼包·七至十", nBagBlack = 6, award = {{name = "套装积分", num = 333}, {name = "九级生命玄晶", num = 1}, {name = "真气丹(10000)", num = 1}, {name = "灵气珠(1000)", num = 2}, {name = "兽灵精华(1000)", num = 2}, {name = "名人卡", num = 1}, {name = "双倍经验卡(3天)", num = 1}, {name = "七级灵羽", num = 2},},},
	{szLbName = "[37]名人堂七月参与礼包", nBagBlack = 4, award = {{name = "套装积分", num = 200}, {name = "八级生命玄晶", num = 1}, {name = "真气丹(5000)", num = 1}, {name = "灵气珠(1000)", num = 1}, {name = "兽灵精华(1000)", num = 1}, {name = "七级灵羽", num = 1},},},
}

function MingRenTang1(player)		if MingRenTang(player,1) then return 1 else return 0 end	end
function MingRenTang2(player)		if MingRenTang(player,2) then return 1 else return 0 end	end
function MingRenTang3(player)		if MingRenTang(player,3) then return 1 else return 0 end	end
function MingRenTang4to6(player)	if MingRenTang(player,4) then return 1 else return 0 end	end
function MingRenTang7to10(player)	if MingRenTang(player,5) then return 1 else return 0 end	end
function MingRenTangCanYu(player)	if MingRenTang(player,6) then return 1 else return 0 end	end

function MingRenTang37July1(player)	if MingRenTang(player,7) then return 1 else return 0 end	end
function MingRenTang37July2(player)	if MingRenTang(player,8) then return 1 else return 0 end	end
function MingRenTang37July3(player)	if MingRenTang(player,9) then return 1 else return 0 end	end
function MingRenTang37July4(player)	if MingRenTang(player,10) then return 1 else return 0 end	end
function MingRenTang37July5(player)	if MingRenTang(player,11) then return 1 else return 0 end	end
function MingRenTang37July6(player)	if MingRenTang(player,12) then return 1 else return 0 end	end

function MingRenTang(player, nIndex)
	if player:num_bag_black() >= tMingRenTangLB[nIndex].nBagBlack then
		player:alert(11,1,"恭喜你成功打开["..tMingRenTangLB[nIndex].szLbName.."]!");
		player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)+tMingRenTangLB[nIndex].award[1].num);	 	--加套装积分
		player:alert(11,0,tMingRenTangLB[nIndex].award[1].name.." x "..tMingRenTangLB[nIndex].award[1].num);
		for i = 2, #tMingRenTangLB[nIndex].award do
			player:add_item(tMingRenTangLB[nIndex].award[i].name, tMingRenTangLB[nIndex].award[i].num, 1)
			player:alert(11, 0, tMingRenTangLB[nIndex].award[i].name.." x "..tMingRenTangLB[nIndex].award[i].num)
		end
		return true
	else
		player:alert(11,1,"对不起,您的背包不足"..tMingRenTangLB[nIndex].nBagBlack.."格,无法打开礼包!")
		return false
	end
end

function XiaRiHuanLeLB(player)		--夏日欢乐礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_XIARI_HUANLELB) == 0 then
			player:set_param(const.PP_XIARI_HUANLELB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[夏日欢乐礼包]!");
			player:alert(11,0,"修为令牌      x1");
			player:alert(11,0,"祈福令牌(小)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"玛雅令牌      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function XiaRiXingFuLB(player)		--夏日幸福礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_XIARI_XINGFULB) == 0 then
			player:set_param(const.PP_XIARI_XINGFULB,1);
			player:add_item("镇魔令大包",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("四倍宝典",1,1);
			player:alert(11,1,"恭喜你成功打开[夏日幸福礼包]!");
			player:alert(11,0,"镇魔令大包    x1");
			player:alert(11,0,"祈福令牌(小)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"四倍宝典      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function XiaRiHaoHuaLB(player)		--夏日豪华礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_XIARI_HAOHUALB) == 0 then
			player:set_param(const.PP_XIARI_HAOHUALB,1);
			player:add_vcoin_bind(1000);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("修为令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[夏日豪华礼包]!");
			player:alert(11,0,"绑定元宝    x1000");
			player:alert(11,0,"祈福令牌(中)   x1");
			player:alert(11,0,"八倍宝典       x1");
			player:alert(11,0,"修为令牌       x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function HZHuiGuiLB1(player)		if LQHuiGuiLB(player, "红钻礼包·一", 1) then return 1 else return 0 end		end
function HZHuiGuiLB2(player)		if LQHuiGuiLB(player, "红钻礼包·二", 1) then return 1 else return 0 end		end
function HZHuiGuiLB3(player)		if LQHuiGuiLB(player, "红钻礼包·三", 1) then return 1 else return 0 end		end
function HZHuiGuiLB4(player)		if LQHuiGuiLB(player, "红钻礼包·四", 1) then return 1 else return 0 end		end
function HZHuiGuiLB5(player)		if LQHuiGuiLB(player, "红钻礼包·五", 1) then return 1 else return 0 end		end
function HZHuiGuiLB6(player)		if LQHuiGuiLB(player, "红钻礼包·六", 1) then return 1 else return 0 end		end
function HZHuiGuiLB7(player)		if LQHuiGuiLB(player, "红钻礼包·七", 1) then return 1 else return 0 end		end
function HZHuiGuiLB8(player)		if LQHuiGuiLB(player, "红钻礼包·八", 1) then return 1 else return 0 end		end
function HZHuiGuiLB9(player)		if LQHuiGuiLB(player, "红钻礼包·九", 1)	then return 1 else return 0 end		end
function HZHuiGuiLB10(player)		if LQHuiGuiLB(player, "红钻礼包·十", 1) then return 1 else return 0 end		end
function HZHuiGuiLBXiaRi(player)	if LQHuiGuiLB(player, "夏日回归礼包", 1) then return 1 else return 0 end	end

function LQHuiGuiLB(player, szLbName, nMax)
	local tHuiGuiLB = {	["红钻礼包·一"] = {awardpcon = const.PP_HUIGUILB_HZ1, nBagBlack = 4, award = {{name = "绑定元宝", num = 100}, {name = "经验珠(2000万)", num = 1}, {name = "聚灵珠", num = 1}, {name = "镇魔令大包", num = 1}, {name = "二级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 1},},},
						["红钻礼包·二"] = {awardpcon = const.PP_HUIGUILB_HZ2, nBagBlack = 4, award = {{name = "绑定元宝", num = 500}, {name = "经验珠(2000万)", num = 2}, {name = "聚灵珠", num = 2}, {name = "镇魔令大包", num = 2}, {name = "三级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 2},},},
						["红钻礼包·三"] = {awardpcon = const.PP_HUIGUILB_HZ3, nBagBlack = 4, award = {{name = "绑定元宝", num = 1000}, {name = "经验珠(2000万)", num = 3}, {name = "聚灵珠", num = 3}, {name = "镇魔令大包", num = 3}, {name = "四级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 3},},},
						["红钻礼包·四"] = {awardpcon = const.PP_HUIGUILB_HZ4, nBagBlack = 4, award = {{name = "绑定元宝", num = 2000}, {name = "经验珠(5000万)", num = 2}, {name = "聚灵珠", num = 4}, {name = "镇魔令大包", num = 4}, {name = "五级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 5},},},
						["红钻礼包·五"] = {awardpcon = const.PP_HUIGUILB_HZ5, nBagBlack = 4, award = {{name = "绑定元宝", num = 3000}, {name = "经验珠(5000万)", num = 3}, {name = "聚灵珠", num = 5}, {name = "镇魔令大包", num = 5}, {name = "六级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 6},},},
						["红钻礼包·六"] = {awardpcon = const.PP_HUIGUILB_HZ6, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "经验珠(5000万)", num = 4}, {name = "聚灵珠", num = 6}, {name = "镇魔令大包", num = 6}, {name = "七级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 7},},},
						["红钻礼包·七"] = {awardpcon = const.PP_HUIGUILB_HZ7, nBagBlack = 4, award = {{name = "绑定元宝", num = 7500}, {name = "经验珠(5000万)", num = 5}, {name = "聚灵珠", num = 7}, {name = "镇魔令大包", num = 7}, {name = "八级攻击玄晶", num = 1}, {name = "真气丹(1000)", num = 8},},},
						["红钻礼包·八"] = {awardpcon = const.PP_HUIGUILB_HZ8, nBagBlack = 4, award = {{name = "绑定元宝", num = 10000}, {name = "经验珠(5000万)", num = 6}, {name = "聚灵珠", num = 8}, {name = "镇魔令大包", num = 8}, {name = "九级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 1},},},
						["红钻礼包·九"] = {awardpcon = const.PP_HUIGUILB_HZ9, nBagBlack = 5, award = {{name = "绑定元宝", num = 15000}, {name = "经验珠(5000万)", num = 8}, {name = "聚灵珠", num = 9}, {name = "镇魔令大包", num = 9}, {name = "十级攻击玄晶", num = 1}, {name = "真气丹(10000)", num = 2},},},
						["红钻礼包·十"] = {awardpcon = const.PP_HUIGUILB_HZ10, nBagBlack = 8, award = {{name = "绑定元宝", num = 20000}, {name = "经验珠(5000万)", num = 10}, {name = "聚灵珠", num = 10}, {name = "镇魔令大包", num = 10}, {name = "十级攻击玄晶", num = 2}, {name = "真气丹(10000)", num = 5},},},
						["夏日回归礼包"] = {awardpcon = const.PP_HUIGUILB_XIARI, nBagBlack = 6, award = {{name = "八倍宝典", num = 1}, {name = "聚灵珠", num = 1}, {name = "绑定元宝", num = 2000}, {name = "绑定金币", num = 1000000}, {name = "真气丹(1000)", num = 1}, {name = "灵气珠(1000)", num = 2}, {name = "金钟丹", num = 3}, {name = "铁布丹", num = 3},},},
						}
	if nMax > 0 then
		if util.ppn(player,tHuiGuiLB[szLbName].awardpcon) >= nMax then
			player:alert(11,1,"对不起，红钻等级礼包每人只可打开["..nMax.."]个!")
			return true
		end
	end
	if player:num_bag_black() >= tHuiGuiLB[szLbName].nBagBlack then
		player:alert(11,1,"恭喜你成功打开["..szLbName.."]!");
		if nMax > 0 then
			for k, v in pairs(tHuiGuiLB) do
				player:set_param(v.awardpcon,util.ppn(player,v.awardpcon)+1);				
			end
		end
		for i = 1, #tHuiGuiLB[szLbName].award do
			player:add_item(tHuiGuiLB[szLbName].award[i].name, tHuiGuiLB[szLbName].award[i].num, 1)
			player:alert(11, 0, tHuiGuiLB[szLbName].award[i].name.." x "..tHuiGuiLB[szLbName].award[i].num)
		end
		return true
	else
		player:alert(11,1,"对不起,您的背包不足"..tHuiGuiLB[szLbName].nBagBlack.."格,无法打开礼包!")
		return false
	end
end

function PingTai37A(player)			if CommonLQLB(player, "37平台A礼包", 1) then return 1 else return 0 end		end
function PingTai37B(player)			if CommonLQLB(player, "37平台B礼包", 1) then return 1 else return 0 end		end
function ChengZuanKaiTong(player)	if CommonLQLB(player, "橙钻开通礼包", 1) then return 1 else return 0 end	end
function LB5399VIP3(player)			if CommonLQLB(player, "5399VIP3礼包", 1) then return 1 else return 0 end	end
function SuperVIP2144(player)		if CommonLQLB(player, "2144武尊超级会员礼包", 1) then return 1 else return 0 end	end
function Birthday2144(player)		if CommonLQLB(player, "2144武尊生日礼包", 1) then return 1 else return 0 end	end
function ZhouNian5399(player)		if CommonLQLB(player, "5399武尊周年庆礼包", 1) then return 1 else return 0 end	end
function QiXi37Small(player)		if CommonLQLB(player, "37七夕小礼包", 1) then return 1 else return 0 end	end
function QiXi37Big(player)			if CommonLQLB(player, "37七夕大礼包", 1) then return 1 else return 0 end	end
function LunTanLiBao(player)		if CommonLQLB(player, "论坛礼包", 1) then return 1 else return 0 end	end
function MaNianZhongQiu(player)		if CommonLQLB(player, "马年中秋礼包", 0) then return 1 else return 0 end	end

function CommonLQLB(player, szLbName, nMax)		--限定次数的礼包nMax为次数，没有限定的礼包nMax为0
	local tCommonLB = {	["37平台A礼包"] = {awardpcon = const.PP_LIBAO_PINGTAI37A, nBagBlack = 4, award = {{name = "四倍宝典", num = 1}, {name = "聚灵珠", num = 1}, {name = "祈福令牌(小)", num = 1}, {name = "玛雅令牌", num = 1},},},
					["37平台B礼包"] = {awardpcon = const.PP_LIBAO_PINGTAI37B, nBagBlack = 4, award = {{name = "修为令牌", num = 1}, {name = "聚灵珠", num = 1}, {name = "八倍宝典", num = 1}, {name = "玛雅令牌", num = 1},},},
					["橙钻开通礼包"] = {awardpcon = const.PP_CHENGZUAN_KAITONG, nBagBlack = 3, award = {{name = "绑定元宝", num = 2000}, {name = "祈福令牌(大)", num = 1}, {name = "八倍宝典", num = 1}, {name = "修为令牌", num = 1}, {name = "五级攻击玄晶", num = 1},},},
					["5399VIP3礼包"] = {awardpcon = const.PP_5399LB_VIP3, nBagBlack = 3, award = {{name = "绑定元宝", num = 1000}, {name = "祈福令牌(中)", num = 1}, {name = "八倍宝典", num = 1}, {name = "修为令牌", num = 1},},},
					["2144武尊超级会员礼包"] = {awardpcon = const.PP_2144LB_SVIP, nBagBlack = 4, award = {{name = "绑定元宝", num = 2000}, {name = "祈福令牌(大)", num = 1}, {name = "八倍宝典", num = 1}, {name = "祈灵玉", num = 1}, {name = "修为令牌", num = 1},},},
					["2144武尊生日礼包"] = {awardpcon = const.PP_2144LB_BIRTHDAY, nBagBlack = 3, award = {{name = "绑定元宝", num = 1000}, {name = "祈福令牌(中)", num = 1}, {name = "八倍宝典", num = 1}, {name = "玛雅令牌", num = 1},},},
					["5399武尊周年庆礼包"] = {awardpcon = const.PP_5399LB_ZHOUNIAN, nBagBlack = 4, award = {{name = "绑定元宝", num = 1000}, {name = "修为令牌", num = 1}, {name = "女儿红(10年)", num = 1}, {name = "八倍宝典", num = 1}, {name = "玛雅令牌", num = 1},},},
					["37七夕小礼包"] = {awardpcon = const.PP_37LB_QIXIXIAO, nBagBlack = 3, award = {{name = "招财神符", num = 1}, {name = "女儿红(10年)", num = 1}, {name = "四倍宝典", num = 1}, {name = "聚灵珠", num = 1},},},
					["37七夕大礼包"] = {awardpcon = const.PP_37LB_QIXIDA, nBagBlack = 3, award = {{name = "绑定元宝", num = 1000}, {name = "祈福令牌(中)", num = 1}, {name = "八倍宝典", num = 1}, {name = "玛雅令牌", num = 1},},},
					["论坛礼包"] = {awardpcon = const.PP_LB_LUNTAN, nBagBlack = 4, award = {{name = "祈福令牌(小)", num = 1}, {name = "聚灵珠", num = 1}, {name = "八倍宝典", num = 1}, {name = "玛雅令牌", num = 1},},},
					["马年中秋礼包"] = {nBagBlack = 3, award = {{name = "绑定元宝", num = 1000}, {name = "祈福令牌(中)", num = 1}, {name = "八倍宝典", num = 1}, {name = "玛雅令牌", num = 1},},},
				}
	if nMax > 0 then
		if util.ppn(player,tCommonLB[szLbName].awardpcon) >= nMax then
			player:alert(11,1,"对不起,该礼包每人只可打开["..nMax.."]次!")
			return true
		end
	end
	if player:num_bag_black() >= tCommonLB[szLbName].nBagBlack then
		player:alert(11,1,"恭喜你成功打开["..szLbName.."]!");
		if nMax > 0 then
			player:set_param(tCommonLB[szLbName].awardpcon,util.ppn(player,tCommonLB[szLbName].awardpcon)+1);	 	--加套装积分
		end
		for i = 1, #tCommonLB[szLbName].award do
			player:add_item(tCommonLB[szLbName].award[i].name, tCommonLB[szLbName].award[i].num, 1)
			player:alert(11, 0, tCommonLB[szLbName].award[i].name.." x "..tCommonLB[szLbName].award[i].num)
		end
		return true
	else
		player:alert(11,1,"对不起,您的背包不足"..tCommonLB[szLbName].nBagBlack.."格,无法打开礼包!")
		return false
	end
end

function ChengZuanDaily1(player)	if DailyLQLB(player, "橙钻每日礼包一") then return 1 else return 0 end		end
function ChengZuanDaily2(player)	if DailyLQLB(player, "橙钻每日礼包二") then return 1 else return 0 end		end
function ChengZuanDaily3(player)	if DailyLQLB(player, "橙钻每日礼包三") then return 1 else return 0 end		end

function DailyLQLB(player, szLbName)		--每日打开一次的礼包
	local tDailyLB = {["橙钻每日礼包一"] = {awardpcon = const.PP_CHENGZUAN_MR1, nBagBlack = 6, award = {{name = "招财神符", num = 1}, {name = "疗伤药(包)", num = 5},},},
					["橙钻每日礼包二"] = {awardpcon = const.PP_CHENGZUAN_MR2, nBagBlack = 2, award = {{name = "双倍宝典", num = 1}, {name = "女儿红(10年)", num = 1},},},
					["橙钻每日礼包三"] = {awardpcon = const.PP_CHENGZUAN_MR3, nBagBlack = 2, award = {{name = "四倍宝典", num = 1}, {name = "聚灵珠", num = 1},},},
				}
	if util.ppn(player,tDailyLB[szLbName].awardpcon) == today() then
		player:alert(11,1,"对不起,该礼包每人每天只可打开一次!")
		return true
	end
	if player:num_bag_black() >= tDailyLB[szLbName].nBagBlack then
		player:alert(11,1,"恭喜你成功打开["..szLbName.."]!");
		player:set_param(tDailyLB[szLbName].awardpcon,today());	 	--加套装积分
		for i = 1, #tDailyLB[szLbName].award do
			player:add_item(tDailyLB[szLbName].award[i].name, tDailyLB[szLbName].award[i].num, 1)
			player:alert(11, 0, tDailyLB[szLbName].award[i].name.." x "..tDailyLB[szLbName].award[i].num)
		end
		return true
	else
		player:alert(11,1,"对不起,您的背包不足"..tDailyLB[szLbName].nBagBlack.."格,无法打开礼包!")
		return false
	end
end

function jinshanzhizun(player)		--金山至尊礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_JINSHANZHIZUN) == 0 then
			player:set_param(const.PP_JINSHANZHIZUN,1);
			player:add_item("十三级宝石",1,1);
			player:add_item("十一级生命玄晶",1,0);
			player:add_item("灵气珠(10000)",5,1);
			player:alert(11,1,"恭喜你成功打开[金山至尊礼包]!");
			player:alert(11,0,"十三级宝石     x1");
			player:alert(11,0,"十一级生命玄晶 x1");
			player:alert(11,0,"灵气珠(10000)  x5");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function yilewan1(player)		--易乐玩激爽礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_YILEWAN1) == 0 then
			player:set_param(const.PP_YILEWAN1,1);
			player:add_item("九级宝石",1,1);
			player:add_item("八级生命玄晶",1,0);
			player:add_item("灵气珠(1000)",3,1);
			player:alert(11,1,"恭喜你成功打开[夏日激爽礼包]!");
			player:alert(11,0,"九级宝石     x1");
			player:alert(11,0,"八级生命玄晶 x1");
			player:alert(11,0,"灵气珠(1000) x3");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function yilewan2(player)		--易乐玩凉爽礼包
	if player:num_bag_black() >= 3 then
		if util.ppn(player,const.PP_YILEWAN2) == 0 then
			player:set_param(const.PP_YILEWAN2,1);
			player:add_item("八级宝石",1,1);
			player:add_item("七级生命玄晶",1,0);
			player:alert(11,1,"恭喜你成功打开[夏日凉爽礼包]!");
			player:alert(11,0,"八级宝石     x1");
			player:alert(11,0,"七级生命玄晶 x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足3格,无法打开礼包!");
		return 0;
	end
end

function wuzunxy(player)		--xy武尊乱世枭雄礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_WUZUNXY) == 0 then
			player:set_param(const.PP_WUZUNXY,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"恭喜你成功打开[武尊乱世枭雄礼包]!");
			player:alert(11,0,"玛雅令牌      x1");
			player:alert(11,0,"祈福令牌(中)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"八倍宝典      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function shujia37(player)		--37暑假礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_SHUJIA37) == 0 then
			player:set_param(const.PP_SHUJIA37,1);
			player:add_item("玛雅令牌",1,1);
			player:add_item("祈福令牌(小)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"恭喜你成功打开[37暑假礼包]!");
			player:alert(11,0,"玛雅令牌      x1");
			player:alert(11,0,"祈福令牌(小)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"八倍宝典      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function guanjunlb(player)		--37世界杯冠军礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_GUANJUNLB) == 0 then
			player:set_param(const.PP_GUANJUNLB,1);
			player:add_item("修为令牌",1,1);
			player:add_item("祈福令牌(中)",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("八倍宝典",1,1);
			player:alert(11,1,"恭喜你成功打开[世界杯冠军获奖礼包]!");
			player:alert(11,0,"修为令牌      x1");
			player:alert(11,0,"祈福令牌(中)  x1");
			player:alert(11,0,"聚灵珠        x1");
			player:alert(11,0,"八倍宝典      x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function qihuhl(player)		--奇虎欢乐礼包，20元
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_QIHUHL) == 0 then
			player:set_param(const.PP_QIHUHL,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("开心富贵虎",1,1);
			player:alert(11,1,"恭喜你成功打开[奇虎欢乐礼包]!");
			player:alert(11,0,"四倍宝典     x1");
			player:alert(11,0,"聚灵珠       x1");
			player:alert(11,0,"开心富贵虎   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function qihucx(player)		--奇虎畅想礼包，50元
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_QIHUCX) == 0 then
			player:set_param(const.PP_QIHUCX,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("聚灵珠",1,1);
			player:add_item("玛雅令牌",1,1);
			player:alert(11,1,"恭喜你成功打开[奇虎畅想礼包]!");
			player:alert(11,0,"八倍宝典     x1");
			player:alert(11,0,"聚灵珠       x1");
			player:alert(11,0,"玛雅令牌     x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function qihukx(player)		--奇虎开心礼包，120元
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_QIHUKX) == 0 then
			player:set_param(const.PP_QIHUKX,1);
			player:add_item("星石",1,1);
			player:add_item("玉石原石",1,1);
			player:add_item("女娲神石",1,1);
			player:alert(11,1,"恭喜你成功打开[奇虎开心礼包]!");
			player:alert(11,0,"星石         x1");
			player:alert(11,0,"玉石原石     x1");
			player:alert(11,0,"女娲神石     x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function qihuhh(player)		--奇虎豪华礼包，300元
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_QIHUHH) == 0 then
			player:set_param(const.PP_QIHUHH,1);
			player:add_item("高级融合符",1,1);
			player:add_item("守护资质丹",10,1);
			player:add_item("大型宝石宝箱",1,1);
			player:alert(11,1,"恭喜你成功打开[奇虎豪华礼包]!");
			player:alert(11,0,"高级融合符       x1");
			player:alert(11,0,"守护资质丹       x10");
			player:alert(11,0,"大型宝石宝箱     x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function cjlb1(player)
	if player:num_bag_black() >= 2 then
		player:add_item("大型宝石宝箱",1,1);
		player:alert(11,1,"成功打开幸运宝石礼包!");
		player:alert(11,0,"大型宝石宝箱*1");
	else
	player:alert(1,1,"您的背包不足2格,无法领取!");
	return 0;
	end
end

function cjlb2(player)
	if player:num_bag_black() >= 3 then
		player:add_item("玉石原石",2,1);
		player:add_item("灵羽宝箱",1,1);
		player:alert(11,1,"成功打开幸运玉石礼包!");
		player:alert(11,0,"玉石原石     x2");
		player:alert(11,0,"灵羽宝箱     x1");
	else
	player:alert(1,1,"您的背包不足3格,无法领取!");
	return 0;
	end
end

function cjlb3(player)
	if player:num_bag_black() >= 4 then
		player:add_item("星石",2,1);
		player:add_item("灵羽宝箱",2,1);
		player:alert(11,1,"成功打开幸运星石礼包!");
		player:alert(11,0,"星石        x2");
		player:alert(11,0,"灵羽宝箱    x2");
	else
	player:alert(1,1,"您的背包不足4格,无法领取!");
	return 0;
	end
end

function cjlb4(player)
	if player:num_bag_black() >= 5 then
		player:add_item("装备灵魂石(1000)",1,1);
		player:add_item("灵羽宝箱",3,1);
		player:alert(11,1,"成功打开幸运灵魂石礼包!");
		player:alert(11,0,"装备灵魂石(1000)  x1");
		player:alert(11,0,"灵羽宝箱          x3");
	else
	player:alert(1,1,"您的背包不足5格,无法领取!");
	return 0;
	end
end

function cjlb5(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("破天游龙刀·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>破天游龙刀·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("破天游龙刀·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>破天游龙刀·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("破天游龙刀·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>破天游龙刀·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function cjlb6(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("惊世龙渊剑·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>惊世龙渊剑·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("惊世龙渊剑·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>惊世龙渊剑·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("惊世龙渊剑·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>惊世龙渊剑·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function cjlb7(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("九黎诛仙剑·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>九黎诛仙剑·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("九黎诛仙剑·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>九黎诛仙剑·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("九黎诛仙剑·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>九黎诛仙剑·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function cjlb8(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,3);
			if z == 1 then
				player:add_item("龙皇离火剑·武威",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>龙皇离火剑·武威</font>]");
			return;
			end
			if z == 2 then
				player:add_item("龙皇离火剑·烈焰",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>龙皇离火剑·烈焰</font>]");
			return;
			end
			if z == 3 then
				player:add_item("龙皇离火剑·无极",1);
				player:alert(11,0,"打开礼包获得:[<font color='#ff0000'>龙皇离火剑·无极</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想东西掉下地吧?!");
		return 0;
	end
end

function cjlb9(player)
	if player:num_bag_black() >= 1 then
		player:add_item("超级玄晶宝箱",1,1);
		player:alert(11,1,"成功打开超级玄晶礼包!");
		player:alert(11,0,"超级玄晶宝箱     x1");
	else
	player:alert(1,1,"您的背包不足1格,无法领取!");
	return 0;
	end
end

function cjlb10(player)
	if player:num_bag_black() >= 3 then
		player:add_item("经验珠(5000万)",5,1);
                player:add_item("守护经验丹(5000万)",5,1);
		player:alert(11,1,"成功打开豪华经验礼包!");
		player:alert(11,0,"经验珠(5000万)      x5");
	        player:alert(11,0,"守护经验珠(5000万)  x5");
	else
	player:alert(1,1,"您的背包不足3格,无法领取!");
	return 0;
	end
end

function xyznkh(player)		--xy周年狂欢礼包
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_XYZNKH) == 0 then
			player:set_param(const.PP_XYZNKH,1);
			player:add_item("灵羽宝箱",2,1);
			player:add_item("超级玄晶宝箱",2,1);
			player:add_item("装备灵魂石(1000)",1,1);
			player:add_item("经验珠(5000万)",2,1);
			player:alert(11,1,"恭喜你成功打开[XY周年狂欢礼包]!");
			player:alert(11,0,"灵羽宝箱         x2");
			player:alert(11,0,"超级玄晶宝箱     x2");
			player:alert(11,0,"装备灵魂石(1000) x1");
			player:alert(11,0,"经验珠(5000万)   x2");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function xyznyg(player)		--xy周年阳光普照礼包
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_XYZNYG) == 0 then
			player:set_param(const.PP_XYZNYG,1);
			player:add_item("灵羽宝箱",1,1);
			player:add_item("中型玄晶宝箱",1,1);
			player:add_item("装备灵魂石(500)",1,1);
			player:add_item("经验珠(2000万)",1,1);
			player:alert(11,1,"恭喜你成功打开[XY周年狂欢礼包]!");
			player:alert(11,0,"灵羽宝箱         x1");
			player:alert(11,0,"中型玄晶宝箱     x1");
			player:alert(11,0,"装备灵魂石(500)  x1");
			player:alert(11,0,"经验珠(2000万)   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function linghunshilb(player)		--2323wan灵魂石包
	if player:num_bag_black() >= 3 then
		if util.ppn(player,const.PP_LINGHUNSHILB) == 0 then
			player:set_param(const.PP_LINGHUNSHILB,1);
			player:add_item("装备灵魂石(500)",1,1);
			player:add_item("灵羽宝箱",2,1);
			player:alert(11,1,"恭喜你成功打开[幸运灵魂礼包]!");
			player:alert(11,0,"装备灵魂石(500)  x1");
			player:alert(11,0,"灵羽宝箱         x2");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足3格,无法打开礼包!");
		return 0;
	end
end

function xingshilb(player)		--2323wan星石包
	if player:num_bag_black() >= 3 then
		if util.ppn(player,const.PP_XINGSHILB) == 0 then
			player:set_param(const.PP_XINGSHILB,1);
			player:add_item("星石",2,1);
			player:add_item("灵羽宝箱",2,1);
			player:alert(11,1,"恭喜你成功打开[幸运星石礼包]!");
			player:alert(11,0,"星石       x2");
			player:alert(11,0,"灵羽宝箱   x2");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足3格,无法打开礼包!");
		return 0;
	end
end

function xuanjinglb(player)		--2323wan超级玄晶包
	if player:num_bag_black() >= 2 then
		if util.ppn(player,const.PP_XUANJINGLB) == 0 then
			player:set_param(const.PP_XUANJINGLB,1);
			player:add_item("超级玄晶宝箱",1,1);
			player:alert(11,1,"恭喜你成功打开[超级玄晶礼包]!");
			player:alert(11,0,"超级玄晶宝箱   x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足2格,无法打开礼包!");
		return 0;
	end
end

function yingpaihuigui(player)		--硬派回归
	if player:num_bag_black() >= 6 then
		if util.ppn(player,const.PP_YINGPAIHUIGUI) == 0 then
			player:set_param(const.PP_YINGPAIHUIGUI,1);
                        player:add_item("绑定元宝",5000,1);
			player:add_item("八倍宝典",3,1);
			player:add_item("聚灵珠",5,1);
			player:add_item("经验珠(5000万)",3,1);
			player:add_item("镇魔令大包",5,1);
			player:alert(11,1,"恭喜你成功打开[硬派回归礼包]!");
			player:alert(11,0,"绑定元宝        x5000");
			player:alert(11,0,"八倍宝典        x3");
			player:alert(11,0,"聚灵珠          x5");
			player:alert(11,0,"经验珠(5000万)  x3");
			player:alert(11,0,"镇魔令大包      x5");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足6格,无法打开礼包!");
		return 0;
	end
end

function yingpaihuikui(player)		--硬派回馈
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_YINGPAIHUIKUI) == 0 then
			player:set_param(const.PP_YINGPAIHUIKUI,1);
                        player:add_item("超级灵魂石",5,1);
			player:add_item("超级坐骑丹",5,1);
			player:add_item("超级真气丹",5,1);
			player:add_item("超级进阶石包",5,1);
			player:alert(11,1,"恭喜你成功打开[硬派回馈礼包]!");
			player:alert(11,0,"超级灵魂石        x5");
			player:alert(11,0,"超级坐骑丹        x5");
			player:alert(11,0,"超级真气丹        x5");
			player:alert(11,0,"超级进阶石包      x5");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function yingpaichoujiang(player)		--硬派抽奖
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_YINGPAICHOUJIANG) == 0 then
			player:set_param(const.PP_YINGPAICHOUJIANG,1);
                        player:add_item("绑定金币",1000000,1);
			player:add_item("四倍宝典",3,1);
			player:add_item("经验珠(2000万)",3,1);
			player:add_item("兽灵精华(1000)",3,1);
			player:alert(11,1,"恭喜你成功打开[硬派抽奖礼包]!");
			player:alert(11,0,"绑定金币        x1000000");
			player:alert(11,0,"四倍宝典        x3");
			player:alert(11,0,"经验珠(2000万)  x3");
			player:alert(11,0,"兽灵精华(1000)  x3");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function huanlechoujiang(player)                          --欢乐抽奖
         if player:num_bag_black() >= 3 then
		player:add_item("双倍宝典",2,1);
                player:add_item("灵气珠(1000)",1,1);
		player:alert(11,1,"成功打开欢乐抽奖礼包!");
		player:alert(11,0,"双倍宝典        x2");
	        player:alert(11,0,"灵气珠(1000)    x1");
	    else
	       player:alert(1,1,"您的背包不足3格,无法领取!");
	    return 0;
         end
end

function kaixinchoujiang(player)                          --开心抽奖
         if player:num_bag_black() >= 3 then
		player:add_item("聚灵珠",1,1);
                player:add_item("真气丹(1000)",1,1);
		player:alert(11,1,"成功打开开心抽奖礼包!");
		player:alert(11,0,"聚灵珠        x1");
	        player:alert(11,0,"真气丹(1000)  x1");
	    else
	       player:alert(1,1,"您的背包不足3格,无法领取!");
	    return 0;
         end
end

function yingpaichangxiang(player)		--硬派畅想
	if player:num_bag_black() >= 6 then
		if util.ppn(player,const.PP_YINGPAICHANGXIANG) == 0 then
			player:set_param(const.PP_YINGPAICHANGXIANG,1);
                        player:add_item("真气丹(10000)",1,1);
			player:add_item("灵气珠(10000)",1,1);
			player:add_item("星石",3,1);
			player:add_item("玉石原石",3,1);
                        player:add_item("大型玄晶宝箱",1,1);
			player:alert(11,1,"恭喜你成功打开[硬派畅想抽奖礼包]!");
			player:alert(11,0,"真气丹(10000)        x1");
			player:alert(11,0,"灵气珠(10000)        x1");
			player:alert(11,0,"星石                 x3");
			player:alert(11,0,"玉石原石             x3");
			player:alert(11,0,"大型玄晶宝箱         x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足6格,无法打开礼包!");
		return 0;
	end
end

function yingpaihaohua(player)		--硬派豪华
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_YINGPAIHAOHUA) == 0 then
			player:set_param(const.PP_YINGPAIHAOHUA,1);
                        player:add_item("盘古神石",5,1);
			player:add_item("女娲神石",5,1);
			player:add_item("超级玄晶宝箱",2,1);
			player:add_item("十级玄晶宝箱",1,1);
			player:alert(11,1,"恭喜你成功打开[硬派豪华兑换礼包]!");
			player:alert(11,0,"盘古神石        x5");
			player:alert(11,0,"女娲神石        x5");
			player:alert(11,0,"超型玄晶宝箱         x2");
			player:alert(11,0,"十级玄晶宝箱         x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function ganenxiao(player)		--360感恩小
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_GANENXIAO) == 0 then
			player:set_param(const.PP_GANENXIAO,1);
                        player:add_item("绑定金币",1000000,1);
			player:add_item("四倍宝典",3,1);
			player:add_item("经验珠(2000万)",3,1);
			player:add_item("聚灵珠",2,1);
			player:alert(11,1,"恭喜你成功打开[360感恩小礼包]!");
			player:alert(11,0,"绑定金币        x1000000");
			player:alert(11,0,"四倍宝典        x3");
			player:alert(11,0,"经验珠(2000万)  x3");
			player:alert(11,0,"聚灵珠          x2");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function ganenda(player)		--360感恩大
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_GANENDA) == 0 then
			player:set_param(const.PP_GANENDA,1);
                        player:add_item("绑定金币",2000000,1);
			player:add_item("四倍宝典",5,1);
			player:add_item("经验珠(2000万)",5,1);
			player:add_item("聚灵珠",3,1);
			player:alert(11,1,"恭喜你成功打开[360感恩大礼包]!");
			player:alert(11,0,"绑定金币        x2000000");
			player:alert(11,0,"四倍宝典        x5");
			player:alert(11,0,"经验珠(2000万)  x5");
			player:alert(11,0,"聚灵珠          x3");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function ganenhaohua(player)		--360感恩豪华
	if player:num_bag_black() >= 5 then
		if util.ppn(player,const.PP_GANENHAOHUA) == 0 then
			player:set_param(const.PP_GANENHAOHUA,1);
                        player:add_item("绑定金币",3000000,1);
			player:add_item("八倍宝典",3,1);
			player:add_item("经验珠(5000万)",3,1);
			player:add_item("聚灵珠",5,1);
			player:alert(11,1,"恭喜你成功打开[360感恩豪华包]!");
			player:alert(11,0,"绑定金币        x3000000");
			player:alert(11,0,"八倍宝典        x3");
			player:alert(11,0,"经验珠(5000万)  x3");
			player:alert(11,0,"聚灵珠          x5");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足5格,无法打开礼包!");
		return 0;
	end
end

function chongwen(player)		--37重温经典礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_CHONGWEN) == 0 then
			player:set_param(const.PP_CHONGWEN,1);
			player:add_item("四倍宝典",1,1);
			player:add_item("经验珠(2000万)",1,1);
			player:add_item("聚灵珠",1,1);
			player:alert(11,1,"恭喜你成功打开[重温经典礼包]!");
			player:alert(11,0,"四倍宝典        x1");
			player:alert(11,0,"经验珠(2000万)  x1");
			player:alert(11,0,"聚灵珠          x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function hanchang(player)		--37酣畅淋漓礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_HANCHANG) == 0 then
			player:set_param(const.PP_HANCHANG,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("经验珠(5000万)",1,1);
			player:add_item("聚灵珠",1,1);
			player:alert(11,1,"恭喜你成功打开[酣畅淋漓礼包]!");
			player:alert(11,0,"八倍宝典        x1");
			player:alert(11,0,"经验珠(5000万)  x1");
			player:alert(11,0,"聚灵珠          x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function zuoyong(player)		--37坐拥天下礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_ZUOYONG) == 0 then
			player:set_param(const.PP_ZUOYONG,1);
			player:add_item("八倍宝典",1,1);
			player:add_item("经验珠(5000万)",1,1);
			player:add_item("装备灵魂石(500)",1,1);
			player:alert(11,1,"恭喜你成功打开[坐拥天下礼包]!");
			player:alert(11,0,"八倍宝典        x1");
			player:alert(11,0,"经验珠(5000万)  x1");
			player:alert(11,0,"装备灵魂石(500) x1");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function wzhuanle(player)		--37武尊欢乐礼包
	if player:num_bag_black() >= 4 then
		if util.ppn(player,const.PP_WZHUANLE) == 0 then
			player:set_param(const.PP_WZHUANLE,1);
			player:add_item("八倍宝典",2,1);
			player:add_item("经验珠(5000万)",2,1);
			player:add_item("聚灵珠",2,1);
			player:alert(11,1,"恭喜你成功打开[37武尊欢乐礼包]!");
			player:alert(11,0,"八倍宝典        x2");
			player:alert(11,0,"经验珠(5000万)  x2");
			player:alert(11,0,"聚灵珠          x2");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足4格,无法打开礼包!");
		return 0;
	end
end

function wzzhuanshu(player)		--37武尊专属礼包
	if player:num_bag_black() >= 8 then
		if util.ppn(player,const.PP_WZZHUANSHU) == 0 then
			player:set_param(const.PP_WZZHUANSHU,1);
			player:add_item("四倍宝典",2,1);
			player:add_item("经验珠(2000万)",1,1);
			player:add_item("疗伤药(包)",5,1);
			player:alert(11,1,"恭喜你成功打开[37武尊专属礼包]!");
			player:alert(11,0,"四倍宝典        x2");
			player:alert(11,0,"经验珠(2000万)  x1");
			player:alert(11,0,"疗伤药(包)      x5");
		else
			player:alert(11,1,"对不起,该礼包只可打开一次!");
		end
	else
		player:alert(11,1,"对不起,您的背包不足8格,无法打开礼包!");
		return 0;
	end
end

local fudaiLimit={
	[20150218]={limit=2},
	[20150219]={limit=3},
	[20150220]={limit=4},
	[20150221]={limit=5},
	[20150222]={limit=6},
	[20150223]={limit=7},	
	[20150224]={limit=8},	
	};

function xuanjingfudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT1);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("小型玄晶宝箱",1,1);
					player:alert(11,1,"成功打开玄晶福袋，获得小型玄晶宝箱 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("中型玄晶宝箱",1,1);
					player:alert(11,1,"成功打开玄晶福袋，获得中型玄晶宝箱 *1!");
				elseif j>=56 and j<=90 then
					player:add_item("大型玄晶宝箱",1,1);
					player:alert(11,1,"成功打开玄晶福袋，获得大型玄晶宝箱 *1!");
				elseif j>=91 and j<=100 then
					player:add_item("超级玄晶宝箱",1,1);
					player:alert(11,1,"成功打开玄晶福袋，获得超级玄晶宝箱 *1!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT1,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT1)==9 then
					player:remove_item("玄晶福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end

function baoshifudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT2);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("小型宝石宝箱",1,1);
					player:alert(11,1,"成功打开宝石福袋，获得小型宝石宝箱 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("中型宝石宝箱",1,1);
					player:alert(11,1,"成功打开宝石福袋，获得中型宝石宝箱 *1!");
				elseif j>=56 and j<=90 then
					player:add_item("大型宝石宝箱",1,1);
					player:alert(11,1,"成功打开宝石福袋，获得大型宝石宝箱 *1!");
				elseif j>=91 and j<=100 then
					player:add_item("超级宝石宝箱",1,1);
					player:alert(11,1,"成功打开宝石福袋，获得超级宝石宝箱 *1!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT2,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT2)==9 then
					player:remove_item("宝石福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end
function tianshufudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT3);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("天书精华",1,1);
					player:alert(11,1,"成功打开天书福袋，获得天书精华 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("天书精华",2,1);
					player:alert(11,1,"成功打开天书福袋，获得天书精华 *2!");
				elseif j>=56 and j<=90 then
					player:add_item("天书精华",3,1);
					player:alert(11,1,"成功打开天书福袋，获得天书精华 *3!");
				elseif j>=91 and j<=100 then
					player:add_item("天书精华",4,1);
					player:alert(11,1,"成功打开天书福袋，获得天书精华 *4!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT3,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT3)==9 then
					player:remove_item("天书福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end
function yupeifudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT4);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("玉石原石",1,1);
					player:alert(11,1,"成功打开玉佩福袋，获得玉石原石 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("玉石原石",2,1);
					player:alert(11,1,"成功打开玉佩福袋，获得玉石原石 *2!");
				elseif j>=56 and j<=90 then
					player:add_item("玉石原石",3,1);
					player:alert(11,1,"成功打开玉佩福袋，获得玉石原石 *3!");
				elseif j>=91 and j<=100 then
					player:add_item("玉石原石",4,1);
					player:alert(11,1,"成功打开玉佩福袋，获得玉石原石 *4!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT4,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT4)==9 then
					player:remove_item("玉佩福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end
function pifengfudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT5);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("天蚕精华",1,1);
					player:alert(11,1,"成功打开披风福袋，获得天蚕精华 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("天蚕精华",2,1);
					player:alert(11,1,"成功打开披风福袋，获得天蚕精华 *2!");
				elseif j>=56 and j<=90 then
					player:add_item("天蚕精华",3,1);
					player:alert(11,1,"成功打开披风福袋，获得天蚕精华 *3!");
				elseif j>=91 and j<=100 then
					player:add_item("天蚕精华",4,1);
					player:alert(11,1,"成功打开披风福袋，获得天蚕精华 *4!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT5,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT5)==9 then
					player:remove_item("披风福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end
function hufufudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT6);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("星石",1,1);
					player:alert(11,1,"成功打开护符福袋，获得星石 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("星石",2,1);
					player:alert(11,1,"成功打开护符福袋，获得星石 *2!");
				elseif j>=56 and j<=90 then
					player:add_item("星石",3,1);
					player:alert(11,1,"成功打开护符福袋，获得星石 *3!");
				elseif j>=91 and j<=100 then
					player:add_item("星石",4,1);
					player:alert(11,1,"成功打开护符福袋，获得星石 *4!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT6,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT6)==9 then
					player:remove_item("护符福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end
function jingyanfudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT7);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("经验珠(1000万)",2,1);
					player:alert(11,1,"成功打开经验福袋，获得经验珠(1000万) *2!");
				elseif j>=11 and j<=55 then
					player:add_item("经验珠(2000万)",2,1);
					player:alert(11,1,"成功打开经验福袋，获得经验珠(2000万) *2!");
				elseif j>=56 and j<=90 then
					player:add_item("经验珠(5000万)",2,1);
					player:alert(11,1,"成功打开经验福袋，获得经验珠(5000万) *2!");
				elseif j>=91 and j<=100 then
					player:add_item("经验珠(5000万)",2,1);
					player:alert(11,1,"成功打开经验福袋，获得经验珠(5000万) *2!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT7,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT7)==9 then
					player:remove_item("经验福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end
function lingyufudai(player)
	if ymd() >= 20150218 and ymd() <= 20150224 then		
		local tmp=ymd();
		local con=util.ppn(player,const.PP_CHUZHI_LIMIT8);
		if con<=fudaiLimit[tmp].limit then
			if player:num_bag_black()>=1 then
				local j = math.random(1,100);
				if j>=1 and j<=10 then
					player:add_item("六级灵羽",1,1);
					player:alert(11,1,"成功打开灵羽福袋，获得六级灵羽 *1!");
				elseif j>=11 and j<=55 then
					player:add_item("七级灵羽",1,1);
					player:alert(11,1,"成功打开灵羽福袋，获得七级灵羽 *1!");
				elseif j>=56 and j<=90 then
					player:add_item("八级灵羽",1,1);
					player:alert(11,1,"成功打开灵羽福袋，获得八级灵羽 *1!");
				elseif j>=91 and j<=100 then
					player:add_item("九级灵羽",1,1);
					player:alert(11,1,"成功打开灵羽福袋，获得九级灵羽 *1!");
				end
				player:set_param(const.PP_CHUZHI_LIMIT8,fudaiLimit[tmp].limit+1);
				if util.ppn(player,const.PP_CHUZHI_LIMIT8)==9 then
					player:remove_item("灵羽福袋",1);
				end
			else
				player:alert(1,1,"背包不足一格，无法开启该礼包噢！");
			end
		else
			player:alert(1,1,"您今天已经开启过该礼包了噢！");
		end
	else
		player:alert(1,1,"不在日期内，无法打开该礼包!");
	end
	return 0;
end

function yblb(player)
	if player:num_bag_black() >= 1 then
		player:remove_item("初级财富礼包",1);
		player:add_vcoin_best_enable(100);
		player:add_item("疗伤药(包)",1);
		player:alert(11,1,"恭喜您成功打开初级财富礼包,祝您游戏愉快!");
	else
		player:alert(1,1,"您的背包不足1格,无法领取!");
	end
		return 0;
end

function qbsc(player)
	if player:num_bag_black() >= 5 then
		player:remove_item("高级财富礼包",1);
		player:add_vcoin_best_enable(1000);
		player:add_item("二级宝石",2);
		player:add_item("青铜镖令",5);
		player:add_item("女儿红",5);
		player:add_item("疗伤药(包)",2);
		player:alert(11,1,"恭喜您成功打开高级财富礼包,祝您游戏愉快!");
	else
		player:alert(1,1,"您的背包不足5格,无法领取!");
	end
		return 0;
end

function qbzs(player)
	if player:num_bag_black() >= 8 then
		player:remove_item("豪华财富礼包",1);
		player:add_vcoin_best_enable(10000);
		player:add_item("四级宝石",2);
		player:add_item("黄金镖令",5);
		player:add_item("女儿红(5年)",5);
		player:add_item("疗伤药(包)",5);
		player:alert(11,1,"恭喜您成功打开豪华财富礼包,祝您游戏愉快!");
	else
		player:alert(1,1,"您的背包不足8格,无法领取!");
	end
		return 0;
end

function qbzz(player)
	if player:num_bag_black() >= 13 then
		player:remove_item("至尊财富礼包",1);
		player:add_vcoin_best_enable(100000);
		player:add_item("六级宝石",2);
		player:add_item("蓝玉镖令",5);
		player:add_item("女儿红(10年)",5);
		player:add_item("疗伤药(包)",10);
		player:alert(11,1,"恭喜您成功打开至尊财富礼包,祝您游戏愉快!");
	else
		player:alert(1,1,"您的背包不足13格,无法领取!");
	end
		return 0;
end