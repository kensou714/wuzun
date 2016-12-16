module(..., package.seeall)
local np={
	["药店老板1"]=		{ name="药店老板",	mapname="边界村",		map="xinshou",	posx=63,	posy=116,	fly=2000 },
	["杂货铺老板1"]=	{ name="杂货铺老板",	mapname="边界村",		map="xinshou",	posx=77,	posy=99,	fly=2001 },
	["云天河"]=		{ name="云天河",	mapname="边界村",		map="xinshou",	posx=82,	posy=111,	fly=2002 },
	["元霜"]=		{ name="元霜",		mapname="边界村",		map="xinshou",	posx=70,	posy=85,	fly=2003 },
	["蒙老太"]=		{ name="蒙老太",	mapname="边界村",		map="xinshou",	posx=71,	posy=66,	fly=2004 },
	["慕容仲伯"]=		{ name="慕容仲伯",	mapname="边界村",		map="xinshou",	posx=75,	posy=47,	fly=2005 },
	["慕容俊秋"]=		{ name="慕容俊秋",	mapname="边界村",		map="xinshou",	posx=50,	posy=42,	fly=2006 },
	["秦沉言"]=		{ name="秦沉言",	mapname="云霄城",		map="v002",	posx=155,	posy=205,	fly=2007 },
	["叶蓉"]=		{ name="叶蓉",		mapname="云霄城",		map="v002",	posx=70,	posy=154,	fly=2008 },
	["南云"]=		{ name="南云",		mapname="云霄城",		map="v002",	posx=107,	posy=130,	fly=2009 },
	["冰柏"]=		{ name="冰柏",		mapname="云霄城",		map="v002",	posx=132,	posy=106,	fly=2010 },
	["依青"]=		{ name="依青",		mapname="云霄城",		map="v002",	posx=163,	posy=72,	fly=2011 },
	["贺承念"]=		{ name="贺承念",	mapname="云霄城",		map="v002",	posx=87,	posy=89,	fly=2012 },
	["司弈"]=		{ name="司弈",		mapname="僵尸洞穴",		map="jsd1",	posx=32,	posy=208,	fly=2013 },
	["司超"]=		{ name="司超",		mapname="僵尸洞穴",		map="jsd1",	posx=78,	posy=195,	fly=2014 },
	["司仕"]=		{ name="司仕",		mapname="僵尸洞穴",		map="jsd1",	posx=118,	posy=199,	fly=2015 },
	["铁匠铺老板2"]=	{ name="铁匠铺老板",	mapname="云霄城",		map="v002",	posx=105,	posy=191,	fly=2016 },
	["药店老板2"]=		{ name="药店老板",	mapname="云霄城",		map="v002",	posx=88,	posy=179,	fly=2017 },
	["仓库管理员2"]=	{ name="仓库管理员",	mapname="云霄城",		map="v002",	posx=76,	posy=188,	fly=2018 },
	["装备店老板2"]=	{ name="装备店老板",	mapname="云霄城",		map="v002",	posx=56,	posy=164,	fly=2019 },
	["上月空"]=		{ name="上月空",	mapname="云霄城",		map="v002",	posx=114,	posy=161,	fly=2020 },
	["秦妍"]=		{ name="秦妍",		mapname="云霄城",		map="v002",	posx=59,	posy=108,	fly=2021 },
	["南宫翔冰"]=		{ name="南宫翔冰",	mapname="云霄城",		map="v002",	posx=14,	posy=74,	fly=2022 },
	["裴伊楚"]=		{ name="裴伊楚",	mapname="奴玛森林",		map="v006",	posx=25,	posy=67,	fly=2023 },
	["苍神薰"]=		{ name="苍神薰",	mapname="奴玛森林",		map="v006",	posx=26,	posy=31,	fly=2024 },
	["司徒修"]=		{ name="司徒修",	mapname="奴玛寺庙",		map="wmsm1",	posx=268,	posy=258,	fly=2025},
	["司徒伊"]=		{ name="司徒伊",	mapname="奴玛寺庙",		map="wmsm1",	posx=236,	posy=223,	fly=2026 },
	["司徒智"]=		{ name="司徒智",	mapname="奴玛寺庙",		map="wmsm1",	posx=250,	posy=184,	fly=2027 },
	["苍昊云"]=		{ name="苍昊云",	mapname="沙漠土城",		map="v003",	posx=134,	posy=121,	fly=2028 },
	["乔迎"]=		{ name="乔迎",		mapname="沙漠土城",		map="v003",	posx=124,	posy=158,	fly=2029 },
	["楚时云"]=		{ name="楚时云",	mapname="沙漠土城",		map="v003",	posx=31,	posy=64,	fly=2030 },
	["路驰"]=		{ name="路驰",		mapname="沙漠土城",		map="v003",	posx=40,	posy=23,	fly=2031 },
	["以寒"]=		{ name="以寒",		mapname="沙漠土城",		map="v003",	posx=69,	posy=94,	fly=2032 },
	["祝之燃"]=		{ name="祝之燃",	mapname="荒漠",			map="v007",	posx=40,	posy=57,	fly=2033 },
	["左丘东"]=		{ name="左丘东",	mapname="邪恶洞穴",		map="wgd1",	posx=351,	posy=321,	fly=2034 },
	["左丘南"]=		{ name="左丘南",	mapname="邪恶洞穴",		map="wgd1",	posx=306,	posy=322,	fly=2035 },
	["左丘西"]=		{ name="左丘西",	mapname="邪恶洞穴",		map="wgd1",	posx=253,	posy=326,	fly=2036 },
	["张振海"]=		{ name="张振海",	mapname="王城",			map="v005",	posx=77,	posy=137,	fly=2037 },
	["白问锦"]=		{ name="白问锦",	mapname="猛犸森林",		map="v008",	posx=30,	posy=38,	fly=2039 },
	["安陵"]=		{ name="安陵",		mapname="猛犸寺庙",		map="zuma1",	posx=39,	posy=212,	fly=2040 },
	["安平"]=		{ name="安平",		mapname="猛犸寺庙",		map="zuma1",	posx=70,	posy=177,	fly=2041 },
	["安期"]=		{ name="安期",		mapname="猛犸寺庙",		map="zuma1",	posx=99,	posy=155,	fly=2042 },
	["禹峰"]=		{ name="禹峰",		mapname="猪妖洞",		map="zhudong1",	posx=32,	posy=220,	fly=2043 },
	["禹言"]=		{ name="禹言",		mapname="猪妖洞",		map="zhudong1",	posx=68,	posy=184,	fly=2044 },
	["禹诺"]=		{ name="禹诺",		mapname="猪妖洞",		map="zhudong1",	posx=97,	posy=141,	fly=2045 },
	["杂货铺老板3"]=	{ name="杂货铺老板",	mapname="沙漠土城",		map="v003",	posx=128,	posy=92,	fly=2046 },
	["药店老板3"]=		{ name="药店老板",	mapname="沙漠土城",		map="v003",	posx=116,	posy=85,	fly=2047 },
	["铁匠铺老板3"]=	{ name="铁匠铺老板",	mapname="沙漠土城",		map="v003",	posx=110,	posy=73,	fly=2048 },
	["防具店老板3"]=	{ name="防具店老板",	mapname="沙漠土城",		map="v003",	posx=95,	posy=56,	fly=2049 },
	["首饰店老板3"]=	{ name="首饰店老板",	mapname="沙漠土城",		map="v003",	posx=69,	posy=50,	fly=2050 },
	["韩飞"]=		{ name="韩飞",		mapname="蛮牛洞",		map="niumo1",	posx=43,	posy=126,	fly=2051 },
	["韩士"]=		{ name="韩士",		mapname="蛮牛洞",		map="niumo1",	posx=29,	posy=93,	fly=2052 },
	["韩耀"]=		{ name="韩耀",		mapname="蛮牛洞",		map="niumo1",	posx=26,	posy=56,	fly=2053 },
	["凌宇"]=		{ name="凌宇",		mapname="妖月峡谷",		map="chiyue1",	posx=231,	posy=74,	fly=2054 },
	["凌峰"]=		{ name="凌峰",		mapname="妖月峡谷",		map="chiyue1",	posx=209,	posy=96,	fly=2055 },
	["凌戟"]=		{ name="凌戟",		mapname="妖月峡谷",		map="chiyue1",	posx=183,	posy=120,	fly=2056 },
	["地图传送员1"]=	{ name="地图传送员",	mapname="沙漠土城",		map="v003",	posx=81,	posy=101,	fly=2057 },
	["地图传送员2"]=	{ name="地图传送员",	mapname="孤月岛",		map="v010",	posx=29,	posy=47,	fly=2058 },
	["地图传送员3"]=	{ name="地图传送员",	mapname="白云观",		map="v011",	posx=43,	posy=44,	fly=2059 },
	["孤月岛主"]=		{ name="孤月岛主",	mapname="孤月岛",		map="v010",	posx=42,	posy=51,	fly=2060 },
	["白云道长"]=		{ name="白云道长",	mapname="白云观",		map="v011",	posx=41,	posy=37,	fly=2061 },
	["夏镖头"]=		{ name="夏镖头",	mapname="沙漠土城",		map="v003",	posx=47,	posy=107,	fly=2062 },
	["副本使者"]=		{ name="副本使者",	mapname="沙漠土城",		map="v003",	posx=99,	posy=122,	fly=2063 },
	["通天塔使者"]=		{ name="通天塔使者",	mapname="沙漠土城",		map="v003",	posx=108,	posy=113,	fly=2064 },
	["伏魔使者"]=		{ name="伏魔使者",	mapname="沙漠土城",		map="v003",	posx=65,	posy=107,	fly=2065 },
	["赏金猎人"]=		{ name="赏金猎人",	mapname="沙漠土城",		map="v003",	posx=117,	posy=104,	fly=2066 },
	["百花仙子"]=		{ name="百花仙子",	mapname="云霄城",		map="v002",	posx=53,	posy=131,	fly=2067 },
	["温泉老板娘"]=		{ name="温泉老板娘",	mapname="云霄城",		map="v002",	posx=50,	posy=93,	fly=2068 },
	["官职系统"]=		{ name="官职系统",	mapname="沙漠土城",		map="v003",	posx=98,	posy=71,	fly=2069 },
	["行会副本"]=		{ name="行会副本",	mapname="沙漠土城",		map="v003",	posx=81,	posy=138,	fly=2070 },
	["林奕莲"]=		{ name="林奕莲",		mapname="孤月岛",		map="v010",	posx=44,	posy=74,	fly=2071 },
	["灵羽使者"]=		{ name="灵羽使者",		mapname="沙漠土城",		map="v003",	posx=114,	posy=94,	fly=2072 },
	["神器使者"]=		{ name="神器使者",		mapname="沙漠土城",		map="v003",	posx=128,	posy=102,	fly=2073 },
	["福利礼官"]=		{ name="福利礼官",		mapname="沙漠土城",		map="v003",	posx=85,	posy=111,	fly=2074 },
	["凌云"]=		{ name="凌云",		mapname="妖月峡谷",		map="chiyue1",	posx=158,	posy=140,	fly=2075 },
	["凌战"]=		{ name="凌战",		mapname="妖月峡谷",		map="chiyue1",	posx=133,	posy=118,	fly=2076 },
	["探险队长"]=		{ name="探险队长",	mapname="巨灵石窟",		map="jlsk1",	posx=35,	posy=78,	fly=2077 },
	["胆小的车夫"]=		{ name="胆小的车夫",	mapname="巨灵石窟",		map="jlsk1",	posx=70,	posy=79,	fly=2078 },
	["蒋神算"]=		{ name="蒋神算",	mapname="巨灵石窟",		map="jlsk1",	posx=103,	posy=65,	fly=2079 },
	["王老爷"]=		{ name="王老爷",	mapname="巨灵石窟",		map="jlsk1",	posx=151,	posy=65,	fly=2080 },
	["王强"]=		{ name="王强",		mapname="巨灵石窟",		map="jlsk1",	posx=190,	posy=69,	fly=2081 },
	["许烦了"]=		{ name="许烦了",	mapname="混沌之门",		map="hund1",	posx=210,	posy=206,	fly=2082 },
	["不辣"]=		{ name="不辣",	        mapname="混沌之门",		map="hund1",	posx=152,	posy=215,	fly=2083 },
	["小译"]=		{ name="小译",	        mapname="混沌之门",		map="hund1",	posx=115,	posy=200,	fly=2084 },
	["迷龙"]=		{ name="迷龙",  	mapname="混沌之门",		map="hund1",	posx=92,	posy=147,	fly=2085 },
	["豆豆"]=		{ name="豆豆",		mapname="混沌之门",		map="hund1",	posx=79,	posy=99,	fly=2086 },
	["贺英"]=		{ name="贺英",	        mapname="冰封雪域",		map="bfxy1",	posx=203,	posy=70,	fly=2087 },
	["美美"]=		{ name="美美",	        mapname="冰封雪域",		map="bfxy1",	posx=229,	posy=111,	fly=2088 },
	["聂虎"]=		{ name="聂虎",	        mapname="冰封雪域",		map="bfxy1",	posx=187,	posy=153,	fly=2089 },
	["元龙"]=		{ name="元龙",  	mapname="冰封雪域",		map="bfxy1",	posx=160,	posy=133,	fly=2090 },
	["韩啸"]=		{ name="韩啸",		mapname="冰封雪域",		map="bfxy1",	posx=156,	posy=96,	fly=2091 },
	["石铁"]=		{ name="石铁",	        mapname="烈炎魔窟",		map="dyry1",	posx=24,	posy=220,	fly=2092 },
	["南宫翔"]=		{ name="南宫翔",        mapname="烈炎魔窟",		map="dyry1",	posx=51,	posy=218,	fly=2093 },
	["斩铁"]=		{ name="斩铁",	        mapname="烈炎魔窟",		map="dyry1",	posx=97,	posy=205,	fly=2094 },
	["释拳"]=		{ name="释拳",  	mapname="烈炎魔窟",		map="dyry1",	posx=138,	posy=191,	fly=2095 },
	["铁猛"]=		{ name="铁猛",		mapname="烈炎魔窟",		map="dyry1",	posx=152,	posy=161,	fly=2096 },
	["邢威"]=		{ name="邢威",	        mapname="落日刑场",		map="swxc1",	posx=27,	posy=223,	fly=2097 },
	["苏珊娜"]=		{ name="苏珊娜",        mapname="落日刑场",		map="swxc1",	posx=28,	posy=192,	fly=2098 },
	["郑虎"]=		{ name="郑虎",	        mapname="落日刑场",		map="swxc1",	posx=28,	posy=157,	fly=2099 },
	["何欢"]=		{ name="何欢",  	mapname="落日刑场",		map="swxc1",	posx=53,	posy=132,	fly=2100 },
	["何惧"]=		{ name="何惧",		mapname="落日刑场",		map="swxc1",	posx=95,	posy=129,	fly=2101 },
	["巫祝"]=		{ name="巫祝",	        mapname="神庙祭坛",		map="zzzd1",	posx=42,	posy=222,	fly=2102 },
	["李三山"]=		{ name="李三山",        mapname="神庙祭坛",		map="zzzd1",	posx=40,	posy=188,	fly=2103 },
	["向齐"]=		{ name="向齐",	        mapname="神庙祭坛",		map="zzzd1",	posx=74,	posy=160,	fly=2104 },
	["上官涛"]=		{ name="上官涛",  	mapname="神庙祭坛",		map="zzzd1",	posx=115,	posy=170,	fly=2105 },
	["盖聂"]=		{ name="盖聂",		mapname="神庙祭坛",		map="zzzd1",	posx=153,	posy=205,	fly=2106 },
	["裁决使者"]=	{ name="裁决使者",	mapname="沙漠之城",		map="v003",	posx=103,	posy=115,	fly=1229 },
}
local data = np;
for i,v in pairs(data) do
	if v.fly >=2000 and v.fly<3000 then
		server.set_fly_node(v.fly,v.map,v.posx,v.posy+1,v.name);
	end
end
function pos(npc_name)
	local d = np[npc_name];
	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["mapname"].."</a>的<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["name"].."</a>";end--<a href='event:fly_"..d["fly"].."'><s='r'>[传]</s></a>
	return "";
end
--function p(npc_name)
--	local d = np[npc_name];
----	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["name"].."</a>";end--<a href='event:fly_"..d["fly"].."'><s='r'>[传]</s></a>
--	return "";
--end
--function go(player,npc_name)
--	local d = np[npc_name];
--	if d then player:find_road_goto(d["map"],d["posx"],d["posy"],d["name"]); end
--end
function mp(npc_name)
	local d = data[npc_name];
	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["mapname"].."</a>的<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["name"].."</a><a href='event:fly_"..d["fly"].."'><s='r'>[传]</s></a>";end
	return  "<s='r'>"..npc_name.."</s>";
end
function fp(npc_name)
	local d = data[npc_name];
	if d then return "<a href='event:fly_"..d["fly"].."'>"..d["mapname"].."</a>的<a href='event:fly_"..d["fly"].."'>"..d["name"].."</a>";end
	return  "<s='r'>"..npc_name.."</s>";
end
function tp(npc_name)
	local d = data[npc_name];
	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["mapname"].."</a>的<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["name"].."</a>";end
	return  "<s='r'>"..npc_name.."</s>";
end
function p(npc_name)
	local d = data[npc_name];
	if d then return "<a href='event:local_goto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["name"].."</a><a href='event:fly_"..d["fly"].."'><s='r'>[传]</s></a>";end
	return  "<s='r'>"..npc_name.."</s>";
end
function go(player,npc_name)
	local d = data[npc_name];
	if d then player:find_road_goto(d["map"],d["posx"],d["posy"],d["name"]); end
end
function fly(player,npc_name)
	local d = data[npc_name];
	if d then player:enter_map(d["map"],d["posx"],d["posy"]+1,d["name"]);player:find_road_goto(d["map"],d["posx"],d["posy"],d["name"]); end
end
function cp(npc_name,param)
	local d = data[npc_name];
	if d then return "<a href='event:talk_".. param .."'>"..d["mapname"].."</a>的<a href='event:click_".. param .."'>"..d["name"].."</a>";end
	return  "<s='r'>"..npc_name.."</s>";
end
function walk(npc_name)
	local d = data[npc_name];
	if d then return "<a href='event:local_walkto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["mapname"].."</a>的<a href='event:local_walkto_"..d["map"].."_"..d["posx"].."_"..d["posy"].."_"..d["name"].."'>"..d["name"].."</a>";end
	return  "<s='r'>"..npc_name.."</s>";
end
function go2(player,npc_name,walk)
	local d = data[npc_name];
	if d then player:find_road_goto(d["map"],d["posx"],d["posy"],d["name"],walk); end
end
