module(..., package.seeall)
-------------------------------------------------------------------------------
HUODONG_BIAOSHI = 132;--活动标示，每次做活动+3 光棍节活动 Day14th 20141201-20161205
FLSD_BIAOSHI=3;			--充值返利
ACT_COUNT_SHENMOZHANCHANG=105;  -- 神魔战场 ok 19:00-19:30


function isLastActivityOpen()
	if ymd() >= 20150319 and ymd() <= 20160325 then  
		return 129
	else
		return 132
	end
end

function isXinChunQifu()
	if ymd() >= 20140128 and ymd() <= 20160129 then
		return true;
	end
	if server.get_temp_var("xinchunqf") == "1" then
		return true;
	end
	return false;
end

function isNewYearOpen()
	if ymd() >= 20150319 and ymd() <= 20160325 then
		return true;
	end
	if server.get_temp_var("newyearflag") == "1" then
		return true;
	end
	return false;
end

function isDay14Open()
	if ymd() >= 20150313 and ymd() <= 20160318 then
		return true;
	end
	if server.get_temp_var("newyearflag") == "1" then
		return true;
	end
	return false;
end

function isBaifuSjieOpen()
	if ymd() >= 20141006 and ymd() <= 20161012 then
		return true;
	end
	if server.get_temp_var("activityopen") == "1" then
		return true;
	end
	return false;
end

function isShenqisjOpen()--神器升级盛典
	if ymd() >= 20150301 and ymd() <= 20160306 then
		return true;
	end
	if server.get_temp_var("Shenqisj") == "1" then
		return true;
	end
	return false;
end

function isXuanJingHeChengOpen()
	if ymd() >= 20150319 and ymd() <= 20160325 then
		return true;
	end
	if server.get_temp_var("XuanJingHeCheng") == "1" then
		return true;
	end
	return false;
end

function isDoubleZhuanSheng()		--双倍转生几率
	if ymd() >= 20140605 and ymd() <= 20160611 then
		return true;
	end
	if server.get_temp_var("DoubleZhuanSheng") == "1" then
		return true;
	end
	return false;
end

function isHuiKuiLiBaoOpen(szActivity)		--50级超值回馈礼包
	if szActivity == "Day14th" and ymd() >= 20150313 and ymd() <= 20160318 then		--立冬活动
		return true;
	end
	if szActivity == "NewYear" and ymd() >= 20150319 and ymd() <= 20160325 then		--春节活动
		return true;
	end
	if szActivity == "XiaZhi" and ymd() >= 20140908 and ymd() <= 20160914 then		--中秋活动
		return true;
	end	
	if server.get_temp_var("HuiKuiLiBao") == "1" then
		return true;
	end
	return false;
end

function isCZXFHLOpen(szActivity)		--分段充值/消费豪礼
	--print(szActivity);
	if szActivity == "Day14th" and ymd() >= 20150313 and ymd() <= 20160318 then		--闰九活动
		return true;
	end
	if szActivity == "NewYear" and ymd() >= 20150319 and ymd() <= 20160325 then		--春节活动
		return true;
	end
	if szActivity == "XiaZhi" and ymd() >= 20150319 and ymd() <= 20160425 then		--万圣节活动
		return true;
	end
	if szActivity == "MoZuBaoKu" and ymd() >= 20141013 and ymd() <= 20161019 then	--魔族宝库活动
		return true;
	end
	if server.get_temp_var("FenDuanCZXFHL") == "1" then
		return true;
	end
	return false;
end

function isMRCZFLOpen(szActivity)		--活动每日充值返利
	--print(szActivity);
	if szActivity == "Day14th" and ymd() >= 20150313 and ymd() <= 20160318 then		--月中活动
		return true;
	end
	if szActivity == "NewYear" and ymd() >= 20150319 and ymd() <= 20160325 then		--月中活动
		return true;
	end
	if szActivity == "XiaZhi" and ymd() >= 20141026 and ymd() <= 20161031 then		--月末活动
		return true;
	end	
	if szActivity == "linghun" and ymd() >= 20150120 and ymd() <= 20160125 then		--冬季活动
		return true;
	end	
	if szActivity == "qbt" and ymd() >= 20141111 and ymd() <= 20161117 then		--立冬活动
		return true;
	end	
	if server.get_temp_var("MeiRiChongZhiFanLi") == "1" then
		return true;
	end
	return false;
end

function isShiZhuangDHOpen(szActivity)		--活动时装兑换
	if ymd() >= 20141026 and ymd() <= 20141031 then		--ChinaJoy
		return true;
	end	
	if server.get_temp_var("ShiZhuangDuiHuan") == "1" then
		return true;
	end
	return false;
end

function isJingYanDanOpen(szActivity)		--活动经验珠超值抢购
	if szActivity == "Day14th" and ymd() >= 20150313 and ymd() <= 20160318 then		--闰九活动
		return true;
	end
	if szActivity == "NewYear" and ymd() >= 20150319 and ymd() <= 20160325 then		--月中活动
		return true;
	end
	if server.get_temp_var("JingYanDan") == "1" then
		return true;
	end
	return false;
end

function isCWJingYanDanOpen(szActivity)		--活动经验珠超值抢购
	if szActivity == "Day14th" and ymd() >= 20150313 and ymd() <= 20160318 then		--闰九活动
		return true;
	end
	if szActivity == "NewYear" and ymd() >= 20150319 and ymd() <= 20160325 then		--月中活动
		return true;
	end
	if server.get_temp_var("CWJingYanDan") == "1" then
		return true;
	end
	return false;
end

function isYuPeiJinJieLBOpen()		--活动 玉佩升级豪礼
	if ymd() >= 20150201 and ymd() <= 20160207 then		--闰九活动
		return true;
	end
	if server.get_temp_var("YuPeiHuiKui") == "1" then
		return true;
	end
	return false;
end

function isLinhunJinJieLBOpen()
	if ymd() >= 20150307 and ymd() <= 20160312 then		--闰九活动
		return true;
	end
	if server.get_temp_var("LinhunHuiKui") == "1" then
		return true;
	end
	return false;
end

function isActChongZhiLeiJi()		--脚本活动期间充值累计
	if ymd() >= 20141212 and ymd() <= 20161217 then		--国庆活动
		return true;
	end
	if server.get_temp_var("ActChongZhiLeiJi") == "1" then
		return true;
	end
	return false;
end

function isXunBaoFanLiOpen()		--寻宝积分兑换道具
	if ymd() >= 20141020 and ymd() <= 20161025 then		--百服活动
		return true;
	end
	if server.get_temp_var("XunBaoFanLi") == "1" then
		return true;
	end
	return false;
end

function isShouLingDaZhe()		--兽灵进阶优惠
	if ymd() >= 20150307 and ymd() <= 20160309 then		--中秋活动
		return true;
	end
	if server.get_temp_var("ShouLingJinJie") == "1" then
		return true;
	end
	return false;
end
function TianmingTHOpen()
	if ymd() >= 20150225 and ymd() <= 20160228 then		--冬季活动
		return true;
	end
	if server.get_temp_var("TianmingTH") == "1" then
		return true;
	end
    return false;
end

function isDoubleExpOpen()		--双倍经验
	if ymd() >= 20150319 and ymd() <= 20160321 then		--冬季活动
		return true;
	end
	if ymd() >= 20150218 and ymd() <= 20160220 then		--秋分活动
		return true;
	end
	if tonumber(server_start_day()) == 2 then
		return true;
	end
	if server.get_temp_var("doubleopen") == "1" then
		return true;
	end
	return false;
end

CONST_DOUBLE_EXP_CLOSE=20160820					--百服活动

function is37fanliOpen()
	if ymd() >= 20140328 and ymd() <= 20160330 then
		return true;
	end
	if server.get_temp_var("fanliwan") == "1" then
		return true;
	end
	return false;
end

function iszuoqidazhe()
	if ymd() >= 20140328 and ymd() <= 20160330 then
		return true;
	end
	if server.get_temp_var("zuoqidz") == "1" then
		return true;
	end
	return false;
end

function isXianshizhuanpanOpen()		--限时转盘
	if ymd() >= 20140605 and ymd() <= 20160611 then
		return true;
	end
	if server.get_temp_var("xianshizhuanpan") == "1" then
		return true;
	end
	return false;
end

function isshenqidazhe()		--神器打折
	if ymd() >= 20140405 and ymd() <= 20160407 then
		return true;
	end
	if server.get_temp_var("sqdzzz") == "1" then
		return true;
	end
	return false;
end

function isXSshenqiSale()
	if ymd() >= 20140311 and ymd() <= 20160316 then
		return true;
	end
	if server.get_temp_var("otheracy") == "1" then
		return true;
	end
	return false;
end

function isXunbaoDazhe()		--寻宝打折
	if server_start_day() <=2 then
		return true;
	end
	if ymd() >= 20140514 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("xunbaodz") == "1" then
		return true;
	end
	if server.get_temp_var("RoseDayOpen") == "1" then
		return true;
	end
	return false;
end

function isShuangbeiYabiao()
	if ymd() >= 20140411 and ymd() <= 20160417 and h() >= 17 and h() <18 then
		return true;
	end
	if server.get_temp_var("shuangbeiyabiao") == "1" then
		return true;
	end
	return false;
end
function isfuhuojiezadan()
	if ymd() >=20150313 and ymd() <= 20160318 then--银色情人节
		return true;
	end
	if server.get_temp_var("zadanopen") == "1" then
		return true;
	end
	return false;
end
function isBaifuBuchang()
	if ymd() >=20140425 and ymd() <= 20160427 then--百服补偿
		return true;
	end
	if server.get_temp_var("buchangopen") == "1" then
		return true;
	end
	return false;
end
function isxuyuanchi()
	if ymd() >= 20150313 and ymd() <= 20160318 then
		return true;
	end
	if server.get_temp_var("xuyuanchiopen") == "1" then
		return true;
	end
	return false;
end
function iskard()
	if ymd() >= 20140910 and ymd() <= 20160914 then
		return true;
	end
	if server.get_temp_var("kardopen") == "1" then
		return true;
	end
	return false;
end

function isRoseDayOpen()									--玫瑰情人节活动时间
	if ymd() >= 20140514 and ymd() <= 20160520 then
		return true;
	end
	if server.get_temp_var("RoseDayOpen") == "1" then			--gm.lua里用到
		return true;
	end
	return false;
end

function isBattleDoubleOpen()						--战场奖励双倍
	if ymd() >= 20140514 and ymd() <= 20160516 then		--玫瑰情人节战场奖励双倍
		return true;
	end
	if server.get_temp_var("BattleDoubleOpen") == "1" then
		return true;
	end
	return false;
end

function isShangChengSale()
	if ymd() >= 20140521 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("otheracyxscx") == "1" then
		return true;
	end
	return false;
end

function isMay37BaiFuOpen()
	if ymd() >= 20140628 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("may37baifu") == "1" then
		return true;
	end
	return false;
end

function isXiaRiOpen()
	if ymd() >= 20140605 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("XiaRiHuoDong") == "1" then
		return true;
	end
	return false;
end

function isDay14thOpen()		--chufa.lua开心富贵虎开1000绑元的活动
	if ymd() >= 20141006 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("KissDay") == "1" then
		return true;
	end
	return false;
end

function isVcoinDuiHuanOpen()		--元宝兑换绑定元宝	
	if ymd() >= 20141006 and ymd() <= 20160516 then    --金秋活动
		return true;
	end
	if server.get_temp_var("VcoinToBVcoin") == "1" then
		return true;
	end
	return false;
end

function isBindVcoinMallOpen(szActivity)		--Act 绑定元宝商城
	if szActivity == "ChinaJoy" and ymd() >= 20140901 and ymd() <= 20160516 then    --月初活动
		return true;
	end
	if server.get_temp_var("BindVcoinMall") == "1" then
		return true;
	end
	return false;
end

function isJiFenTaoZhuangOpen()		--套装积分升级装备几率100%
	if ymd() >= 20140621 and ymd() <= 20160516 then		--武尊夏至活动
		return true;
	end
	if server.get_temp_var("JiFenTaoZhuang") == "1" then
		return true;
	end
	return false;
end

function isHuoDongZheKouOpen(szActivity)		--活动限时折扣商城
	if szActivity == "Day14th" and ymd() >= 20150225 and ymd() <= 20160516 then		--月末活动
		return true;
	end
	if szActivity == "MoZuBaoKu" and ymd() >= 20150319 and ymd() <= 20160516 then		--月末活动
		return true;
	end
	if szActivity == "XiaZhi" and ymd() >= 20150301 and ymd() <= 20160516 then		--闰九活动
		return true;
	end	
	if server.get_temp_var("HuoDongZheKou") == "1" then
		return true;
	end
	return false;
end

function isJianLingUpOpen()		--活动剑灵升级回馈
	if ymd() >= 20140915 and ymd() <= 20160516 then		--月中活动
		return true;
	end
	if server.get_temp_var("JianLingUp") == "1" then
		return true;
	end
	return false;
end
function isHuiguiLibaoOpen()
	if ymd() >= 20140624 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("huiguilibao") == "1" then
		return true;
	end
	return false;
end

function isWorldCupOpen()
	if ymd() >= 20140621 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("worldcup") == "1" then
		return true;
	end
	return false;
end

function isSthDrop() -- 物品卡牌兑换 巧克力掉落
	if ymd() >= 20140908 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("dropsth") == "1" then
		return true;
	end
	return false;
end

function isJianLingDaZhe() 	--活动 剑灵特惠进阶
	if ymd() >= 20140722 and ymd() <= 20160516 then--魔族宝库活动
		return true;
	end
	if server.get_temp_var("JianLingDaZhe") == "1" then
		return true;
	end
	return false;
end

function isShouLingLiBaoOpen() 	--活动 兽灵升级回馈
	if ymd() >= 20150307 and ymd() <= 20160516 then--中秋活动
		return true;
	end
	if server.get_temp_var("ShouLingLiBao") == "1" then
		return true;
	end
	return false;
end

function isLianHunLiBaoOpen() 	--活动 炼魂修炼回馈
	if ymd() >= 20150225 and ymd() <= 20160516 then--暑假活动
		return true;
	end
	if server.get_temp_var("LianHunLiBao") == "1" then
		return true;
	end
	return false;
end

function isShenZhuangShengJiOpen() 	--活动 神装限时升级 (套装/神器积分升级装备)
	if ymd() >= 20150319 and ymd() <= 20160516 then--暑假活动
		return true;
	end
	if server.get_temp_var("ShenZhuangShengJi") == "1" then
		return true;
	end
	return false;
end

-------------------------------------------------------------------------------
--activity.isChunjieOpen()
-------------------------------------------------------------------------------

function isPetZiZhiHuiKui()		--宠物资质提升回馈
	if ymd() >= 20150313 and ymd() <= 20160516 then			
		return true;
	end
	if server.get_temp_var("petzizhihuikui") == "1" then
		return true;
	end
	return false;
end

function isPetJinHuaHuiKui()		--宠物进化回馈
	if ymd() >= 20150313 and ymd() <= 20160516 then			
		return true;
	end
	if server.get_temp_var("petjinghuahuikui") == "1" then
		return true;
	end
	return false;
end

function isPetJinHuaOpen()		--活动宠物进化打折  
	if ymd() >= 20150313 and ymd() <= 20160516 then		--荣耀庆典活动
		return true;
	end
	if server.get_temp_var("PetJinHua") == "1" then
		return true;
	end
	return false;
end

function isPetZiZhiDanOpen()		--活动宠物进化打折 玩家使用守护资质丹可获得祝福值效果增加1倍
	if ymd() >= 20150313 and ymd() <= 20160516 then		--荣耀庆典活动
		return true;
	end
	if server.get_temp_var("PetZiZhiDan") == "1" then
		return true;
	end
	return false;
end

function islingyuzhuanpan()   --灵玉转盘
	if ymd() >= 20150319 and ymd() <= 20160325 then
		return true;
	end
	if server.get_temp_var("lingyuzhuanpan") == "1" then
		return true;
	end
	return false;
end

function isDuoBaoQiBing() --夺宝奇兵
	if ymd() >= 20150225 and ymd() <= 20160228 then		
		return true;
	end
	if server.get_temp_var("duobaoqibing") == "1" then
		return true;
	end
	return false;
end
function isDuoBaoQiBingPaiHang() --夺宝奇兵排行
	if ymd() >= 20150301 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("duobaoqibingpaihang") == "1" then
		return true;
	end
	return false;
end

function isLongChengMiBao() --龙城秘宝
	if ymd() >= 20150301 and ymd() <= 20160306 then		
		return true;
	end
	if server.get_temp_var("longchengmibao") == "1" then
		return true;
	end
	return false;
end

function isXingshiShengdian()--星石盛典
	if ymd() >= 20141026 and ymd() <= 20160516 then
		return true;
	end
	if server.get_temp_var("xingshishengdian") == "1" then
		return true;
	end
end

function isFanLiShengDian() --返利盛典
	if ymd() >= 20150228 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("fanlishengdian") == "1" then
		return true;
	end
	return false;
end

function isCannonOpen() --人间大炮
	if ymd() >= 20150307 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("cannon") == "1" then
		return  true;
	end
	return false;
end

function isKuafuOpen()--跨服战
	if ymd() >= 20141219 then
		return true;
	end
	if server.get_temp_var("kuafuzhan") == "1" then
		return  true;
	end
	return false;
end

function isSuiMoJuHui() --新年聚会
	if ymd() >= 20150113 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("suimojuhui") == "1" then
		return  true;
	end
	return false;
end

function isTouZiJiHua() --投资计划
	if ymd() >= 20150120 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("touzijihua") == "1" then
		return  true;
	end
	return false;
end

function isChunJieJuHui() --新春钜惠
	if ymd() >= 20150310 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("chunjiejuhui") == "1" then
		return  true;
	end
	return false;
end

function isChunZhiFuDai() --福袋
	if ymd() >= 20150214 and ymd() <= 20160516 then		
		return true;
	end
	if server.get_temp_var("chuzhifudai") == "1" then
		return  true;
	end
	return false;
end
function isPiFengShengjiHlOpen()
	if ymd() >= 20150301 and ymd() <= 20160516 then		
		return true;
	end
	return false;
end