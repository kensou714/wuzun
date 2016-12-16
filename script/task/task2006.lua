module(..., package.seeall)
local task_id=const.TASK_ID_FUBEN_FENGML;
local task_data={
	ttype="副本",		focus=true,		autogo=false,
	[1	]={
		tid=1,		nid=1,		need_level=50,		name="守卫试炼",	accepter="副本使者",	doner="副本使者",
		need_type="mon",	need_target="",	need_map='rs%d',need_num=486,
		award={
			{name="经验",		num=function(target,player) return math.min(80,player:get_level())*math.min(80,player:get_level())*181;end,},
			{name="绑定金币",	num=0,},
		},
	},
};
local task_state_data={};

function onGetTaskName(player)			task.util.show_task_name(player,player,task_id,task_data);end
function onGetTaskShortDesp(player)		task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(npc,player)			task.util.show_task_title(npc,player,task_id,task_state_data,task_data);end
function get_npc_flags(npc,player)		return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);end

function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)		task.util.check_level(player,lv,task_id,task_state_data,task_data);end

function checkhighestyushi(player)
	if util.ppn(player,const.PP_FENGMOLING_YUSHINUM) > util.ppn(player,const.PP_FENGMOLING_YUSHINUM_HIGHEST) then
		player:set_param(const.PP_FENGMOLING_YUSHINUM_HIGHEST,util.ppn(player,const.PP_FENGMOLING_YUSHINUM));
	end  
	if util.ppn(player,const.PP_FMKILL_EXP) > util.ppn(player,const.PP_FMKILL_EXP_HIGHEST) then
		player:set_param(const.PP_FMKILL_EXP_HIGHEST,util.ppn(player,const.PP_FMKILL_EXP));
	end
end

function check_done_talk(player,param)
	if nil == string.find(player:get_map():get_id(),"fengml") then
		player:set_task_state(const.TASK_ID_FUBEN_FENGML,0);
		player:push_task_data(const.TASK_ID_FUBEN_FENGML,0);
		return ;
	end
	player:add_exp(util.ppn(player,const.PP_FMKILL_EXP));--领取经验
	player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+util.ppn(player,const.PP_FENGMOLING_YUSHINUM));--领取玉石
	checkhighestyushi(player);
	player:alert(11,0,"守卫试炼结束,获得玉石"..util.ppn(player,const.PP_FENGMOLING_YUSHINUM)..",获得经验"..util.ppn(player,const.PP_FMKILL_EXP).."");
	player:go_home();
end

function check_go_home(player,param)
	if nil == string.find(player:get_map():get_id(),"fengml") then
		return ;
	end
	player:add_exp(util.ppn(player,const.PP_FMKILL_EXP));--领取经验
	player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+util.ppn(player,const.PP_FENGMOLING_YUSHINUM));--领取玉石
	checkhighestyushi(player);
	player:alert(11,0,"守卫试炼结束,获得玉石"..util.ppn(player,const.PP_FENGMOLING_YUSHINUM)..",获得经验"..util.ppn(player,const.PP_FMKILL_EXP).."");
	player:go_home();
end
_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end

cktalk.add_listener("T2001Done",check_done_talk);
cktalk.add_listener("T2002Done",check_go_home);
cklevel.add_listener(check_level);
function give_award(player,data)
	for i=1,#data do
		if data[i].job==nil or data[i].job=="all" or data[i].job==player:get_job_name() then
			if data[i].gender==nil or data[i].gender=="all" or data[i].gender==player:get_gender_name() then
				local num=data[i].num;
				if type(data[i].num)=="function" then num = data[i].num(target,player); end
				player:add_item(data[i].name,num,data[i].bind,data[i].use_bind,nil,nil,nil,nil,nil,nil,nil,nil,2);
				player:alert(1,0,"成功领取["..data[i].name.."*"..num.."].");
			end
		end
	end
end
for i=1,#task_data do
	local td = task_data[i];
	task.util.build_task_state(task_id,task_data[i],task_data,task_state_data);
	if task_data[i].need_type == "mon" then
		if task_data[i].need_target == "" then
			ckmon.add_all_listener(check_mon_kill);
		else
			ckmon.add_listener(task_data[i].need_target,check_mon_kill);
		end
	end
	if task_data[i].need_type == "item" then
		ckitem.add_listener(task_data[i].need_item,check_item_change);
	end
	task_state_data[task.util.ts(td.tid,const.TSACCE)]=nil;
	task_state_data[task.util.ts(td.tid,const.TSUNAC)]=nil;
	task_state_data[task.util.ts(td.tid,const.TSACED)].shortdesp =function (target,player) 
		local ret = "通关条件:<s='r'>保护试炼图腾</s>\n剩余血量:<s='r'>##task_param_5##</s>\n已召唤守卫:<s='r'>##task_param_2##</s>\n";
		ret = ret .. "\n";
		ret = ret .. "副本奖励：\n";
		ret = ret .. "已获得玉石:<s='r'>##task_param_3##</s>\n已获得经验:<s='r'>##task_param_4##</s>\n";
		ret = ret .. "\n";
		ret = ret .. "<a href='event:click_T2001Done'>离开守卫试炼</a>\n";
		ret = ret .. "<font color='#ffff00'>------------------------</font>\n";
		ret = ret .. "提示：召唤守卫挑战将更加轻松！\n";
		return ret;
	end;
	task_state_data[task.util.ts(td.tid,const.TSACED)].on_mon_kill =function (mon,player,group)
		if mon:get_name() == td.need_target or td.need_target=="" then
			player:set_task_param(const.TASK_ID_FUBEN_FENGML,4,util.ppn(player,const.PP_FMKILL_EXP));
			player:set_task_param(const.TASK_ID_FUBEN_FENGML,3,util.ppn(player,const.PP_FENGMOLING_YUSHINUM));
			if  util.ppn(player,const.PP_FMKILL_MON) == td.need_num  then---杀怪数量达到600结束
				player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
				--player:set_param(const.PP_FENGMOLING_YUSHINUM,util.ppn(player,const.PP_FENGMOLING_YUSHINUM)+1500);
				--if task_data.autogo then posnpc.go(player,td.doner);end
				focus.f(player,"mini_task");
			end
			if player:get_task_param(task_id,1) <= 0  then---图腾死亡血量为0
				player:alert(1,0,"图腾死亡,您将离开此地图,获得相应的玉石和经验.");
			end
			player:push_task_data(task_id,0);
		end
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp=function (target,player)
		player:alert(1,0,"副本已通关,请从任务追踪领取通关奖励.");
		local ret = "<s='d'>您已经成功完成该副本!</s>\n";
		local ret = "已获得玉石:<s='r'>##task_param_3##</s>\n已获得经验:<s='r'>##task_param_4##</s>\n";
		ret = ret .. "<a href='event:click_T2002Done'>领取副本奖励</a>";
		return ret;
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].desp=function (target,player) return "副本已完成";end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].talk="";
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done=function (npc,player)
		player:set_task_state(const.TASK_ID_FUBEN_FENGML,0);
		player:push_task_data(const.TASK_ID_FUBEN_FENGML,0);
		player:go_home();
		--posnpc.fly(player,"副本使者");
	end;
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;

