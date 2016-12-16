module(..., package.seeall)




function onTalkjf(player)
	player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
end




function onTalktuichu(player)
	player:set_timer(6,1000);
end



function onTalkping(player)
	player:alert(11,1,"本次战场以平局而告终!");
		if server.get_temp_var("sbzc") == "1" or (ymd() >= 20140117 and ymd() <= 20140119) or (ymd() >= 20140111 and ymd() <= 20140113)then
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
	player:set_timer(6,1000);
end



function onTalkshenzu(player)
	if player:get_team_name() == "神族阵营" then
		player:alert(11,1,"恭喜您赢得了战场的胜利![成就点数*2]");
		if server.get_temp_var("sbzc") == "1" or (ymd() >= 20140117 and ymd() <= 20140119) or (ymd() >= 20140111 and ymd() <= 20140113)then
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
	if player:get_team_name() == "魔族阵营" then
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
	player:set_timer(6,1000);
end

function onTalkmozu(player)
	if player:get_team_name() == "魔族阵营" then
		player:alert(11,1,"恭喜您赢得了战场的胜利![成就点数*2]");
		if server.get_temp_var("sbzc") == "1" or (ymd() >= 20140117 and ymd() <= 20140119) or (ymd() >= 20140111 and ymd() <= 20140113)then
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
	if player:get_team_name() == "神族阵营" then
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
	player:set_timer(6,1000);
end