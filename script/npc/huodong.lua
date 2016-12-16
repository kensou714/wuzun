module(..., package.seeall)



function Recharge_process2(player,price)
	if price then
		player:set_param(const.PP_XINQUCHONGZHI,util.ppn(player,const.PP_XINQUCHONGZHI)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_XINQUCHONGZHI);
		for i = 1,4 do
			if a == server.get_var("xqczpma"..i) then
				server.set_var("xqczpmb"..i,b);
				Recharge_chuli2();
				Recharge_chuli2();
				return;
			end
		end
		if b > tonumber(server.get_var("xqczpmb4")) then
			server.set_var("xqczpma4",a);
			server.set_var("xqczpmb4",b);
			Recharge_chuli2();
			Recharge_chuli2();
		end
	end
end

function Recharge_chuli2()
	local Recharge = {};
	for u = 1,4 do
		table.insert(Recharge,{
			name = server.get_var("xqczpma"..u),
			num = server.get_var("xqczpmb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("xqczpma"..idx,value.name);
		server.set_var("xqczpmb"..idx,value.num);
	end
end






function Recharge_process3(player,price)
	if price then
		player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_SMZCJIFEN);
		for i = 1,3 do
			if a == server.get_var("smzcpma"..i) then
				server.set_var("smzcpmb"..i,b);
				Recharge_chuli3();
				return;
			end
		end
		if b > tonumber(server.get_var("smzcpmb3")) then
			server.set_var("smzcpma3",a);
			server.set_var("smzcpmb3",b);
			Recharge_chuli3();
		end
	end
end

function Recharge_chuli3()
	local Recharge = {};
	for u = 1,3 do
		table.insert(Recharge,{
			name = server.get_var("smzcpma"..u),
			num = server.get_var("smzcpmb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("smzcpma"..idx,value.name);
		server.set_var("smzcpmb"..idx,value.num);
	end
end