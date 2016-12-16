module(..., package.seeall)
local ACTIONSET_NAME="hefu";
local PANEL_ACTIONSET_NAME="panelHefu";

function process_hefuActivity(player,actionset,panelid,actionid,data)
	if actionid == "btnhfhklb" then
		--合服回馈大礼包
		--hfHuiKuiLB(player);return;
	end
	if actionid == "btnhfpmlb" then
		--合服充值排名礼包
		--hfCZhiRankLB(player);return;
	end
	if actionid == "btnhfczfl" then
		--合服充值返利
		--hfCZhiFanli(player);return;
	end
	if actionid == "btnhfhhjl" then
		--连续三天守住王城
		--hfHoldGuildLB(player);return;
	end
	if actionid == "btnOne" then
		--合服幸运抽奖
		--hfLuckyChjiang(player);return;
	end
	if actionid == "btnhfxfsl" then
		--合服消费送礼
		--hfXiaofeiSli(player);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_hefuActivity);

function check_hfbtn_show(player)
	--检测符合合服 显示界面按钮
	if  is_merge_server() then
		--player:set_panel_data("panelminimapfun","btnHefu","visible","false");
	else
		--player:set_panel_data("panelminimapfun","btnHefu","visible","false");
		
	end
	--player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
	--player:push_ckpanel_data("minimapfun","panelminimapfun");
end
login.add_login_listener(check_hfbtn_show);

function reset_player_svrmeg_info(player)
--    如果要测试领取,刷第六天的时候把这个注释打开不清理充值累计信息.
	if player:get_param(const.PP_NEW_SVRMEG_TAG) ~= server.get_var("server_merge_time") then
		player:set_param(const.PP_NEW_SVRMEG_TAG,server.get_var("server_merge_time"));
		if player:get_level() >= 60 then
			player:set_param(const.PP_SVRMEG_LIBAO,1);
		else
			player:set_param(const.PP_SVRMEG_LIBAO,0);
		end
		player:set_param(const.PP_SVRMEG_CONGZI,0);
		player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
--]]
end

function resetmergeinfo(player)
	if reset_merge_seed() > 0 then
		if util.ppn(player,const.PP_SVRMEG_LOGTIME) ~= util.svn("merge_log_time") then
			player:set_param(const.PP_SVRMEG_LOGTIME,util.svn("merge_log_time"));
			if player:get_level() >= 60 then
				player:set_param(const.PP_SVRMEG_LIBAO,1);
			else
				player:set_param(const.PP_SVRMEG_LIBAO,0);
			end
			player:set_param(const.PP_SVRMEG_CONGZI,0);
			player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);

			player:set_param(const.PP_HF_XIAOFEI_LQ,0);
			player:set_param(const.PP_HF_XIAOFEI_YB,0);
			player:set_param(const.PP_HF_CZYB_TEMP,0);
		end
	end
end

function fresh_hfflinfo(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfflday","htmlText","<font color='#FFFF00'>服务器当前已经合区第<font color='#FFFF00'> [ "..(server_merge_day()+1).." ] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfflnum","htmlText","<font color='#FFFF00'>当前累计充值返利<font color='#FFFF00'> [ "..util.ppn(player,const.PP_SVRMEG_CONGZI_FANHUAN).." ] </font>元宝</font>");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_hfflinfo);

function hfHuiKuiLB(player)
	--合服回馈大礼包
	--player:alert(1,1,"正在处理合服回馈大礼包!");
	if not is_merge_server() then return; end
	reset_player_svrmeg_info(player);
	resetmergeinfo(player);
	if util.ppn(player,const.PP_SVRMEG_LIBAO) > 1 then
		player:alert(1,1,"您已经领取过合区礼包!");
		return;
	end
	if player:get_level() <= 44 then
		player:alert(1,1,"等级不足45级不可领取合区礼包!");
		return;
	end
	if util.ppn(player,const.PP_SVRMEG_LIBAO) == 1 then
		if player:get_level() >= 45 then
			if player:num_bag_black() >= 5 then
				player:set_param(const.PP_SVRMEG_LIBAO,2);
				player:add_vcoin_bind(2000);
				player:add_gamemoney_bind(500000);
				player:add_item("四倍宝典",1,1);
				player:add_item("玛雅令牌",1,1);
				player:add_item("魂石令牌(500)",1,1);
				player:add_item("坐骑经验丹(大)",1,1);
				player:add_item("荣誉令牌(10000)",1,1);
				player:alert(11,1,"恭喜您成功领取合区礼包!");
				player:alert(11,0,"<font color='#ff0000'>四倍宝典        数量:1</font>");
				player:alert(11,0,"<font color='#ff0000'>玛雅令牌        数量:1</font>");
				player:alert(11,0,"<font color='#ff0000'>魂石令牌(500)   数量:1</font>");
				player:alert(11,0,"<font color='#ff0000'>坐骑经验丹(大)  数量:1</font>");
				player:alert(11,0,"<font color='#ff0000'>荣誉令牌(10000) 数量:1</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定元宝        数量:2000</font>");
				player:alert(11,0,"<font color='#ff0000'>绑定金币        数量:500000</font>");
				server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]在活动面板领取合区大礼包!");
			else
				player:alert(1,1,"背包空格不足5格,无法领取!");
			end
		else
			player:alert(1,1,"您的等级不足45级,无法领取!");
		end
	else
		player:alert(1,1,"您已经领取过该礼包,无法再领取!");
	return;
	end
end

function fresh_hfRank_info(player)
	--刷新充值排名
	if server.get_var("svrmegcza1") == nil or server.get_var("svrmegcza1") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfpm1","htmlText","<font color='#FFFF00'>需充值50万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfpm1","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza1").."</font><font color='#FF0000'>"..server.get_var("svrmegczc1").."</font>");
	end
	if server.get_var("svrmegcza2") == nil or server.get_var("svrmegcza2") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfpm2","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfpm2","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza2").."</font><font color='#FF0000'>"..server.get_var("svrmegczc2").."</font>");
	end
	if server.get_var("svrmegcza3") == nil or server.get_var("svrmegcza3") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfpm3","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfpm3","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza3").."</font><font color='#FF0000'>"..server.get_var("svrmegczc3").."</font>");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_hfRank_info);

function hfCZhiRankLB(player)
	--合服充值排名礼包
	--player:alert(1,1,"正在处理合服充值排名礼包!");
	if not is_merge_server() then return; end
	reset_player_svrmeg_info(player);
	resetmergeinfo(player);
	if server_merge_day() <= 4 then
		player:alert(1,1,"请在合区5天后再来领取奖励吧!");
		return;
	end
	local a = player:get_name();
	for i = 1,3 do
		if a == server.get_var("svrmegcza"..i) then
			if server.get_var("svrmegczc"..i) == "" then
				if i == 1 then
					if player:num_bag_black() >= 2 then
						server.set_var("svrmegczc"..i,"已领取");
						player:add_item("镇国大将军链",1);
						player:add_item("九级宝石",1);
						player:alert(11,1,"成功领取充值排名第一奖励!");
						player:alert(11,0,"镇国大将军链 数量:1");
						player:alert(11,0,"九级宝石     数量:1");
						return;
					else
						player:alert(1,1,"背包空格不足2格!无法领取!");
					end
				end
				if i == 2 then
					if player:num_bag_black() >= 2 then
						server.set_var("svrmegczc"..i,"已领取");
						player:add_item("抚国大将军戒",1);
						player:add_item("八级宝石",1);
						player:alert(11,1,"成功领取充值排名第二奖励!");
						player:alert(11,0,"抚国大将军戒 数量:1");
						player:alert(11,0,"八级宝石     数量:1");
						return;
					else
						player:alert(1,1,"背包空格不足2格!无法领取!");
					end
				end
				if i == 3 then
					if player:num_bag_black() >= 2 then
						server.set_var("svrmegczc"..i,"已领取");
						player:add_item("骠骑将军护腕",1);
						player:add_item("七级宝石",1);
						player:alert(11,1,"成功领取充值排名第二奖励!");
						player:alert(11,0,"骠骑将军护腕 数量:1");
						player:alert(11,0,"七级宝石     数量:1");
						return;
					else
						player:alert(1,1,"背包空格不足2格!无法领取!");
					end
				end
			else
				player:alert(1,1,"您已经领取过该奖励了!");
				return;
			end
		end
	end
	player:alert(1,1,"由于您不在排名中,无法领取奖励!");
end

function hfCZhiFanli(player)
	--合服充值返利
	--player:alert(1,1,"正在处理合服充值返利!");
	if not is_merge_server() then return; end
	reset_player_svrmeg_info(player);
	resetmergeinfo(player);
	local b = util.ppn(player,const.PP_SVRMEG_CONGZI_FANHUAN);
	if b > 0 then
		player:add_vcoin_best_enable(b);
		player:alert(11,1,"恭喜您成功领取[合区充值大返利]");
		player:alert(11,0,"获得元宝:<font color='#ff0000'>"..b.."</font>");
		player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);
		fresh_hfflinfo(player);
	else
		player:alert(1,1,"对不起,您当前没有累计到任何充值返利,无法领取!!");
	end
end

function freshHfGuildInfo(player)
	if not is_merge_server() then return; end
	local lqcheck = "未领取";
	if server.get_var("lq_kgguild") == "" then else lqcheck = "已领取" end
	if server.get_var("king3name") == nil or server.get_var("king3name") == "" then
		local kguild = server.get_king_guild();
		player:set_panel_data(PANEL_ACTIONSET_NAME,"thfking","htmlText","当前王城行会: "..kguild);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"thfhday","htmlText","已占领 "..server.get_var("hold_guild").." 天");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"thfking","htmlText","王城行会: "..server.get_var("king3name").."["..lqcheck.."]");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"thfhday","htmlText","已占领 3 天");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshHfGuildInfo);

function hfHoldGuildLB(player)
	--连续三天守住王城
	--player:alert(1,1,"正在处理合服连续三天守住王城!");
	if not is_merge_server() then return; end
	if server_merge_day() <= 1 then player:alert(1,1,"合区第三天才可以领取该奖励!");return; end
	refresh_hfbianliang(player);
	resetmergeinfo(player);
	if server.get_var("king3name") == nil or server.get_var("king3name") == "" then
		player:alert(1,1,"尚未有人连续三天占领行会!");return;
	end
	if  player:get_guild() ~= "" and player:get_guild() == server.get_var("king3name")  and 1000==player:get_guild_title() then
		if server.get_var("lq_kgguild") == ""  then
			if player:num_bag_black() >= 1 then
				server.set_var("lq_kgguild","已领取");
				player:add_vcoin_best_enable(20000);
				player:add_item("镇国大将军链",1);
				player:alert(11,1,"恭喜您成功领取[20000元宝]");
				player:alert(11,1,"恭喜您成功领取[镇国大将军链*1]");
				freshHfGuildInfo(player);
			else
				player:alert(11,1,"背包空格不满一格!");
			end
		else
			player:alert(11,1,"王城奖励已被领取!");
		end
	else
		player:alert(1,1,"您不是会长,或尚未满足领取条件!");
	end
end

function freshChoujNum(player)
	if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hefuchoujiang","action","canuse");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hefuchoujiang","action","cantuse");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfcjs","htmlText","您当前可以抽奖 [ "..util.ppn(player,const.PP_HF_CJ_NUM).." ] 次");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshChoujNum);

function hfLuckyChjiang(player)
	--合服幸运抽奖
	--player:alert(1,1,"正在处理合服幸运抽奖!");
	if not is_merge_server() then return; end
	refresh_hfbianliang(player);
	resetmergeinfo(player);
	if util.ppn(player,const.PP_HF_CJ_NUM) > 0 then
		if player:num_bag_black() >= 1 then
			DoHefuChouJiang(player);
			player:set_param(const.PP_HF_CJ_NUM,util.ppn(player,const.PP_HF_CJ_NUM)-1);
		else
			player:alert(11,1,"背包空格不满一格!");
		end
	end
	freshChoujNum(player);
end

function DoHefuChouJiang(player)
	--这里是抽奖的逻辑
	--player:alert(1,1,"正在处理合服幸运抽奖!");
	newgui.lucky.xunbao(player)
end

function hfxiaofeipm_Recharge_process(player,price)
	if price then
		player:set_param(const.PP_HF_XIAOFEI_YB,util.ppn(player,const.PP_HF_XIAOFEI_YB)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_HF_XIAOFEI_YB);
		for i = 1,4 do
			if a == server.get_var("hfxfpmsla"..i) then
				server.set_var("hfxfpmslb"..i,b);
				hfxiaofeipm_Recharge_chuli();
				hfxiaofeipm_Recharge_chuli();
				fresh_xfRank_info(player);
				return;
			end
		end
		if b > util.svn("hfxfpmslb4") then
			server.set_var("hfxfpmsla4",a);
			server.set_var("hfxfpmslb4",b);
			hfxiaofeipm_Recharge_chuli();
			hfxiaofeipm_Recharge_chuli();
		end
		fresh_xfRank_info(player);
	end
end
function hfxiaofeipm_Recharge_chuli()
	local Recharge = {};
	for u = 1,4 do
		table.insert(Recharge,{
			name = server.get_var("hfxfpmsla"..u),
			num = util.svn("hfxfpmslb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("hfxfpmsla"..idx,value.name);
		server.set_var("hfxfpmslb"..idx,value.num);
	end
	if "" == server.get_var("hfxfpmsla2") then
		server.set_var("hfxfpmslb2",299999);
	end
	if "" == server.get_var("hfxfpmsla3") then
		server.set_var("hfxfpmslb3",99999);
	end
	if "" == server.get_var("hfxfpmsla4") then
		server.set_var("hfxfpmslb4",0);
	end
end

function fresh_xfRank_info(player)
	--刷新充值排名
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfyb","htmlText","活动期间已消费"..util.ppn(player,const.PP_HF_XIAOFEI_YB).."元宝");
	if server.get_var("hfxfpmsla1") == nil or server.get_var("hfxfpmsla1") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfpm1","htmlText","<font color='#FFFF00'>需消费50万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfpm1","htmlText","<font color='#FFFF00'>"..server.get_var("hfxfpmsla1").."</font><font color='#FF0000'>"..server.get_var("hfxfpmslc1").."</font>");
	end
	if server.get_var("hfxfpmsla2") == nil or server.get_var("hfxfpmsla2") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfpm2","htmlText","<font color='#FFFF00'>需消费30万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfpm2","htmlText","<font color='#FFFF00'>"..server.get_var("hfxfpmsla2").."</font><font color='#FF0000'>"..server.get_var("hfxfpmslc2").."</font>");
	end
	if server.get_var("hfxfpmsla3") == nil or server.get_var("hfxfpmsla3") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfpm3","htmlText","<font color='#FFFF00'>需消费10万元宝</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthfxfpm3","htmlText","<font color='#FFFF00'>"..server.get_var("hfxfpmsla3").."</font><font color='#FF0000'>"..server.get_var("hfxfpmslc3").."</font>");
	end	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_xfRank_info);

function hfXiaofeiSli(player)
	--合服消费送礼
	if not is_merge_server() then return; end
	refresh_hfbianliang(player);
	resetmergeinfo(player);
	if server_merge_day() <= 4 then
		player:alert(1,1,"请在合区5天后再来领取奖励吧!");
		return;
	end
	if player:get_name() == server.get_var("hfxfpmsla1") or player:get_name() == server.get_var("hfxfpmsla2") or player:get_name() == server.get_var("hfxfpmsla3") then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_HF_XIAOFEI_LQ) <= 1 then
				if player:get_name() == server.get_var("hfxfpmsla1") and util.ppn(player,const.PP_HF_XIAOFEI_LQ) == 0 and server.get_var("hfxfpmslc1") == "" then
					player:set_param(const.PP_HF_XIAOFEI_LQ,2);
					server.set_var("hfxfpmslc1","(已领取)");
					player:add_item_log("九级灵羽",241,1,1);
					player:alert(11,1,"恭喜您成功领取[九级灵羽*1]");
				end
				if player:get_name() == server.get_var("hfxfpmsla2") and util.ppn(player,const.PP_HF_XIAOFEI_LQ) == 0 and server.get_var("hfxfpmslc2") == "" then
					player:set_param(const.PP_HF_XIAOFEI_LQ,2);
					server.set_var("hfxfpmslc2","(已领取)");
					player:add_item_log("八级灵羽",241,1,1);
					player:alert(11,1,"恭喜您成功领取[八级灵羽*1]");
				end
				if player:get_name() == server.get_var("hfxfpmsla3") and util.ppn(player,const.PP_HF_XIAOFEI_LQ) == 0 and server.get_var("hfxfpmslc3") == "" then
					player:set_param(const.PP_HF_XIAOFEI_LQ,2);
					server.set_var("hfxfpmslc3","(已领取)");
					player:add_item_log("七级灵羽",241,1,1);
					player:alert(11,1,"恭喜您成功领取[七级灵羽*1]");
				end
			else
				player:alert(1,1,"对不起,只可以领取1次哦!");return;
			end
		else
			player:alert(1,1,"您的背包不足1格,无法领取!");return;
		end
	else
		if util.ppn(player,const.PP_HF_XIAOFEI_YB) >= 50000 then
			if util.ppn(player,const.PP_HF_XIAOFEI_LQ) <= 1 then
				player:set_param(const.PP_HF_XIAOFEI_LQ,2);
				player:add_item_log("六级灵羽",241,1,1);
				player:alert(11,1,"恭喜您成功领取[六级灵羽*1]");
			else
				player:alert(1,1,"对不起,只可以领取1次哦!");return;
			end
		else
			player:alert(1,1,"您的累计消费未满5W元宝,无法领取奖励!!");return;
		end
	end
end

function refresh_hfbianliang(player)
	--    如果要测试领取,刷第六天的时候把这个注释打开不清理充值累计信息.
	if player:get_param(const.PP_NEW_SVRMEG_TAG) ~= server.get_var("server_merge_time") then
		player:set_param(const.PP_NEW_SVRMEG_TAG,server.get_var("server_merge_time"));
		player:set_param(const.PP_HF_XIAOFEI_LQ,0);
		player:set_param(const.PP_HF_XIAOFEI_YB,0);
		player:set_param(const.PP_HF_CZYB_TEMP,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end

function reset_hfbianl(player)
	player:set_param(const.PP_HF_XIAOFEI_LQ,0);
	player:set_param(const.PP_HF_XIAOFEI_YB,0);
	player:set_param(const.PP_HF_CZYB_TEMP,0);
end