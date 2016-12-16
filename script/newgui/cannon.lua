module(..., package.seeall)
--寻宝面板
local ACTIONSET_NAME="cannon";
local PANEL_ACTIONSET_NAME="panelcannon";

local xb_data={
	[1]={times=1,vcoin=300,total=const.PPC_CANNON_NUM1},
	[2]={times=10,vcoin=270,total=const.PPC_CANNON_NUM2},
};
local job_name={"武威","烈焰","无极"};
function process_cannon(player,actionset,panelid,actionid)
	if activity.isCannonOpen() == false then
		player:alert(1,1,"不在活动日期内！");
		return;
	end
	if actionid == "btnconnon_one" then
		if player:get_vcoin() >= 300 then
			if player:num_bag_black() < 1 then
				player:alert(1,1,"对不起,您的背包空格不足1格,无法打炮!");
				return;
			end
			cannon_fun(player,xb_data[1].vcoin,xb_data[1].times,xb_data[1].total);
			return;
		else
			player:alert(1,1,"您的元宝不足300,无法打炮噢!");
		end
	end
	if actionid == "btnconnon_ten" then
		if player:get_vcoin() >= 2700 then
			if player:num_bag_black() < 10 then
				player:alert(1,1,"对不起,您的背包空格不足10格,无法打炮!");
				return;
			end
			for i=1,10 do
				cannon_fun(player,xb_data[2].vcoin,xb_data[2].times,xb_data[2].total);
			end
			player:sub_vcoin(2700,"cannon");
			return;
		else
			player:alert(1,1,"您的元宝不足2700,无法打炮噢!");
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_cannon);

function cannon_fun(player,price,num,con)
	if activity.isCannonOpen() then
		if player:get_vcoin() >= price then
			cannonGive(player,price);
			server.log_count(3,con,num);
			if price==300 then
				player:sub_vcoin(price,"cannon");
			end
		else
			if price==300 then
				player:alert(1,1,"您的元宝不足"..price..",无法打炮噢！");
			elseif price==270 then
				player:alert(1,1,"您的元宝不足2700,无法打炮噢！");			
			end
		end
	else
		player:alert(1,1,"不在活动日期内！");
	end
end

function cannonGive(player,price,flag)

	local job="";
	if player:get_job_name()=="warrior" then
		job=job_name[1];
	elseif player:get_job_name()=="wizard" then
		job=job_name[2];
	elseif player:get_job_name()=="taoist" then
		job=job_name[3];
	end
	local b = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","玉石*100","星尘*100","经验珠(100万)","经验珠(200万)","装备灵魂石(10)","装备灵魂石(10)","装备灵魂石(50)","装备灵魂石(50)"};
	local c = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","玉石*500","星尘*500","经验珠(200万)","经验珠(500万)","装备灵魂石(50)","装备灵魂石(50)","装备灵魂石(100)","装备灵魂石(100)"};
	local d = {"四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","玉石*500","星尘*500","经验珠(200万)","经验珠(500万)","装备灵魂石(50)","装备灵魂石(50)","装备灵魂石(100)","装备灵魂石(100)"};
	local e = {"四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","玉石*1000","星尘*1000","经验珠(500万)","经验珠(1000万)","装备灵魂石(100)","装备灵魂石(100)","装备灵魂石(500)","装备灵魂石(500)"};
	local f = {"小型玄晶宝箱","小型玄晶宝箱","小型玄晶宝箱","小型玄晶宝箱","玉石*1000","星尘*1000","经验珠(500万)","经验珠(1000万)","装备灵魂石(100)","天书精华","装备灵魂石(500)","装备灵魂石(500)"};
	local g = {"小型玄晶宝箱","小型玄晶宝箱","中型玄晶宝箱","中型玄晶宝箱","玉石*1000","星尘*1000","经验珠(1000万)","经验珠(2000万)","装备灵魂石(100)","天书精华","装备灵魂石(500)","装备灵魂石(500)"};
	local h = {"中型玄晶宝箱","中型玄晶宝箱","大型玄晶宝箱","大型玄晶宝箱","玉石*5000","星尘*5000","经验珠(2000万)","经验珠(5000万)","装备灵魂石(500)","天书精华","装备灵魂石(1000)","装备灵魂石(1000)"};
	local k = {"八级生命玄晶","八级攻击玄晶","八级物防玄晶","八级魔防玄晶","九级灵羽","九级宝石","十级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","诛仙戒指·"..job,"诛仙护腕·"..job,"龙皇腰带·"..job,"龙皇靴·"..job};

	if server.get_var("cannon_num_server") == "" then
		server.set_var("cannon_num_server",0);
	end
	server.set_var("cannon_num_server",tonumber(server.get_var("cannon_num_server"))+1);

	local z = math.random(1,1000);
	if tonumber(server.get_var("cannon_num_server")) >= 5000 then
		server.set_var("cannon_num_server",0);
		local i = k[math.random(#k)];
		player:add_item(i,1);
		player:alert(10,1,"通过寻宝获得:"..i);
		player:alert(12,5,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过人间大炮打中:<font color='#ff0000'>"..i.."</font>");
		server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过人间大炮打中:<font color='#ff0000'>"..i.."</font>[<a href='event:push_local_panelcannon'><u><font color='#00FF00'>我要打炮</font></u></a>]");
		server.info(10000,0,"勇士["..player:get_name().."]通过人间大炮打中:"..i);
		return;
	end
	if z >= 0 and z <= 260 then
		local tmp=math.random(#b);
		--print("b=="..tmp);
		local i = b[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+100);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+100);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过人间大炮打中:<font color='#ff0000'>"..i.."</font>");
		return;
	end
	if z >= 261 and z <= 500 then
		local tmp=math.random(#c);
		--print("c=="..tmp);
		local i = c[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+500);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+500);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过人间大炮打中:<font color='#ff0000'>"..i.."</font>");
		return;
	end
	if z >= 501 and z <= 700 then
		local tmp=math.random(#d);
		--print("d=="..tmp);
		local i = d[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+500);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+500);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过人间大炮打中:<font color='#ff0000'>"..i.."</font>");
		return;
	end
	if z >= 701 and z <= 860 then
		local tmp=math.random(#e);
		--print("e=="..tmp);
		local i = e[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+1000);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+1000);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过人间大炮打中:<font color='#ff0000'>"..i.."</font>");
		return;
	end
	if z >= 861 and z <= 940 then
		local tmp=math.random(#f);
		--print("f=="..tmp);
		local i = f[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+1000);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+1000);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过人间大炮打中:<font color='#ff0000'>"..i.."</font>");
		return;
	end
	if z >= 941 and z <= 980 then
		local tmp=math.random(#g);
		--print("g=="..tmp);
		local i = g[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+1000);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+1000);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过寻宝获得:"..i);
		player:alert(2,1,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过人间大炮打中:<font color='#0xEE00EE'>"..i.."</font>");
		server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过人间大炮打中:<font color='#ff0000'>"..i.."</font>[<a href='event:push_local_panelcannon'><u><font color='#00FF00'>我要打炮</font></u></a>]");
		server.info(10000,0,"勇士["..player:get_name().."]通过人间大炮打中:"..i);
		return;
	end
	if z >= 981 and z <= 1000 then
		local tmp=math.random(#h);
		--print("h=="..tmp);
		local i = h[tmp];
		if tmp==5 then
			player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+5000);
		elseif tmp==6 then
			player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+5000);
		else
			player:add_item(i,1);
		end
		player:alert(10,1,"通过寻宝获得:"..i);
		server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过人间大炮打中:<font color='#ff0000'>"..i.."</font>[<a href='event:push_local_panelcannon'><u><font color='#00FF00'>我要打炮</font></u></a>]");
		server.info(10000,0,"勇士["..player:get_name().."]通过人间大炮打中:"..i);
		return;
	end
end


