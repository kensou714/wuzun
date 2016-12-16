module(..., package.seeall)
local ACTIONSET_NAME="choujiang";
local PANEL_ACTIONSET_NAME="panelchoujiang";

function process_choujiang(player,actionset,panelid,actionid,data)
	if actionid == "btnOne" then
		buyLuckyFuc(player,1);return;
	end
	if actionid == "btnFive" then
		buyLuckyFuc(player,5);return;
	end
	if actionid == "btnTen" then
		buyLuckyFuc(player,10);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_choujiang);

function buyLuckyFuc(player,times)
	local cost = 200 * times;
	local num = player:num_bag_black();
	if num >= times then
		if player:get_vcoin() >= cost then
				player:sub_vcoin(cost,"choujiang");
				for i=1,times do
					xunbao(player)
				end
			else
				player:alert(11,1,"您的元宝不足"..cost..",无法完成寻宝!");
			end
	else 
		player:alert(11,1,"抽奖仓库空格不足"..times.."个,无法继续寻宝!");
	end
end

function tryIntoSysMsg(player,msg)
	local num = util.svn("svrmsgnum")%20 + 1;
	server.set_var("svrmsgnum",util.svn("svrmsgnum")+1);
	server.set_var(("svrmsg"..num),msg);
	fresh_sysmsg(player);
end

function fresh_sysmsg(player)
	for i=1,20 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"cjsmsg"..i,"htmlText",server.get_var("svrmsg"..i));
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

-----------------------------------------------------------------------------
function xunbao(player)
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(500,1000)},
		[2]={y=math.random(15000,50000)},
		[3]={y=math.random(100000,500000)},
		};
	local e = {"四级灵羽","五级宝石","六级宝石","完美的混天头盔·武威","完美的混天头盔·烈焰","完美的混天头盔·无极","完美的混天项链·武威","完美的混天项链·烈焰","完美的混天项链·无极","完美的混天护腕·武威","完美的混天护腕·烈焰","完美的混天护腕·无极","完美的混天戒指·武威","完美的混天戒指·烈焰","完美的混天戒指·无极","完美的混天腰带·武威","完美的混天腰带·烈焰","完美的混天腰带·无极","完美的混天靴·武威","完美的混天靴·烈焰","完美的混天靴·无极","混天镇元甲·武威","混天镇元甲·烈焰","混天镇元甲·无极","混天镇元衣·武威","混天镇元衣·烈焰","混天镇元衣·无极","承影剑·武威","承影剑·武威","承影剑·武威"};
	local f = {"四级灵羽","五级宝石","六级宝石","完美的潜龙头盔·武威","完美的潜龙头盔·烈焰","完美的潜龙头盔·无极","完美的潜龙项链·武威","完美的潜龙项链·烈焰","完美的潜龙项链·无极","完美的潜龙护腕·武威","完美的潜龙护腕·烈焰","完美的潜龙护腕·无极","完美的潜龙戒指·武威","完美的潜龙戒指·烈焰","完美的潜龙戒指·无极","完美的潜龙腰带·武威","完美的潜龙腰带·烈焰","完美的潜龙腰带·无极","完美的潜龙靴·武威","完美的潜龙靴·烈焰","完美的潜龙靴·无极","潜龙吟渊甲·武威","潜龙吟渊甲·烈焰","潜龙吟渊甲·无极","潜龙吟渊衣·武威","潜龙吟渊衣·烈焰","潜龙吟渊衣·无极","炙炎刀·武威","炙炎刀·烈焰","炙炎刀·无极","完美的无双头盔·武威","完美的无双头盔·烈焰","完美的无双头盔·无极","完美的无双项链·武威","完美的无双项链·烈焰","完美的无双项链·无极","完美的无双护腕·武威","完美的无双护腕·烈焰","完美的无双护腕·无极","完美的无双戒指·武威","完美的无双戒指·烈焰","完美的无双戒指·无极","完美的无双腰带·武威","完美的无双腰带·烈焰","完美的无双腰带·无极","完美的无双靴·武威","完美的无双靴·烈焰","完美的无双靴·无极","无双传说甲·武威","无双传说甲·烈焰","无双传说甲·无极","无双传说衣·武威","无双传说衣·烈焰","无双传说衣·无极","破空斩·武威","破空斩·烈焰","破空斩·无极"};	
	local g = {"五级灵羽","六级宝石","七级宝石","完美的至尊头盔·武威","完美的至尊头盔·烈焰","完美的至尊头盔·无极","完美的至尊项链·武威","完美的至尊项链·烈焰","完美的至尊项链·无极","完美的至尊护腕·武威","完美的至尊护腕·烈焰","完美的至尊护腕·无极","完美的至尊戒指·武威","完美的至尊戒指·烈焰","完美的至尊戒指·无极","完美的至尊腰带·武威","完美的至尊腰带·烈焰","完美的至尊腰带·无极","完美的至尊靴·武威","完美的至尊靴·烈焰","完美的至尊靴·无极","至尊王者甲·武威","至尊王者甲·烈焰","至尊王者甲·无极","至尊王者衣·武威","至尊王者衣·烈焰","至尊王者衣·无极","帝陨剑·武威","帝陨剑·烈焰","帝陨剑·无极","完美的天龙头盔·武威","完美的天龙头盔·烈焰","完美的天龙头盔·无极","完美的天龙项链·武威","完美的天龙项链·烈焰","完美的天龙项链·无极","完美的天龙护腕·武威","完美的天龙护腕·烈焰","完美的天龙护腕·无极","完美的天龙戒指·武威","完美的天龙戒指·烈焰","完美的天龙戒指·无极","完美的天龙腰带·武威","完美的天龙腰带·烈焰","完美的天龙腰带·无极","完美的天龙靴·武威","完美的天龙靴·烈焰","完美的天龙靴·无极","游龙惊鸿甲·武威","游龙惊鸿甲·烈焰","游龙惊鸿甲·无极","游龙惊鸿衣·武威","游龙惊鸿衣·烈焰","游龙惊鸿衣·无极","游龙惊鸿·武威","游龙惊鸿·烈焰","游龙惊鸿·无极"};
	local h = {"六级灵羽","七级宝石","八级宝石","完美的三皇头盔·武威","完美的三皇头盔·烈焰","完美的三皇头盔·无极","完美的三皇项链·武威","完美的三皇项链·烈焰","完美的三皇项链·无极","完美的三皇护腕·武威","完美的三皇护腕·烈焰","完美的三皇护腕·无极","完美的三皇戒指·武威","完美的三皇戒指·烈焰","完美的三皇戒指·无极","完美的三皇腰带·武威","完美的三皇腰带·烈焰","完美的三皇腰带·无极","完美的三皇靴·武威","完美的三皇靴·烈焰","完美的三皇靴·无极","三皇震天甲·武威","三皇震天甲·烈焰","三皇震天甲·无极","三皇震天衣·武威","三皇震天衣·烈焰","三皇震天衣·无极","刑天之逆·武威","刑天之逆·烈焰","刑天之逆·无极","完美的天威头盔·武威","完美的天威头盔·烈焰","完美的天威头盔·无极","完美的天威项链·武威","完美的天威项链·烈焰","完美的天威项链·无极","完美的天威护腕·武威","完美的天威护腕·烈焰","完美的天威护腕·无极","完美的天威戒指·武威","完美的天威戒指·烈焰","完美的天威戒指·无极","完美的天威腰带·武威","完美的天威腰带·烈焰","完美的天威腰带·无极","完美的天威靴·武威","完美的天威靴·烈焰","完美的天威靴·无极","天威炎阳甲·武威","天威炎阳甲·烈焰","天威炎阳甲·无极","天威炎阳衣·武威","天威炎阳衣·烈焰","天威炎阳衣·无极","天威炎阳剑·武威","天威炎阳剑·烈焰","天威炎阳剑·无极"};
	local k = {"七级灵羽","八级宝石","九级宝石","完美的神皇头盔·武威","完美的神皇头盔·烈焰","完美的神皇头盔·无极","完美的神皇项链·武威","完美的神皇项链·烈焰","完美的神皇项链·无极","完美的神皇护腕·武威","完美的神皇护腕·烈焰","完美的神皇护腕·无极","完美的神皇戒指·武威","完美的神皇戒指·烈焰","完美的神皇戒指·无极","完美的神皇腰带·武威","完美的神皇腰带·烈焰","完美的神皇腰带·无极","完美的神皇靴·武威","完美的神皇靴·烈焰","完美的神皇靴·无极","神皇震威甲·武威","神皇震威甲·烈焰","神皇震威甲·无极","神皇震威衣·武威","神皇震威衣·烈焰","神皇震威衣·无极","神皇震威剑·武威","神皇震威剑·烈焰","神皇震威剑·无极"};
	local l = {"八级灵羽","九级灵羽","九级宝石","十级宝石","神器积分[100分]","神器积分[1000分]","车骑将军头盔","骠骑将军护腕","抚国大将军戒","镇国大将军链","兵马大元帅盔"};
		if z >= 1 and z <= 300 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"通过幸运大转盘获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"通过幸运大转盘获得[经验]:<font color='#ff0000'>"..j.."</font>");
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(11,1,"通过幸运大转盘获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			return;
			end
		end
		if z >= 301 and z <= 550 then
			local i = e[math.random(#e)];
			player:add_item_log(i,242,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运大转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 551 and z <= 750 then
			local i = f[math.random(#f)];
			player:add_item_log(i,242,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运大转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 751 and z <= 900 then
			local i = g[math.random(#g)];
			player:add_item_log(i,242,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运大转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 901 and z <= 990 then
			local i = h[math.random(#h)];
			player:add_item_log(i,242,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运大转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运大转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 991 and z <= 999 then
			local i = k[math.random(#k)];
			player:add_item_log(i,242,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运大转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运大转盘获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运大转盘获得:"..i);
			return;
		end
		if z == 1000 then
			local i = l[math.random(#l)];
			player:add_item_log(i,242,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运大转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运大转盘获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运大转盘获得:"..i);
			return;
		end

end