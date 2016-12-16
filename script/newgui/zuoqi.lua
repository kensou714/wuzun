module(..., package.seeall)
local ACTIONSET_NAME="zuoqi";
local PANEL_ACTIONSET_NAME="panelzuoqi";--角色属性面板
local MAX_ZUOQI_LV = 16;

local zq_data={
	[1]={name="黑鬃马(1阶)",id=2001,detail={
		[1]={needexp=10000,speed=4,mount=130101,slplus=0},
		[2]={needexp=21940,speed=4.4,mount=130102,slplus=0},
		[3]={needexp=21940,speed=4.8,mount=130103,slplus=0},
		[4]={needexp=21940,speed=5.2,mount=130104,slplus=0},
		[5]={needexp=21940,speed=5.6,mount=130105,slplus=0},
		[6]={needexp=21940,speed=6.0,mount=130106,slplus=0},
		[7]={needexp=21940,speed=6.4,mount=130107,slplus=0},
		[8]={needexp=21940,speed=6.8,mount=130108,slplus=0},
		[9]={needexp=21940,speed=7.2,mount=130109,slplus=0},
		[10]={needexp=21940,speed=8.0,mount=130110,slplus=0},
		},
	},
	[2]={name="白良马(2阶)",id=2002,detail={
		[1]={needexp=39492,speed=8.4,mount=130111,slplus=0},
		[2]={needexp=39492,speed=8.8,mount=130112,slplus=0},
		[3]={needexp=39492,speed=9.2,mount=130113,slplus=0},
		[4]={needexp=39492,speed=9.6,mount=130114,slplus=0},
		[5]={needexp=39492,speed=10,mount=130115,slplus=0},
		[6]={needexp=39492,speed=10.4,mount=130116,slplus=0},
		[7]={needexp=39492,speed=10.8,mount=130117,slplus=0},
		[8]={needexp=39492,speed=11.2,mount=130118,slplus=0},
		[9]={needexp=39492,speed=11.6,mount=130119,slplus=0},
		[10]={needexp=39492,speed=12,mount=130120,slplus=0},
		},
	},
	[3]={name="赤红马(3阶)",id=2003,detail={
		[1]={needexp=78984,speed=12.4,mount=130121,slplus=0},
		[2]={needexp=78984,speed=12.8,mount=130122,slplus=0},
		[3]={needexp=78984,speed=13.2,mount=130123,slplus=0},
		[4]={needexp=78984,speed=13.6,mount=130124,slplus=0},
		[5]={needexp=78984,speed=14,mount=130125,slplus=0},
		[6]={needexp=78984,speed=14.4,mount=130126,slplus=0},
		[7]={needexp=78984,speed=14.8,mount=130127,slplus=0},
		[8]={needexp=78984,speed=15.2,mount=130128,slplus=0},
		[9]={needexp=78984,speed=15.6,mount=130129,slplus=0},
		[10]={needexp=78984,speed=16,mount=130130,slplus=0},
		},
	},
	[4]={name="斑斓虎(4阶)",id=2004,detail={
		[1]={needexp=157969,speed=16.4,mount=130131,slplus=0},
		[2]={needexp=157969,speed=16.8,mount=130132,slplus=0},
		[3]={needexp=157969,speed=15.2,mount=130133,slplus=0},
		[4]={needexp=157969,speed=15.6,mount=130134,slplus=0},
		[5]={needexp=157969,speed=16,mount=130135,slplus=0},
		[6]={needexp=157969,speed=16.4,mount=130136,slplus=0},
		[7]={needexp=157969,speed=16.8,mount=130137,slplus=0},
		[8]={needexp=157969,speed=17.2,mount=130138,slplus=0},
		[9]={needexp=157969,speed=17.6,mount=130139,slplus=0},
		[10]={needexp=157969,speed=18,mount=130140,slplus=0},
		},
	},
	[5]={name="苍云虎(5阶)",id=2005,detail={
		[1]={needexp=315939,speed=18.4,mount=130141,slplus=0},
		[2]={needexp=315939,speed=18.8,mount=130142,slplus=0},
		[3]={needexp=315939,speed=19.2,mount=130143,slplus=0},
		[4]={needexp=315939,speed=19.6,mount=130144,slplus=0},
		[5]={needexp=315939,speed=20,mount=130145,slplus=0},
		[6]={needexp=315939,speed=21.4,mount=130146,slplus=0},
		[7]={needexp=315939,speed=21.8,mount=130147,slplus=0},
		[8]={needexp=315939,speed=22.2,mount=130148,slplus=0},
		[9]={needexp=315939,speed=23.6,mount=130149,slplus=0},
		[10]={needexp=315939,speed=24,mount=130150,slplus=0},
		},
	},
	[6]={name="啸天虎(6阶)",id=2006,detail={
		[1]={needexp=631878,speed=24.4,mount=130151,slplus=0},
		[2]={needexp=631878,speed=24.8,mount=130152,slplus=0},
		[3]={needexp=631878,speed=25.2,mount=130153,slplus=0},
		[4]={needexp=631878,speed=25.6,mount=130154,slplus=0},
		[5]={needexp=631878,speed=26,mount=130155,slplus=0},
		[6]={needexp=631878,speed=26.4,mount=130156,slplus=0},
		[7]={needexp=631878,speed=26.8,mount=130157,slplus=0},
		[8]={needexp=631878,speed=27.2,mount=130158,slplus=0},
		[9]={needexp=631878,speed=27.6,mount=130159,slplus=0},
		[10]={needexp=631878,speed=28,mount=130160,slplus=0},
		},
	},
	[7]={name="震威战狮(7阶)",id=2007,detail={
		[1]={needexp=1263756,speed=28.4,mount=130161,slplus=0},
		[2]={needexp=1263756,speed=28.8,mount=130162,slplus=0},
		[3]={needexp=1263756,speed=29.2,mount=130163,slplus=0},
		[4]={needexp=1263756,speed=29.6,mount=130164,slplus=0},
		[5]={needexp=1263756,speed=30,mount=130165,slplus=0},
		[6]={needexp=1263756,speed=30.4,mount=130166,slplus=0},
		[7]={needexp=1263756,speed=30.8,mount=130167,slplus=0},
		[8]={needexp=1263756,speed=31.2,mount=130168,slplus=0},
		[9]={needexp=1263756,speed=31.6,mount=130169,slplus=0},
		[10]={needexp=1263756,speed=32,mount=130170,slplus=0},
		},
	},
	[8]={name="血影雄狮(8阶)",id=2008,detail={
		[1]={needexp=2527513,speed=32.4,mount=130171,slplus=1},
		[2]={needexp=2527513,speed=32.8,mount=130172,slplus=1},
		[3]={needexp=2527513,speed=33.2,mount=130173,slplus=1},
		[4]={needexp=2527513,speed=33.6,mount=130174,slplus=1},
		[5]={needexp=2527513,speed=34,mount=130175,slplus=1},
		[6]={needexp=2527513,speed=34.4,mount=130176,slplus=2},
		[7]={needexp=2527513,speed=34.8,mount=130177,slplus=2},
		[8]={needexp=2527513,speed=35.2,mount=130178,slplus=2},
		[9]={needexp=2527513,speed=35.6,mount=130179,slplus=2},
		[10]={needexp=2527513,speed=36,mount=130180,slplus=3},
		},
	},
	[9]={name="金甲圣狮(9阶)",id=2009,detail={
		[1]={needexp=5055027,speed=36.4,mount=130181,slplus=3},
		[2]={needexp=5055027,speed=36.8,mount=130182,slplus=3},
		[3]={needexp=5055027,speed=37.2,mount=130183,slplus=4},
		[4]={needexp=5055027,speed=37.6,mount=130184,slplus=4},
		[5]={needexp=5055027,speed=38,mount=130185,slplus=4},
		[6]={needexp=5055027,speed=38.4,mount=130186,slplus=5},
		[7]={needexp=5055027,speed=38.8,mount=130187,slplus=5},
		[8]={needexp=5055027,speed=39.2,mount=130188,slplus=5},
		[9]={needexp=5055027,speed=39.6,mount=130189,slplus=6},
		[10]={needexp=5055027,speed=40,mount=130190,slplus=6},
		},
	},
	[10]={name="赤焰火麒麟(10阶)",id=2010,detail={
		[1]={needexp=10110054,speed=40.5,mount=130191,slplus=7},
		[2]={needexp=10110054,speed=41,mount=130192,slplus=7},
		[3]={needexp=10110054,speed=41.5,mount=130193,slplus=8},
		[4]={needexp=10110054,speed=42,mount=130194,slplus=8},
		[5]={needexp=10110054,speed=42.5,mount=130195,slplus=9},
		[6]={needexp=10110054,speed=43,mount=130196,slplus=9},
		[7]={needexp=10110054,speed=43.5,mount=130197,slplus=10},
		[8]={needexp=10110054,speed=44,mount=130198,slplus=10},
		[9]={needexp=10110054,speed=44.5,mount=130199,slplus=11},
		[10]={needexp=10110054,speed=45,mount=130200,slplus=11},
		},
	},
	[11]={name="碧玉蓝麒麟(11阶)",id=2011,detail={
		[1]={needexp=20220108,speed=45.5,mount=130201,slplus=12},
		[2]={needexp=20220108,speed=46,mount=130202,slplus=12},
		[3]={needexp=20220108,speed=46.5,mount=130203,slplus=13},
		[4]={needexp=20220108,speed=47,mount=130204,slplus=13},
		[5]={needexp=20220108,speed=47.5,mount=130205,slplus=14},
		[6]={needexp=20220108,speed=48,mount=130206,slplus=14},
		[7]={needexp=20220108,speed=48.5,mount=130207,slplus=15},
		[8]={needexp=20220108,speed=49,mount=130208,slplus=16},
		[9]={needexp=20220108,speed=49.5,mount=130209,slplus=16},
		[10]={needexp=20220108,speed=50,mount=130210,slplus=17},
		},
	},
	[12]={name="至尊金麒麟(12阶)",id=2012,detail={
		[1]={needexp=20220108,speed=50.5,mount=130211,slplus=18},
		[2]={needexp=20220108,speed=51,mount=130212,slplus=19},
		[3]={needexp=20220108,speed=51.5,mount=130213,slplus=19},
		[4]={needexp=20220108,speed=52,mount=130214,slplus=20},
		[5]={needexp=20220108,speed=52.5,mount=130215,slplus=20},
		[6]={needexp=20220108,speed=53,mount=130216,slplus=21},
		[7]={needexp=20220108,speed=53.5,mount=130217,slplus=22},
		[8]={needexp=20220108,speed=54,mount=130218,slplus=22},
		[9]={needexp=20220108,speed=54.5,mount=130219,slplus=23},
		[10]={needexp=20220108,speed=55,mount=130220,slplus=24},
		},
	},
	[13]={name="赤焰混天蛟(13阶)",id=2013,detail={
		[1]={needexp=20220108,speed=55.5,mount=130221,slplus=25},
		[2]={needexp=20220108,speed=56,mount=130222,slplus=25},
		[3]={needexp=20220108,speed=56.5,mount=130223,slplus=26},
		[4]={needexp=20220108,speed=57,mount=130224,slplus=27},
		[5]={needexp=20220108,speed=57.5,mount=130225,slplus=28},
		[6]={needexp=20220108,speed=58,mount=130226,slplus=29},
		[7]={needexp=20220108,speed=58.5,mount=130227,slplus=29},
		[8]={needexp=20220108,speed=59,mount=130228,slplus=30},
		[9]={needexp=20220108,speed=59.5,mount=130229,slplus=31},
		[10]={needexp=20220108,speed=60,mount=130230,slplus=32},
		},
	},
	[14]={name="碧玉焚天蛟(14阶)",id=2014,detail={
		[1]={needexp=20220108,speed=60.5,mount=130231,slplus=33},
		[2]={needexp=20220108,speed=61,mount=130232,slplus=34},
		[3]={needexp=20220108,speed=61.5,mount=130233,slplus=34},
		[4]={needexp=20220108,speed=62,mount=130234,slplus=35},
		[5]={needexp=20220108,speed=62.5,mount=130235,slplus=36},
		[6]={needexp=20220108,speed=63,mount=130236,slplus=37},
		[7]={needexp=20220108,speed=63.5,mount=130237,slplus=38},
		[8]={needexp=20220108,speed=64,mount=130238,slplus=39},
		[9]={needexp=20220108,speed=64.5,mount=130239,slplus=40},
		[10]={needexp=20220108,speed=65,mount=130240,slplus=41},
		},
	},
        [15]={name="至尊诛天蛟(15阶)",id=2015,detail={
		[1]={needexp=20220108,speed=65,mount=130241,slplus=42},
		[2]={needexp=20220108,speed=65,mount=130242,slplus=43},
		[3]={needexp=20220108,speed=65,mount=130243,slplus=44},
		[4]={needexp=20220108,speed=65,mount=130244,slplus=45},
		[5]={needexp=20220108,speed=65,mount=130245,slplus=46},
		[6]={needexp=20220108,speed=65,mount=130246,slplus=47},
		[7]={needexp=20220108,speed=65,mount=130247,slplus=48},
		[8]={needexp=20220108,speed=65,mount=130248,slplus=49},
		[9]={needexp=20220108,speed=65,mount=130249,slplus=50},
		[10]={needexp=20220108,speed=65,mount=130250,slplus=51},
		},
	},
	[16]={name="霸天玄黄龙(16阶)",id=2016,detail={
		[1]={needexp=20220108,speed=65,mount=130250,slplus=52},
		},
	},
}

function recalculateMountLevelExp(player)
	if util.ppn(player,const.PP_NEW_ZUOQI_RELOG) <= 0 then
		player:set_param(const.PP_NEW_ZUOQI_RELOG,1);
		local zqlv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL);
		local zqexp = util.ppn(player,const.PP_ZUOQI_EXP);

		player:clear_status(35);
		
		local jie = zqlv;local xing =0;local ex=zqexp;
		if zqexp > 0 and zqlv < MAX_ZUOQI_LV then
			if jie == 1 then
				xing = 1;
				for i=(xing+1),#(zq_data[jie].detail) do
					if ex >= zq_data[jie].detail[i].needexp then
						ex = ex - zq_data[jie].detail[i].needexp;
						xing = xing +1;
					else
						break;
					end 
				end
			else
				if jie > 0 then
					for i=(xing+1),#(zq_data[jie].detail) do
						if ex >= zq_data[jie].detail[i].needexp then
							ex = ex - zq_data[jie].detail[i].needexp;
							xing = xing +1;
						else
							break;
						end 
					end
				end
			end
		end
		player:set_param(const.PP_NEW_ZUOQI_XING_LEVEL,xing);
		if util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) ~= jie then
			newgui.jingcaihuodong.setawardpcon(player,"zqsj",jie);
		end
		player:set_param(const.PP_NEW_ZUOQI_JIE_LEVEL,jie);
		player:set_param(const.PP_NEW_ZUOQI_EXP,ex);
	end
end

function process_zuoqiproperty(player,actionset,panelid,actionid,data)
	if actionid == "btnbeast" then
		newgui.beast.open_sl_panel(player);
		return;
	end
	if actionid == "btnzuoqipre" then
		open_zuoqi_prepanel(player);return;
	end
	if actionid == "btnPreZQ" then
		open_zuoqi_prepanel(player);return;
	end
	-----------------------------------坐骑面板交互信息
	if actionid == "btnmountYBTS" then
		mountYBTS(player);return;
	end
	if actionid =="btnSHANGMA" then
		mountSHANGMA(player);return;
	end
	if actionid == "btnmountYJTS" then
		mountYJTS(player);return;
	end
	if actionid == "btnmountSYJYD" then
		mountJYDTS(player);return;
	end
	if actionid == "btnExit" then
		player:set_panel_data("panelzuoqi","panelzuoqi","panel_visible","false");
		player:push_ckpanel_data("zuoqi","panelzuoqi");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_zuoqiproperty);

function doSLLoginLogic(player)
	local slv = util.ppn(player,const.PP_SHOULING_LEVEL);
	if slv > 0 then
		player:set_shouling_level(slv);
		player:recal_attr();
		--player:hpmp_full_fresh();
	end
	local zq = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	if zq >= 8 then
		--player:set_panel_data("panelzuoqi","btnbeast","grayFilter","false");
		if zxing == 0 then zq=zq-1;zxing=10;end
		local zd = zq_data[zq];
		if zd then
			local dd = zd.detail[zxing];
			if dd then
				player:set_shouling_pres(dd.slplus);
			end
		end
	--else
		--player:set_panel_data("panelzuoqi","btnbeast","grayFilter","true");
	end
	--player:push_ckpanel_data("zuoqi","panelzuoqi");
end
login.add_login_listener(doSLLoginLogic);

--------------------
--打开预览
function open_zuoqi_prepanel(player)
	--fresh_mount_panel(player)
	player:set_panel_data("panelzuoqiPre","panelzuoqiPre","panel_visible","true");
	player:push_ckpanel_data("zuoqiPre","panelzuoqiPre");
end

function isOverMaxTimes(player,tag)
	local date = util.ppn(player,const.PP_JC_ZQZK_DATE);
	if date == today() then
		local cs = util.ppn(player,const.PP_JC_ZQZK_TIMES);
		if cs < 20 then 
			if tag then
				player:set_param(const.PP_JC_ZQZK_TIMES,cs+1);
			end
			return false;
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"yubaodazhepic","bgid","0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"yijiandazhepic","bgid","0");
			return true;
		end
	end
	return false;
end
-----------------------------------------坐骑面板--------------------------------------
function mountYBTS(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);
	if zjie >= MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); return; end
	
	local zdt,ndt;local jinjie = false;
	local zd = zq_data[zjie];
	if zd then
		ndt = zd.detail[zxing+1];
		--if zxing == 0 then
		--	ndt = zq_data[zjie+1].detail[1];
		--end
	else
		ndt = zq_data[1].detail[1];
	end

	local salep = 100;
	if activity.iszuoqidazhe() or newgui.jingcaihuodong.isOpenActivity(player,"zqzk") then
		if not isOverMaxTimes(player,false) then
			if zjie >= 0 and zjie <= 6 then
				salep = 95;
			end
			if zjie >= 7 and zjie <= 11 then
				salep = 88;
			end
			if zjie >= 12 and zjie <= 15 then
				salep = 80;
			end
			--if util.ppn(player,const.PP_ZUOQI_YBJJ_TIMES)>=100 then
				--salep=100;
			--end
		end
	end

	local cost = math.floor(300*salep/100);

	if player:get_vcoin() >= cost then
		if ndt then

			if newgui.jingcaihuodong.isOpenActivity(player,"zqzk") then
				--每天20次
				if salep < 100 then
					local date = util.ppn(player,const.PP_JC_ZQZK_DATE);
					if date ~= today() then
						player:set_param(const.PP_JC_ZQZK_DATE,today());
						player:set_param(const.PP_JC_ZQZK_TIMES,1);
					else
						isOverMaxTimes(player,true);
					end
				end
			end

			player:sub_vcoin(cost,"zuoqi");
			--player:set_param(const.PP_ZUOQI_YBJJ_TIMES,util.ppn(player,const.PP_ZUOQI_YBJJ_TIMES)+1);
			zexp = zexp + 100000;
			if ndt.needexp > zexp then
				player:set_param(const.PP_NEW_ZUOQI_EXP,zexp);
				player:alert(1,1,"坐骑经验增加100000点");
			else	
				local sj,sx;
				local tx = 0;
				while ndt.needexp <= zexp do
					tx = tx +1;if tx >= 100 then print("zuoqi data",ndt.needexp,zexp);return; end
					zxing = zxing + 1;
					if zjie <= 0 then zjie = 1 end
					zexp = zexp - ndt.needexp;
					sj = zjie;sx=zxing;
					if zxing == 10 then
						zxing = 0;
						zjie = zjie +1;
						jinjie = true;
					end
					-----------------------------------------
					zd = zq_data[zjie];
					if zd then
						ndt = zd.detail[zxing+1];
						if zxing == 0 then
							ndt = zq_data[zjie].detail[1];--ndt = zq_data[zjie+1].detail[1];
						end
					else
						ndt = zq_data[1].detail[1];
					end
					if not ndt then break; end
					-----------------------------------------
				end
				if zxing ~= util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL) or zjie ~= util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL)  then
					if util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) ~= zjie then
						newgui.jingcaihuodong.setawardpcon(player,"zqsj",zjie);
					end
					player:set_param(const.PP_NEW_ZUOQI_JIE_LEVEL,zjie);
					player:set_param(const.PP_NEW_ZUOQI_XING_LEVEL,zxing);
				end
				player:set_param(const.PP_NEW_ZUOQI_EXP,zexp);
				for i = math.max(56,55+zjie-1),55+zjie do
					player:clear_status(i);
				end
				--player:set_status(55+sj,86400,sx,1,1);
				if sj == 15 then
					player:set_status(72,86400,sx,1,1);
				else
					if sj > 15 then
						player:set_status(72,86400,10,1,1);
					end
					player:set_status(55+sj,86400,sx,1,1);
				end
				player:set_model(7,zjie);
				newgui.property.fresh_self_info(player);
				if zxing == 0 then
					achieve_active_zuoqi(player);
					player:alert(1,1,"消耗"..cost.."元宝,获得100000经验,激活"..zjie.."阶坐骑.");
				else
					player:alert(1,1,"消耗"..cost.."元宝,获得100000经验,激活"..zjie.."阶"..zxing.."星坐骑.");
				end
				if jinjie == true then
					server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..zq_data[zjie].name.."</font>]");
				end
				doSLLoginLogic(player);
				player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
			end
			player:set_panel_data("panelzuoqi","panelzuoqi","panel_visible","true");
			fresh_mount_panel(player);
		end
	else
		player:alert(1,1,"元宝不足"..cost);
	end
end

function mountYJTS(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);

	if zjie >= MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); return; end
	
	local zdt,ndt;local jinjie = false;
	local zd = zq_data[zjie];
	if zd then
		ndt = zd.detail[zxing+1];
		--if zxing == 0 then
		--	ndt = zq_data[zjie+1].detail[1];
		--end
	else
		ndt = zq_data[1].detail[1];
	end

	local salep = 100;
	if activity.iszuoqidazhe() or newgui.jingcaihuodong.isOpenActivity(player,"zqzk") then
		if not isOverMaxTimes(player,false) then
			if zjie >= 0 and zjie <= 6 then
				salep = 95;
			end
			if zjie >= 7 and zjie <= 11 then
				salep = 88;
			end
			if zjie >= 12 and zjie <= 15 then
				salep = 80;
			end
			--if util.ppn(player,const.PP_ZUOQI_YJJJ_TIMES)>=20 then
				--salep=100;
			--end
		end
	end

	if ndt then
		local need = ndt.needexp - zexp;
		local cost = math.floor(need*3/1000*salep/100);
		if cost <= 0 then cost = 1 end
		if player:get_vcoin() >= cost then
			if newgui.jingcaihuodong.isOpenActivity(player,"zqzk") then
				--每天20次
				if salep < 100 then
					local date = util.ppn(player,const.PP_JC_ZQZK_DATE);
					if date ~= today() then
						player:set_param(const.PP_JC_ZQZK_DATE,today());
						player:set_param(const.PP_JC_ZQZK_TIMES,1);
					else
						isOverMaxTimes(player,true);
					end
				end
			end

			player:sub_vcoin(cost,"zuoqi");
			--player:set_param(const.PP_ZUOQI_YJJJ_TIMES,util.ppn(player,const.PP_ZUOQI_YJJJ_TIMES)+1);
			if zjie <= 0 then zjie = 1 end
			zxing = zxing + 1;
			zexp = 0;
			local sj = zjie;local sx=zxing;
			if zxing == 10 then
				zxing = 0;
				zjie = zjie +1;
				jinjie = true;
			end
			if util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) ~= zjie then
				newgui.jingcaihuodong.setawardpcon(player,"zqsj",zjie);
			end
			player:set_param(const.PP_NEW_ZUOQI_JIE_LEVEL,zjie);
			player:set_param(const.PP_NEW_ZUOQI_XING_LEVEL,zxing);
			
			player:set_param(const.PP_NEW_ZUOQI_EXP,zexp);
			for i = math.max(56,55+zjie-1),55+zjie do
				player:clear_status(i);
			end
			--player:set_status(55+sj,86400,sx,1,1);
			if sj == 15 then
				player:set_status(72,86400,sx,1,1);
			else
				if sj > 15 then
					player:set_status(72,86400,10,1,1);
				end
				player:set_status(55+sj,86400,sx,1,1);
			end
			player:set_model(7,zjie);
			newgui.property.fresh_self_info(player);
			
			if zxing == 0 then
				achieve_active_zuoqi(player);
				player:alert(1,1,"消耗"..cost.."元宝,获得"..need.."经验,激活"..zjie.."阶坐骑.");
				server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..zq_data[zjie].name.."</font>]");
			else
				player:alert(1,1,"消耗"..cost.."元宝,获得"..need.."经验,激活"..zjie.."阶"..zxing.."星坐骑.");
			end			
			doSLLoginLogic(player);
			player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
			player:set_panel_data("panelzuoqi","panelzuoqi","panel_visible","true");
			fresh_mount_panel(player);
		else
			player:alert(1,1,"元宝不足"..cost);
		end
	end
end

local dan = {
	[1]={name="坐骑经验丹(小)",ep=10000},
	[2]={name="坐骑经验丹(中)",ep=50000},
	[3]={name="坐骑经验丹(大)",ep=100000},
	[4]={name="坐骑经验丹(20万)",ep=200000},
	[5]={name="坐骑经验丹(30万)",ep=300000},
	[6]={name="坐骑经验丹(50万)",ep=500000},
	[7]={name="坐骑经验丹(100万)",ep=1000000},
}

function mountJYDTS(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);

	if zjie >= MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); return; end

	local allexp = 0;
	for i = 1,#dan do
		local n = player:num_item(dan[i].name,1);
		if n > 0 then
			player:remove_item(dan[i].name,n);
			allexp = allexp + dan[i].ep * n;
		end
	end
	if allexp <= 0 then
		player:alert(1,1,"背包中没有坐骑经验丹!"); return;
	end

	local zdt,ndt;local jinjie = false;
	local zd = zq_data[zjie];
	if zd then
		ndt = zd.detail[zxing+1];
		--if zxing == 0 then
		--	ndt = zq_data[zjie+1].detail[1];
		--end
	else
		ndt = zq_data[1].detail[1];
	end

	if ndt then
		if ndt.needexp - zexp > allexp then
			player:set_param(const.PP_NEW_ZUOQI_EXP,zexp+allexp);
			player:alert(1,1,"坐骑经验增加"..allexp.."点");
		else	
			zexp = zexp + allexp;
			local sj,sx;
			local tx = 0;
			while ndt.needexp <= zexp do
				zxing = zxing + 1;
				tx = tx +1;if tx >= 100 then print("zuoqi data",ndt.needexp,zexp);return; end
				if zjie <= 0 then zjie = 1 end
				zexp = zexp - ndt.needexp;
				sj = zjie;sx=zxing;
				if zxing == 10 then
					zxing = 0;
					zjie = zjie +1;
					jinjie = true;
				end
				-----------------------------------------
				zd = zq_data[zjie];
				if zd then
					ndt = zd.detail[zxing+1];
					if zxing == 0 then
						ndt = zq_data[zjie].detail[1];--ndt = zq_data[zjie+1].detail[1];
					end
				else
					ndt = zq_data[1].detail[1];
				end
				if not ndt then break; end
				-----------------------------------------
			end
			if zxing ~= util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL) or zjie ~= util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL)  then
				if util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) ~= zjie then
					newgui.jingcaihuodong.setawardpcon(player,"zqsj",zjie);
				end
				player:set_param(const.PP_NEW_ZUOQI_JIE_LEVEL,zjie);
				player:set_param(const.PP_NEW_ZUOQI_XING_LEVEL,zxing);
			end
			player:set_param(const.PP_NEW_ZUOQI_EXP,zexp);
			for i = math.max(56,55+zjie-1),55+zjie do
				player:clear_status(i);
			end
			--player:set_status(55+sj,86400,sx,1,1);
			if sj == 15 then
				player:set_status(72,86400,sx,1,1);
			else
				if sj > 15 then
					player:set_status(72,86400,10,1,1);
				end
				player:set_status(55+sj,86400,sx,1,1);
			end
			player:set_model(7,zjie);
			newgui.property.fresh_self_info(player);
			if jinjie == true then
				achieve_active_zuoqi(player);
				server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..zq_data[zjie].name.."</font>]");
			end
			doSLLoginLogic(player);
			player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
		end
		player:set_panel_data("panelzuoqi","panelzuoqi","panel_visible","true");
		fresh_mount_panel(player);
	end
	
end

function mountAddExp(player,addexp)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);

	if zjie >= MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); return; end

	local zdt,ndt;local jinjie = false;
	local zd = zq_data[zjie];
	if zd then
		ndt = zd.detail[zxing+1];
	else
		ndt = zq_data[1].detail[1];
	end

	if ndt then
		if ndt.needexp - zexp > addexp then
			player:set_param(const.PP_NEW_ZUOQI_EXP,zexp+addexp);
			player:alert(1,1,"坐骑经验增加"..addexp.."点");
		else	
			zexp = zexp + addexp;
			local sj,sx;
			local tx = 0;
			while ndt.needexp <= zexp do
				zxing = zxing + 1;
				tx = tx +1;if tx >= 100 then print("zuoqi data",ndt.needexp,zexp);return; end
				if zjie <= 0 then zjie = 1 end
				zexp = zexp - ndt.needexp;
				sj = zjie;sx=zxing;
				if zxing == 10 then
					zxing = 0;
					zjie = zjie +1;
					jinjie = true;
				end
				-----------------------------------------
				zd = zq_data[zjie];
				if zd then
					ndt = zd.detail[zxing+1];
					if zxing == 0 then
						ndt = zq_data[zjie].detail[1];--ndt = zq_data[zjie+1].detail[1];
					end
				else
					ndt = zq_data[1].detail[1];
				end
				if not ndt then break; end
				-----------------------------------------
			end
			if zxing ~= util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL) or zjie ~= util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL)  then
				if util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) ~= zjie then
					newgui.jingcaihuodong.setawardpcon(player,"zqsj",zjie);
				end
				player:set_param(const.PP_NEW_ZUOQI_JIE_LEVEL,zjie);
				player:set_param(const.PP_NEW_ZUOQI_XING_LEVEL,zxing);
			end
			player:set_param(const.PP_NEW_ZUOQI_EXP,zexp);
			for i = math.max(56,55+zjie-1),55+zjie do
				player:clear_status(i);
			end
			if sj >= 15 then
				player:set_status(72,86400,sx,1,1);
			else
				if sj > 15 then
					player:set_status(72,86400,10,1,1);
				end
				player:set_status(55+sj,86400,sx,1,1);
			end
			player:set_model(7,zjie);
			newgui.property.fresh_self_info(player);
			if jinjie == true then
				achieve_active_zuoqi(player);
				server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..zq_data[zjie].name.."</font>]");
			end
			doSLLoginLogic(player);
			player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
		end
		fresh_mount_panel(player);
		return 1;
	end
	return 0;
end

function mountSHANGMA(player)
	local zj = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zx = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	if zj >= 1 then
		if zx == 0 then zj = zj -1; zx = 10; end
		local a,b,c=player:get_mount_info();
		if zq_data[zj] then
			if b > 0 and player:get_mount_show() == 1 then
				player:set_mount_info(0,0,0);
				player:set_mount_show(0);
			else
				local nomunt = player:get_map():get_flag_mount();
				if nomunt == 1 then player:alert(1,1,"该地图禁止坐骑."); return; end
				player:start_progress_bar(2,"上马中...");
				player:set_mount_info(1,zq_data[util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL)].id,zq_data[zj].detail[zx].mount);
				player:change_mount();
			end
		end
	else
		player:alert(1,1,"您尚未拥有坐骑.");
	end
end

function achieve_active_zuoqi(player)
	if util.ppn(player,const.PP_ACHIEVE_FIRSTZUOQI) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTZUOQI,10);
	end
	local lv = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	for i=1,lv do
		if util.ppn(player,const.PP_ACHIEVE_ZUOQI1+i-1) <= 0 then
			player:set_param(const.PP_ACHIEVE_ZUOQI1+i-1,10);
		end
	end
	newgui.achieve.fresh_achieve_title(player,4);
	player:alert(1,1,"恭喜您成功完成目标:坐骑达到"..lv.."级.");
end

function check_map_nomount(player)
	local a,b,c=player:get_mount_info();
	player:set_mount_info(0,0,0);
	player:set_mount_show(0);
end


function fresh_mount_panel(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);
	
	local cur_ok = false;local next_ok = false;
	local zdt,ndt;
	if zjie <= 0 then
		ndt = zq_data[1].detail[1];
	end

	local salep = 100;
	local saleyb = 100;
	local sale1=0;
	local sale2=0;
	if activity.iszuoqidazhe() or newgui.jingcaihuodong.isOpenActivity(player,"zqzk") then
		if not isOverMaxTimes(player,false) then
			if zjie >= 0 and zjie <= 6 then
				salep = 95;
				saleyb = 95;
			end
			if zjie >= 7 and zjie <= 11 then
				salep = 88;
				saleyb = 88;
			end
			if zjie >= 12 and zjie <= 15 then
				salep = 80;
				saleyb = 80;
			end
		end
	end
	--if activity.iszuoqidazhe() then
	--	if zjie >= 0 and zjie <= 5 then
	--		salep = 95;
	--		saleyb= 95;
	--		sale1=3519;
	---		sale2=3519;
	--	end
	----	if zjie >= 6 and zjie <= 10 then
	---		salep = 88;
	---		saleyb= 88;
	---		sale1=3518;
	---		sale2=3518;
	---	end
	---	if zjie >= 11 and zjie <= 15 then
	---		salep = 80;
	---		saleyb = 80;
	---		sale1=3517;
	---		sale2=3517;
	----	end
	---	player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou1","visible","true");
	---	if util.ppn(player,const.PP_ZUOQI_YBJJ_TIMES) < 100 then
	---		player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou2","visible","true")
	---		player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou2","bgid",sale1);
	---	else
	---		player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou2","visible","false")
	---		saleyb=100;
	---	end
	---	if util.ppn(player,const.PP_ZUOQI_YJJJ_TIMES) < 20 then
	--		player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou3","visible","true")
	---		player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou3","bgid",sale2);
	--	else
	---		player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou3","visible","false")
	---		salep=100;
	---	end

	---else
	---	player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou1","visible","false");
	---	player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou2","visible","false")
	---	player:set_panel_data(PANEL_ACTIONSET_NAME,"tipzhekou3","visible","false")
	---end

	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts","text",0);
	if zjie > 0 then
		local zd = zq_data[zjie];
		if zd then
			zdt = zd.detail[zxing];
			ndt = zd.detail[zxing+1];
			if zxing == 0 then
				if zq_data[zjie-1] then
					zdt = zq_data[zjie-1].detail[10];
				end
				ndt = zq_data[zjie].detail[1];
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtZQname","text",zd.name);
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtZQname","text","坐骑预览");
		end
		if zdt then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"mcpreviewvatar","resMounts",zd.id);
			--if zxing == 0 then
			--	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtjiexing","text","("..zjie.."阶)");
			--else
			--	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtjiexing","text","("..zjie.."阶"..zxing.."星)");
			--end
			local j = zjie;local x = zxing;
			if x == 0 then
				j = j - 1; x=10;
			end
			if x == 10 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtjiexing","text","("..j.."阶"..x.."星)".."即("..(j+1).."阶)");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtjiexing","text","("..j.."阶"..x.."星)");
			end

			local zhp,zmp,zac,zac2,zmac,zmac2,zdc,zdc2,zmc,zmc2,zsc,zsc2,bjpb,bjes,nodef,fight = player:get_status_data(55+j,x);
			if j == 15 then
				zhp,zmp,zac,zac2,zmac,zmac2,zdc,zdc2,zmc,zmc2,zsc,zsc2,bjpb,bjes,nodef,fight = player:get_status_data(72,x);
			end
			if j > 15 then
				zhp,zmp,zac,zac2,zmac,zmac2,zdc,zdc2,zmc,zmc2,zsc,zsc2,bjpb,bjes,nodef,fight = player:get_status_data(72,10);
			end
			--????????????????????
			if zdc and zdc2 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc1","text",""..zdc.."-"..zdc2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc1","text",""..zmc.."-"..zmc2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc1","text",""..zsc.."-"..zsc2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac1","text",""..zac.."-"..zac2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac1","text",""..zmac.."-"..zmac2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsd1","text",zdt.speed.."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts1","text",fight);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txthswl1","text",""..(nodef/100).."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txthsmf1","text",""..(nodef/100).."%");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts","text",fight);
				cur_ok = true;
			end
		end
	end
	if ndt then
		local nj = zjie;local nx = zxing+1;
		if nj > 0 and nx == 0 then
			nj = nj; nx=1;
		end
		if nj == 0 then
			nj = 1; nx=1;
		end
		if nj == 16 then
			nj = 15; nx=10;
		end
		local zhp,zmp,zac,zac2,zmac,zmac2,zdc,zdc2,zmc,zmc2,zsc,zsc2,bjpb,bjes,nodef,fight = player:get_status_data(55+nj,nx);
		if nj == 15 then
			zhp,zmp,zac,zac2,zmac,zmac2,zdc,zdc2,zmc,zmc2,zsc,zsc2,bjpb,bjes,nodef,fight = player:get_status_data(72,nx);
		end
		if nj > 15 then
			zhp,zmp,zac,zac2,zmac,zmac2,zdc,zdc2,zmc,zmc2,zsc,zsc2,bjpb,bjes,nodef,fight = player:get_status_data(72,10);
		end

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc2","text",""..zdc.."-"..zdc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc2","text",""..zmc.."-"..zmc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc2","text",""..zsc.."-"..zsc2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac2","text",""..zac.."-"..zac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac2","text",""..zmac.."-"..zmac2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsd2","text",ndt.speed.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts2","text",fight);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthswl2","text",""..(nodef/100).."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthsmf2","text",""..(nodef/100).."%");
		next_ok = true;
	end
	if not cur_ok then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtZQname","text","坐骑预览");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsd1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthswl1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthsmf1","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts1","text","0");
	end
	if not next_ok then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsd2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthswl2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthsmf2","text","0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts2","text","0");
	end
	--十个星级
	for i=1,10 do
		if zjie > 0 and zxing == 0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcZQ"..i,"bgid",4100);
		else
			if i <= zxing then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcZQ"..i,"bgid",4100);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcZQ"..i,"bgid",4101);
			end
		end
	end

	if zjie >= MAX_ZUOQI_LV then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYJTS","tooltip_text","坐骑达到最大等级,无需提升.");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYBTS","tooltip_text","坐骑达到最大等级,无需提升.");
	end
	if ndt then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zuoqi","mountExpMax",ndt.needexp);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zuoqi","mountExp",zexp);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmountjy","text",""..zexp.."/"..ndt.needexp);
		local need = ndt.needexp - zexp;
		local cost = math.floor(need*3/1000*salep/100);
		if cost <= 0 then cost = 1 end
		local jcost = math.floor(300*saleyb/100);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYJTS","tooltip_text","消耗"..cost.."元宝一键提升等级.");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYBTS","tooltip_text","消耗"..jcost.."元宝获得100000经验.");
	else
		if lv == MAX_ZUOQI_LV then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmountjy","text",""..zexp.."/"..zq_data[14].detail[10].needexp);
			player:set_panel_data(PANEL_ACTIONSET_NAME,ACTIONSET_NAME,"mountExpMax",zq_data[14].detail[10].needexp);
			player:set_panel_data(PANEL_ACTIONSET_NAME,ACTIONSET_NAME,"mountExp",zexp);
		end
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"yubaodazhepic","bgid","0");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"yijiandazhepic","bgid","0");
	if newgui.jingcaihuodong.isOpenActivity(player,"zqzk") then
		if not isOverMaxTimes(player,false) then
			if zjie >= 0 and zjie <= 6 then --95
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yubaodazhepic","bgid","3519");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yijiandazhepic","bgid","3519");
			end
			if zjie >=7 and zjie <= 11 then--88
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yubaodazhepic","bgid","3518");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yijiandazhepic","bgid","3518");
			end
			if zjie >= 12 and zjie <= 15 then--80
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yubaodazhepic","bgid","3517");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"yijiandazhepic","bgid","3517");
			end
		end
	end
	if zjie >= 8 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbeast","grayFilter","false");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnbeast","grayFilter","true");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	if zjie >= 8 then
		newgui.beast.setZuoqi(player,zq_data[zjie].id);
	end
end

-------------------------------------------------------------------------------------------
--坐骑预览
local YULAN_FUNCTION="zuoqiPre";
local PANEL_YULAN_FUNCTION="panelzuoqiPre";
local mount_data={
	["tmount1"]={lv=1,mount=2001,name="黑鬃马(1阶)",attr={attmin=6,attmax=10,defmin=3,defmax=5,nodef=1,fight=88,speed=4},},
	["tmount2"]={lv=2,mount=2002,name="白良马(2阶)",attr={attmin=12,attmax=20,defmin=6,defmax=10,nodef=2,fight=176,speed=8},},
	["tmount3"]={lv=3,mount=2003,name="赤红马(3阶)",attr={attmin=24,attmax=40,defmin=9,defmax=15,nodef=4,fight=352,speed=12},},
	["tmount4"]={lv=4,mount=2004,name="斑斓虎(4阶)",attr={attmin=36,attmax=60,defmin=12,defmax=20,nodef=6,fight=496,speed=16},},
	["tmount5"]={lv=5,mount=2005,name="苍云虎(5阶)",attr={attmin=54,attmax=90,defmin=15,defmax=25,nodef=9,fight=656,speed=20},},
	["tmount6"]={lv=6,mount=2006,name="啸天虎(6阶)",attr={attmin=81,attmax=136,defmin=18,defmax=30,nodef=12,fight=1017,speed=24},},
	["tmount7"]={lv=7,mount=2007,name="震威战狮(7阶)",attr={attmin=125,attmax=209,defmin=21,defmax=35,nodef=15,fight=1435,speed=28},},
	["tmount8"]={lv=8,mount=2008,name="血影雄狮(8阶)",attr={attmin=195,attmax=326,defmin=24,defmax=40,nodef=20,fight=2083,speed=32},},
	["tmount9"]={lv=9,mount=2009,name="金甲圣狮(9阶)",attr={attmin=309,attmax=515,defmin=27,defmax=45,nodef=30,fight=3130,speed=36},},
	["tmount10"]={lv=10,mount=2010,name="赤焰火麒麟(10阶)",attr={attmin=494,attmax=824,defmin=30,defmax=50,nodef=40,fight=4820,speed=40},},
	["tmount11"]={lv=11,mount=2011,name="碧玉蓝麒麟(11阶)",attr={attmin=800,attmax=1334,defmin=42,defmax=70,nodef=55,fight=7409,speed=45},},
	["tmount12"]={lv=12,mount=2012,name="至尊金麒麟(12阶)",attr={attmin=1312,attmax=2187,defmin=60,defmax=100,nodef=80,fight=11690,speed=50},},
	["tmount13"]={lv=13,mount=2013,name="赤焰混天蛟(13阶)",attr={attmin=1824,attmax=3040,defmin=80,defmax=130,nodef=85,fight=15971,speed=55},},
	["tmount14"]={lv=14,mount=2014,name="碧玉焚天蛟(14阶)",attr={attmin=2336,attmax=3893,defmin=100,defmax=160,nodef=90,fight=20252,speed=60},},
	["tmount15"]={lv=15,mount=2015,name="至尊诛天蛟(15阶)",attr={attmin=2848,attmax=4746,defmin=120,defmax=190,nodef=95,fight=24533,speed=65},},
	["tmount16"]={lv=16,mount=2016,name="霸天玄黄龙(16阶)",attr={attmin=3368,attmax=5606,defmin=140,defmax=220,nodef=95,fight=28823,speed=65},},
};
function process_yulan(player,actionset,panelid,actionid,data)
	local m_data = mount_data[actionid];
	if m_data then
		player:set_panel_data("panelzuoqiPre","mcpreviewvatar1","resMounts",m_data.mount);
		player:set_panel_data("panelzuoqiPre","txtPrexname","text",m_data.name);
		player:set_panel_data("panelzuoqiPre","txtPdc","text",""..m_data.attr.attmin.."-"..m_data.attr.attmax);
		player:set_panel_data("panelzuoqiPre","txtPmc","text",""..m_data.attr.attmin.."-"..m_data.attr.attmax);
		player:set_panel_data("panelzuoqiPre","txtPsc","text",""..m_data.attr.attmin.."-"..m_data.attr.attmax);
		player:set_panel_data("panelzuoqiPre","txtPac","text",""..m_data.attr.defmin.."-"..m_data.attr.defmax);
		player:set_panel_data("panelzuoqiPre","txtPmac","text",""..m_data.attr.defmin.."-"..m_data.attr.defmax);
		player:set_panel_data("panelzuoqiPre","txtPbjp","text",m_data.attr.speed.."%");
		player:set_panel_data("panelzuoqiPre","txtPwufang","text",""..m_data.attr.nodef.."%");
		player:set_panel_data("panelzuoqiPre","txtPmofang","text",""..m_data.attr.nodef.."%");
		player:set_panel_data("panelzuoqiPre","txtPzhanli","text",m_data.attr.fight);
		player:push_ckpanel_data("zuoqiPre","panelzuoqiPre");
		player:push_ckpanel_data(YULAN_FUNCTION,PANEL_YULAN_FUNCTION);
	end
end
ckpanel.add_listener(YULAN_FUNCTION,process_yulan);

function get_shouling_plus(player)
	local zq = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	if zq >= 8 then
		if zxing == 0 then zq=zq-1;zxing=10;end
		local zd = zq_data[zq];
		if zd then
			local dd = zd.detail[zxing];
			if dd then
				return dd.slplus;
			end
		end
	end
	return 0;
end

function mountAddStar(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);
------------------------------------------------------------
------------------------------------------------------------
	if zjie >= MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); return; end

	local zdt,ndt;local jinjie = false;
	local zd = zq_data[zjie];
	if zd then
		ndt = zd.detail[zxing+1];
		--if zxing == 0 then
		--	ndt = zq_data[zjie+1].detail[1];
		--end
	else
		ndt = zq_data[1].detail[1];
	end
	if ndt then
			if zjie <= 0 then zjie = 1; jinjie = true; end
			zxing = zxing + 1;
			local sj = zjie;local sx=zxing;
			if zxing == 10 then
				zxing = 0;
				zjie = zjie +1;
				jinjie = true;
			end
			player:set_param(const.PP_NEW_ZUOQI_JIE_LEVEL,zjie);
			player:set_param(const.PP_NEW_ZUOQI_XING_LEVEL,zxing);
			for i = math.max(56,55+zjie-1),55+zjie do
				player:clear_status(i);
			end
			player:set_status(55+sj,86400,sx,1,1);
			player:set_model(7,zjie);
			newgui.property.fresh_self_info(player);

			if jinjie == true then
				achieve_active_zuoqi(player);
				server.info(10,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..zq_data[zjie].name.."</font>][<a href='event:push_local_panelzuoqi'><u><font color='#00FF00'>提升坐骑</font></u></a>]");
			end
			doSLLoginLogic(player);
			player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"panelzuoqi","panel_visible","true");
			fresh_mount_panel(player);
	end
end
