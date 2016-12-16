module(..., package.seeall)

function onPlayerEnter(map,player)
	if map:get_id() == "tmdc" then
		if tonumber(server.get_temp_var("tmd")) == 2 then
			local map1 = server.find_map("tmda");
			local map2 = server.find_map("tmdb");
			if util.ppn(player,const.PP_TIANMOD) == 1 then
				if map1:num_monster("天魔殿统领1") == 1 then
					player:set_timer(9,1);
				end
			else
				if map2:num_monster("天魔殿统领2") == 1 then
					player:set_timer(9,1);
				end
			end
		else
			player:set_timer(9,1);
		end
	end
		player:set_attack_mode(103);
		player:set_lock_attack_mode(1);
end

function onPlayerLeave(map,player)
		player:set_lock_attack_mode(0);
		player:set_attack_mode(100);
end