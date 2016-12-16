module(..., package.seeall)

function i(player)
	player:echo([[当前服务器已经开放: ]]..(tonumber(server_start_day())+1)..[[ 天
----------------------------------------
武林: <a href="event:talk_wlzbgg">报名</a> <a href="event:talk_wlzbkq">开始</a> <a href="event:talk_wlzbgb">关闭</a> <a href="event:talk_sqjf">刷天魔兽</a> <a href="event:talk_xqboss">刷地魔兽</a>
----------------------------------------
战场: <a href="event:talk_smzckq">开启</a> <a href="event:talk_smzcboss">修罗</a> <a href="event:talk_smzcgb">结束</a> <a href="event:talk_xtjzckq">开启天晶战场</a> <a href="event:talk_entertj">进入天晶战场</a> <a href="event:talk_xxtjzcgb">结束天晶战场</a> <a href="event:talk_kqshuangbei">开启双倍</a> <a href="event:talk_gbshuangbei">关闭双倍</a>
----------------------------------------
禁地: <a href="event:talk_kqswjd">开启</a> <a href="event:talk_swjdsx">刷新</a> <a href="event:talk_gbswjd">关闭</a> <a href="event:talk_kqwenquan">开启温泉</a> <a href="event:talk_gbwenquan">关闭温泉</a>
----------------------------------------
怪物: <a href="event:talk_gwgc1">攻城1</a> <a href="event:talk_gwgc2">攻城2</a> <a href="event:talk_kqmijingjy">开秘境经验</a> <a href="event:talk_gbmijingjy">关秘境经验</a>
----------------------------------------
麒麟: <a href="event:talk_gmqlsd">刷新</a>  <a href="event:talk_qlsdgb">关闭</a>  <a href="event:talk_clear">清理背包</a> <a href="event:talk_cjdlfw">冲级大礼重置</a>
----------------------------------------
开区时间设置: <a href="event:talk_kqsj">①</a> <a href="event:talk_kqsj2">②</a> <a href="event:talk_kqsj3">③</a> <a href="event:talk_kqsj4">④</a> <a href="event:talk_kqsj5">⑤</a> <a href="event:talk_kqsj6">⑥</a> <a href="event:talk_kqsj7">⑦</a> <a href="event:talk_kqsjjia">＋</a> <a href="event:talk_kqsjjian">－</a>
----------------------------------------
初始新区充值排名: <a href="event:talk_xqczpm1">①</a>   <a href="event:talk_xqczpm2">②</a>   <a href="event:talk_xqczpm3">③</a>
----------------------------------------
设置合区时间: <a href='event:talk_mergeSvrResetTime8'>未合</a> <a href='event:talk_mergeSvrResetTime'>已合</a> [<font color='#ff0000'>小心操作</font>]
----------------------------------------
初始每周充值排名: <a href="event:talk_mzczpm1">①</a>   <a href="event:talk_mzczpm2">②</a>   <a href="event:talk_mzczpm3">③</a>
----------------------------------------
欢乐卡牌活动:<a href="event:talk_kqkp">开启</a>  <a href="event:talk_gbkp">关闭</a> 
----------------------------------------
<a href="event:talk_duobao">开启夺宝奇兵</a> <a href="event:talk_duobaopaihang">开启夺宝奇兵排行</a>
----------------------------------------
<a href="event:talk_shouwei">重置守卫试炼次数</a> <a href="event:talk_cannon">人间大炮开启</a> <a href="event:talk_ltwaropen">领土争夺战开启</a> <a href="event:talk_ltwarstop">领土争夺战关闭</a>
----------------------------------------
原服务器跨服战: <a href="event:talk_kuafuopen">开启</a> <a href="event:talk_kuafuclose">关闭</a> 

                    <a href="event:talk_i2">进入其他活动相关操作</a>
----------------------------------------
]]);
--充值(player.onCongzi 测试使用): <a href="event:talk_cz1">100元宝</a>   <a href="event:talk_cz2">1000元宝</a>   <a href="event:talk_cz3">10000元宝</a>   <a href="event:talk_cz4">100000元宝</a>
----------------------------------------
end
function onTalkkuafuopen(player)
	server.set_temp_var("kuafuzhan","1");
	server.start_kuafu();
end
function onTalkkuafuclose(player)
	server.set_temp_var("kuafuzhan","");
	server.stop_kuafu();
end
--跨服服务器:开启跨服战 <a href="event:talk_kuafusj5">5分钟</a> <a href="event:talk_kuafusj10">10分钟</a> <a href="event:talk_kuafusj15">15分钟</a> <a href="event:talk_kuafusj30">30分钟</a> <a href="event:talk_kuafusj60">恢复原时间1小时</a>
function onTalkkuafusj5(player)
	server.set_temp_var("kuafuzhansj","5");
	processkuafuopen();
end
function onTalkkuafusj10(player)
	server.set_temp_var("kuafuzhansj","10");
	processkuafuopen();
end
function onTalkkuafusj15(player)
	server.set_temp_var("kuafuzhansj","15");
	processkuafuopen();
end
function onTalkkuafusj30(player)
	server.set_temp_var("kuafuzhansj","30");
	processkuafuopen();
end
function onTalkkuafusj60(player)
	server.set_temp_var("kuafuzhansj","0");
	processkuafuopen();
end
function processkuafuopen()
	processkuafuclose();
	server.set_temp_var("kuafuzhan","1");
	server.start_kuafu();
	server.set_var("server_kuafu_timer",tostring(os.time()));
	server.set_var("kuafuownertime","");
	server.set_var("kuafuowner","");
	server.set_var("kuafuguild","");
	server.set_var("kuafuarea","");	
	server.server_exe("newgui.lingdi.kuafubegin");
	server.info(100,0,"跨服战已开启!")
end
function processkuafuclose()
	server.set_temp_var("kuafuzhan","");
	if server.get_kuafu_state() > 0 then
		server.stop_kuafu();
		server.set_var("kuafuowner","");
	end
	server.server_exe("newgui.lingdi.kuafustop");
	server.info(100,0,"跨服战已关闭!")
end
--------------跨服服务器 引擎调用-----------------------

function onTalkltwaropen(player)
	newgui.lingdi.openLingDI();
end
function onTalkltwarstop(player)
	newgui.lingdi.closeLingDI();
end
function onTalkcannon(player)
	player:set_panel_data("panelminimapfun","btnsuperCannon","visible","true");
	player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
	server.set_temp_var("cannon",1);
end
function onTalkkqkp(play)
	server.set_temp_var("kardopen","1");
end

function onTalkgbkp(play)
	server.set_temp_var("kardopen","");
end

function  onTalkcz1( play)
	player.onCongzi(play,100,0,0);
end
function  onTalkcz2( play)
	player.onCongzi(play,1000,0,0);
end
function  onTalkcz3( play)
	player.onCongzi(play,10000,0,0);
end
function  onTalkcz4( play)
	player.onCongzi(play,100000,0,0);
end

function onTalkkqcjhd(player)
	--server.set_temp_var("xianshizhuanpan","1");
	--server.set_temp_var("activityopen","1");
	server.set_temp_var("HuiKuiLiBao","1");			--50级超值回馈礼包
	server.set_temp_var("doubleopen","1");			--双倍经验
	server.set_temp_var("MeiRiChongZhiFanLi","1");	--活动每日充值返利
	server.set_temp_var("JingYanDan","1");			--活动经验珠超值抢购
	server.set_temp_var("FenDuanCZXFHL","1");		--分段充值/消费豪礼
	--server.set_temp_var("VcoinToBVcoin","1");		--元宝兑换绑定元宝
	--server.set_temp_var("sqdzzz","0");
	--server.set_temp_var("buchangopen","1");
	--server.set_temp_var("KissDay","1");			--情人节活动
	--server.set_temp_var("zadanopen","1");
	--server.set_temp_var("XiaRiHuoDong","1");		--夏日活动
	--server.set_temp_var("DoubleZhuanSheng","1");	--双倍转生几率
	--server.set_temp_var("zadanopen","1");
	--server.set_temp_var("may37baifu","1");		--活动
	--server.set_temp_var("DoubleZhuanSheng","1");	--双倍转生几率
	server.set_temp_var("HuoDongZheKou","1");		--活动限时折扣商城
	--server.set_temp_var("JianLingUp","1");			--活动剑灵升级回馈
	--server.set_temp_var("JiFenTaoZhuang","1");		--活动积分套装献礼
	--server.set_temp_var("sbzc","1");		--战场双倍奖励
	--server.set_temp_var("huiguilibao","1");		--回归礼包
	--server.set_temp_var("JianLingDaZhe","1");		--活动剑灵特惠进阶
	server.set_temp_var("LianHunLiBao","1");		--活动炼魂礼包
	server.set_temp_var("ShenZhuangShengJi","1");		--活动神装升级
	server.set_temp_var("ShouLingLiBao","1");		--活动 兽灵升级奖励
	server.set_temp_var("ShouLingJinJie","1");		--活动 兽灵特惠进阶
	server.set_temp_var("ShiZhuangDuiHuan","1");	--活动 时装兑换
	server.set_temp_var("XuanJingHeCheng","1");	--活动 玄晶合成+20%
	server.set_temp_var("CWJingYanDan","1");	--活动 宠物经验丹
	server.set_temp_var("ActChongZhiLeiJi","1");	--活动 活动期间累计充值
	server.set_temp_var("XunBaoFanLi","1");	--活动 寻宝积分兑换道具
	server.set_temp_var("PetJinHua","1");	--活动 宠物一键进阶打折
	server.set_temp_var("PetZiZhiDan","1");	--活动 宠物资质丹双倍幸运值
	--server.set_temp_var("BindVcoinMall","1");	--活动 绑定元宝商城
	--server.set_temp_var("dropsth","1");		--掉落道具及兑换
	server.set_temp_var("YuPeiHuiKui","1");		--玉佩回馈
	server.set_temp_var("lingyuzhuanpan","1");		--灵玉转盘
	server.set_temp_var("Shenqisj","1"); --神器升级几率增加
	--server.set_temp_var("longchengmibao","1"); 	--龙城秘宝
	server.set_temp_var("xingshishengdian","1"); 	--兑换星石时的几率增加
	server.set_temp_var("LinhunHuiKui","1");
	--server.set_temp_var("fanlishengdian","1");		--返利盛典
	server.set_temp_var("petjinghuahuikui","1");
	server.set_temp_var("petzizhihuikui","1");
	server.set_temp_var("TianmingTH","1");        --天命特惠

	server.info(10010,0,"各种活动开启啦！");
	--server.info(10010,0,"夏日活动活动,双倍转生几率开启..");
end

function onTalkgbcjhd(player)
	server.set_temp_var("TianmingTH",""); 
	server.set_temp_var("petzizhihuikui","");
	server.set_temp_var("petjinghuahuikui","");
	server.set_temp_var("LinhunHuiKui","");
	server.set_temp_var("HuiKuiLiBao","");		--50级超值回馈礼包
	server.set_temp_var("MeiRiChongZhiFanLi","");		--活动每日充值返利
	server.set_temp_var("JingYanDan","");		--活动经验珠超值抢购
	server.set_temp_var("FenDuanCZXFHL","");		--分段充值/消费豪礼
	server.set_temp_var("VcoinToBVcoin","");		--元宝兑换绑定元宝
	server.set_temp_var("zadanopen","");
	server.set_temp_var("activityopen","");
	server.set_temp_var("doubleopen","");
	server.set_temp_var("sqdzzz","");
	server.set_temp_var("buchangopen","");
	server.set_temp_var("KissDay","");			--情人节活动
	server.set_temp_var("sbzc","");		--战场双倍奖励
	server.set_temp_var("XiaRiHuoDong","");		--夏日活动
	server.set_temp_var("DoubleZhuanSheng","");	--双倍转生几率
	server.set_temp_var("HuoDongZheKou","");		--活动限时折扣商城
	server.set_temp_var("JianLingUp","");			--活动剑灵升级回馈
	server.set_temp_var("JiFenTaoZhuang","");		--活动积分套装献礼
	server.set_temp_var("huiguilibao","");		--回归礼包
	server.set_temp_var("may37baifu","");		--活动
	server.set_temp_var("JianLingDaZhe","");		--活动剑灵特惠进阶
	server.set_temp_var("LianHunLiBao","");		--活动炼魂礼包
	server.set_temp_var("ShenZhuangShengJi","");		--活动神装升级
	server.set_temp_var("ShouLingLiBao","");		--活动 兽灵升级奖励
	server.set_temp_var("ShouLingJinJie","");		--活动 兽灵特惠进阶
	server.set_temp_var("ShiZhuangDuiHuan","");	--活动 时装兑换
	server.set_temp_var("XuanJingHeCheng","");	--活动 玄晶合成+20%
	server.set_temp_var("CWJingYanDan","");	--活动 宠物经验丹
	server.set_temp_var("ActChongZhiLeiJi","");	--活动 活动期间累计充值
	server.set_temp_var("XunBaoFanLi","");	--活动 寻宝积分兑换道具
	server.set_temp_var("PetJinHua","");	--活动 宠物一键进阶打折
	server.set_temp_var("PetZiZhiDan","");	--活动 宠物资质丹双倍幸运值
	server.set_temp_var("BindVcoinMall","");	--活动 绑定元宝商城
	server.set_temp_var("dropsth","");		--掉落道具及兑换
	server.set_temp_var("YuPeiHuiKui","");		--玉佩回馈
	server.set_temp_var("lingyuzhuanpan","");		--灵玉转盘
	server.set_temp_var("Shenqisj","");
	server.set_temp_var("longchengmibao","");		--龙城秘宝
	server.set_temp_var("xingshishengdian",""); 	--兑换星石时的几率增加
	server.set_temp_var("fanlishengdian","");		--返利盛典

	server.info(10010,0,"活动已经关闭!");
end

function onTalkkqtbhd(player)
	if server.get_temp_var("otheracy") == "" then
		server.set_temp_var("otheracy","1");
		server.info(10010,0,"活动已经开启!");
	end
end

function onTalkgbtbhd(player)
	if server.get_temp_var("otheracy") == "1" then
		server.set_temp_var("otheracy","");
		server.info(10010,0,"活动已经关闭!");
	end
end

function onTalkkqxscx(player)
	if server.get_temp_var("otheracyxscx") == "" then
		server.set_temp_var("otheracyxscx","1");
		server.info(10010,0,"活动已经开启!");
	end
end

function onTalkgbxscx(player)
	if server.get_temp_var("otheracyxscx") == "1" then
		server.set_temp_var("otheracyxscx","");
		server.info(10010,0,"活动已经关闭!");
	end
end

function onTalkkqfanli(player)
	if server.get_temp_var("fanli37wan") == "" then
		server.set_temp_var("fanli37wan","1");
		server.info(10010,0,"37wan大返利开启");
	end
end

function onTalkgbfanli(player)
	if server.get_temp_var("fanli37wan") == "1" then
		server.set_temp_var("fanli37wan","");
		server.info(10010,0,"37wan大返利已经关闭!37wan大返利已经关闭!");
	end
end

function onTalkzhuanshengsd(player)
	local map1 = server.find_map("zssd1");
	local map2 = server.find_map("zssd2");
	local map3 = server.find_map("zssd3");
	local map4 = server.find_map("zssd4");
	if map1:num_monster("[一转]赤焰魔君") == 0 then
		map1:mon_gen(22,31,"[一转]赤焰魔君",1,0,1,1);
	end
	if map2:num_monster("[二转]鬼斧恶魔") == 0 then
		map2:mon_gen(53,64,"[二转]鬼斧恶魔",1,0,1,1);
	end
	if map3:num_monster("[三转]暗夜领主") == 0 then
		map3:mon_gen(55,81,"[三转]暗夜领主",1,0,1,1);
	end
	if map4:num_monster("[四转]暗影妖后") == 0 then
		map4:mon_gen(38,77,"[四转]暗影妖后",1,0,1,1);
	end
	server.server_exe("npc.dituyidong.move_zssd");
	server.info(10000,0,"携带十级宝石和转生装备的超级转生BOSS出现在转生神殿,勇士们快从传送员处进入挑战吧!");
end

function onTalkFreshRank(player)
	gm.help2.freshLvRankInfo();
end

--初始每日充值排名: <a href="event:talk_mrczpm1">①</a>   <a href="event:talk_mrczpm2">②</a>   <a href="event:talk_mrczpm3">③</a>
function onTalklvtt(player)
	for u = 1,11 do
		server.set_var("SvrLvRankName"..u,"");
		server.set_var("SvrLvRankLv"..u,0);
		server.set_var("SvrLvRankExp"..u,0);
		server.set_var("SvrLvRankGot"..u,0);
	end
end

function onTalki2(player)
	player:echo([[----------------------------------------
设置合区王城变量: <a href="event:talk_hqkingno">未领取</a>     <a href="event:talk_hqkingye">已领取</a>
----------------------------------------
重置合服充值排名: <a href="event:talk_czrkhf1">①</a>  <a href="event:talk_czrkhf2">②</a>  <a href="event:talk_czrkhf3">③</a> [<font color='#ff0000'>小心操作</font>]
----------------------------------------
重置合服消费排名: <a href="event:talk_xfrkhf1">①</a>  <a href="event:talk_xfrkhf2">②</a>  <a href="event:talk_xfrkhf3">③</a> [<font color='#ff0000'>小心操作</font>]
----------------------------------------
重置新区冲级排名: <a href="event:talk_lvtt">清空排行</a>  <a href="event:talk_FreshRank">刷新排行</a>
----------------------------------------
转生神殿BOSS刷新: <a href="event:talk_zhuanshengsd">点击刷新</a>
----------------------------------------
冰火岛活动的开关: <a href="event:talk_kqbhdao">开启冰火岛</a>  <a href="event:talk_gbbhdao">关闭冰火岛</a>
----------------------------------------
远古废墟活动的开关: <a href="event:talk_kqygfx">开启远古废墟</a>  <a href="event:talk_gbygfx">关闭远古废墟</a>
----------------------------------------
流水活动<a href="event:talk_kqcjhd">开启</a> <a href="event:talk_gbcjhd">关闭</a> 许愿池:<a href="event:talk_xuyuanchi">重置</a> <a href="event:talk_xuyuanchikq">开启</a> <a href="event:talk_xuyuanchigb">关闭</a>
----------------------------------------
<a href="event:talk_kqtbhd">开启图标活动</a> <a href="event:talk_gbtbhd">关闭图标活动</a> <a href="event:talk_dropsth">开启活动掉落</a>
----------------------------------------
<a href="event:talk_kqxscx">开启限时促销活动</a> <a href="event:talk_gbxscx">关闭限时促销活动</a>
----------------------------------------
                        1 <a href="event:talk_i4">2</a> <a href="event:talk_i3">返回上页</a>
----------------------------------------
]]);
end
----------------------------------------gm指令暂时删除37返利活动
--<a href="event:talk_kqfanli">开启37返利活动</a> <a href="event:talk_gbfanli">关闭37返利活动</a>

function onTalki4(player)
	player:echo([[----------------------------------------
理财开关:<a href="event:talk_kqlc">开启</a> <a href="event:talk_gblc">关闭</a>
		  <a href="event:talk_lccz1">理财充值1</a> <a href="event:talk_lccz2">理财充值2</a> <a href="event:talk_lccz3">理财充值3</a>
		  <a href="event:talk_lccz4">理财充值4</a> <a href="event:talk_lccz5">理财充值5</a> <a href="event:talk_lccz6">理财充值6</a>
----------------------------------------
支持开关: <a href="event:talk_worldcupk">开</a> <a href="event:talk_worldcupg">关</a>
出线开关:<a href="event:talk_wcup1">A1</a> <a href="event:talk_wcup2">A2</a> <a href="event:talk_wcup3">A3</a> <a href="event:talk_wcup4">A4</a> <a href="event:talk_wcup5">B1</a> <a href="event:talk_wcup6">B2</a> <a href="event:talk_wcup7">B3</a> <a href="event:talk_wcup8">B4</a> <a href="event:talk_wcup9">C1</a> <a href="event:talk_wcup10">C2</a>
<a href="event:talk_wcup11">C3</a> <a href="event:talk_wcup12">C4</a> <a href="event:talk_wcup13">D1</a> <a href="event:talk_wcup14">D2</a> <a href="event:talk_wcup15">D3</a> <a href="event:talk_wcup16">D4</a> <a href="event:talk_wcup17">E1</a> <a href="event:talk_wcup18">E2</a> <a href="event:talk_wcup19">E3</a> <a href="event:talk_wcup20">E4</a> <a href="event:talk_wcup21">F1</a> <a href="event:talk_wcup22">F2</a> <a href="event:talk_wcup23">F3</a>
<a href="event:talk_wcup24">F4</a> <a href="event:talk_wcup25">G1</a> <a href="event:talk_wcup26">G2</a> <a href="event:talk_wcup27">G3</a> <a href="event:talk_wcup28">G4</a> <a href="event:talk_wcup29">H1</a> <a href="event:talk_wcup30">H2</a> <a href="event:talk_wcup31">H3</a> <a href="event:talk_wcup32">H4</a>
支持奖励: <a href="event:talk_zcjlk">开</a> <a href="event:talk_zcjlg">关</a>
排行奖励: <a href="event:talk_phjlk">开</a> <a href="event:talk_phjlg">关</a>
刷新榜单: <a href="event:talk_sxbdk">是</a> <a href="event:talk_sxbdg">否</a>

			<a href="event:talk_i2">1</a> 2 <a href="event:talk_i2">返回上页</a>
----------------------------------------
]]);
end

function onTalkdropsth(player)
	server.set_temp_var("dropsth","1");
	server.info(11111,0,"活动掉落已开启,本期掉落世界杯勋章!");
end

function onTalkworldcupk(player)
	server.set_temp_var("worldcup","1");	        --世界杯活动
end
function onTalkworldcupg(player)
	server.set_temp_var("worldcup","");	        --世界杯活动
end

function onTalkzcjlk(player)
	server.set_temp_var("zcjl","1");
end
function onTalkzcjlg(player)
	server.set_temp_var("zcjl","");
end

function onTalkphjlk(player)
	server.set_temp_var("phjl","1");
end
function onTalkphjlg(player)
	server.set_temp_var("phjl","");
end

function onTalksxbdk(player)
	server.set_temp_var("sxbd","");	       
end
function onTalksxbdg(player)
	server.set_temp_var("sxbd","1");	      
end

function onTalkwcup1(player) newgui.theworldcup.ChangeIswin(player,1); end
function onTalkwcup2(player) newgui.theworldcup.ChangeIswin(player,2); end
function onTalkwcup3(player) newgui.theworldcup.ChangeIswin(player,3); end
function onTalkwcup4(player) newgui.theworldcup.ChangeIswin(player,4); end
function onTalkwcup5(player) newgui.theworldcup.ChangeIswin(player,5); end
function onTalkwcup6(player) newgui.theworldcup.ChangeIswin(player,6);  end
function onTalkwcup7(player) newgui.theworldcup.ChangeIswin(player,7); end
function onTalkwcup8(player) newgui.theworldcup.ChangeIswin(player,8); end
function onTalkwcup9(player) newgui.theworldcup.ChangeIswin(player,9); end
function onTalkwcup10(player) newgui.theworldcup.ChangeIswin(player,10); end
function onTalkwcup11(player) newgui.theworldcup.ChangeIswin(player,11); end
function onTalkwcup12(player) newgui.theworldcup.ChangeIswin(player,12); end
function onTalkwcup13(player) newgui.theworldcup.ChangeIswin(player,13); end
function onTalkwcup14(player) newgui.theworldcup.ChangeIswin(player,14); end
function onTalkwcup15(player) newgui.theworldcup.ChangeIswin(player,15); end
function onTalkwcup16(player) newgui.theworldcup.ChangeIswin(player,16); end
function onTalkwcup17(player) newgui.theworldcup.ChangeIswin(player,17); end
function onTalkwcup18(player) newgui.theworldcup.ChangeIswin(player,18); end
function onTalkwcup19(player) newgui.theworldcup.ChangeIswin(player,19); end
function onTalkwcup20(player) newgui.theworldcup.ChangeIswin(player,20); end
function onTalkwcup21(player) newgui.theworldcup.ChangeIswin(player,21); end
function onTalkwcup22(player) newgui.theworldcup.ChangeIswin(player,22); end
function onTalkwcup23(player) newgui.theworldcup.ChangeIswin(player,23); end
function onTalkwcup24(player) newgui.theworldcup.ChangeIswin(player,24); end
function onTalkwcup25(player) newgui.theworldcup.ChangeIswin(player,25); end
function onTalkwcup26(player) newgui.theworldcup.ChangeIswin(player,26); end
function onTalkwcup27(player) newgui.theworldcup.ChangeIswin(player,27); end
function onTalkwcup28(player) newgui.theworldcup.ChangeIswin(player,28); end
function onTalkwcup29(player) newgui.theworldcup.ChangeIswin(player,29); end
function onTalkwcup30(player) newgui.theworldcup.ChangeIswin(player,30); end
function onTalkwcup31(player) newgui.theworldcup.ChangeIswin(player,31); end
function onTalkwcup32(player) newgui.theworldcup.ChangeIswin(player,32); end


function onTalkkqlc(player)
	server.set_temp_var("licai1","1");
end
function onTalkgblc(player)
	server.set_temp_var("licai1","");
end
function onTalklccz1(player)
	 player:set_param(const.PP_LICAI_CONGZHI,5000);
	 newgui.financing.fresh_panel_info(player);
end
function onTalklccz2(player)
	 player:set_param(const.PP_LICAI_CONGZHI,10000);
	 newgui.financing.fresh_panel_info(player);
end
function onTalklccz3(player)
	 player:set_param(const.PP_LICAI_CONGZHI,50000);
	 newgui.financing.fresh_panel_info(player);
end
function onTalklccz4(player)
	 player:set_param(const.PP_LICAI_CONGZHI,100000);
	 newgui.financing.fresh_panel_info(player);
end
function onTalklccz5(player)
	 player:set_param(const.PP_LICAI_CONGZHI,300000);
	 newgui.financing.fresh_panel_info(player);
end
function onTalklccz6(player)
	 player:set_param(const.PP_LICAI_CONGZHI,500000);
	 newgui.financing.fresh_panel_info(player);
end


function onTalkkqygfx(player)
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.info(10010,0,"远古废墟已经开启,各位勇士可从传送员处进入,打败大女皇萨麦尔及其部下获得奖励丰厚!");
	if server.get_temp_var("YGFX") == "" then
		server.set_temp_var("YGFX",1);
		local map = server.find_map("ygfx");
		if map:num_monster("大女皇萨麦尔") == 0 then
			map:mon_gen(63,76,"大女皇萨麦尔",1,0,1,1);
		end
		if map:num_monster("暴食领主") == 0 then
			map:mon_gen(26,137,"暴食领主",1,0,1,1);
		end
		if map:num_monster("噩梦领主") == 0 then
			map:mon_gen(101,130,"噩梦领主",1,0,1,1);
		end
		if map:num_monster("玄石领主") == 0 then
			map:mon_gen(98,22,"玄石领主",1,0,1,1);
		end
		if map:num_monster("克劳缪斯女爵") == 0 then
			map:mon_gen(33,23,"克劳缪斯女爵",1,0,1,1);
		end
	end
end


function onTalkgbygfx(player)
	if server.get_temp_var("YGFX") == "1" then
		server.info(10010,0,"远古废墟活动已经关闭,请耐心等待下次开启,感谢您的参与!");
		server.set_temp_var("YGFX","");
		server.server_exe("npc.dituyidong.move_ygfx");
	end
end


function onTalkkqbhdao(player)
	server.info(10010,0,"冰火岛活动已经开启,各位勇士可从传送员处进入冰火岛采集矿石,奖励丰厚哦!");
	if server.get_temp_var("BHDAO") == "" then
		server.set_temp_var("BHDAO",1);
	end
end


function onTalkgbbhdao(player)
	if server.get_temp_var("BHDAO") == "1" then
		server.info(10010,0,"冰火岛活动已经关闭,请耐心等待下次开启,感谢您的参与!");
		server.set_temp_var("BHDAO","");
		server.server_exe("npc.dituyidong.move_bhdao");
	end
end

function onTalki3(player) i(player); end

function onTalkczrkhf1(player)
	server.set_var("svrmegcza1","");
	server.set_var("svrmegczb1",499999);
	server.set_var("svrmegczc1","");
	gm.help2.svrmeg_Recharge_chuli();
	--newgui.hequ.fresh_hfRank_info(player);
	player:alert(11,1,"合服充值第一已重置!");
end
function onTalkczrkhf2(player)
	server.set_var("svrmegcza2","");
	server.set_var("svrmegczb2",299999);
	server.set_var("svrmegczc2","");
	gm.help2.svrmeg_Recharge_chuli();
	--newgui.hequ.fresh_hfRank_info(player);
	player:alert(11,1,"合服充值第二已重置!");
end
function onTalkczrkhf3(player)
	server.set_var("svrmegcza3","");
	server.set_var("svrmegczb3",99999);
	server.set_var("svrmegczc3","");
	gm.help2.svrmeg_Recharge_chuli();
	--newgui.hequ.fresh_hfRank_info(player);
	player:alert(11,1,"合服充值第三已重置!");
end

function onTalkxfrkhf1(player)
	server.set_var("hfxfpmsla1","");
	server.set_var("hfxfpmslb1",499999);
	server.set_var("hfxfpmslc1","");
	gm.hequ.hfxiaofeipm_Recharge_chuli();
	--newgui.hequ.fresh_xfRank_info(player);
	player:alert(11,1,"合服消费第一已重置!");
end
function onTalkxfrkhf2(player)
	server.set_var("hfxfpmsla2","");
	server.set_var("hfxfpmslb2",299999);
	server.set_var("hfxfpmslc2","");
	gm.hequ.hfxiaofeipm_Recharge_chuli();
	--newgui.hequ.fresh_xfRank_info(player);
	player:alert(11,1,"合服消费第二已重置!");
end
function onTalkxfrkhf3(player)
	server.set_var("hfxfpmsla3","");
	server.set_var("hfxfpmslb3",99999);
	server.set_var("hfxfpmslc3","");
	gm.hequ.hfxiaofeipm_Recharge_chuli();
	--newgui.hequ.fresh_xfRank_info(player);
	player:alert(11,1,"合服消费第三已重置!");
end

function onTalkhqkingno(player)
	server.set_var("lq_kgguild","");
	player:alert(11,1,"合区王城奖励未领取已设置!");
end

function onTalkhqkingye(player)
	server.set_var("lq_kgguild","已领取");
	player:alert(11,1,"合区王城奖励已领取已设置!");
end

function onTalkkqshuangbei(player)
	server.info(10010,0,"升级乐翻天活动已经开启,打怪经验增加1倍,活动时间为:1小时");
	server.set_exp_mul(2);
end

function onTalkgbshuangbei(player)
	server.info(10010,0,"升级乐翻天活动已经关闭,感谢各位玩家的参与");
	server.set_exp_mul(1);
end

function vip(player)
	ckpanel.tempVip(player);
end

function vipr(player)
	ckpanel.tempVipOver(player);
end

function xxx(player)
	if( player:get_job_name() == "warrior" ) then
			player:add_skill(107);
			player:set_skill_level(107,1);
			player:add_skill(109);
			player:set_skill_level(109,1);
	end
	if( player:get_job_name() == "wizard" ) then
			player:add_skill(416);
			player:set_skill_level(416,1);
			player:add_skill(417);
			player:set_skill_level(417,1);
	end
	if( player:get_job_name() == "taoist" ) then
			player:add_skill(514);
			player:set_skill_level(514,1);
			player:add_skill(518);
			player:set_skill_level(518,1);
	end
	player:set_param(const.PP_ACTIVITY_CZHI_LJ,5000000);
	player:set_param(const.PP_XUNBAOJIFEN,20000);
	player:set_param(const.PP_1309YUEMOCZTJ,5000000);
	player:set_param(const.PP_HF_CJ_NUM,1000);
	player:set_param(const.PP_GONGXUN,10000);
	npc.liguan.xiaofeitjpm_Recharge_process(player,100000);
	--newgui.hequ.hfxiaofeipm_Recharge_process(player,100000);
--	player:set_param(const.PP_LEIJICZJL,500000);
--	server.set_var("mzczpmtag",week()-1);
--	player:set_param(const.PP_MZCZPM_TAG,week()-1);
--	npc.liguan.player_mzczpm_congzi(player,100000);
--	print(util.ppn(player,const.PP_XIAOFEIYB));
--	player:set_param(const.PP_BFCZFL,util.ppn(player,const.PP_BFCZFL)+10000);
end

function onTalkcjdlfw(player)
	server.set_var("xqcjjl50",1000);
	server.set_var("xqcjjl60",500);
	server.set_var("xqcjjl65",100);
	server.set_var("xqcjjl70",30);
	server.set_var("xqcjjl75",5);
	server.set_var("xqcjjl80",3);
	player:alert(1,1,"成功复位冲级大礼!")
end
function m(player)
	player:echo("当前合区信息:");
	if is_merge_server() then
		player:echo("已合区"..(server_merge_day()+1).."天");
	else
		player:echo("未合区");
	end
	player:echo("\n<a href='event:talk_mergeSvrResetTime'>重设合区信息</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime1'>重设合区信息1</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime2'>重设合区信息2</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime3'>重设合区信息3</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime4'>重设合区信息4</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime5'>重设合区信息5</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime6'>重设合区信息6</a>");
	player:echo("\n<a href='event:talk_mergeSvrResetTime7'>重设合区信息7</a>");
end
function reset_server_merge(i)
	server.set_var("server_merge_tag",1);
	server.set_var("server_merge_time",tostring(os.time()-i*24*60*60));
	---
	server.set_var("set_check_merge","opened");
	server.set_var("merge_log_time",os.time());
	---
--    如果要测试领取,刷第六天的时候把这个注释打开不清理排名信息
	server.set_var("svrmegcza1","");
	server.set_var("svrmegczb1",499999);
	server.set_var("svrmegczc1","");
	server.set_var("svrmegcza2","");
	server.set_var("svrmegczb2",299999);
	server.set_var("svrmegczc2","");
	server.set_var("svrmegcza3","");
	server.set_var("svrmegczb3",99999);
	server.set_var("svrmegczc3","");
	server.set_var("svrmegcza4","");
	server.set_var("svrmegczb4",0);
	server.set_var("svrmegczc4","");
--
	server.set_var("hfxfpmsla1","");
	server.set_var("hfxfpmslb1",499999);
	server.set_var("hfxfpmslc1","");
	server.set_var("hfxfpmsla2","");
	server.set_var("hfxfpmslb2",299999);
	server.set_var("hfxfpmslc2","");
	server.set_var("hfxfpmsla3","");
	server.set_var("hfxfpmslb3",99999);
	server.set_var("hfxfpmslc3","");
	server.set_var("hfxfpmsla4","");
	server.set_var("hfxfpmslb4",0);
	server.set_var("hfxfpmslc4","");

	server.set_var("hold_guild",0);
	server.set_var("gotkg_day",0);
	server.set_var("king3name","");
	server.set_var("preking","");
	server.set_var("lq_kgguild","");

	--server.server_exe("newgui.hequ.reset_hfbianl");
--]]
end
function onTalkxuyuanchikq( player )
	server.set_temp_var("xuyuanchiopen","1");
end
function onTalkxuyuanchigb( player )
	server.set_temp_var("xuyuanchiopen","0");
end
function onTalkxuyuanchi( player )
	player:alert(11,1,"许愿池重置成功");

	--配合xuyuanchi.lua充值
	if server.get_var("resetxuyuanchi") == "3" then
		return;
	else
		server.set_var("resetxuyuanchi","3");
	end

	server.set_var("xuyuanchi_item_total",2000);
	server.set_var("xuyuanchi_item_now",0);
	server.set_var("xuyuanchi_item_cd_1",0);
	server.set_var("xuyuanchi_item_cd_2",0);
	server.set_var("xuyuanchi_item_cd_3",0);
	server.set_var("xuyuanchi_item_cd_4",0);
	server.set_var("xuyuanchi_item_cd_5",0);
	server.set_var("xuyuanchi_item_cd_6",0);
	server.set_var("xuyuanchi_item_cd_7",0);
	server.set_var("xuyuanchi_item_cd_8",0);
	server.set_var("xuyuanchi_item_cd_9",0);
	server.set_var("xuyuanchi_item_cd_10",0);
	server.set_var("xuyuanchi_item_cd_11",0);
	server.set_var("xuyuanchi_item_cd_12",0);
	server.set_var("xuyuanchi_item_cd_13",0);
	server.set_var("xuyuanchi_item_cd_14",0);
	server.set_var("xuyuanchi_item_cd_15",0);
	server.set_var("xuyuanchi_item_cd_16",0);
	server.set_var("xuyuanchi_item_cd_17",0);
	server.set_var("xuyuanchi_item_cd_18",0);
	server.set_var("xuyuanchi_item_cd_19",0);
	server.set_var("xuyuanchi_item_cd_20",0);

	server.set_var("xuyuanchi_item_remainder_0", 4);
	server.set_var("xuyuanchi_item_remainder_1", 1);
	server.set_var("xuyuanchi_item_remainder_2", 2);
	server.set_var("xuyuanchi_item_remainder_3", 2);
	server.set_var("xuyuanchi_item_remainder_4", 2);
	server.set_var("xuyuanchi_item_remainder_5", 2);
	server.set_var("xuyuanchi_item_remainder_6", 5);
	server.set_var("xuyuanchi_item_remainder_7", 5);
	server.set_var("xuyuanchi_item_remainder_8", 7);
	server.set_var("xuyuanchi_item_remainder_9", 7);
	server.set_var("xuyuanchi_item_remainder_10",7);
	server.set_var("xuyuanchi_item_remainder_11",10);
	server.set_var("xuyuanchi_item_remainder_12",10);
	server.set_var("xuyuanchi_item_remainder_13",10);
	server.set_var("xuyuanchi_item_remainder_14",210);
	server.set_var("xuyuanchi_item_remainder_15",210);
	server.set_var("xuyuanchi_item_remainder_16",210);
	server.set_var("xuyuanchi_item_remainder_17",300);
	server.set_var("xuyuanchi_item_remainder_18",300);
	server.set_var("xuyuanchi_item_remainder_19",300);
	server.set_var("xuyuanchi_item_remainder_20",400);
end
function onTalkmergeSvrcongzi(player)
	gm.help2.player_svrmeg_congzi(player,100);
	npc.huodong.Recharge_process2(player,100);
	i(player);
end
function onTalkmergeSvrResetTime(player)
	reset_server_merge(0);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime1(player)
	reset_server_merge(1);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime2(player)
	reset_server_merge(2);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime3(player)
	reset_server_merge(3);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime4(player)
	reset_server_merge(4);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime5(player)
	reset_server_merge(5);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime6(player)
	reset_server_merge(6);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime7(player)
	reset_server_merge(7);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end
function onTalkmergeSvrResetTime8(player)
	reset_server_merge2(0);
	player:alert(1,1,"合区信息已重置");
	--newgui.hequ.check_hfbtn_show(player);--刷新界面按钮
	newgui.newfu.check_newbtn_show(player);
	i(player);
end


function reset_server_merge2(i)
	server.set_var("server_merge_tag","");
	server.set_var("server_merge_time","");
	---
	server.set_var("merge_seed_day",0);
	---
--    如果要测试领取,刷第六天的时候把这个注释打开不清理排名信息
	server.set_var("svrmegcza1","");
	server.set_var("svrmegczb1",499999);
	server.set_var("svrmegczc1","");
	server.set_var("svrmegcza2","");
	server.set_var("svrmegczb2",299999);
	server.set_var("svrmegczc2","");
	server.set_var("svrmegcza3","");
	server.set_var("svrmegczb3",99999);
	server.set_var("svrmegczc3","");
	server.set_var("svrmegcza4","");
	server.set_var("svrmegczb4",0);
	server.set_var("svrmegczc4","");
--]]
end



function onTalkmrczpm1(player)
	server.set_var("mrczpma1","");
	server.set_var("mrczpmb1",99999);
	server.set_var("mrczpmc1","");
	player:alert(1,1,"成功初始化每日充值第一数据!");
	i(player);
end


function onTalkmrczpm2(player)
	server.set_var("mrczpma2","");
	server.set_var("mrczpmb2",49999);
	server.set_var("mrczpmc2","");
	player:alert(1,1,"成功初始化每日充值第二数据!");
	i(player);
end


function onTalkmrczpm3(player)
	server.set_var("mrczpma3","");
	server.set_var("mrczpmb3",0);
	server.set_var("mrczpmc3","");
	player:alert(1,1,"成功初始化每日充值第三数据!");
	i(player);
end
function onTalkmzczpm1(player)
	server.set_var("mzczpma1","");
	server.set_var("mzczpmb1",499999);
	server.set_var("mzczpmc1","");
	player:alert(1,1,"成功初始化每周充值第一数据!");
	i(player);
end


function onTalkmzczpm2(player)
	server.set_var("mzczpma2","");
	server.set_var("mzczpmb2",299999);
	server.set_var("mzczpmc2","");
	player:alert(1,1,"成功初始化每周充值第二数据!");
	i(player);
end


function onTalkmzczpm3(player)
	server.set_var("mzczpma3","");
	server.set_var("mzczpmb3",99999);
	server.set_var("mzczpmc3","");
	player:alert(1,1,"成功初始化每周充值第三数据!");
	i(player);
end


function onTalkxqczpm1(player)
	server.set_var("xqczpma1","");
	server.set_var("xqczpmb1",499999);
	server.set_var("xqczpmc1","");
	player:alert(1,1,"成功初始化七天充值第一数据!");
	i(player);
end


function onTalkxqczpm2(player)
	server.set_var("xqczpma2","");
	server.set_var("xqczpmb2",299999);
	server.set_var("xqczpmc2","");
	player:alert(1,1,"成功初始化七天充值第二数据!");
	i(player);
end


function onTalkxqczpm3(player)
	server.set_var("xqczpma3","");
	server.set_var("xqczpmb3",99999);
	server.set_var("xqczpmc3","");
	player:alert(1,1,"成功初始化七天充值第三数据!");
	i(player);
end

function onTalkymsykq(player)
	server.set_temp_var("ymsy",1);
	server.info(10010,0,"[幽冥圣域]已经开放,想要获取神级装备的可从传送员进入挑战!!");
end

function onTalkymsygb(player)
	if server.get_temp_var("ymsy") == "1" then
		server.set_temp_var("ymsy",0);
		server.info(10000,0,"[幽冥圣域]已经关闭,请耐心等待下次开启!");
	end
end

function onTalkgmqlsd(player)
	local map1 = server.find_map("qlsd");
	if tonumber(server_start_day()) >= 1 then
		if map1:num_monster("麒麟圣兽") == 0 and map1:num_monster("麒麟圣兽10") == 0 then
			map1:mon_gen(31,40,"麒麟圣兽",1,0,1,1,"no_owner");
		end
	else
		if map1:num_monster("麒麟圣兽") == 0 and map1:num_monster("麒麟圣兽10") == 0 then
			map1:mon_gen(31,40,"麒麟圣兽10",1,0,1,1,"no_owner");
		end
	end
	server.set_temp_var("qlsd",1);
	server.info(10000,0,"[麒麟圣兽]出现在[麒麟圣殿]!勇士们快从传送员处进入[麒麟圣殿]吧!");
	server.info(10,0,"[<font color='#ff0000'>麒麟圣兽</font>]出现在[<font color='#ff0000'>麒麟圣殿</font>]!勇士们快从传送员处进入[<font color='#ff0000'>麒麟圣殿</font>]吧!");
	server.server_exe("npc.dituyidong.move_qilingdian");
end


function onTalkqlsdgb(player)
	server.set_temp_var("qlsd",0);
end

function onTalkxqboss(player)
		local map = server.find_map("v005");
		map:clear_mon();
		if map:num_monster("地魔兽") == 0 then
			map:mon_gen(40,70,"地魔兽",1,1,1,1,"no_owner");
		end
		map:mon_gen(40,70,"奴玛教皇",1,100,1,1);
		map:mon_gen(40,70,"变异蛇蝎王",1,100,1,1);
		map:mon_gen(40,70,"猛犸教皇",1,100,1,1);
		map:mon_gen(40,70,"牛魔圣君",1,100,1,1);
		map:mon_gen(40,70,"妖月金刚",4,100,10,1);
		map:mon_gen(40,70,"妖月血魔",4,100,10,1);
		map:mon_gen(40,70,"蛮牛王",4,100,10,1);
		map:mon_gen(40,70,"巨灵勇士",30,100,10,1);
		map:mon_gen(40,70,"巨灵战士",30,100,10,1);
		map:mon_gen(40,70,"巨灵战斧",30,100,10,1);
		map:mon_gen(40,70,"巨灵守卫",30,100,10,1);
		server.info(10010,0,"[王城]正遭受[地魔兽]所带领的魔界大军入侵,消灭[地魔兽]将会100%掉落传说的[骠骑将军护腕]!");
		server.server_exe("npc.dituyidong.move_kingcity1");
end

function cgfb(player)
	player:set_guild_param("fubenday",0);
	player:set_guild_param("fubenopen","");
	player:set_param(const.PP_GUILD_FUBEN_ENTER_NUM,0);
end

function onTalkclear(player)
	player:sub_gamemoney(player:get_gamemoney());
	player:sub_vcoin(player:get_vcoin());
	player:sub_vcoin_bind(player:get_vcoin_bind());
	player:danger_clear_item();
end


function onTalkkqmijingjy(player)
	 local exp_data = {"mijing40","mijing50","mijing60","mijing70","mijing80","mijing90","mijing100"}
	for i=1,#exp_data do
	local map = server.find_map(exp_data[i]);
	   if map then
	       map:set_exp_mul(120);
	   end
	end
	if server.get_temp_var("mijing") == "" then
		server.set_temp_var("mijing",1);
		server.info(10010,0,"练级场地图[1.2倍经验]已经开启,现在进入可获得更多经验!");
	end
end


function onTalkgbmijingjy(player)
	 local exp_data = {"mijing40","mijing50","mijing60","mijing70","mijing80","mijing90","mijing100"}
	for i=1,#exp_data do
	local map = server.find_map(exp_data[i]);
	   if map then
	       map:set_exp_mul(100);
	   end
	end
	if server.get_temp_var("mijing") == "1" then
		server.info(10010,0,"练级场地图[1.2倍经验]已经关闭,感谢您的参与!");
		server.set_exp_mul(1);
		server.set_temp_var("mijing","");
	end
end

function onTalkkqwenquan(player)
	if tonumber(server_start_day()) >= 1 then
		server.info(10010,0,"云霄城的[温泉馆]已经开张啦!快去泡温泉吧!不仅对身体好,还能获得大量经验哦!");
		if server.get_temp_var("wenquan") == "" then
			server.set_temp_var("wenquan",1);
		end
	end
end


function onTalkgbwenquan(player)
	if server.get_temp_var("wenquan") == "1" then
		server.info(10010,0,"[温泉馆]的歇业时间已经到了!请大家下次再来吧!");
		server.set_temp_var("wenquan","");
	end
end

function onTalkgwgc1(player)
	if server_start_day() >= 1 then
		local map = server.find_map("v005");
		map:clear_mon();
		if map:num_monster("巨灵天魔") == 0 then
			map:mon_gen(40,75,"巨灵天魔",1,100,1,1);
		end
		map:mon_gen(40,75,"奴玛教皇",1,100,1,1);
		map:mon_gen(40,75,"变异蛇蝎王",1,100,1,1);
		map:mon_gen(40,75,"猛犸教皇",1,100,1,1);
		map:mon_gen(40,75,"牛魔圣君",1,100,1,1);
		map:mon_gen(40,75,"妖月金刚",4,100,10,1);
		map:mon_gen(40,75,"妖月血魔",4,100,10,1);
		map:mon_gen(40,75,"蛮牛王",4,100,10,1);
		map:mon_gen(40,75,"巨灵勇士",30,100,10,1);
		map:mon_gen(40,75,"巨灵战士",30,100,10,1);
		map:mon_gen(40,75,"巨灵战斧",30,100,10,1);
		map:mon_gen(40,75,"巨灵守卫",30,100,10,1);
		server.info(10010,0,"[王城]正遭受[巨灵天魔]所带领的魔界大军入侵,勇士们快快前往王城抵挡!");
	end
end


function onTalkgwgc2(player)
	if server_start_day() >= 1 then
		local map = server.find_map("v005");
		map:clear_mon();
		if map:num_monster("混沌魔君") == 0 then
			map:mon_gen(40,75,"混沌魔君",1,100,1,1);
		end
		map:mon_gen(40,75,"奴玛教皇",1,100,1,1);
		map:mon_gen(40,75,"变异蛇蝎王",1,100,1,1);
		map:mon_gen(40,75,"猛犸教皇",1,100,1,1);
		map:mon_gen(40,75,"牛魔圣君",1,100,1,1);
		map:mon_gen(40,75,"妖月金刚",4,100,10,1);
		map:mon_gen(40,75,"妖月血魔",4,100,10,1);
		map:mon_gen(40,75,"蛮牛王",4,100,10,1);
		map:mon_gen(40,75,"混沌斗士",30,100,10,1);
		map:mon_gen(40,75,"混沌侍卫",30,100,10,1);
		map:mon_gen(40,75,"混沌将军",30,100,10,1);
		map:mon_gen(40,75,"混沌祭司",30,100,10,1);
		server.info(10010,0,"[王城]正遭受[混沌魔君]所带领的魔界大军入侵,勇士们快快前往王城抵挡!");
	end
end


function onTalksqjf(player)
	local map = server.find_map("sqbg");
	if map:num_monster("天魔兽") == 0 then
		map:mon_gen(31,40,"天魔兽",1,0,1,1);
		server.info(10010,0,"上古魔兽[天魔兽]出现在[神器宝阁],从土城[神器使者]进入挑战可获得神器积分");
	else
		server.info(10010,0,"上古魔兽[天魔兽]出现在[神器宝阁],从土城[神器使者]进入挑战可获得神器积分");
	end
	server.server_exe("npc.dituyidong.move_sqbg");
end

function mount(player)
	player:set_mount_info(1,101,130002);
	player:set_mount_show(0);
	player:set_mount_show(1);
	player:set_mount_show_lock(1);
	player:set_timer(const.PT_UMOUNT,1000*120);
end
function mount2(player)
	player:set_mount_info(1,201,130002);
	player:set_mount_show(0);
	player:set_mount_show(1);
	player:set_mount_show_lock(1);
	player:set_timer(const.PT_UMOUNT,1000*120);
end
function mount3(player)
	local i = math.random(1,3);
	if i == 1 then
		player:set_mount_info(1,1001,130002);
	end
	if i == 2 then
		player:set_mount_info(1,101,130002);
	end
	if i == 3 then
		player:set_mount_info(1,2001,130002);
	end
	player:set_mount_show(0);
	player:set_mount_show(1);
	if player:get_level() <= 20 then
	player:set_mount_show_lock(1);
	player:alert(10,1,"<font color='#ff0000'>获得坐骑体验状态!(180秒)</font>");
	end
	player:set_timer(const.PT_UMOUNT,1000*180);
end
function mount4(player)
	player:set_mount_info(1,2011,130002);
	player:set_mount_show(0);
	player:set_mount_show(1);
	player:set_mount_show_lock(1);
	player:set_timer(const.PT_UMOUNT,1000*180);
end
function mount5(player)
	player:set_mount_info(1,2012,130002);
	player:set_mount_show(0);
	player:set_mount_show(1);
	player:set_mount_show_lock(1);
end
function unmount(player)
	player:set_mount_show_lock(0);
	player:set_mount_info(0,0,0);
	player:set_mount_show(0);
	player:set_timer(const.PT_UMOUNT,0);
end
function cloth(player)
	player:set_avatar(1,2010,0);
end
function uncloth(player)
	player:set_avatar(0,0,0);
end
function dazuo(player)
	player:doaction(8,"gm.gm.dazuoend");
end
function dazuoend(player)
	player:alert(11,1,"打坐结束了");
end
function caikuang(player)
	player:doaction(9,"gm.gm.caikuangend");
end
function caikuangend(player)
	player:alert(11,1,"采矿结束了");
end

function onTalktmd1(player)
	if server_start_day() >= 1 then
		local map1 = server.find_map("tmda");
			map1:clear_mon();
		local map2 = server.find_map("tmdb");
			map2:clear_mon();
		server.set_temp_var("tmd",1);
		server.info(10010,0,"[天魔殿]的入口已经打开,各位勇士可在[传送员]处进入[天魔殿]!入口将在10分钟后关闭!");
	end
end


function onTalktmd2(player)
	if server.get_temp_var("tmd") == "1" then
		server.set_temp_var("tmd",2);
		local map1 = server.find_map("tmda");
		local map2 = server.find_map("tmdb");
			map1:mon_gen(45,55,"天魔殿统领1",1,0,1,1,"no_owner");
			map2:mon_gen(45,55,"天魔殿统领2",1,0,1,1,"no_owner");
			server.info(10010,0,"[天魔殿]入口已经关闭,[天魔殿统领]已经出现!打败他即可进入[天魔殿]挑战[无相天魔]!");
	end
end


function onTalktmdboss(player)
	if server.get_temp_var("tmd") == "2" then
		local map2 = server.find_map("tmdc");
		map2:mon_gen(45,55,"无相天魔",1,0,1,1);
		server.info(10010,0,"[无相天魔]已经出现在[天魔殿],打败他就有机会获取顶级神兵,神级套装和鸿天混元盔哦!");
	end
end

function onTalktmd3(player)
	if server.get_temp_var("tmd") == "2" then
		local map1 = server.find_map("tmda");
		local map2 = server.find_map("tmdb");
		local map3 = server.find_map("tmdc");
			map1:map_exe("npc.tmd.onTalktctmd");
			map2:map_exe("npc.tmd.onTalktctmd");
			map3:map_exe("npc.tmd.onTalktctmd");
			server.set_temp_var("tmd",0);
			server.info(10010,0,"[勇闯天魔殿]的活动已经结束,感谢各位勇士的参与!");
	end
end



function onTalkkqswjd(player)
	server.set_temp_var("swjd",1);
	server.info(10010,0,"[死亡禁地之门]已经打开,想要获取神级装备的可从传送员进入挑战!!");
end


function onTalkswjdsx(player)
	local map2 = server.find_map("swjd1");
	if map2:num_monster("牛魔圣君") == 0 then
		map2:mon_gen(93,99,"牛魔圣君",1,0,1,1);
	end
	if map2:num_monster("邪龙神") == 0 then
		map2:mon_gen(112,214,"邪龙神",1,0,1,1);
	end
	if map2:num_monster("猛犸教皇") == 0 then
		map2:mon_gen(206,116,"猛犸教皇",1,0,1,1);
	end
	local map1 = server.find_map("swjd2");
		if map1:num_monster("武威战神") == 0 then
			map1:mon_gen(97,100,"武威战神",1,0,1,1);
		end
		if map1:num_monster("烈焰法神") == 0 then
			map1:mon_gen(106,216,"烈焰法神",1,0,1,1);
		end
		if map1:num_monster("无极天尊") == 0 then
			map1:mon_gen(207,112,"无极天尊",1,0,1,1);
		end
	local map = server.find_map("swjd3");
	if map:num_monster("巨灵天魔") == 0 then
		map:mon_gen(106,96,"巨灵天魔",1,0,1,1);
	end
	if map:num_monster("禁地魔王") == 0 then
		map:mon_gen(55,44,"禁地魔王",1,0,1,1);
	end
	server.info(10,0,"[<font color='#ff0000'>禁地魔王</font>]出现在[死亡禁地]!");
end

function onTalkgbswjd(player)
	if server.get_temp_var("swjd") == "1" then
		server.set_temp_var("swjd",0);
		server.info(10010,0,"[死亡禁地之门]已经关闭,请耐心等待下次开启!");
	end
end

function onTalksmzckq(player)
	local map = server.find_map("smzc");
	map:clear_mon();
	server.set_temp_var("smzc",1);
	server.set_temp_var("szzy",0);
	server.set_temp_var("mzzy",0);
	server.set_var("zhanchangmvp","");
	server.set_var("smzcpma1","");
	server.set_var("smzcpmb1",0);
	server.set_var("smzcpmc1","");
	server.set_var("smzcpma2","");
	server.set_var("smzcpmb2",0);
	server.set_var("smzcpmc2","");
	server.set_var("smzcpma3","");
	server.set_var("smzcpmb3",0);
	server.set_var("smzcpmc3","");
	server.info(10010,0,"神魔战场已经开启,40级以上勇士可从土城进入[神魔战场]!");
	map:map_exe("npc.zhanchang.onTalktuichu");
end


function onTalksmzcboss(player)
	if server.get_temp_var("smzc") == "1" then
	local map1 = server.find_map("smzc");
		if map1:num_monster("修罗王") == 0 then
			map1:mon_gen(69,70,"修罗王",1,0,1,1,"no_owner");
		end
		server.info(10010,0,"上古邪神[修罗王]出现在神魔战场,勇士们获取神装的机会来了!!");
	end
end

function onTalksmzcgb(player)
	local ydzy = server.get_temp_var("szzy");
	local hdzy = server.get_temp_var("mzzy");
	if ydzy == nil or ydzy == "" then
		ydzy = 0;
	else
		ydzy = tonumber(ydzy);
	end
	if hdzy == nil or hdzy == "" then
		hdzy = 0;
	else
		hdzy = tonumber(hdzy);
	end
	if server.get_temp_var("smzc") == "1" then
		local map = server.find_map("smzc");
		if ydzy == hdzy then
			server.set_temp_var("smzc",0);
			server.info(10010,0,"神魔战场已经结束,本次战场以平局告终!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.zhanchang.onTalkping");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy >= hdzy then
			server.set_temp_var("smzc",0);
			server.info(10010,0,"神魔战场已经结束,[神族阵营]取得了胜利!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.zhanchang.onTalkshenzu");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy <= hdzy then
			server.set_temp_var("smzc",0);
			server.info(10010,0,"神魔战场已经结束,[魔族阵营]取得了胜利!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.zhanchang.onTalkmozu");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
	end
end

function onTalkxtjzckq(player)
	local map = server.find_map("tjzc");
	server.set_temp_var("tjzc",1);
	server.set_temp_var("szzy",0);
	server.set_temp_var("mzzy",0);
	--server.set_var("zcreset",util.svn("zcreset")+1);
	server.set_var("zhanchangmvp","");
	server.set_var("smzcpma1","");
	server.set_var("smzcpmb1",0);
	server.set_var("smzcpmc1","");
	server.set_var("smzcpma2","");
	server.set_var("smzcpmb2",0);
	server.set_var("smzcpmc2","");
	server.set_var("smzcpma3","");
	server.set_var("smzcpmb3",0);
	server.set_var("smzcpmc3","");

	server.set_var("numberred",0);
	server.set_var("numberblue",0);

	server.set_var("server_tj_timer",tostring(os.time()));
	server.info(10010,0,"天晶战场已经开启,70级以上勇士可从土城进入[天晶战场]!");
	map:map_exe("npc.zhanchang.onTalktuichu");
end

function setRandName(player,team)
	if team == 1 then
		local tx = util.svn("numberred")+1;
		server.set_var("numberred",tx);
		player:set_name_plus("红方"..tx);
	end
	if team == 2 then
		local tx = util.svn("numberblue")+1;
		server.set_var("numberblue",tx);
		player:set_name_plus("蓝方"..tx);
	end
end

function onTalkjrxtjzc(npc,player)
	if player:get_dart_task_flag() == 1 and util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then
		player:alert(1,1,"请先将现在这趟镖走完再进入战场吧!");return;
	end
	if server.get_temp_var("tjzc") == "1" then
	if player:get_level() >= 70 then
		local m=server.find_map("tjzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 1 then
				if m:num_team_member(1)- m:num_team_member(2) >= 5 then
					player:alert(1,1,"对不起,红方阵营人数过多,请稍后再加入!");
				else
					player:set_team_info(1,"红方阵营");
					player:enter_map("tjzc",107,29);
					player:alert(1,1,"恭喜您成功加入红方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00ff'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
			if util.ppn(player,const.PP_SMZCZHENY) == 2 then
				if m:num_team_member(2) - m:num_team_member(1) >= 5 then
					player:alert(1,1,"对不起,蓝方阵营人数过多,请稍后再加入!");
				else
					player:set_team_info(2,"蓝方阵营");
					player:enter_map("tjzc",17,150);
					player:alert(1,1,"恭喜您成功加入蓝方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
		else
		if m:num_team_member(2) >= m:num_team_member(1) then
			if m:num_team_member(2) == m:num_team_member(1) then
				local sj = math.random(1,2);
				if sj == 1 then
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,1);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(1,"红方阵营");
					setRandName(player,1);
					player:enter_map("tjzc",107,29);
					player:alert(1,1,"恭喜您成功加入红方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				else
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,2);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(2,"蓝方阵营");
					setRandName(player,2);
					player:enter_map("tjzc",17,150);
					player:alert(1,1,"恭喜您成功加入蓝方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,1);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
				player:set_team_info(1,"红方阵营");
				setRandName(player,1);
				player:enter_map("tjzc",107,29);
				player:alert(1,1,"恭喜您成功加入红方阵营");
				--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
			end
		else
		player:set_param(const.PP_SMZCHOUR,hour());
		player:set_param(const.PP_SMZCZHENY,2);
		player:set_param(const.PP_SMZCKILL,0);
		player:set_param(const.PP_SMZCJIFEN,0);
		player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
		player:set_team_info(2,"蓝方阵营");
		setRandName(player,2);
		player:enter_map("tjzc",17,150);
		player:alert(1,1,"恭喜您成功加入蓝方阵营");
		--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
		end
	end
	else
		player:alert(1,1,"对不起,您的等级不足70级,无法进入!");
	end
	else
	player:alert(1,1,"对不起,天晶战场没有开启,暂时无法进入!");
	end
end

function onTalkxxtjzcgb(player)
	local ydzy = server.get_temp_var("szzy");
	local hdzy = server.get_temp_var("mzzy");
	if ydzy == nil or ydzy == "" then
		ydzy = 0;
	else
		ydzy = tonumber(ydzy);
	end
	if hdzy == nil or hdzy == "" then
		hdzy = 0;
	else
		hdzy = tonumber(hdzy);
	end
	if server.get_temp_var("tjzc") == "1" then
		local map = server.find_map("tjzc");
		if ydzy == hdzy then
			server.set_temp_var("tjzc",0);
			server.info(10010,0,"天晶战场已经结束,本次战场以平局告终!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.tjkuang.EndPing");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy >= hdzy then
			server.set_temp_var("tjzc",0);
			server.info(10010,0,"天晶战场已经结束,[红方阵营]取得了胜利!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.tjkuang.EndHong");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy <= hdzy then
			server.set_temp_var("tjzc",0);
			server.info(10010,0,"天晶战场已经结束,[蓝方阵营]取得了胜利!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.tjkuang.EndLan");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
	end
end


function onTalkwlzbgg(player)
	if server_start_day() >= 1 then
			server.server_exe("npc.renwu.wlzb.wlmzontime");
			server.set_var("wlmz","");
			server.info(10000,0,"[武林争霸]报名已经开始,各位勇士可以从土城[武林争霸使者]处报名进入!参加活动可获得丰厚奖励哦!");
			server.info(10,0,"<font color='#ff0000'>武林争霸入口开启,10分钟后关闭!</font>");
			local map = server.find_map("wlzb");
			map:set_flag_pkprohibit(1);
			server.set_temp_var("wlzb",1);
			server.server_exe("npc.dituyidong.move_wlzb");
	else
		server.info(10010,0,"武林争霸将于开区1天后的每天(13:00)举行,请各位勇士互相转告!");
	end	
end
	


function onTalkwlzbkq(player)
	if server.get_temp_var("wlzb") == "1" then
		server.server_exe("npc.renwu.wlzb.wlzbjiangli");
		server.set_var("wlmz","");
		server.info(10,0,"<font color='#ff0000'>武林争霸赛已经开始,入口关闭!</font>");
		server.info(10000,0,"武林争霸现在开始,让我们期待新一任的武林盟主诞生吧!");
		local map = server.find_map("wlzb");
		map:set_flag_pkprohibit(0);
		server.set_temp_var("wlzb",2);
	end
end


function onTalkwlzbgb(player)
	if server.get_temp_var("wlzb") == "2" then
		server.set_temp_var("wlzb",0);
		local map = server.find_map("wlzb");
		map:map_exe("npc.renwu.wlzb.cwlmz");
	end
end

function x(player)
	if player:get_gm_level() >= 100 then
		player:set_status(16,1,10000,1,0);
		player:set_status(15,1,10000,1,0);
	end
end
function f(player)
player:set_free_direct_fly(200);
end


function c(player)
	for i=20001,20003,1 do
		player:add_item_log(i,210,1);
	end
	for i=20100,20107,1 do
		player:add_item_log(i,210,1);
	end
	for i=20200,20206,1 do
		player:add_item_log(i,210,1);
	end
	for i=20300,20306,1 do
		player:add_item_log(i,210,1);
	end
	for i=20400,20424,1 do
		player:add_item_log(i,210,1);
	end
end
function v(player)
	for i=30001,30013,1 do
		player:add_item_log(i,210,1);
	end
end
function b(player)
	for i=35001,35013,1 do
		player:add_item_log(i,210,1);
	end
end

function z(player)
	player:danger_clear_item();
end


function onTalkkqsj(player)
	server.set_var("server_start_time",tostring(os.time()));
	player:alert(1,1,"开区时间已被初始化为1!")
end


function onTalkkqsj2(player)
	server.set_var("server_start_time",tostring(os.time())-1*24*60*60);
	player:alert(1,1,"开区时间已被初始化为2!")
end


function onTalkkqsj3(player)
	server.set_var("server_start_time",tostring(os.time())-2*24*60*60);
	player:alert(1,1,"开区时间已被初始化为3!")
end


function onTalkkqsj4(player)
	server.set_var("server_start_time",tostring(os.time())-3*24*60*60);
	player:alert(1,1,"开区时间已被初始化为4!")
end


function onTalkkqsj5(player)
	server.set_var("server_start_time",tostring(os.time())-4*24*60*60);
	player:alert(1,1,"开区时间已被初始化为5!")
end


function onTalkkqsj6(player)
	server.set_var("server_start_time",tostring(os.time())-5*24*60*60);
	player:alert(1,1,"开区时间已被初始化为6!")
end


function onTalkkqsj7(player)
	server.set_var("server_start_time",tostring(os.time())-6*24*60*60);
	player:alert(1,1,"开区时间已被初始化为7!")
end
function onTalkkqsjjia(player)
	server.set_var("server_start_time",tostring(os.time())-(server_start_day()+1)*24*60*60);
	player:alert(1,1,"开区时间已+1,当前开区时间："..server_start_day()+1);
	i(player);
end
function onTalkkqsjjian(player)
	if server_start_day() == 0 then
		player:alert(1,1,"当前已经是开区第一天！");i(player);return;
	end
	server.set_var("server_start_time",tostring(os.time())-(server_start_day()-1)*24*60*60);
	player:alert(1,1,"开区时间已-1,当前开区时间："..server_start_day()+1);
	i(player);
end

function onTalkshouwei(player)
	player:set_param(const.PP_FML_NUM,1);
end

function wing(player)
	player:set_wing_info(1,1111,0);
end
function wing2(player)
	player:set_wing_info(1,1112,0);
end
function wing3(player)
	player:set_wing_info(1,1113,0);
end
function wing4(player)
	player:set_wing_info(1,2111,0);
end
function wing5(player)
	player:set_wing_info(1,2112,0);
end
function wing6(player)
	player:set_wing_info(1,2113,0);
end
function wing7(player)
	player:set_wing_info(1,3111,0);
end
function wing8(player)
	player:set_wing_info(1,3112,0);
end
function wing9(player)
	player:set_wing_info(1,3113,0);
end
function wing9(player)
	player:set_wing_info(1,4113,0);
end
function unwing(player)
	player:set_wing_info(0,0,0);
end


function onTalkduobao(player)
	player:set_panel_data("panelminimapfun","btnduobao","visible","true");
	player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
	server.set_temp_var("duobaoqibing",1);
end
function onTalkduobaopaihang(player)
	server.set_temp_var("duobaoqibingpaihang",1);
end

function onTalkTest(player)
	player:add_item("一级宝石",10,1);
	player:add_item("二级宝石",10,1);
	player:add_item("三级宝石",10,1);
	player:add_item("四级宝石",10,1);
	player:add_item("五级宝石",10,1);
	player:add_item("六级宝石",10,1);
	player:add_item("七级宝石",10,1);
	player:add_item("八级宝石",10,1);
	
	player:add_item("金币",999999999,1);
	player:add_item("绑定金币",999999999,1);	
	player:add_item("元宝",999999999,1);
	player:add_item("绑定元宝",999999999,1);
	player:add_item("至尊屠龙刀",1,1);
	player:add_item("至尊屠龙甲",1,1);
	player:add_item("凌云头盔·武威",1,1);
	player:add_item("凌云项链·武威",1,1);
	player:add_item("凌云护腕·武威",1,1);
	player:add_item("凌云护腕·武威",1,1);

	player:add_item("凌云头盔·烈焰",1,1);
	player:add_item("凌云项链·烈焰",1,1);
	player:add_item("凌云护腕·烈焰",1,1);
	player:add_item("凌云护腕·烈焰",1,1);

	player:add_item("凌云头盔·无极",1,1);
	player:add_item("凌云项链·无极",1,1);
	player:add_item("凌云护腕·无极",1,1);
	player:add_item("凌云护腕·无极",1,1);
	player:add_item("装备灵魂石(1000)",10,1);
	player:add_item("十二级攻击玄晶",10,1);
	player:add_item("镇魔令大包",20,1);
	player:set_level(100);
end

