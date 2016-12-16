module(..., package.seeall)
--幸运转盘面板
local ACTIONSET_NAME="xscj";
local PANEL_ACTIONSET_NAME="panelxscj";

function xunbao(player)
	if server.get_var("xscjhj") == "" then
		server.set_var("xscjhj",0);
	end
	server.set_var("xscjhj",tonumber(server.get_var("xscjhj"))+1);
	local eq={[1]="·武威",[2]="·烈焰",[3]="·无极"};
	local sui = math.random(1,3);
	local job = eq[sui];
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(200,500)},
		[2]={y=math.random(8000,15000)},
		[3]={y=math.random(80000,150000)},
		};
        local b = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","真气丹(100)","真气丹(500)","真气丹(100)","真气丹(100)"};
        local c = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","真气丹(1000)","真气丹(500)","真气丹(500)","真气丹(500)"};
        local d = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","真气丹(1000)","真气丹(500)","真气丹(1000)","真气丹(500)"};
        local e = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","真气丹(1000)","真气丹(1000)","真气丹(1000)","真气丹(5000)"};
        local f = {"四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","真气丹(1000)","真气丹(1000)","真气丹(5000)","真气丹(5000)"};
        local g = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶","完美的天威头盔"..job,"完美的天威项链"..job,"完美的天威护腕"..job,"完美的天威戒指"..job,"完美的天威腰带"..job,"完美的天威靴"..job,"天威炎阳甲"..job,"天威炎阳衣"..job,"天威炎阳剑"..job,"真气丹(10000)","真气丹(10000)","真气丹(5000)","真气丹(5000)"};
        local h = {"六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶","七级生命玄晶","七级攻击玄晶","七级物防玄晶","七级魔防玄晶","七级宝石","八级宝石","九级宝石","七级灵羽","八级灵羽","完美的神皇头盔"..job,"完美的神皇项链"..job,"完美的神皇护腕"..job,"完美的神皇戒指"..job,"完美的神皇腰带"..job,"完美的神皇靴"..job,"神皇震威甲"..job,"神皇震威衣"..job,"神皇震威剑"..job,"真气丹(10000)","真气丹(10000)"};
        local k = {"八级生命玄晶","八级攻击玄晶","八级物防玄晶","八级魔防玄晶","九级灵羽","八级宝石","九级宝石","十级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","神器积分[1000分]","游龙裂天剑·武威","游龙裂天剑·烈焰","游龙裂天剑·无极","真气丹(10000)"};
        if tonumber(server.get_var("xscjhj")) >= 5000 then
			server.set_var("xscjhj",0);
			local i = k[math.random(#k)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运转盘功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运转盘功能获得:"..i);
			return;
		end
		if z >= 1 and z <= 380 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"通过幸运转盘获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"通过幸运转盘获得[经验]:<font color='#ff0000'>"..j.."</font>");
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(11,1,"通过幸运转盘获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			return;
			end
		end
		if z >= 381 and z <= 630 then
			local i = b[math.random(#b)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 631 and z <= 750 then
			local i = c[math.random(#c)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 751 and z <= 850 then
			local i = d[math.random(#d)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 851 and z <= 920 then
			local i = e[math.random(#e)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 921 and z <= 960 then
			local i = f[math.random(#f)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 961 and z <= 990 then
			local i = g[math.random(#g)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运转盘功能获得:<font color='#ff0000'>"..i.."</font>");
--			server.info(10000,0,"勇士["..player:get_name().."]通过幸运转盘功能获得:"..i);
			return;
		end
		if z >= 991 and z <= 1000 then
			local i = h[math.random(#h)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运转盘功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运转盘功能获得:"..i);
			return;
		end
end
function xszpfreshChoujNum(player)
	if util.ppn(player,const.PP_XIANSHI_ZHUANPAN_CISHU) > 0 then
		player:set_panel_data("panellucky","hefuchoujiang","action","canuse");
	else
		player:set_panel_data("panellucky","hefuchoujiang","action","cantuse");
	end
	player:set_panel_data("panellucky","txtxqcjs","htmlText","您当前可以抽奖 [ "..util.ppn(player,const.PP_XIANSHI_ZHUANPAN_CISHU).." ] 次");
	player:push_ckpanel_data("lucky","panellucky");
end

function process_lottery(player,actionset,panelid,actionid)
	--if util.ppn(player,const.PP_ZHUANPAN_CHONGZHI)<=const.HUODONG_BIAOSHI then
	--	player:set_param(const.PP_ZHUANPAN_CHONGZHI,0);
	--	player:set_param(const.PP_XIANSHI_ZHUANPAN_CISHU,0);
	--	player:set_param(const.PP_ZHUANPAN_CHONGZHI,const.HUODONG_BIAOSHI+1);
	--end
	if activity.isXianshizhuanpanOpen() then
		if actionid == "btnOne" then
			if player:num_bag_black()>=1 then
				if player:get_vcoin() >= 288 then
					player:sub_vcoin(288,"zp0309");
					xunbao(player);
				else
					player:alert(11,1,"元宝不足288,无法转动转盘!");
					return;
				end
				--if util.ppn(player,const.PP_XIANSHI_ZHUANPAN_CISHU) >=1 then
				--	player:set_param(const.PP_XIANSHI_ZHUANPAN_CISHU,util.ppn(player,const.PP_XIANSHI_ZHUANPAN_CISHU)-1);
				--	xunbao(player);
				--else
				--	player:alert(11,1,"您的抽奖次数已用完,无法抽奖!");
				--end
			else 
				player:alert(11,1,"包裹空格不足1格,无法转动转盘!");
			end
			--xszpfreshChoujNum(player);
		end
	else
		player:alert(11,1,"非活动时间，谢谢参与。");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lottery);