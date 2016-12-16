module(..., package.seeall)
local data={
	["山羊"]=   { 
		name="山羊",
		mapname="边界村",
		map="xinshou",
		pos={
			{posx=68,    posy=85,    fly=3000},
		},
	},
	["蛤蟆怪"]=   { 
		name="蛤蟆怪",
		mapname="边界村",
		map="xinshou",
		pos={
			{posx=60,    posy=60,    fly=3001},
		},
	},
	["狼人"]=   { 
		name="狼人",
		mapname="边界村",
		map="xinshou",
		pos={
			{posx=41,    posy=35,    fly=3002},
		},
	},
	["瘸腿僵尸"]=   { 
		name="瘸腿僵尸",
		mapname="僵尸洞穴",
		map="jsd1",
		pos={
			{posx=46,    posy=200,    fly=3003},
			{posx=35,    posy=188,    fly=3004},
		},
	},
	["铁矿"]=   { 
		name="铁矿",
		mapname="僵尸洞穴",
		map="jsd1",
		pos={
			{posx=90,    posy=195,    fly=3005},
			{posx=69,    posy=190,    fly=3006},
		},
	},
	["爬行僵尸"]=   { 
		name="爬行僵尸",
		mapname="僵尸洞穴",
		map="jsd1",
		pos={
			{posx=133,    posy=198,    fly=3007},
			{posx=104,    posy=197,    fly=3008},
		},
	},
	["奴玛战士"]=   { 
		name="奴玛战士",
		mapname="奴玛寺庙",
		map="wmsm1",
		pos={
			{posx=256,    posy=246,    fly=3009},
			{posx=282,    posy=262,    fly=3010},
		},
	},
	["奴玛勇士"]=   { 
		name="奴玛勇士",
		mapname="奴玛寺庙",
		map="wmsm1",
		pos={
			{posx=224,    posy=208,    fly=3011},
			{posx=214,    posy=226,    fly=3012},
		},
	},
	["奴玛战将"]=   { 
		name="奴玛战将",
		mapname="奴玛寺庙",
		map="wmsm1",
		pos={
			{posx=258,    posy=174,    fly=3013},
			{posx=232,    posy=194,    fly=3014},
		},
	},
	["百足长虫"]=   { 
		name="百足长虫",
		mapname="邪恶洞穴",
		map="wgd1",
		pos={
			{posx=331,    posy=330,    fly=3015},
			{posx=363,    posy=319,    fly=3016},
		},
	},
	["穿山甲"]=   { 
		name="穿山甲",
		mapname="邪恶洞穴",
		map="wgd1",
		pos={
			{posx=290,    posy=323,    fly=3017},
			{posx=319,    posy=333,    fly=3018},
		},
	},
	["蠕虫"]=   { 
		name="蠕虫",
		mapname="邪恶洞穴",
		map="wgd1",
		pos={
			{posx=240,    posy=317,    fly=3019},
			{posx=220,    posy=309,    fly=3020},
		},
	},
	["红猪妖"]=   { 
		name="红猪妖",
		mapname="猪妖洞",
		map="zhudong1",
		pos={
			{posx=42,    posy=210,    fly=3021},
			{posx=34,    posy=232,    fly=3022},
		},
	},
	["黑猪妖"]=   { 
		name="黑猪妖",
		mapname="猪妖洞",
		map="zhudong1",
		pos={
			{posx=80,    posy=196,    fly=3023},
			{posx=59,    posy=174,    fly=3024},
		},
	},
	["食人蛾"]=   { 
		name="食人蛾",
		mapname="猪妖洞",
		map="zhudong1",
		pos={
			{posx=104,    posy=150,    fly=3025},
			{posx=112,    posy=128,    fly=3026},
		},
	},
	["蛇蝎"]=   { 
		name="蛇蝎",
		mapname="猛犸寺庙",
		map="zuma1",
		pos={
			{posx=49,    posy=202,    fly=3027},
			{posx=29,    posy=215,    fly=3028},
		},
	},
	["猛犸雕像"]=   { 
		name="猛犸雕像",
		mapname="猛犸寺庙",
		map="zuma1",
		pos={
			{posx=79,    posy=169,    fly=3029},
			{posx=58,    posy=191,    fly=3030},
		},
	},
	["猛犸卫士"]=   { 
		name="猛犸卫士",
		mapname="猛犸寺庙",
		map="zuma1",
		pos={
			{posx=107,    posy=170,    fly=3031},
			{posx=88,    posy=142,    fly=3032},
		},
	},
	["蛮牛战士"]=   { 
		name="蛮牛战士",
		mapname="蛮牛洞",
		map="niumo1",
		pos={
			{posx=33,    posy=122,    fly=3033},
			{posx=53,    posy=136,    fly=3034},
		},
	},
	["蛮牛斗士"]=   { 
		name="蛮牛斗士",
		mapname="蛮牛洞",
		map="niumo1",
		pos={
			{posx=43,    posy=83,    fly=3035},
			{posx=21,    posy=75,    fly=3036},
		},
	},
	["蛮牛法师"]=   { 
		name="蛮牛法师",
		mapname="蛮牛洞",
		map="niumo1",
		pos={
			{posx=39,    posy=48,    fly=3037},
			{posx=49,    posy=72,    fly=3038},
		},
	},
	["狼牙蜘蛛"]=   { 
		name="狼牙蜘蛛",
		mapname="妖月峡谷",
		map="chiyue1",
		pos={
			{posx=229,    posy=56,    fly=3039},
		},
	},
	["钢刺蜘蛛"]=   { 
		name="钢刺蜘蛛",
		mapname="妖月峡谷",
		map="chiyue1",
		pos={
			{posx=170,    posy=154,    fly=3040},
		},
	},
	["赤锷蜘蛛"]=   { 
		name="赤锷蜘蛛",
		mapname="妖月峡谷",
		map="chiyue1",
		pos={
			{posx=124,    posy=101,    fly=3041},
		},
	},
	["霜草"]=   { 
		name="霜草",
		mapname="边界村",
		map="xinshou",
		pos={
			{posx=78,    posy=45,    fly=3042},
		},
	},
	["百足长虫2"]=   { 
		name="百足长虫",
		mapname="邪恶洞穴",
		map="wgd2",
		pos={
			{posx=51,    posy=51,    fly=3043},
		},
	},
	["恶蛆虫2"]=   { 
		name="恶蛆虫",
		mapname="邪恶洞穴",
		map="wgd2",
		pos={
			{posx=144,    posy=136,    fly=3044},
		},
	},
	["穿山甲2"]=   { 
		name="穿山甲",
		mapname="邪恶洞穴",
		map="wgd2",
		pos={
			{posx=141,    posy=177,    fly=3045},
		},
	},
	["杀人蜂2"]=   { 
		name="杀人蜂",
		mapname="邪恶洞穴",
		map="wgd2",
		pos={
			{posx=245,    posy=198,    fly=3046},
		},
	},
	["蠕虫2"]=   { 
		name="蠕虫",
		mapname="邪恶洞穴",
		map="wgd2",
		pos={
			{posx=272,    posy=132,    fly=3047},
		},
	},
	["红猪妖2"]=   { 
		name="红猪妖",
		mapname="猪妖洞",
		map="zhudong3",
		pos={
			{posx=131,    posy=125,    fly=3048},
		},
	},
	["黑猪妖2"]=   { 
		name="黑猪妖",
		mapname="猪妖洞",
		map="zhudong3",
		pos={
			{posx=211,    posy=141,    fly=3049},
		},
	},
	["食人蛾2"]=   { 
		name="食人蛾",
		mapname="猪妖洞",
		map="zhudong3",
		pos={
			{posx=176,    posy=74,    fly=3050},
		},
	},
	["蛇蝎2"]=   { 
		name="蛇蝎",
		mapname="猛犸寺庙",
		map="zuma2",
		pos={
			{posx=122,    posy=149,    fly=3051},
		},
	},
	["猛犸雕像2"]=   { 
		name="猛犸雕像",
		mapname="猛犸寺庙",
		map="zuma2",
		pos={
			{posx=45,    posy=50,    fly=3052},
		},
	},
	["猛犸卫士2"]=   { 
		name="猛犸卫士",
		mapname="猛犸寺庙",
		map="zuma2",
		pos={
			{posx=122,    posy=67,    fly=3053},
		},
	},
	["牛头妖2"]=   { 
		name="牛头妖",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=38,    posy=37,    fly=3054},
		},
	},
	["蛮牛战士2"]=   { 
		name="蛮牛战士",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=59,    posy=79,    fly=3055},
		},
	},
	["蛮牛斗士2"]=   { 
		name="蛮牛斗士",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=100,    posy=140,    fly=3056},
		},
	},
	["蛮牛侍卫2"]=   { 
		name="蛮牛侍卫",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=40,    posy=186,    fly=3057},
		},
	},
	["蛮牛法师2"]=   { 
		name="蛮牛法师",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=137,    posy=44,    fly=3058},
		},
	},
	["蛮牛将军2"]=   { 
		name="蛮牛将军",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=208,    posy=67,    fly=3059},
		},
	},
	["蛮牛祭司2"]=   { 
		name="蛮牛祭司",
		mapname="蛮牛洞",
		map="niumo2",
		pos={
			{posx=219,    posy=134,    fly=3060},
		},
	},
	["狼牙蜘蛛2"]=   { 
		name="狼牙蜘蛛",
		mapname="妖月峡谷",
		map="chiyue2",
		pos={
			{posx=52,    posy=193,    fly=3061},
		},
	},
	["妖魔蜘蛛2"]=   { 
		name="妖魔蜘蛛",
		mapname="妖月峡谷",
		map="chiyue2",
		pos={
			{posx=92,    posy=145,    fly=3121},
		},
	},
	["钢刺蜘蛛2"]=   { 
		name="钢刺蜘蛛",
		mapname="妖月峡谷",
		map="chiyue2",
		pos={
			{posx=65,    posy=89,    fly=3062},
		},
	},
	["妖毒蜘蛛2"]=   { 
		name="妖毒蜘蛛",
		mapname="妖月峡谷",
		map="chiyue2",
		pos={
			{posx=157,    posy=83,    fly=3063},
		},
	},
	["赤锷蜘蛛2"]=   { 
		name="赤锷蜘蛛",
		mapname="妖月峡谷",
		map="chiyue2",
		pos={
			{posx=210,    posy=58,    fly=3064},
		},
	},
	["巨灵勇士2"]=   { 
		name="巨灵勇士",
		mapname="巨灵石窟",
		map="jlsk2",
		pos={
			{posx=86,    posy=182,    fly=3065},
		},
	},
	["巨灵战士2"]=   { 
		name="巨灵战士",
		mapname="巨灵石窟",
		map="jlsk2",
		pos={
			{posx=71,    posy=63,    fly=3066},
		},
	},
	["巨灵战斧2"]=   { 
		name="巨灵战斧",
		mapname="巨灵石窟",
		map="jlsk2",
		pos={
			{posx=175,    posy=103,    fly=3067},
		},
	},
	["混沌斗士2"]=   { 
		name="混沌斗士",
		mapname="混沌之门",
		map="hund2",
		pos={
			{posx=63,    posy=58,    fly=3068},
		},
	},
	["混沌侍卫2"]=   { 
		name="混沌侍卫",
		mapname="混沌之门",
		map="hund2",
		pos={
			{posx=92,    posy=162,    fly=3069},
		},
	},
	["混沌将军2"]=   { 
		name="混沌将军",
		mapname="混沌之门",
		map="hund2",
		pos={
			{posx=171,    posy=209,    fly=3070},
		},
	},
	["雪狼勇士2"]=   { 
		name="雪狼勇士",
		mapname="冰封雪域",
		map="bfxy2",
		pos={
			{posx=198,    posy=215,    fly=3071},
		},
	},
	["雪狼战士2"]=   { 
		name="雪狼战士",
		mapname="冰封雪域",
		map="bfxy2",
		pos={
			{posx=154,    posy=105,    fly=3072},
		},
	},
	["雪狼斗士2"]=   { 
		name="雪狼斗士",
		mapname="冰封雪域",
		map="bfxy2",
		pos={
			{posx=81,    posy=61,    fly=3073},
		},
	},
	["地狱战士2"]=   { 
		name="地狱战士",
		mapname="地狱熔岩",
		map="dyry2",
		pos={
			{posx=207,    posy=129,    fly=3074},
		},
	},
	["地狱护卫2"]=   { 
		name="地狱护卫",
		mapname="地狱熔岩",
		map="dyry2",
		pos={
			{posx=55,    posy=70,    fly=3075},
		},
	},
	["地狱战将2"]=   { 
		name="地狱战将",
		mapname="地狱熔岩",
		map="dyry2",
		pos={
			{posx=141,    posy=165,    fly=3076},
		},
	},
	["僵尸王"]=   { 
		name="僵尸王",
		mapname="尸王殿",
		map="swd",
		pos={
			{posx=25,    posy=25,    fly=3077},
		},
	},
	["奴玛卫士"]=   { 
		name="奴玛卫士",
		mapname="奴玛神殿",
		map="wmsm3",
		pos={
			{posx=63,    posy=126,    fly=3078},
		},
	},
	["奴玛教主"]=   { 
		name="奴玛教主",
		mapname="奴玛神殿",
		map="wmsm3",
		pos={
			{posx=63,    posy=126,    fly=3079},
		},
	},
	["巨型穿山甲"]=   { 
		name="巨型穿山甲",
		mapname="邪恶之谷",
		map="wgd5",
		pos={
			{posx=169,    posy=137,    fly=3080},
		},
	},
	["嗜血毒虫"]=   { 
		name="嗜血毒虫",
		mapname="邪恶之谷",
		map="wgd5",
		pos={
			{posx=165,    posy=119,    fly=3081},
		},
	},
	["白猪王"]=   { 
		name="白猪王",
		mapname="猪妖巢穴",
		map="zhudong4",
		pos={
			{posx=48,    posy=143,    fly=3082},
		},
	},
	["邪恶蛇蝎"]=   { 
		name="邪恶蛇蝎",
		mapname="猪妖巢穴",
		map="zhudong4",
		pos={
			{posx=125,    posy=67,    fly=3083},
		},
	},
	["魔魂教主"]=   { 
		name="魔魂教主",
		mapname="伏魔殿",
		map="fengmo4",
		pos={
			{posx=108,    posy=109,    fly=3084},
		},
	},
	["蛮牛王"]=   { 
		name="蛮牛王",
		mapname="蛮牛大殿",
		map="niumo4",
		pos={
			{posx=123,    posy=57,    fly=3085},
		},
	},
	["蛮力巨人"]=   { 
		name="蛮力巨人",
		mapname="妖月峡谷",
		map="chiyue3",
		pos={
			{posx=70,    posy=76,    fly=3086},
		},
	},
	["玫瑰"]=   { 
		name="玫瑰",
		mapname="奴玛森林",
		map="v006",
		pos={
			{posx=32,    posy=45,    fly=3087},
		},
	},
	["佛桑花"]=   { 
		name="佛桑花",
		mapname="恶人村",
		map="v004",
		pos={
			{posx=20,    posy=17,    fly=3088},
		},
	},
	["秋海棠"]=   { 
		name="秋海棠",
		mapname="孤月岛",
		map="v010",
		pos={
			{posx=35,    posy=75,    fly=3089},
		},
	},
	["虞美人"]=   { 
		name="虞美人",
		mapname="边界村",
		map="xinshou",
		pos={
			{posx=34,    posy=38,    fly=3090},
		},
	},
	["曼陀罗"]=   { 
		name="曼陀罗",
		mapname="伏魔谷",
		map="v009",
		pos={
			{posx=19,    posy=24,    fly=3091},
		},
	},
	["鱼1"]=   { 
		name="鱼",
		mapname="温泉",
		map="wenquan2",
		pos={
			{posx=40,    posy=25,    fly=3092},
			{posx=14,    posy=32,    fly=3093},
			{posx=16,    posy=63,    fly=3094},
			{posx=42,    posy=59,    fly=3095},
		},
	},
	["巨灵勇士"]=   { 
		name="巨灵勇士",
		mapname="巨灵石窟",
		map="jlsk1",
		pos={
			{posx=49,    posy=92,    fly=3096},
		},
	},
	["巨灵战士"]=   { 
		name="巨灵战士",
		mapname="巨灵石窟",
		map="jlsk1",
		pos={
			{posx=89,    posy=81,    fly=3097},
		},
	},
	["巨灵战斧"]=   { 
		name="巨灵战斧",
		mapname="巨灵石窟",
		map="jlsk1",
		pos={
			{posx=105,    posy=43,    fly=3098},
		},
	},
	["巨灵守卫"]=   { 
		name="巨灵守卫",
		mapname="巨灵石窟",
		map="jlsk1",
		pos={
			{posx=174,    posy=53,    fly=3099},
		},
	},
	["混沌斗士"]=   { 
		name="混沌斗士",
		mapname="混沌之门",
		map="hund1",
		pos={
			{posx=182,    posy=207,    fly=3100},
		},
	},
	["混沌侍卫"]=   { 
		name="混沌侍卫",
		mapname="混沌之门",
		map="hund1",
		pos={
			{posx=131,    posy=223,    fly=3101},
		},
	},
	["混沌将军"]=   { 
		name="混沌将军",
		mapname="混沌之门",
		map="hund1",
		pos={
			{posx=103,    posy=173,    fly=3102},
		},
	},
	["混沌祭司"]=   { 
		name="混沌祭司",
		mapname="混沌之门",
		map="hund1",
		pos={
			{posx=106,    posy=120,    fly=3103},
		},
	},
	["雪狼勇士"]=   { 
		name="雪狼勇士",
		mapname="冰封雪域",
		map="bfxy1",
		pos={
			{posx=212,    posy=88,    fly=3104},
		},
	},
	["雪狼战士"]=   { 
		name="雪狼战士",
		mapname="冰封雪域",
		map="bfxy1",
		pos={
			{posx=208,    posy=143,    fly=3105},
		},
	},
	["雪狼斗士"]=   { 
		name="雪狼斗士",
		mapname="冰封雪域",
		map="bfxy1",
		pos={
			{posx=165,    posy=161,    fly=3106},
		},
	},
	["雪狼战斧"]=   { 
		name="雪狼战斧",
		mapname="冰封雪域",
		map="bfxy1",
		pos={
			{posx=158,    posy=120,    fly=3107},
		},
	},
	["地狱战士"]=   { 
		name="地狱战士",
		mapname="地狱熔岩",
		map="dyry1",
		pos={
			{posx=34,    posy=213,    fly=3108},
		},
	},
	["地狱护卫"]=   { 
		name="地狱护卫",
		mapname="地狱熔岩",
		map="dyry1",
		pos={
			{posx=71,    posy=205,    fly=3109},
		},
	},
	["地狱战将"]=   { 
		name="地狱战将",
		mapname="地狱熔岩",
		map="dyry1",
		pos={
			{posx=109,    posy=195,    fly=3110},
		},
	},
	["地狱将军"]=   { 
		name="地狱将军",
		mapname="地狱熔岩",
		map="dyry1",
		pos={
			{posx=148,    posy=179,    fly=3111},
		},
	},
	["死亡战士"]=   { 
		name="死亡战士",
		mapname="落日峡谷",
		map="swxc1",
		pos={
			{posx=46,    posy=221,    fly=3112},
		},
	},
	["死亡斗士"]=   { 
		name="死亡斗士",
		mapname="落日峡谷",
		map="swxc1",
		pos={
			{posx=27,    posy=176,    fly=3113},
		},
	},
	["死亡战斧"]=   { 
		name="死亡战斧",
		mapname="落日峡谷",
		map="swxc1",
		pos={
			{posx=28,    posy=134,    fly=3114},
		},
	},
	["死亡勇士"]=   { 
		name="死亡勇士",
		mapname="落日峡谷",
		map="swxc1",
		pos={
			{posx=72,    posy=125,    fly=3115},
		},
	},
	["神庙士兵"]=   { 
		name="神庙士兵",
		mapname="神庙废墟",
		map="zzzd1",
		pos={
			{posx=24,    posy=228,    fly=3116},
		},
	},
	["神庙战斧"]=   { 
		name="神庙战斧",
		mapname="神庙废墟",
		map="zzzd1",
		pos={
			{posx=24,    posy=190,    fly=3117},
		},
	},
	["神庙魔兵"]=   { 
		name="神庙魔兵",
		mapname="神庙废墟",
		map="zzzd1",
		pos={
			{posx=77,    posy=142,    fly=3118},
		},
	},
	["神庙魔将"]=   { 
		name="神庙魔将",
		mapname="神庙废墟",
		map="zzzd1",
		pos={
			{posx=133,    posy=192,    fly=3119},
		},
	},
	["妖魔蜘蛛"]=   { 
		name="妖魔蜘蛛",
		mapname="妖月峡谷",
		map="chiyue1",
		pos={
			{posx=195,    posy=106,    fly=3122},
		},
	},
	["妖毒蜘蛛"]=   { 
		name="妖毒蜘蛛",
		mapname="妖月峡谷",
		map="chiyue1",
		pos={
			{posx=191,    posy=141,    fly=3123},
		},
	},
}
for i,v in pairs(data) do
	for j,w in pairs(v.pos) do
		if w.fly >=3000 and w.fly<4000 then
			server.set_fly_node(w.fly,v.map,w.posx,w.posy,v.name);
		end
	end
end
function pos(player,mn)
	local d = data[mn];
	if d then
		local k = math.random(1,#d.pos);
		return "<a href='event:local_goto_"..d["map"].."_"..d.pos[k]["posx"].."_"..d.pos[k]["posy"].."_"..d["name"].."'>"..d["name"].."</a>";--<a href='event:fly_"..d.pos[k]["fly"].."'><s='r'>[传]</s></a>
	end
	return "";
end
function fpos(player,mn)
	local d = data[mn];
	if d then
		--local k = (player:get_id() % (#d.pos))+1;
		local k = math.random(1,#d.pos);
		return "<a href='event:local_goto_"..d["map"].."_"..d.pos[k]["posx"].."_"..d.pos[k]["posy"].."_"..d["name"].."'>"..d["mapname"].."</a>的<a href='event:local_goto_"..d["map"].."_"..d.pos[k]["posx"].."_"..d.pos[k]["posy"].."_"..d["name"].."'>"..d["name"].."</a>";--<a href='event:fly_"..d.pos[k]["fly"].."'><s='r'>[传]</s></a>
	end
	return "";
end
--function go(player,mn)
--	local d = mp[mn];
--	if d then
--		local k = math.random(1,#d.pos);
--		player:find_road_goto(d["map"],d.pos[k]["posx"],d.pos[k]["posy"],d["name"]);
--	end
--	return "";
--end
function mp(player,mn)
	local d = data[mn];
	if d then
		local k = math.floor(player:get_create_time()%#d.pos)+1;--math.random(1,#d.pos);
		return "<a href='event:local_goto_"..d["map"].."_"..d.pos[k]["posx"].."_"..d.pos[k]["posy"].."_"..d["name"].."'>"..d["mapname"].."</a>的<a href='event:local_goto_"..d["map"].."_"..d.pos[k]["posx"].."_"..d.pos[k]["posy"].."_"..d["name"].."'>"..string.gsub(d["name"],"%d","").."</a><a href='event:fly_"..d.pos[k]["fly"].."'><s='r'>[传]</s></a>";
	end
	return "<s='r'>"..string.gsub(mn,"%d","").."</s>";
end
function p(player,mn)
	local d = data[mn];
	if d then
		local k = math.floor(player:get_create_time()%#d.pos)+1;--math.random(1,#d.pos);
		return "<a href='event:local_goto_"..d["map"].."_"..d.pos[k]["posx"].."_"..d.pos[k]["posy"].."_"..d["name"].."'>"..string.gsub(d["name"],"%d","").."</a><a href='event:fly_"..d.pos[k]["fly"].."'><s='r'>[传]</s></a>";--
	end
	return "<s='r'>"..string.gsub(mn,"%d","").."</s>";
end
function go(player,mn)
	local d = data[mn];
	if d then
		local k = math.floor(player:get_create_time()%#d.pos)+1;--math.random(1,#d.pos);
		player:find_road_goto(d["map"],d.pos[k]["posx"],d.pos[k]["posy"],d["name"]);
	end
	return "";
end
function fly(player,mn)
	local d = data[mn];
	if d then
		local k = math.floor(player:get_create_time()%#d.pos)+1;--math.random(1,#d.pos);
		player:enter_map(d["map"],d.pos[k]["posx"],d.pos[k]["posy"]+1,d["name"]);
		player:find_road_goto(d["map"],d.pos[k]["posx"],d.pos[k]["posy"],d["name"]);
	end
	return "";
end
function n(mn)
	local d = data[mn];
	if d then
		return d.name;
	end	
	return mn;
end