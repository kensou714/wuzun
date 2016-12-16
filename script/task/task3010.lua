module(..., package.seeall)
require "task.util"
local task_id=const.TASK_ID_TIE;
local task_data={
	ttype="日常",		focus=false,		autogo=false,
	[1	]={need_level=40,	max_level=1000,	need_map='v001',need_map_name="猛犸寺庙",    },
	[2	]={need_level=40,	max_level=1000,	need_map='v001',need_map_name="魔魂殿1",    },
	[3	]={need_level=40,	max_level=1000,	need_map='v001',need_map_name="魔魂殿2",    },
	[4	]={need_level=40,	max_level=1000,	need_map='v001',need_map_name="魔魂殿3",    },
	[5	]={need_level=45,	max_level=1000,	need_map='v001',need_map_name="蛮牛洞1",    },
	[6	]={need_level=45,	max_level=1000,	need_map='v001',need_map_name="蛮牛洞2",    },
	[7	]={need_level=45,	max_level=1000,	need_map='v001',need_map_name="蛮牛洞3",    },
	[8	]={need_level=50,	max_level=1000,	need_map='v001',need_map_name="妖月峡谷1",    },
	[9	]={need_level=50,	max_level=1000,	need_map='v001',need_map_name="妖月峡谷2",    },
	[10	]={need_level=50,	max_level=1000,	need_map='v001',need_map_name="妖月峡谷3",    },
	[11	]={need_level=50,	max_level=1000,	need_map='v001',need_map_name="妖月峡谷4",    },
	[12	]={need_level=50,	max_level=1000,	need_map='v001',need_map_name="妖月峡谷5",    },
	[13	]={need_level=50,	max_level=1000,	need_map='v001',need_map_name="妖月峡谷6",    },
	[14	]={need_level=55,	max_level=1000,	need_map='v001',need_map_name="巨灵石窟1",    },
	[15	]={need_level=55,	max_level=1000,	need_map='v001',need_map_name="巨灵石窟2",    },
	[16	]={need_level=55,	max_level=1000,	need_map='v001',need_map_name="巨灵石窟3",    },
	[17	]={need_level=60,	max_level=1000,	need_map='v001',need_map_name="混沌之门1",    },
	[18	]={need_level=60,	max_level=1000,	need_map='v001',need_map_name="混沌之门2",    },
	[19	]={need_level=60,	max_level=1000,	need_map='v001',need_map_name="混沌之门3",    },
	[20	]={need_level=65,	max_level=1000,	need_map='v001',need_map_name="冰封雪域1",    },
	[21	]={need_level=65,	max_level=1000,	need_map='v001',need_map_name="冰封雪域2",    },
	[22	]={need_level=65,	max_level=1000,	need_map='v001',need_map_name="冰封雪域3",    },
	[23	]={need_level=70,	max_level=1000,	need_map='v001',need_map_name="地狱熔岩1",    },
	[24	]={need_level=70,	max_level=1000,	need_map='v001',need_map_name="地狱熔岩2",    },
	[25	]={need_level=70,	max_level=1000,	need_map='v001',need_map_name="地狱熔岩3",    },
};
local task_state_data={};
local lv_mul={[0]=1,1,2,4,8};--经验倍数
local need_item_list={
	"初级英雄帖",
	"中级英雄帖",
	"高级英雄帖",
	"超级英雄帖",
};--需要的英雄帖道具
for i=1,#task_data do
	task_data[i].tid=i;task_data[i].nid=i;
	task_data[i].need_target_lv=task_data[i].need_level;
	task_data[i].name="英雄帖";
	task_data[i].accepter="";
	task_data[i].doner="";
	task_data[i].need_type="mon";
	task_data[i].need_num=80;
	task_data[i].need_target="";
	task_data[i].accept_talk=function (npc,player,td)
		local p = util.ppn(player,const.PP_YXTIE_LV);
		if p == 0 then set_task_level(player,1);p = util.ppn(player,const.PP_YXTIE_LV);end;
		local ret = "<s='e'>任务名称</s>:" .. need_item_list[p];
		ret = ret .. "\n\n<s='e'>任务目标</s>:击杀"..td.need_num.."个"..td.need_target_lv.."级以上的怪物";
		ret = ret .. "\n\n<s='e'>任务描述</s>:王城城主最近广发英雄帖,邀请江\n         湖豪杰一起消灭魔怪,你愿意接受\n         考验吗?";
		--ret = ret .. "\n经验倍数:[<s='c'>".. lv_mul[p] .. "</s>]倍";
		if const.YXTIE_MAX_NUM > util.ppn(player,const.PP_YXTIE_NUM) then
			ret = ret .. "\n\n<s='e'>剩余次数</s>:今天还可以接受[<s='c'>".. const.YXTIE_MAX_NUM - util.ppn(player,const.PP_YXTIE_NUM) .. "</s>]次英雄帖\n\n";
		else
			ret = ret .. "\n\n<s='r'>您今天的英雄帖任务已全部完成!</s>\n\n";
		end
		return ret;
	end;
	task_data[i].done_talk  =function (npc,player,td) return "看你的能力真是不可小觑啊!这么一会功夫就完成任务啦!这是给你的奖励!";end;
	task_data[i].award={alert=true;
		{name="经验",		num=function(target,player) return math.floor(lv_mul[util.ppn(player,const.PP_YXTIE_LV)]*math.min(80,player:get_level())*math.min(80,player:get_level())*80*3.907);end,},
	};
	task_data[i].complate_hook=function(n,player,td) player:alert(11,1,"您已完成本次英雄帖任务!");player:set_free_direct_fly(player:get_free_direct_fly()+1);end
end
function set_task_level(player,lv)
	player:set_param(const.PP_YXTIE_LV,lv);
end
function onGetTaskName(player)
	task.util.show_task_name(player,player,task_id,task_data);
end
function onGetTaskShortDesp(player)
	task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);
end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(target,player)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=task_state_data[s];
	local n=task_data[b];
	if k and n then
		target:echo("<br>");
		if type(k.talk)=="string" then target:echo(k.talk); end
		if type(k.talk)=="function" then target:echo(k.talk(target,player,n)); end
		task.util.show_award(target,player,n.award);
		if d == const.TSACCE then
			target:echo("		    <a href='event:talk_T"..task_id.."Do'>【接受英雄帖任务】</a>\n");
		end
		if d == const.TSCOMP then
			target:echo("		    <a href='event:talk_T"..task_id.."Do'>【完成英雄帖任务】</a>\n");
		end
	end
end
function get_npc_flags(npc,player)
	return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);
end

function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_mon_kill_all(player,mon)		task.util.check_mon_kill_all(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)
	check_yxtie_day(player);
	if player:get_task_state(task_id) == 0 then
		if player:get_level() >= 40 then
			local nid = gen_next_id(player);
			player:set_task_state(task_id,task.util.ts(nid,const.TSACCE));
			player:push_task_data(task_id,0);
		end
	end
	task.util.check_level(player,lv,task_id,task_state_data,task_data);
end
function check_yxtie_day(player)
	if util.ppn(player,const.PP_YXTIE_DAY) ~= today() then
		player:set_param(const.PP_YXTIE_DAY,today());
		if util.ppn(player,const.PP_YXTIE_NUM) > 0 then player:set_param(const.PP_YXTIE_NUM,0);end;
		player:set_task_state(task_id,player:get_task_state(task_id));
		player:push_task_data(task_id,0);
		player:refresh_npc_show_flags_inview();
	end
end
function gen_next_id(player)
	local a={};
	local pl = player:get_level();
	for i=1,#task_data do
		if pl >= task_data[i].need_level and pl <= task_data[i].max_level then
			a[#a+1]=i;
		end
	end
	if #a > 0 then return a[math.random(1,#a)]; end;
	return 1;
end
_M['onTalkT'..task_id..'Show']=function (player) task.util.show_task_talk(player,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (player) return task.util.task_done(player,player,task_id,task_state_data,task_data); end
cklevel.add_listener(check_level);
local need_item_list={
	"初级英雄帖",
	"中级英雄帖",
	"高级英雄帖",
	"超级英雄帖",
};
for i=1,#task_data do
	local td = task_data[i];
	task.util.build_task_state(task_id,task_data[i],task_data,task_state_data);
	if task_data[i].need_type == "mon" then
		if task_data[i].need_target == "" then
			ckmon.add_all_listener(check_mon_kill_all);
		else
			ckmon.add_listener(posmon.n(task_data[i].need_target),check_mon_kill);
		end
	end
	if task_data[i].need_type == "item" then
		ckitem.add_listener(task_data[i].need_item,check_item_change);
	end
	task_state_data[task.util.ts(td.tid,const.TSACCE)].shortdesp=nil;
	task_state_data[task.util.ts(td.tid,const.TSACCE)].desp="收集英雄帖双击打开接受任务.<br><br><s='r'>英雄帖可以在副本和BOSS身上获得!</s>";
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done2 = task_state_data[task.util.ts(td.tid,const.TSACCE)].done;
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done=function(npc,player)
		if util.ppn(player,const.PP_YXTIE_NUM) < const.YXTIE_MAX_NUM then
			local p = util.ppn(player,const.PP_YXTIE_LV);
			if need_item_list[p] then
				local num = player:num_item(need_item_list[p]);
				if num > 0 then
					player:remove_item(need_item_list[p],1);
					player:set_param(const.PP_YXTIE_NUM,util.ppn(player,const.PP_YXTIE_NUM)+1);
					local ret= task_state_data[task.util.ts(td.tid,const.TSACCE)].done2(npc,player);
					if ret == 100 then
						show_fly(player,player);
					end
					return ret;
				end
			end
		else
			player:alert(1,1,"您今天的英雄帖任务已经全部完成!");
			return 100;
		end
	end
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp="<a href='event:click_T"..task_id.."CDone'>完成任务并领取奖励</a>";
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].desp="在任务追踪中完成任务";
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done=function (npc,player)
		local p = util.ppn(player,const.PP_YXTIE_LV);
		if p == 0 then set_task_level(player,1);p = util.ppn(player,const.PP_YXTIE_LV);end;
		player:alert(1,1,"恭喜您成功领取[英雄帖]奖励:");
		task.util.give_award(player,td.award);
		local nid = gen_next_id(player);
		player:set_task_state(task_id,task.util.ts(nid,const.TSACCE));
		player:push_task_data(task_id,0);
		return 100;
	end;
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;
--下面这个函数可以用来确保任务还有多少次.用在主线或支线里面放置任务做完了卡住.
function maintask_fix(player,num)
	if util.ppn(player,const.PP_YXTIE_NUM) >= const.YXTIE_MAX_NUM then
		player:set_param(const.PP_YXTIE_NUM,util.ppn(player,const.PP_YXTIE_NUM)-num);
		task.util.check_level(player,player:get_level(),task_id,task_state_data,task_data);
	end
end
function show_fly(npc,player) show_fly2(npc,player,task_id,task_state_data,task_data);end
function show_fly2(target,player,task_id,data,td)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=data[s];
	local n=td[b];
	if k and n then
		if d == const.TSACED then
			local p = util.ppn(player,const.PP_YXTIE_LV);
			if p == 0 then set_task_level(player,1);p = util.ppn(player,const.PP_YXTIE_LV);end;
			local ret = "<s='e'>任务名称</s>:" .. need_item_list[p];
			ret = ret .. "\n\n<s='e'>任务目标</s>:击杀"..n.need_num.."个"..n.need_target_lv.."级以上的怪物";
			ret = ret .. "\n\n<s='e'>任务描述</s>:王城城主最近广发英雄帖,邀请江\n         湖豪杰一起消灭魔怪,你愿意接受\n         考验吗?";
			if const.YXTIE_MAX_NUM > util.ppn(player,const.PP_YXTIE_NUM) then
				ret = ret .. "\n\n<s='e'>剩余次数</s>:今天还可以接受[<s='c'>".. const.YXTIE_MAX_NUM - util.ppn(player,const.PP_YXTIE_NUM) .. "</s>]次英雄帖\n\n";
			else
				ret = ret .. "\n\n<s='r'>您今天的英雄帖任务已全部完成!</s>\n\n";
			end
			target:echo(ret);
			target:echo("<br>");
			target:echo("<s='e'>直接传送</s>:我能将您传送到"..posmap.mp(n.need_map_name)..",你现在确定要前往吗??");
			target:echo("<br><br>                  <a href='event:talk_T"..task_id.."Go'>【点击立刻前往】</a><br><br>");
			task.util.show_award(target,player,n.award);
		end
	end
end
_M['onTalkT'..task_id..'Go']=function (player)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=task_state_data[s];
	local n=task_data[b];
	if d == const.TSACED then
		--posmon.fly(player,n.need_target);
		posmap.fly(player,n.need_map_name);
	end
end
check_done_talk=_M['onTalkT'..task_id..'Do'];
cktalk.add_listener("T"..task_id.."CDone",check_done_talk);
