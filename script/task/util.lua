module(..., package.seeall)
function task_state(base,state) return base*const.TASK_STATE_NUM+state;end;ts=task_state;
function fix_npc_flags(flags)
	local ret = 0;
	if math.fmod(flags,10)>=1 then ret = ret + 1; end
	if math.fmod(flags/10,10)>=1 then ret = ret + 10; end
	if math.fmod(flags/100,10)>=1 then ret = ret + 100; end
	if math.fmod(flags/1000,10)>=1 then ret = ret + 1000; end
	return ret;
end
function show_award(target,player,data,mul)
	if not mul then mul = 1;end;
	target:echo("<s='e'><p>任务奖励:</p><br>");
	for i=1,#data do
		if data[i].job==nil or data[i].job=="all" or (player and data[i].job==player:get_job_name()) then
			if data[i].gender==nil or data[i].gender=="all" or data[i].gender==player:get_gender_name() then
				local num=data[i].num;
				if type(data[i].num)=="function" then num = data[i].num(target,player); end
				num = num * mul * 10;
				if data[i].name=="经验" then
					num = num * mul * 10;
				else 
					num = num * mul; end
				if num > 0 then
					target:echo("<p>##"..data[i].name.."## "..num.."</p><br>");
				else
					target:echo("<p>##"..data[i].name.."## </p><br>");
				end
			end
		end
	end
	target:echo("</s>");
end
function give_award(player,data,mul)
	if not mul then mul = 1;end;
	for i=1,#data do
		if data[i].job==nil or data[i].job=="all" or data[i].job==player:get_job_name() then
			if data[i].gender==nil or data[i].gender=="all" or data[i].gender==player:get_gender_name() then
				local num=data[i].num;
				if type(data[i].num)=="function" then num = data[i].num(player,player); end
				if data[i].name=="经验" then
					num = math.floor(num * mul) * 10;
				else 
					num = math.floor(num * mul); end
				if data[i].fun then
					data[i].fun(player,data[i],num);
				else
					player:add_item(data[i].name,num,data[i].bind,data[i].use_bind,nil,nil,nil,nil,nil,nil,nil,nil,2);
				end
				if data.alert then player:alert(1,0,data[i].name.." * " .. num);end;
				--player:add_item(data[i].name,data[i].num,data[i].bind,data[i].use_bind);
				--if data[i].use then
				--	player:use_item(data[i].name);
				--	player:alert(1,0,"获得[<font color='#00FF00'>" .. data[i].name .."</font>],自动佩戴成功");
				--end
			end
		end
	end
end
function show_task_name(target,player,task_id,data)
	local s = player:get_task_state(task_id);
	local b = math.floor(s / const.TASK_STATE_NUM);
	local d = math.fmod(s,const.TASK_STATE_NUM);
	local k = data[b];
	local n = const.TASK_STATE_NAME[d];
	if k and n then
		target:echo(k.name);
		target:echo("<s='d'>"..n.."</s>");
	end
end
function show_task_type(target,player,task_id,data)
	target:echo("<s='c'>[" .. data.ttype .. "]</s>");
end
function show_task_title(target,player,task_id,data,td)
	local s = player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local n=td[b];
	local k = data[s];
	local need_npc;
	if not n then return;end;
	if d == const.TSACCE then
		need_npc = n.accepter;
	end
	if d == const.TSCOMP then
		need_npc = n.doner;
	end
	if k and need_npc and (need_npc=='' or string.find(need_npc,target:get_name()) ) then
		target:echo("<br><p>##tasktitle##<a href='event:talk_T"..task_id.."Show'>");
		show_task_type(target,player,task_id,td);
		show_task_name(target,player,task_id,td);
		target:echo("</a>");
		if td.focus and player:get_level()<40 then target:echo("<f>点击此处继续任务</f>");end
		target:echo("</p>");
	end
end
function get_npc_flags(target,player,task_id,data,td)
	local s = player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local n=td[b];
	if not n then return 0;end;
	if d == const.TSACCE then
		if n.accepter=="" or string.find(n.accepter,target:get_name())  then
			return 1;
		end
	end
	if d == const.TSCOMP then
		if n.doner == "" or string.find(n.doner,target:get_name())  then
			return 10;
		end
	end
	return 0;
end
function show_task_short_desp(target,player,task_id,data,td)
	local k=data[player:get_task_state(task_id)];
	if k and k.shortdesp then
		local sr = "";
		if type(k.shortdesp)=="string" then sr = k.shortdesp; end
		if type(k.shortdesp)=="function" then sr = k.shortdesp(target,player); end
		if sr ~= '' then
			show_task_type(target,player,task_id,td);
			show_task_name(target,player,task_id,td);
			target:echo("<br>");
			target:echo(sr);
		end
	end
end
function show_task_desp(target,player,task_id,data,td)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local k=data[s];
	local n=td[b];
	if k and n then
		show_task_type(target,player,task_id,td);
		show_task_name(target,player,task_id,td);
		target:echo("<br><br>");
		if type(k.desp)=="string" then target:echo(k.desp); end
		if type(k.desp)=="function" then target:echo(k.desp(target,player)); end
		target:echo("<br>");
		--target:echo("<s='l'><l></s>");
		target:echo("接受任务NPC:"..posnpc.mp(n.accepter).."<br>");
		target:echo("完成任务NPC:"..posnpc.mp(n.doner).."<br><br>");
		if n.award then
			--target:echo("<s='l'><l></s>");
			show_award(target,player,n.award);
		end
	end
end

function show_task_talk(target,player,task_id,data,td)
	local s=player:get_task_state(task_id);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local k=data[s];
	local n=td[b];
	local need_npc;
	if d == const.TSACCE then
		need_npc = n.accepter;
	end
	if d == const.TSCOMP then
		need_npc = n.doner;
	end
	if k and n and need_npc and (need_npc=='' or (not target) or string.find(need_npc,target:get_name()) or need_npc == target:get_name() ) then
		if k.alltalk then
			if k.alltalk(target,player,n) then
				return ;
			end
		end
		target:echo("<br>");
		show_task_type(target,player,task_id,td);
		show_task_name(target,player,task_id,td);
		target:echo("<br><br>");
		if type(k.talk)=="string" then target:echo(k.talk); end
		if type(k.talk)=="function" then target:echo(k.talk(target,player,n)); end
		if td.focus and player:get_level()<40 then target:echo("<f>点击此处继续任务</f>");end
		target:echo("<br>");
		if n.award then
			--target:echo("<s='l'><l></s>");
			show_award(target,player,n.award);
		end
		if d == const.TSACCE then
			target:echo("<br><br>		    <a href='event:talk_T"..task_id.."Do'>btn_accept</a>");
		end
		if d == const.TSCOMP then
			target:echo("<br><br>		    <a href='event:talk_T"..task_id.."Do'>btn_complate</a>");
		end
	end
end
function task_done(npc,player,task_id,data,td)
	local ret = 100;
	local s = player:get_task_state(task_id);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local b=math.floor(s / const.TASK_STATE_NUM);
	local n=td[b];
	local k = data[s];
	local need_npc;
	if d == const.TSACCE then
		need_npc = n.accepter;
	end
	if d == const.TSCOMP then
		need_npc = n.doner;
	end
	if k and need_npc and (need_npc=='' or (not npc) or string.find(need_npc,npc:get_name()) or need_npc == npc:get_name() ) then
		if k and k.done then ret = k.done(npc,player);end
		player:refresh_npc_show_flags_inview();
		if td.focus then focus.f(player,"mini_task");end
	end
	return ret;
end
function check_mon_kill(player,mon,task_id,data,td)
	local s = player:get_task_state(task_id);
	local d = data[s];
	if d and d.on_mon_kill then
		d.on_mon_kill(mon,player);
	end
end
function check_mon_kill_all(player,mon,task_id,data,td)
	local s = player:get_task_state(task_id);
	local d = data[s];
	if d and d.on_mon_kill_all then
		d.on_mon_kill_all(mon,player);
	end
end
function check_item_change(player,item_name,item_id,task_id,data,td)
	local s = player:get_task_state(task_id);
	local d = data[s];
	if d and d.on_item_change then
		d.on_item_change(player,item_name,item_id);
	end
end
function check_level(player,lv,task_id,data,td)
	local s = player:get_task_state(task_id);
	local d = data[s];
	if d and d.on_level_change then
		d.on_level_change(player,lv);
	end
end

function build_task_state(task_id,td,task_data,task_state_data)
	task_state_data[task.util.ts(td.tid,const.TSUNAC)]={
		shortdesp="<font color='#FF0000'>此任务需要等级达到:"..td.need_level.."</font>\n推荐练级地图:"..posmap.freefly(td.bestmap),
		desp="<font color='#FF0000'>此任务需要等级达到:"..td.need_level.."</font>\n推荐练级地图:"..posmap.freefly(td.bestmap),
		on_level_change=function (player,lv)
			if player:get_level() >= td.need_level then
				player:set_task_state(task_id,task.util.ts(td.tid,const.TSACCE));
				player:push_task_data(task_id,0);
			end
		end,
	};
	task_state_data[task.util.ts(td.tid,const.TSACCE)]={
		shortdesp="找"..posnpc.mp(td.accepter),
		desp="与"..posnpc.mp(td.accepter).."对话.",
		talk="很好,你可以接"..td.name.."任务了.",
		done=function (npc,player)
			local ret=100;
			if td.accept_hook then td.accept_hook(npc,player,td);ret=nil;end;
			if td.need_type == "item" then
				local num = player:num_item(td.need_item);
				player:set_task_param( task_id,1,math.min(num,td.need_num) );
				if num >= td.need_num then
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
					if task_data.autogo then posnpc.go(player,td.doner);ret=nil;end
				else
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSACED));
					if task_data.autogo and (not td.noautogo) then posmon.go(player,td.need_target);ret=nil;end
				end
			else 
				if td.need_type == "mon" then
					player:set_task_param(task_id,1,0);
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSACED));
					player:push_task_data(task_id,0);
					if task_data.autogo and (not td.noautogo) then posmon.go(player,td.need_target);ret=nil;end
				else
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
					if task_data.autogo then posnpc.go(player,td.doner);ret=nil;end
				end
			end
			player:push_task_data(task_id,0);
			if ret then return ret;end
		end,
	};
	if td.accept_talk then task_state_data[task.util.ts(td.tid,const.TSACCE)].talk = td.accept_talk;end;
	task_state_data[task.util.ts(td.tid,const.TSACED)]={
		shortdesp=function (target,player)
			if td.need_type == "item" then
				return "从"..posmon.mp(player,td.need_target).."<br>  获得<s='r'>"..td.need_item.."</s>:##task_param_1##/"..td.need_num;
			end
			if td.need_type == "mon" then
				if td.need_target ~= "" then
					return posmon.mp(player,td.need_target)..":##task_param_1##/"..td.need_num;
				else
					if td.need_target_lv then
						local ret = "击败" ..td.need_target_lv.."级以上怪物:##task_param_1##/"..td.need_num;
						if td.need_map_name then
							ret = ret .. "\n推荐地图:"..posmap.p(td.need_map_name);
						end
						return ret;
					else
						if td.need_map_name then
							return posmap.p(td.need_map_name).."任意怪物:##task_param_1##/"..td.need_num;
						end
					end
				end
			end
		end,
		desp=function (target,player)
			if td.need_type == "item" then
				return "从"..posmon.mp(player,td.need_target).."<br>  获得<s='r'>"..td.need_item.."</s>:##task_param_1##/"..td.need_num;
			end
			if td.need_type == "mon" then
				if td.need_target ~= "" then
					return posmon.mp(player,td.need_target)..":##task_param_1##/"..td.need_num;
				else
					if td.need_target_lv then
						local ret = "击败" ..td.need_target_lv.."级以上怪物:##task_param_1##/"..td.need_num;
						if td.need_map_name then
							ret = ret.."\n推荐地图:"..posmap.p(td.need_map_name);
						end
						return ret;
					else
						if td.need_map_name then
							return posmap.p(td.need_map_name).."任意怪物:##task_param_1##/"..td.need_num;
						end
					end
				end
			end
		end,
		on_item_change=function (player,item_name,item_id)
			if td.need_type == "item" then
				local num = player:num_item(td.need_item);
				player:set_task_param( task_id,1,math.min(num,td.need_num) );
				if num >= td.need_num then
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
					if td.complate_hook then td.complate_hook(npc,player,td);end;
					if task_data.autogo and (not td.noautogo) then posnpc.go(player,td.doner);end
					if td.focus then focus.f(player,"mini_task");end
				end
				player:push_task_data(task_id,0);
			end
		end,
		on_mon_kill=function (mon,player,group)
			if td.need_type == "mon" then
				if group and td.no_group then
					return;
				end
				if nil ~= string.find( mon:get_name(),posmon.n(td.need_target) ) then
					player:set_task_param(task_id,1,player:get_task_param(task_id,1)+1);
					if player:get_task_param(task_id,1) >= td.need_num then
						player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
						if td.complate_hook then td.complate_hook(npc,player,td);end;
						if task_data.autogo and (not td.noautogo) then posnpc.go(player,td.doner);end
						if td.focus then focus.f(player,"mini_task");end
					end
					player:push_task_data(task_id,0);
				end
			end
		end,
		on_mon_kill_all=function (mon,player,group)
			if td.need_type == "mon" then
				if group and td.no_group then
					return;
				end
				local changed=false;
				if td.need_target_lv then
					if mon:get_level() >= td.need_target_lv then
						player:set_task_param(task_id,1,player:get_task_param(task_id,1)+1);
						changed = true;
					end
				else
					if td.need_map and nil ~= string.find(mon:get_map():get_id(),td.need_map) then
						player:set_task_param(task_id,1,player:get_task_param(task_id,1)+1);
						changed = true;
					end
				end
				if changed then
					if player:get_task_param(task_id,1) >= td.need_num then
						player:set_task_state(task_id,task.util.ts(td.tid,const.TSCOMP));
						if td.complate_hook then td.complate_hook(npc,player,td);end;
						if task_data.autogo and (not td.noautogo) then posnpc.go(player,td.doner);end						
						if td.focus then focus.f(player,"mini_task");end
					end
					player:push_task_data(task_id,0);
				end
			end
		end,
	};
	task_state_data[task.util.ts(td.tid,const.TSCOMP)]={
		shortdesp="找"..posnpc.mp(td.doner),
		desp="与".. posnpc.mp(td.doner) .."对话.",
		talk="    你已成功完成"..td.name.."任务,这是给你的任务奖励!",
		on_item_change=function (player,item_name,item_id)
			if td.need_type == "item" then
				local num = player:num_item(td.need_item);
				player:set_task_param( task_id,1,math.min(num,td.need_num) );
				if num < td.need_num then
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSACED));
					if task_data.autogo then posmon.go(player,td.need_target);ret=nil;end
				end
				player:push_task_data(task_id,0);
			end
		end,
		done=function (npc,player)
			local ret=100;
			if td.need_type == "item" then
				local num = player:num_item(td.need_item);
				if num < td.need_num then
					player:set_task_param( task_id,1,math.min(num,td.need_num) );
					player:set_task_state(task_id,task.util.ts(td.tid,const.TSACED));
					player:push_task_data(task_id,0);
					if task_data.autogo then posmon.go(player,td.need_target);ret=nil;end
					return;
				else
					player:remove_item(td.need_item,td.need_num);
				end
			end
			task.util.give_award(player,td.award);
			if td.nid then
				player:set_task_state(task_id,task.util.ts(td.nid,const.TSUNAC));ret=nil;
			else
				player:set_task_state(task_id,task.util.ts(td.tid,const.TSPASS));
			end
			if td.nid and task_data[td.nid] then
				if player:get_level() >= task_data[td.nid].need_level then
					player:set_task_state(task_id,task.util.ts(td.nid,const.TSACCE));
					if (not td.direct_next) and npc:get_name()==task_data[td.nid].accepter then
						task.util.show_task_talk(npc,player,task_id,task_state_data,task_data);ret=nil;
					else
						if task_data.autogo then posnpc.go(player,task_data[td.nid].accepter);ret=nil;end
					end
				end
			end
			player:push_task_data(task_id,0);
			if td.done_hook then td.done_hook(npc,player,td);ret=nil;end;
			if ret then return ret;end
		end,
	};
	if td.done_talk then task_state_data[task.util.ts(td.tid,const.TSCOMP)].talk = td.done_talk;end;
end
