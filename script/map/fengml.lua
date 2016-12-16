module(..., package.seeall)
function onPlayerEnter(map,play)
	play:set_task_state(const.TASK_ID_FUBEN_FENGML,task.util.ts(1,const.TSACED));
	play:set_task_param(const.TASK_ID_FUBEN_FENGML,1,10000);
	play:set_task_param(const.TASK_ID_FUBEN_FENGML,2,0);
	play:set_task_param(const.TASK_ID_FUBEN_FENGML,3,0);
	play:set_task_param(const.TASK_ID_FUBEN_FENGML,4,0);
	play:push_task_data(const.TASK_ID_FUBEN_FENGML,0);
	map:clear_mon();
	map:clear_tower();
	player.ijclear(play);
	play:clear_tower();
end
function onPlayerLeave(map,play)
	play:set_task_state(const.TASK_ID_FUBEN_FENGML,0);
	play:push_task_data(const.TASK_ID_FUBEN_FENGML,0);
	map:clear_mon();
	map:clear_tower();
	play:clear_tower();
	play:set_param(const.PP_SHOUWEI_NUM,0);
	play:set_param(const.PP_FMKILL_MON,0);
	play:set_param(const.PP_FMKILL_EXP,0);
	play:set_param(const.PP_FENGMOLING_YUSHINUM,0);
	play:set_timer(14,0);
	play:set_timer(15,0);
	play:set_temp_param(const.PTP_FENGMO_MON_NUMBER,0);
	player.ijclear(play);
	play:set_panel_data("panelleft","leftcount","act1",-1);
	play:push_ckpanel_data("left","panelleft");
	play:set_panel_data("panelmonster","panelmonster","panel_visible","false");
	play:push_ckpanel_data("monster","panelmonster");
end

