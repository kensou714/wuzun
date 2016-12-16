module(..., package.seeall)


function onTalktctmd(player)
		player:set_timer(6,1000);
end

function onTalkjrgg1(player)
	if util.ppn(player,const.PP_TIANMOD) == 1 then
		player:alert(1,1,"[天魔殿统领]已被消灭,[天魔殿]的入口已经打开!")
	end
end

function onTalkjrgg2(player)
	if util.ppn(player,const.PP_TIANMOD) == 2 then
		player:alert(1,1,"[天魔殿统领]已被消灭,[天魔殿]的入口已经打开!")
	end
end