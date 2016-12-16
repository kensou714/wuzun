module(..., package.seeall)
local ACTIONSET_NAME="showpost";
local PANEL_ACTIONSET_NAME="panelshowpost";



local xx={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};

local gz_data={
[0]={gjmin=0,gjmax=0,hsstone=0,bdvcoin=0,bdgamemoney=0,name="无业游民",needlevel=0,needtj1="  ",needtj2="  "},
[1]={gjmin=6,gjmax=10,hsstone=500,bdvcoin=500,bdgamemoney=5000,name="九品将兵都卫",needlevel=10,needtj1="绑定金币:100000",needtj2="  "},
[2]={gjmin=12,gjmax=20,hsstone=600,bdvcoin=600,bdgamemoney=10000,name="八品抚夷护军",needlevel=15,needtj1="金矿*1",needtj2="  "},
[3]={gjmin=24,gjmax=40,hsstone=700,bdvcoin=700,bdgamemoney=150000,name="七品安夷护军",needlevel=20,needtj1="魂石*100",needtj2="  "},
[4]={gjmin=36,gjmax=60,hsstone=800,bdvcoin=800,bdgamemoney=200000,name="六品讨寇校卫",needlevel=25,needtj1= "魂石*500",needtj2="  "},
[5]={gjmin=48,gjmax=80,hsstone=900,bdvcoin=900,bdgamemoney=250000,name="五品平寇校卫",needlevel=30,needtj1="魂石*1000",needtj2="  "},
[6]={gjmin=72,gjmax=120,hsstone=1000,bdvcoin=1000,bdgamemoney=300000,name="四品破虏将军",needlevel=35,needtj1="魂石*2000",needtj2="  "},
[7]={gjmin=96,gjmax=160,hsstone=1100,bdvcoin=1100,bdgamemoney=350000,name="三品平虏将军",needlevel=40,needtj1="魂石*5000",needtj2=	" "},
[8]={gjmin=120,gjmax=200,hsstone=1200,bdvcoin=1200,bdgamemoney=400000,name="二品车骑将军",needlevel=45,needtj1="魂石*10000",needtj2=" "},
[9]={gjmin=156,gjmax=260,hsstone=1300,bdvcoin=1300,bdgamemoney=450000,name="一品骠骑将军",needlevel=50,needtj1="魂石*20000",needtj2="七彩石*1"},
[10]={gjmin=190,gjmax=320,hsstone=1400,bdvcoin=1400,bdgamemoney=500000,name="抚国大将军",needlevel=55,needtj1="魂石*30000",needtj2="七彩石*2"},
[11]={gjmin=240,gjmax=400,hsstone=1500,bdvcoin=1500,bdgamemoney=550000,name="镇国大将军",needlevel=60,needtj1="魂石*40000",needtj2="七彩石*4"},
[12]={gjmin=300,gjmax=500,hsstone=2000,bdvcoin=2000,bdgamemoney=600000,name="兵马大元帅",needlevel=65,needtj1="魂石*50000",needtj2="七彩石*6"},
[13]={gjmin=420,gjmax=700,hsstone=2500,bdvcoin=2500,bdgamemoney=700000,name="镇北玄武王",needlevel=70,needtj1="魂石*60000",needtj2="神器积分*1000"},
[14]={gjmin=600,gjmax=1000,hsstone=3000,bdvcoin=3000,bdgamemoney=800000,name="镇西白虎王",needlevel=75,needtj1="魂石*70000",needtj2="神器积分*1500"},
[15]={gjmin=840,gjmax=1400,hsstone=3500,bdvcoin=3500,bdgamemoney=900000,name="镇南朱雀王",needlevel=80,needtj1="魂石*80000",needtj2="神器积分*2500"},
[16]={gjmin=1200,gjmax=2000,hsstone=4000,bdvcoin=4000,bdgamemoney=1000000,name="镇东青龙王",needlevel=85,needtj1="魂石*100000",needtj2="神器积分*3500"},
};


function process_showpos(player,actionset,panelid,actionid,data)
		if actionid=="btnpost" then
			player:set_panel_data("panelshowpost","dhlinngpai2","visible","false");
			player:push_ckpanel_data("showpost","panelshowpost");
			player:script_exe_code("newgui.newguanzhi.onTalkz100");
			return;
		end
		if actionid== "btnget" then
			Lqsalary(player);
			return;
		end
		if actionid == "btnnew" then	
			Tsgz(player);
			return;
		end
		if actionid == "btnduihuan" then	
			player:script_exe_code("newgui.newguanzhi.onTalkdhryz");
		return;
		end
		if string.sub(actionid,1,5) =="btnGZ" then
			local mm = tonumber(string.sub(actionid,6));
			freshPanel(player,mm);
			return;
		end
end
ckpanel.add_listener(ACTIONSET_NAME,process_showpos);

function freshGzPanel(player)
	yiwancheng(player)
	if util.ppn(player,const.PP_GUANZHI) ==7  then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needlevel);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed11","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj1);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed12","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"NowGZname","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needlevel);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needtj1);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",xx[player:get_job_name()].."*1");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].name);
	else
		if util.ppn(player,const.PP_GUANZHI) ==8 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needlevel);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed11","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj1);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed12","text",xx[player:get_job_name()].."*1");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"NowGZname","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needlevel);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needtj1);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needtj2);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].name);
		else
			if util.ppn(player,const.PP_GUANZHI) <=15 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needlevel);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed11","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj1);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed12","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"NowGZname","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);

				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needlevel);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needtj1);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].needtj2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].hsstone);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdvcoin);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdgamemoney);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].name);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needlevel);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed11","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj1);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed12","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc1","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney1","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"NowGZname","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);

				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needlevel);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj1);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",gz_data[util.ppn(player,const.PP_GUANZHI)].needtj2);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);
			end
		end
	end
	wancheng(player,util.ppn(player,const.PP_GUANZHI)+1);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"stonenum","text",util.ppn(player,const.PP_HUNSHI));
	if  util.ppn(player,const.PP_GUANZHI)+1 < 5 then
		player:set_panel_data("panelshowpost","guanzhis","Xpage","0");
	else
		if util.ppn(player,const.PP_GUANZHI)+1 <= 10 then
			player:set_panel_data("panelshowpost","guanzhis","Xpage","1");
		else
			if  util.ppn(player,const.PP_GUANZHI)+1 <= 17 then
				player:set_panel_data("panelshowpost","guanzhis","Xpage","2");
			end
		end
	end
	player:set_panel_data("panelshowpost","showguanzhilist","selectedIndex",util.ppn(player,const.PP_GUANZHI)+1);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshGzPanel)

local wc_data={
[0] ={0,0,0},
[1] ={10,100000},
[2] ={15,1},
[3] ={20,100},
[4] ={25,500},
[5] ={30,1000},
[6] ={35,2000},
[7] ={40,5000},
[8] ={45,10000,1},
[9] ={50,20000,1},
[10] ={55,30000,2},
[11] ={60,40000,4},
[12] ={65,50000,6},
[13] ={70,60000,1000},
[14] ={75,70000,1500},
[15] ={80,80000,2500},
[16] ={85,100000,3500},
};
function wancheng(player,m)
	if m == util.ppn(player,const.PP_GUANZHI) + 1 then
		if util.ppn(player,const.PP_GUANZHI) == 0 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end

			if player:get_gamemoney_bind() >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 1 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if player:num_item("金矿",1) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 2 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI)>= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 3 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 4 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end

		if util.ppn(player,const.PP_GUANZHI) == 5 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 6 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
		end

		if util.ppn(player,const.PP_GUANZHI) == 7 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end
			if player:num_item(xx[player:get_job_name()],1)  >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 8 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if player:num_item("七彩石",1) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 9 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if player:num_item("七彩石",1) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 10 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if player:num_item("七彩石",1) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 11 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if player:num_item("七彩石",1) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 12 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if util.ppn(player,const.PP_SQJF) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 13 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if util.ppn(player,const.PP_SQJF) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 14 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if util.ppn(player,const.PP_SQJF) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
		if util.ppn(player,const.PP_GUANZHI) == 15 then
			if player:get_level() >= wc_data[m][1] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
			end
			if util.ppn(player,const.PP_HUNSHI) >= wc_data[m][2] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
			end

			if util.ppn(player,const.PP_SQJF) >= wc_data[m][3] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
			end
		end
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou1","visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou2","visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"duigou3","visible","false");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function freshPanel(player,mm)
	if mm ~= util.ppn(player,const.PP_GUANZHI)+1 then
		if mm == 8 then	
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[mm].needlevel);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[mm].needtj1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",xx[player:get_job_name()].."*1");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[mm].hsstone);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[mm].bdvcoin);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[mm].bdgamemoney);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[mm].name);
		else			
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[mm].needlevel);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[mm].needtj1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",gz_data[mm].needtj2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[mm].hsstone);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[mm].bdvcoin);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[mm].bdgamemoney);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[mm].name);
		end	
	else
		if mm == 8 then		
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[mm].needlevel);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[mm].needtj1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",xx[player:get_job_name()].."*1");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[mm].hsstone);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[mm].bdvcoin);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[mm].bdgamemoney);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[mm].name);
		else			
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneedlv","text",gz_data[mm].needlevel);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed21","text",gz_data[mm].needtj1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNneed22","text",gz_data[mm].needtj2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZdc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZmc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGZsc","text",""..gz_data[mm].gjmin.."-"..gz_data[mm].gjmax);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgethunshi","text",gz_data[mm].hsstone);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetvcoin","text",gz_data[mm].bdvcoin);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtgetgmoney","text",gz_data[mm].bdgamemoney);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"NextGzname","text",gz_data[mm].name);
		end
	end
	wancheng(player,mm);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"stonenum","text",util.ppn(player,const.PP_HUNSHI));
	if  mm <= 5 then
		player:set_panel_data("panelshowpost","guanzhis","Xpage","0");
	else
		if mm <= 11 then
			player:set_panel_data("panelshowpost","guanzhis","Xpage","1");
		else
			if  mm <= 16 then
				player:set_panel_data("panelshowpost","guanzhis","Xpage","2");
			end
		end
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"showguanzhilist","selectedIndex",mm);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function yiwancheng(player)
	if util.ppn(player,const.PP_GUANZHI) >16 then return; end
	local bb = util.ppn(player,const.PP_GUANZHI);
	for i = 0, 16 do
		if i <= bb then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnGZz"..i,"grayFilter","false");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnGZz"..i,"grayFilter","true");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end



function Lqsalary(player)
	if util.ppn(player,const.PP_FENGLU) ~= today() then
		if util.ppn(player,const.PP_GUANZHI) == 0 then
				player:alert(11,1,"您还没有官职,无法领取俸禄!");
		end
		if util.ppn(player,const.PP_GUANZHI) == 1 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+500);
				player:add_vcoin_bind(500);
				player:add_gamemoney_bind(50000);
				player:alert(11,1,"领取[九品将兵都卫]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:50000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 2 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+600);
				player:add_vcoin_bind(600);
				player:add_gamemoney_bind(100000);
				player:alert(11,1,"领取[八品抚夷护军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:600</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:600</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:100000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 3 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+700);
				player:add_vcoin_bind(700);
				player:add_gamemoney_bind(150000);
				player:alert(11,1,"领取[七品安夷护军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:700</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:700</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:150000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 4 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+800);
				player:add_vcoin_bind(800);
				player:add_gamemoney_bind(200000);
				player:alert(11,1,"领取[六品讨寇校卫]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:800</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:800</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:200000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 5 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+900);
				player:add_vcoin_bind(900);
				player:add_gamemoney_bind(250000);
				player:alert(11,1,"领取[五品平寇校卫]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:900</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:900</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:250000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 6 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1000);
				player:add_vcoin_bind(1000);
				player:add_gamemoney_bind(300000);
				player:alert(11,1,"领取[四品破虏将军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:1000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:1000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:300000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 7 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1100);
				player:add_vcoin_bind(1100);
				player:add_gamemoney_bind(350000);
				player:alert(11,1,"领取[三品平虏将军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:1100</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:1100</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:350000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 8 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1200);
				player:add_vcoin_bind(1200);
				player:add_gamemoney_bind(400000);
				player:alert(11,1,"领取[二品车骑将军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:1200</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:1200</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:400000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 9 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1300);
				player:add_vcoin_bind(1300);
				player:add_gamemoney_bind(450000);
				player:alert(11,1,"领取[一品骠骑将军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:1300</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:1300</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:450000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 10 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1400);
				player:add_vcoin_bind(1400);
				player:add_gamemoney_bind(500000);
				player:alert(11,1,"领取[抚国大将军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:1400</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:1400</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:500000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 11 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1500);
				player:add_vcoin_bind(1500);
				player:add_gamemoney_bind(550000);
				player:alert(11,1,"领取[镇国大将军]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:1500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:1500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:550000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 12 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+2000);
				player:add_vcoin_bind(2000);
				player:add_gamemoney_bind(600000);
				player:alert(11,1,"领取[兵马大元帅]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:2000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:2000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:600000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 13 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+2500);
				player:add_vcoin_bind(2500);
				player:add_gamemoney_bind(700000);
				player:alert(11,1,"领取[镇北玄武王]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:2500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:2500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:700000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 14 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+3000);
				player:add_vcoin_bind(3000);
				player:add_gamemoney_bind(800000);
				player:alert(11,1,"领取[镇西白虎王]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:3000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:3000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:800000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 15 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+3500);
				player:add_vcoin_bind(3500);
				player:add_gamemoney_bind(900000);
				player:alert(11,1,"领取[镇南朱雀王]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:3500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:3500</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:900000</font>");
		end
		if util.ppn(player,const.PP_GUANZHI) == 16 and util.ppn(player,const.PP_FENGLU) ~= today() then
				player:set_param(const.PP_FENGLU,today());
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+4000);
				player:add_vcoin_bind(4000);
				player:add_gamemoney_bind(1000000);
				player:alert(11,1,"领取[镇东青龙王]俸禄,获得:");
				player:alert(11,0,"<font color='#ff0000'>魂    石:4000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝:4000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币:1000000</font>");
				freshGzPanel(player);
		end
	else
		player:alert(1,1,"官职俸禄每天只可以领取1次哦!");
	end
	freshGzPanel(player);
end
function Tsgz(player)
	if util.ppn(player,const.PP_GUANZHI) >=16 then freshGzPanel(player);  player:alert(11,1,"您的官职已经为镇东青龙王，不需要提升了哦！！"); return;end
	if util.ppn(player,const.PP_GUANZHI) == 0 then
		if player:get_level() >= 10 then
			if player:get_gamemoney_bind() >= 100000 then
				if player:num_bag_black() >= 1 then
					player:sub_gamemoney_bind(100000);
					player:set_param(const.PP_GUANZHI,1);
					player:set_param(const.PP_ACHIEVE_GUANZHI1,10);
					player:set_param(const.PP_ACHIEVE_FIRSTGUANZHI,10);
					player:alert(11,1,"恭喜您成功完成目标:第一次提升官职.");
					player:alert(11,1,"恭喜您成功完成目标:官职达到1级.");
					player:push_guide_info("panelminimapfun","btnAchieve",2);
					newgui.achieve.fresh_achieve_title(player,5);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,1);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					--player:add_item("九品将兵官印",1,1,0,0,0,0,0,0,0,0,0,2);
					--player:alert(11,1,"恭喜您成功提升为[九品将兵都卫],获得[九品将兵官印]");
				else
					player:alert(1,1,"您的背包空格不足1格.小心九品官印掉下地哦!")
				end
			else
				player:alert(11,1,"提升[九品将兵都卫]需要绑定金币[100000]!");
			end
		else
			player:alert(11,1,"提升[九品将兵都卫]需要等级10级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 1 then
		if player:get_level() >= 15 then
			if player:num_item("金矿",1) >= 1 then
				player:remove_item("金矿",1);
				player:set_param(const.PP_GUANZHI,2);
				player:set_param(const.PP_ACHIEVE_GUANZHI2,10);
				player:alert(11,1,"恭喜您成功完成目标:官职达到2级.");
				newgui.achieve.fresh_achieve_title(player,5);
				player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
				player:set_model(8,2);
				npc.renwu.fenghao.youxifh(player);
				newgui.property.fresh_self_info(player);
				player:alert(11,1,"恭喜您成功提升为[八品抚夷护军]");
			else
				player:alert(11,1,"提升[八品抚夷护军]需要[金矿*1]");
				player:alert(11,0,"[矿石]可以从[僵尸洞穴]进入[采矿区域]获得!!");
			end
		else
			player:alert(11,1,"提升[八品抚夷护军]需要等级15级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 2 then
		if player:get_level() >= 20 then
		if util.ppn(player,const.PP_HUNSHI) >= 100 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-100);
				player:set_param(const.PP_GUANZHI,3);
				player:set_param(const.PP_ACHIEVE_GUANZHI3,10);
				player:alert(11,1,"恭喜您成功完成目标:官职达到3级.");
				newgui.achieve.fresh_achieve_title(player,5);
				player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
				player:set_model(8,3);
				npc.renwu.fenghao.youxifh(player);
				newgui.property.fresh_self_info(player);
				player:alert(11,1,"恭喜您成功提升为[七品安夷护军]");
			else
				player:alert(11,1,"提升[七品安夷护军]需要[魂石*100]!");
				player:alert(11,0,"[魂石]可通过[装备回收]或元宝兑换!");
			end
		else
			player:alert(11,1,"提升[七品安夷护军]需要等级20级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 3 then
		if player:get_level() >= 25 then
		if util.ppn(player,const.PP_HUNSHI) >= 500 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-500);
				player:set_param(const.PP_GUANZHI,4);
				player:set_param(const.PP_ACHIEVE_GUANZHI4,10);
				player:alert(11,1,"恭喜您成功完成目标:官职达到4级.");
				newgui.achieve.fresh_achieve_title(player,5);
				player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
				player:set_model(8,4);
				npc.renwu.fenghao.youxifh(player);
				newgui.property.fresh_self_info(player);
				player:alert(11,1,"恭喜您成功提升为[六品讨寇校卫]");
			else
				player:alert(11,1,"提升[六品讨寇校卫]需要[魂石*500]!");
				player:alert(11,0,"[魂石]可通过[装备回收]或元宝兑换!");
			end
		else
			player:alert(11,1,"提升[六品讨寇校卫]需要等级25级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 4 then
		if player:get_level() >= 30 then
		if util.ppn(player,const.PP_HUNSHI) >= 1000 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-1000);
				player:set_param(const.PP_GUANZHI,5);
				player:set_param(const.PP_ACHIEVE_GUANZHI5,10);
				player:alert(11,1,"恭喜您成功完成目标:官职达到5级.");
				newgui.achieve.fresh_achieve_title(player,5);
				player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
				player:set_model(8,5);
				npc.renwu.fenghao.youxifh(player);
				newgui.property.fresh_self_info(player);
				player:alert(11,1,"恭喜您成功提升为[五品平寇校卫]");
			else
				player:alert(11,1,"提升[五品平寇校卫]需要[魂石*1000]!");
				player:alert(11,0,"[魂石]可通过[装备回收]或元宝兑换!");
			end
		else
			player:alert(11,1,"提升[五品平寇校卫]需要等级30级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 5 then
		if player:get_level() >= 35 then
		if util.ppn(player,const.PP_HUNSHI) >= 2000 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-2000);
				player:set_param(const.PP_GUANZHI,6);
				player:set_param(const.PP_ACHIEVE_GUANZHI6,10);
				player:alert(11,1,"恭喜您成功完成目标:官职达到6级.");
				newgui.achieve.fresh_achieve_title(player,5);
				player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
				player:set_model(8,6);
				npc.renwu.fenghao.youxifh(player);
				newgui.property.fresh_self_info(player);
				player:alert(11,1,"恭喜您成功提升为[四品破虏将军]");
			else
				player:alert(11,1,"提升[四品破虏将军]需要[魂石*2000]!");
			end
		else
			player:alert(11,1,"提升[四品破虏将军]需要等级35级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 6 then
		if player:get_level() >= 40 then
			if util.ppn(player,const.PP_HUNSHI) >= 5000 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-5000);
				player:set_param(const.PP_GUANZHI,7);
				player:set_param(const.PP_ACHIEVE_GUANZHI7,10);
				player:alert(11,1,"恭喜您成功完成目标:官职达到7级.");
				newgui.achieve.fresh_achieve_title(player,5);
				player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
				player:set_model(8,7);
				npc.renwu.fenghao.youxifh(player);
				newgui.property.fresh_self_info(player);
				player:alert(11,1,"恭喜您成功提升为[三品平虏将军]");
			else
				player:alert(11,1,"提升[三品平虏将军]需要[魂石*5000]!");
			end
		else
			player:alert(11,1,"提升[三品平虏将军]需要等级40级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 7 then
		if player:get_level() >= 45 then
			if util.ppn(player,const.PP_HUNSHI) >= 10000 then
			local x={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};
				if player:num_item(x[player:get_job_name()],1) >= 1 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-10000);
					player:remove_item(x[player:get_job_name()],1);
					player:set_param(const.PP_GUANZHI,8);
					player:set_param(const.PP_ACHIEVE_GUANZHI8,10);
					player:alert(11,1,"恭喜您成功完成目标:官职达到8级.");
					newgui.achieve.fresh_achieve_title(player,5);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,8);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					player:alert(11,1,"恭喜您成功提升为[二品车骑将军]");
				else
					player:alert(11,1,"提升[二品车骑将军]需要["..x[player:get_job_name()].."*1]");
				end
			else
				player:alert(11,1,"提升[二品车骑将军]需要[魂石*10000]!");
			end
		else
			player:alert(11,1,"提升[二品车骑将军]需要等级45级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 8 then
		if player:get_level() >= 50 then
			if util.ppn(player,const.PP_HUNSHI) >= 20000 then
				if player:num_item("七彩石",1) >= 1 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-20000);
					player:remove_item("七彩石",1);
					player:set_param(const.PP_GUANZHI,9);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",9);
					player:set_param(const.PP_ACHIEVE_GUANZHI9,10);
					player:alert(11,1,"恭喜您成功完成目标:官职达到9级.");
					newgui.achieve.fresh_achieve_title(player,5);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,9);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>一品骠骑将军</font>]");
					player:alert(11,1,"恭喜您成功提升为[一品骠骑将军]");
				else
					player:alert(11,1,"提升[一品骠骑将军]需要[七彩石*1]!");
				end
			else
				player:alert(11,1,"提升[一品骠骑将军]需要[魂石*20000]!");
			end
		else
			player:alert(11,1,"提升[一品骠骑将军]需要等级50级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 9 then
		if player:get_level() >= 55 then
			if util.ppn(player,const.PP_HUNSHI) >= 30000 then
				if player:num_item("七彩石",1) >= 2 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-30000);
					player:remove_item("七彩石",2);
					player:set_param(const.PP_GUANZHI,10);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",10);
					player:set_param(const.PP_ACHIEVE_GUANZHI10,10);
					player:alert(11,1,"恭喜您成功完成目标:官职达到10级.");
					newgui.achieve.fresh_achieve_title(player,5);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,10);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[抚国大将军]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>抚国大将军</font>]");
					player:alert(11,1,"恭喜您成功提升为[抚国大将军]");
				else
					player:alert(11,1,"提升[抚国大将军]需要[七彩石*2]!");
				end
			else
				player:alert(11,1,"提升[抚国大将军]需要[魂石*30000]!");
			end
		else
			player:alert(11,1,"提升[抚国大将军]需要等级55级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 10 then
		if player:get_level() >= 60 then
			if util.ppn(player,const.PP_HUNSHI) >= 40000 then
				if player:num_item("七彩石",1) >= 4 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-40000);
					player:remove_item("七彩石",4);
					player:set_param(const.PP_GUANZHI,11);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",11);
					player:set_param(const.PP_ACHIEVE_GUANZHI11,10);
					player:alert(11,1,"恭喜您成功完成目标:官职达到11级.");
					newgui.achieve.fresh_achieve_title(player,5);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,11);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[镇国大将军]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>镇国大将军</font>]");
					player:alert(11,1,"恭喜您成功提升为[镇国大将军]");
				else
					player:alert(11,1,"提升[镇国大将军]需要[七彩石*4]!");
				end
			else
				player:alert(11,1,"提升[镇国大将军]需要[魂石*40000]!");
			end
		else
			player:alert(11,1,"提升[镇国大将军]需要等级60级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 11 then
		if player:get_level() >= 65 then
			if util.ppn(player,const.PP_HUNSHI) >= 50000 then
				if player:num_item("七彩石",1) >= 6 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-50000);
					player:remove_item("七彩石",6);
					player:set_param(const.PP_GUANZHI,12);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",12);
					player:set_param(const.PP_ACHIEVE_GUANZHI12,10);
					player:alert(11,1,"恭喜您成功完成目标:官职达到12级.");
					newgui.achieve.fresh_achieve_title(player,5);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,12);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[兵马大元帅]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>兵马大元帅</font>]");
					player:alert(11,1,"恭喜您成功提升为[兵马大元帅]");
				else
					player:alert(11,1,"提升[兵马大元帅]需要[七彩石*6]!");
				end
			else
				player:alert(11,1,"提升[兵马大元帅]需要[魂石*50000]!");
			end
		else
			player:alert(11,1,"提升[兵马大元帅]需要等级65级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 12 then
		if player:get_level() >= 70 then
			if util.ppn(player,const.PP_HUNSHI) >= 60000 then
				if util.ppn(player,const.PP_SQJF) >= 1000 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-60000);
					player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-1000);
					player:set_param(const.PP_GUANZHI,13);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",13);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,13);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[镇北玄武王]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>镇北玄武王</font>]");
					player:alert(11,1,"恭喜您成功提升为[镇北玄武王]");
				else
					player:alert(11,1,"提升[镇北玄武王]需要[神器积分*1000]!");
				end
			else
				player:alert(11,1,"提升[镇北玄武王]需要[魂石*60000]!");
			end
		else
			player:alert(11,1,"提升[镇北玄武王]需要等级70级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 13 then
		if player:get_level() >= 75 then
			if util.ppn(player,const.PP_HUNSHI) >= 70000 then
				if util.ppn(player,const.PP_SQJF) >= 1500 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-70000);
					player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-1500);
					player:set_param(const.PP_GUANZHI,14);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",14);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,14);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[镇西白虎王]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>镇西白虎王</font>]");
					player:alert(11,1,"恭喜您成功提升为[镇西白虎王]");
				else
					player:alert(11,1,"提升[镇西白虎王]需要[神器积分*1500]!");
				end
			else
				player:alert(11,1,"提升[镇西白虎王]需要[魂石*70000]!");
			end
		else
			player:alert(11,1,"提升[镇西白虎王]需要等级75级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 14 then
		if player:get_level() >= 80 then
			if util.ppn(player,const.PP_HUNSHI) >= 80000 then
				if util.ppn(player,const.PP_SQJF) >= 2500 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-80000);
					player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-2500);
					player:set_param(const.PP_GUANZHI,15);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",15);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,15);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[镇南朱雀王]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>镇南朱雀王</font>]");
					player:alert(11,1,"恭喜您成功提升为[镇南朱雀王]");
				else
					player:alert(11,1,"提升[镇南朱雀王]需要[神器积分*2500]!");
				end
			else
				player:alert(11,1,"提升[镇南朱雀王]需要[魂石*80000]!");
			end
		else
			player:alert(11,1,"提升[镇南朱雀王]需要等级80级!");
		end
			freshGzPanel(player);
		return;
	end
	if util.ppn(player,const.PP_GUANZHI) == 15 then
		if player:get_level() >= 85 then
			if util.ppn(player,const.PP_HUNSHI) >= 100000 then
				if util.ppn(player,const.PP_SQJF) >= 3500 then
					player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-100000);
					player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-3500);
					player:set_param(const.PP_GUANZHI,16);
					newgui.jingcaihuodong.setawardpcon(player,"gzsj",16);
					player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
					player:set_model(8,16);
					npc.renwu.fenghao.youxifh(player);
					newgui.property.fresh_self_info(player);
					server.info(10000,0,player:get_name().."在沙漠土城[官职系统]成功提升为[镇东青龙王]");
					server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在沙漠土城[官职系统]成功提升为[<font color='#ff0000'>镇东青龙王</font>]");
					player:alert(11,1,"恭喜您成功提升为[镇东青龙王]");
				else
					player:alert(11,1,"提升[镇东青龙王]需要[神器积分*3500]!");
				end
			else
				player:alert(11,1,"提升[镇东青龙王]需要[魂石*100000]!");
			end
		else
			player:alert(11,1,"提升[镇东青龙王]需要等级85级!");
		end
			freshGzPanel(player);
		return;
	end
end

--官印
function onTalkz100(player)
	player:echo([[
         <b><font color="#ccbb77" size="14px">官印兑换兑换列表</font></b>
--------------------------------------
你当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
--------------------------------------
##九品将兵官印##        <a href="event:talk_z200">魂石兑换官印</a>
需要:魂石[<font color="#ff0000">511</font>]个
--------------------------------------
##八品抚夷官印##        <a href="event:talk_z201">魂石升级官印</a>
需要:魂石[<font color="#ff0000">1134</font>]个
--------------------------------------
##七品安夷官印##        <a href="event:talk_z202">魂石升级官印</a>
需要:魂石[<font color="#ff0000">2123</font>]个
--------------------------------------
##六品讨寇官印##        <a href="event:talk_z203">魂石升级官印</a>
需要:魂石[<font color="#ff0000">4196</font>]个
--------------------------------------
##五品平寇官印##        <a href="event:talk_z204">魂石升级官印</a>
需要:魂石[<font color="#ff0000">8273</font>]个
--------------------------------------
##四品破虏官印##        <a href="event:talk_z205">魂石升级官印</a>
需要:魂石[<font color="#ff0000">16312</font>]个
--------------------------------------
<a href="event:talk_dhryz">元宝兑换魂石</a>   <a href="event:talk_z300">下一页</a> 
--------------------------------------
]]);
end

function onTalkz200(player)
	if  player:num_item("九品将兵官印",1) >= 1 or  player:num_item("九品将兵官印",10) >= 1 or player:num_item("九品将兵官印",100) >= 1 then
		player:alert(1,1,"您已经有[九品将兵官印],还是别兑换了!!")
		onTalkz100(player);
	else
		if util.ppn(player,const.PP_HUNSHI) >= 511 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-511);
				player:add_item("九品将兵官印",1,1);
				player:alert(11,1,"恭喜您成功兑换[九品将兵官印]");
				player:alert(11,0,"您当前魂石还有:"..util.ppn(player,const.PP_HUNSHI).."个");
				onTalkz100(player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkz100(player);
			end
		else
			player:alert(1,1,"您的魂石不足[511]个,无法兑换!")
			onTalkz100(player);
		end
	end
end

function onTalkz300(player)
	player:echo([[
         <b><font color="#ccbb77" size="14px">官印兑换兑换列表</font></b>
--------------------------------------
你当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
--------------------------------------
##三品平虏官印##        <a href="event:talk_z206">魂石升级官印</a>
需要:魂石[<font color="#ff0000">32570</font>]个
--------------------------------------
##二品车骑官印##        <a href="event:talk_z207">魂石升级官印</a>
需要:魂石[<font color="#ff0000">64209</font>]个
--------------------------------------
##一品骠骑官印##        <a href="event:talk_z208">魂石升级官印</a>
需要:魂石[<font color="#ff0000">128431</font>]个
--------------------------------------
##三等抚国官印##        <a href="event:talk_z209">魂石升级官印</a>
需要:魂石[<font color="#ff0000">256352</font>]个
--------------------------------------
##二等镇国官印##        <a href="event:talk_z210">魂石升级官印</a>
需要:魂石[<font color="#ff0000">512801</font>]个
--------------------------------------
##一等元帅官印##        <a href="event:talk_z211">魂石升级官印</a>
需要:魂石[<font color="#ff0000">1024129</font>]个
--------------------------------------
<a href="event:talk_dhryz">元宝兑换魂石</a>      　　<a href="event:talk_z100">上一页</a>
--------------------------------------]]);
end



function onTalkz201(player) ryxzsj(player,110001,1134,"九品将兵官印","八品抚夷官印",110002,1) end
function onTalkz202(player) ryxzsj(player,110002,2123,"八品抚夷官印","七品安夷官印",110003,1) end
function onTalkz203(player) ryxzsj(player,110003,4196,"七品安夷官印","六品讨寇官印",110004,1) end
function onTalkz204(player) ryxzsj(player,110004,8273,"六品讨寇官印","五品平寇官印",110005,1) end
function onTalkz205(player) ryxzsj(player,110005,16312,"五品平寇官印","四品破虏官印",110006,1) end
function onTalkz206(player) ryxzsj(player,110006,32570,"四品破虏官印","三品平虏官印",110007,2) end
function onTalkz207(player) ryxzsj(player,110007,64209,"三品平虏官印","二品车骑官印",110008,2) end
function onTalkz208(player) ryxzsj(player,110008,128431,"二品车骑官印","一品骠骑官印",110009,2) end
function onTalkz209(player) ryxzsj(player,110009,256352,"一品骠骑官印","三等抚国官印",110010,2) end
function onTalkz210(player) ryxzsj(player,110010,512801,"三等抚国官印","二等镇国官印",110011,2) end
function onTalkz211(player) ryxzsj(player,110011,1024129,"二等镇国官印","一等元帅官印",110012,2) end
function onTalkz210a(player) ryxzsj(player,110010,512801,"三等抚国官印","二等镇国官印1",110013,2) end
function onTalkz211a(player) ryxzsj(player,110013,1024129,"二等镇国官印1","一等元帅官印1",110014,2) end
function onTalkz210b(player) ryxzsj(player,110010,512801,"三等抚国官印","二等镇国官印2",110015,2) end
function onTalkz211b(player) ryxzsj(player,110015,1024129,"二等镇国官印2","一等元帅官印2",110016,2) end

function ryxzsj(player,a,b,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if util.ppn(player,const.PP_HUNSHI) >= b then
					if player:num_item(c,1) >= 1 then
						local result = player:remove_item_by_type_pos(ittype_id,0);
						if result == 0 then
						--player:remove_item(c,1);
						player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-b);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级["..d.."]!</font>");
						newgui.jingcaihuodong.setawardpcon(player,"gysj",d);
						if b >= 16312 then
						server.info(110,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在官职系统处将官印升级为[<font color='#ff0000'>"..d.."</font>]");
						else
						server.info(100,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在官职系统处将官印升级为[<font color='#ff0000'>"..d.."</font>]");
						end
						player:alert(11,0,"您当前魂石还有:"..util.ppn(player,const.PP_HUNSHI).."个");
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您的魂石不足["..b.."]个,升级失败!<br><br>通过[装备回收]功能即可获得魂石!");
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
		if f==1 then onTalkz100(player); end
		if f==2 then onTalkz300(player); end
	end
end


function onTalkdhryz(player)
	player:echo([[
--------------------------------------
<b><font color="#ccbb77" size="14px">元宝兑换魂石</font></b>
--------------------------------------
当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
--------------------------------------
如何获得魂石: <font color="#ff0000">魂石可以通过装备回收获得</font>
--------------------------------------
<a href="event:talk_dh100">兑换100个魂石</a>        <font color="#ffaa00">需要元宝:60</font>
--------------------------------------
<a href="event:talk_dh500">兑换500个魂石</a>        <font color="#ffaa00">需要元宝:300</font>
--------------------------------------
<a href="event:talk_dh1000">兑换1000个魂石</a>       <font color="#ffaa00">需要元宝:600</font>
--------------------------------------
<a href="event:talk_dh5000">兑换5000个魂石</a>       <font color="#ffaa00">需要元宝:3000</font>
--------------------------------------
<a href="event:talk_dh10000">兑换10000个魂石</a>      <font color="#ffaa00">需要元宝:6000</font>
--------------------------------------
<a href="event:talk_dh50000">兑换50000个魂石</a>      <font color="#ffaa00">需要元宝:30000</font>
--------------------------------------
<a href="event:talk_dh100000">兑换100000个魂石</a>     <font color="#ffaa00">需要元宝:60000</font>
--------------------------------------
--------------------------------------
]]);
end


function onTalktqhs(player)
	player:echo([[
--------------------------------------
<b><font color="#ccbb77" size="14px">提取魂石卷轴</font></b>
--------------------------------------
当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
--------------------------------------
如何获得魂石: <font color="#ff0000">魂石可以通过装备回收获得</font>
--------------------------------------
<a href="event:talk_tqhs1">提取魂石(1)</a>         <font color="#ffaa00">需要魂石:1</font>
--------------------------------------
<a href="event:talk_tqhs10">提取魂石(10)</a>        <font color="#ffaa00">需要魂石:10</font>
--------------------------------------
<a href="event:talk_tqhs100">提取魂石(100)</a>       <font color="#ffaa00">需要魂石:100</font>
--------------------------------------
<a href="event:talk_tqhs1000">提取魂石(1000)</a>      <font color="#ffaa00">需要魂石:1000</font>
--------------------------------------
<a href="event:talk_tqhs10000">提取魂石(10000)</a>     <font color="#ffaa00">需要魂石:10000</font>
--------------------------------------
<a href="event:talk_tqhs100000">提取魂石(100000)</a>    <font color="#ffaa00">需要魂石:100000</font>
--------------------------------------
<a href="event:talk_dhryz">元宝兑换魂石</a>  
--------------------------------------
]]);
end

--function onTalktqhs1(npc,player) tqhs(npc,player,1,"魂石卷轴(1)"); end
--function onTalktqhs10(npc,player) tqhs(npc,player,10,"魂石卷轴(10)"); end
--function onTalktqhs100(npc,player) tqhs(npc,player,100,"魂石卷轴(100)"); end
--function onTalktqhs1000(npc,player) tqhs(npc,player,1000,"魂石卷轴(1000)"); end
--function onTalktqhs10000(npc,player) tqhs(npc,player,10000,"魂石卷轴(10000)"); end
--function onTalktqhs100000(npc,player) tqhs(npc,player,100000,"魂石卷轴(100000)"); end

function tqhs(player,a,b)
	if a and b then
		if util.ppn(player,const.PP_HUNSHI) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-a);
				player:add_item(b,1);
				player:alert(11,1,"成功提取["..b.."]");
			else
			player:alert(1,1,"背包空格不足1格,无法提取!");
			end
		else
			player:alert(1,1,"您的魂石不足["..a.."]个,无法提取!")
		end
	end
	onTalktqhs(player);
end

function onTalkdh100(player) dhryz(player,60,100); end
function onTalkdh500(player) dhryz(player,300,500); end
function onTalkdh1000(player) dhryz(player,600,1000); end
function onTalkdh5000(player) dhryz(player,3000,5000); end
function onTalkdh10000(player) dhryz(player,6000,10000); end
function onTalkdh50000(player) dhryz(player,30000,50000); end
function onTalkdh100000(player) dhryz(player,60000,100000); end

function dhryz(player,a,b)
	if a and b then
		if player:get_vcoin() >= a then
			player:sub_vcoin(a,"hunshi");
			player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+b);
			player:alert(11,1,"成功使用["..a.."]元宝兑换["..b.."]个魂石!");
			player:alert(11,0,"您的当前魂石为:"..util.ppn(player,const.PP_HUNSHI).."个");
			onTalkdhryz(player);
		else
			player:alert(11,1,"您的元宝不足["..a.."],无法兑换魂石!");
			onTalkdhryz(player);
		end
	end
end