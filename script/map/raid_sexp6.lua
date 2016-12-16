module(..., package.seeall)
function onPlayerEnter(map,player)
	player:set_task_state(const.TASK_ID_FUBEN_SEXP,task.util.ts(6,const.TSACED));
	player:set_task_param(const.TASK_ID_FUBEN_SEXP,1,player:get_map():num_monster());
	player:push_task_data(const.TASK_ID_FUBEN_SEXP,0);
end
function onPlayerLeave(map,player)
	player:set_task_state(const.TASK_ID_FUBEN_SEXP,0);
	player:push_task_data(const.TASK_ID_FUBEN_SEXP,0);
	if map:num_player() <= 0 then	map:clear_mon();map:clear_item();end;
end
function onTimer1(map)
	map:map_exe("go.soonhome");
end
