module(..., package.seeall)

function onPlayerEnter(map,player)
	player:set_status(14,1800,25000,15,11);
	player:set_attack_mode(105);
	player:set_lock_attack_mode(1);
end

function onPlayerLeave(map,player)
	player:set_status(14,0,0,60,11);
	player:set_team_info(0,"");
	player:set_lock_attack_mode(0);
	player:set_attack_mode(100);
	player:black_board(0,"","");
end