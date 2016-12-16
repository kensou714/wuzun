module(..., package.seeall)

function baibao(player)
	if player:num_bag_black() < 1 then player:alert(1,1,"背包不足1格!");return 0; end
	if util.ppn(player,const.PP_HUIYUAN) >= today() and util.ppn(player,const.PP_BAIBAODAI) <= 29 or util.ppn(player,const.PP_HUIYUAN) < today() and util.ppn(player,const.PP_BAIBAODAI) <= 14 then
		player:set_param(const.PP_BAIBAODAI,util.ppn(player,const.PP_BAIBAODAI)+1);
		player:alert(10,0,"您今天已经打开["..util.ppn(player,const.PP_BAIBAODAI).."]个百宝袋");
		local e = math.random(2000,5000);
		local a = player:get_level()*(e)
		local i = math.random(1,1000);
		if i >= 1 and i <= 149 then
			player:add_exp(a);
			player:alert(11,1,"百宝袋:<font color='#ff0000'>经验+"..(a).."</font>");
		end
		if i >= 150 and i <= 299 then
			local b = math.random(1,1000);
			if b >= 1 and b <= 300 then
				player:add_gamemoney_bind(10000);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币+10000</font>");
			end
			if b >= 301 and b <= 500 then
				player:add_gamemoney_bind(20000);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币+20000</font>");
			end
			if b >= 501 and b <= 700 then
				player:add_gamemoney_bind(40000);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币+40000</font>");
			end
			if b >= 701 and b <= 900 then
				player:add_gamemoney_bind(60000);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币+60000</font>");
			end
			if b >= 901 and b <= 1000 then
				player:add_gamemoney_bind(100000);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币+100000</font>");
			end
		end
		if i >= 300 and i <= 397 then
			local b = math.random(1,1000);
			if b >= 1 and b <= 500 then
				player:add_vcoin_bind(100);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+100</font>");
			end
			if b >= 501 and b <= 700 then
				player:add_vcoin_bind(200);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+200</font>");
			end
			if b >= 701 and b <= 900 then
				player:add_vcoin_bind(300);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+300</font>");
			end
			if b >= 901 and b <= 980 then
				player:add_vcoin_bind(400);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+400</font>");
			end
			if b >= 981 and b <= 1000 then
				player:add_vcoin_bind(500);
				player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+500</font>");
			end
		end
		if i >= 398 and i <= 697 then
			local c = math.random(8,15);
			player:add_item("青铜镖令",c,1);
			player:alert(11,1,"百宝袋:<font color='#ff0000'>青铜镖令*"..c.."</font>");
		end
		if i >= 698 and i <= 992 then
			local c = math.random(15,25);
			player:add_item("女儿红",c,1);
			player:alert(11,1,"百宝袋:<font color='#ff0000'>女儿红*"..c.."</font>");
		end
		if i >= 993 and i <= 997 then
			player:add_gamemoney_bind(1000000);
			player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币+1000000</font>");
			server.info(10010,0,"玩家["..player:get_name().."]开启百宝袋,人品大爆发![绑定金币+1000000],大家恭喜他吧!");
		end
		if i >= 998 and i <= 999 then
			player:add_vcoin_bind(1000);
			player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+1000</font>");
			server.info(10010,0,"玩家["..player:get_name().."]开启百宝袋,人品大爆发![绑定元宝+1000],大家恭喜他吧!");
		end
		if i == 1000 then
			player:add_vcoin_bind(2000);
			player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定元宝+2000</font>");
			server.info(10010,0,"玩家["..player:get_name().."]开启百宝袋,人品大爆发![绑定元宝+2000],大家恭喜他吧!");
		end
	else
		player:add_gamemoney_bind(1000);
		player:alert(11,1,"百宝袋:<font color='#ff0000'>绑定金币</font>+1000");
		player:alert(1,0,"您今天已经开启了["..util.ppn(player,const.PP_BAIBAODAI).."]个百宝袋!<br>建议您留到明天再开启!<br>会员玩家每天可正常开启30个百宝袋!<br>");
	end
end

