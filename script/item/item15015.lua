module(..., package.seeall)

function mylp(player)
	if player:get_level() >= 40 then
		player:enter_map("maya1",162,167);
		player:set_timer(const.PT_MAYA,3600000);
		player:alert(111,0,"玛雅神殿可掉落所有装备,限时1小时");
		go.givehuicheng(player);
	else
		player:alert(111,0,"进入玛雅神殿需要等级达到40级以上");
	return 0;
	end
end
