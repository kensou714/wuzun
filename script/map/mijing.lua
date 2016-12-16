module(..., package.seeall)
function onPlayerEnter(map,player)
	go.rand(player);
	player:set_param(const.PP_MIJING_NUM,util.ppn(player,const.PP_MIJING_NUM)+1);
	player:set_timer(const.PT_MIJING,60*1000);
end
function onPlayerLeave(map,player)
	player:set_timer(const.PT_MIJING,0);
end
