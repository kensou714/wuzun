module(..., package.seeall)
--寻宝面板
local ACTIONSET_NAME="lottery";
local PANEL_ACTIONSET_NAME="panellottery";
local XunbaodisCount = 1;--寻宝折扣

local xb_data={
	["btnxb1"]={times=1,vcoin=200,},
	["btnxb2"]={times=5,vcoin=1000,},
	["btnxb3"]={times=10,vcoin=2000,},
};

local xb_item={20415,79000,10178,10188,10144,10091,49001,20451,10143,15082,10187,15078,15073,30062,20448,59000};
--脚本设置寻宝界面显示的物品信息

----------------------------------开服前三天寻宝9折-------------------------------------------
function freshXunbaoData(player)
 	if server_start_day() <= 3 then
 		XunbaodisCount = 0.9;
 	else
 		player:set_panel_data(PANEL_ACTIONSET_NAME,"disCountBox","visible","false");
 		player:push_ckpanel_data("lottery","panellottery");
 	end
end
login.add_login_listener(freshXunbaoData);
-------------------------------------------------------------------------------------
function fresh_lottery_info(player)
	for i=1,#xb_item do
		player:push_item_info(xb_item[i]);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xbitem"..i,"typeid",xb_item[i]);
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"myyuanbao","text",player:get_vcoin());
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xbjifen","text",util.ppn(player,const.PP_XUNBAOJIFEN));

	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb11","htmlText",server.get_temp_var("xb11"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb12","htmlText",server.get_temp_var("xb12"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb21","htmlText",server.get_temp_var("xb21"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb22","htmlText",server.get_temp_var("xb22"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb31","htmlText",server.get_temp_var("xb31"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb32","htmlText",server.get_temp_var("xb32"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb41","htmlText",server.get_temp_var("xb41"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb42","htmlText",server.get_temp_var("xb42"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb51","htmlText",server.get_temp_var("xb51"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb52","htmlText",server.get_temp_var("xb52"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb61","htmlText",server.get_temp_var("xb61"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb62","htmlText",server.get_temp_var("xb62"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb71","htmlText",server.get_temp_var("xb71"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb72","htmlText",server.get_temp_var("xb72"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb81","htmlText",server.get_temp_var("xb81"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb82","htmlText",server.get_temp_var("xb82"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb91","htmlText",server.get_temp_var("xb91"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb92","htmlText",server.get_temp_var("xb92"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb101","htmlText",server.get_temp_var("xb101"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"xb102","htmlText",server.get_temp_var("xb102"));

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
	--if activity.isBaifuSjieOpen() then
	--	player:set_param(const.PP_MEIRIXUNBAOCISHU,util.ppn(player,const.PP_MEIRIXUNBAOCISHU)+1);
	--end
	player:set_param(const.PP_XUNBAOJIFEN,util.ppn(player,const.PP_XUNBAOJIFEN)+1);
	local eq={[1]="·武威",[2]="·烈焰",[3]="·无极"};
	local sui = math.random(1,3);
	local job = eq[sui];
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(200,500)},
		[2]={y=math.random(20000,50000)},
		[3]={y=math.random(100000,200000)},
		};
	local c = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","二级灵羽","二级宝石","经验珠(50万)","坐骑经验丹(小)","魂石令牌(200)"};
	local d = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","二级灵羽","三级宝石","经验珠(100万)","祈福令牌(小)","转生石","坐骑经验丹(中)","魂石令牌(500)"};
	local e = {"二级生命玄晶","二级攻击玄晶","三级生命玄晶","三级攻击玄晶","二级灵羽","三级灵羽","三级宝石","四级宝石","经验珠(200万)","祈福令牌(小)","转生石","进阶石包(100)","坐骑经验丹(大)","魂石令牌(1000)","完美的混天头盔"..job,"完美的混天项链"..job,"完美的混天护腕"..job,"完美的混天戒指"..job,"完美的混天腰带"..job,"完美的混天靴"..job,"混天镇元甲"..job,"混天镇元衣"..job,"承影剑"..job};
	local f = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","三级灵羽","四级灵羽","四级宝石","五级宝石","经验珠(500万)","祈福令牌(中)","进阶石包(200)","坐骑经验丹(20万)","魂石令牌(2000)","完美的潜龙头盔"..job,"完美的潜龙项链"..job,"完美的潜龙护腕"..job,"完美的潜龙戒指"..job,"完美的潜龙腰带"..job,"完美的潜龙靴"..job,"潜龙吟渊甲"..job,"潜龙吟渊衣"..job,"炙炎刀"..job};
	local g = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级灵羽","五级灵羽","五级宝石","六级宝石","经验珠(1000万)","祈福令牌(中)","进阶石包(300)","坐骑经验丹(30万)","魂石令牌(5000)","完美的无双头盔"..job,"完美的无双项链"..job,"完美的无双护腕"..job,"完美的无双戒指"..job,"完美的无双腰带"..job,"完美的无双靴"..job,"无双传说甲"..job,"无双传说衣"..job,"破空斩"..job};
	local h = {"四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","五级灵羽","六级灵羽","六级宝石","七级宝石","经验珠(2000万)","祈福令牌(大)","进阶石包(500)","坐骑经验丹(100万)","魂石令牌(10000)","完美的至尊头盔"..job,"完美的至尊项链"..job,"完美的至尊护腕"..job,"完美的至尊戒指"..job,"完美的至尊腰带"..job,"完美的至尊靴"..job,"至尊王者甲"..job,"至尊王者衣"..job,"帝陨剑"..job,"完美的天龙头盔"..job,"完美的天龙项链"..job,"完美的天龙护腕"..job,"完美的天龙戒指"..job,"完美的天龙腰带"..job,"完美的天龙靴"..job,"游龙惊鸿甲"..job,"游龙惊鸿衣"..job,"游龙惊鸿"..job,"完美的三皇头盔"..job,"完美的三皇项链"..job,"完美的三皇护腕"..job,"完美的三皇戒指"..job,"完美的三皇腰带"..job,"完美的三皇靴"..job,"三皇震天甲"..job,"三皇震天衣"..job,"刑天之逆"..job,"完美的天威头盔"..job,"完美的天威项链"..job,"完美的天威护腕"..job,"完美的天威戒指"..job,"完美的天威腰带"..job,"完美的天威靴"..job,"天威炎阳甲"..job,"天威炎阳衣"..job,"天威炎阳剑"..job};
	local l = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","七级灵羽","八级宝石","经验珠(5000万)","魔剑"..job.."(搜狗专属)","神器积分[100分]","骠骑将军护腕","抚国大将军戒","镇国大将军链","兵马大元帅盔","完美的神皇头盔"..job,"完美的神皇项链"..job,"完美的神皇护腕"..job,"完美的神皇戒指"..job,"完美的神皇腰带"..job,"完美的神皇靴"..job,"神皇震威甲"..job,"神皇震威衣"..job,"神皇震威剑"..job,"三转螭龙盔"..job,"三转螭龙链"..job,"三转螭龙镯"..job,"三转螭龙戒"..job,"三转螭龙腰带"..job,"三转螭龙靴"..job,"三转螭龙甲"..job,"三转螭龙衣"..job,"三转螭龙剑"..job};
	local k = {"八级灵羽","八级宝石","九级宝石","十级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","神器积分[1000分]","龙皇离火剑·武威","龙皇离火剑·烈焰","龙皇离火剑·无极","四转洪荒盔"..job,"四转洪荒链"..job,"四转洪荒镯"..job,"四转洪荒戒"..job,"四转洪荒腰带"..job,"四转洪荒靴"..job,"四转洪荒甲"..job,"四转洪荒衣"..job,"四转洪荒剑"..job};
		if tonumber(server.get_var("xybx")) >= 5000 then
			server.set_var("xybx",0);
			local i = k[math.random(#k)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			player:alert(12,5,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			fresh_lottery_info(player);
			return;
		end
		if z >= 1 and z <= 350 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(2,2,"获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
				fresh_lottery_info(player);
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(2,2,"获得[经验]:<font color='#ff0000'>"..j.."</font>");
				fresh_lottery_info(player);
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(2,2,"获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
				fresh_lottery_info(player);
			return;
			end
		end
		if z >= 351 and z <= 600 then
			local i = c[math.random(#c)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(2,2,"获得:<font color='#ff0000'>"..i.."</font>");
			fresh_lottery_info(player);
			return;
		end
		if z >= 601 and z <= 750 then
			local i = d[math.random(#d)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(2,2,"获得:<font color='#ff0000'>"..i.."</font>");
			fresh_lottery_info(player);
			return;
		end
		if z >= 751 and z <= 850 then
			local i = e[math.random(#e)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(2,2,"获得:<font color='#ff0000'>"..i.."</font>");
			fresh_lottery_info(player);
			return;
		end
		if z >= 851 and z <= 920 then
			local i = f[math.random(#f)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(2,2,"获得:<font color='#ff0000'>"..i.."</font>");
			fresh_lottery_info(player);
			return;
		end
		if z >= 921 and z <= 970 then
			local i = g[math.random(#g)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"获得:"..i);
			player:alert(2,5,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			quanfuxinxi("[<font color='#00ff00'>"..player:get_name().."</font>]在寻宝中","获得:<font color='#ffff00'>"..i.."</font>");
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			fresh_lottery_info(player);
			return;
		end
		if z >= 971 and z <= 995 then
			local i = h[math.random(#h)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			if i == "超级祝福油" then
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			end
			fresh_lottery_info(player);
			return;
		end
		if z >= 996 and z <= 1000 then
			local i = l[math.random(#l)];
			player:add_item_lottery(i,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过寻宝获得:"..i);
			player:alert(2,5,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#0xEE00EE'>"..i.."</font>");
			quanfuxinxi("[<font color='#00ff00'>"..player:get_name().."</font>]在寻宝中","获得:<font color='#ffff00'>"..i.."</font>");
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过寻宝功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过寻宝功能获得:"..i);
			fresh_lottery_info(player);
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
			if player:get_vcoin() >= data.vcoin*XunbaodisCount then
				player:sub_vcoin(data.vcoin*XunbaodisCount,"choujiang");
				for i=1,data.times do
					xunbao(player)
				end
				player:alert(11,1,"寻宝积分增加:<font color='#ff0000'>"..data.times.."点</font>")
				player:alert(11,0,"共有寻宝积分:<font color='#ff0000'>"..util.ppn(player,const.PP_XUNBAOJIFEN).."点</font>")
			else
				player:alert(11,1,"您的元宝不足"..data.vcoin*XunbaodisCount..",无法完成寻宝!");
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


function quanfuxinxi(a,b)
	local noexist = true;
	for i=1,10 do
		--print(server.get_temp_var("xb"..i.."1"),server.get_temp_var("xb"..i.."2"))
		if server.get_temp_var("xb"..i.."1") == nil or server.get_temp_var("xb"..i.."1") == "" then
			server.set_temp_var("xb"..i.."1",a);
		end
		if server.get_temp_var("xb"..i.."2") == nil or server.get_temp_var("xb"..i.."2") == "" then
			server.set_temp_var("xb"..i.."2",b);
			noexist = false;
			break;
		end
	end
	if noexist then
		server.set_temp_var("xb11",server.get_temp_var("xb21"));
		server.set_temp_var("xb12",server.get_temp_var("xb22"));

		server.set_temp_var("xb21",server.get_temp_var("xb31"));
		server.set_temp_var("xb22",server.get_temp_var("xb32"));

		server.set_temp_var("xb31",server.get_temp_var("xb41"));
		server.set_temp_var("xb32",server.get_temp_var("xb42"));

		server.set_temp_var("xb41",server.get_temp_var("xb51"));
		server.set_temp_var("xb42",server.get_temp_var("xb52"));

		server.set_temp_var("xb51",server.get_temp_var("xb61"));
		server.set_temp_var("xb52",server.get_temp_var("xb62"));

		server.set_temp_var("xb61",server.get_temp_var("xb71"));
		server.set_temp_var("xb62",server.get_temp_var("xb72"));

		server.set_temp_var("xb71",server.get_temp_var("xb81"));
		server.set_temp_var("xb72",server.get_temp_var("xb82"));

		server.set_temp_var("xb81",server.get_temp_var("xb91"));
		server.set_temp_var("xb82",server.get_temp_var("xb92"));

		server.set_temp_var("xb91",server.get_temp_var("xb101"));
		server.set_temp_var("xb92",server.get_temp_var("xb102"));

		server.set_temp_var("xb101",a);
		server.set_temp_var("xb102",b);
	end
end