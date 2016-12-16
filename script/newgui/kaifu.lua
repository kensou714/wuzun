module(..., package.seeall)
local ACTIONSET_NAME="kaifu";
local PANEL_ACTIONSET_NAME="panelkaifu";

function process_kaifuActivity(player,actionset,panelid,actionid,data)
	if actionid == "btnnewfu" then
		freshFanliPanelInfo(player);return;
	end
	if string.sub(actionid,1,9) == "btnSelect" then
		local index = tonumber(string.sub(actionid,10,11));
		fresh_huodong_time(player,index);
	end
	---------疯狂冲级----------
	if string.sub(actionid,1,8) == "btnnlvcj" then
		local lv = tonumber(string.sub(actionid,9));
		getUpLevelAward(player,lv);return;
	end
	---------积分神器----------
	if actionid == "btngotoSQNpc" then
		if player:get_vip() > 0 then
			posnpc.fly(player,"神器使者");
		else	
			player:find_road_goto("v003","128","102","神器使者");
		end
	end
	---------充值返利----------
	if actionid == "btnnewfl" then
		newCZhiFanli(player);return;
	end
	---------幸运转盘----------
	if actionid == "btnSelect5" then
		freshNewChoujNum(player);return;
	end
	if actionid == "btnOne" then
		newLuckyChjiang(player);return;
	end
	---------冲级排名----------
	if actionid == "btnSelect8" then
		freshCjplayerName(player);return;
	end
	if actionid == "btngetCjaward" then
		getCjaward(player);
	end
	---------充值排名----------
	if actionid == "btnSelect9" then
		freshCzplayerName(player);return;
	end
	if string.sub(actionid,1,7) == "btnCzNO" then
		local no = tonumber(string.sub(actionid,9));
		getCzAward(player,no);return;
	end
	---------全民升级----------
	if string.sub(actionid,1,8) == "btnnqmcj" then
		local aplv = tonumber(string.sub(actionid,9));
		getAPlevelAward(player,aplv);return;
	end
	---------红钻豪礼----------
	if string.sub(actionid,1,11) == "btnHongzuan" then
		local lv = tonumber(string.sub(actionid,12));
		getHongzuanLvAward(player,lv);return;
	end
	if actionid == "vipdz" then
		getVip(player);
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_kaifuActivity);

----------------------------------------疯狂冲级---------------------------------------------
---------------------------------------------------------------------------------------------
local uplv_data={
	[1]={level=50,maxnum=1000,award={
		{name="[55级]装备卷",num=1},
		{name="绑定金币",num=200000},
		},pcon=const.PP_XQCJJL50,scon="xqcjjl50",
	},
	[2]={level=60,maxnum=500,award={
		{name="[65级]装备卷",num=1},
		{name="玛雅令牌",num=1},
		},pcon=const.PP_XQCJJL60,scon="xqcjjl60",
	},
	[3]={level=65,maxnum=100,award={
		{name="[70级]装备卷",num=1},
		{name="绑定元宝",num=2000},
		},pcon=const.PP_XQCJJL65,scon="xqcjjl65",
	},
	[4]={level=70,maxnum=30,award={
		{name="[75级]装备卷",num=1},
		{name="七级宝石",num=1},
		},pcon=const.PP_XQCJJL70,scon="xqcjjl70",
	},
	[5]={level=75,maxnum=5,award={
		{name="[80级]装备卷",num=1},
		{name="八级宝石",num=1},
		},pcon=const.PP_XQCJJL75,scon="xqcjjl75",
	},
	[6]={level=80,maxnum=3,award={
		{name="[85级]装备卷",num=1},
		{name="九级宝石",num=1},
		},pcon=const.PP_XQCJJL80,scon="xqcjjl80",
	},
}

function getUpLevelAward(player,lv)
	local lvd = uplv_data[lv];
	if not lvd then return; end
	if player:get_level() < lvd.level then
		player:alert(1,1,"等级不足"..(lvd.level)..",领取失败!");return;
	end
	if util.ppn(player,lvd.pcon) == 0 then
		if util.svn(lvd.scon) >= 1 then
			if player:num_bag_black() >= 2 then
				player:set_param(lvd.pcon,1);
				server.set_var(lvd.scon,util.svn(lvd.scon)-1);
				for i=1,#lvd.award do
					player:add_item(lvd.award[i].name,lvd.award[i].num,1);
				end
				player:alert(11,1,"恭喜您领取"..(lvd.level).."级冲级大礼!")
				server.info(10000,0,"玩家["..player:get_name().."]成功领取"..(lvd.level).."级冲级奖励!")
			else
				player:alert(1,1,"背包空格不足2格,无法领取!")
			end
		else
			player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
		player:alert(1,1,"您已经领取过该奖励!");
	end
	freshUpLevelPanelInfo(player);
end

function freshUpLevelPanelInfo(player)
	if server.get_var("xqcjpmjl") == "" then
		server.set_var("xqcjpmjl",1);
		server.set_var("xqcjjl50",1000);
		server.set_var("xqcjjl60",500);
		server.set_var("xqcjjl65",100);
		server.set_var("xqcjjl70",30);
		server.set_var("xqcjjl75",5);
		server.set_var("xqcjjl80",3);
	end
	for i=1,6 do
		local ld = uplv_data[i];
		player:set_panel_data(PANEL_ACTIONSET_NAME,"tnewcj"..i,"htmlText","<font color='#FFFF00'>剩余: "..util.svn(ld.scon).."/"..ld.maxnum.."</font>");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

end
login.add_login_listener(freshUpLevelPanelInfo);

----------------------------------------刷新活动时间-----------------------------------------
---------------------------------------------------------------------------------------------
local hd_days={[2]={0,4},[3]={0,4},[4]={0,2},[5]={0,4},[6]={1,3},[7]={2,2},[8]={0,3},[9]={0,4}}
function fresh_huodong_time(player,index)
	if hd_days[index] then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthuodongtime","text",os.date("活动时间: %Y年%m月%d日",(60*60*24*(hd_days[index][1]+server_open_day()))).."~"..os.date("%Y年%m月%d日",((server_open_day()+hd_days[index][2])*60*60*24)));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthuodongtime","visible","true");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthuodongtime","visible","false");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function freshFanliPanelInfo(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtseverstartday","htmlText","<font color='#7eff00' size='15'>服务器当前已经开启第<font color='#FFFF00'> [ "..(server_start_day()+1).." ] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewflday","htmlText","<font color='#7eff00' size='15'>服务器当前已经开启第<font color='#FFFF00'> [ "..(server_start_day()+1).." ] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtkaifuday","htmlText","<font color='#7eff00' size='15'>服务器当前已经开启第<font color='#FFFF00'> [ "..(server_start_day()+1).." ] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewflnum","htmlText","<font color='#7eff00' size='15'>当前累计充值返利<font color='#FFFF00'> [ "..util.ppn(player,const.PP_XQCZFL).." ] </font>元宝</font>");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshFanliPanelInfo);

----------------------------------------充值返利---------------------------------------------
---------------------------------------------------------------------------------------------
function newCZhiFanli(player)
	if server_start_day() <= 4 then
		if util.ppn(player,const.PP_XQCZFL) >= 1 then
			player:add_vcoin_best_enable(util.ppn(player,const.PP_XQCZFL));
			player:alert(11,1,"恭喜您成功领取[新区充值返利]");
			player:alert(11,0,"获得元宝:<font color='#ff0000'>"..util.ppn(player,const.PP_XQCZFL).."</font>");
			player:set_param(const.PP_XQCZFL,0);
		else
			player:alert(1,1,"对不起,您当前没有累计到任何充值返利,无法领取!");
		end
	else
		player:alert(1,1,"对不起,充值返利活动已经结束!");
	end
end

----------------------------------------新区大转盘-------------------------------------------
---------------------------------------------------------------------------------------------
function freshNewChoujNum(player)
	if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hefuchoujiang","action","canuse");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hefuchoujiang","action","cantuse");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewcjs","htmlText","您当前可以抽奖 [ "..util.ppn(player,const.PP_HF_CJ_NUM).." ] 次");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshNewChoujNum);

function newLuckyChjiang(player)
	if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
		if player:num_bag_black() >= 1 then
			newgui.lucky.xunbao(player);
			player:set_param(const.PP_HF_CJ_NUM,util.ppn(player,const.PP_HF_CJ_NUM)-1);
		else
			player:alert(11,1,"背包空格不满一格!");
		end
	else
		player:alert(11,1,"您的抽奖次数为0!");
	end
	freshNewChoujNum(player);
end

----------------------------------------冲级排名---------------------------------------------
---------------------------------------------------------------------------------------------
function freshCjplayerName(player)
	for i=1,10 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"CjnameNO"..i,"text",server.get_var("SvrLvRankName"..i))
		player:set_panel_data(PANEL_ACTIONSET_NAME,"CjlevelNO"..i,"text",server.get_var("SvrLvRankLv"..i))
	end
end
login.add_login_listener(freshCjplayerName);

local lv_jl={10000,8000,6000,3000,3000,3000,3000,3000,3000,3000}

function getCjaward(player)
	if  server_open_day()  >= 15944 then
		if check_levelrk_timelt() then
			player:alert(11,1,"活动尚未结束!");
		else
			for u = 1,10 do
				if player:get_name() == server.get_var("SvrLvRankName"..u) then
					if util.svn("SvrLvRankGot"..u) == 0 then
						server.set_var("SvrLvRankGot"..u,1);
						player:add_vcoin_best_enable(lv_jl[u]);
						player:alert(11,1,"恭喜您成功领取等级奖励!");
					else
						player:alert(11,1,"您已经领取过该奖励了!");
					end
					return;
				end
			end
			player:alert(11,1,"您不在榜单上!");
		end
	end
end

----------------------------------------充值排名---------------------------------------------
---------------------------------------------------------------------------------------------
function freshCzplayerName(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"CzNO1name","text",server.get_var("xqczpma1"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"CzNO2name","text",server.get_var("xqczpma2"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"CzNO3name","text",server.get_var("xqczpma3"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtljczyb","text",util.ppn(player,const.PP_XINQUCHONGZHI));
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function getCzAward(player,no)
	--[[if tonumber(server_start_day()) <= 4 then
		player:alert(1,1,"对不起,新区充值排名统计还未结束,请在开区5天后再领取!");
	else
		if player:get_name() == server.get_var("xqczpma1") or player:get_name() == server.get_var("xqczpma2") or player:get_name() == server.get_var("xqczpma3") then
			if player:num_bag_black() >= 2 then
				if util.ppn(player,const.PP_XQCZPMLQ) == 0 then
					player:set_param(const.PP_XQCZPMLQ,1);
					if no == 1 and player:get_name() == server.get_var("xqczpma1") and server.get_var("xqczpmc1") == "" then
						server.set_var("xqczpmc1","(已领)");
						player:add_item_log("镇国大将军链",212,1);
						player:add_item_log("九级宝石",212,1);
						player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>镇国大将军链</font>");
						player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>九级宝石</font>");
					else
						player:alert(1,1,"对不起,您不是累计充值第一名!");
					end
					if player:get_name() == server.get_var("xqczpma2") and server.get_var("xqczpmc2") == "" then
					server.set_var("xqczpmc2","(已领)");
					player:add_item_log("抚国大将军戒",212,1);
					player:add_item_log("八级宝石",212,1);
					player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>抚国大将军戒</font>");
					player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>八级宝石</font>");
					else
						player:alert(1,1,"对不起,只可以领取1次哦!");
					end
					if player:get_name() == server.get_var("xqczpma3") and server.get_var("xqczpmc3") == "" then
						server.set_var("xqczpmc3","(已领)");
						player:add_item_log("骠骑将军护腕",212,1);
						player:add_item_log("七级宝石",212,1);
						player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>骠骑将军护腕</font>");
						player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>七级宝石</font>");
					else
						player:alert(1,1,"对不起,只可以领取1次哦!");
					end
				else
					player:alert(1,1,"对不起,只可以领取1次哦!");
				end
			else
				player:alert(1,1,"您的背包不足2格,无法领取!");
			end
		else
		player:alert(1,1,"对不起,您的累计充值未达到前三名,无法领取奖励!!");
		end
	end
end]]
	if tonumber(server_start_day()) <= 4 then
		player:alert(1,1,"对不起,新区充值排名统计还未结束,请在开区5天后再领取!");
	else
		if player:get_name() == server.get_var("xqczpma1") or player:get_name() == server.get_var("xqczpma2") or player:get_name() == server.get_var("xqczpma3") then
			if player:num_bag_black() >= 2 then
				if util.ppn(player,const.PP_XQCZPMLQ) == 0 then
					player:set_param(const.PP_XQCZPMLQ,1);
					if player:get_name() == server.get_var("xqczpma1") and server.get_var("xqczpmc1") == "" then
						server.set_var("xqczpmc1","(已领)");
						player:add_item_log("镇国大将军链",212,1);
						player:add_item_log("九级宝石",212,1);
						player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>镇国大将军链</font>");
						player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>九级宝石</font>");
					else
						player:alert(1,1,"对不起,只可以领取1次哦!");
					end
					if player:get_name() == server.get_var("xqczpma2") and server.get_var("xqczpmc2") == "" then
						server.set_var("xqczpmc2","(已领)");
						player:add_item_log("抚国大将军戒",212,1);
						player:add_item_log("八级宝石",212,1);
						player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>抚国大将军戒</font>");
						player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>八级宝石</font>");
					else
						player:alert(1,1,"对不起,只可以领取1次哦!");
					end
					if player:get_name() == server.get_var("xqczpma3") and server.get_var("xqczpmc3") == "" then
						server.set_var("xqczpmc3","(已领)");
						player:add_item_log("骠骑将军护腕",212,1);
						player:add_item_log("七级宝石",212,1);
						player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>骠骑将军护腕</font>");
						player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>七级宝石</font>");
					else
						player:alert(1,1,"对不起,只可以领取1次哦!");
					end
				else
					player:alert(1,1,"对不起,只可以领取1次哦!");
				end
			else
				player:alert(1,1,"您的背包不足2格,无法领取!");
			end
		else
			player:alert(1,1,"对不起,您的累计充值未达到前三名,无法领取奖励!!");
		end
	end
	freshCzplayerName(player);
end

----------------------------------------全民大升级-------------------------------------------
---------------------------------------------------------------------------------------------
local aplv_data={
	[1]={level=30,award={100000,0},
		pcon=const.PP_SJJL30,
	},
	[2]={level=40,award={300000,0},
		pcon=const.PP_SJJL40,
	},
	[3]={level=50,award={0,2000},
		pcon=const.PP_SJJL50,
	},
	[4]={level=60,award={0,5000},
		pcon=const.PP_SJJL60,
	},
	[5]={level=70,award={0,10000},
		pcon=const.PP_SJJL70,
	},
	[6]={level=80,award={0,20000},
		pcon=const.PP_SJJL80,
	},
}
function getAPlevelAward(player,lv)
	local apd = aplv_data[lv];
	if player:get_level() < apd.level then
		player:alert(1,1,"等级不足"..(apd.level)..",领取失败!");return;
	end
	if util.ppn(player,apd.pcon) == 0 then
		player:set_param(apd.pcon,1);
		player:add_gamemoney_bind(apd.award[1]);
		player:add_vcoin_bind(apd.award[2]);
		player:alert(11,1,"成功领取"..(apd.level).."级双金豪礼");
	else
		player:alert(11,1,"对不起,该奖励只可领取1次!");
	end
end

----------------------------------------红钻等级豪礼-----------------------------------------
local Hz_data={
	[1]={needcz=100,slot=5,award={
		{name="绑定元宝",num=100},
		{name="双倍宝典",num=2},
		{name="坐骑经验丹(大)",num=1},
		{name="魂石令牌(500)",num=1},
		{name="荣誉令牌(10000)",num=1},
		{name="三级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD1,
	},
	[2]={needcz=10000,slot=5,award={
		{name="绑定元宝",num=1000},
		{name="四倍宝典",num=1},
		{name="坐骑经验丹(大)",num=2},
		{name="魂石令牌(1000)",num=1},
		{name="荣誉令牌(10000)",num=2},
		{name="四级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD2,
	},
	[3]={needcz=50000,slot=5,award={
		{name="绑定元宝",num=2000},
		{name="四倍宝典",num=2},
		{name="坐骑经验丹(大)",num=3},
		{name="魂石令牌(1000)",num=2},
		{name="荣誉令牌(10000)",num=3},
		{name="五级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD3,
	},
	[4]={needcz=100000,slot=5,award={
		{name="绑定元宝",num=3000},
		{name="四倍宝典",num=3},
		{name="坐骑经验丹(大)",num=4},
		{name="魂石令牌(1000)",num=3},
		{name="荣誉令牌(10000)",num=4},
		{name="六级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD4,
	},
	[5]={needcz=300000,slot=5,award={
		{name="绑定元宝",num=5000},
		{name="四倍宝典",num=4},
		{name="坐骑经验丹(大)",num=5},
		{name="魂石令牌(1000)",num=4},
		{name="荣誉令牌(10000)",num=5},
		{name="七级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD5,
	},
	[6]={needcz=500000,slot=5,award={
		{name="绑定元宝",num=10000},
		{name="八倍宝典",num=1},
		{name="坐骑经验丹(大)",num=6},
		{name="魂石令牌(1000)",num=5},
		{name="荣誉令牌(10000)",num=6},
		{name="八级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD6,
	},
	[7]={needcz=1000000,slot=5,award={
		{name="绑定元宝",num=20000},
		{name="八倍宝典",num=2},
		{name="坐骑经验丹(大)",num=7},
		{name="魂石令牌(1000)",num=6},
		{name="荣誉令牌(10000)",num=7},
		{name="九级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD7,
	},
	[8]={needcz=3000000,slot=5,award={
		{name="绑定元宝",num=30000},
		{name="八倍宝典",num=3},
		{name="坐骑经验丹(大)",num=8},
		{name="魂石令牌(1000)",num=8},
		{name="荣誉令牌(10000)",num=8},
		{name="十级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD8,
	},
	[9]={needcz=5000000,slot=5,award={
		{name="绑定元宝",num=50000},
		{name="八倍宝典",num=4},
		{name="坐骑经验丹(大)",num=9},
		{name="魂石令牌(10000)",num=1},
		{name="荣誉令牌(10000)",num=9},
		{name="十一级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD9,
	},
	[10]={needcz=10000000,slot=5,award={
		{name="绑定元宝",num=100000},
		{name="八倍宝典",num=5},
		{name="坐骑经验丹(大)",num=10},
		{name="魂石令牌(10000)",num=2},
		{name="荣誉令牌(10000)",num=10},
		{name="十二级宝石",num=1},
		},pcon=const.PP_HONGZUAN_AWARD10,
	},
}

function getHongzuanLvAward(player,lv)
	local lvd = Hz_data[lv];
	if util.ppn(player,const.PP_CZHZ_LV) < lv then
		player:alert(1,1,"红钻等级不足"..lv.."级,领取失败!");return;
	end
	if util.ppn(player,lvd.pcon) == 0 then
		if player:num_bag_black() >= lvd.slot then
			player:set_param(lvd.pcon,1);
			for i=1,#lvd.award do
				player:add_item(lvd.award[i].name,lvd.award[i].num,1);
			end
			player:alert(11,1,"恭喜您领取"..lv.."级红钻大礼!")
			server.info(10000,0,"玩家["..player:get_name().."]成功领取"..lv.."级红钻奖励!")
		else
			player:alert(1,1,"背包空格不足"..(lvd.slot).."格,无法领取!")
		end
	else
		player:alert(1,1,"您已经领取过该奖励!");
	end
end
----------------------------------------新手卡大礼包-----------------------------------------
----------------------------------------战力排名榜-------------------------------------------

--VIP
function getVip(player)
	local ts =(server_start_day()+1);
	if ts > 5 then
		player:alert(11,1,"服务器已开启超过5天,VIP打折活动已过期,无法购买!");
		return;
	end
	if player:get_vcoin() >= 3000 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin(3000,"huiyuan");
			player:add_item("VIP会员(30天)",1);
			player:alert(11,1,"成功购买[VIP会员(30天)]");
		else
			player:alert(1,1,"您的背包空格不足1格.无法购买!")
		end
	else
		player:alert(11,1,"您的元宝不足[3000],无法购买!");
	end
end