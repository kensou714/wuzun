module(..., package.seeall)

--成就触发
function onAchieveStateChange(player,achieve_id,state,param)
	if player:achieve_get_param(1002) == 1 and util.ppn(player,const.PP_ACHIEVE_FIRSTFRIEND) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTFRIEND,10)
		newgui.achieve.fresh_achieve_title(player,1)
		player:alert(11,1,"恭喜您成功完成目标:第一次添加好友!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if player:achieve_get_param(1003) == 1 and util.ppn(player,const.PP_ACHIEVE_FIRSTGROUP) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTGROUP,10)
		newgui.achieve.fresh_achieve_title(player,1)
		player:alert(11,1,"恭喜您成功完成目标:第一次组队!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if player:achieve_get_param(1004) == 1 and util.ppn(player,const.PP_ACHIEVE_FIRSTGUILD) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTGUILD,10)
		newgui.achieve.fresh_achieve_title(player,1)
		player:alert(11,1,"恭喜您成功完成目标:第一次加入行会!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if player:achieve_get_param(1006) == 1 and util.ppn(player,const.PP_ACHIEVE_FIRSTQHUA) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTQHUA,10)
		newgui.achieve.fresh_achieve_title(player,1)
		player:alert(11,1,"恭喜您成功完成目标:第一次强化!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if player:achieve_get_param(1007) == 1 and util.ppn(player,const.PP_ACHIEVE_FIRSTJLIAN) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTJLIAN,10)
		newgui.achieve.fresh_achieve_title(player,1)
		player:alert(11,1,"恭喜您成功完成目标:第一次精炼!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if player:achieve_get_param(1004) == 1 and player:get_task_state(1106) == 1 then
		player:set_task_state(1106,2); player:push_task_data(1106,0);
		player:add_exp(100000);
		player:alert(10,1,"成功完成<font color='#ff0000'>神器进阶任务!</font>")
		player:alert(10,0,"经验值增加: <font color='#ff0000'>100000</font>")
	end
end