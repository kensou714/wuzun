module(..., package.seeall)
local ACTIONSET_NAME="minimap";
local PANEL_ACTIONSET_NAME="panelminimap";

function process_minimap(player,actionset,panelid,actionid,data)
	if actionid == "btnvcoin" then
		player:open_panel(122);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_minimap);

-------------------------------------------------------------------------------------------

local MINI_FUNCTION="minimapfun";
local PANEL_MINI_FUNCTION="panelminimapfun";

function process_minimapfun(player,actionset,panelid,actionid,data)
	if actionid == "btnCompensate" then
		player:script_exe_code("newgui.minimap.onTalkcompensate");
		return;
	end
	if actionid == "btnDuanWu" then
		player:script_exe_code("newgui.minimap.onTalkduanwujie");
		return;
	end
	if actionid == "btnJinJie" then
		player:script_exe_code("newgui.minimap.onTalkjinjieshi");
		return;
	end
	if actionid == "btnTeJie" then
		player:script_exe_code("newgui.minimap.onTalktejiety");
		return;
	end
	if actionid == "btnMonthPt" then
		player:script_exe_code("newgui.minimap.onTalkmonthPt");
		return;
	end
	if actionid =="btnLottery" then
		player:script_exe_code("lottery.fresh_lottery_info");
		return;
	end
	if actionid == "btnlyzhuanpan" then
		player:set_panel_data("panellingyuzhuanpan","panellingyuzhuanpan","panel_visible","true");
		player:push_ckpanel_data("lingyuzhuanpan","panellingyuzhuanpan");
	end
	if actionid =="btnsevenDay" then
		judgebutton(player);
		return;
	end
	if actionid == "btnRose" then
		player:script_exe_code("newgui.minimap.onTalkRoseDay");
		return;
	end
	if actionid =="btnNewhefu" then
		newhefubutton(player);
		return;
	end
	if actionid =="btnDayGift" then
		player:set_panel_data("panellongactivity","panellongactivity","panel_visible","true");
		player:set_panel_data("panellongactivity","longactivitylist","selected","2");
		--player:push_ckpanel_data("longactivity","panellongactivity");
		newgui.jingcaihuodong.jingcaihuodong(player);
		return;
	end

	if actionid =="btnlingdi" then
		player:script_exe_code("newgui.lingdi.onTalklingdi");
		return;
	end

	if actionid == "btnMrfl" then
		newgui.mrfl.freshinfo(player);
		return;
	end
	if actionid == "btn37BaiFu" then
		player:script_exe_code("newgui.minimap.onTalkMay37BaiFu");
		return;
	end
	if actionid == "btnChinaJoy" then
		player:script_exe_code("newgui.minimap.onTalkChinaJoy");
		return;
	end
	if actionid == "btnmrt" then
		player:script_exe_code("newgui.minimap.onTalkMrt");
		return;
	end
	if actionid == "btnXiaRi" then
		player:script_exe_code("newgui.minimap.onTalkXiaRi");
		return;
	end
	if actionid == "btnDay14th" then
		player:script_exe_code("newgui.minimap.onTalkDay14th");
		return;
	end
	if actionid == "btnNewYear" then
		player:script_exe_code("newgui.minimap.onTalkNewYear");
		return;
	end
	if actionid == "btnXiaZhi" then
		player:script_exe_code("newgui.minimap.onTalkXiaZhi");
		return;
	end
	if actionid == "btnShuJia" then
		player:script_exe_code("newgui.minimap.onTalkShuJia");
		return;
	end
	if actionid == "btnMoZuBaoKu" then
		player:script_exe_code("newgui.minimap.onTalkMoZuBaoKu");
		return;
	end
	if actionid == "btnHuiguiLibao" then
		onTalkHuiguiLibao(player);
		return;
	end
	if actionid == "btnCqaward" then
		newgui.cqaward.check_czaward_panel(player);
		return;
	end
	if actionid=="btndragonmb" then
		player:set_panel_data("paneldragonmb","paneldragonmb","panel_visible","true");
		newgui.dragonmb.pushlisttoclient(player);
		newgui.dragonmb.freshDragonPanel(player);
		player:push_ckpanel_data("dragonmb","paneldragonmb");
		return;
	end
	if actionid == "btnduobao" then
		if util.svn("duobaoqbrank")<= activity.HUODONG_BIAOSHI then
			server.set_var("duobaoqbrank",activity.HUODONG_BIAOSHI+3);
			newgui.duobao.randombom(player);
			for i = 1,61 do
				server.set_var("dbqbpma"..i,0);
				server.set_var("dbqbpmb"..i,0);
				server.set_var("dbqbpmc"..i,0);
			end
		end

		--每次夺宝奇兵上线，这段逻辑中PP_DUOBAO_TOTAL_CHONGZHI要修改+1
		if util.ppn(player,const.PP_DUOBAO_TOTAL_CHONGZHI) <= 3 then
			player:set_param(const.PP_DUOBAO_PAIHANGLQ,0);
			player:set_param(const.PP_DUOBAO_TOTAL,0);
			player:set_param(const.PP_DUOBAO_TOTAL_CHONGZHI,4);
		end
		
		if util.ppn(player,const.PP_DUOBAO_FIRST) == 0 then
			player:set_param(const.PP_DUOBAO_FIRST,1);
			newgui.duobao.randombom(player);
		end
		newgui.duobao.freshALLitem(player);
		newgui.duobao.showupitem(player);
		newgui.duobao.freshShenYu(player);
		player:set_param(const.PP_DUOBAO_YIJIAN,0);
		player:set_panel_data("panelduobao","panelduobao","panel_visible","true");
		player:push_ckpanel_data("duobao","panelduobao");
		player:set_panel_data("panelminimapfun","duobaoswf","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);
		return;
	end
	if actionid=="btnfanlishengdian" then
		--newgui.fanlishengdian.resetFanLiShengDian(player);
		--newgui.fanlishengdian.freshfanlishengdian(player);
		--player:set_panel_data("panelfanlishengdian","panelfanlishengdian","panel_visible","true");
		--player:push_ckpanel_data("fanlishengdian","panelfanlishengdian");	
		newgui.newfanlishengdian.resetFanLiShengDian(player);
		newgui.newfanlishengdian.freshfanlishengdian(player);
		player:set_panel_data("panelnewfanlishengdian","panelnewfanlishengdian","panel_visible","true");
		player:push_ckpanel_data("newfanlishengdian","panelnewfanlishengdian");	
		player:set_panel_data("panelminimapfun","flsdswf","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);	
		return;
	end
	if actionid=="btnsuperCannon" then
		player:set_panel_data("panelcannon","panelcannon","panel_visible","true");
		player:push_ckpanel_data("cannon","panelcannon");	
		player:set_panel_data("panelminimapfun","superCannonswf","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);	
		return;
	end
	if actionid=="btnLD" then	
		newgui.lingdi.freshLingDiDate(player);
		player:set_panel_data("panellingdi","panellingdi","panel_visible","true");
		player:push_ckpanel_data("lingdi","panellingdi");		
		return;
	end

	if actionid=="btnHuoYue" then	
		--player:set_param(const.PP_HUOYUEDU_JIFEN,300);
		newgui.huoyuedu.JudgeKingWar(player);
		newgui.huoyuedu.fresh_huoyuedu(player);
		player:set_panel_data("panelhuoyue","panelhuoyue","panel_visible","true");
		player:push_ckpanel_data("huoyue","panelhuoyue");		
		return;
	end

	if actionid=="btnTouZi" then
		local type=util.ppn(player,const.PP_TOUZI_TYPE);
		newgui.touzi.JudgeLQbtn(player,type);
		player:set_panel_data("paneltouzi","paneltouzi","panel_visible","true");
		player:push_ckpanel_data("touzi","paneltouzi");	
		player:set_panel_data("panelminimapfun","touziswf","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);	
		return;
	end

	if actionid=="btnsuimojuhui" then
		newgui.suimojuhui.freshSMyuanbao(player);
		player:set_panel_data("panelsuimojuhui","panelsuimojuhui","panel_visible","true");
		player:push_ckpanel_data("suimojuhui","panelsuimojuhui");	
		player:set_panel_data("panelminimapfun","effDuanWu","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);	
		return;
	end

	if actionid=="btnchunjiejuhui" then
		newgui.chunjiejuhui.freshCJJHyuanbao(player);
		player:set_panel_data("panelchunjiejuhui","panelchunjiejuhui","panel_visible","true");
		player:push_ckpanel_data("chunjiejuhui","panelchunjiejuhui");	
		player:set_panel_data("panelminimapfun","effDuanWu","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);	
		return;
	end

	if actionid=="btnchuzhifudai" then
		player:set_panel_data("panelchuzhifudai","panelchuzhifudai","panel_visible","true");
		player:push_ckpanel_data("chuzhifudai","panelchuzhifudai");	
		player:set_panel_data("panelminimapfun","chuzhiswf","visible","false");
		player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);	
		return;
	end
end
ckpanel.add_listener(MINI_FUNCTION,process_minimapfun);

--------------------------------------------------------------------------------------------------------
local tHuiKuiLB = {	
					XiaRi = {szTitle = "夏日超值回馈礼包", nLevel = 50, start = "更新后", over = "6月11日", szAcceptFunc = "XiaRi11", szMainFunc = "XiaRi", awardpcon = const.PP_XIARI_HUIKUILB}, 
					ShuJia = {szTitle = "暑假回馈豪华礼包", nLevel = 50, start = "更新后", over = "7月12日", szAcceptFunc = "ShuJia11", szMainFunc = "ShuJia",}, 
					ChinaJoy = {szTitle = "月初回馈豪华礼包", nLevel = 50, start = "更新后", over = "9月7日", szAcceptFunc = "ChinaJoy11", szMainFunc = "ChinaJoy",}, 
					XiaZhi = {szTitle = "中秋回馈豪华礼包", nLevel = 50, start = "更新后", over = "9月14日", szAcceptFunc = "XiaZhi11", szMainFunc = "XiaZhi", awardpcon = const.PP_XIAZHI_HUIKUILB}, 
					Day14th = {szTitle = "白色情人节回馈豪华礼包", nLevel = 50, start = "更新后", over = "3月18日", szAcceptFunc = "Day14th11", szMainFunc = "Day14th", awardpcon = const.PP_KISSDAY_HUIKUILB},
					NewYear = {szTitle = "春分回馈豪华礼包", nLevel = 50, start = "更新后", over = "3月25日", szAcceptFunc = "NewYear11", szMainFunc = "NewYear", awardpcon = const.PP_KISSDAY_HUIKUILB},
					May37BaiFu = {szTitle = "百服回馈豪华礼包", nLevel = 50, start = "更新后", over = "8月23日", szAcceptFunc = "May37BaiFu11", szMainFunc = "May37BaiFu", awardpcon = const.PP_37BAIFU_HUIKUILB1},
					MoZuBaoKu = {szTitle = "荣耀回馈豪华礼包", nLevel = 50, start = "更新后", over = "8月31日", szAcceptFunc = "MoZuBaoKu11", szMainFunc = "MoZuBaoKu",}, 
				}

local tHuiKuiLBAward = {common = {nBagBlack = 5, tAward = {	{name = "绑定元宝", num = 2000}, {name = "绑定金币", num = 500000},
															{name = "四倍宝典", num = 1}, {name = "聚灵珠", num = 1}, 
															{name = "魂石令牌(500)", num = 1}, {name = "坐骑经验丹(大)", num = 1}, 
															{name = "荣誉令牌(10000)", num = 1},
														},
								},  	--通用奖励，奖励变更需要新建列表
						Day14th = {nBagBlack = 5, tAward = {{name = "绑定元宝", num = 2000}, {name = "绑定金币", num = 500000},
															{name = "四倍宝典", num = 1}, {name = "聚灵珠", num = 1}, 
															{name = "兽灵精华(500)", num = 1}, {name = "灵气珠(500)", num = 1}, 
															{name = "天蚕精华", num = 1},
														},
								},  	--通用奖励，奖励变更需要新建列表
						NewYear = {nBagBlack = 5, tAward = {{name = "绑定元宝", num = 4000}, {name = "绑定金币", num = 1000000},
															{name = "四倍宝典", num = 2}, {name = "聚灵珠", num = 2}, 
															{name = "兽灵精华(500)", num = 2}, {name = "灵气珠(500)", num = 2}, 
															{name = "天蚕精华", num = 1},
														},
						}, 
					}

function EchoHuiKuiLB(player, szActivity, szLBName)		--通用回馈礼包对话模板
	local szText = ""
	for k,v in pairs(tHuiKuiLBAward[szLBName].tAward) do 
		szText = szText.."##"..v.name.."##   *"..v.num.."\n\n"
	end
	player:echo([[            <font color = "#FFFF00">]]..tHuiKuiLB[szActivity].szTitle..[[</font>
----------------------------------------
活动对象：<font color="#FFFF00">所有]]..tHuiKuiLB[szActivity].nLevel..[[级以上玩家</font>
活动时间：<font color="#FFFF00">]]..tHuiKuiLB[szActivity].start..[[-]]..tHuiKuiLB[szActivity].over..[[</font>
活动范围：<font color="#FFFF00">全服</font>
礼包内容：<font color="#FFaa00"> 
]]..szText..[[</font>活动说明：<font color = "#FF0000">该礼包仅可领取一次！</font>
----------------------------------------
          <a href="event:talk_]]..tHuiKuiLB[szActivity].szAcceptFunc..[[">领取礼包</a>           <a href="event:talk_]]..tHuiKuiLB[szActivity].szMainFunc..[[">返回首页</a>
]]);
end

function LQHuiKuiLB(player, szActivity, szLBType)			--通用领取回馈礼包
	if not activity.isHuiKuiLiBaoOpen(szActivity) then			--每次修改活动日期
		player:alert(11,1,"对不起，不在活动时间内，无法领取礼包!")
		return
	end
	if player:get_level() < tHuiKuiLB[szActivity].nLevel then
		player:alert(1,1,"领取该礼包需要等级达到"..tHuiKuiLB[szActivity].nLevel.."级以上!");
		return
	end
	activity.HUODONG_BIAOSHI = activity.isLastActivityOpen()
	if util.ppn(player,const.PP_37BAIFU_HUIKUILB) > activity.HUODONG_BIAOSHI then				
		player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取！")
		return
	end
	if player:num_bag_black() < tHuiKuiLBAward[szLBType].nBagBlack then
		player:alert(1,1,"背包空格不足"..tHuiKuiLBAward[szLBType].nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(const.PP_37BAIFU_HUIKUILB,activity.HUODONG_BIAOSHI+3);
	player:alert(11,1,"成功领取["..tHuiKuiLB[szActivity].szTitle.."]!");
	if tHuiKuiLBAward[szLBType].tAward[1].num > 0 then
		player:add_vcoin_bind(tHuiKuiLBAward[szLBType].tAward[1].num);
		player:alert(10, 0, "绑定元宝 * "..tHuiKuiLBAward[szLBType].tAward[1].num)
	end
	if tHuiKuiLBAward[szLBType].tAward[2].num > 0 then
		player:add_gamemoney_bind(tHuiKuiLBAward[szLBType].tAward[2].num);
		player:alert(10, 0, "绑定金币 * "..tHuiKuiLBAward[szLBType].tAward[2].num)
	end
	for i = 3, #tHuiKuiLBAward[szLBType].tAward do
		player:add_item(tHuiKuiLBAward[szLBType].tAward[i].name, tHuiKuiLBAward[szLBType].tAward[i].num, 1)
		player:alert(10, 0, tHuiKuiLBAward[szLBType].tAward[i].name.." * "..tHuiKuiLBAward[szLBType].tAward[i].num)
	end
	return
end

function EchoDoubleExp(player, szActivity)		--通用双倍经验窗口模板
	local tDoubleExp = {
						XiaRi = {szTitle = "夏日双倍感恩回馈", start = "更新后", over = "6月7日", nTimes = 1, szMainFunc = "XiaRi",}, 
						ShuJia = {szTitle = "暑假双倍感恩回馈", start = "更新后", over = "7月8日", nTimes = 1, szMainFunc = "ShuJia",}, 
						ChinaJoy = {szTitle = "月初双倍感恩回馈", start = "更新后", over = "9月3日", nTimes = 1, szMainFunc = "ChinaJoy",}, 
						XiaZhi = {szTitle = "中秋双倍感恩回馈", start = "更新后", over = "9月10日", nTimes = 1, szMainFunc = "XiaZhi",}, 
						Day14th = {szTitle = "白色情人节双倍感恩回馈", start = "更新后", over = "3月15日", nTimes = 1, szMainFunc = "Day14th",}, 
						NewYear = {szTitle = "春分双倍感恩回馈", start = "更新后", over = "3月21日", nTimes = 1, szMainFunc = "NewYear",}, 
						May37BaiFu = {szTitle = "百服双倍感恩回馈", start = "更新后", over = "8月19日", nTimes = 1, szMainFunc = "May37BaiFu",},
						MoZuBaoKu = {szTitle = "荣耀双倍感恩回馈", start = "更新后", over = "8月26日", nTimes = 1, szMainFunc = "MoZuBaoKu",}, 
					}	--双倍经验窗口替换内容表
	player:echo([[            <font color="#FFFF00">]]..tDoubleExp[szActivity].szTitle..[[</font>
----------------------------------------
活动对象：<font color="#FFFF00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tDoubleExp[szActivity].start..[[-<font color="#FF0000">]]..tDoubleExp[szActivity].over..[[</font></font>
----------------------------------------
活动内容：<font color="#FFFF00">在活动时间内,所有服务器都将开启双倍打怪经验活动！</font>
          
活动说明：<font color="#FFaa00">活动期间,杀怪经验增加[<font color="#ee00ee">]]..tDoubleExp[szActivity].nTimes..[[</font>]倍！</font>
----------------------------------------
                             <a href="event:talk_]]..tDoubleExp[szActivity].szMainFunc..[[">返回首页</a>
]]);
end

function EchoTianmingTH(player, szActivity)		--通用双倍经验窗口模板
	local tDoubleExp = {
						Day14th = {szTitle = "正月天命特惠折扣", start = "更新后", over = "2月28日", nTimes = 80, szMainFunc = "Day14th",}, 
					}	--双倍经验窗口替换内容表
	player:echo([[            <font color="#FFFF00">]]..tDoubleExp[szActivity].szTitle..[[</font>
----------------------------------------
活动对象：<font color="#FFFF00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tDoubleExp[szActivity].start..[[-<font color="#FF0000">]]..tDoubleExp[szActivity].over..[[</font></font>
----------------------------------------
活动内容：<font color="#FFFF00">活动期间内，所有服务器天命每次升级所需真气丹数量为原先的[<font color="#ee00ee">]]..tDoubleExp[szActivity].nTimes..[[</font>]%！</font>
          
活动说明：<font color="#FFaa00">例如天命升级消耗真气数量1000，则在活动期间，本次升级仅需消耗真气1000*0.8=800！</font>
----------------------------------------
                             <a href="event:talk_]]..tDoubleExp[szActivity].szMainFunc..[[">返回首页</a>
]]);
end

function EchoShenqishengdian(player, szActivity)		--通用神器升级盛典窗口模板
	local tShenqi = {
						Day14th = {szTitle = "元宵节神器升级盛典", start = "更新后", over = "3月6日", nTimes = 20, szMainFunc = "Day14th",}, 
					}	--双倍经验窗口替换内容表
	player:echo([[            <font color="#FFFF00">]]..tShenqi[szActivity].szTitle..[[</font>
----------------------------------------
活动对象：<font color="#FFFF00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tShenqi[szActivity].start..[[-<font color="#FF0000">]]..tShenqi[szActivity].over..[[</font></font>
----------------------------------------
活动内容：<font color="#FFFF00">在活动时间内,所有服务器神器升级成功几率增加[<font color="#ee00ee">]]..tShenqi[szActivity].nTimes..[[%]]..[[</font>]！</font>
          
活动说明：<font color="#FFaa00">该活动与新区同类型活动效果不叠加</font>
----------------------------------------
                             <a href="event:talk_]]..tShenqi[szActivity].szMainFunc..[[">返回首页</a>
]]);
end

local tMRCZFLAward = {	XiaRi = {szName = "夏日每日充值返利", key = 10000, awardpcon = const.PP_XIARI_MRCZFLLB, nBagBlack = 1, tAward = {{name = "真气丹(1000)", num = 2},},},
						Day14th = {szName = "白色情人节充值灵魂豪礼", key = 10000, awardpcon = const.PP_KISSDAY_MRCZFLLB, nBagBlack = 1, tAward = {{name = "装备灵魂石(100)", num = 3},},},
						NewYear = {szName = "春分充值灵魂豪礼", key = 10000, awardpcon = const.PP_KISSDAY_MRCZFLLB, nBagBlack = 1, tAward = {{name = "装备灵魂石(100)", num = 3},},},
						May37BaiFu = {szName = "百服每日充值返利", key = 10000, awardpcon = const.PP_37BAIFU_CHONGZHIFL, nBagBlack = 2, tAward = {{name = "真气丹(1000)", num = 1}, {name = "灵气珠(1000)", num = 1},},},
						ShuJia = {szName = "暑假每日充值返利", key = 10000, awardpcon = const.PP_SHUJIA_MRCZFLLB, nBagBlack = 1, tAward = {{name = "兽灵精华(1000)", num = 1},},},
						MoZuBaoKu = {szName = "魔族每日充值返利", key = 10000, awardpcon = const.PP_SHUJIA_MRCZFLLB, nBagBlack = 2, tAward = {{name = "灵气珠(1000)", num = 1}, {name = "兽灵精华(1000)", num = 1},},},
						ChinaJoy = {szName = "月初充值即送徽记", key = 10000, awardpcon = const.PP_SHUJIA_MRCZFLLB, nBagBlack = 1, tAward = {{name = "霸者徽记", num = 15},},},
						XiaZhi = {szName = "美酒充值即送徽记", key = 10000, awardpcon = const.PP_XIAZHI_MRCZFLLB, nBagBlack = 1, tAward = {{name = "霸者徽记", num = 15},},},
						linghun = {szName = "大寒充值灵魂豪礼", key = 10000, awardpcon = const.PP_XIAZHI_MRCZFLLB, nBagBlack = 1, tAward = {{name = "装备灵魂石(100)", num = 3},},},
						qbt = {szName = "光棍节充值送丘比特", key = 10000, awardpcon = const.PP_XIAZHI_MRCZFLLB, nBagBlack = 1, tAward = {{name = "银色弓箭", num = 1},},},
				}--通用每日充值返利奖励

function EchoMRZCFL(player, szActivity)		--通用每日充值返利对话模板
	reset_player_mrczxflj_info(player)
	local tMRZCFLText = {XiaRi = {szTitle = "夏日每日充值返利", start = "更新后", over = "6月11日", szAcceptFunc = "XiaRi31", szMainFunc = "XiaRi", }, 
						Day14th = {szTitle = "白色情人节每日充值灵魂豪礼", start = "更新后", over = "3月18日", szAcceptFunc = "Day14th31", szMainFunc = "Day14th", }, 
						NewYear = {szTitle = "春分充值灵魂豪礼", start = "更新后", over = "3月25日", szAcceptFunc = "NewYear31", szMainFunc = "NewYear", }, 
						May37BaiFu = {szTitle = "百服每日充值返利", start = "更新后", over = "7月4日", szAcceptFunc = "May37BaiFu31", szMainFunc = "May37BaiFu", }, 
						ShuJia = {szTitle = "暑假每日充值返利", start = "更新后", over = "7月12日", szAcceptFunc = "ShuJia31", szMainFunc = "ShuJia", }, 
						MoZuBaoKu = {szTitle = "魔族每日充值返利", start = "更新后", over = "7月28日", szAcceptFunc = "MoZuBaoKu31", szMainFunc = "MoZuBaoKu", }, 
						ChinaJoy = {szTitle = "月初充值即送徽记", start = "更新后", over = "9月7日", szAcceptFunc = "ChinaJoy31", szMainFunc = "ChinaJoy", }, 
						XiaZhi = {szTitle = "月末充值即送徽记", start = "更新后", over = "10月25日", szAcceptFunc = "XiaZhi31", szMainFunc = "Day14th", }, 
						linghun = {szTitle = "大寒充值灵魂豪礼", start = "更新后", over = "1月25日", szAcceptFunc = "linghun31", szMainFunc = "Day14th", }, 
						qbt = {szTitle = "光棍节充值送丘比特", start = "更新后", over = "11月17日", szAcceptFunc = "qbt31", szMainFunc = "Day14th", }, 
					}
	local szText = ""
	for k,v in pairs(tMRCZFLAward[szActivity].tAward) do 
		szText = szText.."##"..v.name.."##   *"..v.num.."\n\n"
	end
	player:echo([[           <font color ="#FFFF00">]]..tMRZCFLText[szActivity].szTitle..[[</font>
----------------------------------------
活动对象：<font color="#FFFF00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFFF00">]]..tMRZCFLText[szActivity].start..[[-]]..tMRZCFLText[szActivity].over..[[</font>
----------------------------------------
活动内容：<font color="#FFFF00">活动时间内每日充值只需达到10000元宝即可领取</font>

<font color="#FFaa00">]]..szText..[[</font>----------------------------------------
活动说明：<font color = "#FF0000">该活动可与每日首充礼包叠加！</font>
----------------------------------------
您今日已充值：<font color="#FFaa00">]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝</font>
----------------------------------------
          <a href="event:talk_]]..tMRZCFLText[szActivity].szAcceptFunc..[[">领取礼包</a>            <a href="event:talk_]]..tMRZCFLText[szActivity].szMainFunc..[[">返回首页</a>
]]);
end

function MRCZFLLQLB(player, szActivity)			--通用每日充值返利领取礼包
	if not activity.isMRCZFLOpen(szActivity) then
		player:alert(11,1,"对不起，不在活动时间内，无法领取礼包!")
		return
	end
	if util.ppn(player,const.PP_DAILY_CONGZI) < tMRCZFLAward[szActivity].key then
		player:alert(1,1,"您今日充值元宝未达到"..tMRCZFLAward[szActivity].key.."元宝，无法领取充值返利哦!")
		return
	end
	if util.ppn(player,tMRCZFLAward[szActivity].awardpcon) == today() then
		player:alert(1,1,"对不起，今日的充值返利您已经领取了哦!")
		return
	end
	if player:num_bag_black() < tMRCZFLAward[szActivity].nBagBlack then
		player:alert(1,1,"背包空格不足"..tMRCZFLAward[szActivity].nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tMRCZFLAward[szActivity].awardpcon,today());
	player:alert(11,1,"成功领取["..tMRCZFLAward[szActivity].szName.."]!");
	for i = 1, #tMRCZFLAward[szActivity].tAward do
		player:add_item(tMRCZFLAward[szActivity].tAward[i].name, tMRCZFLAward[szActivity].tAward[i].num, 1)
		player:alert(10, 0, tMRCZFLAward[szActivity].tAward[i].name.." * "..tMRCZFLAward[szActivity].tAward[i].num)
	end
end

function EchoShengjiQianggou(player,szActivity)
	local tJingYanDanQG = {	Day14th = {szTitle = "白色情人节升级超值抢购", start = "更新后", over = "3月18日", szAcceptFunc1 = "Day14th41", szAcceptFunc2 = "Day14th42", szAcceptFunc3 = "Day14th43", szAcceptFunc4 = "Day14th44", szMainFunc = "Day14th"},
							NewYear = {szTitle = "春分升级超值抢购", start = "更新后", over = "3月25日", szAcceptFunc1 = "NewYear41", szAcceptFunc2 = "NewYear42", szAcceptFunc3 = "NewYear43", szAcceptFunc4 = "NewYear44", szMainFunc = "NewYear"},
						}
	reset_player_mrjyd_info(player);
	reset_player_mrcwjyd_info(player);
	player:echo([[<font color="#FFFF00">            ]]..tJingYanDanQG[szActivity].szTitle..[[</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tJingYanDanQG[szActivity].start..[[-]]..tJingYanDanQG[szActivity].over..[[</font>
----------------------------------------
活动说明：<font color="#FFff00">活动期间内，每位玩家均可在本处
购买以下商品，每种限制购买[<font color="#FF0000">3</font>]次</font>
----------------------------------------
##经验珠(5000万)##           <a href="event:talk_]]..tJingYanDanQG[szActivity].szAcceptFunc1..[[">点击购买</a>
原价:<font color="#FF0000">2500元宝</font>       现价:<font color="#FFaa00">990元宝</font>
----------------------------------------
##经验珠(2000万)##           <a href="event:talk_]]..tJingYanDanQG[szActivity].szAcceptFunc2..[[">点击购买</a>
原价:<font color="#FF0000">1000元宝</font>       现价:<font color="#FFaa00">400元宝</font>
----------------------------------------
##守护经验丹(5000万)##       <a href="event:talk_]]..tJingYanDanQG[szActivity].szAcceptFunc3..[[">点击购买</a>
原价:<font color="#FF0000">2500元宝</font>       现价:<font color="#FFaa00">990元宝</font>
----------------------------------------
##守护经验丹(2000万)##       <a href="event:talk_]]..tJingYanDanQG[szActivity].szAcceptFunc4..[[">点击购买</a>
原价:<font color="#FF0000">1000元宝</font>       现价:<font color="#FFaa00">400元宝</font>
----------------------------------------
                              <a href="event:talk_]]..tJingYanDanQG[szActivity].szMainFunc..[[">返回首页</a>]]);
end

function EchoJingYanDan(player, szActivity)		--通用经验珠折扣面板
	local tJingYanDanQG = {	XiaRi = {szTitle = "夏日冲级超值抢购", start = "更新后", over = "6月11日", szAcceptFunc1 = "XiaRi51", szAcceptFunc2 = "XiaRi52", szMainFunc = "XiaRi"}, 
							Day14th = {szTitle = "小年升级超值抢购", start = "更新后", over = "2月13日", szAcceptFunc1 = "Day14th41", szAcceptFunc2 = "Day14th42", szMainFunc = "Day14th"}, 
							ChinaJoy = {szTitle = "七夕升级超值抢购", start = "更新后", over = "8月5日", szAcceptFunc1 = "ChinaJoy41", szAcceptFunc2 = "ChinaJoy42", szMainFunc = "ChinaJoy"}, 
							XiaZhi = {szTitle = "中秋升级超值抢购", start = "更新后", over = "9月14日", szAcceptFunc1 = "XiaZhi41", szAcceptFunc2 = "XiaZhi42", szMainFunc = "XiaZhi"}, 
							MoZuBaoKu = {szTitle = "荣耀升级超值抢购", start = "更新后", over = "8月31日", szAcceptFunc1 = "MoZuBaoKu41", szAcceptFunc2 = "MoZuBaoKu42", szMainFunc = "MoZuBaoKu"}, 
						}
	reset_player_mrjyd_info(player)
	player:echo([[<font color="#FFFF00">            ]]..tJingYanDanQG[szActivity].szTitle..[[</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tJingYanDanQG[szActivity].start..[[-]]..tJingYanDanQG[szActivity].over..[[</font>
----------------------------------------
活动说明：<font color="#FFff00">活动期间内，每位玩家均可在本处
购买以下商品，每种限制购买[<font color="#FF0000">3</font>]次</font>
----------------------------------------
##经验珠(5000万)##           <a href="event:talk_]]..tJingYanDanQG[szActivity].szAcceptFunc1..[[">点击购买</a>
原价:<font color="#FF0000">2500元宝</font>       现价:<font color="#FFaa00">990元宝</font>
----------------------------------------
##经验珠(2000万)##           <a href="event:talk_]]..tJingYanDanQG[szActivity].szAcceptFunc2..[[">点击购买</a>
原价:<font color="#FF0000">1000元宝</font>       现价:<font color="#FFaa00">400元宝</font>
----------------------------------------
                              <a href="event:talk_]]..tJingYanDanQG[szActivity].szMainFunc..[[">返回首页</a>]]);
end

--活动说明：<font color="#FF0000">该活动不与精彩活动中同类活动叠加！</font>
----------------------------------------

function reset_player_mrjyd_info(player)
	if util.ppn(player,const.PP_JC_SJQG_DATE) ~= today() then
		player:set_param(const.PP_JC_SJQG_DATE,today());
		player:set_param(const.PP_JC_SJQG_TIMES1,0);
		player:set_param(const.PP_JC_SJQG_TIMES2,0);
	end
	return
end

function EchoCWJingYanDan(player, szActivity)		--通用经验珠折扣面板
	reset_player_mrcwjyd_info(player)
	local tText = {	Day14th = {szTitle = "月末狂欢升级超值抢购", start = "更新后", over = "1月31日", szAcceptFunc1 = "Day14th41", szAcceptFunc2 = "Day14th42", szMainFunc = "Day14th"}, 
					May37BaiFu = {szTitle = "百服守护升级抢购", start = "更新后", over = "8月23日", szAcceptFunc1 = "May37BaiFu81", szAcceptFunc2 = "May37BaiFu82", szMainFunc = "May37BaiFu"}, 
					ChinaJoy = {szTitle = "月初守护升级抢购", start = "更新后", over = "9月7日", szAcceptFunc1 = "ChinaJoy41", szAcceptFunc2 = "ChinaJoy42", szMainFunc = "ChinaJoy"}, 
					}
	player:echo([[<font color="#FFFF00">            ]]..tText[szActivity].szTitle..[[</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tText[szActivity].start..[[-]]..tText[szActivity].over..[[</font>
----------------------------------------
活动说明：<font color="#FFff00">活动期间内，每位玩家均可在本处
购买以下商品，每种限制购买[<font color="#FF0000">3</font>]次</font>
----------------------------------------

##守护经验丹(5000万)##       <a href="event:talk_]]..tText[szActivity].szAcceptFunc1..[[">点击购买</a>
原价:<font color="#FF0000">2500元宝</font>       现价:<font color="#FFaa00">990元宝</font>


##守护经验丹(2000万)##       <a href="event:talk_]]..tText[szActivity].szAcceptFunc2..[[">点击购买</a>
原价:<font color="#FF0000">1000元宝</font>       现价:<font color="#FFaa00">400元宝</font>

----------------------------------------
                              <a href="event:talk_]]..tText[szActivity].szMainFunc..[[">返回首页</a>]]);
end

function reset_player_mrcwjyd_info(player)
	if util.ppn(player,const.PP_CWJYD_DATE) ~= today() then
		player:set_param(const.PP_CWJYD_DATE,today());
		player:set_param(const.PP_CWJYD_TIMES1,0);
		player:set_param(const.PP_CWJYD_TIMES2,0);
	end
	return
end

function reset_player_zksc_info(player)
	if util.ppn(player,const.PP_SHUJIASALE_DATE) ~= today() then
		player:set_param(const.PP_SHUJIASALE_DATE,today());
		local tParam = {const.PP_SHUJIASALE_TIMES1, 
						const.PP_SHUJIASALE_TIMES2, 
						const.PP_SHUJIASALE_TIMES3, 
						const.PP_SHUJIASALE_TIMES4, 
						const.PP_SHUJIASALE_TIMES5, 
						const.PP_SHUJIASALE_TIMES6, 
						const.PP_SHUJIASALE_TIMES7, 
						const.PP_SHUJIASALE_TIMES8, 
						const.PP_SHUJIASALE_TIMES9, 
						const.PP_SHUJIASALE_TIMES10, 
						const.PP_SHUJIASALE_TIMES11,  
						const.PP_SHUJIASALE_TIMES12,  
						const.PP_SHUJIASALE_TIMES13, 
						const.PP_SHUJIASALE_TIMES14, 

					}
		for i = 1, #tParam do
			player:set_param(tParam[i],0);
		end
	end
	return
end

function VcoinBuyItemsLimited(player, szActivity, szItemName, nMax, awardpcon, nPrice, nNum, nBagBlack, isBind)		--通用元宝购买物品
	if szItemName == "经验珠(5000万)" or szItemName == "经验珠(2000万)" then
		if not activity.isJingYanDanOpen(szActivity) then
			player:alert(11,1,"非活动时间，无法购买哦!")
			return
		else
			reset_player_mrjyd_info(player)
		end
	elseif szItemName == "守护经验丹(5000万)" or szItemName == "守护经验丹(2000万)" then
		if not activity.isCWJingYanDanOpen(szActivity) then
			player:alert(11,1,"非活动时间，无法购买哦!")
			return
		else
			reset_player_mrcwjyd_info(player)
		end
	else
		if not activity.isHuoDongZheKouOpen(szActivity) then
			player:alert(11,1,"非活动时间，无法购买哦!")
			return
		else
			reset_player_zksc_info(player)
		end
	end
	if util.ppn(player, awardpcon) >= nMax then
		player:alert(11,1,"每人每天最多只可购买"..nMax.."个["..szItemName.."]!")
		return
	end
	if player:get_vcoin() < nPrice then
		player:alert(11,1,"您的元宝不足["..nPrice.."],无法购买["..szItemName.."]!")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(1,1,"对不起,您的背包空格不足"..nBagBlack.."格,无法购买!")
		return
	end
	player:set_param(awardpcon, util.ppn(player,awardpcon)+1)
	player:sub_vcoin(nPrice, "140824"..szItemName)
	player:add_item(szItemName, nNum, isBind)
	player:alert(11,1,"成功使用["..nPrice.."]元宝购买["..szItemName.."] * "..nNum.."!")
	return
end

function VcoinBuyItems(player, szActivity, szItemName, nPrice, nNum, nBagBlack, isBind, logDate)		--通用元宝购买物品
	if not activity.isHuoDongZheKouOpen(szActivity) then
		player:alert(11,1,"非活动时间，无法购买哦!")
		return
	end
	if player:get_vcoin() < nPrice then
		player:alert(11,1,"您的元宝不足["..nPrice.."],无法购买！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(1,1,"对不起,您的背包空格不足"..nBagBlack.."格,无法购买!")
		return
	end
	player:sub_vcoin(nPrice,logDate..szItemName)
	player:add_item(szItemName,nNum,isBind)
	player:alert(11,1,"成功使用["..nPrice.."]元宝购买["..szItemName.."] *"..nNum.."!")
	return
end

function BindVcoinBuyItemsLimited(player, szActivity, szTableName, key)		--通用绑定元宝购买物品
	if szActivity == "Day14th" and not activity.isDay14thOpen() then
		player:alert(11,1,"非活动时间，无法购买哦!")
		return
	end
	local tBindVcoinItems = {Day14th = {[1] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_1, nPrice = 8000, log = "星石", nBagBlack = 1, name = "星石", num = 1,}, 
									[2] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_2, nPrice = 78408, log = "八级生命玄晶", nBagBlack = 1, name = "八级生命玄晶", num = 1,},
									[3] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_3, nPrice = 2000, log = "超级真气丹", nBagBlack = 1, name = "超级真气丹", num = 1,}, 
									[4] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_4, nPrice = 2000, log = "超级坐骑丹", nBagBlack = 1, name = "超级坐骑丹", num = 1,}, 
									[5] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_5, nPrice = 2000, log = "超级进阶石包", nBagBlack = 1, name = "超级进阶石包", num = 1,},
									[6] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_6, nPrice = 1280, log = "聚灵珠", nBagBlack = 1, name = "聚灵珠", num = 1,}, 	
									[7] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_7, nPrice = 3750, log = "八倍宝典", nBagBlack = 1, name = "八倍宝典", num = 1,}, 	
									[8] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_8, nPrice = 20000, log = "兽灵精华(10000)", nBagBlack = 1, name = "兽灵精华(10000)", num = 1,}, 	
									[9] = {nMax = 5, awardpcon = const.PP_KISSDAY_BV_9, nPrice = 20000, log = "灵气珠(10000)", nBagBlack = 1, name = "灵气珠(10000)", num = 1,}, 				
								},
						}	--通用绑定元宝购买物品列表
	if util.ppn(player,const.PP_KISSDAY_BV_DATE) ~= today() then
		player:set_param(const.PP_KISSDAY_BV_DATE,today())
		for i = 1, #tBindVcoinItems[szActivity] do
			player:set_param(tBindVcoinItems[szActivity][i].awardpcon,0)
		end
	end
	if util.ppn(player,tBindVcoinItems[szTableName][key].awardpcon) >= tBindVcoinItems[szTableName][key].nMax then
		player:alert(11,1,"每人每天最多只可购买"..tBindVcoinItems[szTableName][key].nMax.."次["..tBindVcoinItems[szTableName][key].name.."]!")
		return
	end
	if player:get_vcoin_bind() < tBindVcoinItems[szTableName][key].nPrice then
		player:alert(11,1,"您的绑定元宝不足["..tBindVcoinItems[szTableName][key].nPrice.."],无法购买["..tBindVcoinItems[szTableName][key].name.."]!")
		return
	end
	if player:num_bag_black() < tBindVcoinItems[szTableName][key].nBagBlack then
		player:alert(1,1,"对不起,您的背包空格不足"..tBindVcoinItems[szTableName][key].nBagBlack.."格,无法购买!")
		return
	end
	player:set_param(tBindVcoinItems[szTableName][key].awardpcon,util.ppn(player,tBindVcoinItems[szTableName][key].awardpcon)+1)
	player:sub_vcoin_bind(tBindVcoinItems[szTableName][key].nPrice,tBindVcoinItems[szTableName][key].log)
	player:add_item(tBindVcoinItems[szTableName][key].name,tBindVcoinItems[szTableName][key].num,1)
	player:alert(11,1,"成功使用["..tBindVcoinItems[szTableName][key].nPrice.."]绑定元宝购买["..tBindVcoinItems[szTableName][key].name.."]!")
	return
end

function BindVcoinBuyItems(player, szActivity, szItemName, nPrice, nNum, nBagBlack, isBind, logDate)		--通用元宝购买物品
	if not activity.isBindVcoinMallOpen(szActivity) then
		player:alert(11,1,"非活动时间，无法购买哦!")
		return
	end
	if player:get_vcoin_bind() < nPrice then
		player:alert(11,1,"您的绑定元宝不足["..nPrice.."],无法购买！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(1,1,"对不起,您的背包空格不足"..nBagBlack.."格,无法购买!")
		return
	end
	player:sub_vcoin_bind(nPrice,logDate.."szItemName")
	player:add_item(szItemName,nNum,isBind)
	player:alert(11,1,"成功使用["..nPrice.."]绑定元宝购买["..szItemName.."] *"..nNum.."!")
	return
end

function EchoDoubleZhuanSheng(player, szActivity)		--通用双倍转生窗口模板
	local tDoubleZhuanShen = {XiaRi = {szTitle = "夏日双倍转生盛典", start = "更新后", over = "6月11日", nTimes = 1, szMainFunc = "XiaRi",}, 
							}	--双倍转生窗口替换内容表
	player:echo([[            <font color="#FFFF00">]]..tDoubleZhuanShen[szActivity].szTitle..[[</font>
----------------------------------------
活动对象：<font color="#FFFF00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tDoubleZhuanShen[szActivity].start..[[-]]..tDoubleZhuanShen[szActivity].over..[[</font>
----------------------------------------
活动内容：<font color="#FFaa00">活动时间内，所有玩家转生几率增加[<font color="#ee00ee">]]..tDoubleZhuanShen[szActivity].nTimes..[[</font>]倍！</font>
          
活动说明：<font color="#FF0000">该活动不与精彩活动中双倍转生活动叠加！</font>
----------------------------------------
                             <a href="event:talk_]]..tDoubleZhuanShen[szActivity].szMainFunc..[[">返回首页</a>
----------------------------------------]]);
end

function onTalkYuPeiHuiKui(player)
	local tText = {szName = "立春玉佩升级豪礼", start = "更新后", over = "2月7日", funcMain = "Day14th", }
	--reset_player_yupeisjhl_info(player);
	player:echo([[            <font color="#FFFF00">]]..tText.szName..[[</font>
----------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
----------------------------------------
领取时间: <font color="#FFff00">]]..tText.start..[[-]]..tText.over..[[</font>
----------------------------------------
活动内容: <font color="#FFff00">在<font color="#FF0000">活动期间</font>，将<font color="#ee00ee">玉佩</font>进阶至相应等级，即可获得丰厚奖励。</font>
<font color="#FFaa00">
   <a href="event:talk_YuPeiHuiKui1">琅环玉佩(5级)</a> 即可领取 <font color="#ee00ee">五级宝石*1</font>
   <a href="event:talk_YuPeiHuiKui2">盘蛇玉佩(6级)</a> 即可领取 <font color="#ee00ee">六级宝石*1</font>
   <a href="event:talk_YuPeiHuiKui3">同心玉佩(7级)</a> 即可领取 <font color="#ee00ee">七级宝石*1</font>
   <a href="event:talk_YuPeiHuiKui4">祥瑞玉佩(8级)</a> 即可领取 <font color="#ee00ee">八级宝石*1</font>
 <a href="event:talk_YuPeiHuiKui5">花晨月夕佩(9级)</a> 即可领取<font color="#ee00ee">七级攻击玄晶*1</font>
<a href="event:talk_YuPeiHuiKui6">双鱼献珠佩(10级)</a> 即可领取<font color="#ee00ee">八级攻击玄晶*1</font>
<a href="event:talk_YuPeiHuiKui7">碧海青天佩(11级)</a> 即可领取<font color="#ee00ee">九级攻击玄晶*1</font>
<a href="event:talk_YuPeiHuiKui8">龙凤呈祥佩(12级)</a> 即可领取<font color="#ee00ee">十级攻击玄晶*1</font></font>
----------------------------------------
温馨提示：<font color="#FFaa00">在活动时间之前升级的玩家也可领取奖励，每个角色仅限一次！</font>
                             <a href="event:talk_]]..tText.funcMain..[[">返回首页</a>]]);
end

function onTalkYuPeiHuiKui1(player)	YuPeiJinJieLQLB(player,5,"五级宝石",1,1,1, "150201".."YuPeiHK_".."五级宝石")		onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui2(player)	YuPeiJinJieLQLB(player,6,"六级宝石",1,1,1, "150201".."YuPeiHK_".."六级宝石")		onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui3(player)	YuPeiJinJieLQLB(player,7,"七级宝石",1,1,1, "150201".."YuPeiHK_".."七级宝石")		onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui4(player)	YuPeiJinJieLQLB(player,8,"八级宝石",1,1,1, "150201".."YuPeiHK_".."八级宝石")		onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui5(player)	YuPeiJinJieLQLB(player,9,"七级攻击玄晶",1,0,0, "150201".."YuPeiHK_".."七级攻击玄晶")	onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui6(player)	YuPeiJinJieLQLB(player,10,"八级攻击玄晶",1,0,0, "150201".."YuPeiHK_".."八级攻击玄晶")	onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui7(player)	YuPeiJinJieLQLB(player,11,"九级攻击玄晶",1,0,0, "150201".."YuPeiHK_".."九级攻击玄晶")	onTalkYuPeiHuiKui(player)	end
function onTalkYuPeiHuiKui8(player)	YuPeiJinJieLQLB(player,12,"十级攻击玄晶",1,0,0, "150201".."YuPeiHK_".."十级攻击玄晶")	onTalkYuPeiHuiKui(player)	end
function reset_player_yupeisjhl_info(player)
	if activity.isYuPeiJinJieLBOpen() then
		activity.HUODONG_BIAOSHI = activity.isLastActivityOpen()
		if util.ppn(player,const.PP_YUPEIJJ_LVFLAG) <= activity.HUODONG_BIAOSHI then
			player:set_param(const.PP_YUPEIJJ_LVFLAG,activity.HUODONG_BIAOSHI+3);
			local lvParam = {const.PP_YUPEIJJ_LV5, 
						const.PP_YUPEIJJ_LV6, 
						const.PP_YUPEIJJ_LV7, 
						const.PP_YUPEIJJ_LV8, 
						const.PP_YUPEIJJ_LV9, 
						const.PP_YUPEIJJ_LV10, 
						const.PP_YUPEIJJ_LV11, 
						const.PP_YUPEIJJ_LV12, 
					}
			for i = 1, #lvParam do
				player:set_param(lvParam[i],0);
			end
		end
	end
end
function YuPeiJinJieLQLB(player, nLevel, szItemName, nNum, nBagBlack, isBind, log)
	if not activity.isYuPeiJinJieLBOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	local tParam = {[5] = {szName = "琅环玉佩(5级)", awardpcon = const.PP_YUPEIJJ_LV5}, 
					[6] = {szName = "盘蛇玉佩(6级)", awardpcon = const.PP_YUPEIJJ_LV6}, 
					[7] = {szName = "同心玉佩(7级)", awardpcon = const.PP_YUPEIJJ_LV7}, 
					[8] = {szName = "祥瑞玉佩(8级)", awardpcon = const.PP_YUPEIJJ_LV8}, 
					[9] = {szName = "花晨月夕佩(9级)", awardpcon = const.PP_YUPEIJJ_LV9}, 
					[10] = {szName = "双鱼献珠佩(10级)", awardpcon = const.PP_YUPEIJJ_LV10}, 
					[11] = {szName = "碧海青天佩(11级)", awardpcon = const.PP_YUPEIJJ_LV11}, 
					[12] = {szName = "龙凤呈祥佩(12级)", awardpcon = const.PP_YUPEIJJ_LV12}, 
					}
	local nYuPeiLevel = 0
	for k,v in pairs(tParam) do
		if player:num_item(v.szName,10) >= 1 then
			nYuPeiLevel = k
			break
		end
	end
	if nYuPeiLevel < nLevel then
		player:alert(11,1,"对不起，您尚未装备["..nLevel.."级]或更高等级的玉佩！")
		return
	end
	if util.ppn(player,tParam[nLevel].awardpcon) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tParam[nLevel].awardpcon,1)
	player:add_item(szItemName, nNum, isBind)
	server.log_count(4,log,nNum);
	player:alert(11,1,"成功领取"..nLevel.."级玉佩奖励：["..szItemName.."] *"..nNum.."!")
	return
end

function onTalkLinhunsjhk(player)
	local tText = {szName = "春季灵魂升阶回馈", start = "更新后", over = "3月12日", funcMain = "Day14th", }
	--reset_player_linhunsjhl_info(player);
	player:echo([[            <font color="#FFFF00">]]..tText.szName..[[</font>
----------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
----------------------------------------
领取时间: <font color="#FFff00">]]..tText.start..[[-]]..tText.over..[[</font>
----------------------------------------
活动内容: <font color="#FFff00">在<font color="#FF0000">活动期间</font>，将<font color="#ee00ee">全身装备灵魂</font>进阶至相应等级，即可获得丰厚奖励。</font>
   <font color="#FFaa00"><a href="event:talk_Linhunsjhk1">20阶</a> 即可领取 <font color="#ee00ee">装备灵魂石(1000)*1</font>
   <a href="event:talk_Linhunsjhk2">30阶</a> 即可领取 <font color="#ee00ee">装备灵魂石(1000)*2</font>
   <a href="event:talk_Linhunsjhk3">40阶</a> 即可领取 <font color="#ee00ee">装备灵魂石(1000)*3</font>
   <a href="event:talk_Linhunsjhk4">50阶</a> 即可领取 <font color="#ee00ee">装备灵魂石(1000)*4</font>
   <a href="event:talk_Linhunsjhk5">60阶</a> 即可领取 <font color="#ee00ee">装备灵魂石(1000)*5</font>
   <a href="event:talk_Linhunsjhk6">70阶</a> 即可领取 <font color="#ee00ee">装备灵魂石(1000)*6</font></font>
----------------------------------------
温馨提示：<font color="#FFaa00">在活动时间之前升级的玩家也可领取奖励，每个账号仅限一次！</font>
                             <a href="event:talk_]]..tText.funcMain..[[">返回首页</a>]]);
end
function onTalkLinhunsjhk1(player)	LinhunJinJieLQLB(player,20,"装备灵魂石(1000)",1,1,1, "150208".."LinhunHK_".."装备灵魂石(1000)*1")		onTalkLinhunsjhk(player)	end
function onTalkLinhunsjhk2(player)	LinhunJinJieLQLB(player,30,"装备灵魂石(1000)",2,1,1, "150208".."LinhunHK_".."装备灵魂石(1000)*2")		onTalkLinhunsjhk(player)	end
function onTalkLinhunsjhk3(player)	LinhunJinJieLQLB(player,40,"装备灵魂石(1000)",3,1,1, "150208".."LinhunHK_".."装备灵魂石(1000)*3")		onTalkLinhunsjhk(player)	end
function onTalkLinhunsjhk4(player)	LinhunJinJieLQLB(player,50,"装备灵魂石(1000)",4,1,1, "150208".."LinhunHK_".."装备灵魂石(1000)*4")		onTalkLinhunsjhk(player)	end
function onTalkLinhunsjhk5(player)	LinhunJinJieLQLB(player,60,"装备灵魂石(1000)",5,1,1, "150208".."LinhunHK_".."装备灵魂石(1000)*5")	onTalkLinhunsjhk(player)	end
function onTalkLinhunsjhk6(player)	LinhunJinJieLQLB(player,70,"装备灵魂石(1000)",6,1,1, "150208".."LinhunHK_".."装备灵魂石(1000)*6")	onTalkLinhunsjhk(player)	end
function reset_player_linhunsjhl_info(player)
	if activity.isLinhunJinJieLBOpen() then
		activity.HUODONG_BIAOSHI = activity.isLastActivityOpen()
		if util.ppn(player,const.PP_LINHUNJJ_LVFLAG) <= activity.HUODONG_BIAOSHI then
			player:set_param(const.PP_LINHUNJJ_LVFLAG,activity.HUODONG_BIAOSHI+3);
			local lvParam = {const.PP_LINHUNJJ_LV20, 
						const.PP_LINHUNJJ_LV30, 
						const.PP_LINHUNJJ_LV40, 
						const.PP_LINHUNJJ_LV50, 
						const.PP_LINHUNJJ_LV60, 
						const.PP_LINHUNJJ_LV70, 
					}
			for i = 1, #lvParam do
				player:set_param(lvParam[i],0);
			end
		end
	end
end
function LinhunJinJieLQLB(player, nLevel, szItemName, nNum, nBagBlack, isBind, log)
	if not activity.isLinhunJinJieLBOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	local tParam = {[20] = {szName = "", awardpcon = const.PP_LINHUNJJ_LV20}, 
					[30] = {szName = "", awardpcon = const.PP_LINHUNJJ_LV30}, 
					[40] = {szName = "", awardpcon = const.PP_LINHUNJJ_LV40}, 
					[50] = {szName = "", awardpcon = const.PP_LINHUNJJ_LV50}, 
					[60] = {szName = "", awardpcon = const.PP_LINHUNJJ_LV60}, 
					[70] = {szName = "", awardpcon = const.PP_LINHUNJJ_LV70}, 
					}
	local nLinhunLevel = newgui.fuse.getTotalZbzhj(player);
	if nLinhunLevel < nLevel then
		player:alert(11,1,"对不起，您全身装备灵魂尚未进阶至["..nLevel.."阶]!")
		return
	end
	if util.ppn(player,tParam[nLevel].awardpcon) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tParam[nLevel].awardpcon,1)
	player:add_item(szItemName, nNum, isBind)
	server.log_count(4,log,nNum);
	player:alert(11,1,"成功领取"..nLevel.."阶装备灵魂奖励：["..szItemName.."] *"..nNum.."!")
	return
end


local tZCXFHLText = {XiaRi = {szName = "夏日充值豪华礼包", czxfType = "充值", start = "更新后", over = "6月11日", awardpcon = const.PP_DAILY_CONGZI, funcMain = "XiaRi", funcMain2 = "XiaRi8", 
								tAcceptFunc = {[5000]= {"XiaRi50", "XiaRi50b"}, [10000] = {"XiaRi100", "XiaRi100b"}, [30000] = {"XiaRi300", "XiaRi300b"}, [50000] = {"XiaRi500", "XiaRi500b"}, 
												[100000] = {"XiaRi1000", "XiaRi1000b"}, [300000] = {"XiaRi3000", "XiaRi3000b"}, [500000] = {"XiaRi5000", "XiaRi5000b"},
											},
							},
					ShuJia = {szName = "暑假充值玄晶礼包", czxfType = "充值", start = "更新后", over = "7月12日", awardpcon = const.PP_DAILY_CONGZI, funcMain = "ShuJia", 
								tAcceptFunc = {[5000]= "ShuJia71", [10000] = "ShuJia72", [30000] = "ShuJia73", [50000] = "ShuJia74", [100000] = "ShuJia75", [300000] = "ShuJia76", [500000] = "ShuJia77",},
							},
					ChinaJoy = {szName = "月初每日充值豪礼", czxfType = "充值", start = "更新后", over = "9月7日", awardpcon = const.PP_DAILY_CONGZI, funcMain = "ChinaJoy", funcMain2 = "ChinaJoy7", 
								tAcceptFunc = {[5000]= {"ChinaJoy50", "ChinaJoy50b"}, [10000] = {"ChinaJoy100", "ChinaJoy100b"}, [30000] = {"ChinaJoy300", "ChinaJoy300b"}, [50000] = {"ChinaJoy500", "ChinaJoy500b"}, 
												[100000] = {"ChinaJoy1000", "ChinaJoy1000b"}, [300000] = {"ChinaJoy3000", "ChinaJoy3000b"}, [500000] = {"ChinaJoy5000", "ChinaJoy5000b"},
											},
							},
					XiaZhi = {szName = "春分每日消费豪礼", czxfType = "消费", start = "更新后", over = "3月25日", awardpcon = const.PP_LEIJIXF, funcMain = "NewYear", funcMain2 = "XiaZhi8", 
								tAcceptFunc = {[5000]= {"XiaZhi50", "XiaZhi50b"}, [10000] = {"XiaZhi100", "XiaZhi100b"}, [30000] = {"XiaZhi300", "XiaZhi300b"}, [50000] = {"XiaZhi500", "XiaZhi500b"}, 
												[100000] = {"XiaZhi1000", "XiaZhi1000b"}, [300000] = {"XiaZhi3000", "XiaZhi3000b"}, [500000] = {"XiaZhi5000", "XiaZhi5000b"},
											},
							},
					Day14th = {szName = "白色情人节每日充值豪礼", czxfType = "充值", start = "更新后", over = "3月18日", awardpcon = const.PP_DAILY_CONGZI, funcMain = "Day14th", funcMain2 = "Day14th7", 
								tAcceptFunc = {[5000]= {"Day14th50", "Day14th50b"}, [10000] = {"Day14th100", "Day14th100b"}, [30000] = {"Day14th300", "Day14th300b"}, [50000] = {"Day14th500", "Day14th500b"}, 
												[100000] = {"Day14th1000", "Day14th1000b"}, [300000] = {"Day14th3000", "Day14th3000b"}, [500000] = {"Day14th5000", "Day14th5000b"},
											},
							},
					NewYear = {szName = "春分每日消费豪礼", czxfType = "消费", start = "更新后", over = "3月25日", awardpcon = const.PP_DAILY_CONGZI, funcMain = "NewYear", funcMain2 = "NewYear7", 
								tAcceptFunc = {[5000]= {"NewYear50", "NewYear50b"}, [10000] = {"NewYear100", "NewYear100b"}, [30000] = {"NewYear300", "NewYear300b"}, [50000] = {"NewYear500", "NewYear500b"}, 
												[100000] = {"NewYear1000", "NewYear1000b"}, [300000] = {"NewYear3000", "NewYear3000b"}, [500000] = {"NewYear5000", "NewYear5000b"},
											},
							},
					May37BaiFu = {szName = "百服每日充值豪礼", czxfType = "充值", start = "更新后", over = "8月23日", awardpcon = const.PP_DAILY_CONGZI, funcMain = "May37BaiFu", funcMain2 = "May37BaiFu7", 
								tAcceptFunc = {[5000]= {"May37BaiFu50", "May37BaiFu50b"}, [10000] = {"May37BaiFu100", "May37BaiFu100b"}, [30000] = {"May37BaiFu300", "May37BaiFu300b"}, [50000] = {"May37BaiFu500", "May37BaiFu500b"}, 
												[100000] = {"May37BaiFu1000", "May37BaiFu1000b"}, [300000] = {"May37BaiFu3000", "May37BaiFu3000b"}, [500000] = {"May37BaiFu5000", "May37BaiFu5000b"},
											},
							},
					MoZuBaoKu = {szName = "美酒每日消费豪礼", czxfType = "消费", start = "更新后", over = "10月19日", awardpcon = const.PP_LEIJIXF, funcMain = "Day14th", funcMain2 = "MoZuBaoKu6", 
								tAcceptFunc = {[5000]= {"MoZuBaoKu50", "MoZuBaoKu50b"}, [10000] = {"MoZuBaoKu100", "MoZuBaoKu100b"}, [30000] = {"MoZuBaoKu300", "MoZuBaoKu300b"}, [50000] = {"MoZuBaoKu500", "MoZuBaoKu500b"}, 
												[100000] = {"MoZuBaoKu1000", "MoZuBaoKu1000b"}, [300000] = {"MoZuBaoKu3000", "MoZuBaoKu3000b"}, [500000] = {"MoZuBaoKu5000", "MoZuBaoKu5000b"},
											},
							},
					}	--通用充值/消费豪礼文本表

local tZCXFHLAward = {	cost = {[5000] = {awardpcon = const.PP_JC_MRLJXF1, nBagBlack = 3, award = {{name = "绑定元宝", num = 2000}, {name = "大型玄晶宝箱", num = 1}, {name = "天蚕精华", num = 1}, {name = "灵羽宝箱", num = 1},},},
								[10000] = {awardpcon = const.PP_JC_MRLJXF2, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "大型玄晶宝箱", num = 1}, {name = "天蚕精华", num = 2}, {name = "装备宝箱", num = 1}, {name = "灵羽宝箱", num = 1},},},
								[30000] = {awardpcon = const.PP_JC_MRLJXF3, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "天蚕精华", num = 3}, {name = "超级玄晶宝箱", num = 1}, {name = "装备宝箱", num = 2}, {name = "灵羽宝箱", num = 2},},},
								[50000] = {awardpcon = const.PP_JC_MRLJXF4, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "天蚕精华", num = 4}, {name = "超级玄晶宝箱", num = 1}, {name = "装备宝箱", num = 2}, {name = "灵羽宝箱", num = 2},},},
								[100000] = {awardpcon = const.PP_JC_MRLJXF5, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "六级灵羽", num = 1}, {name = "十级玄晶宝箱", num = 1}, {name = "经验珠(5000万)", num = 1}, {name = "青龙丹", num = 1},},},
								[300000] = {awardpcon = const.PP_JC_MRLJXF6, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "七级灵羽", num = 1}, {name = "十级玄晶宝箱", num = 1}, {name = "经验珠(5000万)", num = 2}, {name = "王者徽记", num = 5},},},
								[500000] = {awardpcon = const.PP_JC_MRLJXF7, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "八级灵羽", num = 1}, {name = "十级玄晶宝箱", num = 1}, {name = "经验珠(5000万)", num = 2}, {name = "王者徽记", num = 10},},},
							},
					recharge = {[5000] = {awardpcon = const.PP_JC_MRLJCZ1, nBagBlack = 3, award = {{name = "绑定元宝", num = 2000}, {name = "大型玄晶宝箱", num = 1}, {name = "天蚕精华", num = 1}, {name = "灵羽宝箱", num = 1},},},
								[10000] = {awardpcon = const.PP_JC_MRLJCZ2, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "大型玄晶宝箱", num = 1}, {name = "天蚕精华", num = 2}, {name = "装备宝箱", num = 1}, {name = "灵羽宝箱", num = 1},},},
								[30000] = {awardpcon = const.PP_JC_MRLJCZ3, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "天蚕精华", num = 3}, {name = "超级玄晶宝箱", num = 1}, {name = "装备宝箱", num = 2}, {name = "灵羽宝箱", num = 2},},},
								[50000] = {awardpcon = const.PP_JC_MRLJCZ4, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "天蚕精华", num = 4}, {name = "超级玄晶宝箱", num = 1}, {name = "装备宝箱", num = 2}, {name = "灵羽宝箱", num = 2},},},
								[100000] = {awardpcon = const.PP_JC_MRLJCZ5, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "六级灵羽", num = 1}, {name = "十级玄晶宝箱", num = 1}, {name = "经验珠(5000万)", num = 1}, {name = "青龙丹", num = 1},},},
								[300000] = {awardpcon = const.PP_JC_MRLJCZ6, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "七级灵羽", num = 1}, {name = "十级玄晶宝箱", num = 1}, {name = "经验珠(5000万)", num = 2}, {name = "王者徽记", num = 5},},},
								[500000] = {awardpcon = const.PP_JC_MRLJCZ7, nBagBlack = 4, award = {{name = "绑定元宝", num = 5000}, {name = "八级灵羽", num = 1}, {name = "十级玄晶宝箱", num = 1}, {name = "经验珠(5000万)", num = 2}, {name = "王者徽记", num = 10},},},
							},
					XuanJing = {[5000] = {awardpcon = const.PP_37BAIFU_MRXFLJ1, nBagBlack = 2, award = {{name = "小型玄晶宝箱", num = 2},},},
								[10000] = {awardpcon = const.PP_37BAIFU_MRXFLJ2, nBagBlack = 4, award = {{name = "小型玄晶宝箱", num = 4},},},
								[30000] = {awardpcon = const.PP_37BAIFU_MRXFLJ3, nBagBlack = 2, award = {{name = "中型玄晶宝箱", num = 2},},},
								[50000] = {awardpcon = const.PP_37BAIFU_MRXFLJ4, nBagBlack = 4, award = {{name = "中型玄晶宝箱", num = 4},},},
								[100000] = {awardpcon = const.PP_37BAIFU_MRXFLJ5, nBagBlack = 2, award = {{name = "大型玄晶宝箱", num = 2},},},
								[300000] = {awardpcon = const.PP_37BAIFU_MRXFLJ6, nBagBlack = 4, award = {{name = "大型玄晶宝箱", num = 4},},},
								[500000] = {awardpcon = const.PP_37BAIFU_MRXFLJ7, nBagBlack = 2, award = {{name = "超级玄晶宝箱", num = 2},},},
							},
					}		--通用充值/消费豪礼奖励表

function EchoMRXuanJingLB(player, szActivity)
	reset_player_mrczxflj_info(player)
	player:echo([[            <font color="#FFFF00">]]..tZCXFHLText[szActivity].szName..[[</font>
----------------------------------------
活动时间: <font color="#FFff00">]]..tZCXFHLText[szActivity].start..[[-]]..tZCXFHLText[szActivity].over..[[</font>
----------------------------------------
活动内容: <font color="#FFff00">活动时间内，每日]]..tZCXFHLText[szActivity].czxfType..[[达到指定的金额，将会获得一份丰厚的礼包！</font>
----------------------------------------
活动时间内每日]]..tZCXFHLText[szActivity].czxfType..[[累计达到：
----------------------------------------<font color="#FFaa00">
  <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[5000]..[[">5000元宝</a>：<font color="#ee00ee">小型玄晶宝箱</font>(5-7 级玄晶)*2
 <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[10000]..[[">10000元宝</a>：<font color="#ee00ee">小型玄晶宝箱</font>(5-7 级玄晶)*4
 <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[30000]..[[">30000元宝</a>：<font color="#ee00ee">中型玄晶宝箱</font>(6-8 级玄晶)*2
 <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[50000]..[[">50000元宝</a>：<font color="#ee00ee">中型玄晶宝箱</font>(6-8 级玄晶)*4
<a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[100000]..[[">100000元宝</a>：<font color="#ee00ee">大型玄晶宝箱</font>(7-9 级玄晶)*2
<a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[300000]..[[">300000元宝</a>：<font color="#ee00ee">大型玄晶宝箱</font>(7-9 级玄晶)*4
<a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[500000]..[[">500000元宝</a>：<font color="#ee00ee">超级玄晶宝箱</font>(8-10级玄晶)*2</font>
----------------------------------------
活动说明：<font color="#FF0000">该活动可与精彩活动中每日累计]]..tZCXFHLText[szActivity].czxfType..[[活动叠加！</font>
----------------------------------------
您今日已]]..tZCXFHLText[szActivity].czxfType..[[: <font color="#FFaa00">]]..util.ppn(player,tZCXFHLText[szActivity].awardpcon)..[[ 元宝</font>
----------------------------------------
                              <a href="event:talk_]]..tZCXFHLText[szActivity].funcMain..[[">返回上页</a>
]]);
end

function EchoZCXFHLMain(player, szActivity)		----通用充值/消费豪礼主页
	reset_player_mrczxflj_info(player)
	player:echo([[            <font color="#FFFF00">]]..tZCXFHLText[szActivity].szName..[[</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tZCXFHLText[szActivity].start..[[-]]..tZCXFHLText[szActivity].over..[[</font>
活动内容：<font color="#FFff00">活动时间内，每日]]..tZCXFHLText[szActivity].czxfType..[[达到指定的金额，将会获得一份丰厚的礼包！</font>
 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[5000元宝礼包</font>        <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[5000][1]..[[">领取礼包</a>

 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[10000元宝礼包</font>       <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[10000][1]..[[">领取礼包</a>

 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[30000元宝礼包</font>       <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[30000][1]..[[">领取礼包</a>

 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[50000元宝礼包</font>       <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[50000][1]..[[">领取礼包</a>

 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[100000元宝礼包</font>      <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[100000][1]..[[">领取礼包</a>

 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[300000元宝礼包</font>      <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[300000][1]..[[">领取礼包</a>

 <font color="#FFaa00">每日]]..tZCXFHLText[szActivity].czxfType..[[500000元宝礼包</font>      <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[500000][1]..[[">领取礼包</a>
----------------------------------------
您今日已]]..tZCXFHLText[szActivity].czxfType..[[：<font color="#FFaa00">]]..util.ppn(player,tZCXFHLText[szActivity].awardpcon)..[[ 元宝</font>
温馨提示：<font color="#FF0000">该活动不与精彩活动中同类活动叠加，请慎重选择奖励！</font>
                             <a href="event:talk_]]..tZCXFHLText[szActivity].funcMain..[[">返回首页</a>]])
end

function EchoZCXFHL(player, szActivity, AwardTable, key)		--通用充值/消费豪礼奖励页面
	reset_player_mrczxflj_info(player)
	local szText = ""
	for k,v in pairs(tZCXFHLAward[AwardTable][key].award) do 
		szText = szText.."##"..v.name.."##   *"..v.num.."\n\n"
	end
	player:echo([[            <font color="#FFFF00">]]..tZCXFHLText[szActivity].szName..[[</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tZCXFHLText[szActivity].start..[[-]]..tZCXFHLText[szActivity].over..[[</font>
活动内容：<font color="#FFff00">活动时间内每日累计]]..tZCXFHLText[szActivity].czxfType..key..[[元宝即可领取[]]..key..[[元宝礼包]</font>
礼包内容：<font color="#FFaa00">
]]..szText..[[</font>您今日已]]..tZCXFHLText[szActivity].czxfType..[[：<font color="#FFaa00">]]..util.ppn(player,tZCXFHLText[szActivity].awardpcon)..[[ 元宝</font>
温馨提示：<font color="#FF0000">该活动不与精彩活动中同类活动叠加，请慎重选择奖励！</font>
----------------------------------------
      <a href="event:talk_]]..tZCXFHLText[szActivity].tAcceptFunc[key][2]..[[">领取礼包</a>           <a href="event:talk_]]..tZCXFHLText[szActivity].funcMain2..[[">返回上页</a>]]) 
end

function CZXFLBLQ(player, szActivity, AwardTable, key)
	reset_player_mrczxflj_info(player)
	if not activity.isCZXFHLOpen(szActivity) then   --判断活动是否开启的函数,每次更改activity中活动日期
		player:alert(1,1,"非活动时间内，无法领取哦!")
		return
	end
	if util.ppn(player,tZCXFHLText[szActivity].awardpcon) < key then
		player:alert(1,1,"您"..tZCXFHLText[szActivity].czxfType.."金额不足"..key.."元宝，无法领取")
		return
	end
	if util.ppn(player,tZCXFHLAward[AwardTable][key].awardpcon) == today() then
		player:alert(1,1,"您今天已领取过该礼包");
		return
	end
	if player:num_bag_black() < tZCXFHLAward[AwardTable][key].nBagBlack then
		player:alert(1,1,"您的背包空间不足"..tZCXFHLAward[AwardTable][key].nBagBlack.."格，无法领取")
		return
	end
	player:set_param(tZCXFHLAward[AwardTable][key].awardpcon,today());
	player:alert(11,1,"成功领取[每日"..tZCXFHLText[szActivity].czxfType..key.."礼包]!");
	for i = 1, #tZCXFHLAward[AwardTable][key].award do
		player:add_item(tZCXFHLAward[AwardTable][key].award[i].name,tZCXFHLAward[AwardTable][key].award[i].num,1);
		player:alert(10, 0, tZCXFHLAward[AwardTable][key].award[i].name.." * "..tZCXFHLAward[AwardTable][key].award[i].num);	
	end
	return
end

function EchoXunBaoFanLi(player, szActivity)
	local tXunBaoFLText = {May37BaiFu = {szName = "百服寻宝积分返利", name = "道具", start = "更新后", over = "8月23日", nMax = 50, szAward = "守护资质丹", nJiFen = "20", funcAccept = "May37BaiFu51", funcMain = "May37BaiFu"}, 
						   Day14th = {szName = "月末寻宝积分返利", name = "高级宝石", start = "更新后", over = "10月25日", nMax = 10, szAward = "八级宝石", nJiFen = "50", funcAccept = "May37BaiFu51", funcMain = "Day14th"}, 
						}
	reset_player_xbfl_info(player)
	player:echo([[            <font color="#FFFF00">]]..tXunBaoFLText[szActivity].szName..[[</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFFF00">]]..tXunBaoFLText[szActivity].start..[[-]]..tXunBaoFLText[szActivity].over..[[</font>
---------------------------------------
活动介绍：<font color="#FFFF00">活动期间，玩家可使用寻宝积分兑换]]..tXunBaoFLText[szActivity].name..[[。

<font color="#FFaa00">##]]..tXunBaoFLText[szActivity].szAward..[[## = ]]..tXunBaoFLText[szActivity].nJiFen..[[寻宝积分！</font>
         
                           <a href="event:talk_]]..tXunBaoFLText[szActivity].funcAccept..[[">点击此处兑换</a></font>

---------------------------------------
当前共有寻宝积分：<font color="#bbcc00">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[ </font>点
当前剩余兑换次数：<font color="#ee00ee">]]..(tXunBaoFLText[szActivity].nMax-util.ppn(player,const.PP_37BAIFU_XUNBAODH))..[[ </font>次
---------------------------------------
活动说明:<font color="#FF0000">每人每天最多可兑换[<font color="#FFFF00">]]..tXunBaoFLText[szActivity].nMax..[[</font>]次！</font>
---------------------------------------
                               <a href="event:talk_]]..tXunBaoFLText[szActivity].funcMain..[[">返回首页</a>
]]);
end

function XunBaoJiFenFLLQ(player, szActivity, nJiFen, nMax, szAward, nNum, nBagBlack, isBind)
	if not activity.isXunBaoFanLiOpen() then
		player:alert(1,1,"对不起，非活动时间，无法兑换！")
		return
	end
	reset_player_xbfl_info(player)
	if util.ppn(player,const.PP_37BAIFU_XUNBAODH) >= nMax then
		player:alert(1,1,"每人每天最多可兑换["..nMax.."]次！")
		return
	end
	if util.ppn(player,const.PP_XUNBAOJIFEN) < nJiFen then
		player:alert(1,1,"寻宝积分不足"..nJiFen.."，无法兑换哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(1,1,"包裹不足"..nBagBlack.."格，请清理后再来领取。")
		return
	end
	player:set_param(const.PP_XUNBAOJIFEN,util.ppn(player,const.PP_XUNBAOJIFEN)-nJiFen)
	player:set_param(const.PP_37BAIFU_XUNBAODH,util.ppn(player,const.PP_37BAIFU_XUNBAODH)+1)
	player:add_item(szAward, nNum, isBind)
	server.log_count(3,"寻宝积分兑换"..szActivity..szAward,nNum);
	player:alert(1,1,"成功兑换["..szAward.."]*"..nNum.."！当前剩余寻宝积分："..util.ppn(player,const.PP_XUNBAOJIFEN))
end

function reset_player_xbfl_info(player)
	if activity.isXunBaoFanLiOpen() then
		if util.ppn(player,const.PP_37BAIFU_XUNBAODATE) ~= today() then
			player:set_param(const.PP_37BAIFU_XUNBAODATE,today());
			player:set_param(const.PP_37BAIFU_XUNBAODH,0);
		else
			--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
		end
	end
end

function EchoXuanJingHeCheng(player, szActivity)
	local tText = {EasterDay = {szName = "复活节玄晶合成盛典", start = "4月19日", over = "4月25日", nRate = 20, funcMain = "duanwujie"}, 
					XiaZhi = {szName = "立秋玄晶合成盛典", start = "更新后", over = "8月12日", nRate = 20, funcMain = "XiaZhi"}, 
				}
	player:echo([[            <font color="#FFFF00">]]..tText[szActivity].szName..[[</font>
----------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tText[szActivity].start..[[-]]..tText[szActivity].over..[[</font>
----------------------------------------
活动内容：<font color="#FFFF00">活动期间内，所有服务器玄晶合成几率增加[<font color="#FF0000">]]..tText[szActivity].nRate..[[%</font>]！</font>

          <font color="#FFaa00">机不可失,可别错过哦!</font>

----------------------------------------
活动说明：<font color="#FF0000">该活动不与精彩活动中同类活动效果叠加！</font>
----------------------------------------
                                <a href="event:talk_]]..tText[szActivity].funcMain..[[">返回首页</a>
]]);
end

function onTalkPetJinJie(player)
	reset_player_petjj_info(player)
	local tText = {szName = "白色情人节守护进化折扣", start = "更新后", over = "3月15日", nOff = "八折", nTimes = 20, funcMain = "Day14th",}
	player:echo([[            <font color="#FFFF00">]]..tText.szName..[[</font>
---------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tText.start..[[-<font color="#FF0000">]]..tText.over..[[</font></font>
---------------------------------------
活动内容: <font color="#FFff00">活动期间内，所有服务器守护特惠进阶（<font color="#FF0000">仅限一键进阶，商城内守护进化丹不打折</font>）！</font><font color="#FFaa00">每日最多[<font color="#FF0000">]]..tText.nTimes..[[</font>]次。</font>


---------------------------------------
<font color="#FFaa00">今日剩余特惠进阶次数：<font color="#ee00ee">]]..util.ppn(player,const.PP_PETJINJIE_TIMES)..[[</font> 次</font>
---------------------------------------
活动说明：<font color="#FFff00">所有玩家都可享受<font color="#ee00ee">]]..tText.nOff..[[</font>优惠！</font>
---------------------------------------
                               <a href="event:talk_]]..tText.funcMain..[[">返回上页</a>
]]);
end

function reset_player_petjj_info(player)
	if activity.isPetJinHuaOpen() then
		if util.ppn(player,const.PP_PETJINJIE_DATE) ~= today() then
			player:set_param(const.PP_PETJINJIE_DATE,today());
			player:set_param(const.PP_PETJINJIE_TIMES,20);
		else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
		end
	else
		player:set_param(const.PP_PETJINJIE_TIMES,0);
	end
end

function onTalkZiZhiTiSheng(player)
	local tText = {szName = "白色情人节守护资质盛典", start = "更新后", over = "3月18日", nTimes = 1, funcMain = "Day14th",}
	player:echo([[            <font color="#FFFF00">]]..tText.szName..[[</font>
---------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tText.start..[[-]]..tText.over..[[</font>
---------------------------------------
活动内容: <font color="#FFff00">活动时间内，玩家使用<font color="#00FF00">守护资质丹</font>可获得祝福值效果增加[<font color="#ee00ee">]]..tText.nTimes..[[</font>]倍！</font>


---------------------------------------
                               <a href="event:talk_]]..tText.funcMain..[[">返回上页</a>
]]);
end

---------------------------------------------------------------------------------------------------------------------
function onTalkmonthPt(player)
player:echo([[---------------------------------------
<font color="#FFFF00">     经过一年的风风雨雨,武尊迎来了千服
盛典,为感谢您一如既往的支持与厚爱,特为
您准备了以下千服独享叠加活动!</font>
---------------------------------------
          1.<a href="event:talk_qfsd0">千服盛典专属武器</a>
---------------------------------------
          2.<a href="event:talk_qfsd1">千服充值叠加返利</a>
---------------------------------------
          3.<a href="event:talk_qfsd2">全民抽奖至尊神器</a>
---------------------------------------
          4.<a href="event:talk_qfsd3">千服盛典冠名活动</a>
---------------------------------------]]);
end

function onTalkqfsd0(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">千服盛典专属武器</font>
--------------------------------------
活动对象: <font color="#FFaa00">全服所有玩家</font>
--------------------------------------
领取时间: <font color="#FFff00">更新后-1月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动期间游戏内<font color="#FFFF00">寻宝系统</font>将有
几率抽出千服专属武器!</font>
--------------------------------------
##千服神兵·武威(千服专属)##
<font color="#00FF00">千服盛典专属战士武器</font>
--------------------------------------
##千服神兵·烈焰(千服专属)##
<font color="#00FF00">千服盛典专属法师武器</font>
--------------------------------------
##千服神兵·无极(千服专属)##
<font color="#00FF00">千服盛典专属道士武器</font>
--------------------------------------

                         <a href="event:talk_monthPt">返回上页</a>
--------------------------------------]]);
end


function onTalkqfsd1(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">千服充值叠加返利</font>
--------------------------------------
活动对象: <font color="#FFaa00">全服所有玩家</font>
--------------------------------------
领取时间: <font color="#FFff00">1月18日-1月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动期间每笔充值都将获得10%
的元宝返利(仅庆祝千服开启,机会难得)!</font>
--------------------------------------
当前可领取充值返利: ]]..util.ppn(player,const.PP_QIANFU_FANLI)..[[

--------------------------------------
          <a href="event:talk_lqqffl">领取返利</a>           <a href="event:talk_monthPt">返回上页</a>
--------------------------------------]]);
end

function onTalklqqffl(player)
	if ymd() <= 20140120 then
		if util.ppn(player,const.PP_QIANFU_FANLI) > 0 then
			player:add_vcoin_best_enable(util.ppn(player,const.PP_QIANFU_FANLI));
			player:alert(11,1,"恭喜您成功领取[千服充值返利]");
			player:alert(11,0,"获得元宝:<font color='#ff0000'>"..util.ppn(player,const.PP_QIANFU_FANLI).."</font>");
			player:set_param(const.PP_QIANFU_FANLI,0);
		else
			player:alert(1,1,"您当前没有任何返利,领取失败!")
		end
	else
		player:alert(1,1,"当前不在活动时间!");
	end
	onTalkqfsd1(player);
end


function onTalkqfsd2(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">全民抽奖至尊神器</font>
--------------------------------------
活动对象: <font color="#FFaa00">全服所有玩家</font>
--------------------------------------
领取时间: <font color="#FFff00">更新后-1月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动期间累计充值满10000元宝
即可获得一次37wan官网抽奖机会!</font>
--------------------------------------
          <font color="#00FF00">详情见武尊37wan官网</font>
--------------------------------------
                         <a href="event:talk_monthPt">返回上页</a>
--------------------------------------]]);
end


function onTalkqfsd3(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">千服盛典冠名活动</font>
--------------------------------------
活动对象: <font color="#FFaa00">全服所有玩家</font>
--------------------------------------
活动范围: <font color="#FFaa00">唯武独尊126服(双线1000服)</font>
--------------------------------------
领取时间: <font color="#FFff00">开服后7日</font>
--------------------------------------
活动内容: <font color="#FFff00">以7天为限千服充值排名第一的玩家可获得千服服务器冠名权!</font>
--------------------------------------
          <font color="#00FF00">详情见武尊37wan官网</font>
--------------------------------------
                         <a href="event:talk_monthPt">返回上页</a>
--------------------------------------]]);
end

--------------------------------------------------------------------------------------------------------



function onTalkduanwujie(player)
	if util.ppn(player,const.PP_ACTIVITY_CZHI_CZ) <= 16 then   --20140419 复活节
		player:set_param(const.PP_ACTIVITY_CZHI_LJ,0);
		player:set_param(const.PP_ACTIVITY_CZHI_CZ,17);
	end
player:echo([[<font color="#FFFF00">    所谓的王者，是在大家最危难时出现的英雄，而我们的王者即将归来！复活圣夜，为沙城而战！</font>
---------------------------------------
       <a href="event:talk_sdhd1">活动一、复活节回馈豪华礼包</a>
---------------------------------------
       <a href="event:talk_sdhd2">活动二、复活节双倍感恩回馈</a>
---------------------------------------
       <a href="event:talk_sdhd3">活动三、复活节每日充值返利</a>
---------------------------------------
       <a href="event:talk_sdhd4">活动四、复活节充值送第一腕</a>
---------------------------------------
       <a href="event:talk_sdhd5">活动五、复活节升级超值抢购</a>
---------------------------------------
       <a href="event:talk_sdhd6">活动六、复活节玄晶合成盛典</a>
---------------------------------------
       <a href="event:talk_sdhd7">活动七、复活节玄晶品阶排名</a>
---------------------------------------
       <a href="event:talk_sdhd6ttt">活动八、复活节BOSS击杀排名</a>
---------------------------------------
       <a href="event:talk_sdhd9">活动九、复活节商城限时促销</a>
---------------------------------------
       <a href="event:talk_sdhd10">活动十、复活节充值豪华礼包</a>
---------------------------------------]]);
end

function onTalksdhd1(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节回馈豪华礼包</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有50级以上玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
<p>##四倍宝典##*1</p>
<p>##聚灵珠##*1</p>
<p>##魂石令牌(500)##*1</p>
<p>##坐骑经验丹(大)##*1</p>
<p>##荣誉令牌(10000)##*1</p>
<p>##绑定元宝##*2000</p>
<p>##绑定金币##*500000</p>
--------------------------------------
 <a href="event:talk_qmhklq1">点击此处领取礼包</a>            <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end
function onTalkqmhklq1(player)
	if activity.isBaifuSjieOpen() then
		if util.ppn(player,const.PP_BAIFUHAOHUALB) <= 41 then  -- 20140419 复活节
			if player:get_level()>=50 then
				if player:num_bag_black() >= 5 then
					player:set_param(const.PP_BAIFUHAOHUALB,42);
					player:add_item("四倍宝典",1,1);
					player:add_item("聚灵珠",1,1);
					player:add_item("魂石令牌(500)",1,1);
					player:add_item("坐骑经验丹(大)",1,1);
					player:add_item("荣誉令牌(10000)",1,1);
					player:add_vcoin_bind(2000);
					player:add_gamemoney_bind(500000);
					player:alert(1,1,"恭喜您,成功领取了复活节回馈豪华礼包!")
				else
					player:alert(1,1,"您的包裹数量不足5格，请清理下背包再来领取哦!")
				end
			else
				player:alert(1,1,"需要您的等级达到50级以上，才可以领取该礼包哦!")
			end
		else
			player:alert(1,1,"您已经领取过该礼包了!")
		end
	else
		player:alert(1,1,"当前不在活动时间!");
	end
	onTalkduanwujie(player);
end

function onTalksdhd2(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节双倍感恩回馈</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月21日</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">在活动时间内,所有服务器都将
          开放双倍打怪经验活动!</font>
          
          <font color="#FFaa00">活动期间,杀怪经验增加1倍!</font>
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end

function onTalksdhd3(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节每日充值返利</font>
--------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
--------------------------------------
领取时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内当日充值只需达到<font color="#ee00ee">[10000元宝]</font>即可领取：</font>

<p>##四级生命玄晶##</p>
<p>##四级物防玄晶##</p>
<p>##四级魔防玄晶##</p>
--------------------------------------
活动说明: <font color="#FFaa00">该活动可与每日首充礼包叠加</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
         		 <a href="event:talk_lqym">领取返利</a>    <a href="event:talk_duanwujie">返回上页</a>
--------------------------------------]]);
end
function onTalklqym(player)
	if  activity.isBaifuSjieOpen() then
		if util.ppn(player,const.PP_DAILY_CONGZI) >= 10000 then
			if util.ppn(player,const.PP_BAIFU_FANLI) ~= today() then
				player:set_param(const.PP_BAIFU_FANLI,today());
				player:add_item("四级生命玄晶",1,0);
				player:add_item("四级物防玄晶",1,0);
				player:add_item("四级魔防玄晶",1,0);
				player:alert(11,1,"恭喜您成功领取[每日充值返利]");
			else
				player:alert(1,1,"今日的充值返利您已经领取了哦!")
			end
		else
			player:alert(1,1,"您今日充值元宝未达到10000元宝，无法领取充值返利哦!")
		end
	else
		player:alert(1,1,"当前不在活动时间!");
	end
	onTalkduanwujie(player);
end

 function onTalksdhd4(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值送第一腕</font>
--------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内充值达到2000000元
          宝即可领取[<font color="#ee00ee">镇北玄武王腕卷</font>]!</font>
          <font color="#FFaa00">可以将[骠骑将军护腕]升级为
          [<font color="#ee00ee">镇北玄武王腕</font>]</font>

          <font color="#ff0000">限量第一神腕,可别错过哦!</font>
--------------------------------------
<p>##镇北玄武王腕##</p>
--------------------------------------
您已充值: ]]..util.ppn(player,const.PP_ACTIVITY_CZHI_LJ)..[[元宝
--------------------------------------
         		 <a href="event:talk_bflqczdysk">领取卷轴</a>    <a href="event:talk_duanwujie">返回上页</a>
--------------------------------------]]);
end
function onTalkbflqczdysk(player)
	if util.ppn(player,const.PP_ACTIVITY_CZHI_LJ) >= 2000000 then
		if util.ppn(player,const.PP_0802CHONGZHILB) <= 42 then ---20140419 复活节
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_0802CHONGZHILB,43);
				player:add_item("镇北玄武王腕卷",1,1);
				player:alert(11,1,"恭喜您,成功领取[<font color='#ee00ee'>镇北玄武王腕卷</font>]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
			end
		else
			player:alert(1,1,"您已经领取过了哦!")
		end
	else
		player:alert(1,1,"您活动期间内的充值的元宝不足2000000,无法领取!")
	end
	onTalkduanwujie(player);
end

function onTalksdhd5(player)
	player:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">金秋升级超值抢购</font></b>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-10月12日</font>
--------------------------------------
活动说明: <font color="#FFff00">活动时间内,每位玩家每天均可在本处购买以下商品,每种限制购买3次</font>
--------------------------------------
##经验珠(5000万)##         <a href="event:talk_bfbuy1">点击购买</a>
原价:<font color="#FF0000">2500元宝</font>      现价:<font color="#FFaa00">990元宝</font>
--------------------------------------
##经验珠(2000万)##         <a href="event:talk_bfbuy2">点击购买</a>
原价:<font color="#FF0000">1000元宝</font>      现价:<font color="#FFaa00">400元宝</font>
--------------------------------------
				  <a href="event:talk_Day14th">返回首页</a>
--------------------------------------
]]);
end
function onTalkbfbuy1(player)
	if activity.isBaifuSjieOpen() then
		if util.ppn(player,const.PP_JINGYANDAN5000) <= 2 then
			if player:get_vcoin() >= 990 then
				if player:num_bag_black() >= 1 then
					player:set_param(const.PP_JINGYANDAN5000,util.ppn(player,const.PP_JINGYANDAN5000)+1);
					player:sub_vcoin(990,"shangcheng");
					player:add_item("经验珠(5000万)",1,1);
					player:alert(11,1,"成功使用[990]元宝购买[经验珠(5000万)]!");
				else
					player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
				end
			else
				player:alert(11,1,"您的元宝不足[990],无法购买[经验珠(5000万)]!");
			end
		else
			player:alert(11,1,"每人每天最多只可购买3颗[经验珠(5000万)]!");
		end
	else
		player:alert(1,1,"该超值抢购物品只可在9月22日-9月28日购买!");
	end
	onTalksdhd5(player);
end
function onTalkbfbuy2(player) 
	if activity.isBaifuSjieOpen() then
		if util.ppn(player,const.PP_JINGYANDAN2000) <= 2 then
			if player:get_vcoin() >= 400 then
				if player:num_bag_black() >= 1 then
					player:set_param(const.PP_JINGYANDAN2000,util.ppn(player,const.PP_JINGYANDAN2000)+1);
					player:sub_vcoin(400,"shangcheng");
					player:add_item("经验珠(2000万)",1,1);
					player:alert(11,1,"成功使用[400]元宝购买[经验珠(2000万)]!");
				else
					player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
				end
			else
				player:alert(11,1,"您的元宝不足[400],无法购买[经验珠(2000万)]!");
			end
		else
			player:alert(11,1,"每人每天最多只可购买3颗[经验珠(2000万)]!");
		end
	else
	player:alert(1,1,"该物品只可在9月22日-9月28日购买!");
	end
	onTalksdhd5(player);
end

function onTalksdhd6(player)	EchoXuanJingHeCheng(player, "EasterDay")	end

function onTalksdhd7(player)
	player:echo([[          <font color="#FFFF00">复活节玄晶品阶排名</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">截止2014年4月25日23:59，单服已装备玄晶品阶之和排名前十的玩家可获得超值奖励！</font>
--------------------------------------
排名奖励:

<p>##九级宝石##    <font color="#FFff00">第一名</font></p>
<p>##八级宝石##    <font color="#FFff00">第二名</font></p>
<p>##七级宝石##    <font color="#FFff00">第三名</font></p>
<p>##六级宝石##    <font color="#FFff00">四~十名</font></p>

           <a href="event:talk_chakan">查看排名</a>        <a href="event:talk_duanwujie">返回首页</a>
]]);
end
function onTalkchakan(player)
	player:echo([[          <font color="#FFFF00">复活节玄晶品阶排名</font>
--------------------------------------
玄晶总品阶数排名: 

 <font color="#FFaa00">第一名:  ]]..(server.get_var("SvrLvXjName1")).."  总品阶 "..(server.get_var("SvrLvXjLv1"))..[[</br>
 第二名:  ]]..(server.get_var("SvrLvXjName2")).."  总品阶 "..(server.get_var("SvrLvXjLv2"))..[[</br>
 第三名:  ]]..(server.get_var("SvrLvXjName3")).."  总品阶 "..(server.get_var("SvrLvXjLv3"))..[[</br>
 第四名:  ]]..(server.get_var("SvrLvXjName4")).."  总品阶 "..(server.get_var("SvrLvXjLv4"))..[[</br>
 第五名:  ]]..(server.get_var("SvrLvXjName5")).."  总品阶 "..(server.get_var("SvrLvXjLv5"))..[[</br>
 第六名:  ]]..(server.get_var("SvrLvXjName6")).."  总品阶 "..(server.get_var("SvrLvXjLv6"))..[[</br>
 第七名:  ]]..(server.get_var("SvrLvXjName7")).."  总品阶 "..(server.get_var("SvrLvXjLv7"))..[[</br>
 第八名:  ]]..(server.get_var("SvrLvXjName8")).."  总品阶 "..(server.get_var("SvrLvXjLv8"))..[[</br>
 第九名:  ]]..(server.get_var("SvrLvXjName9")).."  总品阶 "..(server.get_var("SvrLvXjLv9"))..[[</br>
 第十名:  ]]..(server.get_var("SvrLvXjName10")).."  总品阶 "..(server.get_var("SvrLvXjLv10"))..[[</br></font>

 --------------------------------------
 <font color="#FF0000">     注: 总品阶大于120才能上榜</font>
 --------------------------------------
 <a href="event:talk_lvxjjl">在榜玩家领取奖励</a>           <a href="event:talk_duanwujie">返回首页</a>
]]);
end
local xjlv_jl={"九级宝石","八级宝石","七级宝石","六级宝石","六级宝石","六级宝石","六级宝石","六级宝石","六级宝石","六级宝石"}

function onTalklvxjjl(player)
	if  activity.isBaifuSjieOpen() then
		--if check_levelrk_timelt() then
			player:alert(11,1,"活动尚未结束!");
	else
		for u = 1,10 do
			if player:get_name() == server.get_var("SvrLvXjName"..u) then
				if util.svn("SvrLvXjGot"..u) == 0 then
					server.set_var("SvrLvXjGot"..u,1);
					player:add_item(xjlv_jl[u],1,1);
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
          
--玄晶镶嵌总品阶排名问题 同一等级 先后顺序不固定
function levelxj_Recharge_process(player,xjlv)
	if xjlv >= 120 then
		local a = player:get_name();
		for i = 1,11 do
			if a == server.get_var("SvrLvXjName"..i) then
				if xjlv >= tonumber(server.get_var("SvrLvXjLv"..i)) then
					server.set_var("SvrLvXjName"..i,a)
					server.set_var("SvrLvXjLv"..i,xjlv);
					levelxj_Recharge_chuli();
					return;
				end
			end
		end
		if xjlv > util.svn("SvrLvXjLv11") then
			server.set_var("SvrLvXjName11",a);
			server.set_var("SvrLvXjLv11",xjlv);
			levelxj_Recharge_chuli();
		end
	end
end

function levelxj_Recharge_chuli()
	local xjlvdata = {};
	for u = 1,11 do
		table.insert(xjlvdata,{
			name = server.get_var("SvrLvXjName"..u),
			num = util.svn("SvrLvXjLv"..u),
		})
	end
	function lvCompare(q,w) 
		if q and w then
			if tonumber(w.num) < tonumber(q.num) then
				return true;
			end
		end
		return false;
	end
	table.sort(xjlvdata,lvCompare);
	for idx,value in ipairs(xjlvdata) do
		server.set_var("SvrLvXjName"..idx,value.name);
		server.set_var("SvrLvXjLv"..idx,value.num);
	end
end

function freshLvRankInfo()
	for u = 1,11 do
		local name = server.get_var("SvrLvRankName"..u);
		local ranker = server.find_player(name);
		if ranker then
			levelxj_Recharge_process(ranker);
		end
	end
end


function onTalkqianghua1(player)
	if util.ppn(player,const.PP_BSQIANGHUA7JI) >= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_BSQIANGHUA7JI,util.ppn(player,const.PP_BSQIANGHUA7JI)-1);
			player:add_item("五级宝石",1,1);
			player:alert(11,1,"成功领取[强化七级礼包]");
			player:alert(11,0,"获得:五级宝石*1");
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkqianghua2(player)
	if util.ppn(player,const.PP_BSQIANGHUA8JI) >= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_BSQIANGHUA8JI,util.ppn(player,const.PP_BSQIANGHUA8JI)-1);
			player:add_item("六级宝石",1,1);
			player:alert(11,1,"成功领取[强化八级礼包]");
			player:alert(11,0,"获得:六级宝石*1");
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkqianghua3(player)
	if util.ppn(player,const.PP_BSQIANGHUA9JI) >= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_BSQIANGHUA9JI,util.ppn(player,const.PP_BSQIANGHUA9JI)-1);
			player:add_item("七级宝石",1,1);
			player:alert(11,1,"成功领取[强化九级礼包]");
			player:alert(11,0,"获得:七级宝石*1");
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkqianghua4(player)
	if util.ppn(player,const.PP_BSQIANGHUA10JI) >= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_BSQIANGHUA10JI,util.ppn(player,const.PP_BSQIANGHUA10JI)-1);
			player:add_item("八级宝石",1,1);
			player:alert(11,1,"成功领取[强化十级礼包]");
			player:alert(11,0,"获得:八级宝石*1");
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkqianghua5(player)
	if util.ppn(player,const.PP_BSQIANGHUA11JI) >= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_BSQIANGHUA11JI,util.ppn(player,const.PP_BSQIANGHUA11JI)-1);
			player:add_item("九级宝石",1,1);
			player:alert(11,1,"成功领取[强化十一级礼包]");
			player:alert(11,0,"获得:九级宝石*1");
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkqianghua6(player)
	if util.ppn(player,const.PP_BSQIANGHUA12JI) >= 1 then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_BSQIANGHUA12JI,util.ppn(player,const.PP_BSQIANGHUA12JI)-1);
			player:add_item("十级宝石",1,1);
			player:alert(11,1,"成功领取[强化十二级礼包]");
			player:alert(11,0,"获得:十级宝石*1");
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您可领取的次数为0,无法领取!")
	end
	onTalksdhd7(player);
end

function onTalksdhd9(player)
	player:echo([[--------------------------------------
		  <font color="#FFFF00">复活节商城限时促销</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动说明：<font color="#FFff00">在限定时间内部分商城物品或非商城物品打折出售机会不多，赶紧购买吧！</font>
--------------------------------------
##六级生命玄晶##         <a href="event:talk_xjbuy1">点击购买</a>
原价:<font color="#FF0000">7920元宝</font>      现价:<font color="#FFaa00">3960元宝</font>
--------------------------------------
##六级攻击玄晶##         <a href="event:talk_xjbuy2">点击购买</a>
原价:<font color="#FF0000">7920元宝</font>      现价:<font color="#FFaa00">3960元宝</font>
--------------------------------------
##六级物防玄晶##         <a href="event:talk_xjbuy3">点击购买</a>
原价:<font color="#FF0000">7920元宝</font>      现价:<font color="#FFaa00">3960元宝</font>
--------------------------------------
##六级魔防玄晶##         <a href="event:talk_xjbuy4">点击购买</a>
原价:<font color="#FF0000">7920元宝</font>      现价:<font color="#FFaa00">3960元宝</font>
--------------------------------------

		<a href="event:talk_duanwujie">返回首页</a>          1 <a href="event:talk_fuhuojiebuy2">2</a> <a href="event:talk_fuhuojiebuy3">3</a>]])
end
function onTalkfuhuojiebuy2(player)
	player:echo([[--------------------------------------
		  <font color="#FFFF00">复活节商城限时促销</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动说明：<font color="#FFff00">在限定时间内部分商城物品或非商城物品打折出售机会不多，赶紧购买吧！</font>
--------------------------------------
##九级宝石##              <a href="event:talk_xjbuy5">点击购买</a>
原价:<font color="#FF0000">78408元宝</font>     现价:<font color="#FFaa00">39204元宝</font>
--------------------------------------
##幸运神符(30%)##         <a href="event:talk_xjbuy6">点击购买</a>
原价:<font color="#FF0000">1200元宝</font>      现价:<font color="#FFaa00">600元宝</font>
--------------------------------------
##幸运神符(40%)##         <a href="event:talk_xjbuy7">点击购买</a>
原价:<font color="#FF0000">2400元宝</font>      现价:<font color="#FFaa00">1200元宝</font>
--------------------------------------
##幸运神符(50%)##         <a href="event:talk_xjbuy8">点击购买</a>
原价:<font color="#FF0000">4800元宝</font>      现价:<font color="#FFaa00">2400元宝</font>
--------------------------------------

		<a href="event:talk_duanwujie">返回首页</a>          <a href="event:talk_sdhd9">1</a> 2 <a href="event:talk_fuhuojiebuy3">3</a>]])
end
function onTalkfuhuojiebuy3(player)
	player:echo([[--------------------------------------
		  <font color="#FFFF00">复活节商城限时促销</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动说明：<font color="#FFff00">在限定时间内部分商城物品或非商城物品打折出售机会不多，赶紧购买吧！</font>
--------------------------------------
##幸运神符(100%)##     	  <a href="event:talk_xjbuy9">点击购买</a>
原价:<font color="#FF0000">48000元宝</font>      现价:<font color="#FFaa00">24000元宝</font>
--------------------------------------
##中级融合符##            <a href="event:talk_xjbuy10">点击购买</a>
原价:<font color="#FF0000">4685元宝</font>       现价:<font color="#FFaa00">2342元宝</font>
--------------------------------------
##高级融合符##            <a href="event:talk_xjbuy11">点击购买</a>
原价:<font color="#FF0000">16200元宝</font>      现价:<font color="#FFaa00">8100元宝</font>
--------------------------------------
##超级融合符##            <a href="event:talk_xjbuy12">点击购买</a>
原价:<font color="#FF0000">32400元宝</font>      现价:<font color="#FFaa00">16200元宝</font>
--------------------------------------

		<a href="event:talk_duanwujie">返回首页</a>          <a href="event:talk_sdhd9">1</a> <a href="event:talk_fuhuojiebuy2">2</a> 3]])
end
function onTalkxjbuy1(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 3960 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(3960,"fuhuojie9");
				player:add_item("六级生命玄晶",1,0);
				player:alert(11,1,"成功使用[3960]元宝购买[六级生命玄晶]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[3960],无法购买[六级生命玄晶]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalksdhd9(player);
end
function onTalkxjbuy2(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 3960 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(3960,"fuhuojie9");
				player:add_item("六级攻击玄晶",1,0);
				player:alert(11,1,"成功使用[3960]元宝购买[六级攻击玄晶]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[3960],无法购买[六级攻击玄晶]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalksdhd9(player);
end
function onTalkxjbuy3(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 3960 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(3960,"fuhuojie9");
				player:add_item("六级物防玄晶",1,0);
				player:alert(11,1,"成功使用[3960]元宝购买[六级物防玄晶]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[3960],无法购买[六级物防玄晶]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalksdhd9(player);
end
function onTalkxjbuy4(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 3960 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(3960,"fuhuojie9");
				player:add_item("六级魔防玄晶",1,0);
				player:alert(11,1,"成功使用[3960]元宝购买[六级魔防玄晶]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[3960],无法购买[六级魔防玄晶]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalksdhd9(player);
end
function onTalkxjbuy5(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 39204 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(39204,"fuhuojie9");
				player:add_item("九级宝石",1,1);
				player:alert(11,1,"成功使用[39204]元宝购买[九级宝石]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[39204],无法购买[九级宝石]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy2(player);
end
function onTalkxjbuy6(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 600 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(600,"fuhuojie9");
				player:add_item("幸运神符(30%)",1,1);
				player:alert(11,1,"成功使用[600]元宝购买[幸运神符(30%)]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[600],无法购买[幸运神符(30%)]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy2(player);
end
function onTalkxjbuy7(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 1200 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(1200,"fuhuojie9");
				player:add_item("幸运神符(40%)",1,1);
				player:alert(11,1,"成功使用[1200]元宝购买[幸运神符(40%)]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[1200],无法购买[幸运神符(40%)]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy2(player);
end
function onTalkxjbuy8(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 2400 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(2400,"fuhuojie9");
				player:add_item("幸运神符(50%)",1,1);
				player:alert(11,1,"成功使用[2400]元宝购买[幸运神符(50%)]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[2400],无法购买[幸运神符(50%)]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy2(player);
end
function onTalkxjbuy9(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 24000 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(24000,"fuhuojie9");
				player:add_item("幸运神符(100%)",1,1);
				player:alert(11,1,"成功使用[24000]元宝购买[幸运神符(100%)]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[24000],无法购买[幸运神符(100%)]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy3(player);
end
function onTalkxjbuy10(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 2342 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(2342,"fuhuojie9");
				player:add_item("中级融合符",1,1);
				player:alert(11,1,"成功使用[2342]元宝购买[中级融合符]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[2342],无法购买[中级融合符]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy3(player);
end
function onTalkxjbuy11(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 8100 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(8100,"fuhuojie9");
				player:add_item("高级融合符",1,1);
				player:alert(11,1,"成功使用[8100]元宝购买[高级融合符]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[8100],无法购买[高级融合符]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy3(player);
end
function onTalkxjbuy12(player)
	if activity.isBaifuSjieOpen() then
		if player:get_vcoin() >= 16200 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(16200,"fuhuojie9");
				player:add_item("超级融合符",1,1);
				player:alert(11,1,"成功使用[16200]元宝购买[超级融合符]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
			end
		else
			player:alert(11,1,"您的元宝不足[16200],无法购买[超级融合符]!");
		end
	else
		player:alert(1,1,"该折扣物品只可在4月19日-4月25日购买!");
	end
	onTalkfuhuojiebuy3(player);
end

function onTalksdhd10(player)
    reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
<font color="#FFaa00">每日累计充值5000元宝礼包</font>     <a href="event:talk_bflqlb50">领取礼包</a>
--------------------------------------
<font color="#FFaa00">每日累计充值10000元宝礼包</font>    <a href="event:talk_bflqlb100">领取礼包</a>
--------------------------------------
<font color="#FFaa00">每日累计充值30000元宝礼包</font>    <a href="event:talk_bflqlb300">领取礼包</a>
--------------------------------------
<font color="#FFaa00">每日累计充值50000元宝礼包</font>    <a href="event:talk_bflqlb500">领取礼包</a>
--------------------------------------
<font color="#FFaa00">每日累计充值100000元宝礼包</font>   <a href="event:talk_bflqlb1000">领取礼包</a>
--------------------------------------
<font color="#FFaa00">每日累计充值300000元宝礼包</font>   <a href="event:talk_bflqlb3000">领取礼包</a>
--------------------------------------
<font color="#FFaa00">每日累计充值500000元宝礼包</font>   <a href="event:talk_bflqlb5000">领取礼包</a>
          </font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end

function onTalkbflqlb50(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值5000元宝
          即可领取[充值5000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*2000
          <font color="#ee00ee">进阶石</font>*100
          <font color="#ee00ee">经验珠(500万)</font>*1
          <font color="#ee00ee">灵羽宝箱</font>*1(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb50b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb50b(player)
	if not (activity.isBaifuSjieOpen())then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 5000 then
		if player:num_bag_black() >= 4 then
			if util.ppn(player,const.PP_LEIJICZLB0) ~= today() then
				player:set_param(const.PP_LEIJICZLB0,today());
				player:add_vcoin_bind(2000);
				player:add_item("进阶石",100,1);
				player:add_item("灵羽宝箱",1,1);
				player:add_item("经验珠(500万)",1,1);
				player:alert(11,1,"成功领取[充值5000元宝礼包]!");
				player:alert(10,0,"进阶石      *100");
				player:alert(10,0,"灵羽宝箱      *1");
				player:alert(10,0,"经验珠(500万) *1");
				player:alert(10,0,"绑定元宝   *2000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足4格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb50(player);
end


function onTalkbflqlb100(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值10000元宝
          即可领取[充值10000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*5000
          <font color="#ee00ee">进阶石</font>*100
          <font color="#ee00ee">经验珠(1000万)</font>*1
          <font color="#ee00ee">装备宝箱</font>*1(<font color="#FFff00">随机珍贵宝石装备</font>)
          <font color="#ee00ee">灵羽宝箱</font>*1(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb100b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb100b(player)
	if not (activity.isBaifuSjieOpen()) then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 10000 then
		if player:num_bag_black() >= 5 then
			if util.ppn(player,const.PP_LEIJICZLB1) ~= today() then
				player:set_param(const.PP_LEIJICZLB1,today());
				player:add_vcoin_bind(5000);
				player:add_item("装备宝箱",1,1);
				player:add_item("进阶石",100,1);
				player:add_item("灵羽宝箱",1,1);
				player:add_item("经验珠(1000万)",1,1);
				player:alert(11,1,"成功领取[充值10000元宝礼包]!");
				player:alert(10,0,"进阶石      *100");
				player:alert(10,0,"装备宝箱      *1");
				player:alert(10,0,"灵羽宝箱      *1");
				player:alert(10,0,"经验珠(1000万)*1");
				player:alert(10,0,"绑定元宝   *5000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足5格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb100(player);
end


function onTalkbflqlb300(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值30000元宝
          即可领取[充值30000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*5000
          <font color="#ee00ee">祈福令牌(小)</font>*1
          <font color="#ee00ee">经验珠(2000万)</font>*1
          <font color="#ee00ee">装备宝箱</font>*2(<font color="#FFff00">随机珍贵宝石装备</font>)
          <font color="#ee00ee">灵羽宝箱</font>*2(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb300b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb300b(player)
	if not (activity.isBaifuSjieOpen())then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 30000 then
		if player:num_bag_black() >= 7 then
			if util.ppn(player,const.PP_LEIJICZLB2) ~= today() then
				player:set_param(const.PP_LEIJICZLB2,today());
				player:add_vcoin_bind(5000);
				player:add_item("装备宝箱",2,1);
				player:add_item("灵羽宝箱",2,1);
				player:add_item("祈福令牌(小)",1,1);
				player:add_item("经验珠(2000万)",1,1);
				player:alert(11,1,"成功领取[充值30000元宝礼包]!");
				player:alert(10,0,"装备宝箱      *2");
				player:alert(10,0,"灵羽宝箱      *2");
				player:alert(10,0,"祈福令牌(小)  *1");
				player:alert(10,0,"经验珠(2000万)*1");
				player:alert(10,0,"绑定元宝   *5000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足7格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb300(player);
end


function onTalkbflqlb500(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值50000元宝
          即可领取[充值50000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*5000
          <font color="#ee00ee">祈福令牌(小)</font>*2
          <font color="#ee00ee">经验珠(2000万)]</font>*1
          <font color="#ee00ee">装备宝箱</font>*2(<font color="#FFff00">随机珍贵宝石装备</font>)
          <font color="#ee00ee">灵羽宝箱</font>*2(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb500b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb500b(player)
	if not (activity.isBaifuSjieOpen())then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 50000 then
		if player:num_bag_black() >= 7 then
			if util.ppn(player,const.PP_LEIJICZLB3) ~= today() then
				player:set_param(const.PP_LEIJICZLB3,today());
				player:add_vcoin_bind(5000);
				player:add_item("装备宝箱",2,1);
				player:add_item("祈福令牌(小)",2,1);
				player:add_item("灵羽宝箱",2,1);
				player:add_item("经验珠(2000万)",1,1);
				player:alert(11,1,"成功领取[充值50000元宝礼包]!");
				player:alert(10,0,"装备宝箱      *2");
				player:alert(10,0,"灵羽宝箱      *2");
				player:alert(10,0,"祈福令牌(小)  *2");
				player:alert(10,0,"经验珠(2000万)*1");
				player:alert(10,0,"绑定元宝   *5000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足7格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb500(player);
end


function onTalkbflqlb1000(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值100000元宝
          即可领取[充值100000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*5000
          <font color="#ee00ee">六级灵羽</font>*1
          <font color="#ee00ee">七级宝石</font>*1
          <font color="#ee00ee">祈福令牌(中)</font>*1
          <font color="#ee00ee">经验珠(5000万)</font>*1
          <font color="#ee00ee">装备宝箱</font>*5(<font color="#FFff00">随机珍贵宝石装备</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb1000b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb1000b(player)
	if not (activity.isBaifuSjieOpen())then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 100000 then
		if player:num_bag_black() >= 6 then
			if util.ppn(player,const.PP_LEIJICZLB4) ~= today() then
				player:set_param(const.PP_LEIJICZLB4,today());
				player:add_vcoin_bind(5000);
				player:add_item("六级灵羽",1,1);
				player:add_item("七级宝石",1,1);
				player:add_item("装备宝箱",5,1);
				player:add_item("祈福令牌(中)",1,1);
				player:add_item("经验珠(5000万)",1,1);
				player:alert(11,1,"成功领取[充值100000元宝礼包]!");
				player:alert(10,0,"六级灵羽      *1");
				player:alert(10,0,"七级宝石      *1");
				player:alert(10,0,"装备宝箱      *5");
				player:alert(10,0,"祈福令牌(中)  *1");
				player:alert(10,0,"经验珠(5000万)*1");
				player:alert(10,0,"绑定元宝   *5000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足6格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb1000(player);
end

function onTalkbflqlb3000(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值300000元宝
          即可领取[充值300000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*5000
          <font color="#ee00ee">七级灵羽</font>*1
          <font color="#ee00ee">八级宝石</font>*1
          <font color="#ee00ee">祈福令牌(大)</font>*1
          <font color="#ee00ee">经验珠(5000万)</font>*2</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb3000b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb3000b(player)
	if not (activity.isBaifuSjieOpen())then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 300000 then
		if player:num_bag_black() >= 5 then
			if util.ppn(player,const.PP_LEIJICZLB5) ~= today() then
				player:set_param(const.PP_LEIJICZLB5,today());
				player:add_vcoin_bind(5000);
				player:add_item("七级灵羽",1,1);
				player:add_item("八级宝石",1,1);
				player:add_item("祈福令牌(大)",1,1);
				player:add_item("经验珠(5000万)",2,1);
				player:alert(11,1,"成功领取[充值300000元宝礼包]!");
				player:alert(10,0,"七级灵羽      *1");
				player:alert(10,0,"八级宝石      *1");
				player:alert(10,0,"祈福令牌(大)  *1");
				player:alert(10,0,"经验珠(5000万)*2");
				player:alert(10,0,"绑定元宝   *5000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足5格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb3000(player);
end





function onTalkbflqlb5000(player)
	reset_player_mrczlj_info(player);
	player:echo([[--------------------------------------
          <font color="#FFFF00">复活节充值豪华礼包</font>
--------------------------------------
活动时间: <font color="#FFff00">4月19日-4月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内累计充值500000元宝
          即可领取[充值500000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          <font color="#ee00ee">绑定元宝</font>*5000
          <font color="#ee00ee">八级灵羽</font>*1
          <font color="#ee00ee">九级宝石</font>*1
          <font color="#ee00ee">祈福令牌(大)</font>*2
          <font color="#ee00ee">经验珠(5000万)</font>*2</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_LEIJICZJL)..[[ 元宝
--------------------------------------
          <a href="event:talk_bflqlb5000b">领取礼包</a>           <a href="event:talk_sdhd10">返回上页</a>
--------------------------------------]]);
end


function onTalkbflqlb5000b(player)
	if not (activity.isBaifuSjieOpen())then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd10(player);return;
	end
	reset_player_mrczlj_info(player);
	if util.ppn(player,const.PP_LEIJICZJL) >= 500000 then
		if player:num_bag_black() >= 5 then
			if util.ppn(player,const.PP_LEIJICZLB6) ~= today() then
				player:set_param(const.PP_LEIJICZLB6,today());
				player:add_vcoin_bind(5000);
				player:add_item("八级灵羽",1,1);
				player:add_item("九级宝石",1,1);
				player:add_item("祈福令牌(大)",2,1);
				player:add_item("经验珠(5000万)",2,1);
				player:alert(11,1,"成功领取[充值500000元宝礼包]!");
				player:alert(10,0,"八级灵羽      *1");
				player:alert(10,0,"九级宝石      *1");
				player:alert(10,0,"祈福令牌(大)  *2");
				player:alert(10,0,"经验珠(5000万)*2");
				player:alert(10,0,"绑定元宝   *5000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足5格,无法领取!")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkbflqlb5000(player);
end	






function onTalksdhd3xxxx(player)
        player:echo([[--------------------------------------
          <font color="#FFFF00">百服坐骑培养折扣</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">3月28日-3月30日（仅此三日）</font>
--------------------------------------
活动内容: 

	<font color="#FFFF00">活动期间内，所有服务器坐骑特惠培养，限元宝进阶和一键进阶！元宝进阶每日最多100次，一键进阶每日最多20次。

1 阶到5 阶坐骑    九五折优惠
6 阶到10阶坐骑    八八折优惠
11阶到16阶坐骑    八折优惠

</font>
          <font color="#FFaa00">机不可失,可别错过哦!</font>
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end


function onTalksdhd5xxxx(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">百服积分神器盛典</font>
--------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
--------------------------------------
领取时间: <font color="#FFff00">3月28日-4月3日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内，全服所有玩家积分武器和神甲升级成功几率提高10%。</font>
--------------------------------------
                    <a href="event:talk_duanwujie">返回上页</a>
--------------------------------------]]);
end




function onTalksdhd7xxxx(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">百服寻宝超级回馈</font>
--------------------------------------
活动时间: <font color="#FFff00">3月28日-4月3日</font>
--------------------------------------
活动说明: <font color="#FFff00">活动时间内每日寻宝达到一定次数,即可领取以下奖励!</font>
--------------------------------------
<a href="event:talk_bfxunbaolb1">每日寻宝达到30次</a>:    <font color="#FFaa00">幸运神符(20%)*1</font> 
--------------------------------------
<a href="event:talk_bfxunbaolb2">每日寻宝达到50次</a>:    <font color="#FFaa00">幸运神符(30%)*1</font>
--------------------------------------
<a href="event:talk_bfxunbaolb3">每日寻宝达到100次</a>:   <font color="#FFaa00">幸运神符(40%)*1</font>
--------------------------------------
您今天已经寻宝: <font color="#FF0000">]]..util.ppn(player,const.PP_MEIRIXUNBAOCISHU)..[[</font>次
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end


function onTalkbfxunbaolb1(player)
	if not activity.isBaifuSjieOpen() then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd7(player);return;
	end
	if util.ppn(player,const.PP_MEIRIXUNBAOCISHU) >= 30 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_XUNBAO50CILIBAO) == 0 then
				player:set_param(const.PP_XUNBAO50CILIBAO,1);
				player:add_item("幸运神符(20%)",1,1);
				player:alert(11,1,"成功领取[每日寻宝30次礼包]");
				player:alert(11,0,"获得:幸运神符(20%)*1");
			else
				player:alert(1,1,"对不起,您今天已经领取过该奖励,无法领取!");
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您今天寻宝的次数未达到30次,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkbfxunbaolb2(player)
	if not activity.isBaifuSjieOpen() then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd7(player);return;
	end
	if util.ppn(player,const.PP_MEIRIXUNBAOCISHU) >= 50 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_XUNBAO100CILIBAO) == 0 then
				player:set_param(const.PP_XUNBAO100CILIBAO,1);
				player:add_item("幸运神符(30%)",1,1);
				player:alert(11,1,"成功领取[每日寻宝50次礼包]");
				player:alert(11,0,"获得:幸运神符(30%)*1");
			else
				player:alert(1,1,"对不起,您今天已经领取过该奖励,无法领取!");
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您今天寻宝的次数未达到50次,无法领取!")
	end
	onTalksdhd7(player);
end


function onTalkbfxunbaolb3(player)
	if not activity.isBaifuSjieOpen() then
		player:alert(1,1,"当前不在活动时间!");
		onTalksdhd7(player);return;
	end
	if util.ppn(player,const.PP_MEIRIXUNBAOCISHU) >= 100 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_XUNBAO200CILIBAO) == 0 then
				player:set_param(const.PP_XUNBAO200CILIBAO,1);
				player:add_item("幸运神符(40%)",1,1);
				player:alert(11,1,"成功领取[每日寻宝100次礼包]");
				player:alert(11,0,"获得:幸运神符(40%)*1");
			else
				player:alert(1,1,"对不起,您今天已经领取过该奖励,无法领取!");
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
	player:alert(1,1,"对不起,您今天寻宝的次数未达到100次,无法领取!")
	end
	onTalksdhd7(player);
end































function onTalksdhd1xxxxxxx(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">春分回馈豪华礼包</font>
--------------------------------------
活动对象: <font color="#FFaa00">所有50级以上玩家</font>
--------------------------------------
领取时间: <font color="#FFff00">3月20日-3月25日</font>
--------------------------------------
活动内容: <font color="#FFff00">为感谢您的支持送上一份
          豪华大礼包祝您游戏快乐!</font>
--------------------------------------
礼包内容: <font color="#FFaa00">四倍宝典*1
          聚 灵 珠*1
          魂石令牌(500)*1
          坐骑经验丹(大)*1
          荣誉令牌(10000)*1
          绑定元宝*2000
          绑定金币*500000</font>
--------------------------------------
          <a href="event:talk_lqwsjlb">领取礼包</a>           <a href="event:talk_duanwujie">返回上页</a>
--------------------------------------]]);
end





function onTalksdhd3xxxxx(player)
        player:echo([[--------------------------------------
          <font color="#FFFF00">金秋富贵虎大放送</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-10月12日</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">活动期间,开兴富贵虎
          效果增加<font color="#FF0000">1</font>倍!</font>
          <font color="#FFaa00">每只开心富贵虎使用后
          可获得<font color="#FF0000">1000</font>绑定元宝!</font>
--------------------------------------
                             <a href="event:talk_Day14th">返回首页</a>
--------------------------------------]]);
end

function onTalksdhd4xxxxx(player)
        player:echo([[--------------------------------------
          <font color="#FFFF00">春分宝石精炼盛典</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">3月20日-3月25日</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">在活动时间内,全服宝石精炼的
          成功几率将会大幅提高哦!</font>

          <font color="#FFaa00">机不可失,可别错过哦!</font>
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end

function onTalksdhd5xxx(player)
        player:echo([[--------------------------------------
          <font color="#FFFF00">春分绑定商城献礼</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">3月20日-3月25日</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">在活动时间内,绑定商城新增多种
   元宝道具.部分原有道具,例如镇魔令大包
   等没有使用限制</font>

<font color="#FFaa00">原赏金猎人功勋兑换绑定元宝功能入口关闭!</font>
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end

function onTalksdhd2tttt(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">月中充值超值礼包</font>
--------------------------------------
领取时间: <font color="#FFff00">3月11日-3月16日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内充值只需达到10000
          元宝即可领取以下礼包!</font>
--------------------------------------
礼包内容: <font color="#FFaa00">六级灵羽*1
          聚 灵 珠*1
          进 阶 石*100
          镇魔令大包*1
          经验珠(5000万)*1
          绑定元宝*3000
          绑定金币*1000000</font>
--------------------------------------
您已充值: ]]..util.ppn(player,const.PP_ACTIVITY_CZHI_LJ)..[[元宝
--------------------------------------
          <a href="event:talk_lqhhlb">领取礼包</a>           <a href="event:talk_duanwujie">返回上页</a>
--------------------------------------]]);
end



function onTalklqhhlb(player)
	if not activity.isBaifuSjieOpen() then
		player:alert(11,1,"该礼包只可在3月11日-3月16日领取!");
		onTalksdhd2(player);return;
	end
	if util.ppn(player,const.PP_ACTIVITY_CZHI_LJ) >= 10000 then
		if player:num_bag_black() >= 6 then
			if util.ppn(player,const.PP_CHONGZHIHUIKUILB) <= 35 then -- 20140310 3月zhong
				player:set_param(const.PP_CHONGZHIHUIKUILB,36);
				player:add_item("六级灵羽",1,1);
				player:add_item("聚灵珠",1,1);
				player:add_item("进阶石",100,1);
				player:add_item("镇魔令大包",1,1);
				player:add_item("经验珠(5000万)",1,1);
				player:add_vcoin_bind(3000);
				player:add_gamemoney_bind(1000000);
				player:alert(11,1,"成功领取[月中充值豪华礼包]!");
				player:alert(10,0,"六级灵羽       *1");
				player:alert(10,0,"聚 灵 珠       *1");
				player:alert(10,0,"进 阶 石     *100");
				player:alert(10,0,"镇魔令大包     *1");
				player:alert(10,0,"经验珠(5000万) *1");
				player:alert(10,0,"绑定元宝    *3000");
				player:alert(10,0,"绑定金币 *1000000");
			else
				player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
			end
		else
			player:alert(1,1,"背包空格不足6格,无法领取!");
		end
	else
	player:alert(1,1,"您已充值的元宝不足10000,无法领取该礼包!!")
	end
	onTalksdhd2(player);
end


function onTalksdhdother(player)
        player:echo([[--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">3月11日-3月16日</font>
--------------------------------------
          <font color="#FFFF00">限时特惠转盘</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">每次花费<font color="#FF0000">288</font>元宝,可从限时转盘
          抽奖一次,优惠多多,惊喜多多!	  
--------------------------------------
          <font color="#FFFF00">神器积分礼包</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">在活动时间内,全服玄晶合成的
          成功几率将会提高[<font color="#FF0000">20%</font>]哦!</font>
	  超值优惠神器积分礼包,每人每日三种礼包限购一次!
--------------------------------------
          <font color="#FFFF00">商城限时促销</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">在限定时间内部分商城物品或非
           商城物品打折出售机会不多,赶紧去购买吧! 
--------------------------------------
                             <a href="event:talk_duanwujie">返回首页</a>
--------------------------------------]]);
end


-----

function reset_player_mrczlj_info(player)
	if util.ppn(player,const.PP_MRCZLJ_TAG) ~= today() then
		player:set_param(const.PP_MRCZLJ_TAG,today());
		player:set_param(const.PP_LEIJICZJL,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end


--------------------------------------------------------------------------------------------------------------------
function onTalksdhd6ttt(player)
player:echo([[            <font color="#FFFF00">百服击杀Boss排名</font>
--------------------------------------
活动说明：<font color="#FFff00">因更新原因  
导致服务器BOSS击杀统计出现异常,先做以下补偿:</font>
--------------------------------------
活动重置: <font color="#FFff00">4月25日-4月27日</font>
--------------------------------------

<font color="#ffff00">原奖励不变,具体参考新的BOSS击杀说明</font>

<font color="#ffff00">击杀10只150级BOSS,可领取6级宝石一颗</font>

<font color="#ffff00">所有服务器4月25日全天开启双倍经验补偿</font>

                           <a href="event:talk_duanwujie">返回首页</a>
]]);
end

function onTalkcompensate(player)
player:echo([[
          		<font color="#FFFF00">BOSS击杀全服补偿</font>
---------------------------------------
活动对象: <font color="#FFaa00">全服所有玩家</font>
---------------------------------------
活动内容: 
        <a href="event:talk_qfbc0">一、BOSS击杀排名奖励</a>
---------------------------------------
        <a href="event:talk_qfbc1">二、BOSS击杀全民奖励</a>
---------------------------------------
        <a href="event:talk_qfbc2">三、全服双倍经验补偿</a>
---------------------------------------	]]);
end
function onTalkqfbc0(player)
	if util.svn("resetbfboss")<= 35 then  --20140425 buchang
		server.set_var("resetbfboss",36);
		for i=1,3 do
			server.set_var("bfbosssa"..i,"");
			server.set_var("bfbosssb"..i,0);
			server.set_var("bfbosssc"..i,"");
			server.set_var("bfbossma"..i,"");
			server.set_var("bfbossmb"..i,0);
			server.set_var("bfbossmc"..i,"");
			server.set_var("bfbossba"..i,"");
			server.set_var("bfbossbb"..i,0);
			server.set_var("bfbossbc"..i,"");
		end
	end
	if util.ppn(player,const.PP_BAIFUJISHABOSSCHONGZHI)<= 40 then  --20140425 buchang
		player:set_param(const.PP_BAIFUJISHABOSSCHONGZHI,41);
		player:set_param(const.PP_BAIFUJISHABOSSBIAOZHI,0);
		player:set_param(const.PP_BAIFUJISHABOSS1,0);
		player:set_param(const.PP_BAIFUJISHABOSS2,0);
		player:set_param(const.PP_BAIFUJISHABOSS3,0);
	end

        player:echo([[            <font color="#FFFF00">击杀Boss排名</font>
--------------------------------------
<font color="#FFff00">活动说明：活动期间累计击杀 
Boss数量前三的玩家可分别领取以下奖励
活动时间:   4月25日-4月27日</font>
--------------------------------------
<font color="#ffff00">击杀160级Boss排名前三即可领取以下奖励:</font>

七级宝石*1 <font color="#EE82EE">第一名:</font><font color="#FFaa00">]]..server.get_var("bfbosssa1")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbosssb1")..[[个</font>

六级宝石*1 <font color="#EE82EE">第二名:</font><font color="#FFaa00">]]..server.get_var("bfbosssa2")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbosssb2")..[[个</font>

五级宝石*1 <font color="#EE82EE">第三名:</font><font color="#FFaa00">]]..server.get_var("bfbosssa3")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbosssb3")..[[个</font>

--------------------------------------
<font color="#ffff00">击杀180级Boss排名前三即可领取以下奖励:</font>

八级宝石*1 <font color="#EE82EE">第一名:</font><font color="#FFaa00">]]..server.get_var("bfbossma1")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbossmb1")..[[个</font>

七级宝石*1 <font color="#EE82EE">第二名:</font><font color="#FFaa00">]]..server.get_var("bfbossma2")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbossmb2")..[[个</font>

六级宝石*1 <font color="#EE82EE">第三名:</font><font color="#FFaa00">]]..server.get_var("bfbossma3")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbossmb3")..[[个</font>
                    <a href="event:talk_killboss2">进入下页</a>  <a href="event:talk_compensate">返回首页</a>
]]);
end
function onTalkkillboss2(player)
	player:echo([[            <font color="#FFFF00">击杀Boss排名</font>
--------------------------------------
<font color="#ffff00">击杀200级Boss排名前三即可领取以下奖励:</font>

九级宝石*1 <font color="#EE82EE">第一名:</font><font color="#FFaa00">]]..server.get_var("bfbossba1")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbossbb1")..[[个</font>

八级宝石*1 <font color="#EE82EE">第二名:</font><font color="#FFaa00">]]..server.get_var("bfbossba2")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbossbb2")..[[个</font>

七级宝石*1 <font color="#EE82EE">第三名:</font><font color="#FFaa00">]]..server.get_var("bfbossba3")..[[</font> <font color="#FF0000">数量:]]..util.svn("bfbossbb3")..[[个</font>

--------------------------------------
您已击杀Boss数量
160级Boss </font><font color="#FFaa00">]]..util.ppn(player,const.PP_BAIFUJISHABOSS1)..[[</font> 个
180级Boss </font><font color="#FFaa00">]]..util.ppn(player,const.PP_BAIFUJISHABOSS2)..[[</font> 个
200级Boss </font><font color="#FFaa00">]]..util.ppn(player,const.PP_BAIFUJISHABOSS3)..[[</font> 个
--------------------------------------
<font color="#FF0000">此活动最终解释权归官方所有</font>  <a href="event:talk_killbossjl">领取奖励</a>
--------------------------------------

                    <a href="event:talk_qfbc0">返回上页</a>  <a href="event:talk_compensate">返回首页</a>
]]);
end
function onTalkqfbc1(player)
player:echo([[            <font color="#FFFF00">BOSS击杀全民奖励</font>
--------------------------------------
活动说明：<font color="#FFff00">全服所有玩家击杀 150级BOSS   10只，可领取奖励6级宝石一颗</font>
活动时间: <font color="#FFff00">4月25日-4月27日</font>
--------------------------------------

##六级宝石##

--------------------------------------
您已击杀150级Boss数量: <font color="#FFaa00">]]..util.ppn(player,const.PP_BAIFUJISHABOSS4)..[[</font> 个
--------------------------------------
                    <a href="event:talk_killbossqmjl">领取奖励</a>  <a href="event:talk_compensate">返回首页</a>
                    ]]);
end
function onTalkqfbc2(player)
	player:echo([[--------------------------------------
          <font color="#FFFF00">全服双倍经验补偿</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">4月25日</font>
--------------------------------------
活动内容: 
          <font color="#FFFF00">在活动时间内,所有服务器都将
          开放双倍打怪经验活动!</font>
          
          <font color="#FFaa00">活动期间,杀怪经验增加1倍!</font>
--------------------------------------
                             <a href="event:talk_compensate">返回首页</a>
--------------------------------------]]);
end
function onTalkkillbossjl(player)
	if activity.isBaifuBuchang() then
		player:alert(1,1,"活动未结束，无法领取奖励!");
		onTalkkillboss2(player);
		return;
	end
	local consttab={
	[1]={sbl="bfbosssa",haved="bfbosssc",
			award={
				{name="七级宝石",num=1},
				{name="六级宝石",num=1},
				{name="五级宝石",num=1},
			},
		},
	[2]={sbl="bfbossma",haved="bfbossmc",
			award={
				{name="八级宝石",num=1},
				{name="七级宝石",num=1},
				{name="六级宝石",num=1},
			},
		},
	[3]={sbl="bfbossba",haved="bfbossbc",
			award={
				{name="九级宝石",num=1},
				{name="八级宝石",num=1},
				{name="七级宝石",num=1},
			},
		},
	};
	
	local getgift=false;
	if util.ppn(player,const.PP_BAIFUJISHABOSSBIAOZHI)<=0 then
		if player:num_bag_black() >= 3 then
			for i=1,#consttab do
				for k=1,#consttab[i].award do
					if server.get_var(consttab[i].haved..k) ~= "haved" then
						if server.get_var(consttab[i].sbl..k) and server.get_var(consttab[i].sbl..k)==player:get_name() then
							player:set_param(const.PP_BAIFUJISHABOSSBIAOZHI,1);
							player:add_item_log(consttab[i].award[k].name,223,1,1);
							getgift=true;
							server.set_var(consttab[i].haved..k,"haved");
						end
					end
				end
			end
			if getgift then
				player:alert(1,1,"成功领取击杀Boss排名奖励!");
			else
				player:alert(1,1,"榜上无名，还怎么领取奖励!");
			end
		else
			player:alert(1,1,"背包空格不足3格,无法领取!");
		end
	else
		player:alert(1,1,"你已领取过该奖励!!");
	end
	onTalkkillboss2(player);
end

function refreshKillBossRanking(player,type)
	if newgui.jingcaihuodong.isOpenActivity(player,"bossjspm") then
		local activityTimes = newgui.jingcaihuodong.getActivityTimes(player,"bossjspm");
		if util.svn("bossjspmtimes") ~= activityTimes then  -- 20140222 2yuemo
			server.set_var("bossjspmtimes",activityTimes);
			for i=1,3 do
				server.set_var("bfbosssa"..i,"");
				server.set_var("bfbosssb"..i,0);
				server.set_var("bfbosssc"..i,"");
				server.set_var("bfbossma"..i,"");
				server.set_var("bfbossmb"..i,0);
				server.set_var("bfbossmc"..i,"");
				server.set_var("bfbossba"..i,"");
				server.set_var("bfbossbb"..i,0);
				server.set_var("bfbossbc"..i,"");
			end
		end
	end
	if util.svn("resetbfboss")<= 35 then  -- 20140425 buchang
		server.set_var("resetbfboss",36);
		for i=1,3 do
			server.set_var("bfbosssa"..i,"");
			server.set_var("bfbosssb"..i,0);
			server.set_var("bfbosssc"..i,"");
			server.set_var("bfbossma"..i,"");
			server.set_var("bfbossmb"..i,0);
			server.set_var("bfbossmc"..i,"");
			server.set_var("bfbossba"..i,"");
			server.set_var("bfbossbb"..i,0);
			server.set_var("bfbossbc"..i,"");
		end
	end
	local a = player:get_name();
	local b = 0;
	if type=="160" then
		b = util.ppn(player,const.PP_BAIFUJISHABOSS1);
		rankingLogic("bfbosssa","bfbosssb",a,b);
	elseif type=="180" then
		b = util.ppn(player,const.PP_BAIFUJISHABOSS2);
		rankingLogic("bfbossma","bfbossmb",a,b);
	elseif type=="200" then
		b = util.ppn(player,const.PP_BAIFUJISHABOSS3);
		rankingLogic("bfbossba","bfbossbb",a,b);
	end
end

function rankingLogic(varname,varval,playername,val)
	local Tab = {};
	local find = false;
	for u = 1,3 do
		if server.get_var(varname..u)==playername then
			server.set_var(varname..u,playername);
			server.set_var(varval..u,val);
			find=true;
		end
		table.insert(Tab,{
			name = server.get_var(varname..u),
			num = util.svn(varval..u),
		})
	end
	if not find then
		table.insert(Tab,{name=playername,num=val});
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Tab,c);
	if not find then
		table.remove(Tab);
	end
	for idx,value in ipairs(Tab) do
		server.set_var(varname..idx,value.name);
		server.set_var(varval..idx,value.num);
	end
end


function onTalkkillbossqmjl(player)
	if activity.isBaifuBuchang() then
		player:alert(1,1,"活动未结束，无法领取奖励!");
		onTalkqfbc1(player);
		return;
	end
	local istrue=false;
	if util.ppn(player,const.PP_BUCHANGJISHABOSSBIAOZHI)<=0 then
		if player:num_bag_black() >= 1 then
			if util.ppn(player,const.PP_BAIFUJISHABOSS4) >= 10 then
				player:set_param(const.PP_BUCHANGJISHABOSSBIAOZHI,1);
				player:add_item_log("六级宝石",223,1,1);
				istrue=true;
			end
			if istrue then
				player:alert(1,1,"成功领取Boss击杀全民奖励!");
			else
				player:alert(1,1,"击杀Boss数量不足10个，无法领取奖励!");
			end
		else
			player:alert(1,1,"背包空格不足1格,无法领取!");
		end
	else
		player:alert(1,1,"你已领取过该奖励!!");
	end
	onTalkqfbc1(player);
end
---------------------------------------------------------------------------------------------------
function onTalkKuafuZssc(player)
	player:echo([[<font color="#FFFF00">             跨服专属商城</font>
----------------------------------------
##经验珠(5000万)##          <a href="event:talk_kuafuzssc1">点击兑换</a>
<font color="#FF0000">异界勋章*20</font>
##镇魔令大包##              <a href="event:talk_kuafuzssc2">点击兑换</a>
<font color="#FF0000">异界勋章*20</font>
##转生石##                  <a href="event:talk_kuafuzssc3">点击兑换</a>
<font color="#FF0000">异界勋章*10</font>
##聚灵珠##                  <a href="event:talk_kuafuzssc4">点击兑换</a>
<font color="#FF0000">异界勋章*8</font>
----------------------------------------
您当前拥有异界勋章数: ]]..player:num_item("异界勋章")..[[   
----------------------------------------  
<a href="event:talk_Kuafujl">跨服战奖励说明及领取</a>
----------------------------------------]]);
end
function onTalkKuafujl(player)
	player:echo([[<font color="#FFFF00">              跨服战奖励</font>
----------------------------------------
<font color="#FF0000">获胜方所有参战行会成员:</font>       
    <font color="#FFaa00">异界勋章*100;</font>
    <font color="#FFaa00">会长称号"异界霸主",会员称号"异界强者";</font>
    <font color="#FFaa00">称号持续7天,周日跨服战结束后获得,下次跨服战结束后重新结算.</font>

<font color="#FF0000">败方所有参战行会成员:</font>       
    <font color="#FFaa00">异界勋章*25.</font>
----------------------------------------
    <a href="event:talk_Kuafujllq">领取奖励</a>             <a href="event:talk_KuafuZssc">返回首页</a>]]);
end
function onTalkKuafujllq(player)
	local kuafutime = util.ppn(player,const.PP_KUAFU_TIME);
	local serverkuafutime = server.get_var("server_kuafu_timer");
	if serverkuafutime == nil or serverkuafutime == "" or kuafutime < tonumber(serverkuafutime) then
		player:kuafu_set_jl_state(0);
	end
	local kuafujltime = util.ppn(player,const.PP_KUAFU_JL_TIME);
	if kuafujltime == today() then
		player:alert(1,1,"跨服战奖励今天已经领取过,无法再次领取!!");
		onTalkKuafujl(player);
		return;
	end
	local state = player:kuafu_get_jl_state();
	if state == 0 then
		player:alert(1,1,"您暂无跨服战奖励可以领取!!");
	elseif state == 2 then
		if player:num_bag_black() >= 1 then
			player:kuafu_set_jl_state(1);
			player:add_item("异界勋章",25,1);
			player:alert(1,1,"跨服战奖励领取成功!!");
			player:set_param(const.PP_KUAFU_JL_TIME,today());
		else
			player:alert(1,1,"背包空格不足1格,无法领取!!");
		end
	elseif state == 3 then
		if player:num_bag_black() >= 1 then
			player:kuafu_set_jl_state(1);
			player:add_item("异界勋章",100,1);
			player:alert(1,1,"跨服战奖励领取成功!!");
			player:set_param(const.PP_KUAFU_JL_TIME,today());
		else
			player:alert(1,1,"背包空格不足1格,无法领取!!");
		end
	end
	onTalkKuafujl(player);
end
function processDuihuanYjsz(player,yjsznum,dj)
	if  player:num_item("异界勋章") < yjsznum then
		player:alert(1,1,"您背包中异界勋章数不足"..yjsznum.."!!")
	else
		if player:num_bag_black() >= 1 then
			player:add_item(dj,1,1);
			player:remove_item("异界勋章",yjsznum);
			player:alert(11,0,"成功使用<font color='#FF0000'>异界勋章*"..yjsznum.."</font>兑换<font color='#FF0000'>"..dj.."</font>!")
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
		end
	end
end
function onTalkkuafuzssc1(player)	processDuihuanYjsz(player,20,"经验珠(5000万)");		onTalkKuafuZssc(player);	end
function onTalkkuafuzssc2(player)	processDuihuanYjsz(player,20,"镇魔令大包");	onTalkKuafuZssc(player);	end
function onTalkkuafuzssc3(player)	processDuihuanYjsz(player,10,"转生石");		onTalkKuafuZssc(player);	end
function onTalkkuafuzssc4(player)	processDuihuanYjsz(player,8,"聚灵珠");		onTalkKuafuZssc(player);	end
function processXunBaoJF(player)
	player:echo([[--------------------------------------
           <font color="#FFFF00">寻宝积分兑换列表</font>
--------------------------------------
请选择您想兑换的物品:
--------------------------------------
<font color="#FFaa00">高级武器</font>: <a href="event:talk_jifendh8">战士武器</a>  <a href="event:talk_jifendh8b">法师武器</a>  <a href="event:talk_jifendh8c">道士武器</a>
--------------------------------------
<font color="#FFaa00">高级战甲</font>: <a href="event:talk_jifendh9">男战衣服</a>  <a href="event:talk_jifendh9b">男法衣服</a>  <a href="event:talk_jifendh9c">男道衣服</a>
--------------------------------------
<font color="#FFaa00">高级战衣</font>: <a href="event:talk_jifendh10">女战衣服</a>  <a href="event:talk_jifendh10b">女法衣服</a>  <a href="event:talk_jifendh10c">女道衣服</a>
--------------------------------------
<font color="#FFaa00">65级套装</font>: <a href="event:talk_jifendh1">潜龙武威</a>  <a href="event:talk_jifendh1b">潜龙烈焰</a>  <a href="event:talk_jifendh1c">潜龙无极</a>
--------------------------------------
<font color="#FFaa00">70级套装</font>: <a href="event:talk_jifendh2">无双武威</a>  <a href="event:talk_jifendh2b">无双烈焰</a>  <a href="event:talk_jifendh2c">无双无极</a>
--------------------------------------
<font color="#FFaa00">75级套装</font>: <a href="event:talk_jifendh3">至尊武威</a>  <a href="event:talk_jifendh3b">至尊烈焰</a>  <a href="event:talk_jifendh3c">至尊无极</a>
--------------------------------------
<font color="#FFaa00">80级套装</font>: <a href="event:talk_jifendh4">天龙武威</a>  <a href="event:talk_jifendh4b">天龙烈焰</a>  <a href="event:talk_jifendh4c">天龙无极</a>
--------------------------------------
<font color="#FFaa00">85级套装</font>: <a href="event:talk_jifendh5">三皇武威</a>  <a href="event:talk_jifendh5b">三皇烈焰</a>  <a href="event:talk_jifendh5c">三皇无极</a>
--------------------------------------
<font color="#FFaa00">超值玄晶</font>: <a href="event:talk_jifendh6">一级玄晶</a>  <a href="event:talk_jifendh6b">二级玄晶</a>  <a href="event:talk_jifendh6c">三级玄晶</a>
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------]]);
end

--<font color="#FFaa00">一转套装</font>: <a href="event:talk_jifendh6">天威武威</a>  <a href="event:talk_jifendh6b">天威烈焰</a>  <a href="event:talk_jifendh6c">天威无极</a>
--------------------------------------
--<font color="#FFaa00">二转套装</font>: <a href="event:talk_jifendh7">神皇武威</a>  <a href="event:talk_jifendh7b">神皇烈焰</a>  <a href="event:talk_jifendh7c">神皇无极</a>
--------------------------------------

function onTalkfhsy(player) processXunBaoJF(player); end

function onTalkjifendh6(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">一级玄晶兑换列表</font>
--------------------------------------
##一级生命玄晶##    <a href="event:talk_dhyjsmxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">3</font>]点
--------------------------------------
##一级攻击玄晶##    <a href="event:talk_dhyjgjxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">3</font>]点
--------------------------------------
##一级物防玄晶##    <a href="event:talk_dhyjwfxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">3</font>]点
--------------------------------------
##一级魔防玄晶##    <a href="event:talk_dhyjmfxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">3</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh6b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">二级玄晶兑换列表</font>
--------------------------------------
##二级生命玄晶##    <a href="event:talk_dhejsmxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">9</font>]点
--------------------------------------
##二级攻击玄晶##    <a href="event:talk_dhejgjxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">9</font>]点
--------------------------------------
##二级物防玄晶##    <a href="event:talk_dhejwfxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">9</font>]点
--------------------------------------
##二级魔防玄晶##    <a href="event:talk_dhejmfxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">9</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh6c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">三级玄晶兑换列表</font>
--------------------------------------
##三级生命玄晶##    <a href="event:talk_dhsjsmxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">27</font>]点
--------------------------------------
##三级攻击玄晶##    <a href="event:talk_dhsjgjxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">27</font>]点
--------------------------------------
##三级物防玄晶##    <a href="event:talk_dhsjwfxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">27</font>]点
--------------------------------------
##三级魔防玄晶##    <a href="event:talk_dhsjmfxj">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">27</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh1(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">潜龙武威兑换列表</font>
--------------------------------------
##完美的潜龙头盔·武威##    <a href="event:talk_dhqlww1">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙项链·武威##    <a href="event:talk_dhqlww2">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙护腕·武威##    <a href="event:talk_dhqlww3">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙戒指·武威##    <a href="event:talk_dhqlww4">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙腰带·武威##    <a href="event:talk_dhqlww5">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙靴·武威##      <a href="event:talk_dhqlww6">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh1b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">潜龙烈焰兑换列表</font>
--------------------------------------
##完美的潜龙头盔·烈焰##    <a href="event:talk_dhqlly1">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙项链·烈焰##    <a href="event:talk_dhqlly2">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙护腕·烈焰##    <a href="event:talk_dhqlly3">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙戒指·烈焰##    <a href="event:talk_dhqlly4">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙腰带·烈焰##    <a href="event:talk_dhqlly5">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙靴·烈焰##      <a href="event:talk_dhqlly6">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh1c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">潜龙无极兑换列表</font>
--------------------------------------
##完美的潜龙头盔·无极##    <a href="event:talk_dhqlwj1">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙项链·无极##    <a href="event:talk_dhqlwj2">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙护腕·无极##    <a href="event:talk_dhqlwj3">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙戒指·无极##    <a href="event:talk_dhqlwj4">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙腰带·无极##    <a href="event:talk_dhqlwj5">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
##完美的潜龙靴·无极##      <a href="event:talk_dhqlwj6">点击兑换</a>
需要:寻宝积分[<font color="#ff0000">5</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkdhqlww1(player) dhxbjfzb(player,5,"完美的潜龙头盔·武威",1) end
function onTalkdhqlww2(player) dhxbjfzb(player,5,"完美的潜龙项链·武威",1) end
function onTalkdhqlww3(player) dhxbjfzb(player,5,"完美的潜龙护腕·武威",1) end
function onTalkdhqlww4(player) dhxbjfzb(player,5,"完美的潜龙戒指·武威",1) end
function onTalkdhqlww5(player) dhxbjfzb(player,5,"完美的潜龙腰带·武威",1) end
function onTalkdhqlww6(player) dhxbjfzb(player,5,"完美的潜龙靴·武威",1) end

function onTalkdhqlly1(player) dhxbjfzb(player,5,"完美的潜龙头盔·烈焰",2) end
function onTalkdhqlly2(player) dhxbjfzb(player,5,"完美的潜龙项链·烈焰",2) end
function onTalkdhqlly3(player) dhxbjfzb(player,5,"完美的潜龙护腕·烈焰",2) end
function onTalkdhqlly4(player) dhxbjfzb(player,5,"完美的潜龙戒指·烈焰",2) end
function onTalkdhqlly5(player) dhxbjfzb(player,5,"完美的潜龙腰带·烈焰",2) end
function onTalkdhqlly6(player) dhxbjfzb(player,5,"完美的潜龙靴·烈焰",2) end

function onTalkdhqlwj1(player) dhxbjfzb(player,5,"完美的潜龙头盔·无极",3) end
function onTalkdhqlwj2(player) dhxbjfzb(player,5,"完美的潜龙项链·无极",3) end
function onTalkdhqlwj3(player) dhxbjfzb(player,5,"完美的潜龙护腕·无极",3) end
function onTalkdhqlwj4(player) dhxbjfzb(player,5,"完美的潜龙戒指·无极",3) end
function onTalkdhqlwj5(player) dhxbjfzb(player,5,"完美的潜龙腰带·无极",3) end
function onTalkdhqlwj6(player) dhxbjfzb(player,5,"完美的潜龙靴·无极",3) end


function onTalkdhyjsmxj(player) dhxbjfzb(player,3,"一级生命玄晶",13) end
function onTalkdhyjgjxj(player) dhxbjfzb(player,3,"一级攻击玄晶",13) end
function onTalkdhyjwfxj(player) dhxbjfzb(player,3,"一级物防玄晶",13) end
function onTalkdhyjmfxj(player) dhxbjfzb(player,3,"一级魔防玄晶",13) end

function onTalkdhejsmxj(player) dhxbjfzb(player,9,"二级生命玄晶",14) end
function onTalkdhejgjxj(player) dhxbjfzb(player,9,"二级攻击玄晶",14) end
function onTalkdhejwfxj(player) dhxbjfzb(player,9,"二级物防玄晶",14) end
function onTalkdhejmfxj(player) dhxbjfzb(player,9,"二级魔防玄晶",14) end

function onTalkdhsjsmxj(player) dhxbjfzb(player,27,"三级生命玄晶",15) end
function onTalkdhsjgjxj(player) dhxbjfzb(player,27,"三级攻击玄晶",15) end
function onTalkdhsjwfxj(player) dhxbjfzb(player,27,"三级物防玄晶",15) end
function onTalkdhsjmfxj(player) dhxbjfzb(player,27,"三级魔防玄晶",15) end


function dhxbjfzb(player,a,b,c)
	if a and b and c then
		if util.ppn(player,const.PP_XUNBAOJIFEN) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_XUNBAOJIFEN,util.ppn(player,const.PP_XUNBAOJIFEN)-a);
				player:add_item(b,1);
				player:alert(11,1,"恭喜您成功兑换:<font color='#ff0000'>"..b.."</font>");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"对不起,您的寻宝积分不足"..a.."点,无法兑换!");
		end
	end
	if c==1 then onTalkjifendh1(player); end
	if c==2 then onTalkjifendh1b(player); end
	if c==3 then onTalkjifendh1c(player); end
	if c==4 then onTalkjifendh8(player); end
	if c==5 then onTalkjifendh8b(player); end
	if c==6 then onTalkjifendh8c(player); end
	if c==7 then onTalkjifendh9(player); end
	if c==8 then onTalkjifendh9b(player); end
	if c==9 then onTalkjifendh9c(player); end
	if c==10 then onTalkjifendh10(player); end
	if c==11 then onTalkjifendh10b(player); end
	if c==12 then onTalkjifendh10c(player); end
	if c==13 then onTalkjifendh6(player); end
	if c==14 then onTalkjifendh6b(player); end
	if c==15 then onTalkjifendh6c(player); end
end






function onTalkjifendh2(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">无双武威兑换列表</font>
--------------------------------------
##完美的无双头盔·武威##    <a href="event:talk_sjwsww1">点击兑换</a>
需:<font color="#FFaa00">完美潜龙头盔·武威</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双项链·武威##    <a href="event:talk_sjwsww2">点击兑换</a>
需:<font color="#FFaa00">完美潜龙项链·武威</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双护腕·武威##    <a href="event:talk_sjwsww3">点击兑换</a>
需:<font color="#FFaa00">完美潜龙护腕·武威</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双戒指·武威##    <a href="event:talk_sjwsww4">点击兑换</a>
需:<font color="#FFaa00">完美潜龙戒指·武威</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双腰带·武威##    <a href="event:talk_sjwsww5">点击兑换</a>
需:<font color="#FFaa00">完美潜龙腰带·武威</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双靴·武威##      <a href="event:talk_sjwsww6">点击兑换</a>
需:<font color="#FFaa00">完美潜龙靴·武威</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh2b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">无双烈焰兑换列表</font>
--------------------------------------
##完美的无双头盔·烈焰##    <a href="event:talk_sjwsly1">点击兑换</a>
需:<font color="#FFaa00">完美潜龙头盔·烈焰</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双项链·烈焰##    <a href="event:talk_sjwsly2">点击兑换</a>
需:<font color="#FFaa00">完美潜龙项链·烈焰</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双护腕·烈焰##    <a href="event:talk_sjwsly3">点击兑换</a>
需:<font color="#FFaa00">完美潜龙护腕·烈焰</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双戒指·烈焰##    <a href="event:talk_sjwsly4">点击兑换</a>
需:<font color="#FFaa00">完美潜龙戒指·烈焰</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双腰带·烈焰##    <a href="event:talk_sjwsly5">点击兑换</a>
需:<font color="#FFaa00">完美潜龙腰带·烈焰</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双靴·烈焰##      <a href="event:talk_sjwsly6">点击兑换</a>
需:<font color="#FFaa00">完美潜龙靴·烈焰</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh2c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">无双无极兑换列表</font>
--------------------------------------
##完美的无双头盔·无极##    <a href="event:talk_sjwswj1">点击兑换</a>
需:<font color="#FFaa00">完美潜龙头盔·无极</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双项链·无极##    <a href="event:talk_sjwswj2">点击兑换</a>
需:<font color="#FFaa00">完美潜龙项链·无极</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双护腕·无极##    <a href="event:talk_sjwswj3">点击兑换</a>
需:<font color="#FFaa00">完美潜龙护腕·无极</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双戒指·无极##    <a href="event:talk_sjwswj4">点击兑换</a>
需:<font color="#FFaa00">完美潜龙戒指·无极</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双腰带·无极##    <a href="event:talk_sjwswj5">点击兑换</a>
需:<font color="#FFaa00">完美潜龙腰带·无极</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
##完美的无双靴·无极##      <a href="event:talk_sjwswj6">点击兑换</a>
需:<font color="#FFaa00">完美潜龙靴·无极</font>+积分[<font color="#ff0000">10</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end



function onTalksjwsww1(player) sjxbjfzb(player,41023,10,"完美的潜龙头盔·武威","完美的无双头盔·武威",41026,1) end
function onTalksjwsww2(player) sjxbjfzb(player,71033,10,"完美的潜龙项链·武威","完美的无双项链·武威",71036,1) end
function onTalksjwsww3(player) sjxbjfzb(player,61029,10,"完美的潜龙护腕·武威","完美的无双护腕·武威",61032,1) end
function onTalksjwsww4(player) sjxbjfzb(player,51035,10,"完美的潜龙戒指·武威","完美的无双戒指·武威",51038,1) end
function onTalksjwsww5(player) sjxbjfzb(player,91013,10,"完美的潜龙腰带·武威","完美的无双腰带·武威",91016,1) end
function onTalksjwsww6(player) sjxbjfzb(player,101013,10,"完美的潜龙靴·武威","完美的无双靴·武威",101016,1) end

function onTalksjwsly1(player) sjxbjfzb(player,41024,10,"完美的潜龙头盔·烈焰","完美的无双头盔·烈焰",41027,2) end
function onTalksjwsly2(player) sjxbjfzb(player,71034,10,"完美的潜龙项链·烈焰","完美的无双项链·烈焰",71037,2) end
function onTalksjwsly3(player) sjxbjfzb(player,61030,10,"完美的潜龙护腕·烈焰","完美的无双护腕·烈焰",61033,2) end
function onTalksjwsly4(player) sjxbjfzb(player,51036,10,"完美的潜龙戒指·烈焰","完美的无双戒指·烈焰",51039,2) end
function onTalksjwsly5(player) sjxbjfzb(player,91014,10,"完美的潜龙腰带·烈焰","完美的无双腰带·烈焰",91017,2) end
function onTalksjwsly6(player) sjxbjfzb(player,101014,10,"完美的潜龙靴·烈焰","完美的无双靴·烈焰",101017,2) end

function onTalksjwswj1(player) sjxbjfzb(player,41025,10,"完美的潜龙头盔·无极","完美的无双头盔·无极",41028,3) end
function onTalksjwswj2(player) sjxbjfzb(player,71035,10,"完美的潜龙项链·无极","完美的无双项链·无极",71038,3) end
function onTalksjwswj3(player) sjxbjfzb(player,61031,10,"完美的潜龙护腕·无极","完美的无双护腕·无极",61034,3) end
function onTalksjwswj4(player) sjxbjfzb(player,51037,10,"完美的潜龙戒指·无极","完美的无双戒指·无极",51040,3) end
function onTalksjwswj5(player) sjxbjfzb(player,91015,10,"完美的潜龙腰带·无极","完美的无双腰带·无极",91018,3) end
function onTalksjwswj6(player) sjxbjfzb(player,101015,10,"完美的潜龙靴·无极","完美的无双靴·无极",101018,3) end


function onTalkjifendh3(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">至尊武威兑换列表</font>
--------------------------------------
##完美的至尊头盔·武威##    <a href="event:talk_sjzzww1">点击兑换</a>
需:<font color="#FFaa00">完美无双头盔·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊项链·武威##    <a href="event:talk_sjzzww2">点击兑换</a>
需:<font color="#FFaa00">完美无双项链·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊护腕·武威##    <a href="event:talk_sjzzww3">点击兑换</a>
需:<font color="#FFaa00">完美无双护腕·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊戒指·武威##    <a href="event:talk_sjzzww4">点击兑换</a>
需:<font color="#FFaa00">完美无双戒指·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊腰带·武威##    <a href="event:talk_sjzzww5">点击兑换</a>
需:<font color="#FFaa00">完美无双腰带·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊靴·武威##      <a href="event:talk_sjzzww6">点击兑换</a>
需:<font color="#FFaa00">完美无双靴·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh3b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">至尊烈焰兑换列表</font>
--------------------------------------
##完美的至尊头盔·烈焰##    <a href="event:talk_sjzzly1">点击兑换</a>
需:<font color="#FFaa00">完美无双头盔·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊项链·烈焰##    <a href="event:talk_sjzzly2">点击兑换</a>
需:<font color="#FFaa00">完美无双项链·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊护腕·烈焰##    <a href="event:talk_sjzzly3">点击兑换</a>
需:<font color="#FFaa00">完美无双护腕·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊戒指·烈焰##    <a href="event:talk_sjzzly4">点击兑换</a>
需:<font color="#FFaa00">完美无双戒指·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊腰带·烈焰##    <a href="event:talk_sjzzly5">点击兑换</a>
需:<font color="#FFaa00">完美无双腰带·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊靴·烈焰##      <a href="event:talk_sjzzly6">点击兑换</a>
需:<font color="#FFaa00">完美无双靴·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh3c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">至尊无极兑换列表</font>
--------------------------------------
##完美的至尊头盔·无极##    <a href="event:talk_sjzzwj1">点击兑换</a>
需:<font color="#FFaa00">完美无双头盔·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊项链·无极##    <a href="event:talk_sjzzwj2">点击兑换</a>
需:<font color="#FFaa00">完美无双项链·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊护腕·无极##    <a href="event:talk_sjzzwj3">点击兑换</a>
需:<font color="#FFaa00">完美无双护腕·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊戒指·无极##    <a href="event:talk_sjzzwj4">点击兑换</a>
需:<font color="#FFaa00">完美无双戒指·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊腰带·无极##    <a href="event:talk_sjzzwj5">点击兑换</a>
需:<font color="#FFaa00">完美无双腰带·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##完美的至尊靴·无极##      <a href="event:talk_sjzzwj6">点击兑换</a>
需:<font color="#FFaa00">完美无双靴·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end



function onTalksjzzww1(player) sjxbjfzb(player,41026,20,"完美的无双头盔·武威","完美的至尊头盔·武威",41029,4) end
function onTalksjzzww2(player) sjxbjfzb(player,71036,20,"完美的无双项链·武威","完美的至尊项链·武威",71039,4) end
function onTalksjzzww3(player) sjxbjfzb(player,61032,20,"完美的无双护腕·武威","完美的至尊护腕·武威",61035,4) end
function onTalksjzzww4(player) sjxbjfzb(player,51038,20,"完美的无双戒指·武威","完美的至尊戒指·武威",51041,4) end
function onTalksjzzww5(player) sjxbjfzb(player,91016,20,"完美的无双腰带·武威","完美的至尊腰带·武威",91019,4) end
function onTalksjzzww6(player) sjxbjfzb(player,101016,20,"完美的无双靴·武威","完美的至尊靴·武威",101019,4) end

function onTalksjzzly1(player) sjxbjfzb(player,41027,20,"完美的无双头盔·烈焰","完美的至尊头盔·烈焰",41030,5) end
function onTalksjzzly2(player) sjxbjfzb(player,71037,20,"完美的无双项链·烈焰","完美的至尊项链·烈焰",71040,5) end
function onTalksjzzly3(player) sjxbjfzb(player,61033,20,"完美的无双护腕·烈焰","完美的至尊护腕·烈焰",61036,5) end
function onTalksjzzly4(player) sjxbjfzb(player,51039,20,"完美的无双戒指·烈焰","完美的至尊戒指·烈焰",51042,5) end
function onTalksjzzly5(player) sjxbjfzb(player,91017,20,"完美的无双腰带·烈焰","完美的至尊腰带·烈焰",91020,5) end
function onTalksjzzly6(player) sjxbjfzb(player,101017,20,"完美的无双靴·烈焰","完美的至尊靴·烈焰",101020,5) end

function onTalksjzzwj1(player) sjxbjfzb(player,41028,20,"完美的无双头盔·无极","完美的至尊头盔·无极",41031,6) end
function onTalksjzzwj2(player) sjxbjfzb(player,71038,20,"完美的无双项链·无极","完美的至尊项链·无极",71041,6) end
function onTalksjzzwj3(player) sjxbjfzb(player,61034,20,"完美的无双护腕·无极","完美的至尊护腕·无极",61037,6) end
function onTalksjzzwj4(player) sjxbjfzb(player,51040,20,"完美的无双戒指·无极","完美的至尊戒指·无极",51043,6) end
function onTalksjzzwj5(player) sjxbjfzb(player,91018,20,"完美的无双腰带·无极","完美的至尊腰带·无极",91021,6) end
function onTalksjzzwj6(player) sjxbjfzb(player,101018,20,"完美的无双靴·无极","完美的至尊靴·无极",101021,6) end


function onTalkjifendh4(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">天龙武威兑换列表</font>
--------------------------------------
##完美的天龙头盔·武威##    <a href="event:talk_sjtlww1">点击兑换</a>
需:<font color="#FFaa00">完美至尊头盔·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙项链·武威##    <a href="event:talk_sjtlww2">点击兑换</a>
需:<font color="#FFaa00">完美至尊项链·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙护腕·武威##    <a href="event:talk_sjtlww3">点击兑换</a>
需:<font color="#FFaa00">完美至尊护腕·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙戒指·武威##    <a href="event:talk_sjtlww4">点击兑换</a>
需:<font color="#FFaa00">完美至尊戒指·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙腰带·武威##    <a href="event:talk_sjtlww5">点击兑换</a>
需:<font color="#FFaa00">完美至尊腰带·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙靴·武威##      <a href="event:talk_sjtlww6">点击兑换</a>
需:<font color="#FFaa00">完美至尊靴·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh4b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">天龙烈焰兑换列表</font>
--------------------------------------
##完美的天龙头盔·烈焰##    <a href="event:talk_sjtlly1">点击兑换</a>
需:<font color="#FFaa00">完美至尊头盔·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙项链·烈焰##    <a href="event:talk_sjtlly2">点击兑换</a>
需:<font color="#FFaa00">完美至尊项链·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙护腕·烈焰##    <a href="event:talk_sjtlly3">点击兑换</a>
需:<font color="#FFaa00">完美至尊护腕·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙戒指·烈焰##    <a href="event:talk_sjtlly4">点击兑换</a>
需:<font color="#FFaa00">完美至尊戒指·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙腰带·烈焰##    <a href="event:talk_sjtlly5">点击兑换</a>
需:<font color="#FFaa00">完美至尊腰带·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙靴·烈焰##      <a href="event:talk_sjtlly6">点击兑换</a>
需:<font color="#FFaa00">完美至尊靴·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh4c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">天龙无极兑换列表</font>
--------------------------------------
##完美的天龙头盔·无极##    <a href="event:talk_sjtlwj1">点击兑换</a>
需:<font color="#FFaa00">完美至尊头盔·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙项链·无极##    <a href="event:talk_sjtlwj2">点击兑换</a>
需:<font color="#FFaa00">完美至尊项链·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙护腕·无极##    <a href="event:talk_sjtlwj3">点击兑换</a>
需:<font color="#FFaa00">完美至尊护腕·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙戒指·无极##    <a href="event:talk_sjtlwj4">点击兑换</a>
需:<font color="#FFaa00">完美至尊戒指·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙腰带·无极##    <a href="event:talk_sjtlwj5">点击兑换</a>
需:<font color="#FFaa00">完美至尊腰带·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##完美的天龙靴·无极##      <a href="event:talk_sjtlwj6">点击兑换</a>
需:<font color="#FFaa00">完美至尊靴·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end



function onTalksjtlww1(player) sjxbjfzb(player,41029,40,"完美的至尊头盔·武威","完美的天龙头盔·武威",41032,7) end
function onTalksjtlww2(player) sjxbjfzb(player,71039,40,"完美的至尊项链·武威","完美的天龙项链·武威",71042,7) end
function onTalksjtlww3(player) sjxbjfzb(player,61035,40,"完美的至尊护腕·武威","完美的天龙护腕·武威",61038,7) end
function onTalksjtlww4(player) sjxbjfzb(player,51041,40,"完美的至尊戒指·武威","完美的天龙戒指·武威",51044,7) end
function onTalksjtlww5(player) sjxbjfzb(player,91019,40,"完美的至尊腰带·武威","完美的天龙腰带·武威",91022,7) end
function onTalksjtlww6(player) sjxbjfzb(player,101019,40,"完美的至尊靴·武威","完美的天龙靴·武威",101022,7) end

function onTalksjtlly1(player) sjxbjfzb(player,41030,40,"完美的至尊头盔·烈焰","完美的天龙头盔·烈焰",41033,8) end
function onTalksjtlly2(player) sjxbjfzb(player,71040,40,"完美的至尊项链·烈焰","完美的天龙项链·烈焰",71043,8) end
function onTalksjtlly3(player) sjxbjfzb(player,61036,40,"完美的至尊护腕·烈焰","完美的天龙护腕·烈焰",61039,8) end
function onTalksjtlly4(player) sjxbjfzb(player,51042,40,"完美的至尊戒指·烈焰","完美的天龙戒指·烈焰",51045,8) end
function onTalksjtlly5(player) sjxbjfzb(player,91020,40,"完美的至尊腰带·烈焰","完美的天龙腰带·烈焰",91023,8) end
function onTalksjtlly6(player) sjxbjfzb(player,101020,40,"完美的至尊靴·烈焰","完美的天龙靴·烈焰",101023,8) end

function onTalksjtlwj1(player) sjxbjfzb(player,41031,40,"完美的至尊头盔·无极","完美的天龙头盔·无极",41034,9) end
function onTalksjtlwj2(player) sjxbjfzb(player,71041,40,"完美的至尊项链·无极","完美的天龙项链·无极",71044,9) end
function onTalksjtlwj3(player) sjxbjfzb(player,61037,40,"完美的至尊护腕·无极","完美的天龙护腕·无极",61040,9) end
function onTalksjtlwj4(player) sjxbjfzb(player,51043,40,"完美的至尊戒指·无极","完美的天龙戒指·无极",51046,9) end
function onTalksjtlwj5(player) sjxbjfzb(player,91021,40,"完美的至尊腰带·无极","完美的天龙腰带·无极",91024,9) end
function onTalksjtlwj6(player) sjxbjfzb(player,101021,40,"完美的至尊靴·无极","完美的天龙靴·无极",101024,9) end




function onTalkjifendh5(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">三皇武威兑换列表</font>
--------------------------------------
##完美的三皇头盔·武威##    <a href="event:talk_sjshww1">点击兑换</a>
需:<font color="#FFaa00">完美天龙头盔·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇项链·武威##    <a href="event:talk_sjshww2">点击兑换</a>
需:<font color="#FFaa00">完美天龙项链·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇护腕·武威##    <a href="event:talk_sjshww3">点击兑换</a>
需:<font color="#FFaa00">完美天龙护腕·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇戒指·武威##    <a href="event:talk_sjshww4">点击兑换</a>
需:<font color="#FFaa00">完美天龙戒指·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇腰带·武威##    <a href="event:talk_sjshww5">点击兑换</a>
需:<font color="#FFaa00">完美天龙腰带·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇靴·武威##      <a href="event:talk_sjshww6">点击兑换</a>
需:<font color="#FFaa00">完美天龙靴·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh5b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">三皇烈焰兑换列表</font>
--------------------------------------
##完美的三皇头盔·烈焰##    <a href="event:talk_sjshly1">点击兑换</a>
需:<font color="#FFaa00">完美天龙头盔·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇项链·烈焰##    <a href="event:talk_sjshly2">点击兑换</a>
需:<font color="#FFaa00">完美天龙项链·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇护腕·烈焰##    <a href="event:talk_sjshly3">点击兑换</a>
需:<font color="#FFaa00">完美天龙护腕·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇戒指·烈焰##    <a href="event:talk_sjshly4">点击兑换</a>
需:<font color="#FFaa00">完美天龙戒指·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇腰带·烈焰##    <a href="event:talk_sjshly5">点击兑换</a>
需:<font color="#FFaa00">完美天龙腰带·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇靴·烈焰##      <a href="event:talk_sjshly6">点击兑换</a>
需:<font color="#FFaa00">完美天龙靴·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh5c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">三皇无极兑换列表</font>
--------------------------------------
##完美的三皇头盔·无极##    <a href="event:talk_sjshwj1">点击兑换</a>
需:<font color="#FFaa00">完美天龙头盔·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇项链·无极##    <a href="event:talk_sjshwj2">点击兑换</a>
需:<font color="#FFaa00">完美天龙项链·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇护腕·无极##    <a href="event:talk_sjshwj3">点击兑换</a>
需:<font color="#FFaa00">完美天龙护腕·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇戒指·无极##    <a href="event:talk_sjshwj4">点击兑换</a>
需:<font color="#FFaa00">完美天龙戒指·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇腰带·无极##    <a href="event:talk_sjshwj5">点击兑换</a>
需:<font color="#FFaa00">完美天龙腰带·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##完美的三皇靴·无极##      <a href="event:talk_sjshwj6">点击兑换</a>
需:<font color="#FFaa00">完美天龙靴·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end



function onTalksjshww1(player) sjxbjfzb(player,41032,80,"完美的天龙头盔·武威","完美的三皇头盔·武威",41035,10) end
function onTalksjshww2(player) sjxbjfzb(player,71042,80,"完美的天龙项链·武威","完美的三皇项链·武威",71045,10) end
function onTalksjshww3(player) sjxbjfzb(player,61038,80,"完美的天龙护腕·武威","完美的三皇护腕·武威",61041,10) end
function onTalksjshww4(player) sjxbjfzb(player,51044,80,"完美的天龙戒指·武威","完美的三皇戒指·武威",51047,10) end
function onTalksjshww5(player) sjxbjfzb(player,91022,80,"完美的天龙腰带·武威","完美的三皇腰带·武威",91025,10) end
function onTalksjshww6(player) sjxbjfzb(player,101022,80,"完美的天龙靴·武威","完美的三皇靴·武威",101025,10) end

function onTalksjshly1(player) sjxbjfzb(player,41033,80,"完美的天龙头盔·烈焰","完美的三皇头盔·烈焰",41036,11) end
function onTalksjshly2(player) sjxbjfzb(player,71043,80,"完美的天龙项链·烈焰","完美的三皇项链·烈焰",71046,11) end
function onTalksjshly3(player) sjxbjfzb(player,61039,80,"完美的天龙护腕·烈焰","完美的三皇护腕·烈焰",61042,11) end
function onTalksjshly4(player) sjxbjfzb(player,51045,80,"完美的天龙戒指·烈焰","完美的三皇戒指·烈焰",51048,11) end
function onTalksjshly5(player) sjxbjfzb(player,91023,80,"完美的天龙腰带·烈焰","完美的三皇腰带·烈焰",91026,11) end
function onTalksjshly6(player) sjxbjfzb(player,101023,80,"完美的天龙靴·烈焰","完美的三皇靴·烈焰",101026,11) end

function onTalksjshwj1(player) sjxbjfzb(player,41034,80,"完美的天龙头盔·无极","完美的三皇头盔·无极",41037,12) end
function onTalksjshwj2(player) sjxbjfzb(player,71044,80,"完美的天龙项链·无极","完美的三皇项链·无极",71047,12) end
function onTalksjshwj3(player) sjxbjfzb(player,61040,80,"完美的天龙护腕·无极","完美的三皇护腕·无极",61043,12) end
function onTalksjshwj4(player) sjxbjfzb(player,51046,80,"完美的天龙戒指·无极","完美的三皇戒指·无极",51049,12) end
function onTalksjshwj5(player) sjxbjfzb(player,91024,80,"完美的天龙腰带·无极","完美的三皇腰带·无极",91027,12) end
function onTalksjshwj6(player) sjxbjfzb(player,101024,80,"完美的天龙靴·无极","完美的三皇靴·无极",101027,12) end




function onTalkjifendh6xx(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">天威武威兑换列表</font>
--------------------------------------
##完美的天威头盔·武威##    <a href="event:talk_sjtwww1">点击兑换</a>
需:<font color="#FFaa00">完美三皇头盔·武威</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威项链·武威##    <a href="event:talk_sjtwww2">点击兑换</a>
需:<font color="#FFaa00">完美三皇项链·武威</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威护腕·武威##    <a href="event:talk_sjtwww3">点击兑换</a>
需:<font color="#FFaa00">完美三皇护腕·武威</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威戒指·武威##    <a href="event:talk_sjtwww4">点击兑换</a>
需:<font color="#FFaa00">完美三皇戒指·武威</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威腰带·武威##    <a href="event:talk_sjtwww5">点击兑换</a>
需:<font color="#FFaa00">完美三皇腰带·武威</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威靴·武威##      <a href="event:talk_sjtwww6">点击兑换</a>
需:<font color="#FFaa00">完美三皇靴·武威</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh6bxx(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">天威烈焰兑换列表</font>
--------------------------------------
##完美的天威头盔·烈焰##    <a href="event:talk_sjtwly1">点击兑换</a>
需:<font color="#FFaa00">完美三皇头盔·烈焰</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威项链·烈焰##    <a href="event:talk_sjtwly2">点击兑换</a>
需:<font color="#FFaa00">完美三皇项链·烈焰</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威护腕·烈焰##    <a href="event:talk_sjtwly3">点击兑换</a>
需:<font color="#FFaa00">完美三皇护腕·烈焰</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威戒指·烈焰##    <a href="event:talk_sjtwly4">点击兑换</a>
需:<font color="#FFaa00">完美三皇戒指·烈焰</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威腰带·烈焰##    <a href="event:talk_sjtwly5">点击兑换</a>
需:<font color="#FFaa00">完美三皇腰带·烈焰</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威靴·烈焰##      <a href="event:talk_sjtwly6">点击兑换</a>
需:<font color="#FFaa00">完美三皇靴·烈焰</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh6cxx(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">天威无极兑换列表</font>
--------------------------------------
##完美的天威头盔·无极##    <a href="event:talk_sjtwwj1">点击兑换</a>
需:<font color="#FFaa00">完美三皇头盔·无极</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威项链·无极##    <a href="event:talk_sjtwwj2">点击兑换</a>
需:<font color="#FFaa00">完美三皇项链·无极</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威护腕·无极##    <a href="event:talk_sjtwwj3">点击兑换</a>
需:<font color="#FFaa00">完美三皇护腕·无极</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威戒指·无极##    <a href="event:talk_sjtwwj4">点击兑换</a>
需:<font color="#FFaa00">完美三皇戒指·无极</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威腰带·无极##    <a href="event:talk_sjtwwj5">点击兑换</a>
需:<font color="#FFaa00">完美三皇腰带·无极</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
##完美的天威靴·无极##      <a href="event:talk_sjtwwj6">点击兑换</a>
需:<font color="#FFaa00">完美三皇靴·无极</font>+积分<font color="#ff0000">160</font>点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end



function onTalksjtwww1(player) sjxbjfzb(player,41035,160,"完美的三皇头盔·武威","完美的天威头盔·武威",41038,13) end
function onTalksjtwww2(player) sjxbjfzb(player,71045,160,"完美的三皇项链·武威","完美的天威项链·武威",71048,13) end
function onTalksjtwww3(player) sjxbjfzb(player,61041,160,"完美的三皇护腕·武威","完美的天威护腕·武威",61044,13) end
function onTalksjtwww4(player) sjxbjfzb(player,51047,160,"完美的三皇戒指·武威","完美的天威戒指·武威",51050,13) end
function onTalksjtwww5(player) sjxbjfzb(player,91025,160,"完美的三皇腰带·武威","完美的天威腰带·武威",91028,13) end
function onTalksjtwww6(player) sjxbjfzb(player,101025,160,"完美的三皇靴·武威","完美的天威靴·武威",101028,13) end

function onTalksjtwly1(player) sjxbjfzb(player,41036,160,"完美的三皇头盔·烈焰","完美的天威头盔·烈焰",41039,14) end
function onTalksjtwly2(player) sjxbjfzb(player,71046,160,"完美的三皇项链·烈焰","完美的天威项链·烈焰",71049,14) end
function onTalksjtwly3(player) sjxbjfzb(player,61042,160,"完美的三皇护腕·烈焰","完美的天威护腕·烈焰",61045,14) end
function onTalksjtwly4(player) sjxbjfzb(player,51048,160,"完美的三皇戒指·烈焰","完美的天威戒指·烈焰",51051,14) end
function onTalksjtwly5(player) sjxbjfzb(player,91026,160,"完美的三皇腰带·烈焰","完美的天威腰带·烈焰",91029,14) end
function onTalksjtwly6(player) sjxbjfzb(player,101026,160,"完美的三皇靴·烈焰","完美的天威靴·烈焰",101029,14) end

function onTalksjtwwj1(player) sjxbjfzb(player,41037,160,"完美的三皇头盔·无极","完美的天威头盔·无极",41040,15) end
function onTalksjtwwj2(player) sjxbjfzb(player,71047,160,"完美的三皇项链·无极","完美的天威项链·无极",71050,15) end
function onTalksjtwwj3(player) sjxbjfzb(player,61043,160,"完美的三皇护腕·无极","完美的天威护腕·无极",61046,15) end
function onTalksjtwwj4(player) sjxbjfzb(player,51049,160,"完美的三皇戒指·无极","完美的天威戒指·无极",51052,15) end
function onTalksjtwwj5(player) sjxbjfzb(player,91027,160,"完美的三皇腰带·无极","完美的天威腰带·无极",91030,15) end
function onTalksjtwwj6(player) sjxbjfzb(player,101027,160,"完美的三皇靴·无极","完美的天威靴·无极",101030,15) end




function onTalkjifendh7(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">神皇武威兑换列表</font>
--------------------------------------
##完美的神皇头盔·武威##    <a href="event:talk_sjshenhww1">点击兑换</a>
需:<font color="#FFaa00">完美天威头盔·武威</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇项链·武威##    <a href="event:talk_sjshenhww2">点击兑换</a>
需:<font color="#FFaa00">完美天威项链·武威</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇护腕·武威##    <a href="event:talk_sjshenhww3">点击兑换</a>
需:<font color="#FFaa00">完美天威护腕·武威</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇戒指·武威##    <a href="event:talk_sjshenhww4">点击兑换</a>
需:<font color="#FFaa00">完美天威戒指·武威</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇腰带·武威##    <a href="event:talk_sjshenhww5">点击兑换</a>
需:<font color="#FFaa00">完美天威腰带·武威</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇靴·武威##      <a href="event:talk_sjshenhww6">点击兑换</a>
需:<font color="#FFaa00">完美天威靴·武威</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh7b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">神皇烈焰兑换列表</font>
--------------------------------------
##完美的神皇头盔·烈焰##    <a href="event:talk_sjshenhly1">点击兑换</a>
需:<font color="#FFaa00">完美天威头盔·烈焰</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇项链·烈焰##    <a href="event:talk_sjshenhly2">点击兑换</a>
需:<font color="#FFaa00">完美天威项链·烈焰</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇护腕·烈焰##    <a href="event:talk_sjshenhly3">点击兑换</a>
需:<font color="#FFaa00">完美天威护腕·烈焰</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇戒指·烈焰##    <a href="event:talk_sjshenhly4">点击兑换</a>
需:<font color="#FFaa00">完美天威戒指·烈焰</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇腰带·烈焰##    <a href="event:talk_sjshenhly5">点击兑换</a>
需:<font color="#FFaa00">完美天威腰带·烈焰</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇靴·烈焰##      <a href="event:talk_sjshenhly6">点击兑换</a>
需:<font color="#FFaa00">完美天威靴·烈焰</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end

function onTalkjifendh7c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">神皇无极兑换列表</font>
--------------------------------------
##完美的神皇头盔·无极##    <a href="event:talk_sjshenhwj1">点击兑换</a>
需:<font color="#FFaa00">完美天威头盔·无极</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇项链·无极##    <a href="event:talk_sjshenhwj2">点击兑换</a>
需:<font color="#FFaa00">完美天威项链·无极</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇护腕·无极##    <a href="event:talk_sjshenhwj3">点击兑换</a>
需:<font color="#FFaa00">完美天威护腕·无极</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇戒指·无极##    <a href="event:talk_sjshenhwj4">点击兑换</a>
需:<font color="#FFaa00">完美天威戒指·无极</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇腰带·无极##    <a href="event:talk_sjshenhwj5">点击兑换</a>
需:<font color="#FFaa00">完美天威腰带·无极</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
##完美的神皇靴·无极##      <a href="event:talk_sjshenhwj6">点击兑换</a>
需:<font color="#FFaa00">完美天威靴·无极</font>+积分<font color="#ff0000">320</font>点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>     <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end



function onTalksjshenhww1(player) sjxbjfzb(player,41038,320,"完美的天威头盔·武威","完美的神皇头盔·武威",41041,16) end
function onTalksjshenhww2(player) sjxbjfzb(player,71048,320,"完美的天威项链·武威","完美的神皇项链·武威",71051,16) end
function onTalksjshenhww3(player) sjxbjfzb(player,61044,320,"完美的天威护腕·武威","完美的神皇护腕·武威",61047,16) end
function onTalksjshenhww4(player) sjxbjfzb(player,51050,320,"完美的天威戒指·武威","完美的神皇戒指·武威",51053,16) end
function onTalksjshenhww5(player) sjxbjfzb(player,91028,320,"完美的天威腰带·武威","完美的神皇腰带·武威",91031,16) end
function onTalksjshenhww6(player) sjxbjfzb(player,101028,320,"完美的天威靴·武威","完美的神皇靴·武威",101031,16) end

function onTalksjshenhly1(player) sjxbjfzb(player,41039,320,"完美的天威头盔·烈焰","完美的神皇头盔·烈焰",41042,17) end
function onTalksjshenhly2(player) sjxbjfzb(player,71049,320,"完美的天威项链·烈焰","完美的神皇项链·烈焰",71052,17) end
function onTalksjshenhly3(player) sjxbjfzb(player,61045,320,"完美的天威护腕·烈焰","完美的神皇护腕·烈焰",61048,17) end
function onTalksjshenhly4(player) sjxbjfzb(player,51051,320,"完美的天威戒指·烈焰","完美的神皇戒指·烈焰",51054,17) end
function onTalksjshenhly5(player) sjxbjfzb(player,91029,320,"完美的天威腰带·烈焰","完美的神皇腰带·烈焰",91032,17) end
function onTalksjshenhly6(player) sjxbjfzb(player,101029,320,"完美的天威靴·烈焰","完美的神皇靴·烈焰",101032,17) end

function onTalksjshenhwj1(player) sjxbjfzb(player,41040,320,"完美的天威头盔·无极","完美的神皇头盔·无极",41043,18) end
function onTalksjshenhwj2(player) sjxbjfzb(player,71050,320,"完美的天威项链·无极","完美的神皇项链·无极",71053,18) end
function onTalksjshenhwj3(player) sjxbjfzb(player,61046,320,"完美的天威护腕·无极","完美的神皇护腕·无极",61049,18) end
function onTalksjshenhwj4(player) sjxbjfzb(player,51052,320,"完美的天威戒指·无极","完美的神皇戒指·无极",51055,18) end
function onTalksjshenhwj5(player) sjxbjfzb(player,91030,320,"完美的天威腰带·无极","完美的神皇腰带·无极",91033,18) end
function onTalksjshenhwj6(player) sjxbjfzb(player,101030,320,"完美的天威靴·无极","完美的神皇靴·无极",101033,18) end



function onTalkjifendh8(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">战士武器兑换列表</font>
--------------------------------------
##炙炎刀·武威##            <a href="event:talk_jfdhwq1">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##破空斩·武威##            <a href="event:talk_jfdhwq2">点击兑换</a>
需:<font color="#FFaa00">炙炎刀·武威</font>+寻宝积分[<font color="#ff0000">20</font>]点
--------------------------------------
##帝陨剑·武威##            <a href="event:talk_jfdhwq3">点击兑换</a>
需:<font color="#FFaa00">破空斩·武威</font>+寻宝积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿·武威##          <a href="event:talk_jfdhwq4">点击兑换</a>
需:<font color="#FFaa00">帝陨剑·武威</font>+寻宝积分[<font color="#ff0000">80</font>]点
--------------------------------------
##刑天之逆·武威##          <a href="event:talk_jfdhwq5">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿·武威</font>+寻宝积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjifendh8b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">法师武器兑换列表</font>
--------------------------------------
##炙炎刀·烈焰##            <a href="event:talk_jfdhwq1b">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##破空斩·烈焰##            <a href="event:talk_jfdhwq2b">点击兑换</a>
需:<font color="#FFaa00">炙炎刀·烈焰</font>+寻宝积分[<font color="#ff0000">20</font>]点
--------------------------------------
##帝陨剑·烈焰##            <a href="event:talk_jfdhwq3b">点击兑换</a>
需:<font color="#FFaa00">破空斩·烈焰</font>+寻宝积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿·烈焰##          <a href="event:talk_jfdhwq4b">点击兑换</a>
需:<font color="#FFaa00">帝陨剑·烈焰</font>+寻宝积分[<font color="#ff0000">80</font>]点
--------------------------------------
##刑天之逆·烈焰##          <a href="event:talk_jfdhwq5b">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿·烈焰</font>+寻宝积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjifendh8c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">道士武器兑换列表</font>
--------------------------------------
##炙炎刀·无极##            <a href="event:talk_jfdhwq1c">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##破空斩·无极##            <a href="event:talk_jfdhwq2c">点击兑换</a>
需:<font color="#FFaa00">炙炎刀·无极</font>+寻宝积分[<font color="#ff0000">20</font>]点
--------------------------------------
##帝陨剑·无极##            <a href="event:talk_jfdhwq3c">点击兑换</a>
需:<font color="#FFaa00">破空斩·无极</font>+寻宝积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿·无极##          <a href="event:talk_jfdhwq4c">点击兑换</a>
需:<font color="#FFaa00">帝陨剑·无极</font>+寻宝积分[<font color="#ff0000">80</font>]点
--------------------------------------
##刑天之逆·无极##          <a href="event:talk_jfdhwq5c">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿·无极</font>+寻宝积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjfdhwq1(player) dhxbjfzb(player,10,"炙炎刀·武威",4) end
function onTalkjfdhwq2(player) sjxbjfzb(player,20406,20,"炙炎刀·武威","破空斩·武威",20409,19) end
function onTalkjfdhwq3(player) sjxbjfzb(player,20409,40,"破空斩·武威","帝陨剑·武威",20412,19) end
function onTalkjfdhwq4(player) sjxbjfzb(player,20412,80,"帝陨剑·武威","游龙惊鸿·武威",20427,19) end
function onTalkjfdhwq5(player) sjxbjfzb(player,20427,160,"游龙惊鸿·武威","刑天之逆·武威",20430,19) end

function onTalkjfdhwq1b(player) dhxbjfzb(player,10,"炙炎刀·烈焰",5) end
function onTalkjfdhwq2b(player) sjxbjfzb(player,20407,20,"炙炎刀·烈焰","破空斩·烈焰",20410,20) end
function onTalkjfdhwq3b(player) sjxbjfzb(player,20410,40,"破空斩·烈焰","帝陨剑·烈焰",20413,20) end
function onTalkjfdhwq4b(player) sjxbjfzb(player,20413,80,"帝陨剑·烈焰","游龙惊鸿·烈焰",20428,20) end
function onTalkjfdhwq5b(player) sjxbjfzb(player,20428,160,"游龙惊鸿·烈焰","刑天之逆·烈焰",20431,20) end

function onTalkjfdhwq1c(player) dhxbjfzb(player,10,"炙炎刀·无极",5) end
function onTalkjfdhwq2c(player) sjxbjfzb(player,20408,20,"炙炎刀·无极","破空斩·无极",20411,21) end
function onTalkjfdhwq3c(player) sjxbjfzb(player,20411,40,"破空斩·无极","帝陨剑·无极",20414,21) end
function onTalkjfdhwq4c(player) sjxbjfzb(player,20414,80,"帝陨剑·无极","游龙惊鸿·无极",20429,21) end
function onTalkjfdhwq5c(player) sjxbjfzb(player,20429,160,"游龙惊鸿·无极","刑天之逆·无极",20432,21) end




function onTalkjifendh9(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">男战衣服兑换列表</font>
--------------------------------------
##潜龙吟渊甲·武威##        <a href="event:talk_jfdhzj1">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##无双传说甲·武威##        <a href="event:talk_jfdhzj2">点击兑换</a>
需:<font color="#FFaa00">潜龙吟渊甲·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##至尊王者甲·武威##        <a href="event:talk_jfdhzj3">点击兑换</a>
需:<font color="#FFaa00">无双传说甲·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿甲·武威##        <a href="event:talk_jfdhzj4">点击兑换</a>
需:<font color="#FFaa00">至尊王者甲·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##三皇震天甲·武威##        <a href="event:talk_jfdhzj5">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿甲·武威</font>+积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjifendh9b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">男法衣服兑换列表</font>
--------------------------------------
##潜龙吟渊甲·烈焰##        <a href="event:talk_jfdhzj1b">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##无双传说甲·烈焰##        <a href="event:talk_jfdhzj2b">点击兑换</a>
需:<font color="#FFaa00">潜龙吟渊甲·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##至尊王者甲·烈焰##        <a href="event:talk_jfdhzj3b">点击兑换</a>
需:<font color="#FFaa00">无双传说甲·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿甲·烈焰##        <a href="event:talk_jfdhzj4b">点击兑换</a>
需:<font color="#FFaa00">至尊王者甲·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##三皇震天甲·烈焰##        <a href="event:talk_jfdhzj5b">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿甲·烈焰</font>+积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjifendh9c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">男道衣服兑换列表</font>
--------------------------------------
##潜龙吟渊甲·无极##        <a href="event:talk_jfdhzj1c">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##无双传说甲·无极##        <a href="event:talk_jfdhzj2c">点击兑换</a>
需:<font color="#FFaa00">潜龙吟渊甲·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##至尊王者甲·无极##        <a href="event:talk_jfdhzj3c">点击兑换</a>
需:<font color="#FFaa00">无双传说甲·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿甲·无极##        <a href="event:talk_jfdhzj4c">点击兑换</a>
需:<font color="#FFaa00">至尊王者甲·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##三皇震天甲·无极##        <a href="event:talk_jfdhzj5c">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿甲·无极</font>+积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjfdhzj1(player) dhxbjfzb(player,10,"潜龙吟渊甲·武威",7) end
function onTalkjfdhzj2(player) sjxbjfzb(player,30019,20,"潜龙吟渊甲·武威","无双传说甲·武威",30022,22) end
function onTalkjfdhzj3(player) sjxbjfzb(player,30022,40,"无双传说甲·武威","至尊王者甲·武威",30025,22) end
function onTalkjfdhzj4(player) sjxbjfzb(player,30025,80,"至尊王者甲·武威","游龙惊鸿甲·武威",30040,22) end
function onTalkjfdhzj5(player) sjxbjfzb(player,30040,160,"游龙惊鸿甲·武威","三皇震天甲·武威",30043,22) end

function onTalkjfdhzj1b(player) dhxbjfzb(player,10,"潜龙吟渊甲·烈焰",8) end
function onTalkjfdhzj2b(player) sjxbjfzb(player,30020,20,"潜龙吟渊甲·烈焰","无双传说甲·烈焰",30023,23) end
function onTalkjfdhzj3b(player) sjxbjfzb(player,30023,40,"无双传说甲·烈焰","至尊王者甲·烈焰",30026,23) end
function onTalkjfdhzj4b(player) sjxbjfzb(player,30026,80,"至尊王者甲·烈焰","游龙惊鸿甲·烈焰",30041,23) end
function onTalkjfdhzj5b(player) sjxbjfzb(player,30041,160,"游龙惊鸿甲·烈焰","三皇震天甲·烈焰",30044,23) end

function onTalkjfdhzj1c(player) dhxbjfzb(player,10,"潜龙吟渊甲·无极",9) end
function onTalkjfdhzj2c(player) sjxbjfzb(player,30021,20,"潜龙吟渊甲·无极","无双传说甲·无极",30024,24) end
function onTalkjfdhzj3c(player) sjxbjfzb(player,30024,40,"无双传说甲·无极","至尊王者甲·无极",30027,24) end
function onTalkjfdhzj4c(player) sjxbjfzb(player,30027,80,"至尊王者甲·无极","游龙惊鸿甲·无极",30042,24) end
function onTalkjfdhzj5c(player) sjxbjfzb(player,30042,160,"游龙惊鸿甲·无极","三皇震天甲·无极",30045,24) end




function onTalkjifendh10(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">女战衣服兑换列表</font>
--------------------------------------
##潜龙吟渊衣·武威##        <a href="event:talk_jfdhzy1">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##无双传说衣·武威##        <a href="event:talk_jfdhzy2">点击兑换</a>
需:<font color="#FFaa00">潜龙吟渊衣·武威</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##至尊王者衣·武威##        <a href="event:talk_jfdhzy3">点击兑换</a>
需:<font color="#FFaa00">无双传说衣·武威</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿衣·武威##        <a href="event:talk_jfdhzy4">点击兑换</a>
需:<font color="#FFaa00">至尊王者衣·武威</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##三皇震天衣·武威##        <a href="event:talk_jfdhzy5">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿衣·武威</font>+积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjifendh10b(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">女法衣服兑换列表</font>
--------------------------------------
##潜龙吟渊衣·烈焰##        <a href="event:talk_jfdhzy1b">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##无双传说衣·烈焰##        <a href="event:talk_jfdhzy2b">点击兑换</a>
需:<font color="#FFaa00">潜龙吟渊衣·烈焰</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##至尊王者衣·烈焰##        <a href="event:talk_jfdhzy3b">点击兑换</a>
需:<font color="#FFaa00">无双传说衣·烈焰</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿衣·烈焰##        <a href="event:talk_jfdhzy4b">点击兑换</a>
需:<font color="#FFaa00">至尊王者衣·烈焰</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##三皇震天衣·烈焰##        <a href="event:talk_jfdhzy5b">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿衣·烈焰</font>+积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjifendh10c(player)
	player:echo([[--------------------------------------
            <font color="#FFFF00">女道衣服兑换列表</font>
--------------------------------------
##潜龙吟渊衣·无极##        <a href="event:talk_jfdhzy1c">点击兑换</a>
需:寻宝积分[<font color="#ff0000">10</font>]点
--------------------------------------
##无双传说衣·无极##        <a href="event:talk_jfdhzy2c">点击兑换</a>
需:<font color="#FFaa00">潜龙吟渊衣·无极</font>+积分[<font color="#ff0000">20</font>]点
--------------------------------------
##至尊王者衣·无极##        <a href="event:talk_jfdhzy3c">点击兑换</a>
需:<font color="#FFaa00">无双传说衣·无极</font>+积分[<font color="#ff0000">40</font>]点
--------------------------------------
##游龙惊鸿衣·无极##        <a href="event:talk_jfdhzy4c">点击兑换</a>
需:<font color="#FFaa00">至尊王者衣·无极</font>+积分[<font color="#ff0000">80</font>]点
--------------------------------------
##三皇震天衣·无极##        <a href="event:talk_jfdhzy5c">点击兑换</a>
需:<font color="#FFaa00">游龙惊鸿衣·无极</font>+积分[<font color="#ff0000">160</font>]点
--------------------------------------
当前共有寻宝积分: <font color="#FF0000">]]..util.ppn(player,const.PP_XUNBAOJIFEN)..[[点</font>
--------------------------------------
                             <a href="event:talk_fhsy">返回首页</a>
--------------------------------------]]);
end


function onTalkjfdhzy1(player) dhxbjfzb(player,10,"潜龙吟渊衣·武威",10) end
function onTalkjfdhzy2(player) sjxbjfzb(player,35019,20,"潜龙吟渊衣·武威","无双传说衣·武威",35022,25) end
function onTalkjfdhzy3(player) sjxbjfzb(player,35022,40,"无双传说衣·武威","至尊王者衣·武威",35025,25) end
function onTalkjfdhzy4(player) sjxbjfzb(player,35025,80,"至尊王者衣·武威","游龙惊鸿衣·武威",35040,25) end
function onTalkjfdhzy5(player) sjxbjfzb(player,35040,160,"游龙惊鸿衣·武威","三皇震天衣·武威",35043,25) end

function onTalkjfdhzy1b(player) dhxbjfzb(player,10,"潜龙吟渊衣·烈焰",11) end
function onTalkjfdhzy2b(player) sjxbjfzb(player,35020,20,"潜龙吟渊衣·烈焰","无双传说衣·烈焰",35023,26) end
function onTalkjfdhzy3b(player) sjxbjfzb(player,35023,40,"无双传说衣·烈焰","至尊王者衣·烈焰",35026,26) end
function onTalkjfdhzy4b(player) sjxbjfzb(player,35026,80,"至尊王者衣·烈焰","游龙惊鸿衣·烈焰",35041,26) end
function onTalkjfdhzy5b(player) sjxbjfzb(player,35041,160,"游龙惊鸿衣·烈焰","三皇震天衣·烈焰",35044,26) end

function onTalkjfdhzy1c(player) dhxbjfzb(player,10,"潜龙吟渊衣·无极",12) end
function onTalkjfdhzy2c(player) sjxbjfzb(player,35021,20,"潜龙吟渊衣·无极","无双传说衣·无极",35024,27) end
function onTalkjfdhzy3c(player) sjxbjfzb(player,35024,40,"无双传说衣·无极","至尊王者衣·无极",35027,27) end
function onTalkjfdhzy4c(player) sjxbjfzb(player,35027,80,"至尊王者衣·无极","游龙惊鸿衣·无极",35042,27) end
function onTalkjfdhzy5c(player) sjxbjfzb(player,35042,160,"游龙惊鸿衣·无极","三皇震天衣·无极",35045,27) end


function sjxbjfzb(player,a,b,c,d,e,f)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == a then
			if util.ppn(player,const.PP_XUNBAOJIFEN) >= b then
				if player:num_item(c,1) >= 1 then
					local result = player:remove_item_by_type_pos(ittype_id,0);
					if result == 0 then
					--player:remove_item(c,1);
					player:set_param(const.PP_XUNBAOJIFEN,util.ppn(player,const.PP_XUNBAOJIFEN)-b);
					player:add_item(d,1);
					player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
					player:alert(1,1,"<font color='#ff0000'>恭喜您,成功将["..c.."]升级为["..d.."]!</font>");
					end
				else
					player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
				end
			else
				player:alert(1,1,"您的寻宝积分不足"..b.."点,升级失败!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
	else
		player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
	end
	if f==1 then onTalkjifendh2(player); end
	if f==2 then onTalkjifendh2b(player); end
	if f==3 then onTalkjifendh2c(player); end
	if f==4 then onTalkjifendh3(player); end
	if f==5 then onTalkjifendh3b(player); end
	if f==6 then onTalkjifendh3c(player); end
	if f==7 then onTalkjifendh4(player); end
	if f==8 then onTalkjifendh4b(player); end
	if f==9 then onTalkjifendh4c(player); end
	if f==10 then onTalkjifendh5(player); end
	if f==11 then onTalkjifendh5b(player); end
	if f==12 then onTalkjifendh5c(player); end
	if f==13 then onTalkjifendh6(player); end
	if f==14 then onTalkjifendh6b(player); end
	if f==15 then onTalkjifendh6c(player); end
	if f==16 then onTalkjifendh7(player); end
	if f==17 then onTalkjifendh7b(player); end
	if f==18 then onTalkjifendh7c(player); end
	if f==19 then onTalkjifendh8(player); end
	if f==20 then onTalkjifendh8b(player); end
	if f==21 then onTalkjifendh8c(player); end
	if f==22 then onTalkjifendh9(player); end
	if f==23 then onTalkjifendh9b(player); end
	if f==24 then onTalkjifendh9c(player); end
	if f==25 then onTalkjifendh10(player); end
	if f==26 then onTalkjifendh10b(player); end
	if f==27 then onTalkjifendh10c(player); end
end


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function duihuan_lingpai(player)
	player:echo([[---------------------------------------
           <b><font color="#FFFF00">祈福令牌兑换列表</font></b>
---------------------------------------
##青铜令(1级)##          <a href="event:talk_sj1jlp">点击此处兑换</a>
需要: <font color="#ffaa00">祈福声望*10</font>
---------------------------------------
##白银令(2级)##          <a href="event:talk_sj2jlp">点击此处升级</a>
需要: <font color="#ffaa00">青铜令*1,祈福声望*50</font>
---------------------------------------
##魔魂令(3级)##          <a href="event:talk_sj3jlp">点击此处升级</a>
需要: <font color="#ffaa00">白银令*1,祈福声望*110</font>
---------------------------------------
##霸者令(4级)##          <a href="event:talk_sj4jlp">点击此处升级</a>
需要: <font color="#ffaa00">魔魂令*1,祈福声望*235</font>
---------------------------------------
##圣者令(5级)##          <a href="event:talk_sj5jlp">点击此处升级</a>
需要: <font color="#ffaa00">霸者令*1,祈福声望*470</font>
---------------------------------------
##紫阳令(6级)##          <a href="event:talk_sj6jlp">点击此处升级</a>
需要: <font color="#ffaa00">圣者令*1,祈福声望*955</font>
---------------------------------------
                   　　        <a href="event:talk_lpsj2">进入下页</a>
---------------------------------------
]]);
end


function onTalksj1jlp(player)
	if  player:num_item("青铜令(1级)",1) >= 1 or  player:num_item("青铜令(1级)",10) >= 1 or player:num_item("青铜令(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[青铜令],还是别兑换了!!")
	else
		if util.ppn(player,const.PP_QIFU_SHENGWANG) >= 10 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)-10);
				player:add_item("青铜令(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[青铜令(1级)]");
				player:alert(11,0,"本次升级消耗:<font color='#FF0000'>10点祈福声望</font>")
				player:alert(11,0,"还剩祈福声望:<font color='#FF0000'>"..util.ppn(player,const.PP_QIFU_SHENGWANG).."点</font>")
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"您的祈福声望不足10点,无法兑换[青铜令(1级)]!")
		end
	end
	newgui.qifu.fresh_qifu_info(player);
	duihuan_lingpai(player);
end

function onTalklpsj2(player)
	player:echo([[---------------------------------------
           <b><font color="#FFFF00">祈福令牌兑换列表</font></b>
---------------------------------------
##混元令(7级)##          <a href="event:talk_sj7jlp">点击此处升级</a>
需要: <font color="#ffaa00">紫阳令*1,祈福声望*1925</font>
---------------------------------------
##伏龙令(8级)##          <a href="event:talk_sj8jlp">点击此处升级</a>
需要: <font color="#ffaa00">混元令*1,祈福声望*3890</font>
---------------------------------------
##通天令(9级)##          <a href="event:talk_sj9jlp">点击此处升级</a>
需要: <font color="#ffaa00">伏龙令*1,祈福声望*7855</font>
---------------------------------------
##刑天令(10级)##         <a href="event:talk_sj10jlp">点击此处升级</a>
需要: <font color="#ffaa00">通天令*1,祈福声望*15860</font>
---------------------------------------
##虎魄天晶令(11级)##     <a href="event:talk_sj11jlp">点击此处升级</a>
需要: <font color="#ffaa00">刑天令*1,祈福声望*32045</font>
---------------------------------------
##凛日星幻令(12级)##     <a href="event:talk_sj12jlp">点击此处升级</a>
需要: <font color="#ffaa00">虎魄天晶令*1,祈福声望*64725</font>
---------------------------------------
                   　　        <a href="event:talk_lpsj">返回上页</a>
---------------------------------------
]]);
end



function onTalksj2jlp(player) lpsjxt(player,180000,50,"青铜令(1级)","白银令(2级)",180001,1) end
function onTalksj3jlp(player) lpsjxt(player,180001,110,"白银令(2级)","魔魂令(3级)",180002,1) end
function onTalksj4jlp(player) lpsjxt(player,180002,235,"魔魂令(3级)","霸者令(4级)",180003,1) end
function onTalksj5jlp(player) lpsjxt(player,180003,470,"霸者令(4级)","圣者令(5级)",180004,1) end
function onTalksj6jlp(player) lpsjxt(player,180004,955,"圣者令(5级)","紫阳令(6级)",180005,1) end
function onTalksj7jlp(player) lpsjxt(player,180005,1925,"紫阳令(6级)","混元令(7级)",180006,2) end
function onTalksj8jlp(player) lpsjxt(player,180006,3890,"混元令(7级)","伏龙令(8级)",180007,2) end
function onTalksj9jlp(player) lpsjxt(player,180007,7855,"伏龙令(8级)","通天令(9级)",180008,2) end
function onTalksj10jlp(player) lpsjxt(player,180008,15860,"通天令(9级)","刑天令(10级)",180009,2) end
function onTalksj11jlp(player) lpsjxt(player,180009,32045,"刑天令(10级)","虎魄天晶令(11级)",180010,2) end
function onTalksj12jlp(player) lpsjxt(player,180010,64725,"虎魄天晶令(11级)","凛日星幻令(12级)",180011,2) end

function lpsjxt(player,a,b,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if util.ppn(player,const.PP_QIFU_SHENGWANG) >= b then
					if player:num_item(c,1) >= 1 then
					local result = player:remove_item_by_type_pos(a,0);
						if result == 0 then
						player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)-b);
						--player:remove_item(c,1);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						player:alert(11,0,"本次升级消耗:<font color='#FF0000'>"..b.."点祈福声望</font>");
						player:alert(11,0,"还剩祈福声望:<font color='#FF0000'>"..util.ppn(player,const.PP_QIFU_SHENGWANG).."点</font>");
						newgui.jingcaihuodong.setawardpcon(player,"lpsj",d);
						if a >= 180003 then
						server.info(10000,1,"["..player:get_name().."]成功将["..c.."]升级为["..d.."]");
						server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]成功将[<font color='#ff0000'>"..c.."</font>]升级为[<font color='#ff0000'>"..d.."</font>]");
						end
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您的祈福声望不足["..b.."]点,升级失败!")
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
		newgui.qifu.fresh_qifu_info(player);
		if f==1 then onTalklpsj(player); end
		if f==2 then onTalklpsj2(player); end
	end
end


local jlwp_data = {
[1]={
		con=const.SEVEN_DAY_ACTIVITY_LB,
	},
[2]={
		con=const.SEVEN_DAY_ACTIVITY_WQ,
	},
[3]={
		con=const.SEVEN_DAY_ACTIVITY_ZSCH,
	},
[4]={
		con=const.SEVEN_DAY_ACTIVITY_VIPCARD,
	},
[5]={
		con=const.SEVEN_DAY_ACTIVITY_GJJNS,
	},
[6]={
		con=const.SEVEN_DAY_ACTIVITY_MSGY,
	},
[7]={
		con=const.SEVEN_DAY_ACTIVITY_FHLP,
	},
["warrior"]={wq = "破空斩·武威",wqid = "20409",jns="破天斩(1级)",jnsid = "10272",},
["wizard"]={wq = "破空斩·烈焰",wqid = "20410",jns="龙息气焰(1级)",jnsid = "10278",},
["taoist"]={wq = "破空斩·无极",wqid = "20411",jns="气功波(1级)",jnsid = "10284",},
};

function judgebutton(player)
	local loginDays = util.ppn(player,const.PP_LEIJI_LOGINDAYS);
	local wpid = jlwp_data[player:get_job_name()].wqid;
	local jnid = jlwp_data[player:get_job_name()].jnsid;
	player:set_panel_data("panelsevenDay","jlwp5","typeid",jnid);
	player:set_panel_data("panelsevenDay","jlwp2","typeid",wpid);

	if loginDays>7 then
		loginDays = 7;
	end

	for i = 1,loginDays do
		local picTag = "kelingqu"..i;
		local buttonTag = "sevenday"..i;
		local texiaoTag = "texiao"..i;
		if util.ppn(player,jlwp_data[i].con)==0 then
			player:set_panel_data("panelsevenDay",picTag,"visible","true");
			player:set_panel_data("panelsevenDay",buttonTag,"visible","true");
		else
			player:set_panel_data("panelsevenDay",picTag,"visible","true");
			player:set_panel_data("panelsevenDay",picTag,"bgid",20011);	
			player:set_panel_data("panelsevenDay",texiaoTag,"visible","false");
		end
	end
	player:push_ckpanel_data("sevenLogin","panelsevenDay");

	for i = 1,7 do
		local buttonTag = "sevenday"..i;
		if util.ppn(player,jlwp_data[i].con)==0 then
			newgui.sevendayactivity.showGuiMovieClip(player,i);
			player:set_panel_data("panelsevenDay",buttonTag,"bgid",1207);
			player:push_ckpanel_data("sevenLogin","panelsevenDay");
			return;
		end
	end
end


function newhefubutton(player)
	if player:get_level() >= 75 then
		player:set_panel_data("panelNewhefu","btnhfhklb1","picid","80010");	
		player:set_panel_data("panelNewhefu","btnhfhklb1","over","80011");	
		player:set_panel_data("panelNewhefu","hfhklbmv1","y","210");
		player:set_panel_data("panelNewhefu","hfhklbmv2","y","295");
		player:set_panel_data("panelNewhefu","hfhklbmv3","y","380");
		player:set_panel_data("panelNewhefu","hfhklbmv4","y","465");
	end

	if player:get_level() >= 85 then
		player:set_panel_data("panelNewhefu","btnhfhklb2","picid","80010");
		player:set_panel_data("panelNewhefu","btnhfhklb2","over","80011");	
		player:set_panel_data("panelNewhefu","hfhklbmv1","y","295");
		player:set_panel_data("panelNewhefu","hfhklbmv2","y","210");
		player:set_panel_data("panelNewhefu","hfhklbmv3","y","380");
		player:set_panel_data("panelNewhefu","hfhklbmv4","y","465");
	end

	if util.ppn(player,const.PP_ZHUANSHENGLEVEL) >= 1 then
		player:set_panel_data("panelNewhefu","btnhfhklb3","picid","80010");
		player:set_panel_data("panelNewhefu","btnhfhklb3","over","80011");	
		player:set_panel_data("panelNewhefu","hfhklbmv1","y","380");
		player:set_panel_data("panelNewhefu","hfhklbmv2","y","295");
		player:set_panel_data("panelNewhefu","hfhklbmv3","y","210");
		player:set_panel_data("panelNewhefu","hfhklbmv4","y","465");
	end

	if util.ppn(player,const.PP_ZHUANSHENGLEVEL) >= 2 then
		player:set_panel_data("panelNewhefu","btnhfhklb4","picid","80010");
		player:set_panel_data("panelNewhefu","btnhfhklb4","over","80011");	
		player:set_panel_data("panelNewhefu","hfhklbmv1","y","295");
		player:set_panel_data("panelNewhefu","hfhklbmv2","y","380");
		player:set_panel_data("panelNewhefu","hfhklbmv3","y","465");
		player:set_panel_data("panelNewhefu","hfhklbmv4","y","210");
	end

	if server.get_var("svrmegcza1") == nil or server.get_var("svrmegcza1") == "" then
		player:set_panel_data("panelNewhefu","hfczpm1","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data("panelNewhefu","hfczpm1","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza1").."</font><font color='#FF0000'>"..server.get_var("svrmegczc1").."</font>");
	end
	if server.get_var("svrmegcza2") == nil or server.get_var("svrmegcza2") == "" then
		player:set_panel_data("panelNewhefu","hfczpm2","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data("panelNewhefu","hfczpm2","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza2").."</font><font color='#FF0000'>"..server.get_var("svrmegczc2").."</font>");
	end
	if server.get_var("svrmegcza3") == nil or server.get_var("svrmegcza3") == "" then
		player:set_panel_data("panelNewhefu","hfczpm3","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data("panelNewhefu","hfczpm3","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza3").."</font><font color='#FF0000'>"..server.get_var("svrmegczc3").."</font>");
	end

	player:push_ckpanel_data("Newhefu","panelNewhefu");
end


function onTalklpsj(player) duihuan_lingpai(player); end

function onTalkRoseDay(player)		--玫瑰情人节活动
	reset_player_mrczlj_info(player);
	player:echo([[    <font color="#FFFF00"></font>
---------------------------------------
          1.<a href="event:talk_RoseDay1">玫瑰情人节回馈礼包</a>
---------------------------------------
          2.<a href="event:talk_RoseDay2">玫瑰情人节双倍感恩</a>
---------------------------------------
          3.<a href="event:talk_RoseDay3">玫瑰情人节充值返利</a>
---------------------------------------
          4.<a href="event:talk_RoseDay4">玫瑰情人节寻宝特惠</a>
---------------------------------------
          5.<a href="event:talk_RoseDay5">玫瑰情人节充值豪礼</a>
---------------------------------------]]);
end

function onTalkRoseDayp(player)		--玫瑰情人节回馈礼包
	player:echo([[          <font color="#FFFF00">11日游戏补偿礼包</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有60级以上玩家</font>
--------------------------------------
活动时间: <font color="#FFFF00">更新后-5月13日</font>
--------------------------------------
活动范围: <font color="#FFFF00">全服</font>
--------------------------------------
礼包内容: <font color="#FFaa00"> 经验珠(5000万)*2
          绑定元宝*2000</font>
--------------------------------------
          <a href="event:talk_lqRosexxxbc">领取礼包</a>           <a href="event:talk_RoseDay">返回首页</a>
--------------------------------------]]);
end

function onTalklqRosexxxbc(player)			--领取玫瑰情人节回馈礼包
	if ymd() <= 20140513 then
		if player:get_level() >= 60 then
			if player:num_bag_black() >= 2 then
				if util.ppn(player,const.PP_5399_BUCHANG) == 0 then
					player:set_param(const.PP_5399_BUCHANG,1);
					player:add_item("经验珠(5000万)",2,1);
					player:add_vcoin_bind(2000);
					player:alert(11,1,"成功领取[11日游戏补偿礼包]!");
				else
					player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
				end
			else
				player:alert(1,1,"背包空格不足2格,无法领取!");
			end
		else
			player:alert(1,1,"领取该礼包需要等级达到60级以上!");
		end
	else
		player:alert(1,1,"补偿已过期!");
	end
	onTalkRoseDay(player);
end


function onTalkRoseDay1(player)		--玫瑰情人节回馈礼包
	player:echo([[          <font color="#FFFF00">玫瑰情人节回馈礼包</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有50级以上玩家</font>
--------------------------------------
活动时间: <font color="#FFFF00">更新后-5月20日</font>
--------------------------------------
活动范围: <font color="#FFFF00">全服</font>
--------------------------------------
礼包内容: <font color="#FFaa00">四倍宝典*1
          聚 灵 珠*1
          魂石令牌(500)*1
          坐骑经验丹(大)*1
          荣誉令牌(10000)*1
          绑定元宝*2000
          绑定金币*500000</font>
--------------------------------------
          <a href="event:talk_lqRoseDayhklb">领取礼包</a>           <a href="event:talk_RoseDay">返回首页</a>
--------------------------------------]]);
end

function onTalklqRoseDayhklb(player)			--领取玫瑰情人节回馈礼包
	if activity.isRoseDayOpen() then
		if player:get_level() >= 50 then
			if player:num_bag_black() >= 5 then
				if util.ppn(player,const.PP_ROSEDAY_HUIKUILB) == 0 then
					player:set_param(const.PP_ROSEDAY_HUIKUILB,1);
					player:add_item("四倍宝典",1,1);
					player:add_item("聚灵珠",1,1);
					player:add_item("魂石令牌(500)",1,1);
					player:add_item("坐骑经验丹(大)",1,1);
					player:add_item("荣誉令牌(10000)",1,1);
					player:add_vcoin_bind(2000);
					player:add_gamemoney_bind(500000);
					player:alert(11,1,"成功领取[玫瑰情人节回馈礼包]!");
				else
					player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取!!")
				end
			else
				player:alert(1,1,"背包空格不足5格,无法领取!");
			end
		else
			player:alert(1,1,"领取该礼包需要等级达到50级以上!");
		end
	else
		player:alert(1,1,"非活动时间，无法领取！");
	end
	onTalkRoseDay1(player);
end

function onTalkRoseDay2(player)		--玫瑰情人节双倍感恩
	player:echo([[          <font color="#FFFF00">玫瑰情人节双倍感恩</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月16日</font>
--------------------------------------
活动内容: <font color="#FFaa00">活动期间，杀怪经验增加1倍！</font>
          <font color="#FFaa00">战场奖励也将双倍发放！</font>        
--------------------------------------
                             <a href="event:talk_RoseDay">返回首页</a>
--------------------------------------]]);
end

function onTalkRoseDay3(player)		--玫瑰情人节充值返利
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值返利</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFFF00">活动时间内充值只需达到10000元宝即可领取：</font>

##真气丹(1000)##

        <font color="#FF0000">该活动可与每日首充礼包叠加！</font>
--------------------------------------
        <a href="event:talk_lqRoseDayFanliLB">点击领取</a>             <a href="event:talk_RoseDay">返回首页</a>
--------------------------------------]]);
end

function onTalklqRoseDayFanliLB(player)			--领取玫瑰情人节充值返利奖励
	if activity.isRoseDayOpen() then
		if util.ppn(player, const.PP_ROSEDAY_CZFL_BIAOZHI) == 0 then
			if util.ppn(player,const.PP_DAILY_CONGZI) >= 10000 then
				if player:num_bag_black() >= 1 then
					player:set_param(const.PP_ROSEDAY_CZFL_BIAOZHI, 1);
					player:add_item("真气丹(1000)",1,1);
					player:alert(11,1,"成功领取[玫瑰情人节充值回馈奖励]");
				else
					player:alert(1,1,"背包空格不足1格,无法领取!");
				end
			else
				player:alert(1,1,"您活动期间充值的元宝不足10000,无法领取该奖励!!")
			end
		else
			player:alert(1,1,"对不起,您已经领取过该礼包,无法再次领取！")
		end
	else
		player:alert(1,1,"由于您不满足领取条件,暂时无法领取!");
	end
	onTalkRoseDay3(player);
end

function onTalkRoseDay4(player)		--玫瑰情人节寻宝特惠
	player:echo([[          <font color="#FFFF00">玫瑰情人节寻宝特惠</font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月16日</font>
--------------------------------------
活动内容: <font color="#FFFF00">活动期间内,所有服务器寻宝9折优惠</font>
<font color="#FF0000">注: 更新后-5月20日,所有玩家寻宝有几率获得稀有的黄色玫瑰,可兑换获得999套装积分！</font>
--------------------------------------
          <a href="event:talk_dhRoseDayrose">兑换玫瑰</a>           <a href="event:talk_RoseDay">返回首页</a>
--------------------------------------]]);
end

function onTalkdhRoseDayrose(player)		--玫瑰情人节兑换玫瑰
	if not activity.isRoseDayOpen() then
		player:alert(1,1,"非活动时间,感谢您的参与!");
		onTalkRoseDay4(player);
		return;
	end
	local nYellowRose = player:num_item("黄色玫瑰");
	if nYellowRose >= 1 then
		player:remove_item("黄色玫瑰", nYellowRose);
		local nYellowRoseJF = 999 * nYellowRose;
		player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)+nYellowRoseJF);	 	--加套装积分
		player:alert(1, 1, "成功兑换"..nYellowRose.."朵黄色玫瑰，获得 "..nYellowRoseJF.."套装积分！");
		onTalkRoseDay4(player);
		return;
	else
		player:alert(1, 1, "您目前没有黄色玫瑰，无法兑换");
		onTalkRoseDay4(player);
		return
	end
end

function onTalkRoseDay5(player)		
	player:echo([[          <font color="#FFFF00">秋分每日充值豪礼</font>
--------------------------------------
活动时间： <font color="#FFff00">更新后-9月28日</font>
--------------------------------------
活动内容：<font color="#FFFF00">活动时间内，每日充值达到指定的金额，将会获得一份丰厚的礼包</font>
--------------------------------------
礼包内容：<font color="#FFaa00">5000元宝礼包</font>     <a href="event:talk_RoseDaylqlb50">领取礼包</a>
--------------------------------------
		  <font color="#FFaa00">10000元宝礼包</font>    <a href="event:talk_RoseDaylqlb100">领取礼包</a>
--------------------------------------
		  <font color="#FFaa00">30000元宝礼包</font>    <a href="event:talk_RoseDaylqlb300">领取礼包</a>
--------------------------------------
		  <font color="#FFaa00">50000元宝礼包</font>    <a href="event:talk_RoseDaylqlb500">领取礼包</a>
--------------------------------------
		  <font color="#FFaa00">100000元宝礼包</font>   <a href="event:talk_RoseDaylqlb1000">领取礼包</a>
--------------------------------------
		  <font color="#FFaa00">300000元宝礼包</font>   <a href="event:talk_RoseDaylqlb3000">领取礼包</a>
--------------------------------------
		  <font color="#FFaa00">500000元宝礼包</font>   <a href="event:talk_RoseDaylqlb5000">领取礼包</a>
--------------------------------------
<font color="#FF0000">该活动不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
                             <a href="event:talk_RoseDay">返回首页</a>
--------------------------------------]]);
end

local rose_data={
		{key=5000,awardpcon=const.PP_JC_MRLJCZ1,slot=3,award={{name="绑定元宝",num=2000},{name="进阶石",num=100},{name="经验珠(500万)",num=1},{name="灵羽宝箱",num=1},}},
  		{key=10000,awardpcon=const.PP_JC_MRLJCZ2,slot=4,award={{name="绑定元宝",num=5000},{name="进阶石",num=100},{name="经验珠(1000万)",num=1},{name="装备宝箱",num=1},{name="灵羽宝箱",num=1},}},
  		{key=30000,awardpcon=const.PP_JC_MRLJCZ3,slot=4,award={{name="绑定元宝",num=5000},{name="祈福令牌(小)",num=1},{name="经验珠(2000万)",num=1},{name="装备宝箱",num=2},{name="灵羽宝箱",num=2},}},
  		{key=50000,awardpcon=const.PP_JC_MRLJCZ4,slot=4,award={{name="绑定元宝",num=5000},{name="祈福令牌(小)",num=2},{name="经验珠(2000万)",num=1},{name="装备宝箱",num=2},{name="灵羽宝箱",num=2},}},
  		{key=100000,awardpcon=const.PP_JC_MRLJCZ5,slot=5,award={{name="绑定元宝",num=5000},{name="六级灵羽",num=1},{name="七级宝石",num=1},{name="祈福令牌(中)",num=1},{name="经验珠(5000万)",num=1},{name="装备宝箱",num=5},}},
  		{key=300000,awardpcon=const.PP_JC_MRLJCZ6,slot=4,award={{name="绑定元宝",num=5000},{name="七级灵羽",num=1},{name="八级宝石",num=1},{name="祈福令牌(大)",num=1},{name="经验珠(5000万)",num=2},}},
  		{key=500000,awardpcon=const.PP_JC_MRLJCZ7,slot=4,award={{name="绑定元宝",num=5000},{name="八级灵羽",num=1},{name="九级宝石",num=1},{name="祈福令牌(大)",num=2},{name="经验珠(5000万)",num=2},}},
};
function onTalkRoseDaylqlb50(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到5000元宝
          即可领取[5000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*2000
          进阶石*100
          经验珠(500万)*1
          灵羽宝箱*1(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb1">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end

function onTalkRoseDaylqlb100(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到10000元宝
          即可领取[10000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*5000
          进阶石*100
          经验珠(1000万)*1
          装备宝箱*1(<font color="#FFff00">随机珍贵宝石装备</font>)
          灵羽宝箱*1(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb2">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end

function onTalkRoseDaylqlb300(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到30000元宝
          即可领取[30000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*5000
          祈福令牌(小)*1
          经验珠(2000万)*1
          装备宝箱*2(<font color="#FFff00">随机珍贵宝石装备</font>)
          灵羽宝箱*2(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb3">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end
function onTalkRoseDaylqlb500(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到50000元宝
          即可领取[50000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*5000
          祈福令牌(小)*2
          经验珠(2000万)*1
          装备宝箱*2(<font color="#FFff00">随机珍贵宝石装备</font>)
          灵羽宝箱*2(<font color="#FFff00">随机4-8级灵羽</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb4">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end
function onTalkRoseDaylqlb1000(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到100000元宝
          即可领取[100000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*5000
          六级灵羽*1
          七级宝石*1
          祈福令牌(中)*1
          经验珠(5000万)*1
          装备宝箱*5(<font color="#FFff00">随机珍贵宝石装备</font>)</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb5">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end
function onTalkRoseDaylqlb3000(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到300000元宝
          即可领取[300000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*5000
          七级灵羽*1
          八级宝石*1
          祈福令牌(大)*1
          经验珠(5000万)*2</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb6">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end
function onTalkRoseDaylqlb5000(player)
	player:echo([[          <font color="#FFFF00">玫瑰情人节充值豪礼</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-5月20日</font>
--------------------------------------
活动内容: <font color="#FFff00">活动时间内每日累计充值达到500000元宝
          即可领取[500000元宝礼包]</font>
--------------------------------------
礼包内容: <font color="#FFaa00">
          绑定元宝*5000
          八级灵羽*1
          九级宝石*1
          祈福令牌(大)*2
          经验珠(5000万)*2</font>
--------------------------------------
          <font color="#FF0000">此礼包每天可以领取1次!
  不与精彩活动中每日累计充值活动叠加！</font>
--------------------------------------
您今日已充值: ]]..util.ppn(player,const.PP_DAILY_CONGZI)..[[ 元宝
--------------------------------------
          <a href="event:talk_RoseDaylqlb7">领取礼包</a>           <a href="event:talk_RoseDay5">返回上页</a>
--------------------------------------]]);
end
function onTalkRoseDaylqlb1(player) getRoseDayaward(player,1); end
function onTalkRoseDaylqlb2(player) getRoseDayaward(player,2); end
function onTalkRoseDaylqlb3(player) getRoseDayaward(player,3); end
function onTalkRoseDaylqlb4(player) getRoseDayaward(player,4); end
function onTalkRoseDaylqlb5(player) getRoseDayaward(player,5); end
function onTalkRoseDaylqlb6(player) getRoseDayaward(player,6); end
function onTalkRoseDaylqlb7(player) getRoseDayaward(player,7); end

function getRoseDayaward(player,index)
	if not activity.isRoseDayOpen() then
		player:alert(1,1,"非活动时间,感谢您的参与!");
		onTalkRoseDay5(player);
		return;
	end
	if util.ppn(player,const.PP_DAILY_CONGZI) >= rose_data[index].key then
		if player:num_bag_black() >= rose_data[index].slot then
			if util.ppn(player,rose_data[index].awardpcon) ~= today() then
				player:set_param(rose_data[index].awardpcon,today());
				player:add_vcoin_bind(rose_data[index].award[1].num);
				for i=2,#rose_data[index].award do
					player:add_item(rose_data[index].award[i].name,rose_data[index].award[i].num,1);
				end
			else
				player:alert(1,1,"对不起,您今日已经领取过该礼包,无法再次领取!!");
			end
		else
			player:alert(1,1,"背包空格不足"..rose_data[index].slot.."格,无法领取!");
		end
	else
		player:alert(1,1,"充值不足"..rose_data[index].key.."元宝,无法领取！");
	end
	onTalkRoseDay5(player);
end

function onTalkMay37BaiFu(player)
	reset_player_mrczlj_info(player);
	player:echo([[                <font color="#FFFF00">百服活动</font>
---------------------------------------
          1.<a href="event:talk_May37BaiFu1">百服回馈豪华礼包</a>
---------------------------------------
          2.<a href="event:talk_May37BaiFu2">百服双倍感恩回馈</a>
---------------------------------------
          3.<a href="event:talk_May37BaiFu3">百服充值即送守护</a>
---------------------------------------
          4.<a href="event:talk_May37BaiFu8">百服守护升级抢购</a>
---------------------------------------
          5.<a href="event:talk_May37BaiFu4">百服宝石合成盛典</a>
---------------------------------------
          6.<a href="event:talk_May37BaiFu5">百服寻宝积分返利</a>
---------------------------------------
          7.<a href="event:talk_May37BaiFu7">百服每日充值豪礼</a><font color="#FF0000">[超值宝石]</font>
---------------------------------------]]);
end

function onTalkMay37BaiFu1(player)	EchoHuiKuiLB(player, "May37BaiFu", "Day14th")	end
function onTalkMay37BaiFu11(player)	LQHuiKuiLB(player, "May37BaiFu", "Day14th")	onTalkMay37BaiFu1(player)	end
function onTalkMay37BaiFu2(player)	EchoDoubleExp(player, "May37BaiFu")	end

function reset_player_actczlj_info(player)
	if activity.isActChongZhiLeiJi() then
		activity.HUODONG_BIAOSHI = activity.isLastActivityOpen()
		if util.ppn(player,const.PP_ACTIVITY_CZFLAG) <= activity.HUODONG_BIAOSHI then
			player:set_param(const.PP_ACTIVITY_CZFLAG,activity.HUODONG_BIAOSHI+3);
			player:set_param(const.PP_ACTIVITY_CHONGZHI,0);
		end
	else
	end
end

local tLeiJiChongZhiAward = {	Day14th = {		
								szName = "双十二充值即送装备", start = "更新后", over = "12月17日", key = 10000, szAward = "无字天书(1级)", djName="无字天书(1级)", nNum = 1, funcMain = "Day14th",

		   	  				}, 
					}
function onTalkLeiJiChongZhi(player,szActivity)	
	reset_player_actczlj_info(player)
	--local tText = {szName = "月初充值即送徽记", start = "更新后", over = "9月7日", key = 10000, szAward = "霸者徽记", nNum = 15, funcMain = "ChinaJoy",}
	player:echo([[            <font color="#FFFF00">]]..tLeiJiChongZhiAward[szActivity].szName..[[</font>
---------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tLeiJiChongZhiAward[szActivity].start..[[-]]..tLeiJiChongZhiAward[szActivity].over..[[</font>
---------------------------------------
活动内容: <font color="#FFff00">活动时间内充值只需达到]]..tLeiJiChongZhiAward[szActivity].key..[[元宝即可领取：


##]]..tLeiJiChongZhiAward[szActivity].szAward..[[## *]]..tLeiJiChongZhiAward[szActivity].nNum..[[        <a href="event:talk_LeiJiCZLBLQ">领取</a>

</font>
---------------------------------------
您已充值: <font color="#FFaa00">]]..util.ppn(player,const.PP_ACTIVITY_CHONGZHI)..[[元宝</font>
---------------------------------------
                               <a href="event:talk_]]..tLeiJiChongZhiAward[szActivity].funcMain..[[">返回上页</a>
]])
end
function onTalkLeiJiCZLBLQ(player)
	getLeiJiCZLBLQ(player,"Day14th");
end
function getLeiJiCZLBLQ(player,szActivity)
	if activity.isActChongZhiLeiJi() then
		local Key = tLeiJiChongZhiAward[szActivity].key;
		if util.ppn(player,const.PP_ACTIVITY_CHONGZHI) >= Key then
			if util.ppn(player,const.PP_ACTIVITY_SHENKUI) <= activity.HUODONG_BIAOSHI then
				local nBagBlack = 1
				if player:num_bag_black() >= nBagBlack then
					player:set_param(const.PP_ACTIVITY_SHENKUI,activity.HUODONG_BIAOSHI+3);
					local szAward = tLeiJiChongZhiAward[szActivity].djName;
					local nNum = tLeiJiChongZhiAward[szActivity].nNum;
					player:add_item(szAward,nNum,1);
					server.log_count(4,"141212"..szAward,nNum); 	--每次活动修改LOG日期
					player:alert(11,1,"成功领取[<font color='#ee00ee'>"..szAward.."</font>]*"..nNum.."！");
				else
					player:alert(1,1,"对不起,您的背包空格不足"..nBagBlack.."格,无法领取!");
				end
			else
				player:alert(1,1,"您已经领取过该奖励,无法再次领取!")
			end
		else
			player:alert(1,1,"您已充值的元宝不足"..Key..",无法领取!")
		end
	else
		player:alert(1,1,"不在活动时间内，无法领取！")
	end
	onTalkLeiJiChongZhi(player,szActivity);	
end

function onTalkMay37BaiFu8(player)	EchoCWJingYanDan(player, "May37BaiFu")	end
function onTalkMay37BaiFu81(player)	VcoinBuyItemsLimited(player, "May37BaiFu", "守护经验丹(5000万)", 3, const.PP_CWJYD_TIMES1, 990, 1, 1, 1)	onTalkMay37BaiFu8(player)	end
function onTalkMay37BaiFu82(player)	VcoinBuyItemsLimited(player, "May37BaiFu", "守护经验丹(2000万)", 3, const.PP_CWJYD_TIMES2, 400, 1, 1, 1)	onTalkMay37BaiFu8(player)	end

function onTalkMay37BaiFu4(player)
	player:echo([[            <font color="#FFFF00">月末宝石合成盛典</font>
---------------------------------------
活动对象: <font color="#FFff00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">更新后-10月25日</font>
---------------------------------------
活动说明: <font color="#FFff00">活动期间内，所有服务器<font color="#ee00ee">8</font>、<font color="#ee00ee">9</font>、<font color="#ee00ee">10</font>、<font color="#ee00ee">11级宝石</font>合成几率增加<font color="#ee00ee">50%</font>！</font>


---------------------------------------
                              <a href="event:talk_Day14th">返回首页</a>
]]);
end

function onTalkMay37BaiFu5(player)	EchoXunBaoFanLi(player, "May37BaiFu")	end
function onTalkMay37BaiFu51(player)	XunBaoJiFenFLLQ(player, "May37BaiFu", 50, 10, "八级宝石", 1, 1, 1)	onTalkDay14th8(player)	end

function onTalkMay37BaiFu7(player)			EchoZCXFHLMain(player, "May37BaiFu")	end
function onTalkMay37BaiFu50(player)			EchoZCXFHL(player, "May37BaiFu", "recharge", 5000)			end
function onTalkMay37BaiFu100(player)		EchoZCXFHL(player, "May37BaiFu", "recharge", 10000)		end
function onTalkMay37BaiFu300(player)		EchoZCXFHL(player, "May37BaiFu", "recharge", 30000)		end
function onTalkMay37BaiFu500(player)		EchoZCXFHL(player, "May37BaiFu", "recharge", 50000)		end
function onTalkMay37BaiFu1000(player)		EchoZCXFHL(player, "May37BaiFu", "recharge", 100000)		end
function onTalkMay37BaiFu3000(player)		EchoZCXFHL(player, "May37BaiFu", "recharge", 300000)		end
function onTalkMay37BaiFu5000(player)		EchoZCXFHL(player, "May37BaiFu", "recharge", 500000)		end

function onTalkMay37BaiFu50b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 5000)	onTalkMay37BaiFu50(player);		end
function onTalkMay37BaiFu100b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 10000)	onTalkMay37BaiFu100(player);		end
function onTalkMay37BaiFu300b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 30000)	onTalkMay37BaiFu300(player);		end
function onTalkMay37BaiFu500b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 50000)	onTalkMay37BaiFu500(player);		end
function onTalkMay37BaiFu1000b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 100000)	onTalkMay37BaiFu1000(player);		end
function onTalkMay37BaiFu3000b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 300000)	onTalkMay37BaiFu3000(player);		end
function onTalkMay37BaiFu5000b(player)		CZXFLBLQ(player, "May37BaiFu", "recharge", 500000)	onTalkMay37BaiFu5000(player);		end

function onTalkMay37BaiFu601(player)
	player:echo([[<font color="#FFFF00">            百服限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-7月4日</font>
活动说明：<font color="#FFff00">在活动期间内，各位战神可在此处购买特惠价道具！</font>
---------------------------------------
##灵气珠(1000)##            <a href="event:talk_May37BaiFu61">点击购买</a>
现价:<font color="#FFaa00">800 元宝</font>
##灵气珠(5000)##            <a href="event:talk_May37BaiFu62">点击购买</a>
现价:<font color="#FFaa00">3900 元宝</font>
##灵气珠(10000)##           <a href="event:talk_May37BaiFu63">点击购买</a>
现价:<font color="#FFaa00">7600 元宝</font>
##真气丹(1000)##            <a href="event:talk_May37BaiFu64">点击购买</a>
现价:<font color="#FFaa00">990 元宝</font>
##真气丹(10000)##           <a href="event:talk_May37BaiFu65">点击购买</a>
现价:<font color="#FFaa00">9900 元宝</font>
##幸运神符(40%)##           <a href="event:talk_May37BaiFu66">点击购买</a>
现价:<font color="#FFaa00">1200 元宝</font>
---------------------------------------
<a href="event:talk_May37BaiFu">返回首页</a>                        <a href="event:talk_May37BaiFu602">下一页</a>]]);
end

function onTalkMay37BaiFu602(player)
	player:echo([[<font color="#FFFF00">            百服限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-7月4日</font>
活动说明：<font color="#FFff00">在活动期间内，各位战神可在此处购买特惠价道具！</font>
---------------------------------------
##幸运神符(50%)##           <a href="event:talk_May37BaiFu67">点击购买</a>
现价:<font color="#FFaa00">2400 元宝</font>
##幸运神符(100%)##          <a href="event:talk_May37BaiFu68">点击购买</a>
现价:<font color="#FFaa00">24000 元宝</font>
##六级宝石##                <a href="event:talk_May37BaiFu69">点击购买</a>
现价:<font color="#FFaa00">1200 元宝</font>
##七级宝石##                <a href="event:talk_May37BaiFu610">点击购买</a>
现价:<font color="#FFaa00">3960 元宝</font>
##八级宝石##                <a href="event:talk_May37BaiFu611">点击购买</a>
现价:<font color="#FFaa00">13068 元宝</font>
##九级宝石##                <a href="event:talk_May37BaiFu612">点击购买</a>
现价:<font color="#FFaa00">39204 元宝</font>
---------------------------------------
<a href="event:talk_May37BaiFu">返回首页</a>                        <a href="event:talk_May37BaiFu601">上一页</a>]]);
end
--[[
function onTalkMay37BaiFu61(player)		VcoinBuyItems(player,"灵气珠(1000)",800,1,1,1,"灵气珠(1000)")		onTalkMay37BaiFu601(player)	end
function onTalkMay37BaiFu62(player)		VcoinBuyItems(player,"灵气珠(5000)",3900,1,1,1,"灵气珠(5000)")		onTalkMay37BaiFu601(player)	end
function onTalkMay37BaiFu63(player)		VcoinBuyItems(player,"灵气珠(10000)",7600,1,1,1,"灵气珠(10000)")	onTalkMay37BaiFu601(player)	end
function onTalkMay37BaiFu64(player)		VcoinBuyItems(player,"真气丹(1000)",990,1,1,1,"真气丹(1000)")		onTalkMay37BaiFu601(player)	end
function onTalkMay37BaiFu65(player)		VcoinBuyItems(player,"真气丹(10000)",9900,1,1,1,"真气丹(10000)")	onTalkMay37BaiFu601(player)	end
function onTalkMay37BaiFu66(player)		VcoinBuyItems(player,"幸运神符(40%)",1200,1,1,1,"幸运神符(40%)")	onTalkMay37BaiFu601(player)	end
function onTalkMay37BaiFu67(player)		VcoinBuyItems(player,"幸运神符(50%)",2400,1,1,1,"幸运神符(50%)")	onTalkMay37BaiFu602(player)	end
function onTalkMay37BaiFu68(player)		VcoinBuyItems(player,"幸运神符(100%)",24000,1,1,1,"幸运神符(100%)")	onTalkMay37BaiFu602(player)	end
function onTalkMay37BaiFu69(player)		VcoinBuyItems(player,"六级宝石",1200,1,1,1,"六级宝石")				onTalkMay37BaiFu602(player)	end
function onTalkMay37BaiFu610(player)	VcoinBuyItems(player,"七级宝石",3960,1,1,1,"七级宝石")				onTalkMay37BaiFu602(player)	end
function onTalkMay37BaiFu611(player)	VcoinBuyItems(player,"八级宝石",13068,1,1,1,"八级宝石")				onTalkMay37BaiFu602(player)	end
function onTalkMay37BaiFu612(player)	VcoinBuyItems(player,"九级宝石",39204,1,1,1,"九级宝石")				onTalkMay37BaiFu602(player)	end
--]]
function reset_player_mrczxflj_info(player)
	if util.ppn(player,const.PP_LEIJIXF_DATE) ~= today() then
		player:set_param(const.PP_LEIJIXF_DATE,today());
		player:set_param(const.PP_LEIJIXF,0);
	end
	if util.ppn(player,const.PP_CONGZI_DAY) ~= today() then
		player:set_param(const.PP_CONGZI_DAY,today());
		player:set_param(const.PP_DAILY_CONGZI,0);
	end
end

function onTalkXiaRi(player)
	reset_player_mrczlj_info(player);
	player:echo([[                <font color="#FFFF00">夏日活动</font>
---------------------------------------
          1.<a href="event:talk_XiaRi1">夏日超值回馈礼包</a>
---------------------------------------
          2.<a href="event:talk_XiaRi2">夏日双倍感恩回馈</a>
---------------------------------------
          3.<a href="event:talk_XiaRi3">夏日每日充值返利</a>
---------------------------------------
          4.<a href="event:talk_XiaRi41">夏日限时折扣商城</a>
---------------------------------------
          5.<a href="event:talk_XiaRi5">夏日冲级超值抢购</a>
---------------------------------------
          6.<a href="event:talk_XiaRi6">夏日双倍转生盛典</a>
---------------------------------------
          7.<a href="event:talk_XiaRi7">夏日装备强化放送</a>
---------------------------------------
          8.<a href="event:talk_XiaRi8">夏日充值豪华礼包</a>
---------------------------------------]]);
end

function onTalkXiaRi1(player)		EchoHuiKuiLB(player, "XiaRi", "common")	end
function onTalkXiaRi11(player)		LQHuiKuiLB(player, "XiaRi", "common")	onTalkXiaRi1(player)	end

function onTalkXiaRi2(player)		EchoDoubleExp(player, "XiaRi")	end

function onTalkXiaRi3(player)		EchoMRZCFL(player, "XiaRi")		end
function onTalkXiaRi31(player)		MRCZFLLQLB(player, "XiaRi")	onTalkXiaRi3(player)	end

function onTalkXiaRi41(player)
player:echo([[<font color="#FFFF00">            夏日限时折扣商城</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-6月11日</font>
活动说明: <font color="#FFff00">在活动期间内，珍稀道具疯狂打折！</font>
---------------------------------------
##真气丹(1000)##            <a href="event:talk_XiaRi421">点击购买</a>
原价:<font color="#FF0000">2000元宝</font>       现价:<font color="#FFaa00">990元宝</font>

##真气丹(10000)##           <a href="event:talk_XiaRi422">点击购买</a>
原价:<font color="#FF0000">20000元宝</font>      现价:<font color="#FFaa00">9900元宝</font>

##幸运神符(30%)##           <a href="event:talk_XiaRi423">点击购买</a>
原价:<font color="#FF0000">1200元宝</font>       现价:<font color="#FFaa00">600元宝</font>

##幸运神符(40%)##           <a href="event:talk_XiaRi424">点击购买</a>
原价:<font color="#FF0000">2400元宝</font>       现价:<font color="#FFaa00">1200元宝</font>

##幸运神符(50%)##           <a href="event:talk_XiaRi425">点击购买</a>
原价:<font color="#FF0000">4800元宝</font>       现价:<font color="#FFaa00">2400元宝</font>
--------------------------------------
<a href="event:talk_XiaRi">返回首页</a>                      <a href="event:talk_XiaRi42">下一页</a>]]);
end

function onTalkXiaRi42(player)
player:echo([[
##幸运神符(100%)##          <a href="event:talk_XiaRi426">点击购买</a>
原价:<font color="#FF0000">48000元宝</font>      现价:<font color="#FFaa00">24000元宝</font>

##七级宝石##                <a href="event:talk_XiaRi411">点击购买</a>
原价:<font color="#FF0000">7920元宝</font>       现价:<font color="#FFaa00">3960元宝</font>

##八级宝石##                <a href="event:talk_XiaRi412">点击购买</a>
原价:<font color="#FF0000">26136元宝</font>      现价:<font color="#FFaa00">13068元宝</font>

##九级宝石##                <a href="event:talk_XiaRi413">点击购买</a>
原价:<font color="#FF0000">78408元宝</font>      现价:<font color="#FFaa00">39204元宝</font>

##中级融合符##              <a href="event:talk_XiaRi414">点击购买</a>
原价:<font color="#FF0000">4685元宝</font>       现价:<font color="#FFaa00">2342元宝</font>

##高级融合符##              <a href="event:talk_XiaRi415">点击购买</a>
原价:<font color="#FF0000">16200元宝</font>      现价:<font color="#FFaa00">8100元宝</font>

##超级融合符##              <a href="event:talk_XiaRi416">点击购买</a>
原价:<font color="#FF0000">32400元宝</font>      现价:<font color="#FFaa00">16200元宝</font>
--------------------------------------
<a href="event:talk_XiaRi">返回首页</a>                      <a href="event:talk_XiaRi41">上一页</a>]]);
end

local tZheKouShangCheng = {
	{name = "七级宝石", num = 1, price = 3960, nBagBlack = 1, log = "七级宝石",}, {name = "八级宝石", num = 1, price = 13068, nBagBlack = 1, log = "八级宝石",}, 
	{name = "九级宝石", num = 1, price = 39204, nBagBlack = 1, log = "九级宝石",}, {name = "中级融合符", num = 1, price = 2342, nBagBlack = 1, log = "中级融合符",}, 
	{name = "高级融合符", num = 1, price = 8100, nBagBlack = 1, log = "高级融合符",}, {name = "超级融合符", num = 1, price = 16200, nBagBlack = 1, log = "超级融合符",}, 
	{name = "真气丹(1000)", num = 1, price = 990, nBagBlack = 1, log = "真气丹(1000)",}, {name = "真气丹(10000)", num = 1, price = 9900, nBagBlack = 1, log = "真气丹(10000)",}, 
	{name = "幸运神符(30%)", num = 1, price = 600, nBagBlack = 1, log = "幸运神符(30%)",}, {name = "幸运神符(40%)", num = 1, price = 1200, nBagBlack = 1, log = "幸运神符(40%)",}, 
	{name = "幸运神符(50%)", num = 1, price = 2400, nBagBlack = 1, log = "幸运神符(50%)",}, {name = "幸运神符(100%)", num = 1, price = 24000, nBagBlack = 1, log = "幸运神符(100%)",}, 
}	--通用折扣商城物品列表

function BuyZheKou(player, szActivity, nIndex)	--通用折扣商城购买物品
	if szActivity == "XiaRi" and not activity.isXiaRiOpen() then
		player:alert(11,1,"非活动时间，无法购买哦!")
		return
	end
	if player:get_vcoin() < tZheKouShangCheng[nIndex].price then
		player:alert(11,1,"您的元宝不足["..tZheKouShangCheng[nIndex].price.."],无法购买["..tZheKouShangCheng[nIndex].name.."]!")
		return
	end
	if player:num_bag_black() < tZheKouShangCheng[nIndex].nBagBlack then
		player:alert(1,1,"对不起,您的背包空格不足"..tZheKouShangCheng[nIndex].nBagBlack.."格,无法购买!")
		return
	end
	player:sub_vcoin(tZheKouShangCheng[nIndex].price,tZheKouShangCheng[nIndex].log)
	player:add_item(tZheKouShangCheng[nIndex].name,tZheKouShangCheng[nIndex].num,1)
	player:alert(11,1,"成功使用["..tZheKouShangCheng[nIndex].price.."]元宝购买["..tZheKouShangCheng[nIndex].name.."]!");
	return
end

function onTalkXiaRi411(player)		BuyZheKou(player, "XiaRi", 1)	onTalkXiaRi42(player)	end
function onTalkXiaRi412(player)		BuyZheKou(player, "XiaRi", 2)	onTalkXiaRi42(player)	end
function onTalkXiaRi413(player)		BuyZheKou(player, "XiaRi", 3)	onTalkXiaRi42(player)	end
function onTalkXiaRi414(player)		BuyZheKou(player, "XiaRi", 4)	onTalkXiaRi42(player)	end
function onTalkXiaRi415(player)		BuyZheKou(player, "XiaRi", 5)	onTalkXiaRi42(player)	end
function onTalkXiaRi416(player)		BuyZheKou(player, "XiaRi", 6)	onTalkXiaRi42(player)	end
function onTalkXiaRi421(player)		BuyZheKou(player, "XiaRi", 7)	onTalkXiaRi41(player)	end
function onTalkXiaRi422(player)		BuyZheKou(player, "XiaRi", 8)	onTalkXiaRi41(player)	end
function onTalkXiaRi423(player)		BuyZheKou(player, "XiaRi", 9)	onTalkXiaRi41(player)	end
function onTalkXiaRi424(player)		BuyZheKou(player, "XiaRi", 10)	onTalkXiaRi41(player)	end
function onTalkXiaRi425(player)		BuyZheKou(player, "XiaRi", 11)	onTalkXiaRi41(player)	end
function onTalkXiaRi426(player)		BuyZheKou(player, "XiaRi", 12)	onTalkXiaRi42(player)	end

function onTalkXiaRi5(player)	EchoJingYanDan(player, "XiaRi")	end
function onTalkXiaRi51(player)	VcoinBuyItemsLimited(player, "XiaRi", "经验珠(5000万)", 3, const.PP_JC_SJQG_TIMES1, 990, 1, 1, 1)	onTalkXiaRi5(player)	end
function onTalkXiaRi52(player)	VcoinBuyItemsLimited(player, "XiaRi", "经验珠(2000万)", 3, const.PP_JC_SJQG_TIMES2, 400, 1, 1, 1)	onTalkXiaRi5(player)	end

function onTalkXiaRi6(player)	EchoDoubleZhuanSheng(player, "XiaRi")	end

local tZBQHText = {XiaRi = {szTitle = "夏日装备强化放送", start = "更新后", over = "6月11日", szMainFunc = "XiaRi"}
}		--通用装备强化对话面板

local tZBQHAward = {XiaRi = {	{key = 7, szAcceptFunc = "XiaRi71", awardpcon = const.PP_XIARI_ZBQHFS1, nBagBlack = 1, award = {{name = "真气丹(100)", num = 5},},},
		   					  	{key = 8, szAcceptFunc = "XiaRi72", awardpcon = const.PP_XIARI_ZBQHFS2, nBagBlack = 1, award = {{name = "真气丹(1000)", num = 1},},},
		   	  					{key = 9, szAcceptFunc = "XiaRi73", awardpcon = const.PP_XIARI_ZBQHFS3, nBagBlack = 1, award = {{name = "真气丹(1000)", num = 2},},},
		   	 					{key = 10, szAcceptFunc = "XiaRi74", awardpcon = const.PP_XIARI_ZBQHFS4, nBagBlack = 1, award = {{name = "真气丹(1000)", num = 3},},},
		   	  					{key = 11, szAcceptFunc = "XiaRi75", awardpcon = const.PP_XIARI_ZBQHFS5, nBagBlack = 1, award = {{name = "真气丹(1000)", num = 5},},},
		   	  					{key = 12, szAcceptFunc = "XiaRi76", awardpcon = const.PP_XIARI_ZBQHFS6, nBagBlack = 1, award = {{name = "真气丹(10000)", num = 1},},},
		   	  				}, 
					}		--装备强化奖励表

function EchoZBQHText(player, szActivity)		--通用装备强化对话面板
	player:echo([[            <font color="#FFFF00">]]..tZBQHText[szActivity].szTitle..[[</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tZBQHText[szActivity].start..[[-]]..tZBQHText[szActivity].over..[[</font>
---------------------------------------
活动内容: <font color="#FFaa00">在活动期间，强化任意装备至：

 <a href="event:talk_]]..tZBQHAward[szActivity][1].szAcceptFunc..[[">+7  即可领取</a>  真气丹(100)*5  （]]..util.ppn(player,tZBQHAward[szActivity][1].awardpcon)..[[次）

 <a href="event:talk_]]..tZBQHAward[szActivity][2].szAcceptFunc..[[">+8  即可领取</a>  真气丹(1000)*1 （]]..util.ppn(player,tZBQHAward[szActivity][2].awardpcon)..[[次）

 <a href="event:talk_]]..tZBQHAward[szActivity][3].szAcceptFunc..[[">+9  即可领取</a>  真气丹(1000)*2 （]]..util.ppn(player,tZBQHAward[szActivity][3].awardpcon)..[[次）

<a href="event:talk_]]..tZBQHAward[szActivity][4].szAcceptFunc..[[">+10  即可领取</a>  真气丹(1000)*3 （]]..util.ppn(player,tZBQHAward[szActivity][4].awardpcon)..[[次）

<a href="event:talk_]]..tZBQHAward[szActivity][5].szAcceptFunc..[[">+11  即可领取</a>  真气丹(1000)*5 （]]..util.ppn(player,tZBQHAward[szActivity][5].awardpcon)..[[次）

<a href="event:talk_]]..tZBQHAward[szActivity][6].szAcceptFunc..[[">+12  即可领取</a>  真气丹(10000)*1（]]..util.ppn(player,tZBQHAward[szActivity][6].awardpcon)..[[次）</font>
---------------------------------------
活动说明：<font color="#FF0000">该活动与精彩活动中装备强化放送活动叠加！</font>
---------------------------------------
                          <a href="event:talk_]]..tZBQHText[szActivity].szMainFunc..[[">返回首页</a>
---------------------------------------]]);
end

function onTalkXiaRi7(player)	EchoZBQHText(player, "XiaRi")	end

function SetZBQHParam(player, szActivity, tolevel)
	for k,v in pairs(tZBQHAward[szActivity]) do
		if v.key == tolevel then
			player:set_param(v.awardpcon,util.ppn(player,v.awardpcon)+1)
			return
		end
	end
end

function LingQuZBQHLB(player, szActivity, nIndex)		--通用装备强化奖励领取
	if szActivity == "XiaRi" and not activity.isXiaRiOpen() then
		player:alert(11,1,"不在活动时间内，无法领取礼包！")
		return
	end
	if util.ppn(player,tZBQHAward[szActivity][nIndex].awardpcon) < 1 then
		player:alert(11,1,"对不起，您没有可领取的礼包！")
		return
	end
	if player:num_bag_black() < tZBQHAward[szActivity][nIndex].nBagBlack then
		player:alert(11,1,"背包空格不足"..tZBQHAward[szActivity][nIndex].nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tZBQHAward[szActivity][nIndex].awardpcon,util.ppn(player,tZBQHAward[szActivity][nIndex].awardpcon)-1)
	player:alert(11,1,"成功领取[+"..tZBQHAward[szActivity][nIndex].key.."装备强化礼包]!");
	for i = 1, #tZBQHAward[szActivity][nIndex].award do
		player:add_item(tZBQHAward[szActivity][nIndex].award[i].name, tZBQHAward[szActivity][nIndex].award[i].num, 1)
		player:alert(10, 0, tZBQHAward[szActivity][nIndex].award[i].name.." * "..tZBQHAward[szActivity][nIndex].award[i].num)
	end
end

function onTalkXiaRi71(player)	LingQuZBQHLB(player, "XiaRi", 1)	onTalkXiaRi7(player)	end
function onTalkXiaRi72(player)	LingQuZBQHLB(player, "XiaRi", 2)	onTalkXiaRi7(player)	end
function onTalkXiaRi73(player)	LingQuZBQHLB(player, "XiaRi", 3)	onTalkXiaRi7(player)	end
function onTalkXiaRi74(player)	LingQuZBQHLB(player, "XiaRi", 4)	onTalkXiaRi7(player)	end
function onTalkXiaRi75(player)	LingQuZBQHLB(player, "XiaRi", 5)	onTalkXiaRi7(player)	end
function onTalkXiaRi76(player)	LingQuZBQHLB(player, "XiaRi", 6)	onTalkXiaRi7(player)	end

function onTalkXiaRi8(player)	EchoZCXFHLMain(player, "XiaRi")	end

function onTalkXiaRi50(player)		EchoZCXFHL(player, "XiaRi", "recharge", 5000)		end
function onTalkXiaRi100(player)		EchoZCXFHL(player, "XiaRi", "recharge", 10000)	end
function onTalkXiaRi300(player)		EchoZCXFHL(player, "XiaRi", "recharge", 30000)	end
function onTalkXiaRi500(player)		EchoZCXFHL(player, "XiaRi", "recharge", 50000)	end
function onTalkXiaRi1000(player)	EchoZCXFHL(player, "XiaRi", "recharge", 100000)	end
function onTalkXiaRi3000(player)	EchoZCXFHL(player, "XiaRi", "recharge", 300000)	end
function onTalkXiaRi5000(player)	EchoZCXFHL(player, "XiaRi", "recharge", 500000)	end

function onTalkXiaRi50b(player)		CZXFLBLQ(player, "XiaRi", "recharge", 5000)	onTalkXiaRi50(player);		end
function onTalkXiaRi100b(player)	CZXFLBLQ(player, "XiaRi", "recharge", 10000)	onTalkXiaRi100(player);		end
function onTalkXiaRi300b(player)	CZXFLBLQ(player, "XiaRi", "recharge", 30000)	onTalkXiaRi300(player);		end
function onTalkXiaRi500b(player)	CZXFLBLQ(player, "XiaRi", "recharge", 50000)	onTalkXiaRi500(player);		end
function onTalkXiaRi1000b(player)	CZXFLBLQ(player, "XiaRi", "recharge", 100000)	onTalkXiaRi1000(player);	end
function onTalkXiaRi3000b(player)	CZXFLBLQ(player, "XiaRi", "recharge", 300000)	onTalkXiaRi3000(player);	end
function onTalkXiaRi5000b(player)	CZXFLBLQ(player, "XiaRi", "recharge", 500000)	onTalkXiaRi5000(player);	end

function onTalkNewYear(player)
	player:echo([[               <font color="#FFFF00">春分活动</font>
----------------------------------------
         1.<a href="event:talk_NewYear1">春分回馈豪华礼包</a>
----------------------------------------
         2.<a href="event:talk_NewYear2">春分双倍感恩回馈</a>
----------------------------------------
         3.<a href="event:talk_NewYear3">春分充值灵魂豪礼</a>
----------------------------------------
         4.<a href="event:talk_NewYear4">春分升级超值抢购</a>
----------------------------------------
         5.<a href="event:talk_NewYear5">春分玄晶合成盛典</a>
----------------------------------------
         6.<a href="event:talk_ZheKouMallLimited">春分限时折扣商城</a>
----------------------------------------
         7.<a href="event:talk_Day14th16">春分每日消费豪礼</a>
           [<font color="#FF0000">天蚕精华</font>]
----------------------------------------
         8.<a href="event:talk_ShuJia8">春分神装限时升级</a>
----------------------------------------]]);
end
function onTalkNewYear1(player)		EchoHuiKuiLB(player, "NewYear", "Day14th")			end
function onTalkNewYear11(player)	LQHuiKuiLB(player, "NewYear", "Day14th")	onTalkNewYear1(player)	end
function onTalkNewYear2(player)		EchoDoubleExp(player, "NewYear")		end
function onTalkNewYear3(player)		EchoMRZCFL(player, "NewYear")			end--每日充值即送
function onTalkNewYear31(player)	MRCZFLLQLB(player, "NewYear")	onTalkNewYear3(player)	end
function onTalkNewYear4(player)		EchoShengjiQianggou(player, "NewYear")			end --EchoShengjiQianggou(player, "Day14th") EchoJingYanDan(player, "Day14th")  EchoCWJingYanDan(player, "Day14th")
function onTalkNewYear41(player)	VcoinBuyItemsLimited(player, "NewYear", "经验珠(5000万)", 3, const.PP_JC_SJQG_TIMES1, 990, 1, 1, 1)	onTalkNewYear4(player)	end
function onTalkNewYear42(player)	VcoinBuyItemsLimited(player, "NewYear", "经验珠(2000万)", 3, const.PP_JC_SJQG_TIMES2, 400, 1, 1, 1)	onTalkNewYear4(player)	end
function onTalkNewYear43(player)	VcoinBuyItemsLimited(player, "NewYear", "守护经验丹(5000万)", 3, const.PP_CWJYD_TIMES1, 990, 1, 1, 1)	onTalkNewYear4(player)	end
function onTalkNewYear44(player)	VcoinBuyItemsLimited(player, "NewYear", "守护经验丹(2000万)", 3, const.PP_CWJYD_TIMES2, 400, 1, 1, 1)	onTalkNewYear4(player)	end
function onTalkNewYear5(player)		EchoXuanJingHeChengShengdian(player, "NewYear")			end 
function onTalkNewYear7(player)		EchoZCXFHLMain(player, "NewYear")			end 
function onTalkNewYear50(player)	EchoZCXFHL(player, "NewYear", "recharge", 5000)		end
function onTalkNewYear100(player)	EchoZCXFHL(player, "NewYear", "recharge", 10000)	end
function onTalkNewYear300(player)	EchoZCXFHL(player, "NewYear", "recharge", 30000)	end
function onTalkNewYear500(player)	EchoZCXFHL(player, "NewYear", "recharge", 50000)	end
function onTalkNewYear1000(player)	EchoZCXFHL(player, "NewYear", "recharge", 100000)	end
function onTalkNewYear3000(player)	EchoZCXFHL(player, "NewYear", "recharge", 300000)	end
function onTalkNewYear5000(player)	EchoZCXFHL(player, "NewYear", "recharge", 500000)	end

function onTalkNewYear50b(player)	CZXFLBLQ(player, "NewYear", "recharge", 5000)	onTalkNewYear50(player)		end
function onTalkNewYear100b(player)	CZXFLBLQ(player, "NewYear", "recharge", 10000)	onTalkNewYear100(player)	end
function onTalkNewYear300b(player)	CZXFLBLQ(player, "NewYear", "recharge", 30000)	onTalkNewYear300(player)	end
function onTalkNewYear500b(player)	CZXFLBLQ(player, "NewYear", "recharge", 50000)	onTalkNewYear500(player)	end
function onTalkNewYear1000b(player)	CZXFLBLQ(player, "NewYear", "recharge", 100000)	onTalkNewYear1000(player)	end
function onTalkNewYear3000b(player)	CZXFLBLQ(player, "NewYear", "recharge", 300000)	onTalkNewYear3000(player)	end
function onTalkNewYear5000b(player)	CZXFLBLQ(player, "NewYear", "recharge", 500000)	onTalkNewYear5000(player)	end

function onTalkDay14th(player)
	player:echo([[               <font color="#FFFF00">白色情人节</font>
----------------------------------------
         1.<a href="event:talk_Day14th1">白色情人节回馈豪华礼包</a>
----------------------------------------
         2.<a href="event:talk_Day14th2">白色情人节双倍感恩回馈</a>
----------------------------------------
         3.<a href="event:talk_Day14th3">白色情人节每日灵魂豪礼</a>
----------------------------------------
         4.<a href="event:talk_Day14th4">白色情人节升级超值抢购</a>
----------------------------------------
         5.<a href="event:talk_PetJinJie">白色情人节守护进化折扣</a>
----------------------------------------
         6.<a href="event:talk_Day14th17">白色情人节守护进化回馈</a>
----------------------------------------
         7.<a href="event:talk_ZiZhiTiSheng">白色情人节守护资质盛典</a>
----------------------------------------
         8.<a href="event:talk_Day14th18">白色情人节守护资质回馈</a>
----------------------------------------
         9.<a href="event:talk_Day14th19">白色情人节每日充值豪礼</a>
           [<font color="#FF0000">天蚕精华和十级玄晶宝箱</font>]
----------------------------------------]]);
end
-- 8.<a href="event:talk_Day14th7">立冬每日充值豪礼</a>

function onTalkDay14th1(player)		EchoHuiKuiLB(player, "Day14th", "Day14th")			end
function onTalkDay14th11(player)	LQHuiKuiLB(player, "Day14th", "Day14th")	onTalkDay14th1(player)	end
function onTalkDay14th2(player)		EchoDoubleExp(player, "Day14th")		end
function onTalkDay14th5(player)		EchoShenqishengdian(player, "Day14th")		end
function onTalkDay14th8(player)		EchoXunBaoFanLi(player, "Day14th")	end
function onTalkDay14th3(player)		EchoMRZCFL(player, "Day14th")			end--每日充值即送
function onTalkDay14th31(player)	MRCZFLLQLB(player, "Day14th")	onTalkDay14th3(player)	end
function onTalkDay14th4(player)		EchoShengjiQianggou(player, "Day14th")			end --EchoShengjiQianggou(player, "Day14th") EchoJingYanDan(player, "Day14th")  EchoCWJingYanDan(player, "Day14th")
function onTalkDay14th41(player)	VcoinBuyItemsLimited(player, "Day14th", "经验珠(5000万)", 3, const.PP_JC_SJQG_TIMES1, 990, 1, 1, 1)	onTalkDay14th4(player)	end
function onTalkDay14th42(player)	VcoinBuyItemsLimited(player, "Day14th", "经验珠(2000万)", 3, const.PP_JC_SJQG_TIMES2, 400, 1, 1, 1)	onTalkDay14th4(player)	end
function onTalkDay14th43(player)	VcoinBuyItemsLimited(player, "Day14th", "守护经验丹(5000万)", 3, const.PP_CWJYD_TIMES1, 990, 1, 1, 1)	onTalkDay14th4(player)	end
function onTalkDay14th44(player)	VcoinBuyItemsLimited(player, "Day14th", "守护经验丹(2000万)", 3, const.PP_CWJYD_TIMES2, 400, 1, 1, 1)	onTalkDay14th4(player)	end

function onTalklinghun3(player)		EchoMRZCFL(player, "linghun")	end
function onTalklinghun31(player)	MRCZFLLQLB(player, "linghun")	onTalklinghun3(player)	end

function onTalkqbt3(player)		EchoMRZCFL(player, "qbt")	end
function onTalkqbt31(player)	MRCZFLLQLB(player, "qbt")	onTalkqbt3(player)	end

function onTalkDay14th14(player)		EchoShouLingJinJie2(player, "Day14th")			end
function onTalkDay14th15(player)	EchoShouLingAward(player, "Day14th")	end
function onTalkDay14th16(player)	EchoZCXFHLMain(player, "XiaZhi")	end--每日消费豪礼
function onTalkDay14th19(player)	EchoZCXFHLMain(player, "Day14th")	end--每日充值豪礼
function onTalkDay14th20(player)	onTalkLeiJiChongZhi(player,"Day14th")	end--累计充值送道具
function onTalkDay14th21( player )  EchoTianmingTH(player,"Day14th") end
function onTalkDay14th9(player)		EchoXuanJingHeChengShengdian(player, "Day14th")			end
function onTalkDay14th17(player)		EchoPetJinHuaHuiKui(player, "Day14th")			end
function onTalkDay14th18(player)		EchoPetZiZhiHuiKui(player, "Day14th")			end

function onTalkDay14th23(player)
	player:echo([[<font color="#FFFF00">            元宵节披风升级豪礼</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-3月6日</font>
活动说明：<font color="#FFff00">在活动期间内，将<font color="#ee00ee">披风</font>进阶至相应阶数，即可获得丰厚奖励！</font>
---------------------------------------<font color="#FFaa00">
  <a href="event:talk_pifengshengji1"><font color="#ee00ee">统御披风(5级)</font></a>  即可领取 <font color="#ee00ee">天蚕精华*1</font>
  <a href="event:talk_pifengshengji2"><font color="#ee00ee">强袭披风(6级)</font></a>  即可领取 <font color="#ee00ee">天蚕精华*1</font>  
  <a href="event:talk_pifengshengji3"><font color="#ee00ee">惊世披风(7级)</font></a>  即可领取 <font color="#ee00ee">天蚕精华*1</font>  
  <a href="event:talk_pifengshengji4"><font color="#ee00ee">不败披风(8级)</font></a>  即可领取 <font color="#ee00ee">天蚕精华*2</font>  
  <a href="event:talk_pifengshengji5"><font color="#ee00ee">烈焰披风(9级)</font></a>  即可领取 <font color="#ee00ee">天蚕精华*3</font>  
  <a href="event:talk_pifengshengji6"><font color="#ee00ee">屠龙披风(10级)</font></a> 即可领取 <font color="#ee00ee">天蚕精华*4</font>  
  <a href="event:talk_pifengshengji7"><font color="#ee00ee">王者披风(11级)</font></a> 即可领取 <font color="#ee00ee">天蚕精华*5</font>  
  <a href="event:talk_pifengshengji8"><font color="#ee00ee">战神披风(12级)</font></a> 即可领取 <font color="#ee00ee">十级玄晶宝箱*1</font>  
---------------------------------------
温馨提示：<font color="#FF0000">非活动期间内升级的玩家也可领取奖励，每个账号仅限一次！</font>
---------------------------------------
                              <a href="event:talk_Day14th">返回首页</a>]]);
end
function onTalkpifengshengji1(player)	LQPiFengLB(player,5,"天蚕精华",1,1,1, "150301".."PifengShengjiHl_".."天蚕精华")		onTalkDay14th23(player)	end
function onTalkpifengshengji2(player)	LQPiFengLB(player,6,"天蚕精华",1,1,1, "150301".."PifengShengjiHl_".."天蚕精华")		onTalkDay14th23(player)	end
function onTalkpifengshengji3(player)	LQPiFengLB(player,7,"天蚕精华",1,1,1, "150301".."PifengShengjiHl_".."天蚕精华")		onTalkDay14th23(player)	end
function onTalkpifengshengji4(player)	LQPiFengLB(player,8,"天蚕精华",2,1,1, "150301".."PifengShengjiHl_".."天蚕精华*2")		onTalkDay14th23(player)	end
function onTalkpifengshengji5(player)	LQPiFengLB(player,9,"天蚕精华",3,1,1, "150301".."PifengShengjiHl_".."天蚕精华*3")		onTalkDay14th23(player)	end
function onTalkpifengshengji6(player)	LQPiFengLB(player,10,"天蚕精华",4,1,1, "150301".."PifengShengjiHl_".."天蚕精华*4")		onTalkDay14th23(player)	end
function onTalkpifengshengji7(player)	LQPiFengLB(player,11,"天蚕精华",5,1,1, "150301".."PifengShengjiHl_".."天蚕精华*5")		onTalkDay14th23(player)	end
function onTalkpifengshengji8(player)	LQPiFengLB(player,12,"十级玄晶宝箱",1,1,1, "150301".."PifengShengjiHl_".."十级玄晶宝箱")		onTalkDay14th23(player)	end
function LQPiFengLB(player, nLevel, szItemName, nNum, nBagBlack, isBind, log)
	if not activity.isPiFengShengjiHlOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	local tParam = {[5] = {szName = "统御披风(5级)", awardpcon = const.PP_PIFENGSJ_LV5}, 
					[6] = {szName = "强袭披风(6级)", awardpcon = const.PP_PIFENGSJ_LV6}, 
					[7] = {szName = "惊世披风(7级)", awardpcon = const.PP_PIFENGSJ_LV7}, 
					[8] = {szName = "不败披风(8级)", awardpcon = const.PP_PIFENGSJ_LV8}, 
					[9] = {szName = "烈焰披风(9级)", awardpcon = const.PP_PIFENGSJ_LV9}, 
					[10] = {szName = "屠龙披风(10级)", awardpcon = const.PP_PIFENGSJ_LV10}, 
					[11] = {szName = "王者披风(11级)", awardpcon = const.PP_PIFENGSJ_LV11}, 
					[12] = {szName = "战神披风(12级)", awardpcon = const.PP_PIFENGSJ_LV12}, 
					}
	local nPfLevel = 0
	for k,v in pairs(tParam) do
		if player:num_item(v.szName,1111) >= 1 then
			nPfLevel = k
			break
		end
	end
	if nPfLevel < nLevel then
		player:alert(11,1,"对不起，您尚未拥有["..nLevel.."级]或更高等级的披风！")
		return
	end
	if util.ppn(player,tParam[nLevel].awardpcon) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tParam[nLevel].awardpcon,1)
	player:add_item(szItemName, nNum, isBind)
	server.log_count(4,log,nNum);
	player:alert(11,1,"成功领取"..nLevel.."级披风奖励：["..szItemName.."] *"..nNum.."!")
	return
end

function onTalkDay14th22(player)
	player:echo([[<font color="#FFFF00">            正月天命超级回馈</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-2月28日</font>
活动说明：<font color="#FFff00">在活动期间内，玩家将<font color="#ee00ee">天命</font>修炼至对应阶数，可领取丰厚奖励！</font>
---------------------------------------<font color="#FFaa00">
   <font color="#ee00ee">5阶</font> 即可领取 <font color="#ee00ee">中型玄晶宝箱*1</font>  <a href="event:talk_TianMing51">领取</a>

  <font color="#ee00ee">10阶</font> 即可领取 <font color="#ee00ee">大型玄晶宝箱*1</font>  <a href="event:talk_TianMing52">领取</a>

  <font color="#ee00ee">15阶</font> 即可领取 <font color="#ee00ee">超级玄晶宝箱*1</font>  <a href="event:talk_TianMing53">领取</a>

  <font color="#ee00ee">20阶</font> 即可领取 <font color="#ee00ee">超级玄晶宝箱*2</font>  <a href="event:talk_TianMing54">领取</a>

  <font color="#ee00ee">25阶</font> 即可领取 <font color="#ee00ee">超级玄晶宝箱*3</font>  <a href="event:talk_TianMing55">领取</a></font>
---------------------------------------
温馨提示：<font color="#FF0000">在活动时间之前升级的玩家也可领取奖励，每个账号仅限一次！</font>
---------------------------------------
                              <a href="event:talk_Day14th">返回首页</a>]]);
end

function onTalkTianMing51(player)	LQLianHunLB(player,5,"中型玄晶宝箱",1,1,1) 	onTalkDay14th22(player)	end
function onTalkTianMing52(player)	LQLianHunLB(player,10,"大型玄晶宝箱",1,1,1) onTalkDay14th22(player)	end
function onTalkTianMing53(player)	LQLianHunLB(player,15,"超级玄晶宝箱",1,1,1) onTalkDay14th22(player)	end
function onTalkTianMing54(player)	LQLianHunLB(player,20,"超级玄晶宝箱",2,2,1) onTalkDay14th22(player)	end
function onTalkTianMing55(player)	LQLianHunLB(player,25,"超级玄晶宝箱",3,3,1)	onTalkDay14th22(player)	end

local NewLianHunLBParam = {[5] = const.PP_LIANHUNLB_LV5, 
						[10] = const.PP_LIANHUNLB_LV10, 
						[15] = const.PP_LIANHUNLB_LV15, 
						[20] = const.PP_LIANHUNLB_LV20, 
						[25] = const.PP_LIANHUNLB_LV25, 
					}

function LQLianHunLB(player, nLevel, szItemName, nNum, nBagBlack, isBind)
	if not activity.isLianHunLiBaoOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	if util.ppn(player,const.PP_LIANHUN_LEVEL) < nLevel then
		player:alert(11,1,"对不起，您尚未将天命提升至["..nLevel.."阶]！")
		return
	end
	if util.ppn(player,NewLianHunLBParam[nLevel]) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(NewLianHunLBParam[nLevel],1)
	player:add_item(szItemName, nNum, isBind)
	player:alert(11,1,"成功领取天命"..nLevel.."阶奖励：["..szItemName.."] *"..nNum.."!")
	return
end

function EchoXuanJingHeChengShengdian(player,szActivity)
	local tText = {Day14th = {szName = "大寒玄晶合成盛典", start = "更新后", over = "1月25日", nRate = 20, funcMain = "Day14th"}, 
					NewYear = {szName = "春分玄晶合成盛典", start = "更新后", over = "3月25日", nRate = 20, funcMain = "NewYear"},
				}
	player:echo([[            <font color="#FFFF00">]]..tText[szActivity].szName..[[</font>
----------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tText[szActivity].start..[[-]]..tText[szActivity].over..[[</font>
----------------------------------------
活动内容：<font color="#FFFF00">活动期间内，所有服务器玄晶合成几率增加[<font color="#FF0000">]]..tText[szActivity].nRate..[[%</font>]！</font>
----------------------------------------
                                <a href="event:talk_]]..tText[szActivity].funcMain..[[">返回首页</a>
]]);
end

function reset_player_petzizhihuikui_info(player)
	--if util.ppn(player,const.PP_PETZZHUIKUIRESET)~=activity.HUODONG_BIAOSHI then
		--player:set_param(const.PP_PETZZHUIKUIRESET,activity.HUODONG_BIAOSHI);
		player:set_param(const.PP_PETZZHUIKUI1,0);
		player:set_param(const.PP_PETZZHUIKUI2,0);
		player:set_param(const.PP_PETZZHUIKUI3,0);
		player:set_param(const.PP_PETZZHUIKUI4,0);
		player:set_param(const.PP_PETZZHUIKUI5,0);
		player:set_param(const.PP_PETZZHUIKUI6,0);
	--end
end

function EchoPetZiZhiHuiKui(player, szActivity)
	--reset_player_petzizhihuikui_info(player)
	local total=0;
	for i=1,10 do
		local pet = player:find_pet_by_pos(i);				
		if pet then				
			local tmp=pet:get_quality();
			if tmp>0 then
				total=total+tmp;
			end
		end
	end
	local tPetZiZhiHKText = {
						Day14th = {szName = "白色情人节守护资质回馈", start = "更新后", over = "3月18日", funcMain = "Day14th"},
						}
	player:echo([[            <font color="#FFFF00">]]..tPetZiZhiHKText[szActivity].szName..[[</font>
---------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tPetZiZhiHKText[szActivity].start..[[-<font color="#FF0000">]]..tPetZiZhiHKText[szActivity].over..[[</font></font>
---------------------------------------
活动内容: <font color="#FFff00">活动期间内，玩家所拥有的守护资质之和达到</font>
		<a href="event:talk_petZZhuikuiLQ1"><font color="#FF0000">175</font></a>  即可领取  <font color="#FF0000">守护资质丹*20</font>
		<a href="event:talk_petZZhuikuiLQ2"><font color="#FF0000">225</font></a>  即可领取  <font color="#FF0000">超级资质丹*2</font>
		<a href="event:talk_petZZhuikuiLQ3"><font color="#FF0000">300</font></a>  即可领取  <font color="#FF0000">超级资质丹*4</font>
		<a href="event:talk_petZZhuikuiLQ4"><font color="#FF0000">375</font></a>  即可领取  <font color="#FF0000">超级资质丹*6</font>
		<a href="event:talk_petZZhuikuiLQ5"><font color="#FF0000">425</font></a>  即可领取  <font color="#FF0000">超级资质丹*10</font>
		<a href="event:talk_petZZhuikuiLQ6"><font color="#FF0000">470</font></a>  即可领取  <font color="#FF0000">超级资质丹*15</font>
---------------------------------------
温馨提示:在活动时间之前升级的玩家也可领取奖励，每个账号仅限一次！
---------------------------------------
当前资质:<font color="#FF0000">]]..total..[[</font>                 <a href="event:talk_]]..tPetZiZhiHKText[szActivity].funcMain..[[">返回上页</a>
]]);
end
function onTalkpetZZhuikuiLQ1(player)	PetZiZhiAward(player,175,"守护资质丹",20,const.PP_PETZZHUIKUI1)	onTalkDay14th18(player, "Day14th") end
function onTalkpetZZhuikuiLQ2(player)	PetZiZhiAward(player,225,"超级资质丹",2,const.PP_PETZZHUIKUI2)	onTalkDay14th18(player, "Day14th") end
function onTalkpetZZhuikuiLQ3(player)	PetZiZhiAward(player,300,"超级资质丹",4,const.PP_PETZZHUIKUI3)	onTalkDay14th18(player, "Day14th") end
function onTalkpetZZhuikuiLQ4(player)	PetZiZhiAward(player,375,"超级资质丹",6,const.PP_PETZZHUIKUI4)	onTalkDay14th18(player, "Day14th") end
function onTalkpetZZhuikuiLQ5(player)	PetZiZhiAward(player,425,"超级资质丹",10,const.PP_PETZZHUIKUI5)	onTalkDay14th18(player, "Day14th") end
function onTalkpetZZhuikuiLQ6(player)	PetZiZhiAward(player,470,"超级资质丹",15,const.PP_PETZZHUIKUI6)	onTalkDay14th18(player, "Day14th") end
function PetZiZhiAward(player,limit,name,num,con)
	local total=0;
	if not activity.isPetZiZhiHuiKui() then
		player:alert(1,1,"目前不在活动期间，无法兑换！");
		return
	end
	for i=1,10 do
		local pet = player:find_pet_by_pos(i);				
		if pet then				
			local tmp=pet:get_quality();
			if tmp>0 then
				total=total+tmp;
			end
		end
	end
	if total<limit then
		player:alert(1,1,"您未达到领取要求！");
		return
	end

	if util.ppn(player,con)>0 then
		player:alert(1,1,"您已经领取过该奖励！");
		return
	end
	if player:num_bag_black() < 1 then
		player:alert(11,1,"背包空格不足1格,无法领取!");
		return;
	end
	player:add_item(name,num,1);
	player:set_param(con,1);
	player:alert(1,1,"恭喜您成功领取["..name.."*"..num.."]!");

end

function reset_player_jinhuahuikui_info(player)
	--if util.ppn(player,const.PP_PETHUIKUIRESET)~=activity.HUODONG_BIAOSHI then
		--player:set_param(const.PP_PETHUIKUIRESET,activity.HUODONG_BIAOSHI);
		player:set_param(const.PP_PETHUIKUI1,0);
		player:set_param(const.PP_PETHUIKUI2,0);
		player:set_param(const.PP_PETHUIKUI3,0);
		player:set_param(const.PP_PETHUIKUI4,0);
		player:set_param(const.PP_PETHUIKUI5,0);
	--end
end
function EchoPetJinHuaHuiKui(player, szActivity)
	--reset_player_jinhuahuikui_info(player);
	local total=0;
	for i=1,10 do
		local pet = player:find_pet_by_pos(i);				
		if pet then				
			local tmp=pet:get_updlv();
			if tmp>0 then
				total=total+tmp;
			end
		end
	end
	local tPetJinJieHKText = {
						Day14th = {szName = "白色情人节守护进化回馈", start = "更新后", over = "3月18日", funcMain = "Day14th"},
						}
	player:echo([[            <font color="#FFFF00">]]..tPetJinJieHKText[szActivity].szName..[[</font>
---------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tPetJinJieHKText[szActivity].start..[[-<font color="#FF0000">]]..tPetJinJieHKText[szActivity].over..[[</font></font>
---------------------------------------
活动内容: <font color="#FFff00">活动期间内，玩家所拥有的守护成长之和达到</font>
		<a href="event:talk_pethuikuiLQ1"><font color="#FF0000">75</font></a>  即可领取  <font color="#FF0000">超级资质丹*1</font>

		<a href="event:talk_pethuikuiLQ2"><font color="#FF0000">150</font></a> 即可领取  <font color="#FF0000">超级资质丹*2</font>

		<a href="event:talk_pethuikuiLQ3"><font color="#FF0000">225</font></a> 即可领取  <font color="#FF0000">超级资质丹*3</font>

		<a href="event:talk_pethuikuiLQ4"><font color="#FF0000">275</font></a> 即可领取  <font color="#FF0000">超级资质丹*4</font>

		<a href="event:talk_pethuikuiLQ5"><font color="#FF0000">310</font></a> 即可领取  <font color="#FF0000">超级资质丹*5</font>
---------------------------------------
温馨提示:在活动时间之前升级的玩家也可领取奖励，每个账号仅限一次！
---------------------------------------
当前成长:<font color="#FF0000">]]..total..[[</font>                 <a href="event:talk_]]..tPetJinJieHKText[szActivity].funcMain..[[">返回上页</a>
]]);
end
function onTalkpethuikuiLQ1(player)		PetJinHuaAward(player,75,"超级资质丹",1,const.PP_PETHUIKUI1)	onTalkDay14th17(player, "Day14th") end
function onTalkpethuikuiLQ2(player)		PetJinHuaAward(player,150,"超级资质丹",2,const.PP_PETHUIKUI2)	onTalkDay14th17(player, "Day14th") end
function onTalkpethuikuiLQ3(player)		PetJinHuaAward(player,225,"超级资质丹",3,const.PP_PETHUIKUI3)	onTalkDay14th17(player, "Day14th") end
function onTalkpethuikuiLQ4(player)		PetJinHuaAward(player,275,"超级资质丹",4,const.PP_PETHUIKUI4)	onTalkDay14th17(player, "Day14th") end
function onTalkpethuikuiLQ5(player)		PetJinHuaAward(player,310,"超级资质丹",5,const.PP_PETHUIKUI5)	onTalkDay14th17(player, "Day14th") end
function PetJinHuaAward(player,limit,name,num,con)
	local total=0;
	if not activity.isPetJinHuaHuiKui() then
		player:alert(1,1,"目前不在活动期间，无法兑换！");
		return
	end
	for i=1,10 do
		local pet = player:find_pet_by_pos(i);				
		if pet then				
			local tmp=pet:get_updlv();
			if tmp>0 then
				total=total+tmp;
			end
		end
	end

	if total<limit then
		player:alert(1,1,"您未达到领取要求！");
		return
	end

	if util.ppn(player,con)>0 then
		player:alert(1,1,"您已经领取过该奖励！");
		return
	end
	if player:num_bag_black() < 1 then
		player:alert(11,1,"背包空格不足1格,无法领取!");
		return;
	end
	player:add_item(name,num,1);
	player:set_param(con,1);
	player:alert(1,1,"恭喜您成功领取["..name.."*"..num.."]!");

end

function onTalkDay14th13(player)		EchoXingshiduihuanShengdian(player, "Day14th")			end
function EchoXingshiduihuanShengdian(player,szActivity)
	local tText = {Day14th = {szName = "万圣节星石兑换盛典", start = "更新后", over = "10月31日", nRate = 1, funcMain = "Day14th"}, 
				}
	player:echo([[            <font color="#FFFF00">]]..tText[szActivity].szName..[[</font>
----------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
----------------------------------------
活动时间：<font color="#FFff00">]]..tText[szActivity].start..[[-]]..tText[szActivity].over..[[</font>
----------------------------------------
活动内容：<font color="#FFFF00">活动期间内，所有服务器玩家兑换星石时产生1000、2500、5000的几率增加[<font color="#FF0000">]]..tText[szActivity].nRate..[[</font>]倍！</font>
----------------------------------------
                                <a href="event:talk_]]..tText[szActivity].funcMain..[[">返回首页</a>
]]);
end

function onTalkDay14th12(player)
	player:echo([[<font color="#FFFF00">            万圣节永久时装兑换</font>
----------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-10月31日</font>
活动内容: <font color="#FFff00">活动期间内，玩家可花费<font color="#FFaa00">22888</font>元宝将时装<font color="#00FF00">万圣节彩衣(半月)</font>/<font color="#00FF00">万圣节彩袍(半月)</font>升级为<font color="#ee00ee">万圣节彩衣(永久)</font>/<font color="#ee00ee">万圣节彩袍(永久)</font>！</font>
----------------------------------------<font color="#FFff00">
##万圣节彩衣(半月)##升级为

##万圣节彩衣(永久)##          <a href="event:talk_Day14th121">点击兑换</a>


##万圣节彩袍(半月)##升级为

##万圣节彩袍(永久)##          <a href="event:talk_Day14th122">点击兑换</a></font>

----------------------------------------
活动说明：<font color="#FF0000">请将时装放入背包第一个格子进行兑换。</font>
----------------------------------------
                               <a href="event:talk_Day14th">返回首页</a> ]]);
end

function onTalkDay14th121(player)	ShiZhuangDuiHuan(player, 155006, "万圣节彩衣(半月)", 22888, "万圣节彩衣(永久)", 155005)	onTalkDay14th12(player)	end
function onTalkDay14th122(player)	ShiZhuangDuiHuan(player, 150006, "万圣节彩袍(半月)", 22888, "万圣节彩袍(永久)", 150005)	onTalkDay14th12(player)	end

function onTalkLeiJiChongZhishf(player)	
	reset_player_actczlj_info(player)
	local tText = {szName = "国庆充值即送护符", start = "更新后", over = "10月05日", key = 5000, szAward = "贪狼护符", djName="贪狼(1级)", nNum = 1, funcMain = "Day14th",}
	player:echo([[            <font color="#FFFF00">]]..tText.szName..[[</font>
---------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间: <font color="#FFff00">]]..tText.start..[[-]]..tText.over..[[</font>
---------------------------------------
活动内容: <font color="#FFff00">活动期间内,玩家累计充值达到]]..tText.key..[[元宝即可领取专属装备[##]]..tText.szAward..[[##]]..[[]!
                        <a href="event:talk_LeiJiCZLBLQSHF">领取]]..tText.djName..[[</a></font>
----------------------------------------
活动说明：<font color="#FFaa00">即日起,玩家也可在云霄城NPC[护符大师]处使用[星石]兑换护符贪狼(1级)和紫薇(1级)</font>
---------------------------------------
您已充值: <font color="#FFaa00">]]..util.ppn(player,const.PP_ACTIVITY_CHONGZHI)..[[元宝</font>
---------------------------------------
                               <a href="event:talk_]]..tText.funcMain..[[">返回上页</a>
]])
end

function onTalkLeiJiCZLBLQSHF(player)
	if activity.isActChongZhiLeiJi() then
		local Key = 5000
		if util.ppn(player,const.PP_ACTIVITY_CHONGZHI) >= Key then
			if util.ppn(player,const.PP_ACTIVITY_SHENKUI) <= activity.HUODONG_BIAOSHI then
				local nBagBlack = 1
				if player:num_bag_black() >= nBagBlack then
					player:set_param(const.PP_ACTIVITY_SHENKUI,activity.HUODONG_BIAOSHI+3);
					local szAward = "贪狼(1级)"
					local nNum = 1
					player:add_item(szAward,nNum,1);
					server.log_count(4,"210001"..szAward,nNum); 	--每次活动修改LOG日期
					player:alert(11,1,"成功领取[<font color='#ee00ee'>"..szAward.."</font>]*"..nNum.."！");
				else
					player:alert(1,1,"对不起,您的背包空格不足"..nBagBlack.."格,无法领取!");
				end
			else
				player:alert(1,1,"您已经领取过该奖励,无法再次领取!")
			end
		else
			player:alert(1,1,"您已充值的元宝不足"..Key..",无法领取!")
		end
	else
		player:alert(1,1,"不在活动时间内，无法领取！")
	end
	onTalkLeiJiChongZhishf(player)	
end

function  onTalkXszk( player )
	reset_player_zksc_info(player)
	player:echo([[            <font color="#FFFF00">正月限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-2月28日</font>
活动说明：<font color="#FFaa00">在活动期间内，各位战神可在此处购买特惠价道具！</font>
---------------------------------------
##超级灵魂石##            <a href="event:talk_Xszkgm1">点击购买</a>
<font color="#FFaa00">990 元宝</font>
##超级真气丹##            <a href="event:talk_Xszkgm2">点击购买</a>
<font color="#FFaa00">990 元宝</font>
##真气丹(10000)##         <a href="event:talk_Xszkgm3">点击购买</a>
<font color="#FFaa00">9900 元宝</font>
##幸运神符(40%)##         <a href="event:talk_Xszkgm4">点击购买</a>
<font color="#FFaa00">1200 元宝</font>
##幸运神符(50%)##         <a href="event:talk_Xszkgm5">点击购买</a>
<font color="#FFaa00">2400 元宝</font>
##幸运神符(100%)##        <a href="event:talk_Xszkgm6">点击购买</a>
<font color="#FFaa00">24000 元宝</font>
---------------------------------------
							<a href="event:talk_Day14th">返回首页</a>]]);
end
function onTalkXszkgm1(player)	VcoinBuyItems(player, "Day14th", "超级灵魂石", 990, 1, 1, 1, "0225")		onTalkXszk(player)	end
function onTalkXszkgm2(player)	VcoinBuyItems(player, "Day14th", "超级真气丹", 990, 1, 1, 1, "0225")		onTalkXszk(player)	end
function onTalkXszkgm3(player)	VcoinBuyItems(player, "Day14th", "真气丹(10000)", 9900, 1, 1, 1, "0225")		onTalkXszk(player)	end
function onTalkXszkgm4(player)	VcoinBuyItems(player, "Day14th", "幸运神符(40%)", 1200, 1, 1, 1, "0225")		onTalkXszk(player)	end
function onTalkXszkgm5(player)	VcoinBuyItems(player, "Day14th", "幸运神符(50%)", 2400, 1, 1, 1, "0225")		onTalkXszk(player)	end
function onTalkXszkgm6(player)	VcoinBuyItems(player, "Day14th", "幸运神符(100%)", 24000, 1, 1, 1, "0225")		onTalkXszk(player)	end

function onTalkXxzk1(player)
	reset_player_zksc_info(player)
	player:echo([[            <font color="#FFFF00">元宵节限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-3月6日</font>
活动说明：<font color="#FFaa00">在活动期间内，珍稀道具疯狂打折！</font>
---------------------------------------
##祈灵玉##                  <a href="event:talk_Xxzkgm2">点击购买</a>
原价：<font color="#FF0000">1000 元宝</font> 现价：<font color="#FFaa00">800 元宝</font>
##七彩石##                  <a href="event:talk_Xxzkgm3">点击购买</a>
原价：<font color="#FF0000">4000 元宝</font> 现价：<font color="#FFaa00">3200 元宝</font>
##盘古神石##                <a href="event:talk_Xxzkgm4">点击购买</a>
原价：<font color="#FF0000">5888 元宝</font> 现价：<font color="#FFaa00">4700 元宝</font>
##超级坐骑丹##              <a href="event:talk_Xxzkgm5">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">880 元宝</font>
##超级真气丹##              <a href="event:talk_Xxzkgm6">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">990 元宝</font>
##超级进阶石包##            <a href="event:talk_Xxzkgm7">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">990 元宝</font>
---------------------------------------
<a href="event:talk_Day14th">返回首页</a>                        <a href="event:talk_Xxzk2">下一页</a>]]);
end

function onTalkXxzk2(player)
	reset_player_zksc_info(player)
	player:echo([[            <font color="#FFFF00">元宵节限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-3月6日</font>
活动说明：<font color="#FFaa00">在活动期间内，珍稀道具疯狂打折！</font>
---------------------------------------
##幸运神符(30%)##           <a href="event:talk_Xxzkgm8">点击购买</a>
原价：<font color="#FF0000">1200 元宝</font>  现价：<font color="#FFaa00">600 元宝</font>
##幸运神符(40%)##           <a href="event:talk_Xxzkgm9">点击购买</a>
原价：<font color="#FF0000">2400 元宝</font>  现价：<font color="#FFaa00">1200 元宝</font>
##幸运神符(50%)##           <a href="event:talk_Xxzkgm10">点击购买</a>
原价：<font color="#FF0000">4800 元宝</font>  现价：<font color="#FFaa00">2400 元宝</font>
##幸运神符(100%)##          <a href="event:talk_Xxzkgm11">点击购买</a>
原价：<font color="#FF0000">48000 元宝</font> 现价：<font color="#FFaa00">24000 元宝</font>
##中级融合符##              <a href="event:talk_Xxzkgm12">点击购买</a>
原价：<font color="#FF0000">4685 元宝</font>  现价：<font color="#FFaa00">2342 元宝</font>
##高级融合符##              <a href="event:talk_Xxzkgm13">点击购买</a>
原价：<font color="#FF0000">16200 元宝</font> 现价：<font color="#FFaa00">8100 元宝</font>
##超级融合符##              <a href="event:talk_Xxzkgm14">点击购买</a>
原价：<font color="#FF0000">32400 元宝</font> 现价：<font color="#FFaa00">16200 元宝</font>
---------------------------------------
<a href="event:talk_Day14th">返回首页</a>                        <a href="event:talk_Xxzk1">上一页</a>]]);
end

function onTalkXxzkgm1(player)	VcoinBuyItems(player, "XiaZhi", "七级生命玄晶", 13068, 1, 1, 1, "0301")		onTalkXxzk1(player)	end
function onTalkXxzkgm2(player)	VcoinBuyItems(player, "XiaZhi", "祈灵玉", 800, 1, 1, 1, "0301")		onTalkXxzk1(player)	end
function onTalkXxzkgm3(player)	VcoinBuyItems(player, "XiaZhi", "七彩石", 3200, 1, 1, 1, "0301")	onTalkXxzk1(player)	end
function onTalkXxzkgm4(player)	VcoinBuyItems(player, "XiaZhi", "盘古神石", 4700, 1, 1, 1, "0301")	onTalkXxzk1(player)	end
function onTalkXxzkgm5(player)	VcoinBuyItems(player, "XiaZhi", "超级坐骑丹", 880, 1, 1, 1, "0301")		onTalkXxzk1(player)	end
function onTalkXxzkgm6(player)	VcoinBuyItems(player, "XiaZhi", "超级真气丹", 990, 1, 1, 1, "0301")		onTalkXxzk1(player)	end
function onTalkXxzkgm7(player)	VcoinBuyItems(player, "XiaZhi", "超级进阶石包", 990, 1, 1, 1, "0301")		onTalkXxzk1(player)	end

function onTalkXxzkgm8(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(30%)", 600, 1, 1, 1, "0301")		onTalkXxzk2(player)	end
function onTalkXxzkgm9(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(40%)", 1200, 1, 1, 1, "0301")		onTalkXxzk2(player)	end
function onTalkXxzkgm10(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(50%)", 2400, 1, 1, 1, "0301")		onTalkXxzk2(player)	end
function onTalkXxzkgm11(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(100%)", 24000, 1, 1, 1, "0301")		onTalkXxzk2(player)	end
function onTalkXxzkgm12(player)	VcoinBuyItems(player, "XiaZhi", "中级融合符", 2342, 1, 1, 1, "0301")		onTalkXxzk2(player)	end
function onTalkXxzkgm13(player)	VcoinBuyItems(player, "XiaZhi", "高级融合符", 8100, 1, 1, 1, "0301")		onTalkXxzk2(player)	end
function onTalkXxzkgm14(player)	VcoinBuyItems(player, "XiaZhi", "超级融合符", 16200, 1, 1, 1, "0301")		onTalkXxzk2(player)	end

function onTalkLingYuZhuanPan(player)		
	player:echo([[            <font color="#FFFF00">月中灵玉转盘放送</font>
----------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-9月21日</font>
----------------------------------------
活动内容：<font color="#FFff00">活动期间，玩家每次花费<font color="#ee00ee">500元宝</font>可转动灵玉转盘，可获得玉石、灵气珠、徽记等极品道具！</font>

              <a href="event:talk_LingYuZhuanPan1">打 开 转 盘</a>

----------------------------------------
                              <a href="event:talk_Day14th">返回首页</a>]])
end

function onTalkLingYuZhuanPan1(player)
	if activity.islingyuzhuanpan() then
		player:set_panel_data("panellingyuzhuanpan","panellingyuzhuanpan","panel_visible","true");
		player:push_ckpanel_data("lingyuzhuanpan","panellingyuzhuanpan");
	else
		player:alert(11,1,"对不起，不在活动时间内！")
		onTalkLingYuZhuanPan(player)
		return
	end
end

function onTalkDay14th7(player)		EchoZCXFHLMain(player, "Day14th")	end
function onTalkDay14th50(player)	EchoZCXFHL(player, "Day14th", "recharge", 5000)		end
function onTalkDay14th100(player)	EchoZCXFHL(player, "Day14th", "recharge", 10000)	end
function onTalkDay14th300(player)	EchoZCXFHL(player, "Day14th", "recharge", 30000)	end
function onTalkDay14th500(player)	EchoZCXFHL(player, "Day14th", "recharge", 50000)	end
function onTalkDay14th1000(player)	EchoZCXFHL(player, "Day14th", "recharge", 100000)	end
function onTalkDay14th3000(player)	EchoZCXFHL(player, "Day14th", "recharge", 300000)	end
function onTalkDay14th5000(player)	EchoZCXFHL(player, "Day14th", "recharge", 500000)	end

function onTalkDay14th50b(player)	CZXFLBLQ(player, "Day14th", "recharge", 5000)	onTalkDay14th50(player)		end
function onTalkDay14th100b(player)	CZXFLBLQ(player, "Day14th", "recharge", 10000)	onTalkDay14th100(player)	end
function onTalkDay14th300b(player)	CZXFLBLQ(player, "Day14th", "recharge", 30000)	onTalkDay14th300(player)	end
function onTalkDay14th500b(player)	CZXFLBLQ(player, "Day14th", "recharge", 50000)	onTalkDay14th500(player)	end
function onTalkDay14th1000b(player)	CZXFLBLQ(player, "Day14th", "recharge", 100000)	onTalkDay14th1000(player)	end
function onTalkDay14th3000b(player)	CZXFLBLQ(player, "Day14th", "recharge", 300000)	onTalkDay14th3000(player)	end
function onTalkDay14th5000b(player)	CZXFLBLQ(player, "Day14th", "recharge", 500000)	onTalkDay14th5000(player)	end

function onTalkZaDan(player)		
	player:echo([[            <font color="#FFFF00">银色情人节砸金蛋</font>
--------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-7月20日</font>
--------------------------------------
活动内容：<font color="#FFff00">活动期间，玩家可以使用元宝砸金蛋，<font color="#ee00ee">玄晶最低3级起，更有海量真气丹、灵气珠和兽灵精华</font>！</font>

            <a href="event:talk_ZaDan1">前往砸金蛋</a>

--------------------------------------
                             <a href="event:talk_Day14th">返回首页</a>]])
end

function onTalkZaDan1(player)
	if activity.isfuhuojiezadan() then
		player:set_panel_data("panelzadan","panelzadan","panel_visible","true");
		player:push_ckpanel_data("zadan","panelzadan");
	else
		player:alert(11,1,"对不起，不在活动时间内！")
		onTalkZaDan(player)
		return
	end
end

function onTalkZheKouMallLimited(player)
	reset_player_zksc_info(player)
	player:echo([[            <font color="#FFFF00">春分限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-3月25日</font>
活动说明：<font color="#FFaa00">在活动期间内，珍稀道具疯狂打折！每种商品每天限购50次。</font>
---------------------------------------
##超级坐骑丹##              <a href="event:talk_ZheKouMallLimited1">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">880 元宝</font>
##超级真气丹##              <a href="event:talk_ZheKouMallLimited2">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">990 元宝</font>
##超级进阶石包##            <a href="event:talk_ZheKouMallLimited3">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">990 元宝</font>
##幸运神符(40%)##           <a href="event:talk_ZheKouMallLimited5">点击购买</a>
原价：<font color="#FF0000">2400 元宝</font>  现价：<font color="#FFaa00">1200 元宝</font>
##幸运神符(50%)##           <a href="event:talk_ZheKouMallLimited6">点击购买</a>
原价：<font color="#FF0000">4800 元宝</font>  现价：<font color="#FFaa00">2400 元宝</font>
##幸运神符(100%)##          <a href="event:talk_ZheKouMallLimited7">点击购买</a>
原价：<font color="#FF0000">48000 元宝</font> 现价：<font color="#FFaa00">24000 元宝</font>
---------------------------------------
<a href="event:talk_NewYear">返回首页</a>                        <a href="event:talk_ZheKouMallLimited02">下一页</a>]]);
end

function onTalkZheKouMallLimited02(player)
	reset_player_zksc_info(player)
	player:echo([[            <font color="#FFFF00">春分限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-3月25日</font>
活动说明：<font color="#FFaa00">在活动期间内，珍稀道具疯狂打折！每种商品每天限购50次。</font>
---------------------------------------
##大型玄晶宝箱##            <a href="event:talk_ZheKouMallLimited8">点击购买</a>
原价：<font color="#FF0000">26136 元宝</font> 现价：<font color="#FFaa00">13068 元宝</font>
##装备灵魂石(100)##         <a href="event:talk_ZheKouMallLimited9">点击购买</a>
原价：<font color="#FF0000">2000 元宝</font>  现价：<font color="#FFaa00">1000 元宝</font>
##女娲神石##                <a href="event:talk_ZheKouMallLimited10">点击购买</a>
原价：<font color="#FF0000">5888 元宝</font>  现价：<font color="#FFaa00">4700 元宝</font>
##中级融合符##              <a href="event:talk_ZheKouMallLimited12">点击购买</a>
原价：<font color="#FF0000">4685 元宝</font>  现价：<font color="#FFaa00">2342 元宝</font>
##高级融合符##              <a href="event:talk_ZheKouMallLimited13">点击购买</a>
原价：<font color="#FF0000">16200 元宝</font> 现价：<font color="#FFaa00">8100 元宝</font>
##超级融合符##              <a href="event:talk_ZheKouMallLimited14">点击购买</a>
原价：<font color="#FF0000">32400 元宝</font> 现价：<font color="#FFaa00">16200 元宝</font>
---------------------------------------
<a href="event:talk_NewYear">返回首页</a>                        <a href="event:talk_ZheKouMallLimited">上一页</a>]]);
end

function onTalkZheKouMallLimited1(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "超级坐骑丹", 50, const.PP_SHUJIASALE_TIMES1, 880, 1, 1, 1)		onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited2(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "超级真气丹", 50, const.PP_SHUJIASALE_TIMES2, 990, 1, 1, 1)		onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited3(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "超级进阶石包", 50, const.PP_SHUJIASALE_TIMES3, 990, 1, 1, 1)		onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited4(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "装备灵魂石(100)", 50, const.PP_SHUJIASALE_TIMES4, 1000, 1, 1, 1)		onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited5(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "幸运神符(40%)", 50, const.PP_SHUJIASALE_TIMES5, 1200, 1, 1, 1)	onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited6(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "幸运神符(50%)", 50, const.PP_SHUJIASALE_TIMES6, 2400, 1, 1, 1)	onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited7(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "幸运神符(100%)", 50, const.PP_SHUJIASALE_TIMES7, 24000, 1, 1, 1)	onTalkZheKouMallLimited(player)		end
function onTalkZheKouMallLimited8(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "大型玄晶宝箱", 50, const.PP_SHUJIASALE_TIMES8, 13068, 1, 1, 1)	onTalkZheKouMallLimited02(player)		end
function onTalkZheKouMallLimited9(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "装备灵魂石(100)", 50, const.PP_SHUJIASALE_TIMES9, 1000, 1, 1, 1)	onTalkZheKouMallLimited02(player)	end
function onTalkZheKouMallLimited10(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "女娲神石", 50, const.PP_SHUJIASALE_TIMES10, 4700, 1, 1, 1)	onTalkZheKouMallLimited02(player)	end
function onTalkZheKouMallLimited11(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "七级魔防玄晶", 50, const.PP_SHUJIASALE_TIMES11, 13068, 1, 0, 0)	onTalkZheKouMallLimited02(player)	end
function onTalkZheKouMallLimited12(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "中级融合符", 50, const.PP_SHUJIASALE_TIMES12, 2342, 1, 1, 1)		onTalkZheKouMallLimited02(player)	end
function onTalkZheKouMallLimited13(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "高级融合符", 50, const.PP_SHUJIASALE_TIMES13, 8100, 1, 1, 1)		onTalkZheKouMallLimited02(player)	end
function onTalkZheKouMallLimited14(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "超级融合符", 50, const.PP_SHUJIASALE_TIMES14, 16200, 1, 1, 1)	onTalkZheKouMallLimited02(player)	end
--[[
function onTalkDay14th6(player)		EchoMRXuanJingLB(player, "Day14th")	end
function onTalkDay14th61(player)	CZXFLBLQ(player, "Day14th", "Day14th", 5000)	onTalkDay14th6(player)	end
function onTalkDay14th62(player)	CZXFLBLQ(player, "Day14th", "Day14th", 10000)	onTalkDay14th6(player)	end
function onTalkDay14th63(player)	CZXFLBLQ(player, "Day14th", "Day14th", 30000)	onTalkDay14th6(player)	end
function onTalkDay14th64(player)	CZXFLBLQ(player, "Day14th", "Day14th", 50000)	onTalkDay14th6(player)	end
function onTalkDay14th65(player)	CZXFLBLQ(player, "Day14th", "Day14th", 100000)	onTalkDay14th6(player)	end
function onTalkDay14th66(player)	CZXFLBLQ(player, "Day14th", "Day14th", 300000)	onTalkDay14th6(player)	end
function onTalkDay14th67(player)	CZXFLBLQ(player, "Day14th", "Day14th", 500000)	onTalkDay14th6(player)	end
--]]
local tHZChangeTimes = {
	{awardpcon = const.PP_KISSDAY_HZ_1, nTimes = 50}, 
	{awardpcon = const.PP_KISSDAY_HZ_2, nTimes = 20}, 
	{awardpcon = const.PP_KISSDAY_HZ_3, nTimes = 80}, 
	{awardpcon = const.PP_KISSDAY_HZ_4, nTimes = 70}, 
	{awardpcon = const.PP_KISSDAY_HZ_5, nTimes = 100}, 	
}

function onTalkHongZuanDuiHuan(player)
	FreshHZChangeTimes(player)
	player:echo([[            <font color="#FFFF00">金秋绑定元宝盛典</font>
----------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-10月12日</font>
----------------------------------------
活动内容：<font color="#FFff00">在活动期间内，不同等级的红钻玩家可在此额外获得元宝兑换绑定元宝次数，每[<font color="#FF0000">1000元宝</font>]可兑换[<font color="#ee00ee">2000绑定元宝</font>]！</font>
----------------------------------------<font color="#FFaa00">
红钻1~4级 可兑换50次  <a href="event:talk_HongZuanDH1">兑换绑定元宝</a> ]]..util.ppn(player,tHZChangeTimes[1].awardpcon)..[[次

红钻5~7级 可兑换80次  <a href="event:talk_HongZuanDH3">兑换绑定元宝</a> ]]..util.ppn(player,tHZChangeTimes[3].awardpcon)..[[次

红钻8~10级可兑换100次 <a href="event:talk_HongZuanDH5">兑换绑定元宝</a> ]]..util.ppn(player,tHZChangeTimes[5].awardpcon)..[[次</font>
----------------------------------------
温馨提示：<font color="#FF0000">活动期间内，玩家提升红钻等级，可重置每日兑换次数！</font>
----------------------------------------
                             <a href="event:talk_Day14th">返回首页</a>]])
end

function FreshHZChangeTimes(player)		--刷新红钻兑换绑元次数
	if util.ppn(player,const.PP_KISSDAY_HZ_DATE) ~= today() then
		player:set_param(const.PP_KISSDAY_HZ_DATE,today())
		player:set_param(const.PP_KISSDAY_HZ_FLAG,0)
	end
	local nLevel = util.ppn(player,const.PP_CZHZ_LV)

	--local nIndex = math.ceil(nLevel/2)	--此公式适用于1~2,3~4,5~6,7~8,9~10分阶

	function ChangeNum(nNum)
		if nNum > 0 then
			local tNum = {1,1,1,1,3,3,3,5,5,5}
			return tNum[nNum]
		else 
			return 0
		end
	end
	local nIndex = ChangeNum(nLevel)

	if nIndex > util.ppn(player,const.PP_KISSDAY_HZ_FLAG) then
		player:set_param(const.PP_KISSDAY_HZ_FLAG,nIndex)
		for i = 1, #tHZChangeTimes do
			if i == nIndex then
				player:set_param(tHZChangeTimes[i].awardpcon,tHZChangeTimes[i].nTimes)
			else
				player:set_param(tHZChangeTimes[i].awardpcon,0)
			end
		end
	end
	return
end

function onTalkHongZuanDH1(player)	ChangeVcoin(player, 1, 1000, 2000)	onTalkHongZuanDuiHuan(player)	end
function onTalkHongZuanDH2(player)	ChangeVcoin(player, 2, 1000, 2000)	onTalkHongZuanDuiHuan(player)	end
function onTalkHongZuanDH3(player)	ChangeVcoin(player, 3, 1000, 2000)	onTalkHongZuanDuiHuan(player)	end
function onTalkHongZuanDH4(player)	ChangeVcoin(player, 4, 1000, 2000)	onTalkHongZuanDuiHuan(player)	end
function onTalkHongZuanDH5(player)	ChangeVcoin(player, 5, 1000, 2000)	onTalkHongZuanDuiHuan(player)	end

function ChangeVcoin(player, nIndex, nVcoin, nBindVcoin)	--通用元宝兑换绑定元宝
	if not activity.isVcoinDuiHuanOpen() then  --每次活动需要修改时间
		player:alert(11,1,"非活动时间，无法兑换哦!")
		return
	end
	FreshHZChangeTimes(player)
	if util.ppn(player,tHZChangeTimes[nIndex].awardpcon) < 1 then
		player:alert(11,1,"对不起，您剩余的可兑换次数不足!")
		return
	end
	if player:get_vcoin() < nVcoin then
		player:alert(11,1,"您的元宝不足["..nVcoin.."],无法兑换!")
		return
	end
	player:set_param(tHZChangeTimes[nIndex].awardpcon,util.ppn(player,tHZChangeTimes[nIndex].awardpcon)-1)
	player:sub_vcoin(nVcoin,"红钻兑换扣除元宝"..nVcoin)
	player:add_vcoin_bind(nBindVcoin,"红钻兑换添加绑元"..nBindVcoin)
	player:alert(11,1,"成功使用["..nVcoin.."]元宝兑换["..nBindVcoin.."]绑定元宝!")
	return
end

function onTalkXiaZhi(player)
	player:echo([[             <font color="#FFFF00">中  秋  活  动</font>
---------------------------------------
          1.<a href="event:talk_XiaZhi1">中秋回馈豪华礼包</a>
---------------------------------------
          2.<a href="event:talk_XiaZhi2">中秋双倍感恩回馈</a>
---------------------------------------
          3.<a href="event:talk_XiaZhi3">中秋充值即送徽记</a>
---------------------------------------
          4.<a href="event:talk_XiaZhi4">中秋升级超值抢购</a>
---------------------------------------
          5.<a href="event:talk_XiaZhi5">中秋兽灵限时折扣</a>
---------------------------------------
          6.<a href="event:talk_XiaZhi6">中秋兽灵升级回馈</a>
---------------------------------------
          7.<a href="event:talk_ZheKouMall">中秋限时折扣商城</a>
---------------------------------------
          8.<a href="event:talk_XiaZhi8">中秋每日消费豪礼</a>
           <font color="#FF0000">[青龙丹和王者徽记]</font>
---------------------------------------
          9.<a href="event:talk_XiaZhi9">中秋月饼限时兑换</a>
---------------------------------------]]);
end

function onTalkXiaZhi1(player)	EchoHuiKuiLB(player, "XiaZhi", "Day14th")	end
function onTalkXiaZhi11(player)	LQHuiKuiLB(player, "XiaZhi", "Day14th")	onTalkXiaZhi1(player)	end
function onTalkXiaZhi2(player)	EchoDoubleExp(player, "XiaZhi")	end
function onTalkXiaZhi3(player)	EchoMRZCFL(player, "XiaZhi")	end
function onTalkXiaZhi31(player)	MRCZFLLQLB(player, "XiaZhi")	onTalkXiaZhi3(player)	end
function onTalkXiaZhi4(player)	EchoJingYanDan(player, "XiaZhi")	end
function onTalkXiaZhi41(player)	VcoinBuyItemsLimited(player, "XiaZhi", "经验珠(5000万)", 3, const.PP_JC_SJQG_TIMES1, 990, 1, 1, 1)	onTalkXiaZhi4(player)	end
function onTalkXiaZhi42(player)	VcoinBuyItemsLimited(player, "XiaZhi", "经验珠(2000万)", 3, const.PP_JC_SJQG_TIMES2, 400, 1, 1, 1)	onTalkXiaZhi4(player)	end
function onTalkXiaZhi5(player)	EchoShouLingJinJie2(player, "XiaZhi")	end
function onTalkXiaZhi6(player)	EchoShouLingAward(player, "XiaZhi")	end

function onTalkZheKouMall(player)
	reset_player_zksc_info(player)
	player:echo([[<font color="#FFFF00">            中秋限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-9月14日</font>
活动说明: <font color="#FFff00">在活动期间内，各位玩家可在此处购买超值道具！</font>
---------------------------------------
##幸运神符(40%)##           <a href="event:talk_ZheKouMall4">点击购买</a>
原价:<font color="#FF0000">2400 元宝</font>    现价:<font color="#FFaa00">1200 元宝</font>

##幸运神符(50%)##           <a href="event:talk_ZheKouMall5">点击购买</a>
原价:<font color="#FF0000">4800 元宝</font>    现价:<font color="#FFaa00">2400 元宝</font>

##幸运神符(100%)##          <a href="event:talk_ZheKouMall6">点击购买</a>
原价:<font color="#FF0000">48000 元宝</font>   现价:<font color="#FFaa00">24000 元宝</font>

##七级生命玄晶##            <a href="event:talk_ZheKouMall7">点击购买</a>
原价:<font color="#FF0000">26136 元宝</font>   现价:<font color="#FFaa00">13068 元宝</font>

##七级攻击玄晶##            <a href="event:talk_ZheKouMall8">点击购买</a>
原价:<font color="#FF0000">26136 元宝</font>   现价:<font color="#FFaa00">13068 元宝</font>
---------------------------------------
<a href="event:talk_XiaZhi">返回首页</a>                        <a href="event:talk_ZheKouMall02">下一页</a>]]);
end

function onTalkZheKouMall02(player)
	reset_player_zksc_info(player)
	player:echo([[<font color="#FFFF00">            中秋限时折扣商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-9月14日</font>
活动说明: <font color="#FFff00">在活动期间内，各位玩家可在此处购买超值道具！</font>
---------------------------------------
##七级物防玄晶##            <a href="event:talk_ZheKouMall9">点击购买</a>
原价:<font color="#FF0000">26136 元宝</font>   现价:<font color="#FFaa00">13068 元宝</font>

##七级魔防玄晶##            <a href="event:talk_ZheKouMall13">点击购买</a>
原价:<font color="#FF0000">26136 元宝</font>   现价:<font color="#FFaa00">13068 元宝</font>

##中级融合符##              <a href="event:talk_ZheKouMall10">点击购买</a>
原价:<font color="#FF0000">4685 元宝</font>    现价:<font color="#FFaa00">2342 元宝</font>

##高级融合符##              <a href="event:talk_ZheKouMall11">点击购买</a>
原价:<font color="#FF0000">16200 元宝</font>   现价:<font color="#FFaa00">8100 元宝</font>

##超级融合符##              <a href="event:talk_ZheKouMall12">点击购买</a>
原价:<font color="#FF0000">32400 元宝</font>   现价:<font color="#FFaa00">16200 元宝</font>
---------------------------------------
<a href="event:talk_XiaZhi">返回首页</a>                        <a href="event:talk_ZheKouMall">上一页</a>]]);
end

--function onTalkZheKouMall1(player)		VcoinBuyItems(player, "XiaZhi", "超级坐骑丹", 50, const.PP_SHUJIASALE_TIMES1, 880, 1, 1, 1)		onTalkZheKouMall(player)	end
--function onTalkZheKouMall2(player)		VcoinBuyItems(player, "XiaZhi", "超级真气丹", 50, const.PP_SHUJIASALE_TIMES2, 990, 1, 1, 1)		onTalkZheKouMall(player)	end
--function onTalkZheKouMall3(player)		VcoinBuyItems(player, "XiaZhi", "超级进阶石包", 50, const.PP_SHUJIASALE_TIMES3, 990, 1, 1, 1)	onTalkZheKouMall(player)	end
function onTalkZheKouMall4(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(40%)", 1200, 1, 1, 1, "0908")		onTalkZheKouMall(player)	end
function onTalkZheKouMall5(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(50%)", 2400, 1, 1, 1, "0908")		onTalkZheKouMall(player)	end
function onTalkZheKouMall6(player)	VcoinBuyItems(player, "XiaZhi", "幸运神符(100%)", 24000, 1, 1, 1, "0908")	onTalkZheKouMall(player)	end
function onTalkZheKouMall7(player)	VcoinBuyItems(player, "XiaZhi", "七级生命玄晶", 13068, 1, 0, 0, "0908")		onTalkZheKouMall(player)	end
function onTalkZheKouMall8(player)	VcoinBuyItems(player, "XiaZhi", "七级攻击玄晶", 13068, 1, 0, 0, "0908")		onTalkZheKouMall(player)	end
function onTalkZheKouMall9(player)	VcoinBuyItems(player, "XiaZhi", "七级物防玄晶", 13068, 1, 0, 0, "0908")		onTalkZheKouMall02(player)	end
function onTalkZheKouMall13(player)	VcoinBuyItems(player, "XiaZhi", "七级魔防玄晶", 13068, 1, 0, 0, "0908")		onTalkZheKouMall02(player)	end
function onTalkZheKouMall10(player)	VcoinBuyItems(player, "XiaZhi", "中级融合符", 2342, 1, 1, 1, "0908")		onTalkZheKouMall02(player)	end
function onTalkZheKouMall11(player)	VcoinBuyItems(player, "XiaZhi", "高级融合符", 8100, 1, 1, 1, "0908")		onTalkZheKouMall02(player)	end
function onTalkZheKouMall12(player)	VcoinBuyItems(player, "XiaZhi", "超级融合符", 16200, 1, 1, 1, "0908")		onTalkZheKouMall02(player)	end

function onTalkXiaZhi8(player)		EchoZCXFHLMain(player, "XiaZhi")	end
function onTalkXiaZhi50(player)		EchoZCXFHL(player, "XiaZhi", "cost", 5000)		end
function onTalkXiaZhi100(player)	EchoZCXFHL(player, "XiaZhi", "cost", 10000)	end
function onTalkXiaZhi300(player)	EchoZCXFHL(player, "XiaZhi", "cost", 30000)	end
function onTalkXiaZhi500(player)	EchoZCXFHL(player, "XiaZhi", "cost", 50000)	end
function onTalkXiaZhi1000(player)	EchoZCXFHL(player, "XiaZhi", "cost", 100000)	end
function onTalkXiaZhi3000(player)	EchoZCXFHL(player, "XiaZhi", "cost", 300000)	end
function onTalkXiaZhi5000(player)	EchoZCXFHL(player, "XiaZhi", "cost", 500000)	end

function onTalkXiaZhi50b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 5000)	onTalkXiaZhi50(player);		end
function onTalkXiaZhi100b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 10000)	onTalkXiaZhi100(player);	end
function onTalkXiaZhi300b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 30000)	onTalkXiaZhi300(player);	end
function onTalkXiaZhi500b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 50000)	onTalkXiaZhi500(player);	end
function onTalkXiaZhi1000b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 100000)	onTalkXiaZhi1000(player);	end
function onTalkXiaZhi3000b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 300000)	onTalkXiaZhi3000(player);	end
function onTalkXiaZhi5000b(player)	CZXFLBLQ(player, "XiaZhi", "cost", 500000)	onTalkXiaZhi5000(player);	end

function onTalkXiaZhi9(player)
	reset_player_jrdh_info(player)
	player:echo([[            <font color="#FFFF00">中秋月饼超值兑换</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-9月14日</font>
---------------------------------------
活动说明：<font color="#FFff00">活动时间内，玩家击杀<font color="#ccbb77">精英怪</font>和<font color="#ccbb77">150级以上BOSS怪物</font>，有几率掉落道具<font color="#00FF00">月饼</font>，每个月饼可在此处兑换一颗<font color="#00FF00">经验珠(50万)</font>。每人每天最多兑换<font color="#FF0000">50</font>次。</font>

兑换列表：<font color="#FFff00">

##经验珠(50万)##      <a href="event:talk_XiaZhi91">兑换物品</a>
</font>
---------------------------------------
<font color="#FFaa00">背包</font>中目前拥有[<font color="#00FF00">月饼</font>]：<font color="#FFaa00">]]..player:num_item("月饼")..[[ 个</font>
本日剩余兑换次数：<font color="#FFaa00">]]..util.ppn(player,const.PP_MOONCAKE_TIMES)..[[ 次</font>
---------------------------------------
                               <a href="event:talk_XiaZhi">返回首页</a>
]]);
end

function onTalkXiaZhi91(player)	QiXiDuiHuan(player, 50, const.PP_MOONCAKE_TIMES, "月饼", 1, "经验珠(50万)", 1, 1, 1)	onTalkXiaZhi9(player)	end

function reset_player_jrdh_info(player)
	if activity.isSthDrop() then
		if util.ppn(player,const.PP_MOONCAKE_DATE) ~= today() then
			player:set_param(const.PP_MOONCAKE_DATE,today());
			player:set_param(const.PP_MOONCAKE_TIMES,50);
		else
			--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
		end
	else
		player:set_param(const.PP_MOONCAKE_TIMES,0);
	end
end

function QiXiDuiHuan(player, nMax, awardpcon, szNeedItem, nNeedItem, szAward, nNum, nBagBlack, isBind)
	if not activity.isSthDrop() then
		player:alert(1,1,"非活动时间，感谢您的参与!")
		return-- true
	end
	if nMax > 0 then
		reset_player_jrdh_info(player)
		if util.ppn(player,awardpcon) < 1 then
			player:alert(1,1,"今日兑换次数已用完，无法继续兑换！")
			return-- true
		end
	end
	local nOwnItem = player:num_item(szNeedItem)
--	if nOwnItem < 1 then
--		player:alert(1,1,"背包中没有["..szNeedItem.."]，无法兑换!")
--		return true
--	end
	if player:num_bag_black() < nBagBlack then
		player:alert(1,1,"您的背包空间不足"..nBagBlack.."格，无法领取!")
		return-- true
	end
	--local nVcoinNeed = 0
	if nOwnItem < nNeedItem then
		player:alert(1,1,"您拥有的道具数量不足"..nNeedItem.."个，无法兑换!")
		return-- false
	end
	player:set_param(const.PP_MOONCAKE_TIMES,util.ppn(player,awardpcon)-1)
	player:remove_item(szNeedItem, nNeedItem)
	player:add_item(szAward, nNum, isBind)
	server.log_count(4,"中秋月饼_"..szAward,1);
	player:alert(11, 1, "获得["..szAward.."] * "..nNum.."！")	--消耗：["..szNeedItem.."*"..math.min(nNeedItem, nOwnItem).."][元宝*"..nVcoinNeed.."]
	return-- true
end

function onTalkJianLingHuiKui(player)
	player:echo([[<font color="#FFFF00">            月中剑灵升级回馈</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-9月21日</font>
活动说明：<font color="#FFff00">在活动期间内，玩家将<font color="#FF0000">剑灵</font>提升至对应等级，可领取丰厚奖励！</font>
---------------------------------------<font color="#FFaa00">
 <font color="#ee00ee">无极轩辕剑 +3</font>   真气丹(10000)*1  <a href="event:talk_JianLingHuiKui1">领取</a>
 <font color="#ee00ee">无极轩辕剑 +4</font>   七级生命玄晶*1   <a href="event:talk_JianLingHuiKui2">领取</a>
 <font color="#ee00ee">无极轩辕剑 +5</font>   真气丹(10000)*2  <a href="event:talk_JianLingHuiKui3">领取</a>
 <font color="#ee00ee">无极轩辕剑 +6</font>   八级生命玄晶*1   <a href="event:talk_JianLingHuiKui4">领取</a>
 <font color="#ee00ee">无极轩辕剑 +7</font>   真气丹(10000)*3  <a href="event:talk_JianLingHuiKui5">领取</a>
 <font color="#ee00ee">无极轩辕剑 +8</font>   真气丹(10000)*5  <a href="event:talk_JianLingHuiKui6">领取</a>
 <font color="#ee00ee">无极轩辕剑 +9</font>   九级生命玄晶*1   <a href="event:talk_JianLingHuiKui7">领取</a>
 <font color="#ee00ee">无极轩辕剑 +10</font>  十级生命玄晶*1   <a href="event:talk_JianLingHuiKui8">领取</a></font>
---------------------------------------
温馨提示：<font color="#FFaa00">在活动时间之前升级的玩家也可领取奖励，每个角色仅限一次！</font>
    <font color="#FF0000">在之前相同活动领取过奖励的玩家，无法再次领取！</font>
---------------------------------------
                              <a href="event:talk_Day14th">返回首页</a>]]);
end

function onTalkJianLingHuiKui1(player)	BSLevelUpLQJL(player,3,"真气丹(10000)",1,1,1) 	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui2(player)	BSLevelUpLQJL(player,4,"七级生命玄晶",1,0,0) 	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui3(player)	BSLevelUpLQJL(player,5,"真气丹(10000)",2,2,1) 	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui4(player)	BSLevelUpLQJL(player,6,"八级生命玄晶",1,0,0) 	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui5(player)	BSLevelUpLQJL(player,7,"真气丹(10000)",3,3,1)	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui6(player)	BSLevelUpLQJL(player,8,"真气丹(10000)",5,5,1) 	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui7(player)	BSLevelUpLQJL(player,9,"九级生命玄晶",1,0,0) 	onTalkJianLingHuiKui(player)	end
function onTalkJianLingHuiKui8(player)	BSLevelUpLQJL(player,10,"十级生命玄晶",1,0,0) 	onTalkJianLingHuiKui(player)	end

function BSLevelUpLQJL(player, nLevel, szItemName, nNum, nBagBlack, isBind)
	if not activity.isJianLingUpOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	if util.ppn(player,const.PP_SWORD_SLEVEL) < nLevel * 5 then
		player:alert(11,1,"对不起，您尚未将[无极轩辕剑]提升至[+"..nLevel.."]！")
		return
	end
	local tJianLingParam = {[3] = const.PP_JIANLING_LV3, 
							[4] = const.PP_JIANLING_LV4, 
							[5] = const.PP_JIANLING_LV5, 
							[6] = const.PP_JIANLING_LV6, 
							[7] = const.PP_JIANLING_LV7, 
							[8] = const.PP_JIANLING_LV8, 
							[9] = const.PP_JIANLING_LV9, 
							[10] = const.PP_JIANLING_LV10, 
							}
	if util.ppn(player,tJianLingParam[nLevel]) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tJianLingParam[nLevel],1)
	player:add_item(szItemName, nNum, isBind)
	player:alert(11,1,"成功领取无极轩辕剑+"..nLevel.."：["..szItemName.."] *"..nNum.."!")
	return
end

function onTalkTaoZhuangXianLi(player)
	player:echo([[<font color="#FFFF00">            夏至积分套装献礼</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
---------------------------------------
活动时间：<font color="#FFff00">更新后-6月27日</font>
---------------------------------------
活动说明：<font color="#FFff00">活动时间内，玩家升级积分套装的成功几率提升至[<font color="#FF0000">100%</font>]！</font>
---------------------------------------<font color="#FFaa00">

      <a href="event:talk_TaoZhuangXianLi1">套装使者</a>（点击后自动寻路至NPC）</font>

---------------------------------------
                               <a href="event:talk_XiaZhi">返回首页</a>]]);
end

function onTalkTaoZhuangXianLi1(player)
	player:find_road_goto("v003","90","88","套装使者")
	onTalkTaoZhuangXianLi(player)
end

function onTalkHuiguiLibao(player)
	if not activity.isHuiguiLibaoOpen() then
		player:alert(11,1,"不在活动时间内，无法领取礼包！");
		return;
	end
	if util.ppn(player,const.PP_HG_IS_RECEIVE) == 1 then
		player:alert(11,1,"对不起，您已经领取了该礼包！");
		return;
	end
	if player:get_level() < 80 and util.ppn(player,const.PP_CZHZ_LV) < 1 then
		player:alert(11,1,"对不起，您的等级小于80级，也非红钻用户，无法领取该礼包！");
		return;
	end
	if player:num_bag_black() < 1 then
		player:alert(11,1,"背包空格不足1格,无法领取!");
		return;
	end
	player:add_item("夏日回归礼包",1,1);
	player:set_param(const.PP_HG_IS_RECEIVE,1);
	player:alert(11,1,"成功领取[夏日回归礼包*1]!");
	player:set_panel_data(PANEL_MINI_FUNCTION,"btnHuiguiLibao","visible","false");
	player:push_ckpanel_data(MINI_FUNCTION,PANEL_MINI_FUNCTION);
end

function onTalkShuJia(player)
	player:echo([[             <font color="#FFFF00">暑  假  活  动</font>
---------------------------------------
          1.<a href="event:talk_ShuJia1">暑假回馈豪华礼包</a>
---------------------------------------
          2.<a href="event:talk_ShuJia2">暑假双倍感恩回馈</a>
---------------------------------------
          3.<a href="event:talk_ShuJia3">暑假每日充值返利</a>
---------------------------------------
          4.<a href="event:talk_ShuJia4">暑假剑灵限时折扣</a>
---------------------------------------
          5.<a href="event:talk_ShuJia5">暑假天命修炼回馈</a>
---------------------------------------
          6.<a href="event:talk_ShuJia6">暑假限时折扣商城</a>
---------------------------------------
          7.<a href="event:talk_ShuJia7">暑假充值玄晶礼包</a>
---------------------------------------
          8.<a href="event:talk_ShuJia8">暑假神装限时升级</a>
---------------------------------------]]);
end

function onTalkShuJia1(player)	EchoHuiKuiLB(player, "ShuJia", "common")	end
function onTalkShuJia11(player)	LQHuiKuiLB(player, "ShuJia", "common")	onTalkShuJia1(player)	end
function onTalkShuJia2(player)	EchoDoubleExp(player, "ShuJia")	end
function onTalkShuJia3(player)	EchoMRZCFL(player, "ShuJia")	end
function onTalkShuJia31(player)	MRCZFLLQLB(player, "ShuJia")	onTalkShuJia3(player)	end

local tJianLingJinJieText = {ShuJia = {szName = "暑假剑灵限时折扣", start = "更新后", over = "7月8日", nOff = "八折", nTimes = 10, funcMain = "ShuJia"}, 
							MoZuBaoKu = {szName = "魔族剑灵限时折扣", start = "更新后", over = "7月24日", nOff1 = "九五折优惠", nOff2 = "八八折优惠", nOff3 = "八折优惠", nTimes = 20, funcMain = "MoZuBaoKu"},
							}

function EchoJianLingJinJie(player, szActivity)
	reset_player_jianlingjj_info(player)
	player:echo([[            <font color="#FFFF00">]]..tJianLingJinJieText[szActivity].szName..[[</font>
----------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
----------------------------------------
活动时间: <font color="#FFff00">]]..tJianLingJinJieText[szActivity].start..[[-]]..tJianLingJinJieText[szActivity].over..[[</font>
----------------------------------------
活动内容: <font color="#FFff00">活动期间内，所有服务器剑灵特惠进阶（<font color="#FF0000">仅限元宝进阶，商城内灵气珠不打折</font>）！</font><font color="#FFaa00">每日最多[<font color="#FF0000">]]..tJianLingJinJieText[szActivity].nTimes..[[</font>]次。</font>
----------------------------------------
活动说明：<font color="#FFff00">所有玩家都可享受<font color="#ee00ee">]]..tJianLingJinJieText[szActivity].nOff..[[</font>优惠！</font>
----------------------------------------
<font color="#FFaa00">今日剩余特惠进阶次数：<font color="#ee00ee">]]..util.ppn(player,const.PP_JIANLINGJINJIE_TIMES)..[[</font> 次</font>
----------------------------------------
                             <a href="event:talk_]]..tJianLingJinJieText[szActivity].funcMain..[[">返回上页</a>
]]);
end

function EchoJianLingJinJie2(player, szActivity)
	reset_player_jianlingjj_info(player)
	player:echo([[            <font color="#FFFF00">]]..tJianLingJinJieText[szActivity].szName..[[</font>
----------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
----------------------------------------
活动时间: <font color="#FFff00">]]..tJianLingJinJieText[szActivity].start..[[-]]..tJianLingJinJieText[szActivity].over..[[</font>
----------------------------------------
活动内容: <font color="#FFff00">活动期间，玩家使用元宝特惠进阶剑灵（<font color="#FF0000">仅限元宝升级剑灵，商城内灵气珠道具不打折</font>）！</font><font color="#FFaa00">每日最多[<font color="#FF0000">]]..tJianLingJinJieText[szActivity].nTimes..[[</font>]次。</font>
<font color="#FFaa00">
         0~1级剑灵  ]]..tJianLingJinJieText[szActivity].nOff1..[[


         2~3级剑灵  ]]..tJianLingJinJieText[szActivity].nOff2..[[


         4~9级剑灵  ]]..tJianLingJinJieText[szActivity].nOff3..[[</font>

----------------------------------------
活动说明：<font color="#FFff00">剑灵等级以<font color="#ee00ee">无极轩辕剑</font>的等级为判定标准。</font>
----------------------------------------
<font color="#FFaa00">今日剩余特惠进阶次数：<font color="#ee00ee">]]..util.ppn(player,const.PP_JIANLINGJINJIE_TIMES)..[[</font> 次</font>
----------------------------------------
                               <a href="event:talk_]]..tJianLingJinJieText[szActivity].funcMain..[[">返回上页</a>
]]);
end

function reset_player_jianlingjj_info(player)
	if activity.isJianLingDaZhe() then
		if util.ppn(player,const.PP_JIANLINGJINJIE_DATE) ~= today() then
			player:set_param(const.PP_JIANLINGJINJIE_DATE,today());
			player:set_param(const.PP_JIANLINGJINJIE_TIMES,20);
		else
			--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
		end
	else
		player:set_param(const.PP_JIANLINGJINJIE_TIMES,0);
	end
end

function onTalkShuJia4(player)	EchoJianLingJinJie(player, "ShuJia")	end

function onTalkShuJia5(player)
	player:echo([[<font color="#FFFF00">            暑假天命修炼回馈</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">更新后-7月12日</font>
活动说明：<font color="#FFff00">在活动期间内，玩家将<font color="#ee00ee">天命</font>修炼至对应阶数，可领取丰厚奖励！</font>
---------------------------------------<font color="#FFaa00">
   <font color="#ee00ee">5阶</font> 即可领取 <font color="#ee00ee">五级物防玄晶*1</font>  <a href="event:talk_ShuJia51">领取</a>

  <font color="#ee00ee">10阶</font> 即可领取 <font color="#ee00ee">六级物防玄晶*1</font>  <a href="event:talk_ShuJia52">领取</a>

  <font color="#ee00ee">15阶</font> 即可领取 <font color="#ee00ee">七级物防玄晶*1</font>  <a href="event:talk_ShuJia53">领取</a>

  <font color="#ee00ee">20阶</font> 即可领取 <font color="#ee00ee">八级物防玄晶*1</font>  <a href="event:talk_ShuJia54">领取</a>

  <font color="#ee00ee">25阶</font> 即可领取 <font color="#ee00ee">九级物防玄晶*1</font>  <a href="event:talk_ShuJia55">领取</a></font>
---------------------------------------
温馨提示：<font color="#FF0000">在活动时间之前升级的玩家也可领取奖励，每个账号仅限一次！</font>
---------------------------------------
                              <a href="event:talk_ShuJia">返回首页</a>]]);
end

function onTalkShuJia51(player)	LianHunLBLQ(player,5,"五级物防玄晶",1,0,0) 	onTalkShuJia5(player)	end
function onTalkShuJia52(player)	LianHunLBLQ(player,10,"六级物防玄晶",1,0,0) onTalkShuJia5(player)	end
function onTalkShuJia53(player)	LianHunLBLQ(player,15,"七级物防玄晶",1,0,0) onTalkShuJia5(player)	end
function onTalkShuJia54(player)	LianHunLBLQ(player,20,"八级物防玄晶",1,0,0) onTalkShuJia5(player)	end
function onTalkShuJia55(player)	LianHunLBLQ(player,25,"九级物防玄晶",1,0,0)	onTalkShuJia5(player)	end

local tLianHunParam = {[5] = const.PP_LIANHUN_LV5, 
						[10] = const.PP_LIANHUN_LV10, 
						[15] = const.PP_LIANHUN_LV15, 
						[20] = const.PP_LIANHUN_LV20, 
						[25] = const.PP_LIANHUN_LV25, 
					}

function LianHunLBLQ(player, nLevel, szItemName, nNum, nBagBlack, isBind)
	if not activity.isLianHunLiBaoOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	if util.ppn(player,const.PP_LIANHUN_LEVEL) < nLevel then
		player:alert(11,1,"对不起，您尚未将天命提升至["..nLevel.."阶]！")
		return
	end
	if util.ppn(player,tLianHunParam[nLevel]) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tLianHunParam[nLevel],1)
	player:add_item(szItemName, nNum, isBind)
	player:alert(11,1,"成功领取天命"..nLevel.."阶奖励：["..szItemName.."] *"..nNum.."!")
	return
end

function onTalkShuJia6(player)
	reset_player_zksc_info(player)
	player:echo([[<font color="#FFFF00">            暑假限时折扣商城</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-7月12日</font>
活动说明: <font color="#FFff00">在活动期间内，各位战神可在此处购买特惠价道具！</font>
---------------------------------------
##超级坐骑丹##              <a href="event:talk_ShuJia61">点击购买</a>
原价:<font color="#FF0000">2000元宝</font>     现价:<font color="#FFaa00">880元宝</font>
##超级真气丹##              <a href="event:talk_ShuJia62">点击购买</a>
原价:<font color="#FF0000">2000元宝</font>     现价:<font color="#FFaa00">990元宝</font>
##超级进阶石包##            <a href="event:talk_ShuJia63">点击购买</a>
原价:<font color="#FF0000">2000元宝</font>     现价:<font color="#FFaa00">990元宝</font>
##幸运神符(40%)##           <a href="event:talk_ShuJia64">点击购买</a>
原价:<font color="#FF0000">2400元宝</font>     现价:<font color="#FFaa00">1200元宝</font>
##幸运神符(50%)##           <a href="event:talk_ShuJia65">点击购买</a>
原价:<font color="#FF0000">4800元宝</font>     现价:<font color="#FFaa00">2400元宝</font>
##幸运神符(100%)##          <a href="event:talk_ShuJia66">点击购买</a>
原价:<font color="#FF0000">48000元宝</font>    现价:<font color="#FFaa00">24000元宝</font>
--------------------------------------
活动说明：<font color="#FFaa00">每种商品每天限购[<font color="#FF0000">50</font>]次。</font>
--------------------------------------
                            <a href="event:talk_ShuJia">返回首页</a>]]);
end

function onTalkShuJia61(player)	VcoinBuyItemsLimited(player, "ShuJia", "超级坐骑丹", 50, const.PP_SHUJIASALE_TIMES1, 880, 1, 1, 1)	onTalkShuJia6(player)	end
function onTalkShuJia62(player)	VcoinBuyItemsLimited(player, "ShuJia", "超级真气丹", 50, const.PP_SHUJIASALE_TIMES2, 990, 1, 1, 1)	onTalkShuJia6(player)	end
function onTalkShuJia63(player)	VcoinBuyItemsLimited(player, "ShuJia", "超级进阶石包", 50, const.PP_SHUJIASALE_TIMES3, 990, 1, 1, 1)	onTalkShuJia6(player)	end
function onTalkShuJia64(player)	VcoinBuyItemsLimited(player, "ShuJia", "幸运神符(40%)", 50, const.PP_SHUJIASALE_TIMES4, 1200, 1, 1, 1)	onTalkShuJia6(player)	end
function onTalkShuJia65(player)	VcoinBuyItemsLimited(player, "ShuJia", "幸运神符(50%)", 50, const.PP_SHUJIASALE_TIMES5, 2400, 1, 1, 1)	onTalkShuJia6(player)	end
function onTalkShuJia66(player)	VcoinBuyItemsLimited(player, "ShuJia", "幸运神符(100%)", 50, const.PP_SHUJIASALE_TIMES6, 24000, 1, 1, 1)	onTalkShuJia6(player)	end

function onTalkShuJia7(player)	EchoMRXuanJingLB(player, "ShuJia")	end
function onTalkShuJia71(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 5000)	onTalkShuJia7(player)	end
function onTalkShuJia72(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 10000)	onTalkShuJia7(player)	end
function onTalkShuJia73(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 30000)	onTalkShuJia7(player)	end
function onTalkShuJia74(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 50000)	onTalkShuJia7(player)	end
function onTalkShuJia75(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 100000)	onTalkShuJia7(player)	end
function onTalkShuJia76(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 300000)	onTalkShuJia7(player)	end
function onTalkShuJia77(player)	CZXFLBLQ(player, "ShuJia", "ShuJia", 500000)	onTalkShuJia7(player)	end

function onTalkShuJia8(player)
	player:echo([[            <font color="#FFFF00">春分神装限时升级</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-3月25日</font>
活动内容: <font color="#FFff00">活动期间内，玩家可使用<font color="#ee00ee">龙皇戒指</font>和<font color="#ee00ee">龙皇护腕</font>加套装积分[<font color="#FF0000">100%</font>]升级为<font color="#ee00ee">诛仙戒指</font>和<font color="#ee00ee">诛仙护腕</font>（<font color="#FF0000">同类物品只能佩戴一个</font>）！</font><font color="#FFaa00">
##诛仙戒指·武威##=龙皇戒指·武威+2400
套装积分                 <a href="event:talk_ShuJia831">点击兑换</a>
##诛仙戒指·烈焰##=龙皇戒指·烈焰+2400
套装积分                 <a href="event:talk_ShuJia832">点击兑换</a>
##诛仙戒指·无极##=龙皇戒指·无极+2400
套装积分                 <a href="event:talk_ShuJia833">点击兑换</a>
##诛仙护腕·武威##=龙皇护腕·武威+2400
套装积分                 <a href="event:talk_ShuJia841">点击兑换</a>
##诛仙护腕·烈焰##=龙皇护腕·烈焰+2400
套装积分                 <a href="event:talk_ShuJia842">点击兑换</a>
##诛仙护腕·无极##=龙皇护腕·无极+2400
套装积分                 <a href="event:talk_ShuJia843">点击兑换</a></font>
--------------------------------------
当前共有套装积分：<font color="#FFaa00">]]..util.ppn(player,const.PP_TZJF)..[[分</font>
活动说明：<font color="#FF0000">请将想要兑换的装备放入背包第一个格子进行兑换操作。</font>
<a href="event:talk_ShuJia81">下一页</a>                        <a href="event:talk_NewYear">返回首页</a>]])
end

function onTalkShuJia81(player)
	player:echo([[            <font color="#FFFF00">春节神装限时升级</font>
--------------------------------------
活动时间: <font color="#FFff00">更新后-2月24日</font>
活动内容: <font color="#FFff00">活动期间内，玩家可使用<font color="#ee00ee">龙皇戒指</font>和<font color="#ee00ee">龙皇护腕</font>加套装积分[<font color="#FF0000">100%</font>]升级为<font color="#ee00ee">诛仙戒指</font>和<font color="#ee00ee">诛仙护腕</font>（<font color="#FF0000">同类物品只能佩戴一个</font>）！</font><font color="#FFaa00">
##龙皇戒指·武威##=抚国大将军戒+1200套
装积分                 <a href="event:talk_ShuJia811">点击兑换</a>
##龙皇戒指·烈焰##=抚国大将军戒+1200套
装积分                 <a href="event:talk_ShuJia812">点击兑换</a>
##龙皇戒指·无极##=抚国大将军戒+1200套
装积分                 <a href="event:talk_ShuJia813">点击兑换</a>
##龙皇护腕·武威##=骠骑将军护腕+1200套
装积分                 <a href="event:talk_ShuJia821">点击兑换</a>
##龙皇护腕·烈焰##=骠骑将军护腕+1200套
装积分                 <a href="event:talk_ShuJia822">点击兑换</a>
##龙皇护腕·无极##=骠骑将军护腕+1200套
装积分                 <a href="event:talk_ShuJia823">点击兑换</a></font>
--------------------------------------
当前共有套装积分：<font color="#FFaa00">]]..util.ppn(player,const.PP_TZJF)..[[分</font>
活动说明：<font color="#FF0000">请将想要兑换的装备放入背包第一个格子进行兑换操作。</font>
<a href="event:talk_ShuJia8">上一页</a>                        <a href="event:talk_NewYear">返回首页</a>]])
end

function onTalkShuJia811(player)	DuiHuanTZJF(player,59000,1200,"抚国大将军戒","龙皇戒指·武威",59003)	onTalkShuJia81(player)	end
function onTalkShuJia812(player)	DuiHuanTZJF(player,59000,1200,"抚国大将军戒","龙皇戒指·烈焰",59004)	onTalkShuJia81(player)	end
function onTalkShuJia813(player)	DuiHuanTZJF(player,59000,1200,"抚国大将军戒","龙皇戒指·无极",59005)	onTalkShuJia81(player)	end

function onTalkShuJia821(player)	DuiHuanTZJF(player,69000,1200,"骠骑将军护腕","龙皇护腕·武威",69003)	onTalkShuJia81(player)	end
function onTalkShuJia822(player)	DuiHuanTZJF(player,69000,1200,"骠骑将军护腕","龙皇护腕·烈焰",69004)	onTalkShuJia81(player)	end
function onTalkShuJia823(player)	DuiHuanTZJF(player,69000,1200,"骠骑将军护腕","龙皇护腕·无极",69005)	onTalkShuJia81(player)	end

function onTalkShuJia831(player)	DuiHuanTZJF(player,59003,2400,"龙皇戒指·武威","诛仙戒指·武威",59006)	onTalkShuJia8(player)	end
function onTalkShuJia832(player)	DuiHuanTZJF(player,59004,2400,"龙皇戒指·烈焰","诛仙戒指·烈焰",59007)	onTalkShuJia8(player)	end
function onTalkShuJia833(player)	DuiHuanTZJF(player,59005,2400,"龙皇戒指·无极","诛仙戒指·无极",59008)	onTalkShuJia8(player)	end

function onTalkShuJia841(player)	DuiHuanTZJF(player,69003,2400,"龙皇护腕·武威","诛仙护腕·武威",69006)	onTalkShuJia8(player)	end
function onTalkShuJia842(player)	DuiHuanTZJF(player,69004,2400,"龙皇护腕·烈焰","诛仙护腕·烈焰",69007)	onTalkShuJia8(player)	end
function onTalkShuJia843(player)	DuiHuanTZJF(player,69005,2400,"龙皇护腕·无极","诛仙护腕·无极",69008)	onTalkShuJia8(player)	end

function DuiHuanTZJF(player, nOldItemID, nNeedJiFen, szOldWeapon, szNewWeapon, nNewItemID)	--通用套装积分兑换装备
	if not activity.isShenZhuangShengJiOpen() then
		player:alert(1,1,"目前不在活动期间，无法兑换！")
		return
	end
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == nOldItemID then
			if util.ppn(player,const.PP_TZJF) >= nNeedJiFen then
				if player:num_item(szOldWeapon,1) >= 1 then
					player:remove_item(szOldWeapon,1);
					player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)-nNeedJiFen);
					player:add_item(szNewWeapon,1);
					player:set_item_data(nNewItemID,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
					player:alert(1,1,"<font color='#ff0000'>恭喜您,成功将["..szOldWeapon.."]升级为["..szNewWeapon.."]!</font>");
					server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]在活动中成功将[<font color='#ee00ee'>"..szOldWeapon.."</font>]升级为[<font color='#ee00ee'>"..szNewWeapon.."</font>]!");
					server.info(10000,0,"勇士["..player:get_name().."]在活动中成功将["..szOldWeapon.."]升级为["..szNewWeapon.."]!");
				else
					player:alert(1,1,"你连["..szOldWeapon.."]都没有,我怎么给您升级呢?!");
				end
			else
				player:alert(1,1,"您的套装积分不足"..nNeedJiFen.."点,升级失败!");
			end
		else
			player:alert(1,1,"请将要升级的["..szOldWeapon.."]放在您包裹里的第1个格子里!");
		end
	else
		player:alert(1,1,"请将要升级的["..szOldWeapon.."]放在您包裹里的第1个格子里!");
	end
	return
end

function EchoShouLingAward(player, szActivity)
	local tShouLingAwardText = {MoZuBaoKu = {szName = "魔族兽灵升级回馈", start = "更新后", over = "7月28日", funcMain = "MoZuBaoKu"},
								XiaZhi = {szName = "中秋兽灵升级回馈", start = "更新后", over = "9月14日", funcMain = "XiaZhi"},
								Day14th = {szName = "春季兽灵升级回馈", start = "更新后", over = "3月12日", funcMain = "Day14th"},
								};

	player:echo([[<font color="#FFFF00">            ]]..tShouLingAwardText[szActivity].szName..[[</font>
----------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间：<font color="#FFff00">]]..tShouLingAwardText[szActivity].start..[[-]]..tShouLingAwardText[szActivity].over..[[</font>
活动说明：<font color="#FFff00">在活动期间内，玩家将<font color="#ee00ee">蛮力兽灵</font>提升至对应等级，可领取丰厚奖励！</font>
----------------------------------------<font color="#FFaa00">
<a href="event:talk_ShouLingAward1">蛮力兽灵lv10</a> 灵羽宝箱*1(随机4~8级灵羽)
<a href="event:talk_ShouLingAward2">蛮力兽灵lv20</a> 灵羽宝箱*3(随机4~8级灵羽)
<a href="event:talk_ShouLingAward3">蛮力兽灵lv30</a> 灵羽宝箱*5(随机4~8级灵羽)
<a href="event:talk_ShouLingAward4">蛮力兽灵lv35</a> 大型宝石宝箱*1(8~10级宝石)
<a href="event:talk_ShouLingAward5">蛮力兽灵lv40</a> 大型玄晶宝箱*2(7~9级玄晶)
<a href="event:talk_ShouLingAward6">蛮力兽灵lv45</a> 超级宝石宝箱*2(9~11级宝石)
<a href="event:talk_ShouLingAward7">蛮力兽灵lv50</a> 超级玄晶宝箱*2(8~10级玄晶)</font>
----------------------------------------
温馨提示：<font color="#FFaa00">在活动时间之前升级的玩家也可领取奖励，每个账号仅限一次！</font>
    <font color="#FF0000">在之前同类活动中领取过奖励的玩家，无法再次领取。</font>
----------------------------------------
                              <a href="event:talk_]]..tShouLingAwardText[szActivity].funcMain..[[">返回首页</a>]]);
end
function reset_player_shoulinsjhl_info(player)
	--因同类活动中领取过就无法再次领取 故每次活动开始时无需重置相关变量
	if activity.isShouLingLiBaoOpen() then
		activity.HUODONG_BIAOSHI = activity.isLastActivityOpen()
		if util.ppn(player,const.PP_SHOULINGJJ_LVFLAG) <= activity.HUODONG_BIAOSHI then
			player:set_param(const.PP_SHOULINGJJ_LVFLAG,activity.HUODONG_BIAOSHI+3);
			local lvParam = {const.PP_SHOULING_LV10, 
						const.PP_SHOULING_LV20, 
						const.PP_SHOULING_LV30, 
						const.PP_SHOULING_LV35, 
						const.PP_SHOULING_LV40, 
						const.PP_SHOULING_LV45, 
						const.PP_SHOULING_LV50, 
					}
			for i = 1, #lvParam do
				player:set_param(lvParam[i],0);
			end
		end
	end
end
function onTalkShouLingAward1(player)	ShouLingLBLQ(player,10,"灵羽宝箱",1,1,1) 	onTalkDay14th15(player)	end
function onTalkShouLingAward2(player)	ShouLingLBLQ(player,20,"灵羽宝箱",3,1,1) 	onTalkDay14th15(player)	end
function onTalkShouLingAward3(player)	ShouLingLBLQ(player,30,"灵羽宝箱",5,1,1) 	onTalkDay14th15(player)	end
function onTalkShouLingAward4(player)	ShouLingLBLQ(player,35,"大型宝石宝箱",1,1,1) onTalkDay14th15(player)	end
function onTalkShouLingAward5(player)	ShouLingLBLQ(player,40,"大型玄晶宝箱",2,2,1)	onTalkDay14th15(player)	end
function onTalkShouLingAward6(player)	ShouLingLBLQ(player,45,"超级宝石宝箱",2,2,1)	onTalkDay14th15(player)	end
function onTalkShouLingAward7(player)	ShouLingLBLQ(player,50,"超级玄晶宝箱",2,2,1)	onTalkDay14th15(player)	end

local tShouLingParam = {[10] = const.PP_SHOULING_LV10, 
						[20] = const.PP_SHOULING_LV20, 
						[30] = const.PP_SHOULING_LV30, 
						[35] = const.PP_SHOULING_LV35, 
						[40] = const.PP_SHOULING_LV40, 
						[45] = const.PP_SHOULING_LV45, 
						[50] = const.PP_SHOULING_LV50, 
					}

function ShouLingLBLQ(player, nLevel, szItemName, nNum, nBagBlack, isBind)
	if not activity.isShouLingLiBaoOpen() then
		player:alert(11,1,"非活动时间，无法领取哦!")
		return
	end
	if util.ppn(player,const.PP_SHOULING_LEVEL) < nLevel * 6 then
		player:alert(11,1,"对不起，您尚未将蛮力兽灵提升至["..nLevel.."级]！")
		return
	end
	if util.ppn(player,tShouLingParam[nLevel]) > 0 then
		player:alert(11,1,"对不起，您已领取过该奖励，无法再次领取哦！")
		return
	end
	if player:num_bag_black() < nBagBlack then
		player:alert(11,1,"背包空格不足"..nBagBlack.."格,无法领取!");
		return
	end
	player:set_param(tShouLingParam[nLevel],1)
	player:add_item(szItemName, nNum, isBind)
	player:alert(11,1,"成功领取蛮力兽灵"..nLevel.."级奖励：["..szItemName.."] *"..nNum.."!")
	return
end

function onTalkMoZuBaoKu(player)
	player:echo([[              <font color="#FFFF00">荣耀庆典活动</font>
---------------------------------------
          1.<a href="event:talk_MoZuBaoKu1">荣耀回馈豪华礼包</a>
---------------------------------------
          2.<a href="event:talk_MoZuBaoKu2">荣耀双倍感恩回馈</a>
---------------------------------------
          3.<a href="event:talk_LeiJiChongZhi">荣耀充值即送玉佩</a>
---------------------------------------
          4.<a href="event:talk_MoZuBaoKu4">荣耀升级超值抢购</a>
---------------------------------------
          5.<a href="event:talk_PetJinJie">荣耀守护进化折扣</a>
---------------------------------------
          6.<a href="event:talk_ZiZhiTiSheng">荣耀资质提升盛典</a>
---------------------------------------
          7.<a href="event:talk_ZheKouMallLimited">荣耀限时折扣商城</a>
---------------------------------------
          8.<a href="event:talk_MoZuBaoKu6">荣耀每日消费豪礼</a>
               <font color="#FF0000">[超值玉石]</font>
---------------------------------------]]);
end

function onTalkMoZuBaoKu1(player)	EchoHuiKuiLB(player, "MoZuBaoKu", "Day14th")	end
function onTalkMoZuBaoKu11(player)	LQHuiKuiLB(player, "MoZuBaoKu", "Day14th")	onTalkMoZuBaoKu1(player)	end
function onTalkMoZuBaoKu2(player)	EchoDoubleExp(player, "MoZuBaoKu")	end
function onTalkMoZuBaoKu4(player)	EchoJingYanDan(player, "MoZuBaoKu")	end
function onTalkMoZuBaoKu41(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "经验珠(5000万)", 3, const.PP_JC_SJQG_TIMES1, 990, 1, 1, 1)	onTalkMoZuBaoKu4(player)	end
function onTalkMoZuBaoKu42(player)	VcoinBuyItemsLimited(player, "MoZuBaoKu", "经验珠(2000万)", 3, const.PP_JC_SJQG_TIMES2, 400, 1, 1, 1)	onTalkMoZuBaoKu4(player)	end

function onTalkMoZuBaoKu6(player)		EchoZCXFHLMain(player, "MoZuBaoKu")	end
function onTalkMoZuBaoKu50(player)		EchoZCXFHL(player, "MoZuBaoKu", "cost", 5000)		end
function onTalkMoZuBaoKu100(player)		EchoZCXFHL(player, "MoZuBaoKu", "cost", 10000)		end
function onTalkMoZuBaoKu300(player)		EchoZCXFHL(player, "MoZuBaoKu", "cost", 30000)		end
function onTalkMoZuBaoKu500(player)		EchoZCXFHL(player, "MoZuBaoKu", "cost", 50000)		end
function onTalkMoZuBaoKu1000(player)	EchoZCXFHL(player, "MoZuBaoKu", "cost", 100000)	end
function onTalkMoZuBaoKu3000(player)	EchoZCXFHL(player, "MoZuBaoKu", "cost", 300000)	end
function onTalkMoZuBaoKu5000(player)	EchoZCXFHL(player, "MoZuBaoKu", "cost", 500000)	end

function onTalkMoZuBaoKu50b(player)		CZXFLBLQ(player, "MoZuBaoKu", "cost", 5000)		onTalkMoZuBaoKu50(player)		end
function onTalkMoZuBaoKu100b(player)	CZXFLBLQ(player, "MoZuBaoKu", "cost", 10000)	onTalkMoZuBaoKu100(player)		end
function onTalkMoZuBaoKu300b(player)	CZXFLBLQ(player, "MoZuBaoKu", "cost", 30000)	onTalkMoZuBaoKu300(player)		end
function onTalkMoZuBaoKu500b(player)	CZXFLBLQ(player, "MoZuBaoKu", "cost", 50000)	onTalkMoZuBaoKu500(player)		end
function onTalkMoZuBaoKu1000b(player)	CZXFLBLQ(player, "MoZuBaoKu", "cost", 100000)	onTalkMoZuBaoKu1000(player)		end
function onTalkMoZuBaoKu3000b(player)	CZXFLBLQ(player, "MoZuBaoKu", "cost", 300000)	onTalkMoZuBaoKu3000(player)		end
function onTalkMoZuBaoKu5000b(player)	CZXFLBLQ(player, "MoZuBaoKu", "cost", 500000)	onTalkMoZuBaoKu5000(player)		end

function EchoShouLingJinJie2(player, szActivity)
	reset_player_shoulingjj_info(player)
	local tShouLingJinJieText = {ChinaJoy = {szName = "七夕兽灵限时折扣", start = "更新后", over = "8月1日", nOff1 = "九五", nOff2 = "八八", nOff3 = "八", nTimes = 20, funcMain = "ChinaJoy"},
								XiaZhi = {szName = "立冬兽灵限时折扣", start = "更新后", over = "11月10日", nOff1 = "九五", nOff2 = "八八", nOff3 = "八", nTimes = 20, funcMain = "XiaZhi"},
								Day14th = {szName = "春季兽灵限时折扣", start = "更新后", over = "3月9日", nOff1 = "九五", nOff2 = "八八", nOff3 = "八", nTimes = 20, funcMain = "Day14th"},
							}
	player:echo([[            <font color="#FFFF00">]]..tShouLingJinJieText[szActivity].szName..[[</font>
----------------------------------------
活动对象: <font color="#FFaa00">所有玩家</font>
----------------------------------------
活动时间: <font color="#FFff00">]]..tShouLingJinJieText[szActivity].start..[[-]]..tShouLingJinJieText[szActivity].over..[[</font>
----------------------------------------
活动内容: <font color="#FFff00">活动期间，玩家使用元宝特惠进阶兽灵（<font color="#FF0000">仅限元宝升级兽灵，商城内兽灵精华道具不打折</font>）！</font><font color="#FFaa00">每日最多[<font color="#FF0000">]]..tShouLingJinJieText[szActivity].nTimes..[[</font>]次。</font>
<font color="#FFaa00">
        0~10级兽灵  ]]..tShouLingJinJieText[szActivity].nOff1..[[折优惠

       11~30级兽灵  ]]..tShouLingJinJieText[szActivity].nOff2..[[折优惠

       31~50级兽灵  ]]..tShouLingJinJieText[szActivity].nOff3..[[折优惠</font>

----------------------------------------
<font color="#FFaa00">今日剩余特惠进阶次数：<font color="#ee00ee">]]..util.ppn(player,const.PP_SHOULINGJINJIE_TIMES)..[[</font> 次</font>
----------------------------------------
                               <a href="event:talk_]]..tShouLingJinJieText[szActivity].funcMain..[[">返回上页</a>
]]);
end

function reset_player_shoulingjj_info(player)
	if activity.isShouLingDaZhe() then
		if util.ppn(player,const.PP_SHOULINGJINJIE_DATE) ~= today() then
			player:set_param(const.PP_SHOULINGJINJIE_DATE,today());
			player:set_param(const.PP_SHOULINGJINJIE_TIMES,20);
		else
			--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
		end
	else
		player:set_param(const.PP_SHOULINGJINJIE_TIMES,0);
	end
end

function onTalkChinaJoy(player)
	player:echo([[                <font color="#FFFF00">月初活动</font>
---------------------------------------
          1.<a href="event:talk_ChinaJoy1">月初回馈豪华礼包</a>
---------------------------------------
          2.<a href="event:talk_ChinaJoy2">月初双倍感恩回馈</a>
---------------------------------------
          3.<a href="event:talk_ChinaJoy3">月初充值即送徽记</a>
---------------------------------------
          4.<a href="event:talk_ChinaJoy4">月初守护升级抢购</a>
---------------------------------------
          5.<a href="event:talk_HongZuanDuiHuan">月初绑定元宝盛典</a>
---------------------------------------
          6.<a href="event:talk_BindVcoinMall">月初限时绑元商城</a>
---------------------------------------
          7.<a href="event:talk_ChinaJoy7">月初每日充值豪礼</a>
           <font color="#FF0000">[青龙丹和王者徽记]</font>
---------------------------------------]]);
end

function onTalkChinaJoy1(player)	EchoHuiKuiLB(player, "ChinaJoy", "Day14th")	end
function onTalkChinaJoy11(player)	LQHuiKuiLB(player, "ChinaJoy", "Day14th")	onTalkChinaJoy1(player)	end
function onTalkChinaJoy2(player)	EchoDoubleExp(player, "ChinaJoy")	end
function onTalkChinaJoy3(player)	EchoMRZCFL(player, "ChinaJoy")	end
function onTalkChinaJoy31(player)	MRCZFLLQLB(player, "ChinaJoy")	onTalkChinaJoy3(player)	end
function onTalkChinaJoy4(player)	EchoCWJingYanDan(player, "ChinaJoy")	end
function onTalkChinaJoy41(player)	VcoinBuyItemsLimited(player, "ChinaJoy", "守护经验丹(5000万)", 3, const.PP_CWJYD_TIMES1, 990, 1, 1, 1)	onTalkChinaJoy4(player)	end
function onTalkChinaJoy42(player)	VcoinBuyItemsLimited(player, "ChinaJoy", "守护经验丹(2000万)", 3, const.PP_CWJYD_TIMES2, 400, 1, 1, 1)	onTalkChinaJoy4(player)	end

function onTalkBindVcoinMall(player)
	player:echo([[<font color="#FFFF00">            月初限时绑元商城</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-9月7日</font>
活动说明: <font color="#FFff00">在活动期间内，各位玩家可在此处使用绑定元宝购买超值道具！</font>
---------------------------------------
##超级真气丹##              <a href="event:talk_BindVcoinMall2">点击购买</a>
现价:<font color="#FFaa00">2000 绑定元宝</font>

##超级坐骑丹##              <a href="event:talk_BindVcoinMall1">点击购买</a>
现价:<font color="#FFaa00">2000 绑定元宝</font>

##超级进阶石包##            <a href="event:talk_BindVcoinMall3">点击购买</a>
现价:<font color="#FFaa00">2000 绑定元宝</font>

##聚灵珠##                  <a href="event:talk_BindVcoinMall4">点击购买</a>
现价:<font color="#FFaa00">1280 绑定元宝</font>

##八倍宝典##                <a href="event:talk_BindVcoinMall5">点击购买</a>
现价:<font color="#FFaa00">3750 绑定元宝</font>
---------------------------------------
<a href="event:talk_ChinaJoy">返回首页</a>                        <a href="event:talk_BindVcoinMall02">下一页</a>]]);
end

function onTalkBindVcoinMall02(player)
	reset_player_zksc_info(player)
	player:echo([[<font color="#FFFF00">            月初限时绑元商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-9月7日</font>
活动说明: <font color="#FFff00">在活动期间内，各位玩家可在此处使用绑定元宝购买超值道具！</font>
---------------------------------------
##兽灵精华(10000)##         <a href="event:talk_BindVcoinMall7">点击购买</a>
现价:<font color="#FFaa00">20000 绑定元宝</font>

##灵气珠(10000)##           <a href="event:talk_BindVcoinMall8">点击购买</a>
现价:<font color="#FFaa00">20000 绑定元宝</font>

##八级攻击玄晶##            <a href="event:talk_BindVcoinMall9">点击购买</a>
现价:<font color="#FFaa00">78408 绑定元宝</font>

##女娲神石##                <a href="event:talk_BindVcoinMall10">点击购买</a>
现价:<font color="#FFaa00">11888 绑定元宝</font>
---------------------------------------
<a href="event:talk_ChinaJoy">返回首页</a>                        <a href="event:talk_BindVcoinMall">上一页</a>]]);
end

function onTalkBindVcoinMall2(player)	BindVcoinBuyItems(player, "ChinaJoy", "超级真气丹", 2000, 1, 1, 1, "140901")	onTalkBindVcoinMall(player)	end
function onTalkBindVcoinMall1(player)	BindVcoinBuyItems(player, "ChinaJoy", "超级坐骑丹", 2000, 1, 1, 1, "140901")	onTalkBindVcoinMall(player)	end
function onTalkBindVcoinMall3(player)	BindVcoinBuyItems(player, "ChinaJoy", "超级进阶石包", 2000, 1, 1, 1, "140901")	onTalkBindVcoinMall(player)	end
function onTalkBindVcoinMall4(player)	BindVcoinBuyItems(player, "ChinaJoy", "聚灵珠", 1280, 1, 1, 1, "140901")		onTalkBindVcoinMall(player)	end
function onTalkBindVcoinMall5(player)	BindVcoinBuyItems(player, "ChinaJoy", "八倍宝典", 3750, 1, 1, 1, "140901")		onTalkBindVcoinMall(player)	end
--function onTalkChinaJoy66(player)	VcoinBuyItemsLimited(player, "ChinaJoy", "幸运神符(100%)", 50, const.PP_SHUJIASALE_TIMES6, 24000, 1, 1, 1)	onTalkChinaJoy6(player)	end
function onTalkBindVcoinMall7(player)	BindVcoinBuyItems(player, "ChinaJoy", "兽灵精华(10000)", 20000, 1, 1, 1, "140901")	onTalkBindVcoinMall02(player)	end
function onTalkBindVcoinMall8(player)	BindVcoinBuyItems(player, "ChinaJoy", "灵气珠(10000)", 20000, 1, 1, 1, "140901")	onTalkBindVcoinMall02(player)	end
function onTalkBindVcoinMall9(player)	BindVcoinBuyItems(player, "ChinaJoy", "八级攻击玄晶", 78408, 1, 0, 0, "140901")		onTalkBindVcoinMall02(player)	end
function onTalkBindVcoinMall10(player)	BindVcoinBuyItems(player, "ChinaJoy", "女娲神石", 11888, 1, 1, 1, "140901")			onTalkBindVcoinMall02(player)	end
--function onTalkChinaJoy611(player)	VcoinBuyItemsLimited(player, "ChinaJoy", "高级融合符", 50, const.PP_SHUJIASALE_TIMES11, 8100, 1, 1, 1)	onTalkChinaJoy602(player)	end
--function onTalkChinaJoy612(player)	VcoinBuyItemsLimited(player, "ChinaJoy", "超级融合符", 50, const.PP_SHUJIASALE_TIMES12, 16200, 1, 1, 1)	onTalkChinaJoy602(player)	end

function onTalkChinaJoy7(player)		EchoZCXFHLMain(player, "ChinaJoy")	end
function onTalkChinaJoy50(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 5000)	end
function onTalkChinaJoy100(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 10000)	end
function onTalkChinaJoy300(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 30000)	end
function onTalkChinaJoy500(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 50000)	end
function onTalkChinaJoy1000(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 100000)	end
function onTalkChinaJoy3000(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 300000)	end
function onTalkChinaJoy5000(player)		EchoZCXFHL(player, "ChinaJoy", "recharge", 500000)	end

function onTalkChinaJoy50b(player)		CZXFLBLQ(player, "ChinaJoy", "recharge", 5000)		onTalkChinaJoy50(player)		end
function onTalkChinaJoy100b(player)		CZXFLBLQ(player, "ChinaJoy", "recharge", 10000)		onTalkChinaJoy100(player)		end
function onTalkChinaJoy300b(player)		CZXFLBLQ(player, "ChinaJoy", "recharge", 30000)		onTalkChinaJoy300(player)		end
function onTalkChinaJoy500b(player)		CZXFLBLQ(player, "ChinaJoy", "recharge", 50000)		onTalkChinaJoy500(player)		end
function onTalkChinaJoy1000b(player)	CZXFLBLQ(player, "ChinaJoy", "recharge", 100000)	onTalkChinaJoy1000(player)		end
function onTalkChinaJoy3000b(player)	CZXFLBLQ(player, "ChinaJoy", "recharge", 300000)	onTalkChinaJoy3000(player)		end
function onTalkChinaJoy5000b(player)	CZXFLBLQ(player, "ChinaJoy", "recharge", 500000)	onTalkChinaJoy5000(player)		end

function onTalkChinaJoy8(player)
	player:echo([[<font color="#FFFF00">            七夕时装限时兑换</font>
----------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-8月5日</font>
活动内容: <font color="#FFff00">活动期间内，玩家可花费<font color="#FFaa00">20000</font>元宝将时装<font color="#00FF00">圣洁护士袍(半月)</font>/<font color="#00FF00">圣洁护士衣(半月)</font>升级为<font color="#ee00ee">圣洁护士袍(永久)</font>/<font color="#ee00ee">圣洁护士衣(永久)</font>！</font>
----------------------------------------<font color="#FFff00">
##圣洁护士袍(半月)##升级为

##圣洁护士袍(永久)##          <a href="event:talk_ChinaJoy81">点击兑换</a>


##圣洁护士衣(半月)##升级为

##圣洁护士衣(永久)##          <a href="event:talk_ChinaJoy82">点击兑换</a></font>

----------------------------------------
活动说明：<font color="#FF0000">请将时装放入背包第一个格子进行兑换。</font>
----------------------------------------
                               <a href="event:talk_ChinaJoy">返回首页</a> ]]);
end

function ShiZhuangDuiHuan(player, nOldItemID, szOldItem, nNeedVcoin, szNewItem, nNewItemID)
	if not activity.isShiZhuangDHOpen() then
		player:alert(1,1,"非活动时间内，无法领取哦!")
		return
	end
	if player:get_item_data_by_pos(0) == nOldItemID then
		if player:get_vcoin() >= nNeedVcoin then
			player:remove_item(nOldItemID,1);
			player:add_item(nNewItemID,1,0);
			player:sub_vcoin(nNeedVcoin,"ChinaJoy"..szNewItem);
			player:alert(1,1,"恭喜您成功将["..szOldItem.."]升级为["..szNewItem.."]!");
		else
			player:alert(1,1,"您的元宝不足"..nNeedVcoin.."，无法升级!");
		end

	else
		player:alert(1,1,"请将要升级的["..szOldItem.."]放在您包裹里的第1个格子里!");
	end
end

function onTalkChinaJoy81(player)	ShiZhuangDuiHuan(player, 150002, "圣洁护士袍(半月)", 20000, "圣洁护士袍(永久)", 150001)	onTalkChinaJoy8(player)	end
function onTalkChinaJoy82(player)	ShiZhuangDuiHuan(player, 155002, "圣洁护士衣(半月)", 20000, "圣洁护士衣(永久)", 155001)	onTalkChinaJoy8(player)	end


function onTalkBindVcoinMallLimit(player)
	player:echo([[<font color="#FFFF00">            金秋限时绑元商城</font>
---------------------------------------
活动对象：<font color="#FFaa00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-10月12日</font>
活动说明: <font color="#FFff00">在活动期间内，各位玩家可在此处使用绑定元宝购买超值道具！每种道具每天限制购买[<font color="#FF0000">5</font>]次</font>
---------------------------------------
##星石##              	  <a href="event:talk_BindVcoinMallLimit1">点击购买</a>
现价:<font color="#FFaa00">8000 绑定元宝</font>
##八级生命玄晶##      	  <a href="event:talk_BindVcoinMallLimit2">点击购买</a>
现价:<font color="#FFaa00">78408 绑定元宝</font>
##超级真气丹##        	  <a href="event:talk_BindVcoinMallLimit3">点击购买</a>
现价:<font color="#FFaa00">2000 绑定元宝</font>
##超级坐骑丹##        	  <a href="event:talk_BindVcoinMallLimit4">点击购买</a>
现价:<font color="#FFaa00">2000 绑定元宝</font>
##超级进阶石包##      	  <a href="event:talk_BindVcoinMallLimit5">点击购买</a>
现价:<font color="#FFaa00">2000 绑定元宝</font>
---------------------------------------
<a href="event:talk_Day14th">返回首页</a>                        <a href="event:talk_BindVcoinMallLimit02">下一页</a>]]);
end

function onTalkBindVcoinMallLimit02(player)
	reset_player_zksc_info(player)
	player:echo([[<font color="#FFFF00">            月初限时绑元商城</font>
---------------------------------------
活动对象：<font color="#FFff00">所有玩家</font>
活动时间: <font color="#FFff00">更新后-10月12日</font>
活动说明: <font color="#FFff00">在活动期间内，各位玩家可在此处使用绑定元宝购买超值道具！每种道具每天限制购买[<font color="#FF0000">5</font>]次</font>
---------------------------------------
##聚灵珠##                  <a href="event:talk_BindVcoinMallLimit6">点击购买</a>
现价:<font color="#FFaa00">1280 绑定元宝</font>
##八倍宝典##                <a href="event:talk_BindVcoinMallLimit7">点击购买</a>
现价:<font color="#FFaa00">3750 绑定元宝</font>
##兽灵精华(10000)##         <a href="event:talk_BindVcoinMallLimit8">点击购买</a>
现价:<font color="#FFaa00">20000 绑定元宝</font>
##灵气珠(10000)##           <a href="event:talk_BindVcoinMallLimit9">点击购买</a>
现价:<font color="#FFaa00">20000 绑定元宝</font>
---------------------------------------
<a href="event:talk_Day14th">返回首页</a>                        <a href="event:talk_BindVcoinMallLimit">上一页</a>]]);
end

function onTalkBindVcoinMallLimit1(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 1)	onTalkBindVcoinMallLimit(player)	end
function onTalkBindVcoinMallLimit2(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 2)	onTalkBindVcoinMallLimit(player)	end
function onTalkBindVcoinMallLimit3(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 3)	onTalkBindVcoinMallLimit(player)	end
function onTalkBindVcoinMallLimit4(player) 		BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 4)	onTalkBindVcoinMallLimit(player)	end
function onTalkBindVcoinMallLimit5(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 5)	onTalkBindVcoinMallLimit(player)	end
function onTalkBindVcoinMallLimit6(player) 		BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 6)	onTalkBindVcoinMallLimit02(player)	end
function onTalkBindVcoinMallLimit7(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 7)	onTalkBindVcoinMallLimit02(player)	end
function onTalkBindVcoinMallLimit8(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 8)	onTalkBindVcoinMallLimit02(player)	end
function onTalkBindVcoinMallLimit9(player)  	BindVcoinBuyItemsLimited(player,"Day14th","Day14th", 9)	onTalkBindVcoinMallLimit02(player)	end