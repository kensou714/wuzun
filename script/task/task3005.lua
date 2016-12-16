module(..., package.seeall)
local task_id=3005;
local YABIAO_MAX_NUM=5;
local task_data={
	ttype="押镖",		focus=false,		autogo=true,
	[1	]={
		tid=1,		nid=1,		need_level=40,		name="运送物资",	accepter="夏镖头",	doner="张振海",
		award={alert=true;
			{name="经验",	num=0,},
		},
	},
	[2	]={
		tid=2,		nid=1,		need_level=40,		name="运送物资",	accepter="夏镖头",	doner="张振海",
		need_item="青铜镖令";biaoche_name='青铜镖车';
		award={alert=true;
			{name="经验",	num=function(target,player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*4.079);end,},
			{name="绑定金币",	num=200000},
		},
		accept_talk=function (npc,player,td) return "大战在即,王城急需要物资的补充!快帮我把这批物资<font color='#FFff00'>送给王城的张振海</font>.他会重谢你的,快去吧!<br><br>押镖次数: 您今天还可以押运镖车[<font color='#ff0000'>".. (const.YABIAO_MAX_NUM - util.ppn(player,const.PP_YABIAO_NUM) ) .."</font>]次<br><br><font color='#ffff00'>每次任务奖励2点行会贡献 2点行会经验!</font>";end;
		done_talk  =function (npc,player,td) return "不错不错!多亏了你及时将这批物资送过来,这是给你的奖励!";end;
		done_hook=function (npc,player,td) newgui.guild.AddGuildExpGongxianSame(player,2); end;
	},
	[3	]={
		tid=3,		nid=1,		need_level=40,		name="运送物资",	accepter="夏镖头",	doner="孤月岛主",
		need_item="黄金镖令";biaoche_name='黄金镖车';
		award={alert=true;
			{name="经验",	num=function(target,player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*8.159);end,},
			{name="绑定金币",	num=200000},
		},
		accept_talk=function (npc,player,td) return "大战在即,孤月岛急需补充物资!快帮我把这批物资<font color='#FFff00'>送给孤月岛的孤月岛主</font>.他会重谢你的,快去吧!<br><br>押镖次数: 您今天还可以押运镖车[<font color='#ff0000'>".. (const.YABIAO_MAX_NUM - util.ppn(player,const.PP_YABIAO_NUM) ) .."</font>]次<br><br><font color='#ffff00'>每次任务奖励4点行会贡献 4点行会经验!</font>";end;
		done_talk  =function (npc,player,td) return "不错不错!多亏了你及时将这批物资送过来,这是给你的奖励!";end;
		done_hook=function (npc,player,td) newgui.guild.AddGuildExpGongxianSame(player,4); end;
	},
	[4	]={
		tid=4,		nid=1,		need_level=40,		name="运送物资",	accepter="夏镖头",	doner="上月空",
		need_item="蓝玉镖令";biaoche_name='蓝玉镖车';
		award={alert=true;
			{name="经验",	num=function(target,player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*16.319);end,},
			{name="绑定金币",	num=200000},
		},
		accept_talk=function (npc,player,td) return "大战在即,云霄城物资严重紧缺!快帮我把这批物资<font color='#FFff00'>送给云霄城的上月空</font>.他会重谢你的,快去吧!<br><br>押镖次数: 您今天还可以押运镖车[<font color='#ff0000'>".. (const.YABIAO_MAX_NUM - util.ppn(player,const.PP_YABIAO_NUM) ) .."</font>]次<br><br><font color='#ffff00'>每次任务奖励6点行会贡献 6点行会经验!</font>";end;
		done_talk  =function (npc,player,td) return "不错不错!多亏了你及时将这批物资送过来,这是给你的奖励!";end;
		done_hook=function (npc,player,td) newgui.guild.AddGuildExpGongxianSame(player,6); end;
	},
	[5	]={
		tid=5,		nid=1,		need_level=40,		name="运送物资",	accepter="夏镖头",	doner="白云道长",
		need_item="紫金镖令";biaoche_name='紫金镖车';
		award={alert=true;
			{name="经验",	num=function(target,player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*32.638);end,},
			{name="绑定金币",	num=200000},
		},
		accept_talk=function (npc,player,td) return "大战在即,白云观急需要物资的补充!快帮我把这批物资<font color='#FFff00'>送给白云观的白云道长</font>.他会重谢你的,快去吧!<br><br>押镖次数: 您今天还可以押运镖车[<font color='#ff0000'>".. (const.YABIAO_MAX_NUM - util.ppn(player,const.PP_YABIAO_NUM) ) .."</font>]次<br><br><font color='#ffff00'>每次任务奖励8点行会贡献 8点行会经验!</font>";end;
		done_talk  =function (npc,player,td) return "不错不错!多亏了你及时将这批物资送过来,这是给你的奖励!";end;
		done_hook=function (npc,player,td) newgui.guild.AddGuildExpGongxianSame(player,8); end;
	},
};
local task_state_data={};
function get_exp(player,id) 
	local n = task_data[id].award[1].num;
	if type(n)=="function" then return n(player,player); end
	return n;
end;
function onGetTaskName(player)			task.util.show_task_name(player,player,task_id,task_data);end
function onGetTaskShortDesp(player)		task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(npc,player)			task.util.show_task_title(npc,player,task_id,task_state_data,task_data);end
function get_npc_flags(npc,player)		return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);end

function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)
	check_yabiao_day(player);
	if player:get_level() >= task_data[1].need_level and player:get_task_state(task_id) == 0 then
		if util.ppn(player,const.PP_YABIAO_NUM) < const.YABIAO_MAX_NUM then
			player:set_task_state(task_id,task.util.ts(1,const.TSUNAC));
			player:push_task_data(task_id,0);
		end
	end
	task.util.check_level(player,lv,task_id,task_state_data,task_data);
end
function check_yabiao_day(player)
	if util.ppn(player,const.PP_YABIAO_DAY) ~= today() then
		player:set_param(const.PP_YABIAO_DAY,today());
		player:set_param(const.PP_YABIAO_NUM,0);
		player:set_param(const.PP_JIEBIAO,0);
		player:push_task_data(3005,0);
	end
end

_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end
function get_yabiao_exp(player,killer)
	local s = player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local n=task_data[b];
	local k = task_state_data[s];
	return n.award[1].num(player,player);
end
cklevel.add_listener(check_level);
for i=1,#task_data do
	local td = task_data[i];
	task.util.build_task_state(task_id,task_data[i],task_data,task_state_data);
	task_state_data[task.util.ts(td.tid,const.TSUNAC)]={
		desp=function (target,player)
			if player:get_level() < td.need_level then
				return "人物等级需要达到"..td.need_level..".";
			else
				return "今天的任务已经全部做完";
			end
		end;
		on_level_change=function (player,lv)
			check_yabiao_day(player);
			if player:get_level() >= td.need_level and util.ppn(player,const.PP_YABIAO_NUM) < const.YABIAO_MAX_NUM then
				player:set_task_state(task_id,task.util.ts(td.tid,const.TSACCE));
				player:push_task_data(task_id,0);
			end
		end,
	};
	task_state_data[task.util.ts(td.tid,const.TSACCE)].done=function (npc,player)
		check_yabiao_day(player);
		local ret=100;
		if player:get_level() >= td.need_level and util.ppn(player,const.PP_YABIAO_NUM) < const.YABIAO_MAX_NUM then
			local num = player:num_item(td.need_item);
			if num > 0 then
				player:remove_item(td.need_item,1);
			--if 1==player:sub_gamemoney_bind(td.need_money) or 1 == player:sub_gamemoney(td.need_money) then
				player:set_task_param(task_id,3,1);
				player:accept_dart_task(td.biaoche_name);
				player:set_param(const.PP_YABIAO_NUM,util.ppn(player,const.PP_YABIAO_NUM)+1);
								
				player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
				if task_data.autogo then posnpc.go2(player,td.doner,1);ret=nil;end
			else
				player:alert(1,1,"想要押运["..td.biaoche_name.."]需要一块["..td.need_item.."]");
				player:alert(1,0,"<br>[押镖令]可以在单人副本和BOSS身上获得!");
			end
		else
			player:set_task_state(task_id,task.util.ts(td.nid,const.TSUNAC));
		end
		player:push_task_data(task_id,0);
		if ret then return ret;end
	end
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].shortdesp=function (npc,player)
		return posnpc.walk(td.doner) .. "\n<a href='event:click_T3005Fly'>点击传送到镖车处</a>(需##task_param_3##万金币)";
	end
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].fly = function (npc,player)
		local ngm = (player:get_task_param(task_id,3))*10000;
		if 1== player:sub_gamemoney_bind(ngm) or 1== player:sub_gamemoney(ngm)then
			player:set_task_param(task_id,3,player:get_task_param(task_id,3)+1);
			player:directfly_to_dart();
			player:push_task_data(task_id,0);
		else
			player:alert(1,0,"金币不足");
		end
	end
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].done = function (npc,player)
		local ret=100;
		if player:get_dart_task_flag() == 1 then
			if player:get_dart_out_range_flag() == 0 then
				player:alert(1,1,"成功完成[押运物资]任务,获得奖励:");

				--统计活跃度--
				player:set_param(const.PP_HUOYUEDU_NUM4,util.ppn(player,const.PP_HUOYUEDU_NUM4)+1);
				if util.ppn(player,const.PP_HUOYUEDU_NUM4)==2 then
					player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
				end
				
				if td.done_hook then td.done_hook(npc,player,td);end;
				if player:get_dart_destory_flag() == 1 then
					task.util.give_award(player,td.award,0.6);
					if activity.isShuangbeiYabiao() then
						task.util.give_award(player,td.award,0.6);
					end
				else
					task.util.give_award(player,td.award);
					if activity.isShuangbeiYabiao() then
						task.util.give_award(player,td.award);
					end
				end
				player:dart_task_succeed();
			else
				player:alert(1,0,"镖车还没有到这里,去把镖车找回来吧!");
				return ;
			end
		end
		player:set_task_state(task_id,task.util.ts(td.nid,const.TSUNAC));
		if player:get_level() >= task_data[td.nid].need_level and util.ppn(player,const.PP_YABIAO_NUM) < const.YABIAO_MAX_NUM then
			player:set_task_state(task_id,task.util.ts(td.nid,const.TSACCE));
		end
		player:push_task_data(task_id,0);
		posnpc.fly(player,"夏镖头");ret=nil;
		if ret then return ret;end
	end
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;
function process_login(player)
	player:set_task_state(task_id,task.util.ts(1,const.TSUNAC));
	player:push_task_data(task_id,0);
end
login.add_login_listener(process_login);
function check_fly_talk(player,param) 
	local d = task_state_data[player:get_task_state(task_id)];
	if d and d.fly then d.fly(npc,player);end
end
cktalk.add_listener("T3005Fly",check_fly_talk);
function maintask_fix(player)
	if util.ppn(player,const.PP_YABIAO_NUM) >= const.YABIAO_MAX_NUM then
		player:set_param(const.PP_YABIAO_NUM,util.ppn(player,const.PP_YABIAO_NUM)-1);
		task.util.check_level(player,player:get_level(),task_id,task_state_data,task_data);
	end
end
