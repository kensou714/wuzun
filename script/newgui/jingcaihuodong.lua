module(..., package.seeall)
local ACTIONSET_NAME="longactivity";
local PANEL_ACTIONSET_NAME="panellongactivity";

local isOpen = true;--活动总开关

local jchd={
	[1]={name="qfsbge",begin=6,continue=3,interval=5,isOpen=true,remark="全服双倍感恩",iseveryday=false,awardtype=0,pcon=0,times=0,contents={}},
	[2]={name="mrcz",begin=1,continue=1,interval=0,isOpen=true,remark="每日充值",iseveryday=true,awardtype=1,pcon=const.PP_DAILY_CONGZI,times=const.PP_CONGZI_DAY,
	contents={{{key=1000,awardpcon=const.PP_JC_MRSC1,slot=6,award={{name="绑定元宝",num=1000},{name="经验珠(500万)",num=1},{name="祈福令牌(小)",num=1},{name="坐骑经验丹(大)",num=1},{name="三级攻击玄晶",num=1},{name="招财神符(大)",num=1},{name="五级宝石",num=1}}},
		   	  {key=5000,awardpcon=const.PP_JC_MRSC2,slot=6,award={{name="绑定元宝",num=1000},{name="经验珠(1000万)",num=1},{name="祈福令牌(小)",num=4},{name="坐骑经验丹(大)",num=2},{name="三级攻击玄晶",num=2},{name="进阶石",num=100},{name="六级宝石",num=1}}},
		   	  {key=10000,awardpcon=const.PP_JC_MRSC3,slot=6,award={{name="绑定元宝",num=2000},{name="经验珠(2000万)",num=1},{name="祈福令牌(中)",num=1},{name="坐骑经验丹(大)",num=4},{name="三级攻击玄晶",num=4},{name="进阶石",num=200},{name="七级宝石",num=1}}},
		   	  {key=50000,awardpcon=const.PP_JC_MRSC4,slot=6,award={{name="绑定元宝",num=5000},{name="经验珠(5000万)",num=1},{name="祈福令牌(大)",num=4},{name="坐骑经验丹(大)",num=8},{name="三级攻击玄晶",num=8},{name="进阶石",num=400},{name="八级宝石",num=1}}},
			}}},
	[3]={name="mrljcz",begin=11,continue=5,interval=10,isOpen=true,remark="每日累计充值",iseveryday=true,awardtype=1,pcon=const.PP_DAILY_CONGZI,times=const.PP_CONGZI_DAY,
	contents={{{key=5000,awardpcon=const.PP_JC_MRLJCZ1,slot=3,award={{name="绑定元宝",num=2000},{name="进阶石",num=100},{name="经验珠(500万)",num=1},{name="灵羽宝箱",num=1},}},
	   	  		{key=10000,awardpcon=const.PP_JC_MRLJCZ2,slot=4,award={{name="绑定元宝",num=5000},{name="进阶石",num=100},{name="经验珠(1000万)",num=1},{name="装备宝箱",num=1},{name="灵羽宝箱",num=1},}},
	   	  		{key=30000,awardpcon=const.PP_JC_MRLJCZ3,slot=4,award={{name="绑定元宝",num=5000},{name="祈福令牌(小)",num=1},{name="经验珠(2000万)",num=1},{name="装备宝箱",num=2},{name="灵羽宝箱",num=2},}},
	   	  		{key=50000,awardpcon=const.PP_JC_MRLJCZ4,slot=4,award={{name="绑定元宝",num=5000},{name="祈福令牌(小)",num=2},{name="经验珠(2000万)",num=1},{name="装备宝箱",num=2},{name="灵羽宝箱",num=2},}},
	   	  		{key=100000,awardpcon=const.PP_JC_MRLJCZ5,slot=5,award={{name="绑定元宝",num=5000},{name="六级灵羽",num=1},{name="七级宝石",num=1},{name="祈福令牌(中)",num=1},{name="经验珠(5000万)",num=1},{name="装备宝箱",num=5},}},
	   	  		{key=300000,awardpcon=const.PP_JC_MRLJCZ6,slot=4,award={{name="绑定元宝",num=5000},{name="七级灵羽",num=1},{name="八级宝石",num=1},{name="祈福令牌(大)",num=1},{name="经验珠(5000万)",num=2},}},
	   	  		{key=500000,awardpcon=const.PP_JC_MRLJCZ7,slot=4,award={{name="绑定元宝",num=5000},{name="八级灵羽",num=1},{name="九级宝石",num=1},{name="祈福令牌(大)",num=2},{name="经验珠(5000万)",num=2},}},
		}}},
	[4]={name="mrljxf",begin=18,continue=5,interval=10,isOpen=true,remark="每日累计消费",iseveryday=true,awardtype=1,pcon=const.PP_LEIJIXF,times=const.PP_LEIJIXF_DATE,
	contents={{{key=5000,awardpcon=const.PP_JC_MRLJXF1,slot=3,award={{name="绑定元宝",num=2000},{name="进阶石",num=100},{name="经验珠(500万)",num=1},{name="灵羽宝箱",num=1},}},
	   	  		{key=10000,awardpcon=const.PP_JC_MRLJXF2,slot=4,award={{name="绑定元宝",num=5000},{name="进阶石",num=100},{name="经验珠(1000万)",num=1},{name="装备宝箱",num=1},{name="灵羽宝箱",num=1},}},
	   	  		{key=30000,awardpcon=const.PP_JC_MRLJXF3,slot=4,award={{name="绑定元宝",num=5000},{name="祈福令牌(小)",num=1},{name="经验珠(2000万)",num=1},{name="装备宝箱",num=2},{name="灵羽宝箱",num=2},}},
	   	  		{key=50000,awardpcon=const.PP_JC_MRLJXF4,slot=4,award={{name="绑定元宝",num=5000},{name="祈福令牌(小)",num=2},{name="经验珠(2000万)",num=1},{name="装备宝箱",num=2},{name="灵羽宝箱",num=2},}},
	   	  		{key=100000,awardpcon=const.PP_JC_MRLJXF5,slot=5,award={{name="绑定元宝",num=5000},{name="六级灵羽",num=1},{name="七级宝石",num=1},{name="祈福令牌(中)",num=1},{name="经验珠(5000万)",num=1},{name="装备宝箱",num=5},}},
	   	  		{key=300000,awardpcon=const.PP_JC_MRLJXF6,slot=4,award={{name="绑定元宝",num=5000},{name="七级灵羽",num=1},{name="八级宝石",num=1},{name="祈福令牌(大)",num=1},{name="经验珠(5000万)",num=2},}},
	   	  		{key=500000,awardpcon=const.PP_JC_MRLJXF7,slot=4,award={{name="绑定元宝",num=5000},{name="八级灵羽",num=1},{name="九级宝石",num=1},{name="祈福令牌(大)",num=2},{name="经验珠(5000万)",num=2},}},
				}}},
	[5]={name="zqsj",begin=1,continue=3,interval=7,isOpen=true,remark="坐骑升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_ZQSJ_TIMES,
	contents={{{key=4,awardpcon=const.PP_JC_ZQSJ1,slot=1,award={{name="二级物防玄晶",num=1,typeid=10237,icon1=10004,icon2=10032},}},{key=5,awardpcon=const.PP_JC_ZQSJ2,slot=1,award={{name="三级物防玄晶",num=1,typeid=10238,icon1=10034,icon2=10035},}},{key=6,awardpcon=const.PP_JC_ZQSJ3,slot=1,award={{name="四级物防玄晶",num=1,typeid=10239,icon1=10036,icon2=10037},}},{key=7,awardpcon=const.PP_JC_ZQSJ4,slot=1,award={{name="五级物防玄晶",num=1,typeid=10240,icon1=10038,icon2=10039},}},},
	   	  	{{key=6,awardpcon=const.PP_JC_ZQSJ3,slot=1,award={{name="四级物防玄晶",num=1,typeid=10239,icon1=10036,icon2=10037},}},{key=7,awardpcon=const.PP_JC_ZQSJ4,slot=1,award={{name="五级物防玄晶",num=1,typeid=10240,icon1=10038,icon2=10039},}},{key=8,awardpcon=const.PP_JC_ZQSJ5,slot=1,award={{name="六级物防玄晶",num=1,typeid=10241,icon1=10154,icon2=10155},}},{key=9,awardpcon=const.PP_JC_ZQSJ6,slot=1,award={{name="七级物防玄晶",num=1,typeid=10242,icon1=10156,icon2=10157},}},},
	   	  	{{key=8,awardpcon=const.PP_JC_ZQSJ5,slot=1,award={{name="六级物防玄晶",num=1,typeid=10241,icon1=10154,icon2=10155},}},{key=9,awardpcon=const.PP_JC_ZQSJ6,slot=1,award={{name="七级物防玄晶",num=1,typeid=10242,icon1=10156,icon2=10157},}},{key=10,awardpcon=const.PP_JC_ZQSJ7,slot=1,award={{name="八级物防玄晶",num=1,typeid=10243,icon1=10158,icon2=10159},}},{key=11,awardpcon=const.PP_JC_ZQSJ8,slot=1,award={{name="九级物防玄晶",num=1,typeid=10244,icon1=10160,icon2=10161},}},},
	   	  	{{key=10,awardpcon=const.PP_JC_ZQSJ7,slot=1,award={{name="八级物防玄晶",num=1,typeid=10243,icon1=10158,icon2=10159},}},{key=11,awardpcon=const.PP_JC_ZQSJ8,slot=1,award={{name="九级物防玄晶",num=1,typeid=10244,icon1=10160,icon2=10161},}},{key=12,awardpcon=const.PP_JC_ZQSJ9,slot=1,award={{name="十级物防玄晶",num=1,typeid=10245,icon1=10162,icon2=10163},}},{key=13,awardpcon=const.PP_JC_ZQSJ10,slot=1,award={{name="十级魔防玄晶",num=1,typeid=10257,icon1=10164,icon2=10165},}},},
	   	  	{{key=12,awardpcon=const.PP_JC_ZQSJ9,slot=1,award={{name="十级物防玄晶",num=1,typeid=10245,icon1=10162,icon2=10163},}},{key=13,awardpcon=const.PP_JC_ZQSJ10,slot=1,award={{name="十级魔防玄晶",num=1,typeid=10257,icon1=10164,icon2=10165},}},{key=14,awardpcon=const.PP_JC_ZQSJ11,slot=1,award={{name="十级生命玄晶",num=1,typeid=10269,icon1=10166,icon2=10167},}},{key=15,awardpcon=const.PP_JC_ZQSJ12,slot=1,award={{name="十级攻击玄晶",num=1,typeid=10233,icon1=10168,icon2=10169},}},},
	   	  	}},
	[6]={name="cbsj",begin=1,continue=3,interval=7,isOpen=true,remark="翅膀升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_CBSJ_TIMES,
	contents={{{key=6,awardpcon=const.PP_JC_CBSJ1,slot=1,award={{name="三级魔防玄晶",num=1,typeid=10250,icon1=10043,icon2=10044},}},{key=7,awardpcon=const.PP_JC_CBSJ2,slot=1,award={{name="四级魔防玄晶",num=1,typeid=10251,icon1=10045,icon2=10046},}},{key=8,awardpcon=const.PP_JC_CBSJ3,slot=1,award={{name="五级魔防玄晶",num=1,typeid=10252,icon1=10047,icon2=10048},}},{key=9,awardpcon=const.PP_JC_CBSJ4,slot=1,award={{name="六级魔防玄晶",num=1,typeid=10253,icon1=10049,icon2=10050},}},},
	   	  	{{key=7,awardpcon=const.PP_JC_CBSJ2,slot=1,award={{name="四级魔防玄晶",num=1,typeid=10251,icon1=10045,icon2=10046},}},{key=8,awardpcon=const.PP_JC_CBSJ3,slot=1,award={{name="五级魔防玄晶",num=1,typeid=10252,icon1=10047,icon2=10048},}},{key=9,awardpcon=const.PP_JC_CBSJ4,slot=1,award={{name="六级魔防玄晶",num=1,typeid=10253,icon1=10049,icon2=10050},}},{key=10,awardpcon=const.PP_JC_CBSJ5,slot=1,award={{name="七级魔防玄晶",num=1,typeid=10254,icon1=10170,icon2=10171},}},},
	   	  	{{key=8,awardpcon=const.PP_JC_CBSJ3,slot=1,award={{name="五级魔防玄晶",num=1,typeid=10252,icon1=10047,icon2=10048},}},{key=9,awardpcon=const.PP_JC_CBSJ4,slot=1,award={{name="六级魔防玄晶",num=1,typeid=10253,icon1=10049,icon2=10050},}},{key=10,awardpcon=const.PP_JC_CBSJ5,slot=1,award={{name="七级魔防玄晶",num=1,typeid=10254,icon1=10170,icon2=10171},}},{key=11,awardpcon=const.PP_JC_CBSJ6,slot=1,award={{name="八级魔防玄晶",num=1,typeid=10255,icon1=10172,icon2=10173},}},},
	   	  	{{key=9,awardpcon=const.PP_JC_CBSJ4,slot=1,award={{name="六级魔防玄晶",num=1,typeid=10253,icon1=10049,icon2=10050},}},{key=10,awardpcon=const.PP_JC_CBSJ5,slot=1,award={{name="七级魔防玄晶",num=1,typeid=10254,icon1=10170,icon2=10171},}},{key=11,awardpcon=const.PP_JC_CBSJ6,slot=1,award={{name="八级魔防玄晶",num=1,typeid=10255,icon1=10172,icon2=10173},}},{key=12,awardpcon=const.PP_JC_CBSJ7,slot=1,award={{name="九级魔防玄晶",num=1,typeid=10256,icon1=10174,icon2=10175},}},},
	   	  	{{key=10,awardpcon=const.PP_JC_CBSJ5,slot=1,award={{name="七级魔防玄晶",num=1,typeid=10254,icon1=10170,icon2=10171},}},{key=11,awardpcon=const.PP_JC_CBSJ6,slot=1,award={{name="八级魔防玄晶",num=1,typeid=10255,icon1=10172,icon2=10173},}},{key=12,awardpcon=const.PP_JC_CBSJ7,slot=1,award={{name="九级魔防玄晶",num=1,typeid=10256,icon1=10174,icon2=10175},}},{key=13,awardpcon=const.PP_JC_CBSJ8,slot=1,award={{name="十级魔防玄晶",num=1,typeid=10257,icon1=10176,icon2=10177},}},},
	   	  	}},
	[7]={name="fbsj",begin=7,continue=4,interval=6,isOpen=true,remark="法宝升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_FBSJ_TIMES,
	contents={{{key=3,awardpcon=const.PP_JC_FBSJ1,slot=1,award={{name="三级攻击玄晶",num=1,typeid=10226,icon1=10054,icon2=10055},}},{key=4,awardpcon=const.PP_JC_FBSJ2,slot=1,award={{name="四级攻击玄晶",num=1,typeid=10227,icon1=10056,icon2=10057},}},{key=5,awardpcon=const.PP_JC_FBSJ3,slot=1,award={{name="五级攻击玄晶",num=1,typeid=10228,icon1=10058,icon2=10059},}},{key=6,awardpcon=const.PP_JC_FBSJ4,slot=1,award={{name="六级攻击玄晶",num=1,typeid=10229,icon1=10060,icon2=10061},}},},
	   	  	{{key=4,awardpcon=const.PP_JC_FBSJ2,slot=1,award={{name="四级攻击玄晶",num=1,typeid=10227,icon1=10056,icon2=10057},}},{key=5,awardpcon=const.PP_JC_FBSJ3,slot=1,award={{name="五级攻击玄晶",num=1,typeid=10228,icon1=10058,icon2=10059},}},{key=6,awardpcon=const.PP_JC_FBSJ4,slot=1,award={{name="六级攻击玄晶",num=1,typeid=10229,icon1=10060,icon2=10061},}},{key=7,awardpcon=const.PP_JC_FBSJ5,slot=1,award={{name="七级攻击玄晶",num=1,typeid=10230,icon1=10178,icon2=10179},}},},
	   	  	{{key=5,awardpcon=const.PP_JC_FBSJ3,slot=1,award={{name="五级攻击玄晶",num=1,typeid=10228,icon1=10058,icon2=10059},}},{key=6,awardpcon=const.PP_JC_FBSJ4,slot=1,award={{name="六级攻击玄晶",num=1,typeid=10229,icon1=10060,icon2=10061},}},{key=7,awardpcon=const.PP_JC_FBSJ5,slot=1,award={{name="七级攻击玄晶",num=1,typeid=10230,icon1=10178,icon2=10179},}},{key=8,awardpcon=const.PP_JC_FBSJ6,slot=1,award={{name="八级攻击玄晶",num=1,typeid=10231,icon1=10180,icon2=10181},}},},
	   	  	{{key=6,awardpcon=const.PP_JC_FBSJ4,slot=1,award={{name="六级攻击玄晶",num=1,typeid=10229,icon1=10060,icon2=10061},}},{key=7,awardpcon=const.PP_JC_FBSJ5,slot=1,award={{name="七级攻击玄晶",num=1,typeid=10230,icon1=10178,icon2=10179},}},{key=8,awardpcon=const.PP_JC_FBSJ6,slot=1,award={{name="八级攻击玄晶",num=1,typeid=10231,icon1=10180,icon2=10181},}},{key=9,awardpcon=const.PP_JC_FBSJ7,slot=1,award={{name="九级攻击玄晶",num=1,typeid=10232,icon1=10182,icon2=10183},}},},
	   	  	{{key=7,awardpcon=const.PP_JC_FBSJ5,slot=1,award={{name="七级攻击玄晶",num=1,typeid=10230,icon1=10178,icon2=10179},}},{key=8,awardpcon=const.PP_JC_FBSJ6,slot=1,award={{name="八级攻击玄晶",num=1,typeid=10231,icon1=10180,icon2=10181},}},{key=9,awardpcon=const.PP_JC_FBSJ7,slot=1,award={{name="九级攻击玄晶",num=1,typeid=10232,icon1=10182,icon2=10183},}},{key=10,awardpcon=const.PP_JC_FBSJ8,slot=1,award={{name="十级攻击玄晶",num=1,typeid=10233,icon1=10184,icon2=10185},}},},
	   	  	}},
	[8]={name="gzsj",begin=1,continue=5,interval=10,isOpen=true,remark="官职升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_GZSJ_TIMES,
	contents={{{key=9,awardpcon=const.PP_JC_GZSJ1,slot=1,award={{name="三级生命玄晶",num=1,typeid=10262,icon1=10065,icon2=10066},}},{key=10,awardpcon=const.PP_JC_GZSJ2,slot=1,award={{name="四级生命玄晶",num=1,typeid=10263,icon1=10067,icon2=10068},}},{key=11,awardpcon=const.PP_JC_GZSJ3,slot=1,award={{name="五级生命玄晶",num=1,typeid=10264,icon1=10069,icon2=10070},}},{key=12,awardpcon=const.PP_JC_GZSJ4,slot=1,award={{name="六级生命玄晶",num=1,typeid=10265,icon1=10071,icon2=10072},}},},
	   	  	{{key=10,awardpcon=const.PP_JC_GZSJ2,slot=1,award={{name="四级生命玄晶",num=1,typeid=10263,icon1=10067,icon2=10068},}},{key=11,awardpcon=const.PP_JC_GZSJ3,slot=1,award={{name="五级生命玄晶",num=1,typeid=10264,icon1=10069,icon2=10070},}},{key=12,awardpcon=const.PP_JC_GZSJ4,slot=1,award={{name="六级生命玄晶",num=1,typeid=10265,icon1=10071,icon2=10072},}},{key=13,awardpcon=const.PP_JC_GZSJ5,slot=1,award={{name="七级生命玄晶",num=1,typeid=10266,icon1=10186,icon2=10187},}},},
	   	  	{{key=11,awardpcon=const.PP_JC_GZSJ3,slot=1,award={{name="五级生命玄晶",num=1,typeid=10264,icon1=10069,icon2=10070},}},{key=12,awardpcon=const.PP_JC_GZSJ4,slot=1,award={{name="六级生命玄晶",num=1,typeid=10265,icon1=10071,icon2=10072},}},{key=13,awardpcon=const.PP_JC_GZSJ5,slot=1,award={{name="七级生命玄晶",num=1,typeid=10266,icon1=10186,icon2=10187},}},{key=14,awardpcon=const.PP_JC_GZSJ6,slot=1,award={{name="八级生命玄晶",num=1,typeid=10267,icon1=10188,icon2=10189},}},},
	   	  	{{key=12,awardpcon=const.PP_JC_GZSJ4,slot=1,award={{name="六级生命玄晶",num=1,typeid=10265,icon1=10071,icon2=10072},}},{key=13,awardpcon=const.PP_JC_GZSJ5,slot=1,award={{name="七级生命玄晶",num=1,typeid=10266,icon1=10186,icon2=10187},}},{key=14,awardpcon=const.PP_JC_GZSJ6,slot=1,award={{name="八级生命玄晶",num=1,typeid=10267,icon1=10188,icon2=10189},}},{key=15,awardpcon=const.PP_JC_GZSJ7,slot=1,award={{name="九级生命玄晶",num=1,typeid=10268,icon1=10190,icon2=10191},}},},
	   	  	{{key=13,awardpcon=const.PP_JC_GZSJ5,slot=1,award={{name="七级生命玄晶",num=1,typeid=10266,icon1=10186,icon2=10187},}},{key=14,awardpcon=const.PP_JC_GZSJ6,slot=1,award={{name="八级生命玄晶",num=1,typeid=10267,icon1=10188,icon2=10189},}},{key=15,awardpcon=const.PP_JC_GZSJ7,slot=1,award={{name="九级生命玄晶",num=1,typeid=10268,icon1=10190,icon2=10191},}},{key=16,awardpcon=const.PP_JC_GZSJ8,slot=1,award={{name="十级生命玄晶",num=1,typeid=10269,icon1=10192,icon2=10193},}},},
	   	  	}},
	[9]={name="tjsj",begin=11,continue=5,interval=10,isOpen=true,remark="特戒升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_TJSJ_TIMES,
	contents={{{key="狂战麻痹戒指",awardpcon=const.PP_JC_TJSJ1,slot=1,award={{name="六级宝石",num=1,typeid=10140,icon1=10076,icon2=10077},}},{key="聚魔护身戒指",awardpcon=const.PP_JC_TJSJ2,slot=1,award={{name="六级宝石",num=1,typeid=10140,icon1=10198,icon2=10199},}},
				{key="战魂麻痹戒指",awardpcon=const.PP_JC_TJSJ3,slot=1,award={{name="七级宝石",num=1,typeid=10141,icon1=10078,icon2=10079},}},{key="魔魂护身戒指",awardpcon=const.PP_JC_TJSJ4,slot=1,award={{name="七级宝石",num=1,typeid=10141,icon1=10200,icon2=10201},}},
				{key="战神麻痹戒指",awardpcon=const.PP_JC_TJSJ5,slot=1,award={{name="八级宝石",num=1,typeid=10142,icon1=10080,icon2=10081},}},{key="魔神护身戒指",awardpcon=const.PP_JC_TJSJ6,slot=1,award={{name="八级宝石",num=1,typeid=10142,icon1=10202,icon2=10203},}},
				{key="王者麻痹戒指",awardpcon=const.PP_JC_TJSJ7,slot=1,award={{name="九级宝石",num=1,typeid=10143,icon1=10082,icon2=10083},}},{key="王者护身戒指",awardpcon=const.PP_JC_TJSJ8,slot=1,award={{name="九级宝石",num=1,typeid=10143,icon1=10204,icon2=10205},}},},
	   	  	{{key="战魂麻痹戒指",awardpcon=const.PP_JC_TJSJ3,slot=1,award={{name="七级宝石",num=1,typeid=10141,icon1=10078,icon2=10079},}},{key="魔魂护身戒指",awardpcon=const.PP_JC_TJSJ4,slot=1,award={{name="七级宝石",num=1,typeid=10141,icon1=10200,icon2=10201},}},
				{key="战神麻痹戒指",awardpcon=const.PP_JC_TJSJ5,slot=1,award={{name="八级宝石",num=1,typeid=10142,icon1=10080,icon2=10081},}},{key="魔神护身戒指",awardpcon=const.PP_JC_TJSJ6,slot=1,award={{name="八级宝石",num=1,typeid=10142,icon1=10202,icon2=10203},}},
				{key="王者麻痹戒指",awardpcon=const.PP_JC_TJSJ7,slot=1,award={{name="九级宝石",num=1,typeid=10143,icon1=10082,icon2=10083},}},{key="王者护身戒指",awardpcon=const.PP_JC_TJSJ8,slot=1,award={{name="九级宝石",num=1,typeid=10143,icon1=10204,icon2=10205},}},
				{key="神威麻痹戒指",awardpcon=const.PP_JC_TJSJ9,slot=1,award={{name="十级宝石",num=1,typeid=10144,icon1=10194,icon2=10195},}},{key="神威护身戒指",awardpcon=const.PP_JC_TJSJ10,slot=1,award={{name="十级宝石",num=1,typeid=10144,icon1=10206,icon2=10207},}},},
			{{key="战神麻痹戒指",awardpcon=const.PP_JC_TJSJ5,slot=1,award={{name="八级宝石",num=1,typeid=10142,icon1=10080,icon2=10081},}},{key="魔神护身戒指",awardpcon=const.PP_JC_TJSJ6,slot=1,award={{name="八级宝石",num=1,typeid=10142,icon1=10202,icon2=10203},}},
				{key="王者麻痹戒指",awardpcon=const.PP_JC_TJSJ7,slot=1,award={{name="九级宝石",num=1,typeid=10143,icon1=10082,icon2=10083},}},{key="王者护身戒指",awardpcon=const.PP_JC_TJSJ8,slot=1,award={{name="九级宝石",num=1,typeid=10143,icon1=10204,icon2=10205},}},
				{key="神威麻痹戒指",awardpcon=const.PP_JC_TJSJ9,slot=1,award={{name="十级宝石",num=1,typeid=10144,icon1=10194,icon2=10195},}},{key="神威护身戒指",awardpcon=const.PP_JC_TJSJ10,slot=1,award={{name="十级宝石",num=1,typeid=10144,icon1=10206,icon2=10207},}},
				{key="至尊麻痹戒指",awardpcon=const.PP_JC_TJSJ11,slot=1,award={{name="十一级宝石",num=1,typeid=10145,icon1=10196,icon2=10197},}},{key="至尊护身戒指",awardpcon=const.PP_JC_TJSJ12,slot=1,award={{name="十一级宝石",num=1,typeid=10145,icon1=10208,icon2=10209},}},},
	   	  	}},
	[10]={name="zqzk",begin=8,continue=3,interval=27,isOpen=true,remark="坐骑折扣",iseveryday=false,awardtype=3,pcon=0,times=0,contents={}},																												
	[11]={name="fbzk",begin=18,continue=3,interval=27,isOpen=true,remark="法宝折扣",iseveryday=false,awardtype=3,pcon=0,times=0,contents={}},
	[12]={name="xfzk",begin=28,continue=3,interval=27,isOpen=true,remark="心法折扣",iseveryday=false,awardtype=3,pcon=0,times=0,contents={}},
	[13]={name="chsj",begin=4,continue=5,interval=25,isOpen=true,remark="称号升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_CHSJ_TIMES,
	contents={{{key="乱世英雄",awardpcon=const.PP_JC_CHSJ1,slot=0,award={{name="绑定元宝",num=500,typeid=19009,icon1=10092,icon2=10093},}},{key="只手遮天",awardpcon=const.PP_JC_CHSJ2,slot=0,award={{name="绑定元宝",num=1000,typeid=19009,icon1=10094,icon2=10095},}},{key="威震八方",awardpcon=const.PP_JC_CHSJ3,slot=0,award={{name="绑定元宝",num=2000,typeid=19009,icon1=10096,icon2=10097},}},{key="百胜天师",awardpcon=const.PP_JC_CHSJ4,slot=0,award={{name="绑定元宝",num=4000,typeid=19009,icon1=10098,icon2=10099},}},},
	   	  	{{key="只手遮天",awardpcon=const.PP_JC_CHSJ2,slot=0,award={{name="绑定元宝",num=1000,typeid=19009,icon1=10094,icon2=10095},}},{key="威震八方",awardpcon=const.PP_JC_CHSJ3,slot=0,award={{name="绑定元宝",num=2000,typeid=19009,icon1=10096,icon2=10097},}},{key="百胜天师",awardpcon=const.PP_JC_CHSJ4,slot=0,award={{name="绑定元宝",num=4000,typeid=19009,icon1=10098,icon2=10099},}},{key="横扫千军",awardpcon=const.PP_JC_CHSJ5,slot=0,award={{name="绑定元宝",num=6000,typeid=19009,icon1=10210,icon2=10211},}},},
	   	  	{{key="威震八方",awardpcon=const.PP_JC_CHSJ3,slot=0,award={{name="绑定元宝",num=2000,typeid=19009,icon1=10096,icon2=10097},}},{key="百胜天师",awardpcon=const.PP_JC_CHSJ4,slot=0,award={{name="绑定元宝",num=4000,typeid=19009,icon1=10098,icon2=10099},}},{key="横扫千军",awardpcon=const.PP_JC_CHSJ5,slot=0,award={{name="绑定元宝",num=6000,typeid=19009,icon1=10210,icon2=10211},}},{key="万夫莫敌",awardpcon=const.PP_JC_CHSJ6,slot=0,award={{name="绑定元宝",num=10000,typeid=19009,icon1=10212,icon2=10213},}},},
	   	  	{{key="百胜天师",awardpcon=const.PP_JC_CHSJ4,slot=0,award={{name="绑定元宝",num=4000,typeid=19009,icon1=10098,icon2=10099},}},{key="横扫千军",awardpcon=const.PP_JC_CHSJ5,slot=0,award={{name="绑定元宝",num=6000,typeid=19009,icon1=10210,icon2=10211},}},{key="万夫莫敌",awardpcon=const.PP_JC_CHSJ6,slot=0,award={{name="绑定元宝",num=10000,typeid=19009,icon1=10212,icon2=10213},}},{key="盖世奇侠",awardpcon=const.PP_JC_CHSJ7,slot=0,award={{name="绑定元宝",num=16000,typeid=19009,icon1=10214,icon2=10215},}},},
	   	  	{{key="万夫莫敌",awardpcon=const.PP_JC_CHSJ5,slot=0,award={{name="绑定元宝",num=10000,typeid=19009,icon1=10212,icon2=10213},}},{key="盖世奇侠",awardpcon=const.PP_JC_CHSJ6,slot=0,award={{name="绑定元宝",num=16000,typeid=19009,icon1=10214,icon2=10215},}},{key="杀戮之神",awardpcon=const.PP_JC_CHSJ7,slot=0,award={{name="绑定元宝",num=22000,typeid=19009,icon1=10002,icon2=10003},}},{key="神魔霸主",awardpcon=const.PP_JC_CHSJ8,slot=0,award={{name="绑定元宝",num=30000,typeid=19009,icon1=10216,icon2=10217},}},},
	   	  	}},
	[14]={name="gysj",begin=6,continue=7,interval=23,isOpen=true,remark="官印升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_GYSJ_TIMES,
	contents={{{key="五品平寇官印",awardpcon=const.PP_JC_GYSJ1,slot=0,award={{name="经验",num=20000000,typeid=19001,icon1=10103,icon2=10104},}},{key="四品破虏官印",awardpcon=const.PP_JC_GYSJ2,slot=0,award={{name="经验",num=50000000,typeid=19001,icon1=10105,icon2=10106},}},{key="三品平虏官印",awardpcon=const.PP_JC_GYSJ3,slot=0,award={{name="经验",num=100000000,typeid=19001,icon1=10107,icon2=10108},}},{key="二品车骑官印",awardpcon=const.PP_JC_GYSJ4,slot=0,award={{name="经验",num=200000000,typeid=19001,icon1=10109,icon2=10110},}},},
	   	  	{{key="四品破虏官印",awardpcon=const.PP_JC_GYSJ2,slot=0,award={{name="经验",num=50000000,typeid=19001,icon1=10105,icon2=10106},}},{key="三品平虏官印",awardpcon=const.PP_JC_GYSJ3,slot=0,award={{name="经验",num=100000000,typeid=19001,icon1=10107,icon2=10108},}},{key="二品车骑官印",awardpcon=const.PP_JC_GYSJ4,slot=0,award={{name="经验",num=200000000,typeid=19001,icon1=10109,icon2=10110},}},{key="一品骠骑官印",awardpcon=const.PP_JC_GYSJ5,slot=0,award={{name="经验",num=400000000,typeid=19001,icon1=10218,icon2=10219},}},},
	   	  	{{key="三品平虏官印",awardpcon=const.PP_JC_GYSJ3,slot=0,award={{name="经验",num=100000000,typeid=19001,icon1=10107,icon2=10108},}},{key="二品车骑官印",awardpcon=const.PP_JC_GYSJ4,slot=0,award={{name="经验",num=200000000,typeid=19001,icon1=10109,icon2=10110},}},{key="一品骠骑官印",awardpcon=const.PP_JC_GYSJ5,slot=0,award={{name="经验",num=400000000,typeid=19001,icon1=10218,icon2=10219},}},{key="三等抚国官印",awardpcon=const.PP_JC_GYSJ6,slot=0,award={{name="经验",num=600000000,typeid=19001,icon1=10220,icon2=10221},}},},
	   	  	{{key="二品车骑官印",awardpcon=const.PP_JC_GYSJ4,slot=0,award={{name="经验",num=200000000,typeid=19001,icon1=10109,icon2=10110},}},{key="一品骠骑官印",awardpcon=const.PP_JC_GYSJ5,slot=0,award={{name="经验",num=400000000,typeid=19001,icon1=10218,icon2=10219},}},{key="三等抚国官印",awardpcon=const.PP_JC_GYSJ6,slot=0,award={{name="经验",num=600000000,typeid=19001,icon1=10220,icon2=10221},}},{key="二等镇国官印",awardpcon=const.PP_JC_GYSJ7,slot=0,award={{name="经验",num=800000000,typeid=19001,icon1=10222,icon2=10223},}},},
	   	  	{{key="一品骠骑官印",awardpcon=const.PP_JC_GYSJ5,slot=0,award={{name="经验",num=400000000,typeid=19001,icon1=10218,icon2=10219},}},{key="三等抚国官印",awardpcon=const.PP_JC_GYSJ6,slot=0,award={{name="经验",num=600000000,typeid=19001,icon1=10220,icon2=10221},}},{key="二等镇国官印",awardpcon=const.PP_JC_GYSJ7,slot=0,award={{name="经验",num=800000000,typeid=19001,icon1=10222,icon2=10223},}},{key="一等元帅官印",awardpcon=const.PP_JC_GYSJ8,slot=0,award={{name="经验",num=1000000000,typeid=19001,icon1=10224,icon2=10225},}},},
	   	  	}},
	[15]={name="lpsj",begin=7,continue=7,interval=23,isOpen=true,remark="令牌升级",iseveryday=false,awardtype=2,pcon=0,times=const.PP_JC_LPSJ_TIMES,
	contents={{{key="圣者令(5级)",awardpcon=const.PP_JC_LPSJ1,slot=0,award={{name="绑定金币",num=5000000,typeid=19007,icon1=10114,icon2=10115},}},{key="紫阳令(6级)",awardpcon=const.PP_JC_LPSJ2,slot=0,award={{name="绑定金币",num=7500000,typeid=19007,icon1=10116,icon2=10117},}},{key="混元令(7级)",awardpcon=const.PP_JC_LPSJ3,slot=0,award={{name="绑定金币",num=10000000,typeid=19007,icon1=10118,icon2=10119},}},{key="伏龙令(8级)",awardpcon=const.PP_JC_LPSJ4,slot=0,award={{name="绑定金币",num=20000000,typeid=19007,icon1=10120,icon2=10121},}},},
	   	  	{{key="紫阳令(6级)",awardpcon=const.PP_JC_LPSJ2,slot=0,award={{name="绑定金币",num=7500000,typeid=19007,icon1=10116,icon2=10117},}},{key="混元令(7级)",awardpcon=const.PP_JC_LPSJ3,slot=0,award={{name="绑定金币",num=10000000,typeid=19007,icon1=10118,icon2=10119},}},{key="伏龙令(8级)",awardpcon=const.PP_JC_LPSJ4,slot=0,award={{name="绑定金币",num=20000000,typeid=19007,icon1=10120,icon2=10121},}},{key="通天令(9级)",awardpcon=const.PP_JC_LPSJ5,slot=0,award={{name="绑定金币",num=40000000,typeid=19007,icon1=10226,icon2=10227},}},},
	   	  	{{key="混元令(7级)",awardpcon=const.PP_JC_LPSJ3,slot=0,award={{name="绑定金币",num=10000000,typeid=19007,icon1=10118,icon2=10119},}},{key="伏龙令(8级)",awardpcon=const.PP_JC_LPSJ4,slot=0,award={{name="绑定金币",num=20000000,typeid=19007,icon1=10120,icon2=10121},}},{key="通天令(9级)",awardpcon=const.PP_JC_LPSJ5,slot=0,award={{name="绑定金币",num=40000000,typeid=19007,icon1=10226,icon2=10227},}},{key="刑天令(10级)",awardpcon=const.PP_JC_LPSJ6,slot=0,award={{name="绑定金币",num=60000000,typeid=19007,icon1=10228,icon2=10229},}},},
	   	  	{{key="伏龙令(8级)",awardpcon=const.PP_JC_LPSJ4,slot=0,award={{name="绑定金币",num=20000000,typeid=19007,icon1=10120,icon2=10121},}},{key="通天令(9级)",awardpcon=const.PP_JC_LPSJ5,slot=0,award={{name="绑定金币",num=40000000,typeid=19007,icon1=10226,icon2=10227},}},{key="刑天令(10级)",awardpcon=const.PP_JC_LPSJ6,slot=0,award={{name="绑定金币",num=60000000,typeid=19007,icon1=10228,icon2=10229},}},{key="虎魄天晶令(11级)",awardpcon=const.PP_JC_LPSJ7,slot=0,award={{name="绑定金币",num=80000000,typeid=19007,icon1=10230,icon2=10231},}},},
	   	  	{{key="通天令(9级)",awardpcon=const.PP_JC_LPSJ5,slot=0,award={{name="绑定金币",num=40000000,typeid=19007,icon1=10226,icon2=10227},}},{key="刑天令(10级)",awardpcon=const.PP_JC_LPSJ6,slot=0,award={{name="绑定金币",num=60000000,typeid=19007,icon1=10228,icon2=10229},}},{key="虎魄天晶令(11级)",awardpcon=const.PP_JC_LPSJ7,slot=0,award={{name="绑定金币",num=80000000,typeid=19007,icon1=10230,icon2=10231},}},{key="凛日星幻令(12级)",awardpcon=const.PP_JC_LPSJ8,slot=0,award={{name="绑定金币",num=100000000,typeid=19007,icon1=10232,icon2=10233},}},},
	   	  	}},
	[16]={name="czjssw",begin=10,continue=5,interval=35,isOpen=true,remark="充值即送神腕",iseveryday=false,awardtype=1,pcon=const.PP_JC_CZJSSW,times=const.PP_JC_CZJSSW_TIMES,
	contents={{{key=2000000,awardpcon=const.PP_JC_CZJSSW1,slot=1,award={{name="镇北玄武王腕卷",num=1},}},
			}}},
	[17]={name="czjssj",begin=20,continue=5,interval=35,isOpen=true,remark="充值即送神戒",iseveryday=false,awardtype=1,pcon=const.PP_JC_CZJSSJ,times=const.PP_JC_CZJSSJ_TIMES,
	contents={{{key=2000000,awardpcon=const.PP_JC_CZJSSJ1,slot=1,award={{name="镇西白虎王戒卷",num=1},}},
			}}},
	[18]={name="czjssl",begin=30,continue=5,interval=35,isOpen=true,remark="充值即送神链",iseveryday=false,awardtype=1,pcon=const.PP_JC_CZJSSL,times=const.PP_JC_CZJSSL_TIMES,
	contents={{{key=2000000,awardpcon=const.PP_JC_CZJSSL1,slot=1,award={{name="镇南朱雀王链卷",num=1},}},
			}}},
	[19]={name="czjssk",begin=40,continue=5,interval=35,isOpen=true,remark="充值即送神盔",iseveryday=false,awardtype=1,pcon=const.PP_JC_CZJSSK,times=const.PP_JC_CZJSSK_TIMES,
	contents={{{key=2000000,awardpcon=const.PP_JC_CZJSSK1,slot=1,award={{name="镇东青龙王盔卷",num=1},}},
			}}},
	[20]={name="sccx",begin=13,continue=4,interval=5,isOpen=true,remark="商城促销",iseveryday=false,awardtype=3,pcon=0,times=0,contents={}},
	[21]={name="sjqg",begin=8,continue=4,interval=5,isOpen=true,remark="升级抢购",iseveryday=false,awardtype=3,pcon=0,times=0,contents={}},
	[22]={name="bshcsd",begin=10,continue=3,interval=12,isOpen=true,remark="宝石合成盛典",iseveryday=false,awardtype=0,pcon=0,times=0,contents={}},
	[23]={name="xjhcsd",begin=13,continue=3,interval=12,isOpen=true,remark="玄晶合成盛典",iseveryday=false,awardtype=0,pcon=0,times=0,contents={}},
	[24]={name="qfzssd",begin=21,continue=5,interval=25,isOpen=true,remark="全服转生盛典",iseveryday=false,awardtype=0,pcon=0,times=0,contents={}},
	[25]={name="bossjspm",begin=16,continue=5,interval=15,isOpen=true,remark="BOSS击杀排名",iseveryday=false,awardtype=0,pcon=0,times=0,
	contents={{{key=160,awardpcon=0,slot=3,award={{name="七级宝石",num=1},{name="六级宝石",num=1},{name="五级宝石",num=1},}},
		   	  {key=180,awardpcon=0,slot=3,award={{name="八级宝石",num=1},{name="七级宝石",num=1},{name="五级宝石",num=1},}},
		   	  {key=200,awardpcon=0,slot=3,award={{name="九级宝石",num=1},{name="八级宝石",num=1},{name="七级宝石",num=1},}},
		   	 }}},
	[26]={name="zbqhfs",begin=7,continue=2,interval=8,isOpen=true,remark="装备强化放送",iseveryday=false,awardtype=1,pcon=0,times=const.PP_JC_ZBQHFS_TIMES,
	contents={{{key=7,awardpcon=const.PP_JC_ZBQHFS1,slot=1,award={{name="五级宝石",num=1},}},
		   	  {key=8,awardpcon=const.PP_JC_ZBQHFS2,slot=1,award={{name="六级宝石",num=1},}},
		   	  {key=9,awardpcon=const.PP_JC_ZBQHFS3,slot=1,award={{name="七级宝石",num=1},}},
		   	  {key=10,awardpcon=const.PP_JC_ZBQHFS4,slot=1,award={{name="八级宝石",num=1},}},
		   	  {key=11,awardpcon=const.PP_JC_ZBQHFS5,slot=1,award={{name="九级宝石",num=1},}},
		   	  {key=12,awardpcon=const.PP_JC_ZBQHFS6,slot=1,award={{name="十级宝石",num=1},}},
			}}},
	[27]={name="mrxbjl",begin=4,continue=3,interval=7,isOpen=true,remark="每日寻宝奖励",iseveryday=true,awardtype=1,pcon=const.PP_JC_MRXBJL,times=const.PP_JC_MRXBJL_TIME,
	contents={{{key=30,awardpcon=const.PP_JC_MRXBJL1,slot=1,award={{name="幸运神符(20%)",num=1},}},
		   	  {key=50,awardpcon=const.PP_JC_MRXBJL2,slot=1,award={{name="幸运神符(30%)",num=1},}},
		   	  {key=100,awardpcon=const.PP_JC_MRXBJL3,slot=1,award={{name="幸运神符(40%)",num=1},}},
		   	  }}},
	[28]={name="mrqlhl",begin=9,continue=2,interval=8,isOpen=true,remark="每日祈灵好礼",iseveryday=true,awardtype=1,pcon=const.PP_JC_MRQLHL,times=const.PP_JC_MRQLHL_TIME,
	contents={{{key=5,awardpcon=const.PP_JC_MRQLHL1,slot=1,award={{name="幸运神符(20%)",num=1},}},
		   	  {key=10,awardpcon=const.PP_JC_MRQLHL2,slot=1,award={{name="幸运神符(30%)",num=1},}},
		   	  {key=20,awardpcon=const.PP_JC_MRQLHL3,slot=1,award={{name="幸运神符(40%)",num=1},}},
		   	  }}},
}

function process_newfuActivity(player,actionset,panelid,actionid,data)
	if actionid == "btnLongactivity" then
		jingcaihuodong(player);return;
	end
	if actionid == "btnopencbjj" then
		if player:get_vip() > 0 then
			posnpc.fly(player,"灵羽使者");
		else	
			player:find_road_goto("v003","114","94","灵羽使者");
		end
		--player:npc_talk("灵羽使者","100");
		return;
	end
	if actionid == "btnopentjsj" then
		if player:get_vip() > 0 then
			posnpc.fly(player,"神器使者");
		else	
			player:find_road_goto("v003","128","102","神器使者");
		end
		return;
	end
	if actionid == "btnopenxfjj" then
		player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","2");
		player:push_ckpanel_data("showproperty","panelshowproperty");
		return;
	end
	if actionid == "btnopenlpjj" then
		player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","4");
		player:push_ckpanel_data("showproperty","panelshowproperty");
		return;
	end
	if actionid == "btnopenbshcsd1" then
		player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
		player:set_panel_data("panelfuse","guifusetabcontrol","selected","2");
		player:push_ckpanel_data("fuse","panelfuse");
		return;
	end
	if actionid =="btnopenxjhcsd1" then
		player:set_panel_data("panelbasalt","panelbasalt","panel_visible","true");
		player:set_panel_data("panelbasalt","basaltTabcontrol","selected","2");
		player:push_ckpanel_data("basalt","panelbasalt");
		return;
	end
	if actionid == "btnopenqfzssd1" then
		player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","3");--btnqfzssd
		player:set_panel_data("panelshowproperty","txtbs","text","* 2");
		player:push_ckpanel_data("showproperty","panelshowproperty");
		return;
	end
	if string.sub(actionid,1,9) == "btnqfsbge" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,6),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnmrcz" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnmrljcz" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnmrljxf" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnzqsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btncbsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnfbsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btngzsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btntjsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnzqzk" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnfbzk" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnxfzk" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnchsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btngysj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnlpsj" then
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receive(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnczjssw" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnczjssj" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnczjssl" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnczjssk" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnsccx" then
		if #actionid == 7 then
			receivesccxtab(player);
			return;
		end
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receivesccx(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,7) == "btnsjqg" then
		if #actionid == 7 then
			receivesjqgtab(player);
			return;
		end
		local index = tonumber(string.sub(actionid,8));
		if index > 0 then
			receivesjqg(player,string.sub(actionid,4,7),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnbshcsd" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnxjhcsd" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnqfzssd" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,11) == "btnbossjspm" then
		local index = tonumber(string.sub(actionid,12));
		if index > 0 then
			receiveBossjspmAward(player,string.sub(actionid,4,11),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnzbqhfs" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnmrxbjl" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
		receive(player,string.sub(actionid,4,9),index);return;
		end
	end
	if string.sub(actionid,1,9) == "btnmrqlhl" then
		local index = tonumber(string.sub(actionid,10));
		if index > 0 then
			receive(player,string.sub(actionid,4,9),index);return;
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_newfuActivity);

function isOpenActivity(player,name)
	if not isOpen then
		return false;
	end
	if name ~= nil and name ~= "" then
		for k,v in pairs(jchd) do
			if v.name == name then
				if v.isOpen and today() >= server_open_day() + v.begin - 1 then
					--print(today().."|"..server_open_day().."|"..v.begin);
					local num = (today()-server_open_day()-v.begin+1)%(v.continue+v.interval);
					--print(num);
					if num < v.continue and num >= 0 then
						if v.awardtype == 1 or v.awardtype == 2 then
							if v.iseveryday then
								if player and v.times > 0 and util.ppn(player,v.times) ~= today() then
									if v.pcon > 0 then
										player:set_param(v.pcon,0);
									end
								end
							else
								local times = math.floor((today()-server_open_day()-v.begin+1)/(v.continue+v.interval));
								if player and v.awardtype == 1 and v.times > 0 and util.ppn(player,v.times) ~= times then
									player:set_param(v.times,times);
									if v.pcon > 0 then
										player:set_param(v.pcon,0);
									end
									if v.contents[1] then
										for k1,v1 in pairs(v.contents[1]) do
											if v1 and v1.awardpcon > 0 then
												player:set_param(v1.awardpcon,0);
											end
										end
									end
								end

								if v.awardtype == 2 and util.svn(v.name.."times") ~= times then
									server.set_var(v.name.."times",times);
									--local stage = util.svn(v.name);
									if times >= #v.contents then
										server.set_var(v.name,#v.contents-1);
									else
										server.set_var(v.name,times);
									end
								end
							end
						end

						return true;
					else
						return false;
					end
				else
					return false;
				end
			end
		end
	end
	return false;
end

function getActivityTimes(player,name)
	local data = gethuodong(player,name);
	if data then
		if data.isOpen then
			local times = math.floor((today()-server_open_day()-data.begin+1)/(data.continue+data.interval));
			return times;
		end
	end
	return 0;
end

function setawardpcon(player,name,param)
	local data = gethuodong(player,name);
	if data then
		if data.isOpen then
			if data.awardtype == 2 then--type==2 按阶段的
				for i,j in pairs(data.contents) do
					for k,v in pairs(j) do
						if v.key == param then
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
							return;
						end
					end
				end
			else
				local content = data.contents[1];
				if content then
					for k,v in pairs(content) do
						if v.key == param then
							if data.name == "zbqhfs" then
								player:set_param(v.awardpcon,util.ppn(player,v.awardpcon) + 1);
							else
								if util.ppn(player,v.awardpcon) == 0 then
									player:set_param(v.awardpcon,1);
								end
							end
							return;
						end
					end
				end
			end
		end
	end
end

function setpcon(player,name,param)
	local data = gethuodong(player,name);
	if data then
		if data.isOpen then
			player:set_param(data.pcon,util.ppn(player,data.pcon) + param);
		end
	end
end

function gethuodong(player,name)
	if name ~= nil and name ~= "" then
		for k,v in pairs(jchd) do
			if v.name == name then
				return v;
			end
		end
	end
	return nil;
end

function jingcaihuodong(player)
	fresh_awardpcon(player);
	for i,v in ipairs(jchd) do
		if v and isOpenActivity(player,v.name) then
			--print("btn"..v.name.." true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..v.name,"btnvisible","true");
			if v.awardtype == 1 or v.awardtype == 2 then
				fresh_panel(player,v);
			end
			if v.name == "mrcz" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",util.ppn(player,v.pcon));
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name.."time","text","每天");
			else
				local num = (today()-server_open_day()-v.begin+1)%(v.continue+v.interval);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name.."time","text",os.date("%Y年%m月%d日",(today()-num)*60*60*24).." - "..os.date("%Y年%m月%d日",(today()-num+v.continue-1)*60*60*24));
			end
			if v.name == "mrljcz" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",util.ppn(player,v.pcon));
			end
			if v.name == "mrljxf" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",util.ppn(player,v.pcon));
			end
			if v.name == "czjssw" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",tostring(util.ppn(player,v.pcon)).."元宝");
			end
			if v.name == "czjssj" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",tostring(util.ppn(player,v.pcon)).."元宝");
			end
			if v.name == "czjssl" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",tostring(util.ppn(player,v.pcon)).."元宝");
			end
			if v.name == "czjssk" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",tostring(util.ppn(player,v.pcon)).."元宝");
			end
			if v.name == "bossjspm" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm","grayFilter","false");
				fresh_bossjspm_panel(player);
			end
			if v.name == "mrxbjl" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",util.ppn(player,v.pcon));
			end
			if v.name == "mrqlhl" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..v.name,"text",util.ppn(player,v.pcon));
			end
		else
			if v.name == "bossjspm" then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm","grayFilter","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm","btnvisible","true");
				fresh_bossjspm_panel(player);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbossjspmtime","text","不在活动时间内");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..v.name,"btnvisible","false");
				--print("btn"..v.name.." false");
			end
		end
		if i%15 == 0 then
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function fresh_panel(player,data)
	local content;
	if data.awardtype == 2 then
		content = data.contents[util.svn(data.name)+1];
	else
		content = data.contents[1];
	end
	if content then
		for i=1,#content do
			local value;
			if data.name == "tjsj" then
				if player:get_job_name()=="warrior" then
					value = content[i*2-1];
				else
					value = content[i*2];
				end
			else
				value = content[i];
			end
			if value then
				if data.awardtype == 2 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,data.name.."icontitle"..i,"bgid",value.award[1].icon1);
					player:set_panel_data(PANEL_ACTIONSET_NAME,data.name.."iconname"..i,"bgid",value.award[1].icon2);
					player:set_panel_data(PANEL_ACTIONSET_NAME,data.name.."item"..i,"typeid",value.award[1].typeid);
					if value.award[1].num < 10000 then
						player:set_panel_data(PANEL_ACTIONSET_NAME,data.name.."item"..i,"num",value.award[1].num);
					else
						local w = math.floor(value.award[1].num/10000);
						if w < 10000 then
							player:set_panel_data(PANEL_ACTIONSET_NAME,data.name.."item"..i,"num",w.."W");
						else
							local y = math.floor(w/10000);
							player:set_panel_data(PANEL_ACTIONSET_NAME,data.name.."item"..i,"num",y.."E");
						end
					end
				end

				local awardpcon = util.ppn(player,value.awardpcon);
				if data.iseveryday then
					if awardpcon ~= today() then
						local pcon = util.ppn(player,data.pcon);
						if util.ppn(player,data.times) == today() and pcon >= value.key then
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10234);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","true");
						else
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10007);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","false");
						end
					else
						player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10236);
						player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","false");
					end
				else
					if data.pcon > 0 then
						if awardpcon == 0 then
							local pcon = util.ppn(player,data.pcon);
							if pcon >= value.key then
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10234);
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","true");
							else
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10007);
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","false");
							end
						else
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10236);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","false");
						end
					else
						if awardpcon > 0 then
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10234);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","true");
						else
							if awardpcon == 0 then
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10007);
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","false");
							else
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"picid",10236);
								player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..i,"mouseEnabled","false");
							end
						end
					end
				end
			end
		end
	end
end

local consttab={
	[1]={sbl="bfbosssa",sbn="bfbosssb",haved="bfbosssc",pcon=const.PP_JC_BOSSJSPM_RECEIVE1,
			award={
				{name="七级宝石",num=1},
				{name="六级宝石",num=1},
				{name="五级宝石",num=1},
			},
		},
	[2]={sbl="bfbossma",sbn="bfbossmb",haved="bfbossmc",pcon=const.PP_JC_BOSSJSPM_RECEIVE2,
			award={
				{name="八级宝石",num=1},
				{name="七级宝石",num=1},
				{name="六级宝石",num=1},
			},
		},
	[3]={sbl="bfbossba",sbn="bfbossbb",haved="bfbossbc",pcon=const.PP_JC_BOSSJSPM_RECEIVE3,
			award={
				{name="九级宝石",num=1},
				{name="八级宝石",num=1},
				{name="七级宝石",num=1},
			},
		},
	};

function fresh_bossjspm_panel(player)
	local activityTimes = newgui.jingcaihuodong.getActivityTimes(player,"bossjspm");
	if util.svn("bossjspmtimes") ~= activityTimes then
		server.set_var("bossjspmtimes",activityTimes);
		for i=1,3 do
			server.set_var("bfbosssa"..i,"");
			server.set_var("bfbosssb"..i,0);
			server.set_var("bfbosssc"..i,"");
			server.set_var("bfbossma"..i,"");
			server.set_var("bfbossmb"..i,0);
			server.set_var("bfbossmc"..i,"");
			server.set_var("bfbossba"..i,"");
			server.set_var("bfbossbb"..i,0);
			server.set_var("bfbossbc"..i,"");
		end
	end
	if activityTimes ~= util.ppn(player,const.PP_JC_BOSSJSPM_TIME) then
		player:set_param(const.PP_JC_BOSSJSPM_TIME,activityTimes);
		player:set_param(const.PP_JC_BOSSJSPM_RECEIVE1,0);
		player:set_param(const.PP_JC_BOSSJSPM_RECEIVE2,0);
		player:set_param(const.PP_JC_BOSSJSPM_RECEIVE3,0);
		player:set_param(const.PP_BAIFUJISHABOSS1,0);
		player:set_param(const.PP_BAIFUJISHABOSS2,0);
		player:set_param(const.PP_BAIFUJISHABOSS3,0);
	end
	for i=1,#consttab do
		local data = consttab[i];
		if data then
			local getgift=false;
			for k=1,#data.award do
				player:set_panel_data(PANEL_ACTIONSET_NAME,"lblbossjspmname"..i..k,"text",server.get_var(data.sbl..k));
				player:set_panel_data(PANEL_ACTIONSET_NAME,"lblbossjspmnum"..i..k,"text",server.get_var(data.sbn..k));
				if server.get_var(data.haved..k) ~= "haved" then
					if server.get_var(data.sbl..k) and server.get_var(data.sbl..k)==player:get_name() then
						getgift=true;
					end
				end
			end
			if util.ppn(player,data.pcon)<=0 then
				if getgift and not isOpenActivity(player,"bossjspm") then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..i,"picid",10234);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..i,"mouseEnabled","true");
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..i,"picid",10007);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..i,"mouseEnabled","false");
				end
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..i,"picid",10236);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..i,"mouseEnabled","false");
			end
		end
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"lblbossjspmnum14","text",util.ppn(player,const.PP_BAIFUJISHABOSS1));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"lblbossjspmnum24","text",util.ppn(player,const.PP_BAIFUJISHABOSS2));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"lblbossjspmnum34","text",util.ppn(player,const.PP_BAIFUJISHABOSS3));
end

function receive(player,name,index)
	if not isOpenActivity(player,name) then
		player:alert(1,1,"对不起,该活动暂未开启,不可领取!")
		return;
	end
	local data = gethuodong(player,name);
	if data then
		if data.isOpen then
			local content;
			if data.awardtype == 2 then
				content = data.contents[util.svn(data.name)+1];
			else
				content = data.contents[1];
			end
			if content then

				local row;
				if data.name == "tjsj" then
					if player:get_job_name()=="warrior" then
						row = content[index*2-1];
					else
						row = content[index*2];
					end
				else
					row = content[index];
				end
				if row then
					local awardpcon = util.ppn(player,row.awardpcon);
					if data.iseveryday then
						if awardpcon ~= today() then
							local pcon = util.ppn(player,data.pcon);
							if pcon >= row.key then
								if player:num_bag_black() >= row.slot then
									player:set_param(row.awardpcon,today());
									for k,v in pairs(row.award) do
										player:add_item(v.name,v.num,1);
									end
									player:alert(11,1,"领取成功!")
									player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"picid",10236);
									player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"mouseEnabled","false");
									player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
									if data.name == "mrcz" then
										fresh_mrcz_icon(player);
									end
								else
									player:alert(1,1,"背包空格不足"..(row.slot).."格,无法领取!")
								end
							else
								player:alert(1,1,"对不起,未满足领取条件!")
							end
						else
							player:alert(1,1,"对不起,您今天已经领取过该奖励!")
						end
					else
						if data.pcon > 0 then
							if awardpcon == 0 then
								local pcon = util.ppn(player,data.pcon);
								if pcon >= row.key then
									if player:num_bag_black() >= row.slot then
										player:set_param(row.awardpcon,today());
										for k,v in pairs(row.award) do
											player:add_item(v.name,v.num,1);
										end
										player:alert(11,1,"领取成功!")
										player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"picid",10236);
										player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"mouseEnabled","false");
										player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
									else
										player:alert(1,1,"背包空格不足"..(row.slot).."格,无法领取!")
									end
								end
							else
								player:alert(1,1,"对不起,您已经领取过该奖励!")
							end
						else
							if awardpcon > 0 then
								if player:num_bag_black() >= row.slot then
									if data.name == "zbqhfs" then
										player:set_param(row.awardpcon,awardpcon-1);
									else
										player:set_param(row.awardpcon,-1);
									end
									for k,v in pairs(row.award) do
										player:add_item(v.name,v.num,1);
									end
									player:alert(11,1,"领取成功!")
									if awardpcon-1 <= 0 then
										if data.name == "zbqhfs" then
											player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"picid",10007);
										else
											player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"picid",10236);
										end
										player:set_panel_data(PANEL_ACTIONSET_NAME,"btn"..data.name..index,"mouseEnabled","false");
										player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
									end
								else
									player:alert(1,1,"背包空格不足"..(row.slot).."格,无法领取!")
								end
							else
								player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
							end
						end
					end
				end
			end
		else
			player:alert(1,1,"对不起,该活动暂未开启!")
		end
	end
end

function receiveBossjspmAward(player,name,index)
	if isOpenActivity(player,name) then
		player:alert(1,1,"活动未结束，无法领取奖励!");
		return;
	end

	local getgift=false;
	local data = consttab[index];
	if data then
		if util.ppn(player,data.pcon)<=0 then
			for k=1,#data.award do
				if server.get_var(data.haved..k) ~= "haved" then
					if server.get_var(data.sbl..k) and server.get_var(data.sbl..k)==player:get_name() then
						if player:num_bag_black() >= 1 then
							player:set_param(data.pcon,1);
							player:add_item_log(data.award[k].name,223,1,1);
							getgift=true;
							server.set_var(data.haved..k,"haved");
						else
							player:alert(1,1,"背包空格不足1格,无法领取!");
						end
					end
				end
			end
			if getgift then
				player:alert(1,1,"成功领取击杀Boss奖励!");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..index,"picid",10236);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbossjspm"..index,"mouseEnabled","false");
				player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
			else
				player:alert(1,1,"榜上无名，还怎么领取奖励!");
			end
		else
			player:alert(1,1,"你已领取过该奖励!!");
		end
	end
end

local sccx_data={
	[1]={consttimes=const.PP_JC_SCCX_TIMES1,needcoin=1200,wp="五级攻击玄晶"},
	[2]={consttimes=const.PP_JC_SCCX_TIMES2,needcoin=1200,wp="五级物防玄晶"},
	[3]={consttimes=const.PP_JC_SCCX_TIMES3,needcoin=1200,wp="五级魔防玄晶"},
	[4]={consttimes=const.PP_JC_SCCX_TIMES4,needcoin=1200,wp="五级生命玄晶"},
	[5]={consttimes=const.PP_JC_SCCX_TIMES5,needcoin=1888,wp="六级宝石"},
	[6]={consttimes=const.PP_JC_SCCX_TIMES6,needcoin=5888,wp="七级宝石"},
	[7]={consttimes=const.PP_JC_SCCX_TIMES7,needcoin=18888,wp="八级宝石"},
	[8]={consttimes=const.PP_JC_SCCX_TIMES8,needcoin=55888,wp="九级宝石"},
};
function receivesccx(player,name,index)
	if not isOpenActivity(player,name) then
		player:alert(1,1,"对不起,该活动暂未开启,无法购买!")
		return;
	end
	if player:num_bag_black() <= 1 then
		player:alert(11,1,"对不起,您的背包不足1格,无法购买!");return;
	end
	local coin = player:get_vcoin();
	local data = sccx_data[index];
	local dateInfo = util.ppn(player,const.PP_JC_SCCX_DATE);

	if coin >= data.needcoin then
		if dateInfo ~= today() then
			player:set_param(const.PP_JC_SCCX_DATE,today());
			for i=1,8,1 do
				player:set_param(sccx_data[i].consttimes,0);
			end
			player:set_param(data.consttimes,1);
		else
			local cs = util.ppn(player,data.consttimes);
			if cs < 5 then 
				player:set_param(data.consttimes,cs+1);
			else
				player:alert(11,1,"对不起,"..data.wp.."每天最多只能购买5次,您已超过次数,无法购买!");
				return;
			end
		end

		local ks = util.ppn(player,data.consttimes);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lblsccxcs"..index,"text",ks.."/5");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

		player:sub_vcoin(data.needcoin,"sccx");
		player:add_item(data.wp,1,1);
		player:alert(11,1,"您已购买"..data.wp.."!");
	else
		player:alert(11,1,"您的元宝不足"..data.needcoin..",无法购买!");
	end
	--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end


local sjqg_data={
	[1]={consttimes=const.PP_JC_SJQG_TIMES1,needcoin=990,wp="经验珠(5000万)"},
	[2]={consttimes=const.PP_JC_SJQG_TIMES2,needcoin=400,wp="经验珠(2000万)"},
};
function receivesjqg(player,name,index)
	if not isOpenActivity(player,name) then
		player:alert(1,1,"对不起,该活动暂未开启,无法购买!")
		return;
	end
	if player:num_bag_black() <= 1 then
		player:alert(11,1,"对不起,您的背包不足1格,无法购买!");return;
	end

	local coin = player:get_vcoin();
	local data = sjqg_data[index];
	local dateInfo = util.ppn(player,const.PP_JC_SJQG_DATE);

	if coin >= data.needcoin then
		if dateInfo ~= today() then
			player:set_param(const.PP_JC_SJQG_DATE,today());
			for i=1,2,1 do
				player:set_param(sjqg_data[i].consttimes,0);
			end
			player:set_param(data.consttimes,1);
		else
			local cs = util.ppn(player,data.consttimes);
			if cs < 3 then 
				player:set_param(data.consttimes,cs+1);
			else
				player:alert(11,1,"对不起,"..data.wp.."每天最多只能购买3次,您已超过次数,无法购买!");
				return;
			end
		end
		local ks = util.ppn(player,data.consttimes);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lblSjqg"..index,"text",ks.."/3");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

		player:sub_vcoin(data.needcoin,"sjqg");
		player:add_item(data.wp,1,1);
		player:alert(11,1,"您已购买"..data.wp.."!");
	else
		player:alert(11,1,"您的元宝不足"..data.needcoin..",无法购买!");
	end
end

function receivesjqgtab(player)
	if util.ppn(player,const.PP_JC_SJQG_DATE)==today() then
		for i=1,2,1 do
			local ks = util.ppn(player,sjqg_data[i].consttimes);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lblSjqg"..i,"text",ks.."/3");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function receivesccxtab(player)
	if util.ppn(player,const.PP_JC_SCCX_DATE)==today() then
		for i=1,8,1 do
			local ks = util.ppn(player,sccx_data[i].consttimes);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lblsccxcs"..i,"text",ks.."/5");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function fresh_mrcz_icon(player)
	if util.ppn(player,const.const.PP_JC_MRSC1) == today() and util.ppn(player,const.const.PP_JC_MRSC2) == today()
	and util.ppn(player,const.const.PP_JC_MRSC3) == today() and util.ppn(player,const.const.PP_JC_MRSC4) == today() then
		player:set_panel_data("panelminimapfun","btnDayGift","visible","false");
		--player:set_panel_data("panelminimapfun","btnHBox","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
	end
end
login.add_login_listener(fresh_mrcz_icon);

function fresh_awardpcon(player)
	--坐骑
	local zuoqiLevel = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zuoqiLevel >= 4 then
		local zqsj = gethuodong(player,"zqsj");
		if zqsj then
			if zqsj.isOpen then
				for i,j in ipairs(zqsj.contents) do
					for k,v in ipairs(j) do
						if v.key <= zuoqiLevel and util.ppn(player,v.awardpcon) == 0 then
							player:set_param(v.awardpcon,1);
						end
					end
				end
			end
		end
	end
	--翅膀
	local cbTypeID = player:get_item_type_by_pos(-16*2);
	local cbLevel = cbTypeID%100;
	if cbLevel >= 6 then
		local cbsj = gethuodong(player,"cbsj");
		if cbsj then
			if cbsj.isOpen then
				for i,j in ipairs(cbsj.contents) do
					for k,v in ipairs(j) do
						if v.key <= cbLevel and util.ppn(player,v.awardpcon) == 0 then
							player:set_param(v.awardpcon,1);
						end
					end
				end
			end
		end
	end
	--法宝
	local fbLevel = util.ppn(player,const.PP_SHENQI_JIELV);
	if fbLevel >= 3 then
		local fbsj = gethuodong(player,"fbsj");
		if fbsj then
			if fbsj.isOpen then
				for i,j in ipairs(fbsj.contents) do
					for k,v in ipairs(j) do
						if v.key <= fbLevel and util.ppn(player,v.awardpcon) == 0 then
							player:set_param(v.awardpcon,1);
						end
					end
				end
			end
		end
	end
	--官职
	local gzLevel = util.ppn(player,const.PP_GUANZHI);
	if gzLevel >= 9 then
		local gzsj = gethuodong(player,"gzsj");
		if gzsj then
			if gzsj.isOpen then
				for i,j in ipairs(gzsj.contents) do
					for k,v in ipairs(j) do
						if v.key <= gzLevel and util.ppn(player,v.awardpcon) == 0 then
							player:set_param(v.awardpcon,1);
						end
					end
				end
			end
		end
	end
	--特戒
	local tjName = player:get_item_name_by_pos(-17*2);
	local tjsj = gethuodong(player,"tjsj");
	local isExistTJ = false;
	if tjsj then
		if tjsj.isOpen then
			for i,j in ipairs(tjsj.contents) do
				for k,v in ipairs(j) do
					if v.key == tjName then
						isExistTJ = true;
						break;
					end
				end
				if isExistTJ then
					break;
				end
			end
		end
	end
	if isExistTJ then
		if tjsj then
			if tjsj.isOpen then
				local isQuit = false;
				for i,j in ipairs(tjsj.contents) do
					for k,v in ipairs(j) do
						if v.key ~= tjName then
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
						else
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
							isQuit = true;
							break;
						end
					end
					if isQuit then
						break;
					end
				end
			end
		end
	end
	--称号
	local achievePoint = tonumber(player:achieve_get_point());
	if achievePoint >= 5000 then
		local chName;
		if achievePoint >= 5000 and achievePoint <= 9999  then
			chName = "乱世英雄";
		end
		if achievePoint >= 10000 and achievePoint <= 19999  then
			chName = "只手遮天";
		end
		if achievePoint >= 20000 and achievePoint <= 39999  then
			chName = "威震八方";
		end
		if achievePoint >= 40000 and achievePoint <= 59999  then
			chName = "百胜天师";
		end
		if achievePoint >= 60000 and achievePoint <= 99999  then
			chName = "横扫千军";
		end
		if achievePoint >= 100000 and achievePoint <= 159999  then
			chName = "万夫莫敌";
		end
		if achievePoint >= 160000 and achievePoint <= 219999  then
			chName = "盖世奇侠";
		end
		if achievePoint >= 220000 and achievePoint <= 299999  then
			chName = "杀戮之神";
		end
		if achievePoint >= 300000 then
			chName = "神魔霸主";
		end
		local chsj = gethuodong(player,"chsj");
		if chsj then
			if chsj.isOpen then
				local isQuit = false;
				for i,j in ipairs(chsj.contents) do
					for k,v in ipairs(j) do
						if v.key ~= chName then
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
						else
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
							isQuit = true;
							break;
						end
					end
					if isQuit then
						break;
					end
				end
			end
		end
	end
	--官印
	local gyName = player:get_item_name_by_pos(-11*2);
	local gysj = gethuodong(player,"gysj");
	local isExistGY = false;
	if gysj then
		if gysj.isOpen then
			for i,j in ipairs(gysj.contents) do
				for k,v in ipairs(j) do
					if v.key == gyName then
						isExistGY = true;
						break;
					end
				end
				if isExistGY then
					break;
				end
			end
		end
	end
	if isExistGY then
		if gysj then
			if gysj.isOpen then
				local isQuit = false;
				for i,j in ipairs(gysj.contents) do
					for k,v in ipairs(j) do
						if v.key ~= gyName then
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
						else
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
							isQuit = true;
							break;
						end
					end
					if isQuit then
						break;
					end
				end
			end
		end
	end
	--令牌
	local lpName = player:get_item_name_by_pos(-18*2);
	local lpsj = gethuodong(player,"lpsj");
	local isExistLP = false;
	if lpsj then
		if lpsj.isOpen then
			for i,j in ipairs(lpsj.contents) do
				for k,v in ipairs(j) do
					if v.key == lpName then
						isExistLP = true;
						break;
					end
				end
				if isExistLP then
					break;
				end
			end
		end
	end
	if isExistLP then
		if lpsj then
			if lpsj.isOpen then
				local isQuit = false;
				for i,j in ipairs(lpsj.contents) do
					for k,v in ipairs(j) do
						if v.key ~= lpName then
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
						else
							if util.ppn(player,v.awardpcon) == 0 then
								player:set_param(v.awardpcon,1);
							end
							isQuit = true;
							break;
						end
					end
					if isQuit then
						break;
					end
				end
			end
		end
	end
end