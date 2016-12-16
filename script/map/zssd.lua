module(..., package.seeall)

function onPlayerEnter(map,player)
	if map:get_id() == "zssd2" then
		local map1 = server.find_map("zssd1");
		if map1:num_monster("[一转]赤焰魔君") == 1 then
			player:set_timer(14,1);
		end
	end
	if map:get_id() == "zssd3" then
		local map1 = server.find_map("zssd2");
		if map1:num_monster("[二转]鬼斧恶魔") == 1 then
			player:set_timer(14,1);
		end
	end
	if map:get_id() == "zssd4" then
		local map1 = server.find_map("zssd3");
		if map1:num_monster("[三转]暗夜领主") == 1 then
			player:set_timer(14,1);
		end
	end
end

function onPlayerLeave(map,player)
end