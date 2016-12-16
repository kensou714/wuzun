module(..., package.seeall)


function onPlayerEnter(map,player)
	player:set_mount_info(0,0,0);
	player:set_mount_show(0);
	player:set_timer(12,1000);
	player:clear_slave();
	player:clear_mofadun();
	if tonumber(server_start_day()) >= 1 then
		local h = os.date("%H%M",os.time());
		if tonumber(h) >= 1200 and tonumber(h) <= 1229 or tonumber(h) >= 1800 and tonumber(h) <= 1829 or server.get_temp_var("wenquan") == "1" then
			if player:get_level() >= 40 then
			local pdjy= math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*math.min(80,player:get_level())*0.1627);
				player:set_status(14,1800,pdjy,15,11);
			end
		end
	end
end

function onPlayerLeave(map,player)
	player:set_timer(12,0);
	player:set_status(14,0,0,60,11);
end