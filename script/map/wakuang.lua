module(..., package.seeall)

function onPlayerEnter(map,player)
	if player:get_level() <= 39 then
		player:set_param(const.PP_TIANMOD,3)
		player:set_timer(9,1);
	end
end
