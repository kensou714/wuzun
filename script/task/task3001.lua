module(..., package.seeall)
local task_id=const.TASK_ID_FUBEN_I;
local task_data={
	ttype="副本",		focus=false,		autogo=false,
	[1	]={
		tid=1,		nid=1,		need_level=45,		name="副本指引",	accepter="副本使者",	doner="副本使者",
		award={
			{name="经验",		num=1},
		},
	},
};
local task_state_data={};

function onGetTaskName(player)
	if not npc.fuben.check_show_task(player) then return "";end;
	task.util.show_task_name(player,player,task_id,task_data);
end
function onGetTaskShortDesp(player)
	if not npc.fuben.check_show_task(player) then return "";end;
	local s = player:get_task_state(task_id);
	local b = math.floor(s / const.TASK_STATE_NUM);
	local d = math.fmod(s,const.TASK_STATE_NUM);
	local td = task_data[b];
	local n = const.TASK_STATE_NAME[d];
	if td then
		task.util.show_task_type(player,player,task_id,task_data);
		task.util.show_task_name(player,player,task_id,task_data);
		player:echo("<br>找"..posnpc.mp("副本使者"));
	end
end
function onGetTaskDesp(player)
	if not npc.fuben.check_show_task(player) then return "";end;
	local s = player:get_task_state(task_id);
	local b = math.floor(s / const.TASK_STATE_NUM);
	local d = math.fmod(s,const.TASK_STATE_NUM);
	local td = task_data[b];
	local n = const.TASK_STATE_NAME[d];
	if td then
		task.util.show_task_type(player,player,task_id,task_data);
		task.util.show_task_name(player,player,task_id,task_data);
		player:echo("<br>"..posnpc.mp("副本使者"));
	end
end
function get_npc_flags(n,player)
	if not npc.fuben.check_show_task(player) then return 0;end;
	return task.util.get_npc_flags(n,player,task_id,task_state_data,task_data);
end
function check_level(player,lv)
	if player:get_level() >= 45 then
		player:set_task_state(task_id,task.util.ts(1,const.TSACCE));
		player:push_task_data(task_id,0);
	end
end
cklevel.add_listener(check_level);
