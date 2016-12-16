module(..., package.seeall)
local ACTIONSET_NAME="mrfl";
local PANEL_ACTIONSET_NAME="panelmrfl";
--在线奖励数据
local zxbtn = {
[1]={needtime = 60,cons=const.PP_ZAIXIANJL60,},
[2]={needtime = 120,cons=const.PP_ZAIXIANJL120,},
[3]={needtime = 240,cons=const.PP_ZAIXIANJL240,},
[4]={needtime = 360,cons=const.PP_ZAIXIANJL360,},
[5]={needtime = 480,cons=const.PP_ZAIXIANJL480,},
};

--每日俸禄数据
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

function freshinfo(player)
	--模拟昨天已经登录过 	
	--player:set_param(const.PP_QIANDAO_DAY,today()-1);
	--模拟今日已充值 	
	--player:set_param(const.PP_QIANDAO_CZ_TAG,1000);
	onTalkyxfl1(player);
	onTalkyxfl2(player);
	freshVipInfo(player);
	freshGzPanel(player);
	freshMzczpm(player);
end
--login.add_login_listener(freshinfo);
function processmrfl(player,actionset,panelid,actionid,data)
	if actionid=="btnmrqdqd" then
		onTalkqiandao(player);return;
	end
	if actionid=="btnmrqdczlq" then
		onTalkchongzhilq(player);return;
	end
	if actionid=="btnzxjl1" then
		onTalkzxjl60(player);--onTalkzxjl480
	end
	if actionid=="btnzxjl2" then
		onTalkzxjl120(player);--onTalkzxjl480
	end
	if actionid=="btnzxjl3" then
		onTalkzxjl240(player);--onTalkzxjl480
	end
	if actionid=="btnzxjl4" then
		onTalkzxjl360(player);--onTalkzxjl480
	end
	if actionid=="btnzxjl5" then
		onTalkzxjl480(player);--onTalkzxjl480
	end
	if actionid == "btnzxjllq" then
		zxjlyjlq(player);
		return;
	end
	if actionid == "btnviphygm" then
		viphygm(player);
		return;
	end
	if actionid == "btnviphylq" then
		viphyfllq(player);
		return;
	end
	if actionid== "btnmrfllq" then
		lqsalary(player);
		return;
	end
	if actionid == "btnmzczlqjl" then
		lqmzczjl(player);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,processmrfl);

--每日登录福利
function get_qiandao_fuli_num(player)
	return 500+ 100 * math.min(5,math.max(0,util.ppn(player,const.PP_QIANDAO_DAY_NUM)) );
end
function onTalkqiandao(player)
	if util.ppn(player,const.PP_QIANDAO_QU1) == 0 then
		player:set_param(const.PP_QIANDAO_QU1,1);
		player:add_vcoin_bind(get_qiandao_fuli_num(player));
		player:alert(11,1,"领取今日签到福利大厅:<font color='#FF0000'>"..get_qiandao_fuli_num(player).."绑定元宝</font>");
		server.info(100,1,"<font color='#FF0000'>["..player:get_name().."]在福利礼官领取签到奖励!</font>")
	else
		player:alert(1,1,"签到福利每天只可以领取一次哦!");		
	end
	onTalkyxfl1(player);
end
--充值再领取
function onTalkchongzhilq(player)
	if util.ppn(player,const.PP_QIANDAO_CZ_TAG) > 0 then
		if util.ppn(player,const.PP_QIANDAO_QU2) == 0 then
			player:set_param(const.PP_QIANDAO_QU2,1);
			player:add_vcoin_bind(get_qiandao_fuli_num(player));
			player:alert(11,1,"领取充值签到福利大厅:<font color='#FF0000'>"..get_qiandao_fuli_num(player).."绑定元宝</font>");
			server.info(100,1,"<font color='#FF0000'>["..player:get_name().."]在福利礼官领取充值再领取奖励!</font>")
		else
			player:alert(1,1,"充值签到福利每天只可以领取一次哦!");
		end
	else
		player:alert(1,1,"只需充值任意金额即可领取充值签到福利!");
		return;
	end
	onTalkyxfl1(player);
end
function onTalkyxfl1(player)

	local qdd=util.ppn(player,const.PP_QIANDAO_DAY);
	local td = today();
	if qdd ~= td then
		if qdd == td-1 then
			player:set_param(const.PP_QIANDAO_DAY_NUM,util.ppn(player,const.PP_QIANDAO_DAY_NUM)+1);
		else
			player:set_param(const.PP_QIANDAO_DAY_NUM,0);
		end
		player:set_param(const.PP_QIANDAO_QU1,0);
		player:set_param(const.PP_QIANDAO_QU2,0);
		player:set_param(const.PP_QIANDAO_DAY,td);
	end
	if util.ppn(player,const.PP_QIANDAO_QU1) ~= 0 or util.ppn(player,const.PP_QIANDAO_QU2) ~= 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmrqdts","text","["..(util.ppn(player,const.PP_QIANDAO_DAY_NUM)+1).."]天");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmrqdts","text","["..util.ppn(player,const.PP_QIANDAO_DAY_NUM).."]天");	
	end
	if util.ppn(player,const.PP_QIANDAO_CZ_TAG) > 0 and util.ppn(player,const.PP_QIANDAO_QU2) == 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmrqdczlq","visible","true");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmrqdcz","visible","false");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmrqdczlq","visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmrqdcz","visible","true");
	end

	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

------在线奖励
function zxjlyjlq(player)
	if util.ppn(player,const.PP_ZAIXIANJL480) ~= today()  then
		if player:get_online_time_today() >= 28800 then
			player:set_param(const.PP_ZAIXIANJL480,today());
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功领取[绑定元宝*1000]");
		else
			player:alert(1,1,"在线时间不足480分钟,无法领取");
		end
	end
	if util.ppn(player,const.PP_ZAIXIANJL360) ~= today()  then
		if player:get_online_time_today() >= 21600 then
			player:set_param(const.PP_ZAIXIANJL360,today());
			player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+500);
			player:alert(11,1,"成功领取[魂石*500]");
			player:alert(11,0,"您的当前魂石为:"..util.ppn(player,const.PP_HUNSHI).."个");
		else
			player:alert(1,1,"在线时间不足360分钟,无法领取");
		end
	end
	if util.ppn(player,const.PP_ZAIXIANJL240) ~= today()  then
		if player:get_online_time_today() >= 14400 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_ZAIXIANJL240,today());
				player:add_item("坐骑经验丹(大)",1,1);
				player:alert(11,1,"恭喜您成功领取[坐骑经验丹(大)]");
			end
		else
			player:alert(1,1,"在线时间不足240分钟,无法领取");
		end
	end
	if util.ppn(player,const.PP_ZAIXIANJL120) ~= today()  then
		if player:get_online_time_today() >= 7200 then
			player:set_param(const.PP_ZAIXIANJL120,today());
			player:add_honor(5000);
			player:alert(11,1,"成功领取[荣誉值*5000]");
			player:alert(11,0,"您的当前荣誉值为:"..player:get_honor().."点");
		else
			player:alert(1,1,"在线时间不足120分钟,无法领取");
		end
	end
	if util.ppn(player,const.PP_ZAIXIANJL60) ~= today()  then
		if player:get_online_time_today() >= 3600 then
			player:set_param(const.PP_ZAIXIANJL60,today());
			player:add_gamemoney_bind(300000);
			player:alert(11,1,"恭喜您成功领取[绑定金币30W]");
		else
			player:alert(1,1,"在线时间不足60分钟,无法领取");
		end
	end
	onTalkyxfl2(player);
end
function onTalkzxjl480(player)
	if util.ppn(player,const.PP_ZAIXIANJL480) ~= today()  then
		if player:get_online_time_today() >= 28800 then
			player:set_param(const.PP_ZAIXIANJL480,today());
			player:add_vcoin_bind(1000);
			player:alert(11,1,"成功领取[绑定元宝*1000]");
		else
			player:alert(1,1,"在线时间不足480分钟,无法领取");
		end
	else
		player:alert(1,1,"对不起,每天只可领取一次该奖励");
	end
	onTalkyxfl2(player);
end
function onTalkzxjl360(player)
	if util.ppn(player,const.PP_ZAIXIANJL360) ~= today()  then
		if player:get_online_time_today() >= 21600 then
			player:set_param(const.PP_ZAIXIANJL360,today());
			player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+500);
			player:alert(11,1,"成功领取[魂石*500]");
			player:alert(11,0,"您的当前魂石为:"..util.ppn(player,const.PP_HUNSHI).."个");
		else
			player:alert(1,1,"在线时间不足360分钟,无法领取");
		end
	else
		player:alert(1,1,"对不起,每天只可领取一次该奖励");
	end
	onTalkyxfl2(player);
end

function onTalkzxjl240(player)
	if util.ppn(player,const.PP_ZAIXIANJL240) ~= today()  then
		if player:get_online_time_today() >= 14400 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_ZAIXIANJL240,today());
				player:add_item("坐骑经验丹(大)",1,1);
				player:alert(11,1,"恭喜您成功领取[坐骑经验丹(大)]");
			else
			player:alert(1,1,"您的背包不足1格,无法领取!");
			end
		else
			player:alert(1,1,"在线时间不足240分钟,无法领取");
		end
	else
		player:alert(1,1,"对不起,每天只可领取一次该奖励");
	end
	onTalkyxfl2(player);
end

function onTalkzxjl120(player)
	if util.ppn(player,const.PP_ZAIXIANJL120) ~= today()  then
		if player:get_online_time_today() >= 7200 then
			player:set_param(const.PP_ZAIXIANJL120,today());
			player:add_honor(5000);
			player:alert(11,1,"成功领取[荣誉值*5000]");
			player:alert(11,0,"您的当前荣誉值为:"..player:get_honor().."点");
		else
			player:alert(1,1,"在线时间不足120分钟,无法领取");
		end
	else
		player:alert(1,1,"对不起,每天只可领取一次该奖励");
	end
	onTalkyxfl2(player);
end

function onTalkzxjl60(player)
	if util.ppn(player,const.PP_ZAIXIANJL60) ~= today()  then
		if player:get_online_time_today() >= 3600 then
			player:set_param(const.PP_ZAIXIANJL60,today());
			player:add_gamemoney_bind(300000);
			player:alert(11,1,"恭喜您成功领取[绑定金币30W]");
		else
			player:alert(1,1,"在线时间不足60分钟,无法领取");
		end
	else
		player:alert(1,1,"对不起,每天只可领取一次该奖励");
	end
	onTalkyxfl2(player);
end
function onTalkyxfl2(player)
	setBtn(player);
	setZxsj(player);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function setZxsj(player)
	local timesj = math.floor(player:get_online_time_today()/60);
	--<GuiLabel id="zxjlsj" color="0xECE593" text="[999]分钟" x="163" y="323" w="400" h="20" size="14" filter="true"/>
	player:set_panel_data(PANEL_ACTIONSET_NAME,"zxjlsj","text","["..timesj.."]分钟");
end
function setBtn(player)
	local btnid="btnzxjl";
	for i=1,5 do
		local data = zxbtn[i];
		--print(data.needtime*60);
		if player:get_online_time_today() >= data.needtime*60 then
			if util.ppn(player,data.cons) == today() then
				setYlqBtn(btnid..i,player);
			else
				setLqBtn(btnid..i,player);
			end
		else
			setWwcBtn(btnid..i,player);
		end
	end
end
function setYlqBtn(id,player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,id,"label","已领取");
	player:set_panel_data(PANEL_ACTIONSET_NAME,id,"grayFilter","true");
end
function setLqBtn(id,player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,id,"label","领  取");
	player:set_panel_data(PANEL_ACTIONSET_NAME,id,"grayFilter","false");
end
function setWwcBtn(id,player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,id,"label","未完成");
	player:set_panel_data(PANEL_ACTIONSET_NAME,id,"grayFilter","true");
end
-----VIP会员
function viphygm(player)
	-- if player:get_vcoin() >= 6000 then
	-- 	if player:num_bag_black() >= 1 then
	-- 		player:sub_vcoin(6000,"vip");
	-- 		player:add_item("VIP会员(30天)",1);
	-- 		player:alert(11,1,"成功购买[VIP会员(30天)]");
	-- 	else
	-- 		player:alert(1,1,"您的背包空格不足1格.无法购买!")
	-- 	end
	-- else
	-- 	player:alert(11,1,"您的元宝不足[6000],无法购买!");
	-- end
	player:set_panel_data("panelvip","panelvip","panel_visible","true");
	player:push_ckpanel_data("vip","panelvip");
	freshVipInfo(player);
end
function viphyfllq(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		if util.ppn(player,const.PP_HUIYUAN_FULI) ~= today() then
			player:set_param(const.PP_HUIYUAN_FULI,today());
			player:add_vcoin_bind(500);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"恭喜您成功领取每日福利:");
			player:alert(11,0,"绑定元宝: 500");
			player:alert(11,0,"绑定金币: 500000");
		else
			player:alert(1,1,"会员福利每天只可以领取一次哦!")
		end
	else
		player:alert(1,1,"对不起,您还没有成为VIP会员!");
	end
	freshVipInfo(player);
end
function freshVipInfo(player)
	--<GuiMovieClip id="lblvipsjts" x="67" y="155" w="383" h="12" bgid="3543" mouseEnabled="false" scale9="true" cornerSize="10"/>
	--<GuiLabel id="txtviphyts" color="0xe8c176" text="30/30" x="233" y="178" w="100" h="20" size="13" filter="true"/>
	local syts,sjcd = 0,0;
	if util.ppn(player,const.PP_HUIYUAN) >= today() then
		syts = math.min((util.ppn(player,const.PP_HUIYUAN)-today()),30);
		--syts = 10;
		sjcd = math.floor(383*syts/30);		
	end
	--print(sjcd);
	if sjcd == 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lblvipsjts","visible","false");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lblvipsjts","visible","true");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lblvipsjts","w",sjcd);
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtviphyts","text",syts.."/30");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
---每日俸禄
function lqsalary(player)
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
function freshGzPanel(player)
	if util.ppn(player,const.PP_GUANZHI) <=15  then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqwlgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqmfgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqdsgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqhs","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqbdyb","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqbdjb","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqgz","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjwlgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjmfgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjdsgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)+1].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjhs","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjbdyb","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjbdjb","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjgz","text",gz_data[util.ppn(player,const.PP_GUANZHI)+1].name);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqwlgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqmfgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqdsgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqhs","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqbdyb","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqbdjb","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdqgz","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjwlgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjmfgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjdsgj","text",""..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmin.."-"..gz_data[util.ppn(player,const.PP_GUANZHI)].gjmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjhs","text",gz_data[util.ppn(player,const.PP_GUANZHI)].hsstone);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjbdyb","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdvcoin);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjbdjb","text",gz_data[util.ppn(player,const.PP_GUANZHI)].bdgamemoney);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxjgz","text",gz_data[util.ppn(player,const.PP_GUANZHI)].name);
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

--每周充值排名
function reset_player_mzczpm_info(player)
	if util.ppn(player,const.PP_MZCZPM_TAG) ~= week() then
		player:set_param(const.PP_MZCZPM_TAG,week());
		player:set_param(const.PP_MZCZPM_CONGZI,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end
function freshMzczpm(player)
	reset_player_mzczpm_info(player);
	local bz1=server.get_var("mzczpma1")..server.get_var("mzczpmc1");
	if bz1 == nil or bz1 == "" then bz1=" "; end
	local bz2=server.get_var("mzczpma2")..server.get_var("mzczpmc2");
	if bz2 == nil or bz2 == "" then bz2=" "; end
	local bz3=server.get_var("mzczpma3")..server.get_var("mzczpmc3");
	if bz3 == nil or bz3 == "" then bz3=" "; end
	local sz1=server.get_var("szczpma1")..server.get_var("szczpmc1");
	if sz1 == nil or sz1 == "" then sz1=" "; end
	local sz2=server.get_var("szczpma2")..server.get_var("szczpmc2");
	if sz2 == nil or sz2 == "" then sz2=" "; end
	local sz3=server.get_var("szczpma3")..server.get_var("szczpmc3")
	if sz3 == nil or sz3 == "" then sz3=" "; end
	
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbzdym","text",bz1);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbzdem","text",bz2);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbzdsm","text",bz3);

	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtszdym","text",sz1);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtszdem","text",sz2);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtszdsm","text",sz3);

	local ybs = util.ppn(player,const.PP_MZCZPM_CONGZI);
	--ybs = 1;
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtbzczybs","text",ybs.."元宝");

	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function lqmzczjl(player)
--领取奖励
	local no_award=true;
	local a = player:get_name();
	for i = 1,3 do
		if a == server.get_var("szczpma"..i) then
			if server.get_var("szczpmc"..i) == "" then
				if i == 1 then
					if player:num_bag_black() >= 1 then
						server.set_var("szczpmc"..i,"(已领取)");
						player:add_item("十级宝石",1,1);
						player:alert(11,1,"成功领取每周充值排名第一奖励!");
						player:alert(11,0,"十级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每周充值排名第一奖励:<font color='#FF0000'>十级宝石*1</font>");
						freshMzczpm(player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");freshMzczpm(player);return;
					end
				end
				if i == 2 then
					if player:num_bag_black() >= 1 then
						server.set_var("szczpmc"..i,"(已领取)");
						player:add_item("九级宝石",1,1);
						player:alert(11,1,"成功领取每周充值排名第二奖励!");
						player:alert(11,0,"九级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每周充值排名第二奖励:<font color='#FF0000'>九级宝石*1</font>");
						freshMzczpm(player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");freshMzczpm(player);return;
					end
				end
				if i == 3 then
					if player:num_bag_black() >= 1 then
						server.set_var("szczpmc"..i,"(已领取)");
						player:add_item("八级宝石",1,1);
						player:alert(11,1,"成功领取每周充值排名第三奖励!");
						player:alert(11,0,"八级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每周充值排名第三奖励:<font color='#FF0000'>八级宝石*1</font>");
						freshMzczpm(player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");freshMzczpm(player);return;
					end
				end
			else
				player:alert(1,1,"您已经领取过该奖励了!");
				no_award=false;
			end
		end
	end
	if no_award then
		player:alert(1,1,"由于您不在排名中,无法领取奖励!");
	end
	freshMzczpm(player);
end