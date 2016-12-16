module(..., package.seeall)

function ptsw(player)
	local m = player:get_map():get_id();
	if  string.find(m,"fengml") then
		if util.ppn(player,const.PP_SHOUWEI_NUM)<5 then
			local id = util.ppn(player,const.PP_SHOUWEI_NUM);
			player:set_param(const.PP_SHOUWEI_NUM,id+1);
			player:gen_tower("普通守卫",id);
			player:set_task_param(const.TASK_ID_FUBEN_FENGML,2,util.ppn(player,const.PP_SHOUWEI_NUM));
			player:push_task_data(2006,0);
		else
			player:alert(1,1,"你最多只能召唤5名弓箭护卫");
			return 0;
		end
	else
		player:alert(1,1,"只有在守卫试炼之地才能使用召唤令！")
		return 0;
	end
end


function jysw(player)
	local m = player:get_map():get_id();
	if  string.find(m,"fengml") then
		if util.ppn(player,const.PP_SHOUWEI_NUM)<5 then
			local id = util.ppn(player,const.PP_SHOUWEI_NUM);
			player:set_param(const.PP_SHOUWEI_NUM,id+1);
			player:gen_tower("精英守卫",id);
			player:set_task_param(const.TASK_ID_FUBEN_FENGML,2,util.ppn(player,const.PP_SHOUWEI_NUM));
			player:push_task_data(2006,0);
		else
			player:alert(1,1,"你最多只能召唤5名弓箭护卫");
			return 0;
		end
	else
		player:alert(1,1,"只有在守卫试炼之地才能使用召唤令！")
		return 0;
	end
end