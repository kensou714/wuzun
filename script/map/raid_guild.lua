module(..., package.seeall)
function onPlayerEnter(map,player)
	player:set_task_state(const.TASK_ID_FUBEN_GUILD,task.util.ts(1,const.TSACED));
	player:set_task_param(const.TASK_ID_FUBEN_GUILD,1,player:get_map():num_monster());
	player:push_task_data(const.TASK_ID_FUBEN_GUILD,0);
end
function onPlayerLeave(map,player)
	player:set_task_state(const.TASK_ID_FUBEN_GUILD,0);
	player:push_task_data(const.TASK_ID_FUBEN_GUILD,0);
	check_fuben_end(map);
end
function onTimer1(map)
	map:set_var("guildname","");
	map:map_exe("go.soonhome");
end
function onTimer2(map)
	check_fuben_end(map);
end
function check_fuben_end(map)
	if map:num_player() <= 0 then
		map:clear_mon();map:clear_item();
		map:set_var("guildname","");
	end;
end
