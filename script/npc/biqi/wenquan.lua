module(..., package.seeall)
util.use_function(_M,task.task1000);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end


function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
		npc:echo([[

##continue## <s='tb'>没事泡泡温泉,对身体好哦!</s><l>]]);
		npc:echo([[

##tasktitle## <a href="event:talk_jrwenquan">点击进入泡温泉</a>]]);
end

function onTalkjrwenquan(npc,player)
	if tonumber(server_start_day()) >= 1 then
		local h = os.date("%H%M",os.time());
		if tonumber(h) >= 1200 and tonumber(h) <= 1229 or tonumber(h) >= 1800 and tonumber(h) <= 1829 or server.get_temp_var("wenquan") == "1" then
			if player:get_level() >= 40 then
				local map = server.find_map("wenquan");
				local x,y;
				x,y=map:gen_rand_position();
				if( x and y )then
					player:enter_map("wenquan",x,y);
					server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从云霄城进入了温泉!");
					go.givehuicheng(player);
				end
			else
				player:alert(1,1,"想要泡温泉?你还是先到40级再说吧!!");
				onTalk100(npc,player);
			end
		else
			player:alert(1,1,"温泉馆只在中午[12:00-12:30]和下午[18:00-18:30]营业哦!");
			onTalk100(npc,player);
		end
	else
		player:alert(1,1,"[温泉馆]将于明天正式开始营业哦!届时欢迎您的大驾光临!!");
		onTalk100(npc,player);
	end
end
