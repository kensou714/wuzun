module(..., package.seeall)
--寻宝面板
local ACTIONSET_NAME="lottery";
local PANEL_ACTIONSET_NAME="panellottery";

local xb_data={
	["btnxb1"]={times=1,vcoin=200,},
	["btnxb2"]={times=5,vcoin=1000,},
	["btnxb3"]={times=10,vcoin=2000,},
};

local xb_item={20415,79000,10178,10188,20436,10091,49001,59000,10143,91027,101028,61042,30048,10142,20431,69000};
--脚本设置寻宝界面显示的物品信息
function fresh_lottery_info(player)
	for i=1,#xb_item do
		player:push_item_info(xb_item[i]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xbitem"..i,"typeid",xb_item[i]);
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
--
function xunbao(player)
	if util.ppn(player,const.PP_ACHIEVE_FIRSTXUNBAO) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTXUNBAO,10);
		newgui.achieve.fresh_achieve_title(player,1);
	end
	if server.get_var("xybx") == "" then
		server.set_var("xybx",0);
	end
	server.set_var("xybx",tonumber(server.get_var("xybx"))+1);
	player:set_param(const.PP_XUNBAOJIFEN,util.ppn(player,const.PP_XUNBAOJIFEN)+1);
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(200,500)},
		[2]={y=math.random(20000,50000)},
		[3]={y=math.random(100000,200000)},
		};
	local c = {"二级灵羽","二级宝石","三级宝石","经验珠(100万)","转生石","凌云头盔·武威","凌云头盔·烈焰","凌云头盔·无极","凌云项链·武威","凌云项链·烈焰","凌云项链·无极","凌云护腕·武威","凌云护腕·烈焰","凌云护腕·无极","凌云戒指·武威","凌云戒指·烈焰","凌云戒指·无极","凌云腰带·武威","凌云腰带·烈焰","凌云腰带·无极","凌云靴·武威","凌云靴·烈焰","凌云靴·无极","屠龙刀","魔魂法杖","玄天剑"};
	local d = {"三级灵羽","三级宝石","四级宝石","经验珠(200万)","祈福令牌(小)","转生石","惊世头盔·烈焰","惊世头盔·无极","惊世项链·武威","惊世项链·烈焰","惊世项链·无极","惊世护腕·武威","惊世护腕·烈焰","惊世护腕·无极","惊世戒指·武威","惊世戒指·烈焰","惊世戒指·无极","惊世腰带·武威","惊世腰带·烈焰","惊世腰带·无极","惊世靴·武威","惊世靴·烈焰","惊世靴·无极","凤天战甲·武威","凤天战甲·烈焰","凤天战甲·无极","凤天战衣·武威","凤天战衣·烈焰","凤天战衣·无极","凌云剑·武威","凌云剑·烈焰","凌云剑·无极"};
	local e = {"三级灵羽","四级宝石","五级宝石","经验珠(500万)","祈福令牌(小)","转生石","完美的混天头盔·武威","完美的混天头盔·烈焰","完美的混天头盔·无极","完美的混天项链·武威","完美的混天项链·烈焰","完美的混天项链·无极","完美的混天护腕·武威","完美的混天护腕·烈焰","完美的混天护腕·无极","完美的混天戒指·武威","完美的混天戒指·烈焰","完美的混天戒指·无极","完美的混天腰带·武威","完美的混天腰带·烈焰","完美的混天腰带·无极","完美的混天靴·武威","完美的混天靴·烈焰","完美的混天靴·无极","混天镇元甲·武威","混天镇元甲·烈焰","混天镇元甲·无极","混天镇元衣·武威","混天镇元衣·烈焰","混天镇元衣·无极","承影剑·武威","承影剑·武威","承影剑·武威"};
	local f = {"四级灵羽","五级宝石","六级宝石","经验珠(1000万)","祈福令牌(中)","完美的潜龙头盔·武威","完美的潜龙头盔·烈焰","完美的潜龙头盔·无极","完美的潜龙项链·武威","完美的潜龙项链·烈焰","完美的潜龙项链·无极","完美的潜龙护腕·武威","完美的潜龙护腕·烈焰","完美的潜龙护腕·无极","完美的潜龙戒指·武威","完美的潜龙戒指·烈焰","完美的潜龙戒指·无极","完美的潜龙腰带·武威","完美的潜龙腰带·烈焰","完美的潜龙腰带·无极","完美的潜龙靴·武威","完美的潜龙靴·烈焰","完美的潜龙靴·无极","潜龙吟渊甲·武威","潜龙吟渊甲·烈焰","潜龙吟渊甲·无极","潜龙吟渊衣·武威","潜龙吟渊衣·烈焰","潜龙吟渊衣·无极","炙炎刀·武威","炙炎刀·烈焰","炙炎刀·无极"};
	local g = {"四级灵羽","六级宝石","七级宝石","经验珠(2000万)","祈福令牌(大)","完美的无双头盔·武威","完美的无双头盔·烈焰","完美的无双头盔·无极","完美的无双项链·武威","完美的无双项链·烈焰","完美的无双项链·无极","完美的无双护腕·武威","完美的无双护腕·烈焰","完美的无双护腕·无极","完美的无双戒指·武威","完美的无双戒指·烈焰","完美的无双戒指·无极","完美的无双腰带·武威","完美的无双腰带·烈焰","完美的无双腰带·无极","完美的无双靴·武威","完美的无双靴·烈焰","完美的无双靴·无极","无双传说甲·武威","无双传说甲·烈焰","无双传说甲·无极","无双传说衣·武威","无双传说衣·烈焰","无双传说衣·无极","破空斩·武威","破空斩·烈焰","破空斩·无极"};	
	local h = {"五级灵羽","七级宝石","八级宝石","经验珠(5000万)","车骑将军头盔","骠骑将军护腕","抚国大将军戒","镇国大将军链","完美的至尊头盔·武威","完美的至尊头盔·烈焰","完美的至尊头盔·无极","完美的至尊项链·武威","完美的至尊项链·烈焰","完美的至尊项链·无极","完美的至尊护腕·武威","完美的至尊护腕·烈焰","完美的至尊护腕·无极","完美的至尊戒指·武威","完美的至尊戒指·烈焰","完美的至尊戒指·无极","完美的至尊腰带·武威","完美的至尊腰带·烈焰","完美的至尊腰带·无极","完美的至尊靴·武威","完美的至尊靴·烈焰","完美的至尊靴·无极","至尊王者甲·武威","至尊王者甲·烈焰","至尊王者甲·无极","至尊王者衣·武威","至尊王者衣·烈焰","至尊王者衣·无极","帝陨剑·武威","帝陨剑·烈焰","帝陨剑·无极","完美的天龙头盔·武威","完美的天龙头盔·烈焰","完美的天龙头盔·无极","完美的天龙项链·武威","完美的天龙项链·烈焰","完美的天龙项链·无极","完美的天龙护腕·武威","完美的天龙护腕·烈焰","完美的天龙护腕·无极","完美的天龙戒指·武威","完美的天龙戒指·烈焰","完美的天龙戒指·无极","完美的天龙腰带·武威","完美的天龙腰带·烈焰","完美的天龙腰带·无极","完美的天龙靴·武威","完美的天龙靴·烈焰","完美的天龙靴·无极","游龙惊鸿甲·武威","游龙惊鸿甲·烈焰","游龙惊鸿甲·无极","游龙惊鸿衣·武威","游龙惊鸿衣·烈焰","游龙惊鸿衣·无极","游龙惊鸿·武威","游龙惊鸿·烈焰","游龙惊鸿·无极","完美的三皇头盔·武威","完美的三皇头盔·烈焰","完美的三皇头盔·无极","完美的三皇项链·武威","完美的三皇项链·烈焰","完美的三皇项链·无极","完美的三皇护腕·武威","完美的三皇护腕·烈焰","完美的三皇护腕·无极","完美的三皇戒指·武威","完美的三皇戒指·烈焰","完美的三皇戒指·无极","完美的三皇腰带·武威","完美的三皇腰带·烈焰","完美的三皇腰带·无极","完美的三皇靴·武威","完美的三皇靴·烈焰","完美的三皇靴·无极","三皇震天甲·武威","三皇震天甲·烈焰","三皇震天甲·无极","三皇震天衣·武威","三皇震天衣·烈焰","三皇震天衣·无极","刑天之逆·武威","刑天之逆·烈焰","刑天之逆·无极","完美的天威头盔·武威","完美的天威头盔·烈焰","完美的天威头盔·无极","完美的天威项链·武威","完美的天威项链·烈焰","完美的天威项链·无极","完美的天威护腕·武威","完美的天威护腕·烈焰","完美的天威护腕·无极","完美的天威戒指·武威","完美的天威戒指·烈焰","完美的天威戒指·无极","完美的天威腰带·武威","完美的天威腰带·烈焰","完美的天威腰带·无极","完美的天威靴·武威","完美的天威靴·烈焰","完美的天威靴·无极","天威炎阳甲·武威","天威炎阳甲·烈焰","天威炎阳甲·无极","天威炎阳衣·武威","天威炎阳衣·烈焰","天威炎阳衣·无极","天威炎阳剑·武威","天威炎阳剑·烈焰","天威炎阳剑·无极"};
	local k = {"七级灵羽","八级灵羽","九级灵羽","八级宝石","九级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","神器积分[1000分]","龙皇离火剑·武威","龙皇离火剑·烈焰","龙皇离火剑·无极","四转洪荒盔·武威","四转洪荒盔·烈焰","四转洪荒盔·无极","四转洪荒镯·武威","四转洪荒镯·烈焰","四转洪荒镯·无极","四转洪荒戒·武威","四转洪荒戒·烈焰","四转洪荒戒·无极","四转洪荒腰带·武威","四转洪荒腰带·烈焰","四转洪荒腰带·无极","四转洪荒靴·武威","四转洪荒靴·烈焰","四转洪荒靴·无极","四转洪荒甲·武威","四转洪荒甲·烈焰","四转洪荒甲·无极","四转洪荒衣·武威","四转洪荒衣·烈焰","四转洪荒衣·无极","四转洪荒剑·武威","四转洪荒剑·烈焰","四转洪荒剑·无极"};
	local l = {"六级灵羽","八级宝石","九级宝石","神器积分[100分]","骠骑将军护腕","抚国大将军戒","镇国大将军链","兵马大元帅盔","完美的神皇头盔·武威","完美的神皇头盔·烈焰","完美的神皇头盔·无极","完美的神皇项链·武威","完美的神皇项链·烈焰","完美的神皇项链·无极","完美的神皇护腕·武威","完美的神皇护腕·烈焰","完美的神皇护腕·无极","完美的神皇戒指·武威","完美的神皇戒指·烈焰","完美的神皇戒指·无极","完美的神皇腰带·武威","完美的神皇腰带·烈焰","完美的神皇腰带·无极","完美的神皇靴·武威","完美的神皇靴·烈焰","完美的神皇靴·无极","神皇震威甲·武威","神皇震威甲·烈焰","神皇震威甲·无极","神皇震威衣·武威","神皇震威衣·烈焰","神皇震威衣·无极","神皇震威剑·武威","神皇震威剑·烈焰","神皇震威剑·无极","三转螭龙盔·武威","三转螭龙盔·烈焰","三转螭龙盔·无极","三转螭龙镯·武威","三转螭龙镯·烈焰","三转螭龙镯·无极","三转螭龙戒·武威","三转螭龙戒·烈焰","三转螭龙戒·无极","三转螭龙腰带·武威","三转螭龙腰带·烈焰","三转螭龙腰带·无极","三转螭龙靴·武威","三转螭龙靴·烈焰","三转螭龙靴·无极","三转螭龙甲·武威","三转螭龙甲·烈焰","三转螭龙甲·无极","三转螭龙衣·武威","三转螭龙衣·烈焰","三转螭龙衣·无极","三转螭龙剑·武威","三转螭龙剑·烈焰","三转螭龙剑·无极"};
		if tonumber(server.get_var("xybx")) >= 5000 then
			server.set_var("xybx",0);
			local i = k[math.random(#k)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			return;
		end
		if z >= 1 and z <= 350 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"通过寻宝获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"通过寻宝获得[经验]:<font color='#ff0000'>"..j.."</font>");
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(11,1,"通过寻宝获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			return;
			end
		end
		if z >= 351 and z <= 600 then
			local i = c[math.random(#c)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过寻宝获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 601 and z <= 750 then
			local i = d[math.random(#d)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过寻宝获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 751 and z <= 850 then
			local i = e[math.random(#e)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过寻宝获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 851 and z <= 920 then
			local i = f[math.random(#f)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过寻宝获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 921 and z <= 970 then
			local i = g[math.random(#g)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
--			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			return;
		end
		if z >= 971 and z <= 995 then
			local i = h[math.random(#h)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			return;
		end
		if z >= 996 and z <= 1000 then
			local i = l[math.random(#l)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			return;
		end
end
function process_lottery(player,actionset,panelid,actionid)
	if actionid == "btnybcz" then
		player:open_panel(122);
		return;
	end
	if actionid == "btnxbdepot" then
		player:set_panel_data("panelxbdepot","panelxbdepot","panel_visible","true");
		player:push_ckpanel_data("xbdepot","panelxbdepot");
		return;
	end
	if actionid == "btnxbjf" then
		player:script_exe_code("newgui.minimap.processXunBaoJF");
		return;
	end
	local data = xb_data[actionid];
	if data then
		num = player:get_empty_number_in_lotterydepot();
		if(num>=data.times) then
			if player:get_vcoin() >= data.vcoin then
				player:sub_vcoin(data.vcoin,"choujiang");
				for i=1,data.times do
					xunbao(player)
				end
				player:alert(11,1,"寻宝积分增加:<font color='#ff0000'>"..data.times.."点</font>")
				player:alert(11,0,"共有寻宝积分:<font color='#ff0000'>"..util.ppn(player,const.PP_XUNBAOJIFEN).."点</font>")
			else
				player:alert(11,1,"您的元宝不足"..data.vcoin..",无法完成寻宝!");
			end
		else 
		player:alert(11,1,"抽奖仓库空格不足"..data.times.."个,无法继续寻宝!");
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lottery);

------------------------------------------------------------------

------------------------------------------------------------------
--寻宝仓库面板
function sortdepot(player,actionset,panelid,actionid)
	if actionid == "btnzlck" then
		player:sort_depot(3);--整理仓库仓库 0 背包 1 仓库 3 寻宝仓库
		return;
	end
	if actionid == "btnallget" then
		player:back_all_xbitem();
		return;
	end
end
ckpanel.add_listener("xbdepot",sortdepot);