module(..., package.seeall)
local mon_data={
	[1]={
		mon={"暗影马1","暗影马2","暗影马3"},boss={"暗影马13"},
	},
	[2]={
		mon={"暗影马4","暗影马5","暗影马6"},boss={"暗影马14"},
	},
	[3]={
		mon={"暗影马7","暗影马8","暗影马9"},boss={"暗影马15"},
	},
}

function onPlayerEnter(map,player)
	player:set_param(const.PP_FENGMO_MONKILL,0);
end

function onPlayerLeave(map,player)
	map:set_timer(1,0);	
	map:clear_mon();map:clear_item();
end

function onTimer1(map)
	local td = mon_data[1];
	if td then
		local t = math.random(1,#(td.mon));
		local rname = td.mon[t];
		--print(t,rname)
		map:mon_gen(72,130,rname,1,0,1,1,"road(1)");
	end
	local r = math.random(1,100);
	local t = 3000;
	if r > 0  and r <= 10  then t = 1000; end
	if r > 10 and r <= 40  then t = 2000; end
	if r > 40 and r <= 100 then t = 3000; end
	map:set_timer(1,t);
end

function onMonsterKill(mon,player)
	player:set_param(const.PP_FENGMOLING_EXP,util.ppn(player,const.PP_FENGMOLING_EXP)+10000);
	player:alert(1000,1,"封魔经验增加10000");
end
