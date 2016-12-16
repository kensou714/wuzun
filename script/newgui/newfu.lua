module(..., package.seeall)
local ACTIONSET_NAME="newfu";
local PANEL_ACTIONSET_NAME="panelnewfu";

function process_newfuActivity(player,actionset,panelid,actionid,data)
	if actionid == "btnnewsc" then
		newFirstCongzi(player);return;
	end
	if actionid == "btnnewCzRank" then
		getNewfuCzRank(player);return;
	end
	if actionid == "btnNewVipbuy" then
		buyNewVipFuc(player);return;
	end
	if actionid == "btnnewfl" then
		newCZhiFanli(player);return;
	end
	if string.sub(actionid,1,8) == "btnnlvcj" then
		local lv = tonumber(string.sub(actionid,9));
		getUpLevelAward(player,lv);return;
	end
	if actionid == "btnOne" then
		newLuckyChjiang(player);return;
	end
	if string.sub(actionid,1,8) == "btnnxfsl" then
		local lv = tonumber(string.sub(actionid,9));
		getLvAwardForEveryone(player,lv);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_newfuActivity);

function check_newbtn_show(player)
	--检测符合合服 显示界面按钮
	if server_start_day() > 6 or is_merge_server() then
		player:set_panel_data("panelminimapfun","btnnewfu","visible","false");
	else
		player:set_panel_data("panelminimapfun","btnnewfu","visible","true");
		
	end
	player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end
login.add_login_listener(check_newbtn_show);

function newFirstCongzi(player)
	local x={["warrior"]="天之屠龙刀",["wizard"]="天之魔魂杖",["taoist"]="天之玄天剑"};
	if util.ppn(player,const.PP_SCCZLB) == 0 then
		if player:get_vcoin_accu() >= 1 then
			if player:num_bag_black() >= 8 then
				player:set_param(const.PP_SCCZLB,1);
				player:add_item("四倍宝典",1,1);
				player:add_item("玛雅令牌",1,1);
				player:add_item("天璇仙魄(70级)",1,1);
				player:add_item(x[player:get_job_name()],1,1);
				player:add_item("聚灵珠(小)",1,1);
				player:add_item("首充元宝(2000)",1,1);
				player:add_item("首充金条(100万)",1,1);
				server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]领取首次充值礼包!");
				player:alert(11,1,"恭喜您成功领取[首次充值礼包]<br>四倍宝典        数量:1<br>天璇仙魄(70级)  数量:1<br>"..x[player:get_job_name()].."      数量:1<br>聚灵珠(小)      数量:1<br>首充元宝(2000)  数量:1<br>首充金条(100万) 数量:1");
			else
				player:alert(1,1,"您的背包不足8格,您也不想这些好东西都掉下地吧!");
			end
		else
			player:alert(1,1,"只需要充值任意元宝即可领取该礼包!");
		end
	else
		player:alert(1,1,"对不起,您已经领取过首次充值礼包!");
	end
end

function freshFirstCongziInfo(player)
	--天之屠龙刀       数量: 1
	local wq={
		["warrior"]={name="天之屠龙刀",id=21000},
		["wizard"]={name="天之魔魂杖",id=21001},
		["taoist"]={name="天之玄天剑",id=21002},
	};
	player:set_panel_data(PANEL_ACTIONSET_NAME,"tnewczWQ","htmlText",wq[player:get_job_name()].name.."       数量: 1");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"bnewczWQ","typeid",wq[player:get_job_name()].id);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshFirstCongziInfo);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

function getNewfuCzRank(player)
	if server_start_day() <= 4 then
		player:alert(1,1,"对不起,新区充值排名统计还未结束,请在开区5天后再领取!");
	else
		if player:get_name() == server.get_var("xqczpma1") or player:get_name() == server.get_var("xqczpma2") or player:get_name() == server.get_var("xqczpma3") then
		if player:num_bag_black() >= 2 then
			if util.ppn(player,const.PP_XQCZPMLQ) == 0 then
				player:set_param(const.PP_XQCZPMLQ,1);
				if player:get_name() == server.get_var("xqczpma1") and server.get_var("xqczpmc1") == "" then
					server.set_var("xqczpmc1","(已领)");
					player:add_item("镇国大将军链",1);
					player:add_item("九级宝石",1);
					player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>镇国大将军链</font>");
					player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>九级宝石</font>");
				else
					player:alert(1,1,"对不起,只可以领取1次哦!");
				end
				if player:get_name() == server.get_var("xqczpma2") and server.get_var("xqczpmc2") == "" then
					server.set_var("xqczpmc2","(已领)");
					player:add_item("抚国大将军戒",1);
					player:add_item("八级宝石",1);
					player:alert(11,1,"恭喜您成功领取:<font color='#FF0000'>抚国大将军戒</font>");
					player:alert(11,0,"恭喜您成功领取:<font color='#FF0000'>八级宝石</font>");
				else
					player:alert(1,1,"对不起,只可以领取1次哦!");
				end
				if player:get_name() == server.get_var("xqczpma3") and server.get_var("xqczpmc3") == "" then
					server.set_var("xqczpmc3","(已领)");
					player:add_item("骠骑将军护腕",1);
					player:add_item("七级宝石",1);
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
end

function freshNewCongziRankInfo(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewday","htmlText","当前服务器开区第 "..(server_start_day()+1).." 天");
	if server.get_var("svrmegcza1") == nil or server.get_var("xqczpma1") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewpm1","htmlText","<font color='#FFFF00'>需充值50万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewpm1","htmlText","<font color='#FFFF00'>"..server.get_var("xqczpma1").."</font><font color='#FF0000'>"..server.get_var("xqczpmc1").."</font>");
	end
	if server.get_var("svrmegcza2") == nil or server.get_var("xqczpma2") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewpm2","htmlText","<font color='#FFFF00'>需充值30万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewpm2","htmlText","<font color='#FFFF00'>"..server.get_var("xqczpma2").."</font><font color='#FF0000'>"..server.get_var("xqczpmc2").."</font>");
	end
	if server.get_var("svrmegcza3") == nil or server.get_var("xqczpma3") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewpm3","htmlText","<font color='#FFFF00'>需充值10万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewpm3","htmlText","<font color='#FFFF00'>"..server.get_var("xqczpma3").."</font><font color='#FF0000'>"..server.get_var("xqczpmc3").."</font>");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshNewCongziRankInfo);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

function buyNewVipFuc(player)
	if server_start_day() <= 4 then
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
	else
		player:alert(11,1,"对不起,会员促销活动已结束!");
	end
end

function freshVipPanelInfo(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtvipday","htmlText","活动剩余时间 "..(5-server_start_day()).." 天");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshVipPanelInfo);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

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

function freshFanliPanelInfo(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewflday","htmlText","<font color='#FFFF00'>服务器当前已经开启第<font color='#FFFF00'> [ "..(server_start_day()+1).." ] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnewflnum","htmlText","<font color='#FFFF00'>当前累计充值返利<font color='#FFFF00'> [ "..util.ppn(player,const.PP_XQCZFL).." ] </font>元宝</font>");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshFanliPanelInfo);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

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
		player:set_panel_data(PANEL_ACTIONSET_NAME,"tnewcj"..i,"htmlText","剩余: "..util.svn(ld.scon));
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

end
login.add_login_listener(freshUpLevelPanelInfo);

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

local lv_award={
	[1]={level=30,award={
		{name="绑定金币",num=100000},
		},pcon=const.PP_SJJL30,
	},
	[2]={level=40,award={
		{name="绑定金币",num=300000},
		},pcon=const.PP_SJJL40,
	},
	[3]={level=50,award={
		{name="绑定元宝",num=2000},
		},pcon=const.PP_SJJL50,
	},
	[4]={level=60,award={
		{name="绑定元宝",num=5000},
		},pcon=const.PP_SJJL60,
	},
	[5]={level=70,award={
		{name="绑定元宝",num=10000},
		},pcon=const.PP_SJJL70,
	},
	[6]={level=80,award={
		{name="绑定元宝",num=20000},
		},pcon=const.PP_SJJL80,
	},
} 

function getLvAwardForEveryone(player,lv)
	local lvd = lv_award[lv];
	if player:get_level() >= lvd.level then
		if util.ppn(player,lvd.pcon) == 0 then
			player:set_param(lvd.pcon,1);
			for i=1,#lvd.award do
				player:add_item(lvd.award[i].name,lvd.award[i].num,1);
			end
			player:alert(11,1,"恭喜您领取"..(lvd.level).."级大礼!")
		else
			player:alert(1,1,"您已经领取过该奖励!")
		end
	else
		player:alert(1,1,"等级不足"..(lvd.level).."!");
	end
end