module(..., package.seeall)
local task_id=const.TASK_ID_RICHANG3;
local task_data={
	ttype="金币",		focus=false,		autogo=false,
	[1	]={need_level=40,	max_level=1000,	need_target="玫瑰",},
	[2	]={need_level=40,	max_level=1000,	need_target="佛桑花",},
	[3	]={need_level=40,	max_level=1000,	need_target="秋海棠",},
	[4	]={need_level=40,	max_level=1000,	need_target="虞美人",},
	[5	]={need_level=40,	max_level=1000,	need_target="曼陀罗",},
};
local task_state_data={};
for i=1,#task_data do
	task_data[i].tid=i;task_data[i].nid=i;
	task_data[i].name="百花争艳";
	task_data[i].accepter="百花仙子";
	task_data[i].doner="百花仙子";
	task_data[i].need_type="mon";
	task_data[i].need_num=5;
	task_data[i].accept_talk=function (npc,player,td) return "人们总说我人比花娇!少侠,此事你怎么看?好吧!看你也说不出个所以然.那你去帮我摘点花回来,我自有判断!\n\n<font color='#ff0000'>您今天还可以接受[<font color='#ffff00'>".. const.RICHANG3_MAX_NUM - util.ppn(player,const.PP_RICHANG3_NUM) .. "</font>]次百花争艳任务!</font><br><br><font color='#ffff00'>每次任务奖励1点行会贡献 1点行会经验!</font>";end;
	task_data[i].done_talk  =function (npc,player,td) return "哎呦喂!看你细胳膊细腿的!速度还挺快!!这是给你的酬劳!!\n\n<font color='#ff0000'>您今天还可以接受[<font color='#ffff00'>".. const.RICHANG3_MAX_NUM - util.ppn(player,const.PP_RICHANG3_NUM) .. "</font>]次百花争艳任务!</font>";end;
	task_data[i].award={alert=true;
		{name="绑定金币",	num=100000},
	};
	task_data[i].complate_hook=function(n,player,td) player:alert(11,1,"您已完成本次百花争艳任务!");player:set_free_direct_fly(player:get_free_direct_fly()+1);end
	--task_data[i].accept_hook=function (npc,player,td) posmon.fly(player,td.need_target); end;
end

function onGetTaskName(player)
	local s=player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG3_NUM)
	if const.RICHANG3_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG3_MAX_NUM == n) then
		task.util.show_task_name(player,player,task_id,task_data);
	end
end
function onGetTaskShortDesp(player)
	local s=player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG3_NUM)
	if const.RICHANG3_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG3_MAX_NUM == n) then
		task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);
	end
end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(npc,player)			task.util.show_task_title(npc,player,task_id,task_state_data,task_data);end
function get_npc_flags(npc,player)
	local s=player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG3_NUM)
	if const.RICHANG3_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG3_MAX_NUM == n) then
		return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);
	end
	return 0;
end
function check_mon_caiji(player,mon,group)
	if group then return;end;
	local s = player:get_task_state(task_id);
	local b = math.floor(s / const.TASK_STATE_NUM);
	local d = math.fmod(s,const.TASK_STATE_NUM);
	if d ==  const.TSACED then
		if mon:get_name() == task_data[b].need_target then
			player:set_task_param(task_id,1,player:get_task_param(task_id,1)+1);
			if player:get_task_param(task_id,1) >= task_data[b].need_num then
				player:set_task_state(task_id,task.util.ts(b,const.TSCOMP));
				player:alert(11,1,"您已完成本次百花争艳任务!");	
				newgui.guild.AddGuildExpGongxianSame(player,1);
				player:set_free_direct_fly(player:get_free_direct_fly()+1);
				posnpc.go(player,"百花仙子");
				focus.f(player,"mini_task");
			end
			player:push_task_data(task_id,0);
		end
	end
end
function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)
	check_richang_day(player);
	if player:get_task_state(task_id) == 0 then
		if player:get_level() >= 45 then
			local nid = gen_next_id(player);
			player:set_task_state(task_id,task.util.ts(nid,const.TSACCE));
			player:push_task_data(task_id,0);
		end
	end
	task.util.check_level(player,lv,task_id,task_state_data,task_data);
end

function check_richang_day(player)
	if util.ppn(player,const.PP_RICHANG3_DAY) ~= today() then
		player:set_param(const.PP_RICHANG3_DAY,today());
		player:set_param(const.PP_RICHANG3_NUM,0);
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
_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end
cklevel.add_listener(check_level);
ckmon.add_listener("僵尸王0",check_mon_kill);
for i=1,#task_data do
	local td = task_data[i];
	task.util.build_task_state(task_id,task_data[i],task_data,task_state_data);
	if task_data[i].need_type == "mon" then
		if task_data[i].need_target == "" then
			ckmon.add_all_listener(check_mon_kill);
		else
			--ckmon.add_listener(task_data[i].need_target,check_mon_kill);
			ckmon.add_caiji_listener(task_data[i].need_target,check_mon_caiji);
		end
	end
	if task_data[i].need_type == "item" then
		ckitem.add_listener(task_data[i].need_item,check_item_change);
	end
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done2 = task_state_data[task.util.ts(td.tid,const.TSACCE)].done;
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done=function(npc,player)
		player:set_param(const.PP_RICHANG3_LV,1);
		if util.ppn(player,const.PP_RICHANG3_NUM) < const.RICHANG3_MAX_NUM then
			player:set_param(const.PP_RICHANG3_NUM,util.ppn(player,const.PP_RICHANG3_NUM)+1);
			return task_state_data[task.util.ts(td.tid,const.TSACCE)].done2(npc,player);
		else
			player:alert(1,0,"今天的次数已用完");
			return 100;
		end
		
	end
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].alltalk=function (target,player,n)
		local s=player:get_task_state(task_id);
		local b=math.floor(s / const.TASK_STATE_NUM);
		local d=math.fmod(s,const.TASK_STATE_NUM);
		local k = task_state_data[task.util.ts(td.tid,const.TSCOMP)];
		target:echo("<br>");
		task.util.show_task_type(target,player,task_id,task_data);
		task.util.show_task_name(target,player,task_id,task_data);
		target:echo("<br><br>");
		if type(k.talk)=="string" then target:echo(k.talk); end
		if type(k.talk)=="function" then target:echo(k.talk(target,player,n)); end
		if d == const.TSACCE then
			target:echo("<br><br>		    <a href='event:talk_T"..task_id.."Do'>btn_accept</a>");
		end
		if d == const.TSCOMP then
			target:echo("<br><br>                      <a href='event:talk_T"..task_id.."Do'>btn_complate</a>");
		end
		if td.focus then target:echo("<f>点击此处继续任务</f>");end
		target:echo("<br>");
		if n.award then
			--target:echo("<s='l'><l></s>");
			task.util.show_award(target,player,n.award);
		end
		return 1;
	end;
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp=posnpc.fp(td.doner);
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done=function (npc,player)
		player:alert(1,1,"成功完成[百花争艳]任务,获得奖励:");

		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM8,util.ppn(player,const.PP_HUOYUEDU_NUM8)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM8)==5 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
		end
		
		task.util.give_award(player,td.award);
		local nid = gen_next_id(player);
		player:set_task_state(task_id,task.util.ts(nid,const.TSACCE));
		player:push_task_data(task_id,0);
		player:set_param(const.PP_RICHANG3_LV,1);
		return 100;
	end;
end;


function startkuang(player,mon)
	player:start_progress_bar(mon:get_caiji_duration(),"正在采集中...");
end
ckmon.add_caijistart_listener("玫瑰",startkuang);
ckmon.add_caijistart_listener("佛桑花",startkuang);
ckmon.add_caijistart_listener("秋海棠",startkuang);
ckmon.add_caijistart_listener("虞美人",startkuang);
ckmon.add_caijistart_listener("曼陀罗",startkuang);

for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;
--下面这个函数可以用来确保任务还有多少次.用在主线或支线里面放置任务做完了卡住.
function maintask_fix(player,num)
	if util.ppn(player,const.PP_RICHANG3_NUM) >= const.RICHANG3_MAX_NUM then
		player:set_param(const.PP_RICHANG3_NUM,util.ppn(player,const.PP_RICHANG3_NUM)-num);
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
			target:echo("<br>");
			target:echo("我能将您传送到"..posmon.mp(player,n.need_target).."出没的地方!你现在确定要前往吗??");
			target:echo("<br><br>                  <a href='event:talk_T"..task_id.."Go'>【点击立刻前往】</a><br>");
		end
	end
end
_M['onTalkT'..task_id..'Go']=function (npc,player)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=task_state_data[s];
	local n=task_data[b];
	if d == const.TSACED then
		posmon.fly(player,n.need_target);
	end
end
