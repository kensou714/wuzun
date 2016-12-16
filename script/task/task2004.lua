module(..., package.seeall)
local task_id=const.TASK_ID_ZMT3;
function to_exp(player)
	if player:get_level() >= 80 then
		return math.ceil(80*80*80*(util.ppn(player,const.PP_ZMT3_LV)) *(6.6132));
	else
		return math.ceil(player:get_level()*player:get_level()*player:get_level()*(util.ppn(player,const.PP_ZMT3_LV)) *(6.6132));
	end
end
local task_data={
	ttype="镇魔",		focus=true,		autogo=false,
	[1	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[2	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[3	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[4	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[5	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[6	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[7	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[8	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[9	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[10	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[11	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },	},},
	[12	]={ award={	{name="经验",		num=function(target,player) return to_exp(player);end, },{name="五级宝石",num=2,},	},},
};
local task_state_data={};
for i=1,#task_data do
	task_data[i].tid=i;
	task_data[i].nid=i;
	task_data[i].need_level = 1;
	task_data[i].accepter="";
	task_data[i].doner="";
	task_data[i].need_type="mon";
	task_data[i].need_target="";
	task_data[i].need_num=1;
	task_data[i].need_map='mtmt';
	task_data[i].name="镇魔塔"..i.. "层";
end
function onGetTaskName(player)			task.util.show_task_name(player,player,task_id,task_data);end
function onGetTaskShortDesp(player)		task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(npc,player)			task.util.show_task_title(npc,player,task_id,task_state_data,task_data);end
function get_npc_flags(npc,player)		return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);end

function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)			task.util.check_level(player,lv,task_id,task_state_data,task_data);end
function check_done_talk(player,param)
	if nil == string.find(player:get_map():get_id(),"mtmt") then
		return ;
	end
	player:find_road_goto(player:get_map():get_id(),30,30,"镇魔塔使者");
	--if player:get_map():num_monster() <= 0 then
	--	task.util.task_done(npc,player,task_id,task_state_data,task_data);
	--end
end
function show_award(target,player,data)
	local ret = "\n<s='c'>任务奖励:</s>\n<s='e'>";
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
function check_go_home(player,param)
	if nil == string.find(player:get_map():get_id(),"mtmt") then
		return ;
	end
	posnpc.fly(player,"镇魔使者");
end
_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end

cktalk.add_listener("T2001Done",check_done_talk);
cktalk.add_listener("T2002Done",check_go_home);
cklevel.add_listener(check_level);
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
			end
			player:push_task_data(task_id,0);
		end
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp=function (target,player)
		player:alert(1,0,"本层已通关,请从任务追踪领取通关奖励.");
		if player and player:get_map() then
			player:find_road_goto(player:get_map():get_id(),30,30,"镇魔塔使者");
		end
		local ret = "<s='d'>您已经通关本层镇魔塔!</s>\n";
		ret = ret .. show_award(target,player,td.award);
		ret = ret .. "<a href='event:click_T2001Done'>找镇魔塔使者领取奖励</a>";
		return ret;
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].desp=function (target,player) return "恭喜您成功通关镇魔塔!";end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].talk="";
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done=function (npc,player)
		give_award(player,td.award);
		player:set_task_state(const.TASK_ID_FUBEN_SEXP,0);
		player:push_task_data(const.TASK_ID_FUBEN_SEXP,0);
		posnpc.fly(player,"镇魔使者");
	end;
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;

