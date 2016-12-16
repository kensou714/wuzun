module(..., package.seeall)
function onPlayerEnter(map,player)
	go.rand(player);
	player:set_param(const.PP_YMSY,util.ppn(player,const.PP_YMSY)+1);
	player:set_timer(const.PT_YMSY,60*1000);
end
function onPlayerLeave(map,player)
	player:set_timer(const.PT_YMSY,0);
end
