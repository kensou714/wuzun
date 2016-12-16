module(..., package.seeall)
OncientUse(_M,gm.gm);
OncientUse(_M,gm.help);
OncientUse(_M,gm.help2);
OncientUse(_M,gm.help3);
OncientUse(_M,gm.help4);
OncientUse(_M,gm.help5);
OncientUse(_M,newgui.self);
OncientUse(_M,newgui.minimap);
OncientUse(_M,newgui.newguanzhi);
require "npc.hhfuben"
OncientUse(_M,npc.hhfuben);
require "npc.dituyidong"
OncientUse(_M,npc.dituyidong);
OncientUse(_M,newgui.lingdi);

function onLoad(player)
        player:alert(110,0,"欢迎来到"..server.get_server_name().."!");
	player:alert(10,0,"健康游戏忠告:抵制不良游戏 拒绝盗版游戏 注意自我保护 谨防受骗上当 适度游戏益脑 沉迷游戏伤身 合理安排时间 享受健康生活");
	if( player:get_task_state(1) == 0 ) then
		player:set_task_state(1,1);
		login.first_login(player);
		player:add_skill(100);
		player:add_item_log(18001,206,1,1);
		--player:add_item_log("成长进阶礼包",206,1,1);
	end
	if util.ppn(player,const.PP_EVERYDAY_CHECK) ~= today() then
		player:set_param(const.PP_EVERYDAY_CHECK,today());
		login.everyday_first_login(player);
	end
	if server.get_var("xqczpmb1") == "" then
		server.set_var("xqczpmb1",499999);
		server.set_var("xqczpmb2",299999);
		server.set_var("xqczpmb3",99999);
		server.set_var("xqczpmb4",0);
	end
	if server.get_var("xqczpma2") == "" and tonumber(server.get_var("xqczpmb2")) >= 300000 then
		server.set_var("xqczpmb2",299999);
		npc.huodong.Recharge_chuli2();
	end
	if server.get_var("xqczpma3") == "" and tonumber(server.get_var("xqczpmb3")) >= 100000 then
		server.set_var("xqczpmb3",99999);
		npc.huodong.Recharge_chuli2();
	end
	if server.get_var("xqczpma4") == "" and tonumber(server.get_var("xqczpmb4")) >= 1 then
		server.set_var("xqczpmb4",0);
		npc.huodong.Recharge_chuli2();
	end
	if 300000 <= util.svn("svrmegczb2") and "" == server.get_var("svrmegcza2") then
		server.set_var("svrmegczb2",299999);
		gm.help2.svrmeg_Recharge_chuli();
	end
	if 100000 <= util.svn("svrmegczb3") and "" == server.get_var("svrmegcza3") then
		server.set_var("svrmegczb3",99999);
		gm.help2.svrmeg_Recharge_chuli();
	end
	if 1 <= util.svn("svrmegczb4") and "" == server.get_var("svrmegcza4") then
		server.set_var("svrmegczb4",0);
		gm.help2.svrmeg_Recharge_chuli();
	end
	if activity.isDoubleExpOpen() or newgui.jingcaihuodong.isOpenActivity(player,"qfsbge") or server.get_var("doubleopen") == 1 then
		if tonumber(server.get_exp_mul()) == 1 then
			server.set_exp_mul(2);
		end
	end
	if server.get_var("xf20131206tjpmb1") == "" then
		server.set_var("xf20131206tjpmb1",999999);
		server.set_var("xf20131206tjpmb2",499999);
		server.set_var("xf20131206tjpmb3",299999);
		server.set_var("xf20131206tjpmb4",0);
	end
	if util.ppn(player,const.PP_131205XIAOFEIYB) > util.svn("xf20131206tjpmb4") then
		npc.liguan.xiaofeitjpm_Recharge_process(player,0);
	end

	npc.genxxx.gx(player);
	npc.renwu.fenghao.tshz(player);
	login.load_player(player);
	
	if util.ppn(player,const.PP_SHENQI_XINGLV) > 0 then
		player:load_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
		if util.ppn(player,const.PP_SHENQI_JIELV) == 10 then
			player:set_status(73,86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
		else
			player:set_status(40+util.ppn(player,const.PP_SHENQI_JIELV),86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
		end
	end
end

function onUnload(player)
	login.unload_player(player);
end


function onEnterGame(player)

	if util.ppn(player,const.PP_HUODONG_REFRESH) <= 7 then
		player:set_param(const.PP_HUODONG_REFRESH,8);
		--这里用作一个即时刷新变量用 临时重置行会信息
		if player:get_guild() ~= "" then
			player:set_param(const.PP_GUILD_ENTER_DAY,today()-1);
		end
	end

	newgui.lingdi.reset_player_ldinfo(player);
	--铸魂
	newgui.fuse.zhuhunper(player);

	--投资计划
	player:set_param(const.PP_TOUZI_TYPE,1);
	--活跃度
	newgui.huoyuedu.JudgeRuKou(player);

	--新年活动
	if activity.isNewYearOpen() then
		--if activity.HUODONG_BIAOSHI < 117 then		
			--activity.HUODONG_BIAOSHI = 117
	    --end
		player:set_panel_data("panelminimapfun","btnNewYear","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnNewYear","visible","false");
	end

	if activity.isDay14Open() then
		player:set_panel_data("panelminimapfun","btnDay14th","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnDay14th","visible","false");
	end

	if activity.isfuhuojiezadan() then
		player:set_panel_data("panelminimapfun","btnzadan","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnzadan","visible","false");
	end
	if activity.isLongChengMiBao() then
		player:set_panel_data("panelminimapfun","btndragonmb","visible","true");
	else
		player:set_panel_data("panelminimapfun","btndragonmb","visible","false");
	end
	if activity.isFanLiShengDian() then
		player:set_panel_data("panelminimapfun","btnfanlishengdian","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnfanlishengdian","visible","false");
	end
	--福袋
	if activity.isChunZhiFuDai()then
		player:set_panel_data("panelminimapfun","btnchuzhifudai","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnchuzhifudai","visible","false");
	end

	--春节钜惠
	if activity.isChunJieJuHui()then
		player:set_panel_data("panelminimapfun","btnchunjiejuhui","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnchunjiejuhui","visible","false");
	end

	--重置天晶战场采集的变量
	player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
	-- if activity.isHuiguiLibaoOpen() --[[and util.ppn(player,const.PP_HG_IS_RECEIVE) ~= 1]] then
	-- 	player:set_panel_data("panelminimapfun","btnZhanshenGuilai","visible","true");
	-- else
	-- 	player:set_panel_data("panelminimapfun","btnZhanshenGuilai","visible","false");
	-- end
	--if activity.isHuiKuiLiBaoOpen() then
 	--	player:set_panel_data("panelminimapfun","btnShuJia","visible","true");
	--else
	--	player:set_panel_data("panelminimapfun","btnShuJia","visible","false");
	--end
	if activity.isxuyuanchi() then
		player:set_panel_data("panelminimapfun","btnxuyuanchi","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnxuyuanchi","visible","false");
	end
	if activity.islingyuzhuanpan() then
		player:set_panel_data("panelminimapfun","btnlyzhuanpan","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnlyzhuanpan","visible","false");
	end
	if activity.isCannonOpen() then
		player:set_panel_data("panelminimapfun","btnsuperCannon","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnsuperCannon","visible","false");
	end
	player:push_ckpanel_data("minimapfun","panelminimapfun");
		--print(util.ppn(player,const.PP_DUOBAO_ONTIME));
	if util.ppn(player,const.PP_DUOBAO_ONTIME) == 1 then
		onTimer19(player);
	end

	if util.ppn(player,const.PP_DUOBAO_YIJIAN) == 1 then
		newgui.duobao.randombom(player);
		player:set_param(const.PP_DUOBAO_YIJIAN,0);
	end
	if activity.isDuoBaoQiBing()then
		player:set_panel_data("panelminimapfun","btnduobao","visible","true");
		if util.ppn(player,const.PP_AUTO_TANCHUANG) ~= today() then
			if player:get_level() >= 50 then	
				player:set_param(const.PP_AUTO_TANCHUANG,today());
				player:set_param(const.PP_DUOBAO_FIRST,1);
				newgui.duobao.randombom(player);
				newgui.duobao.freshALLitem(player);
				newgui.duobao.showupitem(player);
				player:set_panel_data("panelduobao","panelduobao","panel_visible","true");
				player:push_ckpanel_data("duobao","panelduobao");
			end
		end
	else
		player:set_panel_data("panelminimapfun","btnduobao","visible","false");
	end
	if activity.isDuoBaoQiBing()  or activity.isDuoBaoQiBingPaiHang()  then
		player:set_panel_data("panelminimapfun","btnduobao","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnduobao","visible","false");
	end
	player:push_ckpanel_data("minimapfun","panelminimapfun");
	if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:set_status(34,86400,1,1,1)
		player:set_model(5,1);
		player:set_vip(1);
		if util.ppn(player,const.PP_HUIYUAN)-today() > 0 and util.ppn(player,const.PP_HUIYUAN)-today() <= 5 then
			player:alert(11,1,"您的会员还剩[<font color='#ff0000'>"..(util.ppn(player,const.PP_HUIYUAN)-today()).."天</font>]时间!")
		end
	else
		player:set_vip(0);
		player:clear_status(34);
	end
	if util.ppn(player,const.PP_GUANZHI) >= 1 then
		player:set_status(36,86400,util.ppn(player,const.PP_GUANZHI),1,1);
	end
	if util.ppn(player,const.PP_CZHZ_LV) >= 1 then
		player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
	end

	if util.ppn(player,const.PP_CUR_ZUOQI_LEVEL) > 0 then
		player:clear_status(35);
	end

	newgui.zuoqi.recalculateMountLevelExp(player);

	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	if zjie > 0 then
		if zxing == 0 then zjie = zjie -1 ;zxing = 10;end
		if zjie == 15 then
			player:set_status(72,86400,zxing,1,1);
		else
			if zjie > 15 then
				player:set_status(72,86400,10,1,1);
			end
			player:set_status(55+zjie,86400,zxing,1,1);
		end
	end
	
	player:set_model(7,util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL));
	player:set_model(8,util.ppn(player,const.PP_GUANZHI));
	player:set_model(2,util.ppn(player,const.PP_CZHZ_LV));
	player:set_model(1,util.ppn(player,const.PP_XINFA_LEVEL));

	--转生
	if util.ppn(player,const.PP_ZHUANSHENGLEVEL) >= 0 then
		player:set_status(50,86400,util.ppn(player,const.PP_ZHUANSHENGLEVEL),1,1);
		newgui.property.fresh_zhuansheng_info(player);
		player:set_zslevel(util.ppn(player,const.PP_ZHUANSHENGLEVEL));
	end

	if player:get_temp_param(const.PTP_ID_TIMER_GO) == nil or player:get_temp_param(const.PTP_ID_TIMER_GO) == "" then
		player:set_temp_param(const.PTP_ID_TIMER_GO,'h');
	end

	if util.ppn(player,const.PP_CHONGZHIJIFEN_CHONGZHI) <= 0 then
		player:set_param(const.PP_CHONGZHIJIFEN_CHONGZHI,1);
		player:set_param(const.PP_CHONGZHIJIFEN,util.ppn(player,const.PP_CHONGZHIJIFEN_OLD));--将老的积分赋值到新的里面去
	end

	for i=1,12 do
		if util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) >= i then
			if util.ppn(player,(const.PP_ACHIEVE_ZUOQI1+i-1)) == 0 then
				player:set_param((const.PP_ACHIEVE_ZUOQI1+i-1),10);
				if util.ppn(player,const.PP_ACHIEVE_FIRSTZUOQI) == 0 then
					player:set_param(const.PP_ACHIEVE_FIRSTZUOQI,10);
				end
			end
		end
		if util.ppn(player,const.PP_GUANZHI) >= i then
			if util.ppn(player,(const.PP_ACHIEVE_GUANZHI1+i-1)) == 0 then
				player:set_param((const.PP_ACHIEVE_GUANZHI1+i-1),10);
				if util.ppn(player,const.PP_ACHIEVE_FIRSTGUANZHI) == 0 then
					player:set_param(const.PP_ACHIEVE_FIRSTGUANZHI,10);
				end
			end
		end
	end
	achieve.onAchieveStateChange(player,0,0,0);
	newgui.property.achieve_active_xinfa(player);
	if player:get_name() == server.get_var("wlmz") then
		server.info(10,0,"<font color='#ff00ff'>尊敬的武林盟主[<font color='#ff0000'>"..player:get_name().."</font>]上线了!</font>");
		npc.renwu.fenghao.youxifh(player);
	else
		npc.renwu.fenghao.youxifh(player);
	end
	if util.ppn(player,const.PP_GUANZHI) >= 13 and util.ppn(player,const.PP_WANGSHANGXIAN) ~= hour() then
	local ch = {
		[13]={a="<font color='#FF0000'>镇北玄武王</font>"},
		[14]={a="<font color='#FF0000'>镇西白虎王</font>"},
		[15]={a="<font color='#FF0000'>镇南朱雀王</font>"},
		[16]={a="<font color='#FF0000'>镇东青龙王</font>"},
	};
		player:set_param(const.PP_WANGSHANGXIAN,hour());
		server.info(10,0,"万人敬仰的"..ch[util.ppn(player,const.PP_GUANZHI)].a.."[<font color='#ff0000'>"..player:get_name().."</font>]上线了!");
	end

	if util.ppn(player,const.PP_37WAN_MR_DQSJ) < ymd() then
		if util.ppn(player,const.PP_37WAN_MR_TAG) > 0 then
			player:set_param(const.PP_37WAN_MR_TAG,0);
			player:set_mrt(0);
		end
	end
	if util.ppn(player,const.PP_37WAN_MR_TAG) > 0 then
		player:set_mrt(1);
		server.info(10,0,"名人".."[<font color='#ff0000'>"..player:get_name().."</font>]上线了!");
	end

	if util.ppn(player,const.PP_XINFA_LEVEL) > 0 then
		if util.ppn(player,const.PP_XINFA_LEVEL)>50 then
			player:clear_status(38);
			player:set_status(71,86400,util.ppn(player,const.PP_XINFA_LEVEL)-50,1,1);
		else
			player:clear_status(71);
			player:set_status(38,86400,util.ppn(player,const.PP_XINFA_LEVEL),1,1);
		end
	end

	--登陆检测每日充值的参数
	if util.ppn(player,const.PP_CONGZI_DAY) ~= today() then
		player:set_param(const.PP_DAILY_CONGZI,0);
		player:set_param(const.PP_DAILY_GIFT,0);
		player:set_param(const.PP_DAYCZ_NO2,0);
		player:set_param(const.PP_DAYCZ_NO3,0);
		player:set_param(const.PP_DAYCZ_NO4,0);
	end
	newgui.minimap.reset_player_actczlj_info(player)
	npc.liguan.reset_server_mzczpm_info();

	player:set_param(const.PP_XINFA_LEVEL,util.ppn(player,const.PP_XINFA_LEVEL));
	login.enter_game(player);

	if util.ppn(player,const.PP_ZAIXIANLB) <= 5 then
		if util.ppn(player,const.PP_ZAIXIANLB) == 0 then
			player:set_param(const.PP_ZXLBSJ,player:get_online_time());
			player:countdown_notify(120,"<font color='#FFFF00'>在线奖励:<br>四倍宝典   数量:1<br>行会经验符 数量:1<br>绑定金币   数量:200000</font>");
		end
		if util.ppn(player,const.PP_ZAIXIANLB) == 1 then
			player:set_param(const.PP_ZXLBSJ,player:get_online_time());
			player:countdown_notify(240,"<font color='#FFFF00'>在线奖励:<br>幸运宝箱   数量:1<br>随机传送石 数量:1<br>绑定金币   数量:200000</font>");
		end
		if util.ppn(player,const.PP_ZAIXIANLB) == 2 then
			local x={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};
			player:set_param(const.PP_ZXLBSJ,player:get_online_time());
			player:countdown_notify(480,"<font color='#FFFF00'>在线奖励:<br>"..x[player:get_job_name()].."   数量:1<br>玛雅令牌 数量:1<br>绑定金币 数量:200000</font>");
		end
		if util.ppn(player,const.PP_ZAIXIANLB) == 3 then
			player:set_param(const.PP_ZXLBSJ,player:get_online_time());
			player:countdown_notify(900,"<font color='#FFFF00'>在线奖励:<br>蓝玉镖令 数量:1<br>进阶石   数量:10<br>绑定金币 数量:300000</font>");
		end
		if util.ppn(player,const.PP_ZAIXIANLB) == 4 then
			player:set_param(const.PP_ZXLBSJ,player:get_online_time());
			player:countdown_notify(1200,"<font color='#FFFF00'>在线奖励:<br>坐骑经验丹(大) 数量:1<br>招财神符       数量:1<br>绑定金币       数量:400000</font>");
		end
		if util.ppn(player,const.PP_ZAIXIANLB) == 5 then
			player:set_param(const.PP_ZXLBSJ,player:get_online_time());
			player:countdown_notify(1800,"<font color='#FFFF00'>在线奖励:<br>女儿红(10年)   数量:1<br>绑定元宝       数量:500<br>绑定金币       数量:500000</font>");
		end
	end
	--判断服务器ini是否开放登录器
	if server.get_login_show() == 1 then
		if util.ppn(player,const.PP_LOGIN_AWARD) == 0 then
			player:set_panel_data("panelminimapfun","btnLoginTools","visible","true");
			player:set_panel_data("panelminimapfun","btnHBox","visible","true");
			player:push_ckpanel_data("minimapfun","panelminimapfun");
		end
	end
		
	local goodring = 0;
	local r1type_id,r1bind,r1use_bind,r1jpin,r1dura,r1durmax,r1addac,r1addmac,r1adddc,r1addmc,r1addsc,r1luck,qianghualv,qianghuacount,r1updad,r1updmac,r1upddc,r1updmc,r1updsc,r1protect,r1addhp,r1addmp,r1remaintime = player:get_item_data_by_pos(-10);
	if r1type_id and (r1type_id == 59000 or r1type_id == 59001) then
		goodring = goodring + 1;
	end
	local r2type_id,r2bind,r2use_bind,r2jpin,r2dura,r2durmax,r2addac,r2addmac,r2adddc,r2addmc,r2addsc,r2luck,qianghualv,qianghuacount,r2updad,r2updmac,r2upddc,r2updmc,r2updsc,r2protect,r2addhp,r2addmp,r2remaintime = player:get_item_data_by_pos(-11);
	if r2type_id and (r2type_id == 59000 or r2type_id == 59001) then
		goodring = goodring + 1;
	end
	if goodring > 1 and player:num_bag_black() >= 1 then
		player:dress_item(-11);
	end

	local huwan = 0;
	local w1type_id,w1bind,w1use_bind,w1jpin,w1dura,w1durmax,w1addac,w1addmac,w1adddc,w1addmc,w1addsc,w1luck,qianghualv,qianghuacount,w1updad,w1updmac,w1upddc,w1updmc,w1updsc,w1pwotect,w1addhp,w1addmp,w1wemaintime = player:get_item_data_by_pos(-12);
	if w1type_id and (w1type_id == 69000 or w1type_id == 69001) then
		huwan = huwan + 1;
	end
	local w2type_id,w2bind,w2use_bind,w2jpin,w2duwa,w2duwmax,w2addac,w2addmac,w2adddc,w2addmc,w2addsc,w2luck,qianghualv,qianghuacount,w2updad,w2updmac,w2upddc,w2updmc,w2updsc,w2pwotect,w2addhp,w2addmp,w2remaintime = player:get_item_data_by_pos(-13);
	if w2type_id and (w2type_id == 69000 or w2type_id == 69001) then
		huwan = huwan + 1;
	end
	if huwan > 1 and player:num_bag_black() >= 1 then
		player:dress_item(-13);
	end

	local lastlogin = player:get_last_login_time();
	local lastlogout = player:get_last_logout_time();
	if util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		local gap = lastlogin - lastlogout;
		if gap >= util.ppn(player,const.PP_TEMP_VIP_TIMER) then
			player:set_param(const.PP_TEMP_VIP_TIMER,0);
			ckpanel.tempVipOver(player);
		else
			player:set_param(const.PP_TEMP_VIP_TIMER,util.ppn(player,const.PP_TEMP_VIP_TIMER)-gap);
			player:set_timer(11,1);
		end
	end
	
------------------------------------
	--等级排名
	if server_start_day() <= 0 then
		for i = 1,10 do
			if server.get_var("SvrLvRankName"..i) == "" then
				server.set_var("SvrLvRankName"..i,"暂无上榜 ");
				server.set_var("SvrLvRankLv"..i,0);
				server.set_var("SvrLvRankExp"..i,0);
			end
		end
	end 
	if check_levelrk_timelt() then
		gm.help2.levelrank_Recharge_process(player);
	end
	--玄晶品阶之和排名
	if activity.isBaifuSjieOpen() then
		for z =1,10 do
			if server.get_var("SvrLvXjName"..z) == "" then
				--print("set name");
				server.set_var("SvrLvXjName"..z,"暂无上榜 ");
				server.set_var("SvrLvXjLv"..z,0);
			end
		end
		newgui.xuanjing.calculate_xjlv(player);
	end
-------------------------------------

	-- if is_merge_server() then
	-- 	gm.help2.reset_player_svrmeg_info(player);
	-- 	gm.help2.resetmergeinfo(player);
	-- end

	checkMergeSteelRand();

	--------------------------------------
	----------其他面板的一些刷新----------
	--------------------------------------
	newgui.xjday.fresh_xjday_btn(player);
	newgui.property.fresh_self_info(player);
	newgui.qifu.fresh_qifu_info(player);
	newgui.zuoqi.fresh_mount_panel(player);
	--------------------------------------

	if util.ppn(player,const.PP_37WAN37HUODONG) >= 10000 and util.ppn(player,const.PP_37YONGJIUGONGJI) <= 0 then
		player:set_param(const.PP_37YONGJIUGONGJI,1);

		if player:get_job_name() == "warrior" then
			player:add_reincarnate_mdcmax(100);
			player:alert(11,1,"恭喜您获得37活动永久属性[物理攻击+100]!");
		end
		if player:get_job_name() == "wizard" then
			player:add_reincarnate_mmcmax(100);
			player:alert(11,1,"恭喜您获得37活动永久属性[魔法攻击+100]!");
		end
		if player:get_job_name() == "taoist" then
			player:add_reincarnate_mscmax(100);
			player:alert(11,1,"恭喜您获得37活动永久属性[道术攻击+100]!");
		end
	end

	-------------------------------------------------
	---游戏异常 补偿处理
	if ymd() == 20150302 and util.ppn(player,const.PP_GAME_BUG_BUCHANG) ~= 20150302 then
		player:set_param(const.PP_GAME_BUG_BUCHANG,20150302);
		if player:get_level() >= 50 then
			player:add_item("绑定元宝",6000);
			--player:add_item("绑定金币",2000000);
			--player:add_item("天书精华",3,1);
			player:add_item("四倍宝典",5,1);
			player:alert(11,1,"您获得了更新补偿 绑定元宝*6000 四倍宝典*5,祝您游戏愉快!");
		end
	end
	-------------------------------------------------
	player:push_ckpanel_data("minimapfun","panelminimapfun");
	--------------------------------------------------
	player:recal_attr();
end

function onCountDownFinit(player)
	if util.ppn(player,const.PP_ZAIXIANLB) == 0 then
		if player:get_online_time() - 120 >= util.ppn(player,const.PP_ZXLBSJ) then
			if player:num_bag_black() >= 2 then
				player:add_item_log("四倍宝典",207,1,1);
				player:add_item_log("行会经验符",207,1,1);
				player:add_gamemoney_bind(200000);
				player:set_param(const.PP_ZXLBSJ,player:get_online_time());
				player:set_param(const.PP_ZAIXIANLB,1);
				player:alert(11,1,"成功领取在线奖励:");
				player:alert(11,0,"<font color='#ffaa00'>四倍宝典   数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>行会经验符 数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定金币   数量:200000</font>");
				player:countdown_notify(240,"<font color='#FFFF00'>在线奖励:<br>幸运宝箱   数量:1<br>随机传送石 数量:1<br>绑定金币   数量:200000</font>");
			else
				player:alert(1,1,"背包空格不足2格,领取失败");
				player:countdown_notify(120-(player:get_online_time()-util.ppn(player,const.PP_ZXLBSJ)),"<font color='#FFFF00'>在线奖励:<br>四倍宝典   数量:1<br>行会经验符 数量:1<br>绑定金币   数量:200000</font>");
			end
		end
	return;
	end
	if util.ppn(player,const.PP_ZAIXIANLB) == 1 then
		if player:get_online_time() - 240 >= util.ppn(player,const.PP_ZXLBSJ) then
			local x={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};
			if player:num_bag_black() >= 2 then
				player:add_item_log("幸运宝箱",207,1,1);
				player:add_item_log("随机传送石",207,1,1);
				player:add_gamemoney_bind(200000);
				player:set_param(const.PP_ZXLBSJ,player:get_online_time());
				player:set_param(const.PP_ZAIXIANLB,2);
				player:alert(11,1,"成功领取在线奖励:");
				player:alert(11,0,"<font color='#ffaa00'>幸运宝箱   数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>随机传送石 数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定金币   数量:200000</font>");
				player:countdown_notify(480,"<font color='#FFFF00'>在线奖励:<br>"..x[player:get_job_name()].."   数量:1<br>玛雅令牌 数量:1<br>绑定金币 数量:200000</font>");
			else
				player:alert(1,1,"背包空格不足2格,领取失败");
				player:countdown_notify(240-(player:get_online_time()-util.ppn(player,const.PP_ZXLBSJ)),"<font color='#FFFF00'>在线奖励:<br>幸运宝箱   数量:1<br>随机传送石 数量:1<br>绑定金币   数量:200000</font>");
			end
		end
	return;
	end
	if util.ppn(player,const.PP_ZAIXIANLB) == 2 then
		if player:get_online_time() - 480 >= util.ppn(player,const.PP_ZXLBSJ) then
			local x={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};
			if player:num_bag_black() >= 2 then
				player:add_item_log(x[player:get_job_name()],207,1,1);
				player:add_item_log("玛雅令牌",207,1,1);
				player:add_gamemoney_bind(200000);
				player:set_param(const.PP_ZXLBSJ,player:get_online_time());
				player:set_param(const.PP_ZAIXIANLB,3);
				player:alert(11,1,"成功领取在线奖励:");
				player:alert(11,0,"<font color='#ffaa00'>"..x[player:get_job_name()].."   数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>玛雅令牌 数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定金币 数量:200000</font>");
				player:countdown_notify(900,"<font color='#FFFF00'>在线奖励:<br>蓝玉镖令 数量:1<br>进阶石   数量:10<br>绑定金币 数量:300000</font>");
			else
				player:alert(1,1,"背包空格不足2格,领取失败");
				player:countdown_notify(480-(player:get_online_time()-util.ppn(player,const.PP_ZXLBSJ)),"<font color='#FFFF00'>在线奖励:<br>"..x[player:get_job_name()].."   数量:1<br>玛雅令牌 数量:1<br>绑定金币 数量:200000</font>");
			end
		end
	return;
	end
	if util.ppn(player,const.PP_ZAIXIANLB) == 3 then
		if player:get_online_time() - 900 >= util.ppn(player,const.PP_ZXLBSJ) then
			if player:num_bag_black() >= 3 then
				player:add_item_log("蓝玉镖令",207,1,1);
				player:add_item_log("进阶石",207,10,1);
				player:add_gamemoney_bind(300000);
				player:set_param(const.PP_ZXLBSJ,player:get_online_time());
				player:set_param(const.PP_ZAIXIANLB,4);
				player:alert(11,1,"成功领取在线奖励:");
				player:alert(11,0,"<font color='#ffaa00'>蓝玉镖令 数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>进阶石   数量:10</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定金币 数量:300000</font>");
				player:countdown_notify(1200,"<font color='#FFFF00'>在线奖励:<br>坐骑经验丹(大) 数量:1<br>招财神符       数量:1<br>绑定金币       数量:400000</font>");
			else
				player:alert(1,1,"背包空格不足3格,领取失败");
				player:countdown_notify(900-(player:get_online_time()-util.ppn(player,const.PP_ZXLBSJ)),"<font color='#FFFF00'>在线奖励:<br>蓝玉镖令 数量:1<br>进阶石   数量:10<br>绑定金币 数量:300000</font>");
			end
		end
	return;
	end
	if util.ppn(player,const.PP_ZAIXIANLB) == 4 then
		if player:get_online_time() - 1200 >= util.ppn(player,const.PP_ZXLBSJ) then
			if player:num_bag_black() >= 2 then
				player:add_item_log("坐骑经验丹(大)",207,1,1);
				player:add_item_log("招财神符",207,1,1);
				player:add_gamemoney_bind(400000);
				player:set_param(const.PP_ZXLBSJ,player:get_online_time());
				player:set_param(const.PP_ZAIXIANLB,5);
				player:alert(11,1,"成功领取在线奖励:");
				player:alert(11,0,"<font color='#ffaa00'>坐骑经验丹(大) 数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>招财神符       数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定金币       数量:400000</font>");
				player:countdown_notify(1800,"<font color='#FFFF00'>在线奖励:<br>女儿红(10年)   数量:1<br>绑定元宝       数量:500<br>绑定金币       数量:500000</font>");
			else
				player:alert(1,1,"背包空格不足2格,领取失败");
				player:countdown_notify(1200-(player:get_online_time()-util.ppn(player,const.PP_ZXLBSJ)),"<font color='#FFFF00'>在线奖励:<br>坐骑经验丹(大) 数量:1<br>招财神符       数量:1<br>绑定金币       数量:400000</font>");
			end
		end
	return;
	end
	if util.ppn(player,const.PP_ZAIXIANLB) == 5 then
		if player:get_online_time() - 1800 >= util.ppn(player,const.PP_ZXLBSJ) then
			if player:num_bag_black() >= 2 then
				player:add_item_log("女儿红(10年)",207,1,1);
				player:add_vcoin_bind(500);
				player:add_gamemoney_bind(500000);
				player:set_param(const.PP_ZXLBSJ,player:get_online_time());
				player:set_param(const.PP_ZAIXIANLB,6);
				player:alert(11,1,"成功领取在线奖励:");
				player:alert(11,0,"<font color='#ffaa00'>女儿红(10年)   数量:1</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定元宝       数量:500</font>");
				player:alert(11,0,"<font color='#ffaa00'>绑定金币       数量:500000</font>");
			else
				player:alert(1,1,"背包空格不足2格,领取失败");
				player:countdown_notify(1800-(player:get_online_time()-util.ppn(player,const.PP_ZXLBSJ)),"<font color='#FFFF00'>在线奖励:<br>女儿红(10年)   数量:1<br>绑定元宝       数量:500<br>绑定金币       数量:500000</font>");
			end
		end
	return;
	end
end


function onLeaveGame(player)
	login.leave_game(player);
end

function onAwardLoginForm(player)
	if util.ppn(player,const.PP_LOGIN_AWARD) == 0 then
		player:set_param(const.PP_LOGIN_AWARD,1);
		player:add_vcoin_bind(1000);
		player:add_gamemoney_bind(500000);
		player:set_panel_data("panelminimapfun","btnLoginTools","visible","false");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
		player:alert(1,1,"绑定元宝增加1000,绑定金币增加50W,<br>感谢您使用我们的登陆器登陆.");
	end
end

function onDead(player)
	ckdead.triger_dead(player,nil);
	if player:get_map():get_id() == "smzc" then
		if player:is_dead() then
			player:set_param(const.PP_SMZCJISHI,15)
			player:alert(10,0,util.ppn(player,const.PP_SMZCJISHI).."秒后自动复活到本方阵营");
			player:set_timer(5,1000);
		end
	end
	if player:get_map() and player:get_map():get_id() == "tjzc" then
		if player:is_dead() then
			player:set_param(const.PP_SMZCJISHI,15)
			player:alert(11,0,util.ppn(player,const.PP_SMZCJISHI).."秒后自动复活到本方阵营");
			player:set_timer(5,5000);
		end
	end
	if player:get_map():get_id() == "binghuodao" then
		if player:is_dead() then
			player:set_timer(5,1);
		end
	end
end

function onPKDead(killed,killer)
	if killer:get_map():get_id() == "smzc" and server.get_temp_var("smzc") == "1" then
		local map=server.find_map("smzc");
		if killer:get_team_name() == "神族阵营" then
			killer:set_param(const.PP_SMZCKILL,util.ppn(killer,const.PP_SMZCKILL)+1);
			killer:set_param(const.PP_SMZCJIFEN,util.ppn(killer,const.PP_SMZCJIFEN)+killed:get_level());
			server.set_temp_var("szzy",server.get_temp_var("szzy")+killed:get_level());
			server.info(10,0,"魔族阵营的[<font color='#ff0000'>"..killed:get_name().."</font>]被神族阵营的[<font color='#ff0000'>"..killer:get_name().."</font>]杀害了!");
			map:map_exe("npc.zhanchang.onTalkjf");
			npc.huodong.Recharge_process3(killer,0);
		end
		if killer:get_team_name() == "魔族阵营" then
			killer:set_param(const.PP_SMZCKILL,util.ppn(killer,const.PP_SMZCKILL)+1);
			killer:set_param(const.PP_SMZCJIFEN,util.ppn(killer,const.PP_SMZCJIFEN)+killed:get_level());
			server.set_temp_var("mzzy",server.get_temp_var("mzzy")+killed:get_level());
			server.info(10,0,"神族阵营的[<font color='#ff0000'>"..killed:get_name().."</font>]被魔族阵营的[<font color='#ff0000'>"..killer:get_name().."</font>]杀害了!");
			map:map_exe("npc.zhanchang.onTalkjf");
			npc.huodong.Recharge_process3(killer,0);
		end
	end
	if  killer:get_map() and killer:get_map():get_id() == "tjzc" and server.get_temp_var("tjzc") == "1" then
		local map=server.find_map("tjzc");
		if killer:get_team_name() == "红方阵营" then
			killer:set_param(const.PP_SMZCKILL,util.ppn(killer,const.PP_SMZCKILL)+1);
			killer:set_param(const.PP_SMZCJIFEN,util.ppn(killer,const.PP_SMZCJIFEN)+10);
			server.set_temp_var("szzy",server.get_temp_var("szzy")+10);
			server.info(10,0,"蓝方阵营的[<font color='#ff0000'>"..killed:get_name().."</font>]被红方阵营的[<font color='#ff0000'>"..killer:get_name().."</font>]杀害了!");
			npc.tjkuang.Recharge_process3(killer,0);
		end
		if killer:get_team_name() == "蓝方阵营" then
			killer:set_param(const.PP_SMZCKILL,util.ppn(killer,const.PP_SMZCKILL)+1);
			killer:set_param(const.PP_SMZCJIFEN,util.ppn(killer,const.PP_SMZCJIFEN)+10);
			server.set_temp_var("mzzy",server.get_temp_var("mzzy")+10);
			server.info(10,0,"红方阵营的[<font color='#ff0000'>"..killed:get_name().."</font>]被蓝方阵营的[<font color='#ff0000'>"..killer:get_name().."</font>]杀害了!");
			npc.tjkuang.Recharge_process3(killer,0);
		end
	end
	if server.get_war_state() == 1 then
		if killer:get_map() and (killer:get_map():get_id() == "kinghome" or killer:get_map():get_id() == "kingcity") then
			if util.ppn(killer,const.PP_GUILD_KBONUS_LIMIT) < 100 and killer:get_guild() ~= "" then
				killer:set_param(const.PP_GUILD_KBONUS_LIMIT,util.ppn(killer,const.PP_GUILD_KBONUS_LIMIT)+1);
				killer:add_guild_gx(1);
				killer:alert(11,0,"成功在攻城战中获得击杀,获得1点行会贡献!");
			end
		end
	end
	--ckdead.triger_dead(killed,killer);
end

function onStartCaiji(mon,player)
	local monname = mon:get_name();
	if monname == "原始据点" then
		if player:get_guild() ~= "" then
			if player:get_guild_gx() >= 100 then
				player:start_progress_bar(mon:get_caiji_duration(),"正在占领中...");return 1;
			else
				player:alert(1,1,"占领据点需要消耗100点行会贡献!");return 0;
			end
		else
			player:alert(1,1,"尚未拥有行会,没有占领资格!");return 0;
		end
	end
	if monname == "据点" then
		if player:get_guild() ~= "" then
			if player:get_guild() == server.get_var("curldowner") then
				player:alert(1,1,"您行会已经占领据点,请守好据点!");
			else
				if player:get_guild_gx() >= 100 then
					player:start_progress_bar(mon:get_caiji_duration(),"正在占领中...");return 1;
				else
					player:alert(1,1,"占领据点需要消耗100点行会贡献!");return 0;
				end
			end		
		else
			player:alert(1,1,"尚未拥有行会,没有占领资格!"); return 0;
		end
	end
	ckmon.triger_caijistart(player,mon); return 1;
end

function onCaiji(mon,player)			
ckmon.triger_caiji(player,mon);
end

function onLevelUp(player)
	if check_levelrk_timelt() then
		gm.help2.levelrank_Recharge_process(player);
	end
	if player:get_level() >= 20 then
		player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+200);
		player:alert(10,1,"恭喜您升级成功!(<font color='#FFAA00'>修为+200</font>)");
		player:alert(10,1,"<font color='#FFAA00'>击杀BOSS也可获得大量修为!</font>");
	end
	cklevel.triger_level(player,player:get_level());
	if player:get_level() >= 45 and player:get_task_state(3006) == 0 then
		player:set_task_state(3006,1);
		player:push_task_data(3006,0);
	end

	--活跃度
	newgui.huoyuedu.JudgeRuKou(player);

	if player:get_level() == 30 and util.ppn(player,const.PP_SJJL30) == 0 then
		player:alert(11,1,"<font color='#ff0000'>达到30级,可在活动面板领取奖励!</font>");
	end
	if player:get_level() == 40 and util.ppn(player,const.PP_SJJL40) == 0 then
		player:alert(11,1,"<font color='#ff0000'>达到40级,可在活动面板领取奖励!</font>");
	end
	if player:get_level() == 50 and util.ppn(player,const.PP_SJJL50) == 0 then
		player:alert(11,1,"<font color='#ff0000'>达到50级,可在活动面板领取奖励!</font>");
	end
	if player:get_level() >= 55 and player:skill_level(614) == 0 then
		player:add_skill(614);
		shortcut.show(player,1,0,0);
	end
	if( player:get_job_name() == "warrior" ) then
		if player:get_level() >= 7 and player:skill_level(101) == 0 then
			player:add_skill(101);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>战士剑术</font>");
		end
		if player:get_level() >= 19 and player:skill_level(102) == 0 then
			player:add_skill(102);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>强攻剑术</font>");
		end
		if player:get_level() >= 25 and player:skill_level(103) == 0 then
			player:add_skill(103);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>刺杀剑气</font>");
		end
		if player:get_level() >= 28 and player:skill_level(104) == 0 then
			player:add_skill(104);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>雷霆莲月</font>");
		end
		if player:get_level() >= 30 and player:skill_level(105) == 0 then
			player:add_skill(105);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>战神冲撞</font>");
		end
		if player:get_level() >= 35 and player:skill_level(106) == 0 and player:skill_level(107) == 0 and player:skill_level(109) == 0 then
			player:add_skill(106);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>战圣烈焰</font>");
		end
	end
	if( player:get_job_name() == "taoist" ) then
		if player:get_level() >= 7 and player:skill_level(504) == 0 then
			player:add_skill(504);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>天魂灵符</font>");
		end
		if player:get_level() >= 8 and player:skill_level(501) == 0 then
			player:add_skill(501);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>回春之术</font>");
		end
		if player:get_level() >= 9 and player:skill_level(502) == 0 then
			player:add_skill(502);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>精神冥想</font>");
		end
		if player:get_level() >= 14 and player:skill_level(503) == 0 then
			player:add_skill(503);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>天尊之毒</font>");
		end
		if player:get_level() >= 19 and player:skill_level(505) == 0 then
			player:add_skill(505);
			player:use_skill(505);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>亡灵召唤</font>");
		end
		if player:get_level() >= 20 and player:skill_level(506) == 0 then
			player:add_skill(506);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>隐身之术</font>");
		end
		if player:get_level() >= 21 and player:skill_level(507) == 0 then
			player:add_skill(507);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>天尊隐身</font>");
		end
		if player:get_level() >= 22 and player:skill_level(508) == 0 then
			player:add_skill(508);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>魔神庇护</font>");
		end
		if player:get_level() >= 25 and player:skill_level(509) == 0 then
			player:add_skill(509);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>斗神庇护</font>");
		end
		if player:get_level() >= 33 and player:skill_level(512) == 0 then
			player:add_skill(512);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>天尊灵疗</font>");
		end
		if player:get_level() >= 35 and player:skill_level(513) == 0 and player:skill_level(518) == 0 then
			player:add_skill(513);
			player:use_skill(513);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>无极召唤</font>");
		end
	end
	if( player:get_job_name() == "wizard" ) then
		if player:get_level() >= 7 and player:skill_level(401) == 0 then
			player:add_skill(401);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>火焰之球</font>");
		end
		if player:get_level() >= 12 and player:skill_level(402) == 0 then
			player:add_skill(402);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>法师威严</font>");
		end
		if player:get_level() >= 16 and player:skill_level(404) == 0 then
			player:add_skill(404);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>黑狱之火</font>");
		end
		if player:get_level() >= 17 and player:skill_level(405) == 0 then
			player:add_skill(405);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>天雷之术</font>");
		end
		if player:get_level() >= 19 and player:skill_level(406) == 0 then
			player:add_skill(406);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>空间穿梭</font>");
		end
		if player:get_level() >= 20 and player:skill_level(407) == 0 then
			player:add_skill(407);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>火焰飞轮</font>");
		end
		if player:get_level() >= 22 and player:skill_level(408) == 0 then
			player:add_skill(408);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>爆焰火球</font>");
		end
		if player:get_level() >= 24 and player:skill_level(409) == 0 then
			player:add_skill(409);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>烈焰火墙</font>");
		end
		if player:get_level() >= 26 and player:skill_level(410) == 0 then
			player:add_skill(410);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>黑狱雷电</font>");
		end
		if player:get_level() >= 30 and player:skill_level(411) == 0 then
			player:add_skill(411);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>雷光风暴</font>");
		end
		if player:get_level() >= 31 and player:skill_level(412) == 0 then
			player:add_skill(412);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>法神灵盾</font>");
		end
		if player:get_level() >= 35 and player:skill_level(414) == 0 and player:skill_level(416) == 0 and player:skill_level(417) == 0 then
			player:add_skill(414);
			player:alert(10,0,"成功领悟新技能:<font color='#ff0000'>冰雪咆哮</font>");
		end
	end
end


local mtab ={"[BOSS]奴玛教主","[BOSS]奴玛教主1","[BOSS]奴玛教主11","[BOSS]奴玛教主12","[BOSS]奴玛教主2","[BOSS]奴玛教主21","[BOSS]奴玛教主22","[BOSS]奴玛教主3","[BOSS]奴玛教主31","[BOSS]奴玛教主32","[BOSS]妖月血魔","[BOSS]巨灵天魔","[BOSS]混沌魔君","[BOSS]猛犸教主","[BOSS]蛮牛王","[一转]赤焰魔君","[三转]暗夜领主","[二转]鬼斧恶魔","[四转]暗影妖后","[精英]奴玛勇士","[精英]奴玛战将","[精英]妖毒蜘蛛","[精英]妖魔蜘蛛","[精英]巨灵守卫","[精英]巨灵战士","[精英]巨灵战斧","[精英]混沌侍卫","[精英]混沌将军","[精英]混沌祭司","[精英]火焰奴玛","[精英]猛犸卫士","[精英]猛犸弓箭手","[精英]猛犸雕像","[精英]蛮牛将军","[精英]蛮牛法师","[精英]蛮牛祭司","[精英]赤锷蜘蛛","亘古魔王","变异蛇蝎王","嗜血毒虫","噬日魔兽","天威魔帝","奴玛教主","奴玛教主1","奴玛教皇","妖月血魔","妖月血魔2","妖月金刚","妖月金刚1","巨灵天魔","巨灵天魔1","巨灵天魔2","幽灵教主","无极天尊","武威战神","混沌魔君","烈焰法神","牛魔圣君","猛犸教主","猛犸教主1","猛犸教主2","猛犸教皇","玛雅之神","落日恶魔","蚀骨尸王","蛮牛王","蛮牛王1","蛮牛王2","远古大帝","远古恶魔","邪恶蛇蝎","邪恶蛇蝎1","邪龙神","重装使者","魔魂教主" }

function onKill(mon,player)
	---封魔林杀怪
	npc.tucheng.fengml.check_mon(mon,player);
	--成就相关
	if activity.isSthDrop() then
		for i=1,#mtab do
			if mtab[i]==mon:get_name() then
				local x,y = player:get_pos();
				local r = math.random(100000);
				if r <= 2000 then
					player:get_map():drop_item("月饼",1,x,y,player:get_id(),120);
				end
			end
		end
	end
	player:set_param(const.PP_MONKILL_NUMBER,util.ppn(player,const.PP_MONKILL_NUMBER)+1);
	--player:alert(1100,0,"杀怪数量"..util.ppn(player,const.PP_MONKILL_NUMBER));
	if util.ppn(player,const.PP_ACHIEVE_FIRSTMON) == 0 then
		player:set_param(const.PP_ACHIEVE_FIRSTMON,10);
		newgui.achieve.fresh_achieve_title(player,1)
		player:alert(11,0,"恭喜您完成目标:第一次击杀怪物!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 10000000 and util.ppn(player,const.PP_ACHIEVE_MON1KW) == 0 then
		player:set_param(const.PP_ACHIEVE_MON1KW,10);
		newgui.achieve.fresh_achieve_title(player,2)
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到1千万只!");
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 5000000 and util.ppn(player,const.PP_ACHIEVE_MON5BW) == 0 then
		player:set_param(const.PP_ACHIEVE_MON5BW,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到5百万只!");
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 2000000 and util.ppn(player,const.PP_ACHIEVE_MON2BW) == 0 then
		player:set_param(const.PP_ACHIEVE_MON2BW,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到2百万只!");
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 1000000 and util.ppn(player,const.PP_ACHIEVE_MON1BW) == 0 then
		player:set_param(const.PP_ACHIEVE_MON1BW,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到1百万只!");
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 100000 and util.ppn(player,const.PP_ACHIEVE_MON10W) == 0 then
		player:set_param(const.PP_ACHIEVE_MON10W,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到10万只!");
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 10000 and util.ppn(player,const.PP_ACHIEVE_MON1W) == 0 then
		player:set_param(const.PP_ACHIEVE_MON1W,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到1万只!");
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 1000 and util.ppn(player,const.PP_ACHIEVE_MON1K) == 0 then
		player:set_param(const.PP_ACHIEVE_MON1K,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到1000只!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 100 and util.ppn(player,const.PP_ACHIEVE_MON1B) == 0 then
		player:set_param(const.PP_ACHIEVE_MON1B,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到100只!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if util.ppn(player,const.PP_ACHIEVE_MON1B) >= 100 then player:set_param(const.PP_ACHIEVE_MON1B,10);end
	if util.ppn(player,const.PP_MONKILL_NUMBER) >= 10 and util.ppn(player,const.PP_ACHIEVE_MON10) == 0 then
		player:set_param(const.PP_ACHIEVE_MON10,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:累计杀怪达到10只!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end
	if mon:get_level() >= 150 and util.ppn(player,const.PP_ACHIEVE_FIRSTBOSS) == 0  then
		player:set_param(const.PP_ACHIEVE_FIRSTBOSS,10);
		newgui.achieve.fresh_achieve_title(player,2);
		player:alert(11,0,"恭喜您完成目标:第一次击杀BOSS!");
		player:push_guide_info("panelminimapfun","btnAchieve",2);
	end

	if util.ppn(player,const.PP_BAIFUJISHABOSSCHONGZHI)<= 40 then  --20140425 buchang
		player:set_param(const.PP_BAIFUJISHABOSSCHONGZHI,41);
		player:set_param(const.PP_BAIFUJISHABOSSBIAOZHI,0);
		player:set_param(const.PP_BAIFUJISHABOSS1,0);
		player:set_param(const.PP_BAIFUJISHABOSS2,0);
		player:set_param(const.PP_BAIFUJISHABOSS3,0);
	end

	if newgui.jingcaihuodong.isOpenActivity(player,"bossjspm") then
		local activityTimes = newgui.jingcaihuodong.getActivityTimes(player,"bossjspm");
		if activityTimes ~= util.ppn(player,const.PP_JC_BOSSJSPM_TIME) then
			player:set_param(const.PP_JC_BOSSJSPM_TIME,activityTimes);
			player:set_param(const.PP_JC_BOSSJSPM_RECEIVE1,0);
			player:set_param(const.PP_JC_BOSSJSPM_RECEIVE2,0);
			player:set_param(const.PP_JC_BOSSJSPM_RECEIVE3,0);
			player:set_param(const.PP_BAIFUJISHABOSS1,0);
			player:set_param(const.PP_BAIFUJISHABOSS2,0);
			player:set_param(const.PP_BAIFUJISHABOSS3,0);
		end
	end

	if activity.isBaifuBuchang() or newgui.jingcaihuodong.isOpenActivity(player,"bossjspm") then
		if mon:get_level()>=160 and mon:get_level()<180 then
				player:set_param(const.PP_BAIFUJISHABOSS1,util.ppn(player,const.PP_BAIFUJISHABOSS1)+1);
				newgui.minimap.refreshKillBossRanking(player,"160");
			elseif mon:get_level()>=180 and mon:get_level()<200 then
				player:set_param(const.PP_BAIFUJISHABOSS2,util.ppn(player,const.PP_BAIFUJISHABOSS2)+1);
				newgui.minimap.refreshKillBossRanking(player,"180");
			elseif mon:get_level()>=200 then
				player:set_param(const.PP_BAIFUJISHABOSS3,util.ppn(player,const.PP_BAIFUJISHABOSS3)+1);
				newgui.minimap.refreshKillBossRanking(player,"200");
			elseif mon:get_level()==150 then
				player:set_param(const.PP_BAIFUJISHABOSS4,util.ppn(player,const.PP_BAIFUJISHABOSS4)+1);
		end
	end
	
	local n = mon:get_name();
	ckmon.triger_mon(player,mon,false);
	--
	if n == "奴玛教主" and util.ppn(player,const.PP_ACHIEVE_KILLNMJZ) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLNMJZ,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀奴玛教主!");
	end
	if n == "猛犸教主" and util.ppn(player,const.PP_ACHIEVE_KILLMMJZ) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLMMJZ,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀猛犸教主!");
	end
	if n == "嗜血毒虫" and util.ppn(player,const.PP_ACHIEVE_KILLXEWG) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLXEWG,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀嗜血毒虫!");
	end
	if n == "魔魂教主" and util.ppn(player,const.PP_ACHIEVE_KILLMHJZ) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLMHJZ,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀魔魂教主!");
	end
	if n == "蛮牛王" and util.ppn(player,const.PP_ACHIEVE_KILLMNW) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLMNW,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀蛮牛王!");
	end
	if n == "妖月金刚" and util.ppn(player,const.PP_ACHIEVE_KILLYYJG) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLYYJG,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀妖月金刚!");
	end
	if n == "妖月血魔" and util.ppn(player,const.PP_ACHIEVE_KILLYYXM) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLYYXM,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀妖月血魔!");
	end
	if n == "奴玛教皇" and util.ppn(player,const.PP_ACHIEVE_KILLNMJH) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLNMJH,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀奴玛教皇!");
	end
	if n == "邪龙神" and util.ppn(player,const.PP_ACHIEVE_KILLXLS) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLXLS,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀邪龙神!");
	end
	if n == "猛犸教皇" and util.ppn(player,const.PP_ACHIEVE_KILLMMJH) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLMMJH,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀猛犸教皇!");
	end
	if n == "牛魔圣君" and util.ppn(player,const.PP_ACHIEVE_KILLNMSJ) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLNMSJ,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀牛魔圣君!");
	end
	if n == "玛雅之神" and util.ppn(player,const.PP_ACHIEVE_KILLMYZS) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLMYZS,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀玛雅之神!");
	end
	if n == "巨灵天魔" and util.ppn(player,const.PP_ACHIEVE_KILLJLTM) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLJLTM,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀巨灵天魔!");
	end
	if n == "混沌魔君" and util.ppn(player,const.PP_ACHIEVE_KILLHDMJ) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLHDMJ,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀混沌魔君!");
	end
	if n == "噬日魔兽" and util.ppn(player,const.PP_ACHIEVE_KILLSRMS) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLSRMS,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀噬日魔兽!");
	end
	if n == "地狱炎魔" and util.ppn(player,const.PP_ACHIEVE_KILLDYYM) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLDYYM,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀地狱炎魔!");
	end
	if n == "落日恶魔" and util.ppn(player,const.PP_ACHIEVE_KILLLREM) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLLREM,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀落日恶魔!");
	end
	if n == "亘古魔王" and util.ppn(player,const.PP_ACHIEVE_KILLGGMW) == 0  then
		player:set_param(const.PP_ACHIEVE_KILLGGMW,10);
		newgui.achieve.fresh_achieve_title(player,3);
		player:alert(11,0,"恭喜您完成目标:成功击杀亘古魔王!");
	end

	--
	if n == "天魔殿统领1" then
	local map=server.find_map("tmda");
		map:map_exe("npc.tmd.onTalkjrgg1");
	end
	if n == "天魔殿统领2" then
	local map=server.find_map("tmdb");
		map:map_exe("npc.tmd.onTalkjrgg2");
	end
	if n == "修罗战士" and server.get_temp_var("smzc") == "1" then
	local map=server.find_map("smzc");
		if player:get_team_name() == "神族阵营" then
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+4);
			server.set_temp_var("szzy",server.get_temp_var("szzy")+4);
			npc.huodong.Recharge_process3(player,0);
			map:map_exe("npc.zhanchang.onTalkjf");
		end
		if player:get_team_name() == "魔族阵营" then
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+4);
			server.set_temp_var("mzzy",server.get_temp_var("mzzy")+4);
			npc.huodong.Recharge_process3(player,0);
			map:map_exe("npc.zhanchang.onTalkjf");
		end
	return;
	end
	if n == "魍魉" and server.get_temp_var("smzc") == "1" then
	local map=server.find_map("smzc");
		if player:get_team_name() == "神族阵营" then
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+50);
			server.set_temp_var("szzy",server.get_temp_var("szzy")+50);
			npc.huodong.Recharge_process3(player,0);
			player:alert(11,0,"成功击杀魍魉,阵营积分+50");
			map:map_exe("npc.zhanchang.onTalkjf");
		end
		if player:get_team_name() == "魔族阵营" then
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+50);
			server.set_temp_var("mzzy",server.get_temp_var("mzzy")+50);
			npc.huodong.Recharge_process3(player,0);
			player:alert(11,0,"成功击杀魍魉,阵营积分+50");
			map:map_exe("npc.zhanchang.onTalkjf");
		end
	return;
	end
	if server.get_temp_var("smzc") == "1" then
	if n == "修罗王1" or  n == "修罗王2" or  n == "修罗王3"  then
	local map=server.find_map("smzc");
		if player:get_team_name() == "神族阵营" then
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+500);
			server.set_temp_var("szzy",server.get_temp_var("szzy")+500);
			npc.huodong.Recharge_process3(player,0);
			server.info(10,0,"神族阵营的勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功击败上古邪神[修罗王],阵营积分+500");
			map:map_exe("npc.zhanchang.onTalkjf");
		end
		if player:get_team_name() == "魔族阵营" then
			player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+500);
			server.set_temp_var("mzzy",server.get_temp_var("mzzy")+500);
			npc.huodong.Recharge_process3(player,0);
			server.info(10,0,"魔族阵营的勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功击败上古邪神[修罗王],阵营积分+500");
			map:map_exe("npc.zhanchang.onTalkjf");
		end
	return;
	end
	end

	----守卫试炼之地
	if n == "地狱战神(第5波)" or n=="花魅妖后(第10波)"  or n=="妖翼领主(第15波)"  or n=="骷髅统领(第20波)"  or n=="深渊领主(第25波)"   or n=="深渊吞天兽(第30波)" then
		server.info(10,0,"[<font color='#FF0000'>"..mon:get_map():get_name().."</font>]的[<font color='#ff0000'>"..mon:get_name().."</font>]被击败!");
		return;
	end
	if util.ppn(player,const.PP_SLLINGZHU1) == 2 then
		if util.ppn(player,const.PP_SLLINGZHU3) <= 0 then
			player:set_param(const.PP_SLLINGZHU1,0);
			player:set_param(const.PP_SLLINGZHU2,0);
			player:set_param(const.PP_SLLINGZHU3,0);
			player:alert(1100,0,"聚灵珠效果已经消散..");
		else
			if tonumber(mon:get_level()) >= tonumber(player:get_level()) or tonumber(mon:get_level()) >= 60 then
				player:set_param(const.PP_SLLINGZHU2,util.ppn(player,const.PP_SLLINGZHU2)+1);
				player:set_param(const.PP_SLLINGZHU3,util.ppn(player,const.PP_SLLINGZHU3)-1);
				if util.ppn(player,const.PP_SLLINGZHU2) >= 3 then
					local e = server.get_exp_mul();
					local lllev = lanling_exp(player);
					if server.get_exp_mul() >= 2 then
						player:add_exp(e*lllev);
						player:alert(1000000,0,"<font color='#ff0000'>聚灵珠爆发,经验+"..(e*lllev).."</font>");
						player:set_param(const.PP_SLLINGZHU2,0);
					else
						player:add_exp(lllev);
						player:alert(1000000,0,"<font color='#ff0000'>聚灵珠爆发,经验+"..lllev.."</font>");
						player:set_param(const.PP_SLLINGZHU2,0);
					end
				end
			end
		end
	end
	if mon:get_level() >= 120 and mon:get_level() <= 149 then
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+1);
			player:alert(110,1,"获得功勋1点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
	end
	if mon:get_level() >= 150 and mon:get_level() <= 159 then
		if util.ppn(player,const.PP_XIUWEI_TODAY) <= 39999 then
			local c = math.random(50,100);
			local d = math.random(5,10);
			player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+c);
			player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+c);
			player:alert(10,1,"成功击败[<font color='#ff0000'>"..mon:get_first_name().."</font>](<font color='#FFAA00'>修为+"..c.."</font>)");
			player:alert(10,0,"当前修为: "..util.ppn(player,const.PP_XINFA_XIUWEI).."点");
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
		else
			local d = math.random(5,10);
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
			if util.ppn(player,const.PP_XIUWEI_TODAY) <= 49999 then
				player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+1000);
				player:alert(100,0,"每日击杀BOSS只可获得40000修为!");
			end
		end
	return;
	end
	if mon:get_level() >= 160 and mon:get_level() <= 169 then
		if util.ppn(player,const.PP_XIUWEI_TODAY) <= 39999 then
			local c = math.random(75,150);
			local d = math.random(7,15);
			player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+c);
			player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+c);
			player:alert(10,1,"成功击败[<font color='#ff0000'>"..mon:get_first_name().."</font>](<font color='#FFAA00'>修为+"..c.."</font>)");
			player:alert(10,0,"当前修为: "..util.ppn(player,const.PP_XINFA_XIUWEI).."点");
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
		else
			local d = math.random(7,15);
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
			if util.ppn(player,const.PP_XIUWEI_TODAY) <= 49999 then
				player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+1000);
				player:alert(100,0,"每日击杀BOSS只可获得40000修为!");
			end
		end
	return;
	end
	if mon:get_level() >= 170 and mon:get_level() <= 180 then
		if util.ppn(player,const.PP_XIUWEI_TODAY) <= 39999 then
			local c = math.random(125,250);
			local d = math.random(15,30);
			player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+c);
			player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+c);
			player:alert(10,1,"成功击败[<font color='#ff0000'>"..mon:get_first_name().."</font>](<font color='#FFAA00'>修为+"..c.."</font>)");
			player:alert(10,0,"当前修为: "..util.ppn(player,const.PP_XINFA_XIUWEI).."点");
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
		else
			local d = math.random(15,30);
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
			if util.ppn(player,const.PP_XIUWEI_TODAY) <= 49999 then
				player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+1000);
				player:alert(100,0,"每日击杀BOSS只可获得40000修为!");
			end
		end
		server.info(10,0,"[<font color='#FF0000'>"..mon:get_map():get_name().."</font>]的[<font color='#ff0000'>"..mon:get_first_name().."</font>]被[<font color='#ff0000'>"..player:get_name().."</font>]击败!");
	return;
	end
	if n == "麒麟圣兽" and player:get_map():get_id() == "qlsd" then
		local result = newgui.zuoqi.mountAddExp(player,100000);
		server.info(10,0,"勇士<font color='#ff0000'>"..player:get_name().."</font>击败麒麟圣殿的["..mon:get_first_name().."](<font color='#FFAA00'>坐骑经验+100000</font>)");
		server.info(10,0,"<font color='#ff0000'>[麒麟圣殿]所有勇士[坐骑经验+50000]</font>");
		server.server_exe("npc.dituyidong.qlsdjl");
		player:alert(10,1,"<font color='#ff0000'>增加坐骑经验[100000]点</font>");
	return;
	end
	if mon:get_level() >= 200 and mon:get_level() <= 500 then
		if util.ppn(player,const.PP_XIUWEI_TODAY) <= 39999 then
			local c = math.random(250,500);
			local d = math.random(40,80);
			player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+c);
			player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+c);
			player:alert(10,1,"成功击败[<font color='#ff0000'>"..mon:get_first_name().."</font>](<font color='#FFAA00'>修为+"..c.."</font>)");
			player:alert(10,0,"当前修为: "..util.ppn(player,const.PP_XINFA_XIUWEI).."点");
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
		else
			local d = math.random(40,80);
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)+d);
			player:alert(110,1,"获得功勋"..d.."点,当前功勋:"..util.ppn(player,const.PP_GONGXUN));
			if util.ppn(player,const.PP_XIUWEI_TODAY) <= 49999 then
				player:set_param(const.PP_XIUWEI_TODAY,util.ppn(player,const.PP_XIUWEI_TODAY)+1000);
				player:alert(100,0,"每日击杀BOSS只可获得40000修为!");
			end
		end
		server.info(10,0,"[<font color='#FF0000'>"..mon:get_map():get_name().."</font>]的[<font color='#ff0000'>"..mon:get_first_name().."</font>]被[<font color='#ff0000'>"..player:get_name().."</font>]击败!");
	return;
	end
end
function onKillGroup(mon,player)		ckmon.triger_mon(player,mon,true);end


function checkCreateGuild(player)
	if player:num_item("奴玛号角",1) >= 1 then
		if player:get_level() >= 45 then
			if player:get_gamemoney() >= 100000 then
				player:sub_gamemoney(100000);
				player:remove_item("奴玛号角",1);
				player:echo("true");
			else
				player:alert(1,1,"建立行会需要缴纳10万金币!")
			end
		else
			player:alert(10,1,"建立行会需要等级达到45级!")
		end
	else
		player:alert(1,1,"对不起,你没有奴玛号角无法建立行会!")
	end
end

function conditionCreateGuild(player)
	player:echo("建立行会需要[奴玛号角]并缴纳10万金币");
end

function onGetItem(player,item_name,item_id)    ckitem.triger_item(player,item_name,item_id);end
function onRemItem(player,item_name,item_id)	ckitem.triger_item(player,item_name,item_id);end


function onEquipItem(player,item_name,item_id)
	if item_name == "九品将兵官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 0 then
			player:echo("佩戴[九品将兵官印]需要官职为[九品将兵都卫]!");
		return;
		end
	end
	if item_name == "八品抚夷官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 1 then
			player:echo("佩戴[八品抚夷官印]需要官职为[八品抚夷护军]!");
		return;
		end
	end
	if item_name == "七品安夷官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 2 then
			player:echo("佩戴[七品安夷官印]需要官职为[七品安夷护军]!");
		return;
		end
	end
	if item_name == "六品讨寇官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 3 then
			player:echo("佩戴[六品讨寇官印]需要官职为[六品讨寇校卫]!");
		return;
		end
	end
	if item_name == "五品平寇官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 4 then
			player:echo("佩戴[五品平寇官印]需要官职为[五品平寇校卫]!");
		return;
		end
	end
	if item_name == "四品破虏官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 5 then
			player:echo("佩戴[四品破虏官印]需要官职为[四品破虏将军]!");
		return;
		end
	end
	if item_name == "三品平虏官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 6 then
			player:echo("佩戴[三品平虏官印]需要官职为[三品平虏将军]!");
		return;
		end
	end
	if item_name == "二品车骑官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 7 then
			player:echo("佩戴[二品车骑官印]需要官职为[二品车骑将军]!");
		return;
		end
	end
	if item_name == "一品骠骑官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 8 then
			player:echo("佩戴[一品骠骑官印]需要官职为[一品骠骑将军]!");
		return;
		end
	end
	if item_name == "三等抚国官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 9 then
			player:echo("佩戴[三等抚国官印]需要官职为[抚国大将军]!");
		return;
		end
	end
	if item_name == "二等镇国官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 10 then
			player:echo("佩戴[二等镇国官印]需要官职为[镇国大将军]!");
		return;
		end
	end
	if item_name == "一等元帅官印" then
		if util.ppn(player,const.PP_GUANZHI) <= 11 then
			player:echo("佩戴[一等元帅官印]需要官职为[兵马大元帅]!");
		return;
		end
	end
	if item_name == "破虏将军靴" then
		if util.ppn(player,const.PP_GUANZHI) <= 5 then
			player:echo("佩戴[破虏将军靴]需要官职为[四品破虏将军]!");
		return;
		end
	end
	if item_name == "平虏将军腰带" then
		if util.ppn(player,const.PP_GUANZHI) <= 6 then
			player:echo("佩戴[平虏将军腰带]需要官职为[三品平虏将军]!");
		return;
		end
	end
	if item_name == "车骑将军头盔" then
		if util.ppn(player,const.PP_GUANZHI) <= 7 then
			player:echo("佩戴[车骑将军头盔]需要官职为[二品车骑将军]!");
		return;
		end
	end
	if item_name == "骠骑将军护腕" then
		if util.ppn(player,const.PP_GUANZHI) <= 8 then
			player:echo("佩戴[骠骑将军护腕]需要官职为[一品骠骑将军]!");
		else
			if player:num_item("骠骑将军护腕",10) >= 1 then
			player:echo("您已经佩戴一件[骠骑将军护腕],佩戴失败!");
			return;
			end
			if player:num_item("镇北玄武王腕",10) >= 1 then
			player:echo("您已经佩戴一枚[镇北玄武王腕],佩戴失败!");
			return;
			end
		return;
		end
	end
	if item_name == "抚国大将军戒" then
		if util.ppn(player,const.PP_GUANZHI) <= 9 then
			player:echo("佩戴[抚国大将军戒]需要官职为[抚国大将军]!");
		else
			if player:num_item("抚国大将军戒",10) >= 1 then
			player:echo("您已经佩戴一枚[抚国大将军戒],佩戴失败!");
			return;
			end
			if player:num_item("镇西白虎王戒",10) >= 1 then
			player:echo("您已经佩戴一枚[镇西白虎王戒],佩戴失败!");
			return;
			end
		return;
		end
	end
	if item_name == "镇国大将军链" then
		if util.ppn(player,const.PP_GUANZHI) <= 10 then
			player:echo("佩戴[镇国大将军链]需要官职为[镇国大将军]!");
		return;
		end
	end
	if item_name == "兵马大元帅盔" then
		if util.ppn(player,const.PP_GUANZHI) <= 11 then
			player:echo("佩戴[兵马大元帅盔]需要官职为[兵马大元帅]!");
		return;
		end
	end
	if item_name == "镇西白虎王戒" then
		if util.ppn(player,const.PP_GUANZHI) <= 13 then
			player:echo("佩戴[镇西白虎王戒]需要官职为[镇西白虎王]!");
		else
			if player:num_item("抚国大将军戒",10) >= 1 then
			player:echo("您已经佩戴一枚[抚国大将军戒],佩戴失败!");
			return;
			end
			if player:num_item("镇西白虎王戒",10) >= 1 then
			player:echo("您已经佩戴一枚[镇西白虎王戒],佩戴失败!");
			return;
			end
		return;
		end
	end
	if item_name == "镇南朱雀王链" then
		if util.ppn(player,const.PP_GUANZHI) <= 14 then
			player:echo("佩戴[镇南朱雀王链]需要官职为[镇南朱雀王]!");
		return;
		end
	end
	if item_name == "镇东青龙王盔" then
		if util.ppn(player,const.PP_GUANZHI) <= 15 then
			player:echo("佩戴[镇东青龙王盔]需要官职为[镇东青龙王]!");
		return;
		end
	end
	if item_name == "镇北玄武王腕" then
		if util.ppn(player,const.PP_GUANZHI) <= 12 then
			player:echo("佩戴[镇北玄武王腕]需要官职为[镇北玄武王]!");
		return;
		else
			if player:num_item("骠骑将军护腕",10) >= 1 then
				player:echo("您已经佩戴一枚[骠骑将军护腕],佩戴失败!");
				return;
			end
			if player:num_item("镇北玄武王腕",10) >= 1 then
				player:echo("您已经佩戴一枚[镇北玄武王腕],佩戴失败!");
				return;
			end
		end
	end
	if item_name == "龙皇戒指·武威" or item_name == "龙皇戒指·烈焰" or item_name == "龙皇戒指·无极" then
		if player:num_item("龙皇戒指·武威",10) >= 1 or player:num_item("龙皇戒指·烈焰",10) >= 1 or player:num_item("龙皇戒指·无极",10) >= 1 then
			player:echo("您已经佩戴一枚龙皇戒指,佩戴失败!");
			return;
		end
	end
	if item_name == "龙皇护腕·武威" or item_name == "龙皇护腕·烈焰" or item_name == "龙皇护腕·无极" then
		if player:num_item("龙皇护腕·武威",10) >= 1 or player:num_item("龙皇护腕·烈焰",10) >= 1 or player:num_item("龙皇护腕·无极",10) >= 1 then
			player:echo("您已经佩戴一枚龙皇护腕,佩戴失败!");
			return;
		end
	end
	if item_name == "诛仙戒指·武威" or item_name == "诛仙戒指·烈焰" or item_name == "诛仙戒指·无极" then
		if player:num_item("诛仙戒指·武威",10) >= 1 or player:num_item("诛仙戒指·烈焰",10) >= 1 or player:num_item("诛仙戒指·无极",10) >= 1 then
			player:echo("您已经佩戴一枚诛仙戒指,佩戴失败!");
			return;
		end
	end
	if item_name == "诛仙护腕·武威" or item_name == "诛仙护腕·烈焰" or item_name == "诛仙护腕·无极" then
		if player:num_item("诛仙护腕·武威",10) >= 1 or player:num_item("诛仙护腕·烈焰",10) >= 1 or player:num_item("诛仙护腕·无极",10) >= 1 then
			player:echo("您已经佩戴一枚诛仙护腕,佩戴失败!");
			return;
		end
	end
end

function undressEquipItem(player,item_name,item_id)
	if item_name == "二品车骑官印" then
		--
	end
	if item_name == "一品骠骑官印" then
		--
	end
end

local f_data={
	["warrior"]={name="svr_warrior_name",num="svr_warrior_number",fh="maxzhan"},
	["wizard"]={name="svr_wizard_name",num="svr_wizard_number",fh="maxfa"},
	["taoist"]={name="svr_taoist_name",num="svr_taoist_number",fh="maxdao"},
}

function onCalculateFight(player,fight,param1,param2,param3)
	local jdata = f_data[player:get_job_name()];
	local pname = player:get_name();
	if pname == server.get_var(jdata.name) then
		server.set_var(jdata.num,fight);
		player:set_name_pro(jdata.fh);
		return;
	end
	if fight > util.svn(jdata.num) then
		local prename = server.get_var(jdata.name);
		local person = server.find_player(prename);
		if person then
			person:set_name_pro("");
		end
		server.set_var(jdata.name,pname);
		server.set_var(jdata.num,fight);
		player:set_name_pro(jdata.fh);
	end
end

function onClientTalk(player,param100)
	if param100 == "HelpXinQuHuoDong" then
		--gm.help2.xqhuodong(player,param100);
		player:set_panel_data("panelHuodong","panelHuodong","panel_visible","true");
		player:push_ckpanel_data("xhuodong","panelHuodong");
	end
	if param100 == "HelpWoYaoShengJI" then
		gm.help.wyexp(player,param100);
	end
	if param100 == "HelpWoYaoZhuangBei" then
		gm.help3.zhuangbei(player,param100);
	end
	if param100 == "HelpRiChangRenWu" then
		gm.help4.mrhuodong(player,param100);
	end
	if param100 == "HelpGenXGogao" then
		gm.help5.gxgonggao(player,param100);
	end
	cktalk.triger_talk(player,param100);
end

function onVipTalk(player,param100)
	if param100=="onTalkVip0" then
		gm.vipinfo.show_vip(player,0);
	end
	if param100=="onTalkVip1" then
		gm.vipinfo.show_vip(player,1);
	end
	if param100=="onTalkVip2" then
		gm.vipinfo.show_vip(player,2);
	end
	if param100=="onTalkVip3" then
		gm.vipinfo.show_vip(player,3);
	end
	if param100=="onTalkVip4" then
		gm.vipinfo.show_vip(player,4);
	end
	if param100=="onTalkVip5" then
		gm.vipinfo.show_vip(player,5);
	end
	if param100=="onTalkVip6" then
		gm.vipinfo.show_vip(player,6);
	end
	if param100=="onTalkVip7" then
		gm.vipinfo.show_vip(player,7);
	end
end

function onRemVcoin(player,rem,srclog,vcoin)
	--if activity.isBaifuSjieOpen() then
		--npc.liguan.player_mrczlj_congzi(player,rem);
	--end
	npc.liguan.player_mrxflj_xiaofei(player,rem);
	if  server_open_day()  >= 15911 then
		if server_start_day() <= 4 then
			player:set_param(const.PP_XQ_XIAOFEI_YB,util.ppn(player,const.PP_XQ_XIAOFEI_YB)+rem);
			if util.ppn(player,const.PP_XQ_XIAOFEI_YB) >= 10000 then
				local int = math.floor(util.ppn(player,const.PP_XQ_XIAOFEI_YB)/10000);
				player:set_param(const.PP_HF_CJ_NUM,util.ppn(player,const.PP_HF_CJ_NUM)+int);
				player:set_param(const.PP_XQ_XIAOFEI_YB,util.ppn(player,const.PP_XQ_XIAOFEI_YB)-int*10000);
				newgui.newfu.freshNewChoujNum(player);
			end
		end
	end
	if is_merge_server() then
		if server_merge_day() <= 4 then
			--newgui.hequ.hfxiaofeipm_Recharge_process(player,rem);
			player:set_param(const.PP_HF_CZYB_TEMP,util.ppn(player,const.PP_HF_CZYB_TEMP)+rem);
			if util.ppn(player,const.PP_HF_CZYB_TEMP) >= 10000 then
				local int = math.floor(util.ppn(player,const.PP_HF_CZYB_TEMP)/10000);
				player:set_param(const.PP_HF_CJ_NUM,util.ppn(player,const.PP_HF_CJ_NUM)+int);
				player:set_param(const.PP_HF_CZYB_TEMP,util.ppn(player,const.PP_HF_CZYB_TEMP)-int*10000);
				--newgui.hequ.freshChoujNum(player);
			end
		end
	end
	--rem 本次消费数额 srclog 记录日志的消费类型 vcoin 是现在有的元宝数
end

function onCongzi(player,add,vcoin,accu)
	if tonumber(server_start_day()) <= 4 then
		player:set_param(const.PP_XQCZFL,util.ppn(player,const.PP_XQCZFL)+math.floor(add * 0.2));
		npc.huodong.Recharge_process2(player,add);
		newgui.newfu.freshFanliPanelInfo(player);
	end
	player:set_param(const.PP_QIANDAO_CZ_TAG,util.ppn(player,const.PP_QIANDAO_CZ_TAG)+add);

	if util.ppn(player,const.PP_CHONGZHIJIFEN_CHONGZHI) <= 0 then
		player:set_param(const.PP_CHONGZHIJIFEN_CHONGZHI,1);
		player:set_param(const.PP_CHONGZHIJIFEN,util.ppn(player,const.PP_CHONGZHIJIFEN_OLD));--将老的积分赋值到新的里面去
	end

	player:set_param(const.PP_CHONGZHIJIFEN,util.ppn(player,const.PP_CHONGZHIJIFEN)+math.floor(add * 0.01));
	player:alert(11,1,"感谢您对我们的支持![充值积分+"..math.floor(add * 0.01).."]");
	player:alert(10,0,"您当前的充值积分:"..util.ppn(player,const.PP_CHONGZHIJIFEN).."点");

	--充值时候检测刷新
	if util.ppn(player,const.PP_CONGZI_DAY) ~= today() then
		player:set_param(const.PP_DAILY_CONGZI,add);
		player:set_param(const.PP_DAILY_GIFT,0);
		player:set_param(const.PP_DAYCZ_NO2,0);
		player:set_param(const.PP_DAYCZ_NO3,0);
		player:set_param(const.PP_DAYCZ_NO4,0);
		player:set_param(const.PP_CONGZI_DAY,today());
		--newgui.daygift.fresh_daygift_info(player);
	else
		player:set_param(const.PP_DAILY_CONGZI,util.ppn(player,const.PP_DAILY_CONGZI)+add);
	end
	--脚本活动期间累计充值
	if activity.isActChongZhiLeiJi() then
		activity.HUODONG_BIAOSHI = activity.isLastActivityOpen()
		if util.ppn(player,const.PP_ACTIVITY_CZFLAG) <= activity.HUODONG_BIAOSHI then
			player:set_param(const.PP_ACTIVITY_CZFLAG,activity.HUODONG_BIAOSHI+3);
			player:set_param(const.PP_ACTIVITY_CHONGZHI,0);
		end
		player:set_param(const.PP_ACTIVITY_CHONGZHI,util.ppn(player,const.PP_ACTIVITY_CHONGZHI)+add);
	end
	--充点小钱充值统计
	player:set_param(const.PP_CONGZHI_TJ,util.ppn(player,const.PP_CONGZHI_TJ)+add);
	newgui.cqaward.check_czaward_panel(player);

	newgui.czaward.fresh_award_info(player);
	
	--理财
	if newgui.financing.isLcczDay() then
		newgui.financing.setlicaicongzhi(player,add);
	end

	npc.renwu.fenghao.tshz(player);
	gm.help2.player_svrmeg_congzi(player,add);

	npc.liguan.player_mzczpm_congzi(player,add);

	if  activity.isBaifuSjieOpen()  then
		if util.ppn(player,const.PP_ACTIVITY_CZHI_CZ) <= 16 then  -- 20140418 fuhuojie
			player:set_param(const.PP_ACTIVITY_CZHI_LJ,0);
			player:set_param(const.PP_ACTIVITY_CZHI_CZ,17);
		end
		npc.liguan.player_mrczlj_congzi(player,add);
		player:set_param(const.PP_ACTIVITY_CZHI_LJ,util.ppn(player,const.PP_ACTIVITY_CZHI_LJ)+add);
	end
	if newgui.jingcaihuodong.isOpenActivity(player,"czjssw") then
      	newgui.jingcaihuodong.setpcon(player,"czjssw",add);
    end
    if newgui.jingcaihuodong.isOpenActivity(player,"czjssj") then
      	newgui.jingcaihuodong.setpcon(player,"czjssj",add);
    end
    if newgui.jingcaihuodong.isOpenActivity(player,"czjssl") then
      	newgui.jingcaihuodong.setpcon(player,"czjssl",add);
    end
    if newgui.jingcaihuodong.isOpenActivity(player,"czjssk") then
      	newgui.jingcaihuodong.setpcon(player,"czjssk",add);
    end
    newgui.svip.cz_fresh_data(player,add);
end


function onTimer1(player) go.timer(player);end

function onTimer2(player)
	if player:get_map():get_id() == "maya1" or player:get_map():get_id() == "maya2" or player:get_map():get_id() == "maya3" then
		player:go_home();
		player:alert(11,1,"时间已到,您被自动传送回安全区!");
	end
end

function onTimer3(player)
	npc.mijing.check_mijing_day(player);
	if util.ppn(player,const.PP_MIJING_NUM) < const.MIJING_MAX_NUM then
		player:set_param(const.PP_MIJING_NUM,util.ppn(player,const.PP_MIJING_NUM)+1);
		player:set_timer(const.PT_MIJING,60*1000);
		if const.MIJING_MAX_NUM - util.ppn(player,const.PP_MIJING_NUM) <= 4 then
			player:alert(11,1,"您的修炼时间还剩:["..const.MIJING_MAX_NUM - util.ppn(player,const.PP_MIJING_NUM)+1 .."]分钟");
		end
	else
		player:go_home();
		player:alert(11,1,"由于您的修炼时间时间不足,已经自动回城!")
	end
end

function onTimer4(player) npc.huodui.DoKao(player);end

function onTimer5(player)
	if player:get_map():get_id() == "smzc" then
		if util.ppn(player,const.PP_SMZCJISHI) <= 1 then 
			if player:get_team_name() == "神族阵营" then
				player:set_param(const.PP_SMZCJISHI,0);
				player:alert(10,0,"恭喜您已经成功复活");
				player:relive(120,"smzc",27,114);
				player:set_status(15,3,10000,1,1);
				return;
			end
			if player:get_team_name() == "魔族阵营" then
				player:set_param(const.PP_SMZCJISHI,0);
				player:alert(10,0,"恭喜您已经成功复活");
				player:relive(120,"smzc",109,30);
				player:set_status(15,3,10000,1,1);
				return;
			end
			player:alert(1,1,"对不起,由于你没有加入阵营,自动复活回城!")
			player:relive(120,"v003",97,100);
		else
			player:set_param(const.PP_SMZCJISHI,util.ppn(player,const.PP_SMZCJISHI)-1);
			player:alert(10,0,util.ppn(player,const.PP_SMZCJISHI).."秒后自动复活到本方阵营");
			player:set_timer(5,1000);
		end
	end
	if player:get_map() and player:get_map():get_id() == "tjzc" then
		if util.ppn(player,const.PP_SMZCJISHI) <= 5 then
			if player:get_team_name() == "红方阵营" then
				player:set_param(const.PP_SMZCJISHI,0);
				player:alert(10,0,"恭喜您已经成功复活");
				player:relive(120,"tjzc",107,29);
				player:set_status(15,3,10000,1,1);
				return;
			end
			if player:get_team_name() == "蓝方阵营" then
				player:set_param(const.PP_SMZCJISHI,0);
				player:alert(10,0,"恭喜您已经成功复活");
				player:relive(120,"tjzc",17,150);
				player:set_status(15,3,10000,1,1);
				return;
			end
			player:alert(1,1,"对不起,由于你没有加入阵营,自动复活回城!")
			player:relive(120,"vtc",73,102);
		else
			player:set_param(const.PP_SMZCJISHI,util.ppn(player,const.PP_SMZCJISHI)-5);
			player:alert(11,0,util.ppn(player,const.PP_SMZCJISHI).."秒后自动复活到本方阵营");
			player:set_timer(5,5000);
		end
	end
	if player:get_map():get_id() == "binghuodao" then
		player:alert(10,0,"恭喜您已经成功复活");
		player:relive(120,"binghuodao",13,141);
	end
end

function onTimer6(player)
	player:go_home();
	if player:is_dead() then
		player:set_timer(5,0);
		player:relive(100);
	return;
	end
end

function onTimer7(player) item.item15023.alee(player);end



function onTimer8(player)
	npc.dituyidong.check_ymsy_day(player);
	if util.ppn(player,const.PP_YMSY) < const.YMSY_MAX_NUM then
		player:set_param(const.PP_YMSY,util.ppn(player,const.PP_YMSY)+1);
		player:set_timer(const.PT_YMSY,60*1000);
		if const.YMSY_MAX_NUM - util.ppn(player,const.PP_YMSY) <= 4 then
			player:alert(11,1,"您的幽冥圣域还剩:["..const.YMSY_MAX_NUM - util.ppn(player,const.PP_YMSY)+1 .."]分钟");
		end
	else
		player:go_home();
		player:alert(11,1,"由于您的幽冥圣域时间不足,已经自动回城!")
	end
end

function onTimer9(player)
	if util.ppn(player,const.PP_TIANMOD) == 1 then
			player:enter_map("tmda",59,43);
			player:alert(1,1,"想要进入天魔宝殿需要首先消灭[天魔殿入口]的[天魔殿统领]");
	end
	if util.ppn(player,const.PP_TIANMOD) == 2 then
			player:enter_map("tmdb",59,43);
			player:alert(1,1,"想要进入天魔宝殿需要首先消灭[天魔殿入口]的[天魔殿统领]");
	end
	if util.ppn(player,const.PP_TIANMOD) == 3 then
			player:enter_map("jsd1",36,161);
			player:alert(1,1,"进入采矿区域需要等级达到40级!");
	end
end
function onTimer10(player) 
	player:set_mount_show_lock(0);
	player:set_mount_info(0,0,0);
	player:set_mount_show(0);
	player:alert(11,1,"<font color='#ff0000'>您的体验坐骑时间已到!</font>");
end
function onTimer11(player)
	player:set_param(const.PP_TEMP_VIP_TIMER,util.ppn(player,const.PP_TEMP_VIP_TIMER)-1);
	if util.ppn(player,const.PP_TEMP_VIP_TIMER) <= 0 then
		player:set_param(const.PP_TEMP_VIP_TIMER,0);
		ckpanel.tempVipOver(player);
	else
		player:set_timer(11,1000);
	end
end


function onTimer12(player)
	if player:get_map():get_id() == "wenquan" then
		local h = os.date("%H%M",os.time());
		if tonumber(h) >= 1200 and tonumber(h) <= 1229 or tonumber(h) >= 1800 and tonumber(h) <= 1829 or server.get_temp_var("wenquan") == "1" then
			player:set_timer(12,1000);
		else
			player:go_home();
			player:alert(1,1,"温泉馆的歇业时间到了,请您下次再来吧!");
		end
	end
end

local forbidmap={"wlzb","smzc","kinghome","zzmt","mtmt"}

function checkForbidmap(mapid)
	for i=1,#forbidmap do
		if string.find(mapid,forbidmap[i]) then
			return true;
		end
	end
	return false;
end



local huichengjuan={"猛犸寺庙","魔魂殿","蛮牛洞","妖月峡谷","巨灵石窟","混沌之门","冰封雪域","地狱熔岩","落日峡谷","神庙废墟"}

function checkHuichengjuan(player)
	for i=1,#huichengjuan do
		if player:get_map():get_name() == huichengjuan[i] then
			if player:num_item("回城卷",1) < 1 and player:num_bag_black() >= 1 then
				player:add_item("回城卷",1);
			end
			break;
		end
	end
	return false;
end

function onTimer13(player)
	checkHuichengjuan(player);
	if checkForbidmap(player:get_map():get_id()) then
		player:go_home();
		player:alert(1,1,"该地址禁止传送!");
	end
end
function checkDirectFly(player)
		if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
			player:alert(100,1,"您是尊贵的VIP玩家,享受了免费传送")
			player:echo("true");
			player:set_timer(13,100);
		return;
		end
		local f = player:get_free_direct_fly()
		if f > 0 then
			player:sub_free_fly(1);
			if f <= 20 then
				player:alert(100,1,"您的免费飞行次数剩余".. f .."次");
			end;
			local r = math.random(1,100);
			if r <= 20 then
				player:alert(110,1,"成为VIP会员可享受无限制免费传送")
			end
			player:echo("true");
			player:set_timer(13,100);
		else
			player:alert(110,1,"您的免费飞行次数已用完")
			player:alert(110,1,"成为VIP可享受无限制免费传送")
		end
end


function onTimer14(player)
	if player:get_map():get_id() == "zssd2" then
		player:enter_map("zssd1",16,75);
		player:alert(1,1,"想要进入[二转神殿]需要先消灭[一转神殿]的[赤焰魔君]");
	end
	if player:get_map():get_id() == "zssd3" then
		player:enter_map("zssd2",9,80);
		player:alert(1,1,"想要进入[三转神殿]需要先消灭[二转神殿]的[鬼斧恶魔]");
	end
	if player:get_map():get_id() == "zssd4" then
		player:enter_map("zssd3",14,98);
		player:alert(1,1,"想要进入[四转神殿]需要先消灭[三转神殿]的[暗夜领主]");
	end
end

function onTimer15(player)
	if(player:num_bag_black()>=1)then
		if(player:num_item("许愿金币")>0)then
			player:remove_item("许愿金币",1);
			player:set_param(const.PP_JF_XUYUANCHI,util.ppn(player,const.PP_JF_XUYUANCHI)+1);
			newgui.xuyuanchi.random_item(player);
			player:set_timer(const.PT_XUYUANCHI,500);
		else
			player:alert(1,1,"您的许愿币不足，快前往商城购买吧 [<font color='#00ff00'>Y键打开商城</font>]");
			player:set_timer(const.PT_XUYUANCHI,0);
			player:set_panel_data("panelxuyuanchi","btnAutoXy","label","自动许愿");
			player:set_temp_param(const.PTP_XUYUANXHI_XIANSHI,0);
			player:push_ckpanel_data("xuyuanchi","panelxuyuanchi");
		end
	else
		player:alert(1,1,"您的背包空格少于一个,自动许愿停止");
		player:set_timer(const.PT_XUYUANCHI,0);
		player:set_panel_data("panelxuyuanchi","btnAutoXy","label","自动许愿");
		player:set_temp_param(const.PTP_XUYUANXHI_XIANSHI,0);
		player:push_ckpanel_data("xuyuanchi","panelxuyuanchi");
	end
end

function onTimer16(player)
	if player:is_dead() then
		player:set_timer(5,0);
		player:relive(100);
	return;
	end
end


function onLoadRobDartNumUsed(player)
	player:load_rob_dart_num_used(util.ppn(player,const.PP_JIEBIAO));
end
function makeRobDartNumUsed_Exp(player,killer)
	if util.ppn(player,const.PP_ZHANCHANG_CHETYPE) > 0 then
		player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
		return;
	end
	task.task3005.check_yabiao_day(killer);
	killer:set_param(const.PP_JIEBIAO,util.ppn(killer,const.PP_JIEBIAO)+1);

	
	
	local dartname = "青铜镖车";
	if util.ppn(player,const.PP_YABIAO_TYPE) == 3 then
		dartname = "黄金镖车";
	end
	if util.ppn(player,const.PP_YABIAO_TYPE) == 4 then
		dartname = "蓝玉镖车"; 
	end
	if util.ppn(player,const.PP_YABIAO_TYPE) == 5 then
		dartname = "紫金镖车";
	end
	local e = task.task3005.get_yabiao_exp(player,killer);
	if util.ppn(killer,const.PP_JIEBIAO) <= const.JIEBIAO_MAX_NUM then	
		killer:add_exp(math.floor(e*0.4));
		killer:alert(11,0,"你劫取了"..player:get_name().."的"..dartname..",获得经验"..math.floor(e*0.4));
		
		server.info(100,0,"[<font color='#ff0000'>"..killer:get_name().."</font>]劫取了[<font color='#ff0000'>"..player:get_name().."</font>]的[<font color='#ff0000'>"..dartname.."</font>]");
	else
		killer:alert(11,0,"你劫取了"..player:get_name().."的"..dartname..",劫镖次数用完,不能再获得经验了.");
		
		server.info(100,0,"[<font color='#ff0000'>"..killer:get_name().."</font>]劫取了[<font color='#ff0000'>"..player:get_name().."</font>]的[<font color='#ff0000'>"..dartname.."</font>]");
	end

	player:add_exp(math.floor(e*0.6));
	player:set_task_state(3005,task.util.ts(1,const.TSUNAC));
	if  util.ppn(player,const.PP_YABIAO_NUM) < const.YABIAO_MAX_NUM then
		player:set_task_state(3005,task.util.ts(1,const.TSACCE));
	end
	player:push_task_data(3005,0);
	player:alert(11,0,"您的镖车已被劫,获得经验"..(math.floor(e*0.6)));

end
function lanling_exp(player)
	local a = math.random(15,20)
	if player:get_level() >= 80 then
		return math.ceil(80*634-server.get_prosperity()*a);
	else
		return math.ceil(player:get_level()*634-server.get_prosperity()*a);
	end
end
function fuyuanCheck(player,cdTime,nowTime,pres,prob)
	--prob 做兼容 一般游戏不限于几率
	if prob <= 0 then
		if nowTime>=util.ppn(player,const.PT_FUYUAN) then
			player:set_param(const.PT_FUYUAN,nowTime+cdTime);
			player:alert(10,0,"<font color='#ff0000'>复活生效,恢复生命"..(pres/100).."%,复活间隔"..cdTime.."秒</font>");
			return 1;
		else
			player:alert(10,0,"<font color='#ff0000'>复活失效!复活间隔还剩"..(util.ppn(player,const.PT_FUYUAN)-nowTime).."秒</font>");
			return 0;
		end
	else
		if nowTime>=util.ppn(player,const.PT_FUYUAN) then
			local rt = math.random(1,10000);
			if rt <= prob then
				player:set_param(const.PT_FUYUAN,nowTime+cdTime);
				player:alert(10,0,"<font color='#ff0000'>复活生效,恢复生命"..(pres/100).."%,复活间隔"..cdTime.."秒</font>");
				return 1;
--			else
--				player:alert(10,0,"<font color='#ff0000'>复活失效!");
			end
			
		else
			player:alert(10,0,"<font color='#ff0000'>复活失效!复活间隔还剩"..(util.ppn(player,const.PT_FUYUAN)-nowTime).."秒</font>");
			return 0;
		end
	end
end

function onEquipUpgradeSuc(player,tolevel,itemid,sucprob)
	--[[if util.ppn(player,const.PP_BAOSHI_LINGQU_CHONGZHI) <= 4 then
		player:set_param(const.PP_BAOSHI_LINGQU_CHONGZHI,5);   --20140401 4月初
		player:set_param(const.PP_BSQIANGHUA7JI,0);
		player:set_param(const.PP_BSQIANGHUA8JI,0);
		player:set_param(const.PP_BSQIANGHUA9JI,0);
		player:set_param(const.PP_BSQIANGHUA10JI,0);
		player:set_param(const.PP_BSQIANGHUA11JI,0);
		player:set_param(const.PP_BSQIANGHUA12JI,0);
	end
	local name,ac,acmax,mac,macmax,dc,dcmax,mc,mcmax,sc,scmax,acc,dodge,needtype,needparam=player:get_item_base_data(itemid);
	if activity.isBaifuSjieOpen() then
		if tolevel == 7 then
			player:set_param(const.PP_BSQIANGHUA7JI,util.ppn(player,const.PP_BSQIANGHUA7JI)+1);
		return;
		end
		if tolevel == 8 then
			player:set_param(const.PP_BSQIANGHUA8JI,util.ppn(player,const.PP_BSQIANGHUA8JI)+1);
		return;
		end
		if tolevel == 9 then
			player:set_param(const.PP_BSQIANGHUA9JI,util.ppn(player,const.PP_BSQIANGHUA9JI)+1);
		return;
		end
		if tolevel == 10 then
			player:set_param(const.PP_BSQIANGHUA10JI,util.ppn(player,const.PP_BSQIANGHUA10JI)+1);
		return;
		end
		if tolevel == 11 then
			player:set_param(const.PP_BSQIANGHUA11JI,util.ppn(player,const.PP_BSQIANGHUA11JI)+1);
		return;
		end
		if tolevel == 12 then
			player:set_param(const.PP_BSQIANGHUA12JI,util.ppn(player,const.PP_BSQIANGHUA12JI)+1);
		return;
		end
	end]]
	--player:alert(11,0,"恭喜玩家"..player:get_name().."成功将"..name.."以"..sucprob.."%的几率强化到"..tolevel.."级");
	if tolevel >= 7 and tolevel <= 12 then
		if activity.isXiaRiOpen() then
			newgui.minimap.SetZBQHParam(player, "XiaRi", tolevel)
		end
		if newgui.jingcaihuodong.isOpenActivity(player,"zbqhfs") then
	      	newgui.jingcaihuodong.setawardpcon(player,"zbqhfs",tolevel);
	    end
	end
end

function onTalkxmtianmo(player) if npc.dituyidong then npc.dituyidong.onTalkxmtianmo2(player) end end
function onTalkqwcjwlzb(player) if npc.dituyidong then npc.dituyidong.onTalkqwcjwlzb2(player) end end
function onTalkqwkingcity(player) if npc.dituyidong then npc.dituyidong.onTalkqwkingcity2(player) end end

function checkMergeSteelRand()
	--[[if activity.isBaifuSjieOpen() then
		server.set_merge_mul(20);
	else
		server.set_merge_mul(0);
	end]]
	if newgui.jingcaihuodong.isOpenActivity(nil,"bshcsd") then
		server.set_merge_mul(20);
	else
		server.set_merge_mul(0);
	end
end

function onMergeSteelRand(player,rd,param1,param2,param3)
	--[[if activity.isBaifuSjieOpen() then
		rd = rd +20;
	end
	return rd;]]
end



local raid_data={
	[1]={
		mon={"远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)",
		"远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)","远古狮妖(第1波)"}
	},
	[2]={
		mon={"蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)",
		"蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)","蛮荒野人(第2波)"}
	},
	[3]={
		mon={"獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)",
		"獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)","獠牙猪妖(第3波)"}
	},
	[4]={
		mon={"不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)"
		,"不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)","不腐尸(第4波)"}
	},
	[5]={
		mon={"地狱战神(第5波)"}
	},
	[6]={
		mon={"游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)",
		"游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)","游尸(第6波)"}
	},
	[7]={
		mon={"不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)"
		,"不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)","不灭尸(第7波)"}
	},
	[8]={
		mon={"诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)"
		,"诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)","诺玛战士(第8波)"}
	},
	[9]={
		mon={"诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)"
		,"诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)","诺玛勇士(第9波)"}
	},
	[10]={
		mon={"花魅妖后(第10波)"}
	},
	[11]={
		mon={"蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)"
		,"蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)","蛮牛侍卫(第11波)"}
	},
	[12]={
		mon={"蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)"
		,"蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)","蛮牛祭司(第12波)"}
	},
	[13]={
		mon={"红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)"
		,"红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)","红猪妖(第13波)"}
	},
	[14]={
		mon={"黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)"
		,"黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)","黑猪妖(第14波)"}
	},
	[15]={
		mon={"妖翼领主(第15波)"}
	},
	[16]={
		mon={"猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)"
		,"猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)","猛犸护卫(第16波)"}
	},
	[17]={
		mon={"猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)"
		,"猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)","猛犸雕像(第17波)"}
	},
	[18]={
		mon={"蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)"
		,"蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)","蛮牛战士(第18波)"}
	},
	[19]={
		mon={"蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)"
		,"蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)","蛮牛弓箭(第19波)"}
	},
	[20]={
		mon={"骷髅统领(第20波)"}
	},
	[21]={
		mon={"魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)"
		,"魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)","魔眼蜘蛛(第21波)"}
	},
	[22]={
		mon={"钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)"
		,"钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)","钢刺蜘蛛(第22波)"}
	},
	[23]={
		mon={"人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)"
		,"人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)","人马战士(第23波)"}
	},
	[24]={
		mon={"人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)"
		,"人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)","人马守卫(第24波)"}
	},
	[25]={
		mon={"深渊领主(第25波)"}
	},
	[26]={
		mon={"混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)"
		,"混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)","混沌斗士(第26波)"}
	},
	[27]={
		mon={"混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)"
		,"混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)","混沌祭司(第27波)"}
	},
	[28]={
		mon={"邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)"
		,"邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)","邪恶僧人(第28波)"}
	},
	[29]={
		mon={"邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)"
		,"邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)","邪恶蛇蝎(第29波)"}
	},
	[30]={
		mon={"深渊吞天兽(第30波)"}
	},
};

--Remark:离开封魔岭地图时 将全局变量 i j 置为1
function ijclear(player)
	player:set_param(const.PP_FENGMOLING_I,1);
	player:set_param(const.PP_FENGMOLING_J,1);
	player:set_timer(17,0);
	player:set_timer(18,0);
	player:set_temp_param(const.PTP_FENGMO_MON_NUMBER,0);
end
------

function onTimer17(player)
	local i = math.max(1,util.ppn(player,const.PP_FENGMOLING_I));
	local j = math.max(1,util.ppn(player,const.PP_FENGMOLING_J));
	local map = player:get_map();
	local mid = map:get_id()
	if string.find(mid,"fengml") then
		local r = math.random(1,100);
		local t = 500;
		local td = raid_data[i];
		if td then
			local rname = td.mon[j];
			map:mon_gen(5,32,rname,1,0,1,1,"road(1)");
			player:set_temp_param(const.PTP_FENGMO_MON_NUMBER,util.ptpn(player,const.PTP_FENGMO_MON_NUMBER)+1);
			if j==1 then 
				player:alert(11,0,"<font color='#00FF00'>第"..i.."波怪物来袭！！");
				player:set_panel_data("panelleft","leftcount","act1",45);
				player:push_ckpanel_data("left","panelleft");
				player:set_panel_data("panelmonster","txtbo","visible","true");
				player:set_panel_data("panelmonster","txtbo","text","当前第"..i.."波");
				player:push_ckpanel_data("monster","panelmonster");
			end
			player:set_param(const.PP_FENGMOLING_J,math.max(1,util.ppn(player,const.PP_FENGMOLING_J))+1);
			if math.max(1,util.ppn(player,const.PP_FENGMOLING_J)) > #(td.mon) then
				player:set_param(const.PP_FENGMOLING_I,math.max(1,util.ppn(player,const.PP_FENGMOLING_I))+1);
				if math.max(1,util.ppn(player,const.PP_FENGMOLING_I)) > #(raid_data) then
					player:set_temp_param(const.PTP_FENGMO_MON_NUMBER,0);
					player:set_timer(17,0);
					player:set_param(const.PP_FENGMOLING_I,1);
					player:set_param(const.PP_FENGMOLING_J,1);
					player:set_panel_data("panelleft","leftcount","act1",-1);
					player:push_ckpanel_data("left","panelleft");
				else
					player:set_timer(17,25000);--25s后刷新下一波
					--player:set_panel_data("panelleft","leftcount","act1",25);
					--player:push_ckpanel_data("left","panelleft");
				end
				player:set_param(const.PP_FENGMOLING_J,1);
			else
				player:set_timer(17,t);
			end
		end
	else
		player:set_timer(17,0);
		player:set_temp_param(const.PTP_FENGMO_MON_NUMBER,0);
		player:set_param(const.PP_FENGMOLING_I,1);
		player:set_param(const.PP_FENGMOLING_J,1);
	end

end

function onTimer18(player)
		local map = player:get_map();
		local mid = map:get_id()
		if string.find(mid,"fengml") then
			if map:num_tuteng("试炼图腾") == 0 then
				player:add_exp(util.ppn(player,const.PP_FMKILL_EXP));--领取经验
				player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+util.ppn(player,const.PP_FENGMOLING_YUSHINUM));--领取玉石
				checkhighestyushi(player);
				player:alert(11,0,"获得玉石"..util.ppn(player,const.PP_FENGMOLING_YUSHINUM)..",获得经验"..util.ppn(player,const.PP_FMKILL_EXP).."");
				player:alert(1,1,"图腾死亡，未能守卫成功");
				player:go_home();
				return;
			end
			local tuteng = map:get_tuteng();
			if tuteng then
				local hp = tuteng:get_hp();
				--if maxhp == nil then
					--maxhp = hp;
				--elseif maxhp > 0 then
					player:set_panel_data("panelmonster","panelmonster","panel_visible","true");
					player:set_panel_data("panelmonster","progress","action",(hp/150000).."_1");
					player:set_panel_data("panelmonster","progress","label",hp.."/150000");
					player:push_ckpanel_data("monster","panelmonster");
				--end
				player:set_task_param(const.TASK_ID_FUBEN_FENGML,5,hp);
				player:push_task_data(2006,0);
			end
			player:set_timer(18,500);
		end	
end

function onTimer19(player)	
	newgui.duobao.randombom(player);
	player:set_param(const.PP_DUOBAO_YIJIAN,0);
end

function onTimer20(player)
	player:set_param(const.PP_SMZCJIFEN,util.ppn(player,const.PP_SMZCJIFEN)+3);
	if player:get_team_name() == "红方阵营" then
		server.set_temp_var("szzy",server.get_temp_var("szzy")+3);
	end
	if player:get_team_name() == "蓝方阵营" then
		server.set_temp_var("mzzy",server.get_temp_var("mzzy")+3);
	end
	npc.tjkuang.Recharge_process3(player,0);
	player:set_timer(20,10000);
end

function onTimer21(player)
	local second = os.time() - util.svn("server_tj_timer");
	local minute = math.ceil(second/60);
	local s = minute*60-second;
	local timestring = ""..(20-minute).."分"..s.."秒";
	--player:black_board(0,"","<br><font color='#FF7700'>剩余时间</font>: <font color='#FFf00'>"..timestring.."</font><br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpmd1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
	player:set_panel_data("paneltimer","paneltimer","panel_visible","true");
	player:set_panel_data("paneltimer","tpoint","htmlText",timestring);
	player:set_panel_data("paneltimer","rpoint","htmlText",""..server.get_temp_var("szzy").."分");
	player:set_panel_data("paneltimer","bpoint","htmlText",""..server.get_temp_var("mzzy").."分");
	local rrf = "false";local bbf = "false";
	if util.stvn("szzy") ~= util.stvn("mzzy") then
		if util.stvn("szzy") > util.stvn("mzzy") then
			rrf = "true";
		else
			bbf = "true";
		end
	end
	player:set_panel_data("paneltimer","rflag","visible",rrf);
	player:set_panel_data("paneltimer","bflag","visible",bbf);
	player:set_panel_data("paneltimer","fpoint","htmlText",server.get_var("smzcpmd1"));
	player:set_panel_data("paneltimer","mpoint","htmlText",""..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)");
	player:push_ckpanel_data("timer","paneltimer");
	if minute > 20 or (minute == 20 and s <= 0) then
		player:set_timer(21,0);
		autorun.tjzcgb();
	else
		player:set_timer(21,1000);
	end
end

function onTimer22(player)
	local second = os.time() - util.svn("server_ld_timer");
	local minute = math.ceil(second/60);
	local s = minute*60-second;
	local timestring = ""..(60-minute).."分"..s.."秒";
	
	local timestring2 = "00:00";
	if util.svn("ownertime") > 0 then
		local second2 = os.time() - util.svn("ownertime");
		local minute2 = math.floor(second2/60);
		local s2 = second2-minute2*60;
		timestring2 = ""..minute2.."分"..s2.."秒";

		if minute2 >= 30 then
			player:set_timer(22,0);
			newgui.lingdi.closeLingDI();return;
		end
	end

	local curguild = server.get_var("curldowner");
	if curguild == "" then
		curguild = "尚无占领行会";
	end
	player:set_panel_data("panelldtime","panelldtime","panel_visible","true");
	player:set_panel_data("panelldtime","tpoint","htmlText",timestring);
	player:set_panel_data("panelldtime","rpoint","htmlText",curguild);
	player:set_panel_data("panelldtime","bpoint","htmlText",timestring2);
	
	player:push_ckpanel_data("ldtime","panelldtime");

	if minute > 60 or (minute == 60 and s <= 0) then
		player:set_timer(22,0);
		newgui.lingdi.closeLingDI();return;
	else
		player:set_timer(22,1000);
	end
end

function onTimer23(player)
	if server.get_kuafu_state() == 0 then player:set_timer(23,0); return; end
	local totalsj = 60;
	if util.stvn("kuafuzhan") == 1 then
		local setsj = util.stvn("kuafuzhansj");
		if setsj > 0 then
			totalsj = setsj;
		end
	end
	local second = os.time() - util.svn("server_kuafu_timer");
	local minute = math.ceil(second/60);
	local s = minute*60-second;
	local timestring = ""..(totalsj-minute).."分"..s.."秒";

	if minute > totalsj then
		player:set_timer(23,0);
		autorun.kuafustop();
		return;
	end
	
	local timestring2 = "00:00";
	if util.svn("kuafuownertime") > 0 then
		local second2 = os.time() - util.svn("kuafuownertime");
		local minute2 = math.floor(second2/60);
		local s2 = second2-minute2*60;
		timestring2 = ""..minute2.."分"..s2.."秒";

		-- if minute2 >= 30 then
		-- 	player:set_timer(23,0);
		-- 	autorun.kuafustop();
		-- 	return;
		-- end
	end

	local curguild = server.get_var("kuafuowner");
	if curguild == "" then
		curguild = "尚无占领行会";
	end
	player:set_panel_data("panelkuafutime","panelkuafutime","panel_visible","true");
	player:set_panel_data("panelkuafutime","tpoint","htmlText",timestring);
	player:set_panel_data("panelkuafutime","rpoint","htmlText",curguild);
	player:set_panel_data("panelkuafutime","bpoint","htmlText",timestring2);
	
	player:push_ckpanel_data("kuafutime","panelkuafutime");

	player:set_timer(23,1000);
end

function checkhighestyushi(player)
	if util.ppn(player,const.PP_FENGMOLING_YUSHINUM) > util.ppn(player,const.PP_FENGMOLING_YUSHINUM_HIGHEST) then
		player:set_param(const.PP_FENGMOLING_YUSHINUM_HIGHEST,util.ppn(player,const.PP_FENGMOLING_YUSHINUM));
	end  
	if util.ppn(player,const.PP_FMKILL_EXP) > util.ppn(player,const.PP_FMKILL_EXP_HIGHEST) then
		player:set_param(const.PP_FMKILL_EXP_HIGHEST,util.ppn(player,const.PP_FMKILL_EXP));
	end
end

function onGuildEnter(player)
	player:set_param(const.PP_GUILD_ENTER_DAY,today());
end
function tianshu(player,skillid,oldid,num)
	--newgui.skilltx.setinformation(player,100,skillid);
	player:add_skill(skillid,num);
	--newgui.skilltx.txaction(player);
	player:alert(1,1,"成功领悟天书带给您的新技能:<font color='#ff0000'>"..num.."级灵魂力量</font>");
end