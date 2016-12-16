module(..., package.seeall)

function onPlayerEnter(map,player)
	go.givehuicheng(player);
	go.rand(player);
end

function onPlayerLeave(map,player)
end