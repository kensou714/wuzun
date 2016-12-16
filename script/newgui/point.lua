module(..., package.seeall)
local ACTIONSET_NAME="point";
local PANEL_ACTIONSET_NAME="panelpoint";

local hd_data={
	["hd1"]={txthdName="冰火岛",txthdMap="在冰火岛采集矿石，可以获得进阶石及经验奖励，每天限采20次。",txthdTime="10:00-10:30",txtlevel="50",award={"19001","10209","0","0","0","0","0","0"},txthdRemind="tx81"};
	["hd2"]={txthdName="送财童子",txthdMap="在[凌霄城]和[沙漠之城]会随机出现4个送财童子,可以获得大量的金币奖励哦!还有几率掉落金条哦!",txthdTime="10:15",txtlevel="无",award={"19000","10037","0","0","0","0","0","0"},txthdRemind="tx82"};
	["hd3"]={txthdName="天魔兽来袭",txthdMap="[神器宝阁]里将会出现邪恶的上古魔兽[天魔兽],传说只有消灭天魔兽的勇士才可以获得神器积分,而神器积分可以兑换服务器顶级神器!",txthdTime="10:30-11:00",txtlevel="45",award={"10086","59000","69000","20439","20436","10141","10140","10139"},txthdRemind="tx83"};
	["hd4"]={txthdName="死亡禁地",txthdMap="在死亡禁地有大量的BOSS,传说消灭死亡禁地的[禁地魔王]将会获得顶级九霄套装哦!由于死亡禁地的BOSS过多,勇士们要小心!",txthdTime="11:15-11:45",txtlevel="45",award={"59000","69000","20439","20436","10141","10140","10139","15058"},txthdRemind="tx84"};
	["hd5"]={txthdName="泡温泉",txthdMap="活动开始后,您可以从凌霄城温泉老板娘进入温泉哦!泡温泉可以获得大量经验!另外您还可以在温泉里抓鱼哦!同样也可以获得大量经验!",txthdTime="12:00-12:30",txtlevel="无",award={"19001","10103","10102","10101","10100","0","0","0"},txthdRemind="tx85"};
	["hd6"]={txthdName="麒麟圣殿",txthdMap="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[九霄套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",txthdTime="12:45-12:50",txtlevel="45",award={"59000","69000","20439","20436","10141","10140","15037","15036"},txthdRemind="tx86"};
	["hd7"]={txthdName="武林争霸",txthdMap="武林争霸大厅内自由PK,死亡不掉装备当争霸大厅只剩1人时则成为武林盟主",txthdTime="13:00-14:00",txtlevel="45",award={"19001","19010","0","0","0","0","0","0"},txthdRemind="tx87"};
	["hd8"]={txthdName="送财童子",txthdMap="在[凌霄城]和[沙漠之城]会随机出现4个送财童子,可以获得大量的金币奖励哦!还有几率掉落金条哦!",txthdTime="14:15",txtlevel="无",award={"19000","10037","0","0","0","0","0","0"},txthdRemind="tx88"};
	["hd9"]={txthdName="天魔兽来袭",txthdMap="[神器宝阁]里将会出现邪恶的上古魔兽[天魔兽],传说只有消灭天魔兽的勇士才可以获得神器积分,而神器积分可以兑换服务器顶级神器!",txthdTime="14:30-15:00",txtlevel="45",award={"10086","59000","69000","20439","20436","10141","10140","10139"},txthdRemind="tx89"};
	["hd10"]={txthdName="双倍经验",txthdMap="为了感谢广大玩家对我们的支持和厚爱!我们推出全服双倍活动,活动期间全服打怪经验增加1倍哦!",txthdTime="15:00-16:00",txtlevel="无",award={"19001","0","0","0","0","0","0","0"},txthdRemind="tx90"};
	["hd11"]={txthdName="皇城宝藏",txthdMap="皇城宝藏中出现了大量的摇钱树，如此天降横财怎能错过！",txthdTime="16:15-16:45",txtlevel="50",award={"15111","15110","15099","15098","10207","10219","10218","0"},txthdRemind="tx91"};
	["hd12"]={txthdName="冰火岛",txthdMap="在冰火岛采集矿石，可以获得进阶石及经验奖励，每天限采20次。",txthdTime="17:00-17:30",txtlevel="50",award={"19001","10209","0","0","0","0","0","0"},txthdRemind="tx92"};
	["hd13"]={txthdName="送财童子",txthdMap="在[凌霄城]和[沙漠之城]会随机出现4个送财童子,可以获得大量的金币奖励哦!还有几率掉落金条哦!",txthdTime="17:15",txtlevel="无",award={"19000","10037","0","0","0","0","0","0"},txthdRemind="tx93"};
	["hd14"]={txthdName="天魔兽来袭",txthdMap="[神器宝阁]里将会出现邪恶的上古魔兽[天魔兽],传说只有消灭天魔兽的勇士才可以获得神器积分,而神器积分可以兑换服务器顶级神器!",txthdTime="17:30-18:00",txtlevel="45",award={"10086","59000","69000","20439","20436","10141","10140","10139"},txthdRemind="tx94"};
	["hd15"]={txthdName="泡温泉",txthdMap="活动开始后,您可以从凌霄城温泉老板娘进入温泉哦!泡温泉可以获得大量经验!另外您还可以在温泉里抓鱼哦!同样也可以获得大量经验!",txthdTime="18:00-18:30",txtlevel="无",award={"19001","10103","10102","10101","10100","0","0","0"},txthdRemind="tx95"};
	["hd16"]={txthdName="麒麟圣殿",txthdMap="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[九霄套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",txthdTime="18:45-18:50",txtlevel="45",award={"59000","69000","20439","20436","10141","10140","15037","15036"},txthdRemind="tx96"};
	["hd17"]={txthdName="天晶战场",txthdMap="战场中击杀玩家，采集运送矿石可以获得对应的积分，战斗结束时总积分高的一方为胜方。",txthdTime="19:00-19:30",txtlevel="45",award={"19001","0","0","0","0","0","0","0"},txthdRemind="tx97"};
	["hd18"]={txthdName="双倍经验",txthdMap="为了感谢广大玩家对我们的支持和厚爱!我们推出全服双倍活动,活动期间全服打怪经验增加1倍哦!",txthdTime="19:00-23:00",txtlevel="无",award={"19001","0","0","0","0","0","0","0"},txthdRemind="tx98"};
	["hd19"]={txthdName="王城争霸",txthdMap="活动时间结束时占领皇宫的行会即为王族",txthdTime="20:00-21:30",txtlevel="无",award={"19001","19000","19008","0","0","0","0","0"},txthdRemind="tx99"};
	["hd20"]={txthdName="怪物攻城",txthdMap="人马宫殿的[人马教主]带领魔界大军强袭王城,妄图统治全人类,勇士们是时候出击了!消灭恶魔,匡扶人间正道!快去消灭BOSS,获取极品装备的时机到了!",txthdTime="20:30-21:00",txtlevel="无",award={"59000","69000","20439","20436","10141","10140","10139","15058"},txthdRemind="tx100"};
	["hd21"]={txthdName="麒麟圣殿",txthdMap="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[九霄套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",txthdTime="21:45-21:50",txtlevel="45",award={"59000","69000","20439","20436","10141","10140","15037","15036"},txthdRemind="tx101"};
	["hd22"]={txthdName="冰火岛",txthdMap="在冰火岛采集矿石，可以获得进阶石及经验奖励，每天限采20次。",txthdTime="22:00-22:30",txtlevel="50",award={"19001","10209","0","0","0","0","0","0"},txthdRemind="tx102"};
	["hd23"]={txthdName="死亡禁地",txthdMap="在死亡禁地有大量的BOSS,传说消灭死亡禁地的[禁地魔王]将会获得顶级九霄套装哦!由于死亡禁地的BOSS过多,勇士们要小心!",txthdTime="22:15-22:45",txtlevel="45",award={"59000","69000","20439","20436","10141","10140","10139","15058"},txthdRemind="tx103"};
	["hd24"]={txthdName="怪物攻城",txthdMap="人马宫殿的[人马教主]带领魔界大军强袭王城,妄图统治全人类,勇士们是时候出击了!消灭恶魔,匡扶人间正道!快去消灭BOSS,获取极品装备的时机到了!",txthdTime="23:00-23:30",txtlevel="无",award={"59000","69000","20439","20436","10141","10140","10139","15058"},txthdRemind="tx104"};
	["hd25"]={txthdName="麒麟圣殿",txthdMap="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[九霄套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",txthdTime="23:45-23:50",txtlevel="45",award={"59000","69000","20439","20436","10141","10140","15037","15036"},txthdRemind="tx105"};
	};

local boss_data={
	["Boss1"]={txtBossName="诺玛教主",txtBossMap="诺玛寺庙",time="15分钟",mapid="wmsm1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss2"]={txtBossName="嗜血毒虫",txtBossMap="邪恶洞穴",time="15分钟",mapid="wgd1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss3"]={txtBossName="邪恶蛇蝎",txtBossMap="猪妖巢穴",time="15分钟",mapid="zhudong1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss4"]={txtBossName="猛犸教主",txtBossMap="猛犸神殿",time="15分钟",mapid="zuma1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss5"]={txtBossName="魔魂教主",txtBossMap="魔魂殿",time="15分钟",mapid="fengmo1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss6"]={txtBossName="蛮牛王",txtBossMap="蛮牛大殿",time="15分钟",mapid="niumo1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss7"]={txtBossName="妖月金刚",txtBossMap="妖月峡谷",time="15分钟",mapid="chiyue1",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	["Boss8"]={txtBossName="妖月血魔",txtBossMap="妖月峡谷",time="15分钟",mapid="chiyue2",
					award={"20403","20400","10209","10180","10138","10137","10136","10135"},
					txtaward="天地套装(45级)<br>流云套装(50级)<br>承风套装(55级)"};
	};



	local boss2_data={
	["mBoss1"]={txtBossName="诺玛教皇",txtBossMap="炼狱三层",time="60分钟",mapid="wmsm4",
					award={"69000","49000","99000","109000","10139","10138","10209","10180"},
					txtaward="紫金套装(60级)<br>神武套装(65级)"};
	["mBoss2"]={txtBossName="邪龙神",txtBossMap="邪龙谷",time="60分钟",mapid="wgd6",
					award={"69000","49000","99000","109000","10139","10138","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）"};
	["mBoss3"]={txtBossName="变异蛇蝎王",txtBossMap="猪妖魔窟",time="60分钟",mapid="zhudong5",
					award={"69000","49000","99000","109000","10139","10138","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）"};
	["mBoss4"]={txtBossName="猛犸教皇",txtBossMap="猛犸后宫",time="60分钟",mapid="zuma6",
					award={"69000","49000","99000","109000","10139","10138","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）"};
	["mBoss5"]={txtBossName="牛魔圣君",txtBossMap="蛮牛神殿",time="60分钟",mapid="niumo5",
					award={"69000","49000","99000","109000","10139","10138","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）"};
	["mBoss6"]={txtBossName="武威战神",txtBossMap="武威殿",time="60分钟",mapid="wwsd",
					award={"69000","49000","99000","109000","10140","10139","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）<br>天帝套装（70级）"};
	["mBoss7"]={txtBossName="烈焰法神",txtBossMap="烈焰殿",time="60分钟",mapid="lysd",
					award={"69000","49000","99000","109000","10140","10139","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）<br>天帝套装（70级）"};
	["mBoss8"]={txtBossName="无极天尊",txtBossMap="无极殿",time="60分钟",mapid="wjsd",
					award={"69000","49000","99000","109000","10140","10139","10209","10180"},
					txtaward="紫金套装（60级）<br>神武套装（65级）<br>天帝套装（70级）"};
	["mBoss9"]={txtBossName="人马教主",txtBossMap="人马宫殿",time="60分钟",mapid="jlsk4",
					award={"59000","69000","49000","99000","109000","10141","10140","10139"},
					txtaward="天帝套装（70级）<br>赤焰套装（75级）<br>九霄套装（80级）"};
	["mBoss10"]={txtBossName="混沌魔君",txtBossMap="混沌之门",time="60分钟",mapid="hund4",
					award={"59000","69000","49000","99000","109000","10141","10140","10139"},
					txtaward="天帝套装（70级）<br>赤焰套装（75级）<br>九霄套装（80级）"};
	["mBoss11"]={txtBossName="冰封魔兽",txtBossMap="雪域冰窟",time="60分钟",mapid="bfxy4",
					award={"59000","69000","49000","99000","109000","10141","10140","10139"},
					txtaward="天帝套装（70级）<br>赤焰套装（75级）<br>九霄套装（80级）"};
	};

	local boss3_data = {
	["bBoss1"]={txtBossName="武威战神",txtBossMap="武威殿",time="60分钟",mapid="wwsd",
					award={"69000","49000","99000","109000","10140","10139","10209","10180"},
					txtaward="天帝套装（70级）<br>赤焰套装（75级）<br>九霄套装（80级）"};
	["bBoss2"]={txtBossName="烈焰法神",txtBossMap="烈焰殿",time="60分钟",mapid="lysd",
					award={"69000","49000","99000","109000","10140","10139","10209","10180"},
					txtaward="天帝套装（70级）<br>赤焰套装（75级）<br>九霄套装（80级）"};
	["bBoss3"]={txtBossName="无极天尊",txtBossMap="无极殿",time="60分钟",mapid="wjsd",
					award={"69000","49000","99000","109000","10140","10139","10209","10180"},
					txtaward="天帝套装（70级）<br>赤焰套装（75级）<br>九霄套装（80级）"};
	["bBoss4"]={txtBossName="人马教主",txtBossMap="人马宫殿",time="60分钟",mapid="jlsk4",
					award={"59000","69000","49000","99000","109000","10141","10140","10139"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss5"]={txtBossName="混沌魔君",txtBossMap="混沌之门",time="60分钟",mapid="hund4",
					award={"59000","69000","49000","99000","109000","10141","10140","10139"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss6"]={txtBossName="冰封魔兽",txtBossMap="雪域冰窟",time="60分钟",mapid="bfxy4",
					award={"59000","69000","49000","99000","109000","10141","10140","10139"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss7"]={txtBossName="烈焰天魔",txtBossMap="熔岩石穴",time="120分钟",mapid="dyry4",
					award={"59000","69000","20439","20436","10141","10140","10139","15058"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss8"]={txtBossName="地狱恶魔",txtBossMap="地狱深渊",time="120分钟",mapid="swxc4",
					award={"59000","69000","20439","20436","10141","10140","10139","15058"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss9"]={txtBossName="亘古魔王",txtBossMap="神庙废墟",time="120分钟",mapid="zzzd4",
					award={"59000","69000","20439","20436","10141","10140","10139","15058"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss10"]={txtBossName="天威魔帝",txtBossMap="天威魔域",time="120分钟",mapid="qshl4",
					award={"59000","69000","20439","20436","10141","10140","10139","15058"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	["bBoss11"]={txtBossName="远古大帝",txtBossMap="远古深渊",time="120分钟",mapid="ygsy4",
					award={"59000","69000","20439","20436","10141","10140","10139","15058"},
					txtaward="赤焰套装（75级）<br>九霄套装（80级）<br>修罗套装（85级）"};
	};

local fb_data = {
	["fb1"]={txtfbName="副本：诺玛神庙",txtfbLv="挑战副本、赢取装备、材料、经验",txtfbTime="45",award={"19001","19007","0","0","0","0","0","0"}};
	["fb2"]={txtfbName="副本：猛犸神庙",txtfbLv="挑战副本、赢取装备、材料、经验",txtfbTime="50",award={"19001","19007","0","0","0","0","0","0"}};
	["fb3"]={txtfbName="副本：蛮牛大殿",txtfbLv="挑战副本、赢取装备、材料、经验",txtfbTime="55",award={"19001","19007","0","0","0","0","0","0"}};
	["fb4"]={txtfbName="副本：妖月巢穴",txtfbLv="挑战副本、赢取装备、材料、经验",txtfbTime="60",award={"19001","19007","0","0","0","0","0","0"}};
	["fb5"]={txtfbName="副本：人马宫殿",txtfbLv="挑战副本、赢取装备、材料、经验",txtfbTime="65",award={"19001","19007","0","0","0","0","0","0"}};
	["fb6"]={txtfbName="副本：混沌魔域",txtfbLv="挑战副本、赢取装备、材料、经验",txtfbTime="70",award={"19001","19007","0","0","0","0","0","0"}};
	["fb7"]={txtfbName="除妖降魔",txtfbLv="苍茫大地,妖魔四起,值此乱世之秋,希望你能尽自己的一份绵薄之力以造福苍生!你愿意帮助我降妖除魔吗?",txtfbTime="40",award={"19001","19010","0","0","0","0","0","0"}};
	["fb8"]={txtfbName="擒贼擒王",txtfbLv="百年前的那场大战.伤及我百姓无数.此仇永世不共戴天!为了彻底摧毁它们的残余势力.现需要你去消灭它们的首领!少侠现在就上路吧!",txtfbTime="45",award={"19001","19010","19009","0","0","0","0","0"}};
	["fb9"]={txtfbName="闯通天塔",txtfbLv="闯塔说明:1. 每三层通天塔都将会出现一个BOSS守关!2. 每通关三层通天塔都将获得大量的经验!",txtfbTime="50",award={"19001","19011","0","0","0","0","0","0"}};
	["fb10"]={txtfbName="押运镖车",txtfbLv="等级越高,经验越多押镖令在副本和BOSS获得运镖提醒: 镖车被劫只可获得[60%]的经验",txtfbTime="45",award={"19001","19007","0","0","0","0","0","0"}};
	["fb11"]={txtfbName="喝酒烤火",txtfbLv="等级越高,经验越多女儿红在副本和BOSS获得，饮酒提醒饮酒后需要在土城安全区才可获得经验",txtfbTime="45",award={"19001","0","0","0","0","0","0","0"}};
	["fb12"]={txtfbName="勇闯魔塔",txtfbLv=" 镇魔塔每层奖励:超大量经验镇魔塔终极奖励:四品玄铁 2块镇魔塔闯关规则: 杀完怪物才可进下层",txtfbTime="无",award={"19001","0","0","0","0","0","0","0"}};
	["fb13"]={txtfbName="百花争艳",txtfbLv="人们总说我人比花娇!少侠,此事你怎么看?好吧!看你也说不出个所以然.那你去帮我摘点花回来,我自有判断!",txtfbTime="45",award={"19007","0","0","0","0","0","0","0"}};
	["fb14"]={txtfbName="矿区采矿",txtfbLv="采矿出售可以获得大量的金币,是本服务器主要金币来源之一!每种矿石的价格可都一样哦!",txtfbTime="40",award={"19007","0","0","0","0","0","0","0"}};
};

function gettimesinfo(player)
	local x = 10;
	local y = 6;
	local m=util.ppn(player,const.PP_RICHANG_NUM);
	local n=util.ppn(player,const.PP_RICHANG2_NUM);
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		x=11;y=7;
		m=util.ppn(player,const.PP_RICHANG_NUM)+1;
		n=util.ppn(player,const.PP_RICHANG2_NUM)+1;
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes1","htmlText",""..(util.ppn(player,const.PP_RAIN_SEXP_NUM1) ).."");--诺玛神庙当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes2","htmlText",""..(util.ppn(player,const.PP_RAIN_SEXP_NUM2) ).."");--猛犸神殿当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes3","htmlText",""..(util.ppn(player,const.PP_RAIN_SEXP_NUM3) ).."");--蛮牛大殿当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes4","htmlText",""..(util.ppn(player,const.PP_RAIN_SEXP_NUM4) ).."");--妖月巢穴当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes5","htmlText",""..(util.ppn(player,const.PP_RAIN_SEXP_NUM5) ).."");--人马宫殿当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes6","htmlText",""..(util.ppn(player,const.PP_RAIN_SEXP_NUM6) ).. "");--混沌魔域当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes7","htmlText",m);--除魔降妖当前进度
	--print(util.ppn(player,const.PP_RICHANG_NUM));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes8","htmlText",n);--擒贼擒王当前进度
	--print(util.ppn(player,const.PP_RICHANG2_NUM));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes9","htmlText",""..util.ppn(player,const.PP_ZMT_NUM).."");--勇闯通天塔
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes10","htmlText",""..(util.ppn(player,const.PP_YABIAO_NUM) ) .."");--押运镖车当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes11","htmlText",""..(util.ppn(player,const.PP_JIU_NUM)).."");--喝酒烤火当前进度
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes12","htmlText",""..(util.ppn(player,const.PP_ZHENMOTACISHU)).."");--勇闯魔塔当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes13","htmlText",""..(util.ppn(player,const.PP_RICHANG3_NUM)).."");--百花争艳当前进度
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes14","htmlText",x);--除魔降妖总次数
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txttimes15","htmlText",y);--擒贼擒王总次数
	end


function gethdinfo(player)
	local t = tonumber(os.date("%H%M",os.time()));
	if t>1000 and t<1029 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd1","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo1","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo1","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname1","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel1","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime1","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward1","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline1","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo1","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo1","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname1","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel1","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime1","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward1","color","16777215");
	end
	if t==1015 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd2","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo2","text","已开放");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo2","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname2","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel2","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime2","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward2","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline2","visible","true");

	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo2","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo2","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname2","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel2","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime2","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward2","color","16777215");
	end
	if t>1030 and t<1059 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd3","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo3","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo3","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname3","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel3","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime3","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward3","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline3","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo3","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo3","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname3","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel3","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime3","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward3","color","16777215");
	end
	if t>1115 and t<1144 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd4","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo4","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo4","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname4","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel4","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime4","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward4","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline4","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo4","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo4","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname4","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel4","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime4","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward4","color","16777215");
	end
	if t>1200 and t<1229 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd5","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo5","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo5","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname5","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel5","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime5","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward5","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline5","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo5","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo5","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname5","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel5","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime5","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward5","color","16777215");
	end
	if t>1245 and t<1249 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd6","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo6","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo6","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname6","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel6","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime6","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward6","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline6","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo6","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo6","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname6","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel6","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime6","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward6","color","16777215");
	end
	if t>1300 and t<1359 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd7","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo7","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo7","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname7","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel7","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime7","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward7","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline7","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo7","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo7","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname7","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel7","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime7","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward7","color","16777215");
	end
	if t==1415 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd8","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo8","text","已开放");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo8","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname8","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel8","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime8","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward8","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline8","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo8","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo8","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname8","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel8","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime8","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward8","color","16777215");
	end
	if t>1430 and t<1459 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd9","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo9","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo9","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname9","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel9","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime9","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward9","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline9","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo9","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo9","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname9","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel9","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime9","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward9","color","16777215");
	end
	if t>1500 and t<1559 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd10","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo10","text","已开放");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo10","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname10","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel10","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime10","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward10","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline10","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo10","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo10","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname10","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel10","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime10","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward10","color","16777215");
	end
	if t>1615 and t<1644 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd11","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo11","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo11","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname11","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel11","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime11","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward11","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline11","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo11","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo11","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname11","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel11","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime11","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward11","color","16777215");
	end
	if t>1700 and t<1729 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd12","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo12","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo12","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname12","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel12","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime12","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward12","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline12","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo12","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo12","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname12","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel12","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime12","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward12","color","16777215");
	end
	if t==1715 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd13","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo13","text","已开放");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo13","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname13","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel13","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime13","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward13","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline13","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo13","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo13","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname13","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel13","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime13","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward13","color","16777215");
	end
	if t>1730 and t<1759 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd14","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo14","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo14","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname14","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel14","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime14","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward14","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline14","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo14","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo14","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname14","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel14","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime14","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward14","color","16777215");
	end
	if t>1800 and t<1829 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd15","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo15","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo15","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname15","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel15","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime15","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward15","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline15","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo15","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo15","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname15","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel15","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime15","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward15","color","16777215");
	end
	if t>1845 and t<1849 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd16","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo16","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo16","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname16","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel16","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime16","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward16","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline16","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo16","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo16","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname16","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel16","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime16","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward16","color","16777215");
	end
	if t>1900 and t<1929 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd17","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo17","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo17","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname17","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel17","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime17","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward17","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline17","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo17","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo17","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname17","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel17","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime17","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward17","color","16777215");
	end
	if t>1900 and t<2259 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd18","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo18","text","已开放");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo18","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname18","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel18","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime18","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward18","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline18","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo18","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo18","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname18","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel18","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime18","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward18","color","16777215");
	end
	if t>2000 and t<2129 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd19","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo19","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo19","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname19","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel19","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime19","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward19","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline19","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo19","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo19","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname19","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel19","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime19","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward19","color","16777215");
	end
	if t>2030 and t<2059 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd20","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo20","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo20","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname20","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel20","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime20","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward20","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline20","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo20","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo20","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname20","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel20","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime20","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward20","color","16777215");
	end
	if t>2145 and t<2149 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd21","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo21","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo21","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname21","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel21","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime21","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward21","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline21","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo21","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo21","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname21","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel21","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime21","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward21","color","16777215");
	end
	if t>2200 and t<2229 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd22","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo22","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo22","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname22","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel22","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime22","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward22","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline22","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo22","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo22","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname22","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel22","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime22","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward22","color","16777215");
	end
	if t>2215 and t<2244 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd23","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo23","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo23","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname23","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel23","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime23","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward23","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline23","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo23","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo23","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname23","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel23","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime23","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward23","color","16777215");
	end
	if t>2300 and t<2329 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd24","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo24","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo24","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname24","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel24","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime24","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward24","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline24","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo24","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo24","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname24","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel24","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime24","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward24","color","16777215");
	end
	if t>2345 and t<2349 then
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"hd25","picid","1006");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo25","text","前往");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo25","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname25","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel25","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime25","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward25","color","65280");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdline25","visible","true");
	else
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo25","text","已关闭");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdgo25","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdname25","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdlevel25","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdtime25","color","16777215");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hdaward25","color","16777215");
	end
end

function gettask(player)
	if (const.RAIN_SEXP_MAX_NUM1 - util.ppn(player,const.PP_RAIN_SEXP_NUM1)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo1","visible","false");
	end
	if (const.RAIN_SEXP_MAX_NUM2 - util.ppn(player,const.PP_RAIN_SEXP_NUM2)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo2","visible","false");
	end
	if (const.RAIN_SEXP_MAX_NUM3 - util.ppn(player,const.PP_RAIN_SEXP_NUM3)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo3","visible","false");
	end
	if (const.RAIN_SEXP_MAX_NUM4 - util.ppn(player,const.PP_RAIN_SEXP_NUM4)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo4","visible","false");
	end
	if (const.RAIN_SEXP_MAX_NUM5 - util.ppn(player,const.PP_RAIN_SEXP_NUM5)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo5","visible","false");
	end
	if (const.RAIN_SEXP_MAX_NUM6 - util.ppn(player,const.PP_RAIN_SEXP_NUM6)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo6","visible","false");
	end
	if(const.RICHANG_MAX_NUM - util.ppn(player,const.PP_RICHANG_NUM)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo7","visible","false");
	end
	if(const.RICHANG2_MAX_NUM - util.ppn(player,const.PP_RICHANG2_NUM)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo8","visible","false");
	end
	if(const.ZMT_MAX_NUM-util.ppn(player,const.PP_ZMT_NUM)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo9","visible","false");
	end
	if(const.YABIAO_MAX_NUM - util.ppn(player,const.PP_YABIAO_NUM)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo10","visible","false");
	end
	if(const.JIU_MAX_NUM-util.ppn(player,const.PP_JIU_NUM)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo11","visible","false");
	end
	if(util.ppn(player,const.PP_ZHENMOTACISHU)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo12","visible","false");
	end
	if (const.RICHANG3_MAX_NUM - util.ppn(player,const.PP_RICHANG3_NUM)==0) then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fbgo13","visible","false");
	end
end


function onTalknmsm1(player)
	if  player:get_level()>= 15 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去诺玛寺庙??还是15级以后再去吧!");
	end
end

function onTalkxedx2(player)
	if  player:get_level()>= 20 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去邪恶洞穴??还是20级以后再去吧!");

	end
end

function onTalkzycx3(player)
	if  player:get_level()>= 25 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猪妖洞??还是25级以后再去吧!");
	end
end

function onTalkmmsd4(player)
	if  player:get_level()>= 30 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猛犸寺庙??还是30级以后再去吧!");
	end
end

function onTalkmohd5(player)
	if  player:get_level()>= 30 then
		player:enter_map("fengmo1",179,173);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去魔魂殿??还是30级以后再去吧!");
	end
end

function onTalkmmdd6(player)
	if  player:get_level()>= 35 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去蛮牛洞??还是35级以后再去吧!");
	end
end

function onTalkyyxg7(player)
	if  player:get_level()>= 40 then
		player:enter_map("chiyue1",214,41);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去妖月峡谷??还是40级以后再去吧!");
	end
end

function onTalknmhg8d(player)
	if  player:get_level()>= 45 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>诺玛后宫</font>]需从[<font color='#ff0000'>诺玛神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去诺玛后宫??还是45级以后再去吧!");
	end
end

function onTalkxelg9d(player)
	if  player:get_level()>= 45 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>邪龙谷</font>]需从[<font color='#ff0000'>邪恶之谷</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去邪龙谷??还是45级以后再去吧!");
	end
end

function onTalkzymk10d(player)
	if  player:get_level()>= 45 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>猪妖魔窟</font>]需从[<font color='#ff0000'>猪妖巢穴</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去猪妖魔窟??还是45级以后再去吧!");
	end
end

function onTalkmmhg11d(player)
	if  player:get_level()>= 45 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>猛犸后宫</font>]需从[<font color='#ff0000'>猛犸神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去猛犸后宫??还是45级以后再去吧!");
	end
end

function onTalkmnsd12d(player)
	if  player:get_level()>= 45 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>蛮牛圣殿</font>]需从[<font color='#ff0000'>蛮牛大殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去蛮牛圣殿??还是45级以后再去吧!");
	end
end

function onTalkjlsk14f(player)
	if  player:get_level()>= 45 then
		player:enter_map("jlsk1",19,92);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去人马宫殿??还是45级以后再去吧!");
	end
end

function onTalkhdzm15f(player)
	if  player:get_level()>= 45 then
		player:enter_map("hund1",237,232);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去混沌之门??还是45级以后再去吧!");
	end
end

function onTalkbfxy16f(player)
	if  player:get_level()>= 45 then
		player:enter_map("bfxy1",196,57);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去雪域冰窟??还是45级以后再去吧!");
	end
end

function onTalkdyry18(player)
	if  player:get_level()>= 45 then
		player:enter_map("dyry1",15,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去熔岩石穴??还是45级以后再去吧!");
	end
end

function onTalklrxg19g(player)
	if  player:get_level()>= 45 then
		player:enter_map("swxc1",23,230);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去地狱深渊??还是45级以后再去吧!");
	end
end

function onTalkwssd(player)
	if  player:get_level()>= 45 then
		player:enter_map("wwsd",31,39);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去武威殿??还是45级以后再去吧!");
	end
end

function onTalklysd(player)
	if  player:get_level()>= 45 then
		player:enter_map("lysd",31,39);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去烈焰殿??还是45级以后再去吧!");
	end
end

function onTalkwjsd(player)
	if  player:get_level()>= 45 then
		player:enter_map("wjsd",31,39);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去无极殿??还是45级以后再去吧!");
	end
end

function onTalkzzd1(player)
	if  player:get_level()>= 45 then
		player:enter_map("zzzd1",75,212);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去神庙废墟??还是45级以后再去吧!");
	end
end

function onTalkqshl1(player)
	if  player:get_level()>= 45 then
		player:enter_map("qshl1",71,185);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去天威魔域??还是45级以后再去吧!");
	end
end

function onTalkqygsy1(player)
	if  player:get_level()>= 45 then
		player:enter_map("ygsy1",46,102);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去远古深渊??还是45级以后再去吧!");
	end
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
function onTalkjrbhdao(npc,player)----冰火岛
	if server.get_temp_var("BHDAO") == "1" then
		if player:get_level() >= 50 then
			player:enter_map("binghuodao",13,141);

			--统计活跃度--
			player:set_param(const.PP_HUOYUEDU_NUM9,util.ppn(player,const.PP_HUOYUEDU_NUM9)+1);
			if util.ppn(player,const.PP_HUOYUEDU_NUM9)==2 then
				player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			end

			go.givehuicheng(player);
			if util.ppn(player,const.PP_JINRUBHDAO) ~= hour() then
				player:set_param(const.PP_JINRUBHDAO,hour());
			  --server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入了冰火岛!");
			end
		else
		player:alert(1,1,"想要进入冰火岛?你还是先到50级再说吧!!");
		end
	else
	player:alert(1,1,"对不起,冰火岛活动还没有开启,暂时无法进入!");
	end
end

function onTalkswjdhelp(player)---死亡禁地
	if server.get_temp_var("swjd") == "1" then
		if player:get_level() >= 45 then
			player:enter_map("swjd1",217,226);
			go.givehuicheng(player);
		else
		player:alert(1,1,"由于死亡禁地过于凶险,你还是[45级]以后再进入吧!");
		end
	else
		player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!<br>开启时间:11点15分,16点15分,22点15分");
	end
end

function onTalkhcbzhelp(player)---皇城宝藏
	if server.get_temp_var("HCBZ") == "1" then
		if player:get_level() >= 50 then
			player:enter_map("hcbz",45,135);

			--统计活跃度--
			player:set_param(const.PP_HUOYUEDU_NUM10,util.ppn(player,const.PP_HUOYUEDU_NUM10)+1);
			if util.ppn(player,const.PP_HUOYUEDU_NUM10)==2 then
				player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			end 
			
			go.givehuicheng(player);
		else
		player:alert(1,1,"进入皇城宝藏地图需要达到[50级]!");
		end
	else
		player:alert(1,1,"对不起,目前[皇城宝藏]尚未打开!<br>开启时间:16点15分!");
	end
end

function onTalkwlzb(player)---武林争霸
	if server.get_temp_var("wlzb") == "2" then
			player:alert(1,1,"武林争霸活动已经开始,入口已经关闭");
	else
		if player:get_map() and player:get_map():get_id() == "wlzb" then
			player:alert(1,1,"你已经在武林争霸大厅咯!!");
		else
			if server.get_temp_var("wlzb") == "1" then
				if player:get_level() >= 40 then
				local map = server.find_map("wlzb");
					local x,y;
					x,y=map:gen_rand_position();
					if( x and y )then
						player:enter_map("wlzb",x,y);
					end
					player:alert(1,1,"武林争霸赛将于[13:10]正式开始!请做好准备!")
					server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了武林争霸大厅!");
				else
				player:alert(1,1,"对不起,参与武林争霸活动需要达到40级!");
				end
			else
				player:alert(1,1,"现在不是报名时间,请到报名时间再来找我吧!");
			end
		end
	end
end

function onTalkjrqlsd7(player)---麒麟圣殿
	if server.get_temp_var("qlsd") == "1" then
		if player:get_level() >= 45 then
			local map = server.find_map("qlsd");
			local x,y;
			x,y=map:gen_rand_position();
			if( x and y )then
				player:enter_map("qlsd",x,y);
				go.givehuicheng(player);
			end
		else
		player:alert(1,1,"由于麒麟圣殿过于凶险,您还是[45级]以后再进入吧!");
		end
	else
		player:alert(1,1,"对不起,目前[麒麟圣殿]入口尚未打开!");
	end
end

--------------------------------------------------------------------------------------
function onTalkrywc(player)
	if player:get_level() >= 35 then
		player:enter_map("v005",57,103);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去王城??还是35级以后再去吧!");
	end
end

function ActEntersqbg(player)
	if player:get_level() >= 45 then
		if player:get_map() and player:get_map():get_id() == "sqbg" then
			player:alert(1,1,"你已经在神器宝阁!!");
		else
			local map = server.find_map("sqbg");
			local x,y;
			x,y=map:gen_rand_position();
			if( x and y )then
				player:enter_map("sqbg",x,y);
				go.givehuicheng(player);
			end
		end
	else
		player:alert(1,1,"进入神器宝阁需要等级达到45级以上");
	end
end

function ActEnterwenquan(player)
	if tonumber(server_start_day()) >= 1 then
		local h = os.date("%H%M",os.time());
		if tonumber(h) >= 1200 and tonumber(h) <= 1229 or tonumber(h) >= 1800 and tonumber(h) <= 1829 or server.get_temp_var("wenquan") == "1" then
			if player:get_level() >= 40 then
				local map = server.find_map("wenquan");
				local x,y;
				x,y=map:gen_rand_position();
				if( x and y )then
					player:enter_map("wenquan",x,y);
					go.givehuicheng(player);
				end
			else
				player:alert(1,1,"想要泡温泉?你还是先到40级再说吧!!");
			end
		else
			player:alert(1,1,"温泉馆只在中午[12:00-12:30]和下午[18:00-18:30]营业哦!");
		end
	else
		player:alert(1,1,"[温泉馆]将于明天正式开始营业哦!届时欢迎您的大驾光临!!");
	end
end


function onTalksmzc(player)---神魔战场
	player:enter_map("vtc",57,108);
end

function onTalkwczb(player)----王城争霸
		player:enter_map("v002",89,35);
end
--------------------------------------------------------------------------------------
function onTalkckqy(player)
	if  player:get_level()>= 40 then
		player:enter_map("jsd2",20,92);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去采矿??还是40级以后再说吧!");
	end
end

function onClickandFresh(player,actionset,panelid,actionid)
	if actionid == "hdgo1" then onTalkjrbhdao(npc,player);end---冰火岛
	--if actionid == "hdgo2" end--送财童子
	if actionid == "hdgo3" then ActEntersqbg(player);end--天魔兽来袭
	if actionid == "hdgo4" then onTalkswjdhelp(player);end--死亡禁地
	if actionid == "hdgo5" then ActEnterwenquan(player);end---泡温泉
	if actionid == "hdgo6" then onTalkjrqlsd7(player);end---麒麟圣殿
	if actionid == "hdgo7" then onTalkwlzb(player);end----武林争霸
	--if actionid == "hdgo8" end---送财童子
	if actionid == "hdgo9" then ActEntersqbg(player);end--天魔兽来袭
	--if actionid == "hdgo10" end--双倍经验
	if actionid == "hdgo11" then onTalkhcbzhelp(player);end----皇城宝藏
	if actionid == "hdgo12" then onTalkjrbhdao(npc,player);end---冰火岛
	--if actionid == "hdgo13" end---送财童子
	if actionid == "hdgo14" then ActEntersqbg(player);end--天魔兽来袭
	if actionid == "hdgo15" then ActEnterwenquan(player);end---泡温泉
	if actionid == "hdgo16" then onTalkjrqlsd7(player);end---麒麟圣殿
	if actionid == "hdgo17" then onTalksmzc(player);end---神魔战场
	--if actionid == "hdgo18" end---双倍经验
	if actionid == "hdgo19" then onTalkwczb(player);end---王城争霸
	if actionid == "hdgo20" then onTalkrywc(player);end---怪物攻城
	if actionid == "hdgo21" then onTalkjrqlsd7(player);end--麒麟圣殿
	if actionid == "hdgo22" then onTalkjrbhdao(npc,player);end---冰火岛
	if actionid == "hdgo23" then onTalkswjdhelp(player);end---死亡禁地
	if actionid == "hdgo24" then onTalkrywc(player);end--怪物攻城
	if actionid == "hdgo25" then onTalkjrqlsd7(player);end---麒麟圣殿


	if actionid == "bossgo1" then onTalknmsm1(player);end
	if actionid == "bossgo2" then onTalkxedx2(player);end
	if actionid == "bossgo3" then onTalkzycx3(player);end
	if actionid == "bossgo4" then onTalkmmsd4(player);end
	if actionid == "bossgo5" then onTalkmohd5(player);end
	if actionid == "bossgo6" then onTalkmmdd6(player);end
	if actionid == "bossgo7" then onTalkyyxg7(player);end
	if actionid == "bossgo8" then onTalkyyxg7(player);end
	if actionid == "bossgo9" then onTalknmhg8d(player);end
	if actionid == "bossgo10" then onTalkxelg9d(player);end
	if actionid == "bossgo11" then onTalkzymk10d(player);end
	if actionid == "bossgo12" then onTalkmmhg11d(player);end
	if actionid == "bossgo13" then onTalkmnsd12d(player);end
	if actionid == "bossgo14" then onTalkwssd(player);end
	if actionid == "bossgo15" then onTalklysd(player);end
	if actionid == "bossgo16" then onTalkwjsd(player);end
	if actionid == "bossgo17" then onTalkjlsk14f(player);end
	if actionid == "bossgo18" then onTalkhdzm15f(player);end
	if actionid == "bossgo19" then onTalkbfxy16f(player);end
	if actionid == "bossgo20" then onTalkdyry18(player);end
	if actionid == "bossgo21" then onTalklrxg19g(player);end
	if actionid == "bossgo22" then onTalkzzd1(player);end
	if actionid == "bossgo23" then onTalkqshl1(player);end
	if actionid == "bossgo24" then onTalkqygsy1(player);end
	if actionid == "bossgo25" then onTalkwssd(player);end
	if actionid == "bossgo26" then onTalklysd(player);end
	if actionid == "bossgo27" then onTalkwjsd(player);end
	if actionid == "bossgo28" then onTalkjlsk14f(player);end
	if actionid == "bossgo29" then onTalkhdzm15f(player);end
	if actionid == "bossgo30" then onTalkbfxy16f(player);end


	if actionid == "fbgo1" then moveto(player,"vtc",90,125,"副本使者");end
	if actionid == "fbgo2" then moveto(player,"vtc",90,125,"副本使者");end
	if actionid == "fbgo3" then moveto(player,"vtc",90,125,"副本使者");end
	if actionid == "fbgo4" then moveto(player,"vtc",90,125,"副本使者");end
	if actionid == "fbgo5" then moveto(player,"vtc",90,125,"副本使者");end
	if actionid == "fbgo6" then moveto(player,"vtc",90,125,"副本使者");end
	if actionid == "fbgo7" then moveto(player,"vtc",41,115,"伏魔使者");end
	if actionid == "fbgo8" then moveto(player,"vtc",86,109,"赏金猎人");end
	if actionid == "fbgo9" then moveto(player,"vtc",78,117,"通天塔使者");end
	if actionid == "fbgo10" then moveto(player,"vtc",23,115,"夏镖头");end
	if actionid == "fbgo11" then moveto(player,"vtc",69,113,"火堆");end
	if actionid == "fbgo12" then moveto(player,"v002",75,120,"镇魔塔");end--未配置位置
	if actionid == "fbgo13" then moveto(player,"v002",46,92,"百花仙子");end
	if actionid == "fbgo14" then onTalkckqy(player);end
	if hd_data[actionid] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthdName","text",hd_data[actionid].txthdName);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthdMap","htmlText",hd_data[actionid].txthdMap);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthdTime","text",hd_data[actionid].txthdTime);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthdlevel","text",hd_data[actionid].txtlevel);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthdRemind","across",hd_data[actionid].txthdRemind);
		for i=1,#hd_data[actionid].award do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"hditem"..i,"typeid",hd_data[actionid].award[i]);
		end
	end
	if boss_data[actionid] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtBossName","text",boss_data[actionid].txtBossName);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtBossMap","text",boss_data[actionid].txtBossMap);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtBossTime","text",boss_data[actionid].time);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtaward","htmlText",boss_data[actionid].txtaward)
		for i=1,#boss_data[actionid].award do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"bossitem"..i,"typeid",boss_data[actionid].award[i]);
		end
		--for i=1,#boss_data do
		--	local sx_data = boss_data["Boss"..i]
		--	local mapname=server:find_map(sx_data.mapid);
		--	if mapname.num_monster(sx_data.txtBossName)==0 then
		--		player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"text","未刷新");
		--	else
		--		player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"text","已刷新");
		--	end
		--end
	end

	if boss2_data[actionid] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mtxtBossName","text",boss2_data[actionid].txtBossName);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mtxtBossMap","text",boss2_data[actionid].txtBossMap);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mtxtBossTime","text",boss2_data[actionid].time);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mtxtaward","htmlText",boss2_data[actionid].txtaward);
	for i=1,#boss2_data[actionid].award do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mbossitem"..i,"typeid",boss2_data[actionid].award[i]);
		end
	end
	if boss3_data[actionid] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btxtBossName","text",boss3_data[actionid].txtBossName);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btxtBossMap","text",boss3_data[actionid].txtBossMap);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btxtBossTime","text",boss3_data[actionid].time);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btxtaward","htmlText",boss3_data[actionid].txtaward);
	for i=1,#boss3_data[actionid].award do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"bbossitem"..i,"typeid",boss3_data[actionid].award[i]);
		end
	end

	if fb_data[actionid] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtfbName","text",fb_data[actionid].txtfbName);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtfbLv","htmlText",fb_data[actionid].txtfbLv);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtfbTime","text",fb_data[actionid].txtfbTime);
		for i=1,#fb_data[actionid].award do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"itemfb"..i,"typeid",fb_data[actionid].award[i]);
		end
	end

	--if actionid=="btnGuide" then
		--for i=1,#boss_data[fb..i] do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"panellottery","panel_visible","true");
		for i=1,#boss_data do
			local sx_data = boss_data["Boss"..i]
			local mapname=server:find_map(sx_data.mapid);
			if mapname.num_monster(sx_data.txtBossName)==0 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"text","未刷新");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"color","12632256");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"text","已刷新");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"color","16776960");
			end
		end
	--end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
ckpanel.add_listener(ACTIONSET_NAME,onClickandFresh);

function moveto(player,map,x,y,name)
	player:find_road_goto(map,x,y,name);
end

function freshbosspanel(player)
for i=1,8 do
	local sx_data = boss_data["Boss"..i];
	local mapname=server.find_map(sx_data.mapid);
	if mapname then
		if mapname:num_monster(sx_data.txtBossName)==0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"text","未刷新");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"color","12632256");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"text","已刷新");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"shuaxin"..i,"color","16776960");
		end
	end
end
end

function freshmbosspanel(player)
for i=1,11 do
	local sx_data = boss2_data["mBoss"..i];
	local mapname=server.find_map(sx_data.mapid);
	if mapname then
		if mapname:num_monster(sx_data.txtBossName)==0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mshuaxin"..i,"text","未刷新");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mshuaxin"..i,"color","12632256");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mshuaxin"..i,"text","已刷新");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mshuaxin"..i,"color","16776960");
		end
	end
end
end

function freshbbosspanel(player)
for i=1,11 do
	local sx_data = boss3_data["bBoss"..i];
	local mapname=server.find_map(sx_data.mapid);
	if mapname then
		if mapname:num_monster(sx_data.txtBossName)==0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"bshuaxin"..i,"text","未刷新");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"bshuaxin"..i,"color","12632256");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"bshuaxin"..i,"text","已刷新");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"bshuaxin"..i,"color","16776960");
		end
	end
end
end

function openpoint(player)
		gettimesinfo(player);
		gethdinfo(player);
		freshbosspanel(player);
		freshmbosspanel(player);
		freshbbosspanel(player);
		gettask(player);
		player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end