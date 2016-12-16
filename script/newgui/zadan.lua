module(..., package.seeall)
--砸蛋面板
local ACTIONSET_NAME="zadan";
local PANEL_ACTIONSET_NAME="panelzadan";
function zadan(player)
	if server.get_var("fuhuojiezadan") == "" then
		server.set_var("fuhuojiezadan",0);
	end
	server.set_var("fuhuojiezadan",tonumber(server.get_var("fuhuojiezadan"))+1);
	local eq={[1]="·武威",[2]="·烈焰",[3]="·无极"};
	local sui = math.random(1,3);
	local job = eq[sui];
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(200,500)},
		[2]={y=math.random(8000,15000)},
		[3]={y=math.random(80000,150000)},
		};
        local b = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","灵气珠(100)","灵气珠(500)","真气丹(100)","真气丹(100)","兽灵精华(100)","兽灵精华(500)","装备灵魂石(50)","装备灵魂石(100)"};
        local c = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","真气丹(1000)","真气丹(1000)","灵气珠(500)","灵气珠(500)","灵气珠(1000)","兽灵精华(500)","兽灵精华(1000)","装备灵魂石(100)","装备灵魂石(500)"};
        local d = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","真气丹(1000)","真气丹(1000)","灵气珠(500)","灵气珠(500)","灵气珠(1000)","兽灵精华(500)","兽灵精华(1000)","装备灵魂石(100)","装备灵魂石(500)"};
        local e = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","真气丹(1000)","真气丹(1000)","真气丹(1000)","灵气珠(1000)","灵气珠(1000)","灵气珠(5000)","兽灵精华(1000)","兽灵精华(1000)","装备灵魂石(500)","装备灵魂石(1000)","天书精华","天蚕精华"};
        local f = {"四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","真气丹(1000)","真气丹(1000)","灵气珠(1000)","灵气珠(1000)","灵气珠(5000)","兽灵精华(1000)","兽灵精华(5000)","装备灵魂石(500)","装备灵魂石(1000)","天书精华","天蚕精华"};
        local g = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶","真气丹(10000)","真气丹(10000)","灵气珠(10000)","灵气珠(10000)","兽灵精华(10000)","装备灵魂石(500)","装备灵魂石(1000)","天书精华","天蚕精华","鞭炮"};
        local h = {"六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶","七级生命玄晶","七级攻击玄晶","七级物防玄晶","七级魔防玄晶","七级宝石","八级宝石","九级宝石","七级灵羽","八级灵羽","完美的神皇头盔"..job,"完美的神皇项链"..job,"完美的神皇护腕"..job,"完美的神皇戒指"..job,"完美的神皇腰带"..job,"完美的神皇靴"..job,"神皇震威甲"..job,"神皇震威衣"..job,"神皇震威剑"..job,"真气丹(10000)","真气丹(10000)","灵气珠(10000)","灵气珠(10000)","兽灵精华(10000)","装备灵魂石(1000)","喜羊羊战甲(永久)","喜羊羊战衣(永久)"};
        local k = {"八级生命玄晶","八级攻击玄晶","八级物防玄晶","八级魔防玄晶","九级灵羽","八级宝石","九级宝石","十级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","龙皇戒指"..job,"龙皇护腕"..job};
        if tonumber(server.get_var("fuhuojiezadan")) >= 5000 then
			server.set_var("fuhuojiezadan",0);
			local i = k[math.random(#k)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过砸蛋获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过砸蛋功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过砸蛋功能获得:"..i);
			return;
		end
		if z >= 1 and z <= 380 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"通过砸蛋获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"通过砸蛋获得[经验]:<font color='#ff0000'>"..j.."</font>");
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(11,1,"通过砸蛋获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			return;
			end
		end
		if z >= 381 and z <= 630 then
			local i = b[math.random(#b)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过砸蛋获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 631 and z <= 750 then
			local i = c[math.random(#c)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过砸蛋获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 751 and z <= 850 then
			local i = d[math.random(#d)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过砸蛋获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 851 and z <= 920 then
			local i = e[math.random(#e)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过砸蛋获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 921 and z <= 960 then
			local i = f[math.random(#f)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过砸蛋获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 961 and z <= 990 then
			local i = g[math.random(#g)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过砸蛋获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过砸蛋功能获得:<font color='#ff0000'>"..i.."</font>");
--			server.info(10000,0,"勇士["..player:get_name().."]通过砸蛋功能获得:"..i);
			return;
		end
		if z >= 991 and z <= 1000 then
			local i = h[math.random(#h)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过砸蛋获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过砸蛋功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过砸蛋功能获得:"..i);
			return;
		end
end

function panelzadan_click(player,actionset,panelid,actionid)
	if activity.isfuhuojiezadan() then
		if actionid == "btn_zd" then
			if player:num_bag_black()>=1 then
				if player:get_vcoin() >= 288 then
					player:sub_vcoin(288,"zp0225");
					zadan(player);
				else
					player:alert(11,1,"元宝不足288,无法转砸破彩蛋!");
					return;
				end
			else 
				player:alert(11,1,"包裹空格不足1格,无法砸破彩蛋!");
			end
		end
		if(actionid=="btn_zd1")then
			if player:num_bag_black()>=10 then
				if player:get_vcoin() >= 2800 then
					player:sub_vcoin(2800,"zp0225");
					for i=1,10 do
						zadan(player);
					end
				else
					player:alert(11,1,"元宝不足2800,无法砸破彩蛋!");
					return;
				end
			else 
				player:alert(11,1,"包裹空格不足10格,无法砸破彩蛋!");
			end
		end
		--[[if(actionid=="btn_dh1")then
			if(player:num_item("彩蛋",1)>=1)then
				player:remove_item("彩蛋",1);
				player:add_item("彩袍（永久）",1);
				player:alert(1,1,"恭喜您成功兑换【<font color='#FF00FF'>彩袍（永久）</font>】");
				server.info(10000,1,"["..player:get_name().."]在[<font color='#00ff00'>砸蛋</font>]活动中兑换获得[<font color='#FF00FF'>彩袍（永久）</font>]");
				server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在[<font color='#00ff00'>砸蛋</font>]活动中兑换获得[<font color='#FF00FF'>彩袍（永久）</font>][<a href='event:push_local_zadan'><u><font color='#00FF00'>我要砸蛋</font></u></a>]");
			else
				player:alert(1,1,"您没有彩蛋 无法兑换");
			end
		end
		if(actionid=="btn_dh2")then
			if(player:num_item("彩蛋",1)>=1)then
				player:remove_item("彩蛋",1);
				player:add_item("彩衣（永久）",1);
				player:alert(1,1,"恭喜您成功兑换【<font color='#FF00FF'>彩衣（永久）</font>】");
				server.info(10000,1,"["..player:get_name().."]在[<font color='#00ff00'>砸蛋</font>]活动中兑换获得[<font color='#FF00FF'>彩衣（永久）</font>]");
				server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在[<font color='#00ff00'>砸蛋</font>]活动中兑换获得[<font color='#FF00FF'>彩衣（永久）</font>][<a href='event:push_local_zadan'><u><font color='#00FF00'>我要砸蛋</font></u></a>]");
			else
				player:alert(1,1,"您没有彩蛋 无法兑换");
			end
		end
		if(actionid=="btn_dh3")then
			if(player:num_item("彩袍（半月）",1)>=1)then
				if(player:get_vcoin()>=21888)then
					player:sub_vcoin(21888,"fuhuojiecaidan_nan");
					player:add_item("彩袍（永久）",1);
					player:alert(1,1,"恭喜您成功兑换【<font color='#FF00FF'>彩袍（永久）</font>】");
					server.info(10000,1,"["..player:get_name().."]在[砸蛋]活动中兑换获得[<font color='#FF00FF'>彩袍（永久）</font>]");
					server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在[砸蛋]活动中兑换获得[<font color='#FF00FF'>彩袍（永久）</font>][<a href='event:push_local_zadan'><u><font color='#00FF00'>我要砸蛋</font></u></a>]");
				else
					player:alert(1,1,"您的元宝不足[<font color='#ff0000'>21888</font>] 无法兑换");
				end
			else
				player:alert(1,1,"您没有[<font color='#ff0000'>彩袍（半月）</font>] 无法兑换");
			end

		end
		if(actionid=="btn_dh4")then
			if(player:num_item("彩衣（半月）",1)>=1)then
				if(player:get_vcoin()>=21888)then
					player:sub_vcoin(21888,"fuhuojiecaidan_nv");
					player:add_item("彩衣（永久）",1);
					player:alert(1,1,"恭喜您成功兑换【<font color='#FF00FF'>彩衣（永久）</font>】");
					server.info(10000,1,"["..player:get_name().."]在[砸蛋]活动中兑换获得[<font color='#FF00FF'>彩衣（永久）</font>]");
					server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在[砸蛋]活动中兑换获得[<font color='#FF00FF'>彩衣（永久）</font>][<a href='event:push_local_zadan'><u><font color='#00FF00'>我要砸蛋</font></u></a>]");
				else
					player:alert(1,1,"您的元宝不足[<font color='#ff0000'>21888</font>] 无法兑换");
				end
			else
				player:alert(1,1,"您没有[<font color='#ff0000'>彩衣（半月）</font>] 无法兑换");
			end

		end]]
	else
		player:alert(11,1,"非活动时间，谢谢参与。");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,panelzadan_click);