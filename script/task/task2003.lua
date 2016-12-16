module(..., package.seeall)
local task_id=const.TASK_ID_FUBEN_GUILD;
local task_data={
	ttype="副本",		focus=true,		autogo=false,
	[1	]={
		tid=1,		nid=1,		need_level=45,		name="行会副本",	accepter="行会副本",	doner="行会副本",
		need_type="mon",	need_target="",	need_map='hhfb%d',need_num=1,
		award={
			{name="经验",		num=function(target,player) return math.min(80,player:get_level())*math.min(80,player:get_level())*181;end,},
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
function check_level(player,lv)			task.util.check_level(player,lv,task_id,task_state_data,task_data);end
function check_done_talk(player,param)
	if nil == string.find(player:get_map():get_id(),"hhfb%d") then
		return ;
	end
	if player:get_map():num_monster() <= 0 then
		task.util.task_done(nil,player,task_id,task_state_data,task_data);
	end
end
function check_go_home(player,param)
	if nil == string.find(player:get_map():get_id(),"hhfb%d") then
		return ;
	end
	posnpc.fly(player,"行会副本");
end
_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end

cktalk.add_listener("T2001Done",check_done_talk);
cktalk.add_listener("T2002Done",check_go_home);
cklevel.add_listener(check_level);
function show_award(target,player,data)
	local ret = "\n<s='c'>副本奖励:</s>\n<s='e'>";
	for i=1,#data do
		if data[i].job==nil or data[i].job=="all" or (player and data[i].job==player:get_job_name()) then
			if data[i].gender==nil or data[i].gender=="all" or data[i].gender==player:get_gender_name() then
				local num=data[i].num;
				if type(data[i].num)=="function" then num = data[i].num(target,player); end
				if num > 0 then
					ret = ret ..data[i].name.." ".. num .."\n";
				else
					ret = ret ..data[i].name.."\n";
				end
			end
		end
	end
	ret = ret .."</s>\n";
	return ret;
end
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
		local ret = "通关条件:<s='r'>消灭所有怪物</s>\n剩余怪物:<s='r'>##task_param_1##只</s>\n";
		ret = ret .. show_award(target,player,td.award);
		ret = ret .. "<a href='event:click_T2002Done'>离开副本地图</a>\n";
		ret = ret .. "<font color='#ffff00'>---------------------------</font>\n";
		ret = ret .. "<s='r'>提示:消灭BOSS可掉落高级装备</s>";
		return ret;
	end;
	task_state_data[task.util.ts(td.tid,const.TSACED)].desp =function (target,player) 
		return "清除地图中所有的怪物,剩余怪物数量:##task_param_1##";
	end;
	task_state_data[task.util.ts(td.tid,const.TSACED)].on_mon_kill =function (mon,player,group) 
		if td.need_map and nil == string.find(mon:get_map():get_id(),td.need_map) then
			return ;
		end
		if mon:get_name() == td.need_target or td.need_target=="" then
			player:set_task_param(task_id,1,player:get_map():num_monster());
			if player:get_task_param(task_id,1) <= 0 then
				player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
				if task_data.autogo then posnpc.go(player,td.doner);end
				focus.f(player,"mini_task");
				player:get_map():map_exe("task.task2003.handletaskcomp");
			end
			player:push_task_data(task_id,0);
		end
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp=function (target,player)
		player:alert(1,0,"副本已通关,请从任务追踪领取通关奖励.");
		local ret = "<s='d'>您已经成功完成该副本!</s>\n";
		ret = ret .. show_award(target,player,td.award);
		ret = ret .. "<a href='event:click_T2001Done'>领取副本奖励</a>";
		return ret;
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].desp=function (target,player) return "副本已完成";end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].talk="";
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done=function (npc,player)
		give_award(player,td.award);
		player:set_task_state(task_id,0);
		player:push_task_data(task_id,0);
		posnpc.fly(player,"行会副本");
	end;
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;

function handletaskcomp(player)
	local s = player:get_task_state(task_id);
	if s == task.util.ts(1,const.TSACED) then
		player:set_task_state(task_id,task.util.ts(1,const.TSCOMP));
		player:set_task_param(task_id,1,0);
		player:push_task_data(task_id,0);
	end
end