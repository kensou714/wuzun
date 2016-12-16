module(..., package.seeall)
local data={
	["猛犸寺庙"]=		{ mapname="猛犸寺庙",	map="zuma2",	posx=45,	posy=50,	fly=4000 },
	["魔魂殿1"]=		{ mapname="魔魂殿",	map="fengmo1",	posx=109,	posy=54,	fly=4001 },
	["魔魂殿2"]=		{ mapname="魔魂殿",	map="fengmo2",	posx=95,	posy=92,	fly=4002 },
	["魔魂殿3"]=		{ mapname="魔魂殿",	map="fengmo3",	posx=73,	posy=73,	fly=4003 },
	["蛮牛洞1"]=		{ mapname="蛮牛洞",	map="niumo2",	posx=38,	posy=37,	fly=4004 },
	["蛮牛洞2"]=		{ mapname="蛮牛洞",	map="niumo2",	posx=40,	posy=186,	fly=4005 },
	["蛮牛洞3"]=		{ mapname="蛮牛洞",	map="niumo3",	posx=172,	posy=69,	fly=4006 },
	["妖月峡谷1"]=		{ mapname="妖月峡谷",	map="chiyue1",	posx=181,	posy=143,	fly=4008 },
	["妖月峡谷2"]=		{ mapname="妖月峡谷",	map="chiyue1",	posx=72,	posy=123,	fly=4009 },
	["妖月峡谷3"]=		{ mapname="妖月峡谷",	map="chiyue2",	posx=92,	posy=145,	fly=4010 },
	["妖月峡谷4"]=		{ mapname="妖月峡谷",	map="chiyue2",	posx=210,	posy=58,	fly=4011 },
	["妖月峡谷5"]=		{ mapname="妖月峡谷",	map="chiyue3",	posx=120,	posy=133,	fly=4012 },
	["妖月峡谷6"]=		{ mapname="妖月峡谷",	map="chiyue3",	posx=193,	posy=168,	fly=4013 },
	["巨灵石窟1"]=		{ mapname="巨灵石窟",	map="jlsk1",	posx=147,	posy=148,	fly=4014 },
	["巨灵石窟2"]=		{ mapname="巨灵石窟",	map="jlsk2",	posx=71,	posy=63,	fly=4015 },
	["巨灵石窟3"]=		{ mapname="巨灵石窟",	map="jlsk3",	posx=43,	posy=146,	fly=4016 },
	["混沌之门1"]=		{ mapname="混沌之门",	map="hund1",	posx=136,	posy=147,	fly=4017 },
	["混沌之门2"]=		{ mapname="混沌之门",	map="hund2",	posx=92,	posy=162,	fly=4018 },
	["混沌之门3"]=		{ mapname="混沌之门",	map="hund3",	posx=119,	posy=127,	fly=4019 },
	["冰封雪域1"]=		{ mapname="冰封雪域",	map="bfxy1",	posx=96,	posy=58,	fly=4020 },
	["冰封雪域2"]=		{ mapname="冰封雪域",	map="bfxy2",	posx=154,	posy=105,	fly=4021 },
	["冰封雪域3"]=		{ mapname="冰封雪域",	map="bfxy3",	posx=143,	posy=50,	fly=4022 },
	["地狱熔岩1"]=		{ mapname="地狱熔岩",	map="dyry1",	posx=114,	posy=93,	fly=4023 },
	["地狱熔岩2"]=		{ mapname="地狱熔岩",	map="dyry2",	posx=55,	posy=70,	fly=4024 },
	["地狱熔岩3"]=		{ mapname="地狱熔岩",	map="dyry3",	posx=114,	posy=105,	fly=4025 },
	["落日峡谷1"]=		{ mapname="落日峡谷",	map="swxc2",	posx=36,	posy=227,	fly=4026 },
	["神庙废墟1"]=		{ mapname="神庙废墟",	map="zzzd1",	posx=123,	posy=126,	fly=4027 },
};
for i,v in pairs(data) do
	if v.fly >=4000 and v.fly<5000 then
		server.set_fly_node(v.fly,v.map,v.posx,v.posy);
	end
end
function mp(map_name)
	if not map_name then return ""; end
	local d = data[map_name];
	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."'>"..d["mapname"].."</a><a href='event:fly_"..d["fly"].."'><s='r'>[传]</s></a>";end--
	return  "<s='r'>"..map_name.."</s>";
end
function p(map_name)
	if not map_name then return ""; end
	local d = data[map_name];
	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."'>"..d["mapname"].."</a><a href='event:fly_"..d["fly"].."'><s='r'>[传]</s></a>";end--
	return  "<s='r'>"..map_name.."</s>";
end
function go(player,map_name)
	if not map_name then return; end
	local d = data[map_name];
	if d then player:find_road_goto(d["map"],d["posx"],d["posy"]); end
end
function fly(player,map_name)
	if not map_name then return; end
	local d = data[map_name];
	if d then player:enter_map(d["map"],d["posx"],d["posy"]+1); end
end
function freefly(map_name)
	if not map_name then return ""; end
	local d = data[map_name];
	if d then return "<a href='event:fly_"..d["fly"].."'>"..d["mapname"].."</a>";end
	return  "<s='r'>"..map_name.."</s>";
end
