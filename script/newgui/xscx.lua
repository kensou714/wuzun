module(..., package.seeall)
local ACTIONSET_NAME="xscx";
local PANEL_ACTIONSET_NAME="panelXscx";


local natday={
	[1]={name="真气丹(1000)",price=990,typeid="15094",bind="1"},
	[2]={name="真气丹(10000)",price=9900,typeid="15096",bind="1"},
	[3]={name="镇魔令大包",price=800,typeid="15050",bind="1"},
	[4]={name="祈灵玉",price=888,typeid="15017",bind="1"},
	[5]={name="五级攻击玄晶",price=1200,typeid="10228",bind="1"},
	[6]={name="五级生命玄晶",price=1200,typeid="10264",bind="1"},
	[7]={name="五级物防玄晶",price=1200,typeid="10240",bind="1"},
	[8]={name="五级魔防玄晶",price=1200,typeid="10252",bind="1"},
}

function process_xscxActivity(player,actionset,panelid,actionid,data)
	if not activity.isShangChengSale() then
		player:alert(1,1,"当前不在活动有效时间内,感谢您的参与!");
		return;
	end
	for i=1,8 do 
		if actionid == "xscxwp"..i then
			process_national_detail(player,i);
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_xscxActivity);

function process_national_detail(player,de)
	local ndata = natday[de];
	if ndata then
		if player:num_bag_black() < 1 then
			player:alert(11,1,"背包不足1格,购买失败!");return;
		end
		if player:get_vcoin() >= ndata.price  then
			player:sub_vcoin(ndata.price,"xscuxiao0308");
			player:add_item(ndata.name,1,ndata.bind);
			server.log_count(4,ndata.typeid,1);
			player:alert(11,1,"成功使用"..ndata.price.."元宝购买"..ndata.name);
		else
			player:alert(11,1,"元宝不足"..ndata.price..",购买失败!");
		end
	end
end

