module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[废话少说,纳了你的矿来,给你酒钱!<br>
	<a href='event:talk_jiaokuang'>上缴矿石</a><br>]]);
end

function Recharge_process3(player,price)
	if price then
		player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_SMZCJIFEN);
		local d = player:get_param(const.PP_ZHANCHANG_NIMING);
		for i = 1,3 do
			if a == server.get_var("smzcpma"..i) then
				server.set_var("smzcpmb"..i,b);
				server.set_var("smzcpmd"..i,d);
				Recharge_chuli3();
				return;
			end
		end
		if b > tonumber(server.get_var("smzcpmb3")) then
			server.set_var("smzcpma3",a);
			server.set_var("smzcpmb3",b);
			server.set_var("smzcpmd3",d);
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
			plus = server.get_var("smzcpmd"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("smzcpma"..idx,value.name);
		server.set_var("smzcpmb"..idx,value.num);
		server.set_var("smzcpmd"..idx,value.plus);
	end
end

function onTalkjiaokuang(npc,player)
	if util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then player:alert(11,1,"你的矿石呢?我可没见着!"); return; end
	if player:get_dart_out_range_flag() == 0 then 
		if util.ppn(player,const.PP_ZHANCHANG_CHETYPE) == 1 then
			player:dart_task_succeed();
			player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+50);
			player:alert(11,1,"恭喜您成功运回小型天晶矿石,获得50积分!"); 
			if player:get_team_name() == "红方阵营" then
				server.set_temp_var("szzy",server.get_temp_var("szzy")+50);
			end
			if player:get_team_name() == "蓝方阵营" then
				server.set_temp_var("mzzy",server.get_temp_var("mzzy")+50);
			end
			Recharge_process3(player,0);return;
		end
		if util.ppn(player,const.PP_ZHANCHANG_CHETYPE) == 2 then
			player:dart_task_succeed();
			player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+200);
			player:alert(11,1,"恭喜您成功运回大型天晶矿石,获得200积分!"); 
			if player:get_team_name() == "红方阵营" then
				server.set_temp_var("szzy",server.get_temp_var("szzy")+200);
			end
			if player:get_team_name() == "蓝方阵营" then
				server.set_temp_var("mzzy",server.get_temp_var("mzzy")+200);
			end
			Recharge_process3(player,0);return;
		end
	else 
		player:alert(11,1,"搬运兽还没有到这里,去把搬运兽找回来吧!"); 
		return; 
	end	
end

function onTalktuichu(player)
	player:set_timer(6,1000);
end


function EndPing(player)
	player:alert(11,1,"本次战场以平局而告终!");
		if server.get_temp_var("sbzc") == "1" then
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(2000);
				player:add_exp(10000000);
				player:alert(11,0,"成就点数:增加2000");
				player:alert(11,0,"经验增加:10000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(200);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:alert(11,0,"成就点数:增加200");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				end
			end
		else
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(1000);
				player:add_exp(5000000);
				player:alert(11,0,"成就点数:增加1000");
				player:alert(11,0,"经验增加:5000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(100);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*2500);
					player:alert(11,0,"成就点数:增加100");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*2500));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*2500);
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*2500));
				end
			end
		end
	if player:get_name() == server.get_var("smzcpma1") and server.get_var("zhanchangmvp") == "" then
		server.set_var("zhanchangmvp",1);
		player:achieve_add_point(2000);
		player:alert(11,0,"恭喜您获得本次战场积分排名第一!");
		player:alert(11,0,"成就点数:增加2000");
	end
	player:alert(10,0,"您的当前成就:"..player:achieve_get_point().."点");
	player:set_param(const.PP_SMZCHOUR,0);
	player:set_param(const.PP_SMZCZHENY,0);
	player:set_param(const.PP_SMZCKILL,0);
	player:set_param(const.PP_SMZCJIFEN,0);
	player:dart_task_succeed();
	player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
	player:set_timer(6,1000);
end



function EndHong(player)
	if player:get_team_name() == "红方阵营" then
		player:alert(11,1,"恭喜您赢得了战场的胜利![成就点数*2]");
		if server.get_temp_var("sbzc") == "1" or (ymd() >= 20131011 and ymd() <= 20131013) then
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(4000);
				player:add_exp(20000000);
				player:add_vcoin_bind(1000);
				player:alert(11,0,"成就点数:增加4000");
				player:alert(11,0,"绑定元宝:增加1000");
				player:alert(11,0,"经验增加:20000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(400);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*10000);
					player:add_vcoin_bind(100);
					player:alert(11,0,"成就点数:增加400");
					player:alert(11,0,"绑定元宝:增加100");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*10000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)*2));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*10000);
					player:add_vcoin_bind(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)*2));
					player:alert(11,0,"绑定元宝:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*10000));
				end
			end
		else
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(2000);
				player:add_exp(10000000);
				player:add_vcoin_bind(500);
				player:alert(11,0,"成就点数:增加2000");
				player:alert(11,0,"绑定元宝:增加500");
				player:alert(11,0,"经验增加:10000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(200);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:add_vcoin_bind(50);
					player:alert(11,0,"成就点数:增加200");
					player:alert(11,0,"绑定元宝:增加50");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:add_vcoin_bind(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/4));
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:alert(11,0,"绑定元宝:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/4));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				end
			end
		end
	end
	if player:get_team_name() == "蓝方阵营" then
		player:alert(11,1,"很遗憾您输掉了本次战场!");
		local t = os.date("%m%d",os.time());
		if server.get_temp_var("sbzc") == "1" then
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(2000);
				player:add_exp(10000000);
				player:alert(11,0,"成就点数:增加2000");
				player:alert(11,0,"经验增加:10000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(200);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:alert(11,0,"成就点数:增加200");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				end
			end
		else
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(1000);
				player:add_exp(5000000);
				player:alert(11,0,"成就点数:增加1000");
				player:alert(11,0,"经验增加:5000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(100);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*2500);
					player:alert(11,0,"成就点数:增加100");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*2500));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*2500);
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*2500));
				end
			end
		end
	end
	if player:get_name() == server.get_var("smzcpma1") and server.get_var("zhanchangmvp") == "" then
		server.set_var("zhanchangmvp",1);
		player:achieve_add_point(2000);
		player:alert(11,0,"恭喜您获得本次战场积分排名第一!");
		player:alert(11,0,"成就点数:增加2000");
	end
	player:alert(10,0,"您的当前成就:"..player:achieve_get_point().."点");
	player:set_param(const.PP_SMZCHOUR,0);
	player:set_param(const.PP_SMZCZHENY,0);
	player:set_param(const.PP_SMZCKILL,0);
	player:set_param(const.PP_SMZCJIFEN,0);
	player:dart_task_succeed();
	player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
	player:set_timer(6,1000);
end

function EndLan(player)
	if player:get_team_name() == "蓝方阵营" then
		player:alert(11,1,"恭喜您赢得了战场的胜利![成就点数*2]");
		if server.get_temp_var("sbzc") == "1" or (ymd() >= 20131011 and ymd() <= 20131013) then
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(4000);
				player:add_exp(20000000);
				player:add_vcoin_bind(1000);
				player:alert(11,0,"成就点数:增加4000");
				player:alert(11,0,"绑定元宝:增加1000");
				player:alert(11,0,"经验增加:20000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(400);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*10000);
					player:add_vcoin_bind(100);
					player:alert(11,0,"成就点数:增加400");
					player:alert(11,0,"绑定元宝:增加100");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*10000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)*2));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*10000);
					player:add_vcoin_bind(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)*2));
					player:alert(11,0,"绑定元宝:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*10000));
				end
			end
		else
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(2000);
				player:add_exp(10000000);
				player:add_vcoin_bind(500);
				player:alert(11,0,"成就点数:增加2000");
				player:alert(11,0,"绑定元宝:增加500");
				player:alert(11,0,"经验增加:10000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(200);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:add_vcoin_bind(50);
					player:alert(11,0,"成就点数:增加200");
					player:alert(11,0,"绑定元宝:增加50");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:add_vcoin_bind(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/4));
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:alert(11,0,"绑定元宝:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/4));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				end
			end
		end
	end
	if player:get_team_name() == "红方阵营" then
		player:alert(11,1,"很遗憾您输掉了本次战场!");
		local t = os.date("%m%d",os.time());
		if server.get_temp_var("sbzc") == "1" then
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(2000);
				player:add_exp(10000000);
				player:alert(11,0,"成就点数:增加2000");
				player:alert(11,0,"经验增加:10000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(200);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:alert(11,0,"成就点数:增加200");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*5000);
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/1));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*5000));
				end
			end
		else
			if util.ppn(player,const.PP_SMZCJIFEN) >= 2000 then
				player:achieve_add_point(1000);
				player:add_exp(5000000);
				player:alert(11,0,"成就点数:增加1000");
				player:alert(11,0,"经验增加:5000000");
			else
				if util.ppn(player,const.PP_SMZCJIFEN) <= 200 then
					player:achieve_add_point(100);
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*2500);
					player:alert(11,0,"成就点数:增加100");
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*2500));
				else
					player:achieve_add_point(math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:add_exp(util.ppn(player,const.PP_SMZCJIFEN)*2500);
					player:alert(11,0,"成就点数:增加"..math.floor(util.ppn(player,const.PP_SMZCJIFEN)/2));
					player:alert(11,0,"经验增加:"..(util.ppn(player,const.PP_SMZCJIFEN)*2500));
				end
			end
		end
	end
	if player:get_name() == server.get_var("smzcpma1") and server.get_var("zhanchangmvp") == "" then
		server.set_var("zhanchangmvp",1);
		player:achieve_add_point(2000);
		player:alert(11,0,"恭喜您获得本次战场积分排名第一!");
		player:alert(11,0,"成就点数:增加2000");
	end
	player:alert(10,0,"您的当前成就:"..player:achieve_get_point().."点");
	player:set_param(const.PP_SMZCHOUR,0);
	player:set_param(const.PP_SMZCZHENY,0);
	player:set_param(const.PP_SMZCKILL,0);
	player:set_param(const.PP_SMZCJIFEN,0);
	player:dart_task_succeed();
	player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
	player:set_timer(6,1000);
end