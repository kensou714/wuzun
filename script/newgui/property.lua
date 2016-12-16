module(..., package.seeall)
local ACTIONSET_NAME="showproperty";
local PANEL_ACTIONSET_NAME="panelshowproperty";--角色属性面板
local MAX_ZUOQI_LV = 12;

local mount_data={
	["tmount1"]={lv=1,mount=2001,attr={attmin=6,attmax=10,defmin=3,defmax=5,nodef=1,fight=88,speed=4},},
	["tmount2"]={lv=2,mount=2002,attr={attmin=12,attmax=20,defmin=6,defmax=10,nodef=2,fight=176,speed=8},},
	["tmount3"]={lv=3,mount=2003,attr={attmin=24,attmax=40,defmin=9,defmax=15,nodef=4,fight=352,speed=12},},
	["tmount4"]={lv=4,mount=2004,attr={attmin=36,attmax=60,defmin=12,defmax=20,nodef=6,fight=496,speed=16},},
	["tmount5"]={lv=5,mount=2005,attr={attmin=48,attmax=80,defmin=15,defmax=25,nodef=9,fight=656,speed=20},},
	["tmount6"]={lv=6,mount=2006,attr={attmin=72,attmax=120,defmin=18,defmax=30,nodef=12,fight=961,speed=24},},
	["tmount7"]={lv=7,mount=2007,attr={attmin=96,attmax=160,defmin=21,defmax=35,nodef=15,fight=1264,speed=28},},
	["tmount8"]={lv=8,mount=2008,attr={attmin=132,attmax=220,defmin=24,defmax=40,nodef=20,fight=1712,speed=32},},
	["tmount9"]={lv=9,mount=2009,attr={attmin=192,attmax=320,defmin=27,defmax=45,nodef=30,fight=2448,speed=36},},
	["tmount10"]={lv=10,mount=2010,attr={attmin=288,attmax=480,defmin=30,defmax=50,nodef=40,fight=3616,speed=40},},
	["tmount11"]={lv=11,mount=2011,attr={attmin=408,attmax=680,defmin=42,defmax=70,nodef=55,fight=5120,speed=45},},
	["tmount12"]={lv=12,mount=2012,attr={attmin=600,attmax=1000,defmin=60,defmax=100,nodef=80,fight=7536,speed=50},},
};

local mount_type={
	[1]={id=2001,name="黑鬃马(1阶)",speed=130011,jh_exp=2000,need_exp=98731,key="tmount1"},
	[2]={id=2002,name="白良马(2阶)",speed=130012,jh_exp=2000,need_exp=197462,key="tmount2"},
	[3]={id=2003,name="赤红马(3阶)",speed=130013,jh_exp=2000,need_exp=394924,key="tmount3"},
	[4]={id=2004,name="斑斓虎(4阶)",speed=130014,jh_exp=2000,need_exp=789848,key="tmount4"},
	[5]={id=2005,name="苍云虎(5阶)",speed=130015,jh_exp=2000,need_exp=1579696,key="tmount5"},
	[6]={id=2006,name="啸天虎(6阶)",speed=130016,jh_exp=2000,need_exp=3159392,key="tmount6"},
	[7]={id=2007,name="震威战狮(7阶)",speed=130017,jh_exp=2000,need_exp=6318784,key="tmount7"},
	[8]={id=2008,name="血影雄狮(8阶)",speed=130018,jh_exp=2000,need_exp=12637568,key="tmount8"},
	[9]={id=2009,name="金甲圣狮(9阶)",speed=130019,jh_exp=2000,need_exp=25275136,key="tmount9"},
	[10]={id=2010,name="赤焰火麒麟(10阶)",speed=130020,jh_exp=2000,need_exp=50550272,key="tmount10"},
	[11]={id=2011,name="碧玉蓝麒麟(11阶)",speed=130021,jh_exp=2000,need_exp=101100544,key="tmount11"},
	[12]={id=2012,name="至尊金麒麟(12阶)",speed=130022,jh_exp=2000,need_exp=202201088,key="tmount12"},
};

function process_property(player,actionset,panelid,actionid,data)
	--铸魂
	if actionid == "btnsxtozhunhun" then
		fresh_sx_texiao(player);
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		return;
	end
	-----------------------------------镶嵌面板交互信息
	if actionid == "hecheng" then
		return;
		--XQxiangqian(player,tonumber(data[1]),tonumber(data[2]),tonumber(data[3]));return;
	end
	if actionid == "chaijie" then
		return;
		--XQcaichu(player,tonumber(data[1]));return;
	end
	if actionid == "freshXQpos" then
		return;
		--fresh_XQpos_needmoney(player,tonumber(data[1]));return;
	end
	if actionid == "freshXQitem" then
		return;
		--fresh_XQitem_needmoney(player,tonumber(data[1]));return;
	end
	---------------------------------心法--------------------------------
	if actionid == "btnXFts" then
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","2");
		XFtish(player);return;
	end
	if actionid == "btnXFhq" then
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","2");
		XFhuoqu(player);return;
	end
	if actionid == "btnYJxf" then
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","2");
		XFyjUp(player);return;
	end
	if string.sub(actionid,1,5) == "btnXF" then
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","2");
		fresh_XFinfo(player,actionid);return;
	end
	---------------------------------转生--------------------------------
	if actionid == "btnZS" then
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","3");
		ZSUp(player);return;
	end
	if actionid == "zhuansheng" then
		if newgui.jingcaihuodong.isOpenActivity(player,"qfzssd") or activity.isDoubleZhuanSheng() then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbs","text","* 2");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbs","text"," ");
		end
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_property);

-----------------------------------------坐骑面板--------------------------------------
function check_map_nomount(player)
	local a,b,c=player:get_mount_info();
	player:set_mount_info(0,0,0);
	player:set_mount_show(0);
end
-------------------------------------------转生--------------------------------------------
local rein_data={
	[0]={needlv=0,sublv=0,
		attr={hpmax=0,mpmax=0,xishou=0,dc=0,dcmax=0,mc=0,mcmax=0,sc=0,scmax=0},
	},
	[1]={needlv=80,sublv=10,
		attr={hpmax=5,mpmax=5,xishou=1,dc=6,dcmax=10,mc=6,mcmax=10,sc=6,scmax=10},
	},
	[2]={needlv=80,sublv=10,
		attr={hpmax=10,mpmax=10,xishou=2,dc=12,dcmax=20,mc=12,mcmax=20,sc=12,scmax=20},
	},
	[3]={needlv=80,sublv=10,
		attr={hpmax=15,mpmax=15,xishou=3,dc=18,dcmax=30,mc=18,mcmax=30,sc=18,scmax=30},
	},
	[4]={needlv=80,sublv=10,
		attr={hpmax=20,mpmax=20,xishou=4,dc=24,dcmax=40,mc=24,mcmax=40,sc=24,scmax=40},
	},
	[5]={needlv=80,sublv=10,
		attr={hpmax=25,mpmax=25,xishou=5,dc=30,dcmax=50,mc=30,mcmax=50,sc=30,scmax=50},
	},
};
--刷新转生模块的界面信息
function fresh_rein_info(player)
	local reinlv = player:get_rein_level();
	local r_data = rein_data[reinlv];
	if r_data then
		local attr_data = r_data.attr;
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property11","text",""..attr_data.hpmax.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property12","text",""..attr_data.mpmax.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property13","text",""..attr_data.xishou.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property14","text",""..attr_data.xishou.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property15","text",""..attr_data.dc.."-"..attr_data.dcmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property16","text",""..attr_data.mc.."-"..attr_data.mcmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"Property17","text",""..attr_data.sc.."-"..attr_data.scmax);
	end
	if reinlv >= 5 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNextProperties","visible","false");
	else
		local n_data = rein_data[reinlv+1];
		if n_data then
			local next_data = n_data.attr;
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property21","text",""..next_data.hpmax.."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property22","text",""..next_data.mpmax.."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property23","text",""..next_data.xishou.."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property24","text",""..next_data.xishou.."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property25","text",""..next_data.dc.."-"..next_data.dcmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property26","text",""..next_data.mc.."-"..next_data.mcmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"Property27","text",""..next_data.sc.."-"..next_data.scmax);
		end
	end

	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
--检测转生成功几率
function checkReinProb(player)
	local prob = 10;
	if player:get_vcoin_accu() <= 10000 then
		prob = 20;
	end
	if player:get_vcoin_accu() >= 10001 and player:get_vcoin_accu() <= 20000 then
		prob = 15;
	end
	local i = math.random(1,100);
	if i <= prob then
		player:echo("true");
	end
end
--转生成功后的触发
function onReinSuc(player)
	player:set_status(33,86400,player:get_rein_level(),1,1);
	fresh_rein_info(player);
end
-----------------------------------------人物属性--------------------------------------
--bgid编号可能不连续,所以建表存储
local vip_data={
	[0]={bgid=3006,tips="尚未开启VIP"},[1]={bgid=3007,tips="VIP1"},[2]={bgid=3008,tips="VIP2"},
	[3]={bgid=3009,tips="VIP3"},[4]={bgid=3010,tips="VIP4"},[5]={bgid=3011,tips="VIP5"},
	[6]={bgid=3012,tips="VIP6"},[7]={bgid=3013,tips="VIP7"},
};
local red_data={
	[0]={bgid=3095,tips="尚未激活红钻"},[1]={bgid=3096,tips="红钻1级"},[2]={bgid=3097,tips="红钻2级"},
	[3]={bgid=3098,tips="红钻3级"},[4]={bgid=3099,tips="红钻4级"},[5]={bgid=3100,tips="红钻5级"},
	[6]={bgid=3101,tips="红钻6级"},[7]={bgid=3102,tips="红钻7级"},[8]={bgid=3103,tips="红钻8级"},
	[9]={bgid=3104,tips="红钻9级"},[10]={bgid=3105,tips="红钻10级"},[11]={bgid=3106,tips="红钻11级"},[12]={bgid=3107,tips="红钻12级"},
};
local zq_data={
	[0]={bgid=3091,tips="尚未激活坐骑状态"},[1]={bgid=3109,tips="坐骑状态1级"},[2]={bgid=3110,tips="坐骑状态2级"},
	[3]={bgid=3111,tips="坐骑状态3级"},[4]={bgid=3112,tips="坐骑状态4级"},[5]={bgid=3113,tips="坐骑状态5级"},
	[6]={bgid=3114,tips="坐骑状态6级"},[7]={bgid=3115,tips="坐骑状态7级"},[8]={bgid=3116,tips="坐骑状态8级"},
	[9]={bgid=3117,tips="坐骑状态9级"},[10]={bgid=3118,tips="坐骑状态10级"},[11]={bgid=3119,tips="坐骑状态11级"},[12]={bgid=3120,tips="坐骑状态12级"},
	[13]={bgid=3293,tips="坐骑状态13级"},[14]={bgid=3291,tips="坐骑状态14级"},[15]={bgid=3292,tips="坐骑状态15级"},[16]={bgid=3292,tips="坐骑状态16级"},
};
local gz_data={
	[0]={bgid=3108,tips="尚未激活官职"},[1]={bgid=3123,tips="九品将兵都卫"},[2]={bgid=3124,tips="八品抚夷护军"},
	[3]={bgid=3125,tips="七品安夷护军"},[4]={bgid=3126,tips="六品讨寇校卫"},[5]={bgid=3127,tips="五品平寇校卫"},
	[6]={bgid=3128,tips="四品破虏将军"},[7]={bgid=3129,tips="三品平虏将军"},[8]={bgid=3130,tips="二品车骑将军"},
	[9]={bgid=3131,tips="一品骠骑将军"},[10]={bgid=3132,tips="抚国大将军"},[11]={bgid=3133,tips="镇国大将军"},[12]={bgid=3134,tips="兵马大元帅"},
	[13]={bgid=3286,tips="镇北玄武王"},[14]={bgid=3287,tips="镇西白虎王"},[15]={bgid=3288,tips="镇南朱雀王"},[16]={bgid=3289,tips="镇东青龙王"},
};
local xf_data={
	[0]={bgid=3227,tips="尚未激活心法"},[1]={bgid=3177,tips="1 级心法"},[2]={bgid=3178,tips="2 级心法"},[3]={bgid=3179,tips="3 级心法"},
	[4]={bgid=3180,tips="4 级心法"},[5]={bgid=3181,tips="5 级心法"},[6]={bgid=3182,tips="6 级心法"},[7]={bgid=3183,tips="7 级心法"},
	[8]={bgid=3184,tips="8 级心法"},[9]={bgid=3185,tips="9 级心法"},[10]={bgid=3186,tips="10级心法"},[11]={bgid=3187,tips="11级心法"},
	[12]={bgid=3188,tips="12级心法"},[13]={bgid=3189,tips="13级心法"},[14]={bgid=3190,tips="14级心法"},[15]={bgid=3191,tips="15级心法"},
	[16]={bgid=3192,tips="16级心法"},[17]={bgid=3193,tips="17级心法"},[18]={bgid=3194,tips="18级心法"},[19]={bgid=3195,tips="19级心法"},
	[20]={bgid=3196,tips="20级心法"},[21]={bgid=3197,tips="21级心法"},[22]={bgid=3198,tips="22级心法"},[23]={bgid=3199,tips="23级心法"},
	[24]={bgid=3200,tips="24级心法"},[25]={bgid=3201,tips="25级心法"},[26]={bgid=3202,tips="26级心法"},[27]={bgid=3203,tips="27级心法"},
	[28]={bgid=3204,tips="28级心法"},[29]={bgid=3205,tips="29级心法"},[30]={bgid=3206,tips="30级心法"},[31]={bgid=3207,tips="31级心法"},
	[32]={bgid=3208,tips="32级心法"},[33]={bgid=3209,tips="33级心法"},[34]={bgid=3210,tips="34级心法"},[35]={bgid=3211,tips="35级心法"},
	[36]={bgid=3212,tips="36级心法"},[37]={bgid=3213,tips="37级心法"},[38]={bgid=3214,tips="38级心法"},[39]={bgid=3215,tips="39级心法"},
	[40]={bgid=3216,tips="40级心法"},[41]={bgid=3217,tips="41级心法"},[42]={bgid=3218,tips="42级心法"},[43]={bgid=3219,tips="43级心法"},
	[44]={bgid=3220,tips="44级心法"},[45]={bgid=3221,tips="45级心法"},[46]={bgid=3222,tips="46级心法"},[47]={bgid=3223,tips="47级心法"},
	[48]={bgid=3224,tips="48级心法"},[49]={bgid=3225,tips="49级心法"},[50]={bgid=3226,tips="50级心法"},[51]={bgid=3265,tips="51级心法"},
	[52]={bgid=3266,tips="52级心法"},[53]={bgid=3267,tips="53级心法"},[54]={bgid=3268,tips="54级心法"},[55]={bgid=3269,tips="55级心法"},
	[56]={bgid=3270,tips="56级心法"},[57]={bgid=3271,tips="57级心法"},[58]={bgid=3272,tips="58级心法"},[59]={bgid=3273,tips="59级心法"},
	[60]={bgid=3274,tips="60级心法"},[61]={bgid=3275,tips="61级心法"},[62]={bgid=3276,tips="62级心法"},[63]={bgid=3277,tips="63级心法"},
	[64]={bgid=3278,tips="64级心法"},[65]={bgid=3279,tips="65级心法"},[66]={bgid=3280,tips="66级心法"},[67]={bgid=3281,tips="67级心法"},
	[68]={bgid=3282,tips="68级心法"},[69]={bgid=3283,tips="69级心法"},[70]={bgid=3284,tips="70级心法"},[71]={bgid=3479,tips="71级心法"},
	[72]={bgid=3480,tips="72级心法"},[73]={bgid=3481,tips="73级心法"},[74]={bgid=3482,tips="74级心法"},[75]={bgid=3483,tips="75级心法"},
	[76]={bgid=3484,tips="76级心法"},[77]={bgid=3485,tips="77级心法"},[78]={bgid=3486,tips="78级心法"},[79]={bgid=3487,tips="79级心法"},
	[80]={bgid=3488,tips="80级心法"},[81]={bgid=3489,tips="81级心法"},[82]={bgid=3490,tips="82级心法"},[83]={bgid=3491,tips="83级心法"},
	[84]={bgid=3492,tips="84级心法"},[85]={bgid=3493,tips="85级心法"},[86]={bgid=3494,tips="86级心法"},[87]={bgid=3495,tips="87级心法"},
	[88]={bgid=3496,tips="88级心法"},[89]={bgid=3497,tips="89级心法"},[90]={bgid=3498,tips="90级心法"},[91]={bgid=3499,tips="91级心法"},
	[92]={bgid=3500,tips="92级心法"},[93]={bgid=3501,tips="93级心法"},[94]={bgid=3502,tips="94级心法"},[95]={bgid=3503,tips="95级心法"},
	[96]={bgid=3504,tips="96级心法"},[97]={bgid=3505,tips="97级心法"},[98]={bgid=3506,tips="98级心法"},[99]={bgid=3507,tips="99级心法"},
	[100]={bgid=3508,tips="100级心法"},
};
------------------------------------心法界面-------------------------------------------
local xinfa_data={
	[1]={needxw=800 ,needlv=31,statusid=38,statuslv=1},
	[2]={needxw=1200,needlv=32,statusid=38,statuslv=2},
	[3]={needxw=1600,needlv=33,statusid=38,statuslv=3},
	[4]={needxw=2000,needlv=34,statusid=38,statuslv=4},
	[5]={needxw=2400,needlv=35,statusid=38,statuslv=5},
	[6]={needxw=5600,needlv=36,statusid=38,statuslv=6},
	[7]={needxw=6400,needlv=37,statusid=38,statuslv=7},
	[8]={needxw=7200,needlv=38,statusid=38,statuslv=8},
	[9]={needxw=8000,needlv=39,statusid=38,statuslv=9},
	[10]={needxw=8800,needlv=40 ,statusid=38,statuslv=10},
	[11]={needxw=19200,needlv=41,statusid=38,statuslv=11},
	[12]={needxw=20800,needlv=42,statusid=38,statuslv=12},
	[13]={needxw=22400,needlv=43,statusid=38,statuslv=13},
	[14]={needxw=24000,needlv=44,statusid=38,statuslv=14},
	[15]={needxw=25600,needlv=45,statusid=38,statuslv=15},
	[16]={needxw=40800,needlv=46,statusid=38,statuslv=16},
	[17]={needxw=43200,needlv=47,statusid=38,statuslv=17},
	[18]={needxw=45600,needlv=48,statusid=38,statuslv=18},
	[19]={needxw=48000,needlv=49,statusid=38,statuslv=19},
	[20]={needxw=50400,needlv=50,statusid=38,statuslv=20},
	[21]={needxw=66000,needlv=51,statusid=38,statuslv=21},
	[22]={needxw=69000,needlv=52,statusid=38,statuslv=22},
	[23]={needxw=72000,needlv=53,statusid=38,statuslv=23},
	[24]={needxw=75000,needlv=54 ,statusid=38,statuslv=24},
	[25]={needxw=104000,needlv=55,statusid=38,statuslv=25},
	[26]={needxw=108000,needlv=56,statusid=38,statuslv=26},
	[27]={needxw=112000,needlv=57,statusid=38,statuslv=27},
	[28]={needxw=116000,needlv=58,statusid=38,statuslv=28},
	[29]={needxw=120000,needlv=59,statusid=38,statuslv=29},
	[30]={needxw=160000,needlv=60,statusid=38,statuslv=30},
	[31]={needxw=170000,needlv=61,statusid=38,statuslv=31},
	[32]={needxw=180000,needlv=62,statusid=38,statuslv=32},
	[33]={needxw=190000,needlv=63,statusid=38,statuslv=33},
	[34]={needxw=200000,needlv=64,statusid=38,statuslv=34},
	[35]={needxw=252000,needlv=65,statusid=38,statuslv=35},
	[36]={needxw=264000,needlv=66,statusid=38,statuslv=36},
	[37]={needxw=276000,needlv=67,statusid=38,statuslv=37},
	[38]={needxw=288000,needlv=68,statusid=38,statuslv=38},
	[39]={needxw=300000,needlv=69,statusid=38,statuslv=39},
	[40]={needxw=364000,needlv=70,statusid=38,statuslv=40},
	[41]={needxw=378000,needlv=71,statusid=38,statuslv=41},
	[42]={needxw=392000,needlv=72,statusid=38,statuslv=42},
	[43]={needxw=406000,needlv=73,statusid=38,statuslv=43},
	[44]={needxw=420000,needlv=74,statusid=38,statuslv=44},
	[45]={needxw=496000,needlv=75,statusid=38,statuslv=45},
	[46]={needxw=512000,needlv=76,statusid=38,statuslv=46},
	[47]={needxw=528000,needlv=77,statusid=38,statuslv=47},
	[48]={needxw=544000,needlv=78,statusid=38,statuslv=48},
	[49]={needxw=560000,needlv=79,statusid=38,statuslv=49},
	[50]={needxw=864000,needlv=80,statusid=38,statuslv=50},
	[51]={needxw=864000,needlv=81,statusid=71,statuslv=1},
	[52]={needxw=864000,needlv=82,statusid=71,statuslv=2},
	[53]={needxw=864000,needlv=83,statusid=71,statuslv=3},
	[54]={needxw=864000,needlv=84,statusid=71,statuslv=4},
	[55]={needxw=864000,needlv=85,statusid=71,statuslv=5},
	[56]={needxw=864000,needlv=86,statusid=71,statuslv=6},
	[57]={needxw=864000,needlv=87,statusid=71,statuslv=7},
	[58]={needxw=864000,needlv=88,statusid=71,statuslv=8},
	[59]={needxw=864000,needlv=89,statusid=71,statuslv=9},
	[60]={needxw=864000,needlv=90,statusid=71,statuslv=10},
	[61]={needxw=864000,needlv=91,statusid=71,statuslv=11},
	[62]={needxw=864000,needlv=92,statusid=71,statuslv=12},
	[63]={needxw=864000,needlv=93,statusid=71,statuslv=13},
	[64]={needxw=864000,needlv=94,statusid=71,statuslv=14},
	[65]={needxw=864000,needlv=95,statusid=71,statuslv=15},
	[66]={needxw=864000,needlv=96,statusid=71,statuslv=16},
	[67]={needxw=864000,needlv=97,statusid=71,statuslv=17},
	[68]={needxw=864000,needlv=98,statusid=71,statuslv=18},
	[69]={needxw=864000,needlv=99,statusid=71,statuslv=19},
	[70]={needxw=864000,needlv=100,statusid=71,statuslv=20},
    [71]={needxw=1200000,needlv=100,statusid=71,statuslv=21},
    [72]={needxw=1200000,needlv=100,statusid=71,statuslv=22},
    [73]={needxw=1200000,needlv=100,statusid=71,statuslv=23},
    [74]={needxw=1200000,needlv=100,statusid=71,statuslv=24},
    [75]={needxw=1200000,needlv=100,statusid=71,statuslv=25},
    [76]={needxw=1200000,needlv=100,statusid=71,statuslv=26},
    [77]={needxw=1200000,needlv=100,statusid=71,statuslv=27},
    [78]={needxw=1200000,needlv=100,statusid=71,statuslv=28},
    [79]={needxw=1200000,needlv=100,statusid=71,statuslv=29},
    [80]={needxw=1200000,needlv=100,statusid=71,statuslv=30},
    [81]={needxw=1200000,needlv=100,statusid=71,statuslv=31},
    [82]={needxw=1200000,needlv=100,statusid=71,statuslv=32},
    [83]={needxw=1200000,needlv=100,statusid=71,statuslv=33},
    [84]={needxw=1200000,needlv=100,statusid=71,statuslv=34},
    [85]={needxw=1200000,needlv=100,statusid=71,statuslv=35},
    [86]={needxw=1200000,needlv=100,statusid=71,statuslv=36},
    [87]={needxw=1200000,needlv=100,statusid=71,statuslv=37},
    [88]={needxw=1200000,needlv=100,statusid=71,statuslv=38},
    [89]={needxw=1200000,needlv=100,statusid=71,statuslv=39},
    [90]={needxw=1200000,needlv=100,statusid=71,statuslv=40},
    [91]={needxw=1200000,needlv=100,statusid=71,statuslv=41},
    [92]={needxw=1200000,needlv=100,statusid=71,statuslv=42},
    [93]={needxw=1200000,needlv=100,statusid=71,statuslv=43},
    [94]={needxw=1200000,needlv=100,statusid=71,statuslv=44},
    [95]={needxw=1200000,needlv=100,statusid=71,statuslv=45},
    [96]={needxw=1200000,needlv=100,statusid=71,statuslv=46},
    [97]={needxw=1200000,needlv=100,statusid=71,statuslv=47},
    [98]={needxw=1200000,needlv=100,statusid=71,statuslv=48},
    [99]={needxw=1200000,needlv=100,statusid=71,statuslv=49},
   [100]={needxw=1200000,needlv=100,statusid=71,statuslv=50},


}
function isOverMaxTimes(player,tag)
	local date = util.ppn(player,const.PP_JC_XFZK_DATE);
	if date == today() then
		local cs = util.ppn(player,const.PP_JC_XFZK_TIMES);
		if cs < 20 then 
			if tag then
				player:set_param(const.PP_JC_XFZK_TIMES,cs+1);
			end
			return false;
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","0");
			return true;
		end
	end
	return false;
end
--刷新角色面板模块的界面信息
function fresh_self_info(player)
	--精彩活动
	local tslv = util.ppn(player,const.PP_XINFA_LEVEL)+1;
	player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","0");
	if newgui.jingcaihuodong.isOpenActivity(player,"xfzk") then
		if not isOverMaxTimes(player,false) then
			if tslv >= 1 and tslv <= 35 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","3519");
			end
			if tslv >= 36 and tslv <= 50 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","3518");
			end
			if tslv >= 51 and tslv <=100 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","3517");
			end
		end
	end
	-- vip model
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"vipmodel","bgid","3014");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"vipmodel","tooltip_text","VIP会员");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"vipmodel","bgid","3006");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"vipmodel","tooltip_text","尚未激活VIP");
	end
	-- 红钻 model
	local rz = util.ppn(player,const.PP_CZHZ_LV);
	if red_data[rz] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"redmodel","bgid",red_data[rz].bgid);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"redmodel","tooltip_text",red_data[rz].tips);
	end
	-- 坐骑 model
	local zq = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zq_data[zq] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zqmodel","bgid",zq_data[zq].bgid);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zqmodel","tooltip_text",zq_data[zq].tips);
	end
	-- 官职 model
	local rz = util.ppn(player,const.PP_GUANZHI);
	if gz_data[rz] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"gzmodel","bgid",gz_data[rz].bgid);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"gzmodel","tooltip_text",gz_data[rz].tips);
	end
	-- 心法 model
	local xf = util.ppn(player,const.PP_XINFA_LEVEL);
	if xf_data[xf] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xfmodel","bgid",xf_data[xf].bgid);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xfmodel","tooltip_text",xf_data[xf].tips);
	end

	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end			    
function XFtish(player)
	--提升心法
	local tslv = util.ppn(player,const.PP_XINFA_LEVEL)+1;
	local tslv_data = xinfa_data[tslv]
	if tslv_data then
		if player:get_level() < tslv_data.needlv then
			player:alert(1,1,"升级当前心法需要人物等级达到"..tslv_data.needlv.."级");return;
		end
		if util.ppn(player,const.PP_XINFA_XIUWEI) < tslv_data.needxw then
			player:alert(1,1,"升级当前心法需要人物修为达到"..tslv_data.needxw.."点");return;
		end
		player:set_param(const.PP_XINFA_LEVEL,tslv);
		achieve_active_xinfa(player);
		player:set_model(1,tslv);
		newgui.property.fresh_self_info(player);
		player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI) - tslv_data.needxw);
		player:alert(1,1,"恭喜您成功升级心法到"..tslv.."级");
		player:clear_status(38);
		player:clear_status(71);
		player:set_status(tslv_data.statusid,86400,tslv_data.statuslv,1,1);
		fresh_XFinfo(player,"btnXF"..(tslv+1));return;
	end
	player:alert(1,1,"下一级心法尚未开启!");
end

function XFyjUp(player)
	local tslv = util.ppn(player,const.PP_XINFA_LEVEL)+1;
	local tslv_data = xinfa_data[tslv]
	if tslv_data then
		if player:get_level() < tslv_data.needlv then
			--player:alert(1,1,"升级当前心法需要人物等级达到"..tslv_data.needlv.."级");return;
		end
		local cost = math.floor(tslv_data.needxw / 20);

		--精彩活动
		if newgui.jingcaihuodong.isOpenActivity(player,"xfzk") then
			if not isOverMaxTimes(player,false) then
				if tslv >= 1 and tslv <= 35 then
					cost = math.floor(cost*0.95);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","3519");
				end
				if tslv >= 36 and tslv <= 50 then
					cost = math.floor(cost*0.88);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","3518");
				end
				if tslv >= 51 and tslv <=100 then
					cost = math.floor(cost*0.8);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"yjtsdazhepic","bgid","3517");
				end
			end
		end
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

		if player:get_vcoin() >= cost then

			if newgui.jingcaihuodong.isOpenActivity(player,"xfzk") then
				--每天20次
				if cost < math.floor(tslv_data.needxw / 20) then
					local date = util.ppn(player,const.PP_JC_XFZK_DATE);
					if date ~= today() then
						player:set_param(const.PP_JC_XFZK_DATE,today());
						player:set_param(const.PP_JC_XFZK_TIMES,1);
					else
						isOverMaxTimes(player,true);
					end
					
				end
			end

			player:sub_vcoin(cost,"xinfa")
			player:set_param(const.PP_XINFA_LEVEL,tslv);
			achieve_active_xinfa(player);
			player:set_model(1,tslv);
			newgui.property.fresh_self_info(player);
			--player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI) - tslv_data.needxw);
			player:alert(1,1,"恭喜您成功升级心法到"..tslv.."级");
			player:clear_status(38);
			player:clear_status(71);
			player:set_status(tslv_data.statusid,86400,tslv_data.statuslv,1,1);
			fresh_XFinfo(player,"btnXF"..(tslv+1));return;
		else
			player:alert(1,1,"一键提升当前心法需要消耗元宝"..cost);return;
		end
	end
	player:alert(1,1,"下一级心法尚未开启!");
end

function XFhuoqu(player)
	player:alert(1,1,"修为可以通过击杀BOSS来获得提升.<br><br>使用商铺中的修为令牌也可提升修为.");
end
function achieve_active_xinfa(player)
	local lv = util.ppn(player,const.PP_XINFA_LEVEL);
	if lv > 0 and player:get_task_state(1103) == 1 then
		player:set_task_state(1103,2); player:push_task_data(1103,0);
		player:add_exp(100000);
		player:alert(10,1,"成功完成<font color='#ff0000'>心法修炼任务!</font>")
		player:alert(10,0,"经验值增加: <font color='#ff0000'>100000</font>")
		if util.ppn(player,const.PP_SHENQI_XINGLV) <= 0 then
			player:set_task_state(1105,1); player:push_task_data(1105,0);--神器
		else
			if player:achieve_get_param(1004) <= 0 then
				player:set_task_state(1106,1); player:push_task_data(1106,0);--行会
			end
		end
	end
	if lv >= 1 and util.ppn(player,const.PP_ACHIEVE_XINFA1) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA1,10);player:alert(1,1,"恭喜您成功完成目标:心法达到1级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 5 and util.ppn(player,const.PP_ACHIEVE_XINFA5) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA5,10);player:alert(1,1,"恭喜您成功完成目标:心法达到5级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 10 and util.ppn(player,const.PP_ACHIEVE_XINFA10) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA10,10);player:alert(1,1,"恭喜您成功完成目标:心法达到10级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 15 and util.ppn(player,const.PP_ACHIEVE_XINFA15) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA15,10);player:alert(1,1,"恭喜您成功完成目标:心法达到15级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 20 and util.ppn(player,const.PP_ACHIEVE_XINFA20) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA20,10);player:alert(1,1,"恭喜您成功完成目标:心法达到20级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 25 and util.ppn(player,const.PP_ACHIEVE_XINFA25) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA25,10);player:alert(1,1,"恭喜您成功完成目标:心法达到25级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 30 and util.ppn(player,const.PP_ACHIEVE_XINFA30) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA30,10);player:alert(1,1,"恭喜您成功完成目标:心法达到30级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 35 and util.ppn(player,const.PP_ACHIEVE_XINFA35) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA35,10);player:alert(1,1,"恭喜您成功完成目标:心法达到35级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 40 and util.ppn(player,const.PP_ACHIEVE_XINFA40) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA40,10);player:alert(1,1,"恭喜您成功完成目标:心法达到40级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 45 and util.ppn(player,const.PP_ACHIEVE_XINFA45) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA45,10);player:alert(1,1,"恭喜您成功完成目标:心法达到45级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
	if lv >= 50 and util.ppn(player,const.PP_ACHIEVE_XINFA50) == 0 then
		player:set_param(const.PP_ACHIEVE_XINFA50,10);player:alert(1,1,"恭喜您成功完成目标:心法达到50级.");
		newgui.achieve.fresh_achieve_title(player,6);
	end
end
function fresh_XFinfo(player,actionid)
	local xinfa_level = util.ppn(player,const.PP_XINFA_LEVEL);
	local cur_data = xinfa_data[xinfa_level];
	if cur_data then
		local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(cur_data.statusid,cur_data.statuslv);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFhp","text",(shp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmp","text",(smp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFdc","text",sdc.."-"..sdc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmc","text",smc.."-"..smc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFsc","text",ssc.."-"..ssc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFac","text",sac.."-"..sac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmac","text",smac.."-"..smac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFzl","text"," ");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFhp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFdc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFsc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFzl","text",0);
	end

	local tol_data = xinfa_data[xinfa_level+1];
	if tol_data then
		local cost = math.floor(tol_data.needxw / 20);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnXFts","tooltip_text","需消耗"..tol_data.needxw.."修为");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnYJxf","tooltip_text","一键提升需消耗"..cost.."元宝");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnXFts","tooltip_text","未开放");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnYJxf","tooltip_text","未开放");
	end

	local selected = tonumber(string.sub(actionid,6));
	if selected == xinfa_level then
		selected=selected+1;
	end
	local next_data = xinfa_data[selected];
	if next_data then
		local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(next_data.statusid,next_data.statuslv);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFhp","text",(shp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmp","text",(smp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFdc","text",sdc.."-"..sdc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmc","text",smc.."-"..smc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFsc","text",ssc.."-"..ssc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFac","text",sac.."-"..sac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmac","text",smac.."-"..smac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFzl","text"," ");

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFplv","text",next_data.needlv.."级");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFpxw","text",next_data.needxw);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFplv","text","未开放");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFpxw","text","未开放");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFhp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFdc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFsc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFzl","text",0);
	end

	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtPclv","text",player:get_level().."级");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFclv","text",xinfa_level.."级");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFcxw","text",util.ppn(player,const.PP_XINFA_XIUWEI));
	for i=1,100 do
		local btn = "btnXF"..i;
		if xinfa_level >= i then
			player:set_panel_data(PANEL_ACTIONSET_NAME,btn,"grayFilter","false");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,btn,"grayFilter","true");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function fresh_XFlv(player)
	local xinfa_level = util.ppn(player,const.PP_XINFA_LEVEL);
	local cur_data = xinfa_data[xinfa_level];
	if cur_data then
		local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(cur_data.statusid,cur_data.statuslv);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFhp","text",(shp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmp","text",(smp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFdc","text",sdc.."-"..sdc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmc","text",smc.."-"..smc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFsc","text",ssc.."-"..ssc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFac","text",sac.."-"..sac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmac","text",smac.."-"..smac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFzl","text"," ");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFhp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFdc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFsc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFmac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFzl","text",0);
	end

	local tol_data = xinfa_data[xinfa_level+1];
	if tol_data then
		local cost = math.floor(tol_data.needxw / 20);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnXFts","tooltip_text","需消耗"..tol_data.needxw.."修为");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnYJxf","tooltip_text","一键提升需消耗"..cost.."元宝");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnXFts","tooltip_text","未开放");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnYJxf","tooltip_text","未开放");
	end
	if tol_data then
		local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(tol_data.statusid,tol_data.statuslv);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFhp","text",(shp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmp","text",(smp/100.0).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFdc","text",sdc.."-"..sdc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmc","text",smc.."-"..smc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFsc","text",ssc.."-"..ssc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFac","text",sac.."-"..sac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmac","text",smac.."-"..smac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFzl","text"," ");

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFplv","text",tol_data.needlv.."级");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFpxw","text",tol_data.needxw);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFplv","text","未开放");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFpxw","text","未开放");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFhp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmp","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFdc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFsc","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFmac","text",0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNXFzl","text",0);
	end

	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtPclv","text",player:get_level().."级");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFclv","text",xinfa_level.."级");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtXFcxw","text",util.ppn(player,const.PP_XINFA_XIUWEI));
	for i=1,100 do
		local btn = "btnXF"..i;
		if xinfa_level >= i then
			player:set_panel_data(PANEL_ACTIONSET_NAME,btn,"grayFilter","false");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,btn,"grayFilter","true");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_XFlv);

-------------------------------==---------------------转生--------------===-------------------------------------------------------------
local zhuansheng_data={
	[0]={needlevel=0,needmoney=0,needstone=0,succeed = 0,sublv = 0,
		attr={dc=0,dcmax=0,ac=0,acmax=0,mc=0,mcmax=0,mac=0,macmax=0,sc=0,scmax=0,baojiprob=0,hpmax=0,baojipres=0,mpmax=0,fight=0},
 	},
 	[1]={needlevel=90,needmoney=0,needstone=10,succeed = 20,sublv = 5,
		attr={dc=120,dcmax=200,ac=20,acmax=40,mc=120,mcmax=200,mac=10,macmax=20,sc=120,scmax=200,baojiprob=1,hpmax=5,baojipres=100,mpmax=5,fight=1970},
 	},
 	[2]={needlevel=90,needmoney=0,needstone=10,succeed = 10,sublv = 5,
		attr={dc=240,dcmax=400,ac=40,acmax=80,mc=240,mcmax=400,mac=20,macmax=40,sc=240,scmax=400,baojiprob=2,hpmax=10,baojipres=200,mpmax=10,fight=3940},
 	},
	[3]={needlevel=90,needmoney=0,needstone=10,succeed = 5,sublv = 5,
		attr={dc=360,dcmax=600,ac=60,acmax=120,mc=360,mcmax=600,mac=30,macmax=60,sc=360,scmax=600,baojiprob=3,hpmax=15,baojipres=300,mpmax=15,fight=5910},
 	},
 	[4]={needlevel=90,needmoney=0,needstone=10,succeed = 5,sublv = 5,
		attr={dc=480,dcmax=800,ac=80,acmax=160,mc=480,mcmax=800,mac=40,macmax=80,sc=480,scmax=800,baojiprob=4,hpmax=20,baojipres=400,mpmax=20,fight=7880},
 	},
	[5]={needlevel=90,needmoney=0,needstone=10,succeed = 5,sublv = 5,
		attr={dc=600,dcmax=1000,ac=100,acmax=200,mc=600,mcmax=1000,mac=50,macmax=100,sc=600,scmax=1000,baojiprob=5,hpmax=25,baojipres=500,mpmax=25,fight=9850},
 	},																	       
	[6]={needlevel=90,needmoney=0,needstone=10,succeed = 5,sublv = 5,									       
		attr={dc=720,dcmax=1200,ac=120,acmax=240,mc=720,mcmax=1200,mac=60,macmax=120,sc=720,scmax=1200,baojiprob=6,hpmax=30,baojipres=600,mpmax=30,fight=11820},
 	},																	       
 	[7]={needlevel=90,needmoney=0,needstone=10,succeed = 4,sublv = 5,									       
		attr={dc=840,dcmax=1400,ac=140,acmax=280,mc=840,mcmax=1400,mac=70,macmax=140,sc=840,scmax=1400,baojiprob=7,hpmax=35,baojipres=700,mpmax=35,fight=13790},
 	},																	       
	[8]={needlevel=90,needmoney=0,needstone=10,succeed = 3,sublv = 5,									       
		attr={dc=960,dcmax=1600,ac=160,acmax=320,mc=960,mcmax=1600,mac=80,macmax=160,sc=960,scmax=1600,baojiprob=8,hpmax=40,baojipres=800,mpmax=40,fight=15760},
 	},																	       
 	[9]={needlevel=90,needmoney=0,needstone=10,succeed = 2,sublv = 5,									       
		attr={dc=1080,dcmax=1800,ac=180,acmax=360,mc=1080,mcmax=1800,mac=90,macmax=180,sc=1080,scmax=1800,baojiprob=9,hpmax=45,baojipres=900,mpmax=45,fight=17730},
 	},
	[10]={needlevel=90,needmoney=0,needstone=10,succeed = 1,sublv = 5,
		attr={dc=1200,dcmax=2000,ac=200,acmax=400,mc=1200,mcmax=2000,mac=100,macmax=200,sc=1200,scmax=2000,baojiprob=10,hpmax=50,baojipres=1000,mpmax=50,fight=19700},
 	},
	[11]={needlevel=90,needmoney=0,needstone=10,succeed = 1,sublv = 5,
		attr={dc=1200,dcmax=2000,ac=200,acmax=400,mc=1200,mcmax=2000,mac=100,macmax=200,sc=1200,scmax=2000,baojiprob=10,hpmax=50,baojipres=1000,mpmax=50,fight=19700},
 	},
 };

function ZSUp(player)
	local level = player:get_level();
	local zs_data = zhuansheng_data[util.ppn(player,const.PP_ZHUANSHENGLEVEL) +1];
	local money = player:get_gamemoney();
	local stone = player:num_item("转生石",1);
	local su = math.random(1,100);
	if util.ppn(player,const.PP_ZHUANSHENGLEVEL) < 10 then
		if (level>=zs_data.needlevel ) then
			if (stone>=zs_data.needstone) then
				if (money>=zs_data.needmoney) then
					player:sub_gamemoney(zs_data.needmoney);
					player:remove_item("转生石",zs_data.needstone);

					--控制调整玩家的概率
					local needprob = zs_data.succeed;
					if activity.isBaifuSjieOpen() or newgui.jingcaihuodong.isOpenActivity(player,"qfzssd") or activity.isDoubleZhuanSheng() then
						needprob = 2 * zs_data.succeed
					else
						if player:get_vcoin_accu() <= 50000 then needprob = 2 * zs_data.succeed end
					end
					--控制调整玩家的概率
					if su <= needprob then
						player:set_param(const.PP_ZHUANSHENGLEVEL,util.ppn(player,const.PP_ZHUANSHENGLEVEL)+1);
						player:set_status(50,86400,util.ppn(player,const.PP_ZHUANSHENGLEVEL),1,1);
						player:set_level(player:get_level()-zs_data.sublv);
						player:set_zslevel(util.ppn(player,const.PP_ZHUANSHENGLEVEL));
						fresh_zhuansheng_info(player);
						player:alert(11,1,"转生成功!恭喜您完成[<font color='#ff0000'>"..util.ppn(player,const.PP_ZHUANSHENGLEVEL).."级转生</font>]");
						server.info(10010,0,"[<font color='#ff0000'>"..player:get_name().."</font>]成功完成[<font color='#ff0000'>"..util.ppn(player,const.PP_ZHUANSHENGLEVEL).."级转生</font>],自身威力大增!");
					else
						player:alert(1,1,"转生失败!再接再厉哦!");return;
					end
				else
				player:alert(1,1,"转生需要金币数量:"..zs_data.needmoney);return;
				end
			else
			player:alert(1,1,"转生需要转生石:"..zs_data.needstone.."个");return;
			end
		else
		player:alert(1,1,"转生需要等级达到:"..zs_data.needlevel.."级");return;
		end
	else
	player:alert(1,1,"您已经达到最高转生等级！");return;
	end
end

function fresh_zhuansheng_info(player)
	local nzl = util.ppn(player,const.PP_ZHUANSHENGLEVEL);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnowlv","text",""..nzl);
		local zd_data  = zhuansheng_data[nzl];
		local zsd_data  = zd_data.attr;
		if zsd_data then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzssc","text",""..zsd_data.sc.."-"..zsd_data.scmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsmc","text",""..zsd_data.mc.."-"..zsd_data.mcmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsdc","text",""..zsd_data.dc.."-"..zsd_data.dcmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsac","text",""..zsd_data.ac.."-"..zsd_data.acmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsmac","text",""..zsd_data.mac.."-"..zsd_data.macmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsbaojiprob","text",""..zsd_data.baojiprob.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzshpmax","text",""..zsd_data.hpmax.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsbaojipres","text",""..zsd_data.baojipres);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzsmpmax","text",""..zsd_data.mpmax.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txzstfight","text",""..zsd_data.fight);
				--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
		local zst_data  = zhuansheng_data[nzl+1];
		local zsdd_data = zst_data.attr;
		if zsdd_data then
				----根据活动时间动态刷新转生几率
				local nprob = zst_data.succeed;
				--if activity.isBaifuSjieOpen() then
				--	nprob = 2 * zst_data.succeed
				--end
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtneedlevel","text",""..zst_data.needlevel);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtneedmoney","text",""..zst_data.needmoney);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtneedshitou","text","转生石*"..zst_data.needstone);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsucceed","text",""..nprob.."%");
				if newgui.jingcaihuodong.isOpenActivity(player,"qfzssd") or activity.isDoubleZhuanSheng() then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbs","text","* 2");
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbs","text"," ");
				end

				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc1","text",""..zsdd_data.sc.."-"..zsdd_data.scmax);			
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc1","text",""..zsdd_data.mc.."-"..zsdd_data.mcmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc1","text",""..zsdd_data.dc.."-"..zsdd_data.dcmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac1","text",""..zsdd_data.ac.."-"..zsdd_data.acmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac1","text",""..zsdd_data.mac.."-"..zsdd_data.macmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbaojiprob1","text",""..zsdd_data.baojiprob.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txthpmax1","text",""..zsdd_data.hpmax.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbaojipres1","text",""..zsdd_data.baojipres);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmpmax1","text",""..zsdd_data.mpmax.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtfight1","text",""..zsdd_data.fight);
				--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

local zhzonghe_data={
	[1]={pos=ckattr.ITEM_WEAPON_POSITION,con=const.ZHUHUN_HAT},
	[2]={pos=ckattr.ITEM_RING1_POSITION,con=const.ZHUHUN_RING1},
	[3]={pos=ckattr.ITEM_RING2_POSITION,con=const.ZHUHUN_RING2},
	[4]={pos=ckattr.ITEM_GLOVE1_POSITION,con=const.ZHUHUN_GLOVE1},

	[5]={pos=ckattr.ITEM_GLOVE2_POSITION,con=const.ZHUHUN_GLOVE2},
	[6]={pos=ckattr.ITEM_NICKLACE_POSITION,con=const.ZHUHUN_NICKLACE},
	[7]={pos=ckattr.ITEM_BELT_POSITION,con=const.ZHUHUN_BELT},
	[8]={pos=ckattr.ITEM_BOOT_POSITION,con=const.ZHUHUN_BOOT},
};

function fresh_sx_texiao(player)
	for i=1,8 do
		player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"visible","true");
	end
	for i=1,8 do
		if util.ppn(player,zhzonghe_data[i].con)==0 then
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"visible","false");
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"staticimgid","swf/item_lv.swf");
		elseif util.ppn(player,zhzonghe_data[i].con)>0 and util.ppn(player,zhzonghe_data[i].con)<=60 then
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"staticimgid","swf/item_lv.swf");
		elseif  util.ppn(player,zhzonghe_data[i].con)>60 and util.ppn(player,zhzonghe_data[i].con)<=90 then
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"staticimgid","swf/item_lan.swf");
		elseif  util.ppn(player,zhzonghe_data[i].con)>90 and util.ppn(player,zhzonghe_data[i].con)<=110 then
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"staticimgid","swf/item_zi.swf");
		elseif  util.ppn(player,zhzonghe_data[i].con)>110 and util.ppn(player,zhzonghe_data[i].con)<=120 then
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelshowproperty","sxzhuhuntexiao"..i,"staticimgid","swf/item_huang.swf");
		end
	end
end