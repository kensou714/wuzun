module(..., package.seeall)
local ACTIONSET_NAME="achieve";
local PANEL_ACTIONSET_NAME="panelachieve";

local ach_data={
	[1]={
		[1]={name="第一次击杀怪物",con=const.PP_ACHIEVE_FIRSTMON,award={
				{id=19007,item="绑定金币",number=20000},
				{id=19009,item="绑定元宝",number=50},
			},desp="第一次击杀任意一个怪物",slot=0,
		},
		[2]={name="第一次组队",con=const.PP_ACHIEVE_FIRSTGROUP,award={
				{id=19007,item="绑定金币",number=20000},
				{id=19009,item="绑定元宝",number=50},
			},desp="打开界面上的组队图标或使用快捷键T，点击创建队伍可轻松完成该任务。",slot=0,
		},
		[3]={name="第一次添加好友",con=const.PP_ACHIEVE_FIRSTFRIEND,award={
				{id=19007,item="绑定金币",number=50000},
				{id=19009,item="绑定元宝",number=50},
			},desp="点击玩家，查看更多选项，选择加为好友。",slot=0,
		},
		[4]={name="第一次加入行会",con=const.PP_ACHIEVE_FIRSTGUILD,award={
				{id=19007,item="绑定金币",number=100000},
				{id=19001,item="经验",number=200000},
			},desp="打开界面上的行会图标或者使用快捷键H，点击选中的行会加入即可。",slot=0,
		},
		[5]={name="第一次提升官职",con=const.PP_ACHIEVE_FIRSTGUANZHI,award={
				{id=19007,item="绑定金币",number=50000},
				{id=15044,item="魂石令牌(500)",number=1},
			},desp="前往沙漠土城寻找官职系统的NPC可提升官职",slot=1,
		},
		[6]={name="第一次强化",con=const.PP_ACHIEVE_FIRSTQHUA,award={
				{id=19009,item="绑定元宝",number=100},
				{id=10136,item="二级宝石",number=1},
			},desp="第一次强化任意一件装备可完成该任务",slot=1,
		},
		[7]={name="第一次精炼",con=const.PP_ACHIEVE_FIRSTJLIAN,award={
				{id=19001,item="经验",number=100000},
				{id=19009,item="绑定元宝",number=100},
			},desp="第一次精炼任何品级的宝石可完成该任务",slot=0,
		},
		[8]={name="第一次寻宝",con=const.PP_ACHIEVE_FIRSTXUNBAO,award={
				{id=19001,item="经验",number=100000},
				{id=19009,item="绑定元宝",number=500},
			},desp="打开界面上的寻宝图标，使用一次寻宝系统即可",slot=0,
		},
		[9]={name="第一次提升坐骑",con=const.PP_ACHIEVE_FIRSTZUOQI,award={
				{id=19007,item="绑定金币",number=50000},
				{id=15037,item="坐骑经验丹(大)",number=1},
			},desp="打开界面上的坐骑图标或使用快捷键V进入坐骑面板，可使用坐骑经验丹增加坐骑经验激活坐骑。",slot=1,
		},
		[10]={name="第一次祈灵",con=const.PP_ACHIEVE_FIRSTQLING,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=500000},
			},desp="使用乞灵玉对装备进行祈灵，乞灵玉可在商城购买获得。",slot=0,
		},
		[11]={name="第一次击杀BOSS",con=const.PP_ACHIEVE_FIRSTBOSS,award={
				{id=19007,item="绑定金币",number=100000},
				{id=19009,item="绑定元宝",number=500},
			},desp="击杀任意一只150级以上的BOSS即可",slot=0,
		},
	},
	[2]={
		[1]={name="击杀怪物达到10只",con=const.PP_ACHIEVE_MON10,award={
				{id=19007,item="绑定金币",number=20000},
				{id=19009,item="绑定元宝",number=50},
			},desp="击杀任意怪物累计达到10只",slot=0,
		},
		[2]={name="击杀怪物达到100只",con=const.PP_ACHIEVE_MON1B,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19007,item="绑定金币",number=50000},
			},desp="击杀任意怪物累计达到100只",slot=0,
		},
		[3]={name="击杀怪物达到1000只",con=const.PP_ACHIEVE_MON1K,award={
				{id=19009,item="绑定元宝",number=200},
				{id=19007,item="绑定金币",number=100000},
			},desp="击杀任意怪物累计达到1000只",slot=0,
		},
		[4]={name="击杀怪物达到10000只",con=const.PP_ACHIEVE_MON1W,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19007,item="绑定金币",number=200000},
			},desp="击杀任意怪物累计达到10000只",slot=0,
		},
		[5]={name="击杀怪物达到100000只",con=const.PP_ACHIEVE_MON10W,award={
				{id=19009,item="绑定元宝",number=1000},
				{id=19007,item="绑定金币",number=500000},
			},desp="击杀任意怪物累计达到100000只",slot=0,
		},
		[6]={name="击杀怪物达到1000000只",con=const.PP_ACHIEVE_MON1BW,award={
				{id=19009,item="绑定元宝",number=1500},
				{id=19007,item="绑定金币",number=1000000},
			},desp="击杀任意怪物累计达到1000000只",slot=0,
		},
		[7]={name="击杀怪物达到2000000只",con=const.PP_ACHIEVE_MON2BW,award={
				{id=19009,item="绑定元宝",number=2000},
				{id=19007,item="绑定金币",number=2000000},
			},desp="击杀任意怪物累计达到2000000只",slot=0,
		},
		[8]={name="击杀怪物达到5000000只",con=const.PP_ACHIEVE_MON5BW,award={
				{id=19009,item="绑定元宝",number=3000},
				{id=19007,item="绑定金币",number=3000000},
			},desp="击杀任意怪物累计达到5000000只",slot=0,
		},
		[9]={name="击杀怪物达到10000000只",con=const.PP_ACHIEVE_MON1KW,award={
				{id=19009,item="绑定元宝",number=4000},
				{id=19007,item="绑定金币",number=5000000},
			},desp="击杀任意怪物累计达到10000000只",slot=0,
		},
	},
	[3]={
		[1]={name="击杀奴玛教主",con=const.PP_ACHIEVE_KILLNMJZ,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=500000},
			},desp="击杀奴玛寺庙的奴玛教主",slot=0,
		},
		[2]={name="击杀猛犸教主",con=const.PP_ACHIEVE_KILLMMJZ,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=500000},
			},desp="击杀猛犸寺庙的猛犸教主",slot=0,
		},
		[3]={name="击杀嗜血毒虫",con=const.PP_ACHIEVE_KILLXEWG,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=500000},
			},desp="击杀邪恶洞穴的嗜血毒虫",slot=0,
		},
		[4]={name="击杀魔魂教主",con=const.PP_ACHIEVE_KILLMHJZ,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=500000},
			},desp="击杀魔魂殿的魔魂教主",slot=0,
		},
		[5]={name="击杀蛮牛王",con=const.PP_ACHIEVE_KILLMNW,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=600000},
			},desp="击杀蛮牛洞的蛮牛王",slot=0,
		},
		[6]={name="击杀妖月金刚",con=const.PP_ACHIEVE_KILLYYJG,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=700000},
			},desp="击杀妖月峡谷的妖月金刚",slot=0,
		},
		[7]={name="击杀妖月血魔",con=const.PP_ACHIEVE_KILLYYXM,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19001,item="经验",number=700000},
			},desp="击杀妖月峡谷的妖月血魔",slot=0,
		},
		[8]={name="击杀奴玛教皇",con=const.PP_ACHIEVE_KILLNMJH,award={
				{id=19009,item="绑定元宝",number=200},
				{id=19001,item="经验",number=1000000},
			},desp="击杀奴玛后宫的奴玛教皇",slot=0,
		},
		[9]={name="击杀邪龙神",con=const.PP_ACHIEVE_KILLXLS,award={
				{id=19009,item="绑定元宝",number=200},
				{id=19001,item="经验",number=1000000},
			},desp="击杀邪龙谷的邪龙神",slot=0,
		},
		[10]={name="击杀猛犸教皇",con=const.PP_ACHIEVE_KILLMMJH,award={
				{id=19009,item="绑定元宝",number=200},
				{id=19001,item="经验",number=1000000},
			},desp="击杀猛犸后宫的猛犸教皇",slot=0,
		},
		[11]={name="击杀牛魔圣君",con=const.PP_ACHIEVE_KILLNMSJ,award={
				{id=19009,item="绑定元宝",number=200},
				{id=19001,item="经验",number=1000000},
			},desp="击杀蛮牛圣殿的牛魔圣君",slot=0,
		},
		[12]={name="击杀玛雅之神",con=const.PP_ACHIEVE_KILLMYZS,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀玛雅神殿的玛雅之神",slot=0,
		},
		[13]={name="击杀巨灵天魔",con=const.PP_ACHIEVE_KILLJLTM,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀巨灵石窟的巨灵天魔",slot=0,
		},
		[14]={name="击杀混沌魔君",con=const.PP_ACHIEVE_KILLHDMJ,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀混沌之门的混沌魔君",slot=0,
		},
		[15]={name="击杀噬日魔兽",con=const.PP_ACHIEVE_KILLSRMS,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀冰封雪域的噬日魔兽",slot=0,
		},
		[16]={name="击杀地狱炎魔",con=const.PP_ACHIEVE_KILLDYYM,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀地狱熔岩的地狱炎魔",slot=0,
		},
		[17]={name="击杀落日恶魔",con=const.PP_ACHIEVE_KILLLREM,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀落日峡谷的落日恶魔",slot=0,
		},
		[18]={name="击杀亘古魔王",con=const.PP_ACHIEVE_KILLGGMW,award={
				{id=19009,item="绑定元宝",number=500},
				{id=19001,item="经验",number=3000000},
			},desp="击杀神庙废墟的亘古魔王",slot=0,
		},
	},	
	[4]={
		[1]={name="提升1级坐骑",con=const.PP_ACHIEVE_ZUOQI1,award={
				{id=19007,item="绑定金币",number=20000},
				{id=19009,item="绑定元宝",number=50},
			},desp="将坐骑提升到1级",slot=0,
		},
		[2]={name="提升2级坐骑",con=const.PP_ACHIEVE_ZUOQI2,award={
				{id=19009,item="绑定元宝",number=100},
				{id=19007,item="绑定金币",number=50000},
			},desp="将坐骑提升到2级",slot=0,
		},
		[3]={name="提升3级坐骑",con=const.PP_ACHIEVE_ZUOQI3,award={
				{id=19009,item="绑定元宝",number=200},
				{id=19007,item="绑定金币",number=100000},
			},desp="将坐骑提升到3级",slot=0,
		},
		[4]={name="提升4级坐骑",con=const.PP_ACHIEVE_ZUOQI4,award={
				{id=19007,item="绑定金币",number=200000},
				{id=10138,item="四级宝石",number=1},
			},desp="将坐骑提升到4级",slot=1,
		},
		[5]={name="提升5级坐骑",con=const.PP_ACHIEVE_ZUOQI5,award={
				{id=19007,item="绑定金币",number=300000},
				{id=10138,item="四级宝石",number=2},
			},desp="将坐骑提升到5级",slot=2,
		},
		[6]={name="提升6级坐骑",con=const.PP_ACHIEVE_ZUOQI6,award={
				{id=19009,item="绑定元宝",number=200},
				{id=10139,item="五级宝石",number=1},
			},desp="将坐骑提升到6级",slot=1,
		},
		[7]={name="提升7级坐骑",con=const.PP_ACHIEVE_ZUOQI7,award={
				{id=19009,item="绑定元宝",number=500},
				{id=10139,item="五级宝石",number=2},
			},desp="将坐骑提升到7级",slot=2,
		},
		[8]={name="提升8级坐骑",con=const.PP_ACHIEVE_ZUOQI8,award={
				{id=19009,item="绑定元宝",number=1000},
				{id=10140,item="六级宝石",number=1},
			},desp="将坐骑提升到8级",slot=1,
		},
		[9]={name="提升9级坐骑",con=const.PP_ACHIEVE_ZUOQI9,award={
				{id=19009,item="绑定元宝",number=2000},
				{id=10141,item="七级宝石",number=1},
			},desp="将坐骑提升到9级",slot=1,
		},
		[10]={name="提升10级坐骑",con=const.PP_ACHIEVE_ZUOQI10,award={
				{id=19009,item="绑定元宝",number=3000},
				{id=10142,item="八级宝石",number=1},
				{id=19001,item="经验",number=50000000},
			},desp="将坐骑提升到10级",slot=1,
		},
		[11]={name="提升11级坐骑",con=const.PP_ACHIEVE_ZUOQI11,award={
				{id=19009,item="绑定元宝",number=4000},
				{id=10143,item="九级宝石",number=1},
				{id=19001,item="经验",number=100000000},
			},desp="将坐骑提升到11级",slot=1,
		},
		[12]={name="提升12级坐骑",con=const.PP_ACHIEVE_ZUOQI12,award={
				{id=19009,item="绑定元宝",number=5000},
				{id=10144,item="十级宝石",number=1},
				{id=19001,item="经验",number=200000000},
			},desp="将坐骑提升到12级",slot=1,
		},
	},
	[5]={
		[1]={name="提升1级官职",con=const.PP_ACHIEVE_GUANZHI1,award={
				{id=19007,item="绑定金币",number=20000},
				{id=19001,item="经验",number=50000},
			},desp="将官职提升到九品将军都卫",slot=0,
		},
		[2]={name="提升2级官职",con=const.PP_ACHIEVE_GUANZHI2,award={
				{id=19007,item="绑定金币",number=50000},
				{id=19001,item="经验",number=100000},
			},desp="将官职提升到八品抚夷护军",slot=0,
		},
		[3]={name="提升3级官职",con=const.PP_ACHIEVE_GUANZHI3,award={
				{id=19007,item="绑定金币",number=100000},
				{id=19001,item="经验",number=200000},
			},desp="将官职提升到七品安夷护军",slot=0,
		},
		[4]={name="提升4级官职",con=const.PP_ACHIEVE_GUANZHI4,award={
				{id=19007,item="绑定金币",number=200000},
				{id=19001,item="经验",number=300000},
			},desp="将官职提升到六品讨寇校卫",slot=0,
		},
		[5]={name="提升5级官职",con=const.PP_ACHIEVE_GUANZHI5,award={
				{id=19007,item="绑定金币",number=300000},
				{id=19001,item="经验",number=500000},
			},desp="将官职提升到五品平寇校卫",slot=0,
		},
		[6]={name="提升6级官职",con=const.PP_ACHIEVE_GUANZHI6,award={
				{id=19007,item="绑定金币",number=500000},
				{id=19001,item="经验",number=1000000},
			},desp="将官职提升到四品破虏将军",slot=0,
		},
		[7]={name="提升7级官职",con=const.PP_ACHIEVE_GUANZHI7,award={
				{id=19009,item="绑定元宝",number=200},
				{id=10138,item="四级宝石",number=1},
			},desp="将官职提升到三品平虏将军",slot=1,
		},
		[8]={name="提升8级官职",con=const.PP_ACHIEVE_GUANZHI8,award={
				{id=19009,item="绑定元宝",number=400},
				{id=10138,item="四级宝石",number=2},
			},desp="将官职提升到二品车骑将军",slot=2,
		},
		[9]={name="提升9级官职",con=const.PP_ACHIEVE_GUANZHI9,award={
				{id=19009,item="绑定元宝",number=800},
				{id=10139,item="五级宝石",number=1},
			},desp="将官职提升到一品骠骑将军",slot=1,
		},
		[10]={name="提升10级官职",con=const.PP_ACHIEVE_GUANZHI10,award={
				{id=19009,item="绑定元宝",number=1500},
				{id=10140,item="六级宝石",number=1},
			},desp="将官职提升到抚国大将军",slot=1,
		},
		[11]={name="提升11级官职",con=const.PP_ACHIEVE_GUANZHI11,award={
				{id=19009,item="绑定元宝",number=2000},
				{id=10141,item="七级宝石",number=1},
			},desp="将官职提升到镇国大将军",slot=1,
		},
		[12]={name="提升12级官职",con=const.PP_ACHIEVE_GUANZHI12,award={
				{id=19009,item="绑定元宝",number=3000},
				{id=10142,item="八级宝石",number=1},
			},desp="将官职提升到兵马大元帅",slot=1,
		},
	},
	[6]={
		[1]={name="提升心法等级1级",con=const.PP_ACHIEVE_XINFA1,award={
				{id=19007,item="绑定金币",number=20000},
				{id=19009,item="绑定元宝",number=50},
			},desp="将心法提升到1级",slot=0,
		},
		[2]={name="提升心法等级5级",con=const.PP_ACHIEVE_XINFA5,award={
				{id=19007,item="绑定金币",number=50000},
				{id=19009,item="绑定元宝",number=100},
			},desp="将心法提升到5级",slot=0,
		},
		[3]={name="提升心法等级10级",con=const.PP_ACHIEVE_XINFA10,award={
				{id=19007,item="绑定金币",number=100000},
				{id=19009,item="绑定元宝",number=200},
			},desp="将心法提升到10级",slot=0,
		},
		[4]={name="提升心法等级15级",con=const.PP_ACHIEVE_XINFA15,award={
				{id=19007,item="绑定金币",number=300000},
				{id=19009,item="绑定元宝",number=300},
			},desp="将心法提升到15级",slot=0,
		},
		[5]={name="提升心法等级20级",con=const.PP_ACHIEVE_XINFA20,award={
				{id=19007,item="绑定金币",number=500000},
				{id=19009,item="绑定元宝",number=500},
			},desp="将心法提升到20级",slot=0,
		},
		[6]={name="提升心法等级25级",con=const.PP_ACHIEVE_XINFA25,award={
				{id=19009,item="绑定元宝",number=1000},
				{id=10139,item="五级宝石",number=1},
			},desp="将心法提升到25级",slot=1,
		},
		[7]={name="提升心法等级30级",con=const.PP_ACHIEVE_XINFA30,award={
				{id=19009,item="绑定元宝",number=1500},
				{id=10140,item="六级宝石",number=1},
			},desp="将心法提升到30级",slot=1,
		},
		[8]={name="提升心法等级35级",con=const.PP_ACHIEVE_XINFA35,award={
				{id=19009,item="绑定元宝",number=2000},
				{id=10140,item="六级宝石",number=2},
			},desp="将心法提升到35级",slot=2,
		},
		[9]={name="提升心法等级40级",con=const.PP_ACHIEVE_XINFA40,award={
				{id=19009,item="绑定元宝",number=3000},
				{id=10141,item="七级宝石",number=1},
			},desp="将心法提升到40级",slot=1,
		},
		[10]={name="提升心法等级45级",con=const.PP_ACHIEVE_XINFA45,award={
				{id=19009,item="绑定元宝",number=4000},
				{id=10142,item="八级宝石",number=1},
			},desp="将心法提升到45级",slot=1,
		},
		[11]={name="提升心法等级50级",con=const.PP_ACHIEVE_XINFA50,award={
				{id=19009,item="绑定元宝",number=5000},
				{id=10143,item="九级宝石",number=1},
			},desp="将心法提升到50级",slot=1,
		},	
	},
	[7]={
		[1]={name="第1天登陆奖励",con=const.PP_ACHIEVE_LOGIN1,award={
				{id=19007,item="绑定金币",number=50000},
				{id=19009,item="绑定元宝",number=50},
			},desp="连续登陆第1天",slot=0,
		},
		[2]={name="第2天登陆奖励",con=const.PP_ACHIEVE_LOGIN2,award={
				{id=19007,item="绑定金币",number=100000},
				{id=19009,item="绑定元宝",number=100},
				{id=15037,item="坐骑经验丹(大)",number=2},
			},desp="连续登陆第2天",slot=2,
		},
		[3]={name="第3天登陆奖励",con=const.PP_ACHIEVE_LOGIN3,award={
				{id=19007,item="绑定金币",number=200000},
				{id=19009,item="绑定元宝",number=200},
				{id=15044,item="魂石令牌(500)",number=2},
			},desp="连续登陆第3天",slot=2,
		},
		[4]={name="第4天登陆奖励",con=const.PP_ACHIEVE_LOGIN4,award={
				{id=19007,item="绑定金币",number=300000},
				{id=19009,item="绑定元宝",number=300},
				{id=15054,item="成就令牌",number=5},
			},desp="连续登陆第4天",slot=5,
		},
		[5]={name="第5天登陆奖励",con=const.PP_ACHIEVE_LOGIN5,award={
				{id=19007,item="绑定金币",number=400000},
				{id=19009,item="绑定元宝",number=400},
				{id=15056,item="修为令牌",number=2},
			},desp="连续登陆第5天",slot=2,
		},
		[6]={name="第6天登陆奖励",con=const.PP_ACHIEVE_LOGIN6,award={
				{id=19007,item="绑定金币",number=500000},
				{id=19009,item="绑定元宝",number=500},
				{id=15050,item="镇魔令大包",number=1},
			},desp="连续登陆第6天",slot=1,
		},
		[7]={name="第7天登陆奖励",con=const.PP_ACHIEVE_LOGIN7,award={
				{id=19009,item="绑定元宝",number=1000},
			},desp="连续登陆第7天",slot=0,
		},
		[8]={name="第8天登陆奖励",con=const.PP_ACHIEVE_LOGIN8,award={
				{id=19009,item="绑定元宝",number=1000},
			},desp="连续登陆第8天",slot=0,
		},
		[9]={name="第9天登陆奖励",con=const.PP_ACHIEVE_LOGIN9,award={
				{id=19009,item="绑定元宝",number=1000},
			},desp="连续登陆第9天",slot=0,
		},
		[10]={name="第10天登陆奖励",con=const.PP_ACHIEVE_LOGIN10,award={
				{id=19009,item="绑定元宝",number=1000},
			},desp="连续登陆第10天",slot=0,
		},
	},
};

function fresh_achieve_info(player)
	player:set_temp_param(const.PTP_ACHIEVE_TITLE,1)
	player:set_temp_param(const.PTP_ACHIEVE_SELECTED,1)
	process_achieve(player,"achieve","panelachieve","achtitle1",nil)
end
login.add_login_listener(fresh_achieve_info);

function process_achieve(player,actionset,panelid,actionid,data)
	if actionid == "btnachLQ" then
		lqAchieveAward(player);return;
	end
	if string.sub(actionid,1,8) == "achtitle" then
		local title = tonumber(string.sub(actionid,9));
		if title > 0 and title <= 7 then
			fresh_achieve_title(player,title);
		end
		return;
	end
	if string.sub(actionid,1,7) == "achshow" then
		local selected = tonumber(string.sub(actionid,8));
		if selected > 0 and selected <= 20 then
			fresh_achieve_selected(player,selected);
		end
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_achieve);

--领取奖励
function lqAchieveAward(player)
	local t = util.ptpn(player,const.PTP_ACHIEVE_TITLE);
	local s = util.ptpn(player,const.PTP_ACHIEVE_SELECTED);
	local t_data = ach_data[t];
	if t_data then
		local s_data = t_data[s];
		if s_data then
			if  util.ppn(player,s_data.con) == 11 then
				player:alert(11,1,"您已领取过该奖励!");
				return;
			end
			if  util.ppn(player,s_data.con) == 10 then
				if player:num_bag_black() < s_data.slot then player:alert(1,1,"背包不足"..s_data.slot.."格,请清理后再来领取!");return; end
				player:alert(11,0,"恭喜您成功领取目标奖励！");
				for i=1,#s_data.award do
					player:add_item_log(s_data.award[i].item,236,s_data.award[i].number,1);
					player:alert(11,0,s_data.award[i].item.." *"..s_data.award[i].number);
				end
				player:set_param(s_data.con,11);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"bgAch"..s,"bgid","4011");
				fresh_achieve_selected(player,s);
				return;
			end
			if  util.ppn(player,s_data.con) == 0 then
				player:alert(11,1,"您尚未达成该目标,领取失败!");
				return;
			end
		end
	end
end

function fresh_achieve_title(player,title)
	player:set_temp_param(const.PTP_ACHIEVE_TITLE,title);
	player:set_temp_param(const.PTP_ACHIEVE_SELECTED,1);
	--刷新title亮暗
	for i=1,7 do
		local temp = ach_data[i];
		if temp then
			local t_ok = true;
			for i=1,20 do
				if temp[i] then
					if util.ppn(player,temp[i].con) < 10 then
						t_ok = false;break;
					end
				end
			end
			if t_ok then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"achtitle"..i,"grayFilter","false");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"achtitle"..i,"grayFilter","true");
			end
		end
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"achtitle"..title,"grayFilter","false");

	--刷新分条的成就细则	4010未完成 4011已领取 4009完成
	local t_data = ach_data[title];
	if t_data then
		
		player:set_panel_data(PANEL_ACTIONSET_NAME,"achlist","h",30*(#t_data));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"achscroll","w","280");

		for i=1,20 do
			if t_data[i] then
				if util.ppn(player,t_data[i].con) == 11 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"bgAch"..i,"bgid","4011");
				end
				if util.ppn(player,t_data[i].con) == 10 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"bgAch"..i,"bgid","4009 ");
				end
				if util.ppn(player,t_data[i].con) == 0 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"bgAch"..i,"bgid","4010");
				end
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtAchs"..i,"text",t_data[i].name);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"bgAch"..i,"bgid","0");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtAchs"..i,"text"," ");
			end
		end
		local s_data = t_data[1];
		if s_data then
			for i=1,6 do
				if s_data.award[i] then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"typeid",s_data.award[i].id);
					if s_data.award[i].number < 10000 then
						player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",s_data.award[i].number);
					else
						local w = math.floor(s_data.award[i].number/10000);
						if w < 10000 then
							player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",w.."W");
						else
							local y = math.floor(w/10000);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",y.."E");
						end
					end
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"bg",1006);
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"typeid",0);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",0);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"bg",0);
				end
			end
			if util.ppn(player,t_data[1].con) == 11 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnachLQ","visible","false");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnachLQ","visible","true");
			end
			if title == 2 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtachInfo","htmlText",s_data.desp.."<br><br>您当前已累计击杀怪物 "..util.ppn(player,const.PP_MONKILL_NUMBER).." 只!" );
			else
				if title == 7 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtachInfo","htmlText",s_data.desp.."<br><br>当前已连续登陆 "..util.ppn(player,const.PP_ACHIEVE_LOGINDAYS).." 天![时间自更新开始计算!]" );
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtachInfo","htmlText",s_data.desp);
				end
			end
			
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function fresh_achieve_selected(player,selected)
	player:set_temp_param(const.PTP_ACHIEVE_SELECTED,selected);
	--刷新右面单条成就的详细信息
	local t = util.ptpn(player,const.PTP_ACHIEVE_TITLE);
	local t_data = ach_data[t];
	if t_data then
		local s_data = t_data[selected];
		if s_data then
			for i=1,6 do
				if s_data.award[i] then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"typeid",s_data.award[i].id);
					if s_data.award[i].number < 10000 then
						player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",s_data.award[i].number);
					else
						local w = math.floor(s_data.award[i].number/10000);
						if w < 10000 then
							player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",w.."W");
						else
							local y = math.floor(w/10000);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",y.."E");
						end
					end
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"bg",1006);
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"typeid",0);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"num",0);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"achgift"..i,"bg",0);
				end
			end
			if util.ppn(player,t_data[selected].con) == 11 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnachLQ","visible","false");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnachLQ","visible","true");
			end
			if t == 2 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtachInfo","htmlText",s_data.desp.."<br><br>您当前已累计击杀怪物 "..util.ppn(player,const.PP_MONKILL_NUMBER).." 只!" );
			else
				if t == 7 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtachInfo","htmlText",s_data.desp.."<br><br>当前已连续登陆 "..util.ppn(player,const.PP_ACHIEVE_LOGINDAYS).." 天![时间自更新开始计算!]" );
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtachInfo","htmlText",s_data.desp);
				end
			end
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end