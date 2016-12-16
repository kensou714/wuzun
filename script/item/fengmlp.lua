module(..., package.seeall)

function fmlpputong(player)
	local m =  player:get_map():get_id();
	if string.find(m,"fengml") then
		if util.ppn(player,const.PP_FENGMOLING_GONGJIAN_NUM) < 16 then
			player:set_param(const.PP_FENGMOLING_GONGJIAN_NUM,util.ppn(player,const.PP_FENGMOLING_GONGJIAN_NUM)+1);
			player:gen_tower("",1);
		else
			player:alert(1,1,"地图上弓箭手已满");
			return;
		end
	else
		player:alert(1,1,"只有在封魔林才可使用");
		return;
	end

end