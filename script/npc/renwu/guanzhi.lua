module(..., package.seeall)

function onTalk100(npc,player)
  npc:echo([[----------------------------------------
<font color="#FFff00">您好,我是管理官职的使者!</font>
----------------------------------------
    <font color="#FFaa00">提升官职系统可以领取每日俸禄，兑换官印！</font>
----------------------------------------
<font color="#FFff00">如何获得魂石</font>: <font color="#FFaa00">可以使用元宝兑换魂石</font>
----------------------------------------
 

             <a href="event:talk_GuanZhi">进入提升官职</a>


----------------------------------------


<font color="#FFff00">使用[<font color="#FFaa00">王者徽记</font>]<a href="event:talk_WangZheDH">兑换道具</a>

使用[<font color="#FFaa00">霸者徽记</font>]<a href="event:talk_BaZheDH">兑换道具</a></font>
]]);
end

function onTalkWangZheDH(npc, player)
  npc:echo([[           <b><font color="#ccbb77" size="14px">王者徽记兑换列表</font></b>
----------------------------------------
<font color="#ccbb77">您当前共有[<font color="#ffff00">王者徽记</font>]：<font color="#FFaa00">]]..player:num_item("王者徽记")..[[</font>个</font>
----------------------------------------
##镇东青龙王盔卷##                <a href="event:talk_WangZheDH1">兑换</a>
需要:<font color="#ffff00">王者徽记[<font color="#FFaa00">100</font>]个</font>

##镇南朱雀王链卷##                <a href="event:talk_WangZheDH2">兑换</a>
需要:<font color="#ffff00">王者徽记[<font color="#FFaa00">100</font>]个</font>

##镇西白虎王戒卷##                <a href="event:talk_WangZheDH3">兑换</a>
需要:<font color="#ffff00">王者徽记[<font color="#FFaa00">100</font>]个</font>

##镇北玄武王腕卷##                <a href="event:talk_WangZheDH4">兑换</a>
需要:<font color="#ffff00">王者徽记[<font color="#FFaa00">100</font>]个</font>

##兵马大元帅盔##                  <a href="event:talk_WangZheDH5">兑换</a>
需要:<font color="#ffff00">王者徽记[<font color="#FFaa00">30</font>]个</font>

##镇国大将军链##                  <a href="event:talk_WangZheDH6">兑换</a>
需要:<font color="#ffff00">王者徽记[<font color="#FFaa00">25</font>]个</font>
----------------------------------------
                                <a href="event:talk_100">返回主页</a>
]]);
end

function onTalkWangZheDH1(npc, player)  HuiJiDuiHuan(player, "王者徽记", 100, "镇东青龙王盔卷", 1, 1, 1) onTalkWangZheDH(npc, player)  end
function onTalkWangZheDH2(npc, player)  HuiJiDuiHuan(player, "王者徽记", 100, "镇南朱雀王链卷", 1, 1, 1) onTalkWangZheDH(npc, player)  end
function onTalkWangZheDH3(npc, player)  HuiJiDuiHuan(player, "王者徽记", 100, "镇西白虎王戒卷", 1, 1, 1) onTalkWangZheDH(npc, player)  end
function onTalkWangZheDH4(npc, player)  HuiJiDuiHuan(player, "王者徽记", 100, "镇北玄武王腕卷", 1, 1, 1) onTalkWangZheDH(npc, player)  end
function onTalkWangZheDH5(npc, player)  HuiJiDuiHuan(player, "王者徽记", 30, "兵马大元帅盔", 1, 1, 0)   onTalkWangZheDH(npc, player)  end
function onTalkWangZheDH6(npc, player)  HuiJiDuiHuan(player, "王者徽记", 25, "镇国大将军链", 1, 1, 0)   onTalkWangZheDH(npc, player)  end

function onTalkBaZheDH(npc, player)
  npc:echo([[            <b><font color="#ccbb77" size="14px">霸者徽记兑换列表</font></b>
----------------------------------------
<font color="#ccbb77">您当前共有[<font color="#ffff00">霸者徽记</font>]：<font color="#FFaa00">]]..player:num_item("霸者徽记")..[[</font>个</font>
----------------------------------------
##抚国大将军戒##                  <a href="event:talk_BaZheDH1">兑换</a>
需要:<font color="#ffff00">霸者徽记[<font color="#FFaa00">500</font>]个</font>

##骠骑将军护腕##                  <a href="event:talk_BaZheDH2">兑换</a>
需要:<font color="#ffff00">霸者徽记[<font color="#FFaa00">400</font>]个</font>

##真气丹(10000)##                 <a href="event:talk_BaZheDH4">兑换</a>
需要:<font color="#ffff00">霸者徽记[<font color="#FFaa00">200</font>]个</font>

##灵气珠(10000)##                 <a href="event:talk_BaZheDH5">兑换</a>
需要:<font color="#ffff00">霸者徽记[<font color="#FFaa00">200</font>]个</font>

##兽灵精华(10000)##               <a href="event:talk_BaZheDH6">兑换</a>
需要:<font color="#ffff00">霸者徽记[<font color="#FFaa00">200</font>]个</font>
----------------------------------------
                                <a href="event:talk_100">返回主页</a>
]]);
end

function onTalkBaZheDH1(npc, player)  HuiJiDuiHuan(player, "霸者徽记", 500, "抚国大将军戒", 1, 1, 0)    onTalkBaZheDH(npc, player)  end
function onTalkBaZheDH2(npc, player)  HuiJiDuiHuan(player, "霸者徽记", 400, "骠骑将军护腕", 1, 1, 0)    onTalkBaZheDH(npc, player)  end
--function onTalkBaZheDH3(npc, player)  HuiJiDuiHuan(player, "霸者徽记", 300, "银色弓箭", 1, 1, 0)      onTalkBaZheDH(npc, player)  end
function onTalkBaZheDH4(npc, player)  HuiJiDuiHuan(player, "霸者徽记", 200, "真气丹(10000)", 1, 1, 1)   onTalkBaZheDH(npc, player)  end
function onTalkBaZheDH5(npc, player)  HuiJiDuiHuan(player, "霸者徽记", 200, "灵气珠(10000)", 1, 1, 1)    onTalkBaZheDH(npc, player)  end
function onTalkBaZheDH6(npc, player)  HuiJiDuiHuan(player, "霸者徽记", 200, "兽灵精华(10000)", 1, 1, 1) onTalkBaZheDH(npc, player)  end

function HuiJiDuiHuan(player, szHuiJiName, nNeedHuiJi, szItemName, nItemNum, nBagBlack, isBind)
  local nHuiJi = player:num_item(szHuiJiName)
  if nHuiJi < nNeedHuiJi then
    player:alert(1,1,"您目前没有足够的["..szHuiJiName.."]，无法兑换!")
    return
  end
  if player:num_bag_black() < nBagBlack then
    player:alert(1,1,"您的背包空间不足"..nBagBlack.."格，无法领取!")
    return
  end
  player:remove_item(szHuiJiName, nNeedHuiJi)
  player:add_item(szItemName, nItemNum, isBind)
  player:alert(11,1,"恭喜您成功兑换:<font color='#ee00ee'>"..szItemName.."</font>");
  server.info(10000,0,"勇士【"..player:get_name().."】在土城[官职使者]处成功兑换["..szItemName.."]");
  server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[官职使者]处成功兑换[<font color='#ee00ee'>"..szItemName.."</font>]");
  return  
end

function onTalkGuanZhi(npc,player)
	if util.ppn(player,const.PP_GUANZHI) == 0 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">无业游民</font>  
----------------------------------------
[无业游民]状态和俸禄:     <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 0-0    魂    石: 500  
  魔法攻击: 0-0    绑定元宝: 500  
  道术攻击: 0-0    绑定金币: 50000</font>
----------------------------------------
[九品将兵都卫]提升条件:
    <font color="#ff0000">等级达到10级
    绑定金币:100000</font>
----------------------------------------
<font color="#ffaa00">提升[九品将兵都卫]可佩戴[九品将兵官印]</font>
----------------------------------------
[九品将兵都卫]状态和俸禄:
  <font color="#ffff00">物理攻击: 6-10    魂    石: 500
  魔法攻击: 6-10    绑定元宝: 500
  道术攻击: 6-10    绑定金币: 50000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升九品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 1 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">九品将兵都卫</font>  
----------------------------------------
[九品将兵都卫]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 6-10    魂    石: 500
  魔法攻击: 6-10    绑定元宝: 500
  道术攻击: 6-10    绑定金币: 50000</font>
----------------------------------------
[八品抚夷护军]提升条件:
    <font color="#ff0000">等级达到15级
    金矿*1</font>  [<a href="event:talk_wakuang">前往采矿区域</a>]
----------------------------------------
<font color="#ffaa00">提升[八品抚夷护军]可佩戴[八品抚夷官印]</font>
----------------------------------------
[八品抚夷护军]状态和俸禄:
  <font color="#ffff00">物理攻击: 12-20   魂    石: 600
  魔法攻击: 12-20   绑定元宝: 600
  道术攻击: 12-20   绑定金币: 100000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升八品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 2 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">八品抚夷护军</font>  
----------------------------------------
[八品抚夷护军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 12-20   魂    石: 600
  魔法攻击: 12-20   绑定元宝: 600
  道术攻击: 12-20   绑定金币: 100000</font>
----------------------------------------
[七品安夷护军]提升条件:
    <font color="#ff0000">等级达到20级
    魂石*100</font>[<a href="event:talk_hdhunshi">如何获得魂石?</a>]
----------------------------------------
<font color="#ffaa00">提升[七品安夷护军]可佩戴[七品安夷官印]</font>
----------------------------------------
[七品安夷护军]状态和俸禄:
  <font color="#ffff00">物理攻击: 24-40   魂    石: 700
  魔法攻击: 24-40   绑定元宝: 700
  道术攻击: 24-40   绑定金币: 150000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升七品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 3 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">七品安夷护军</font>  
----------------------------------------
[七品安夷护军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 24-40   魂    石: 700
  魔法攻击: 24-40   绑定元宝: 700
  道术攻击: 24-40   绑定金币: 150000</font>
----------------------------------------
[六品讨寇校卫]提升条件:
    <font color="#ff0000">等级达到25级
    魂石*500</font>[<a href="event:talk_hdhunshi">如何获得魂石?</a>]
----------------------------------------
<font color="#ffaa00">提升[六品讨寇校卫]可佩戴[六品讨寇官印]</font>
----------------------------------------
[六品讨寇校卫]状态和俸禄:
  <font color="#ffff00">物理攻击: 36-60   魂    石: 800
  魔法攻击: 36-60   绑定元宝: 800
  道术攻击: 36-60   绑定金币: 200000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升六品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 4 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">六品讨寇校卫</font>  
----------------------------------------
[六品讨寇校卫]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 36-60   魂    石: 800
  魔法攻击: 36-60   绑定元宝: 800
  道术攻击: 36-60   绑定金币: 200000</font>
----------------------------------------
[五品平寇校卫]提升条件:
    <font color="#ff0000">等级达到30级
    魂石*1000</font>[<a href="event:talk_hdhunshi">如何获得魂石?</a>]
----------------------------------------
<font color="#ffaa00">提升[五品平寇校卫]可佩戴[五品平寇官印]</font>
----------------------------------------
[五品平寇校卫]状态和俸禄:
  <font color="#ffff00">物理攻击: 48-80   魂    石: 900
  魔法攻击: 48-80   绑定元宝: 900
  道术攻击: 48-80   绑定金币: 250000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升五品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 5 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">五品平虏校卫</font>  
----------------------------------------
[五品平寇校卫]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 48-80   魂    石: 900
  魔法攻击: 48-80   绑定元宝: 900
  道术攻击: 48-80   绑定金币: 250000</font>
----------------------------------------
[四品破虏将军]提升条件:
    <font color="#ff0000">等级达到35级
    魂石*2000</font>[<a href="event:talk_hdhunshi">如何获得魂石?</a>]
----------------------------------------
<font color="#ffaa00">提升[四品破虏将军]可佩戴[四品破虏官印]</font>
----------------------------------------
[四品破虏将军]状态和俸禄:
  <font color="#ffff00">物理攻击: 72-120   魂    石: 1000
  魔法攻击: 72-120   绑定元宝: 1000
  道术攻击: 72-120   绑定金币: 300000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升四品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 6 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">四品破虏将军</font>  
----------------------------------------
[四品破虏将军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 72-120   魂    石: 1000
  魔法攻击: 72-120   绑定元宝: 1000
  道术攻击: 72-120   绑定金币: 300000</font>
----------------------------------------
[三品平虏将军]提升条件:
    <font color="#ff0000">等级达到40级
    魂石*5000</font>[<a href="event:talk_hdhunshi">如何获得魂石?</a>]
----------------------------------------
<font color="#ffaa00">提升[三品平虏将军]可佩戴[三品平虏官印]</font>
----------------------------------------
[三品平虏将军]状态和俸禄:
  <font color="#ffff00">物理攻击: 96-160   魂    石: 1100
  魔法攻击: 96-160   绑定元宝: 1100
  道术攻击: 96-160   绑定金币: 350000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升三品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 7 then
		local x={["warrior"]="武力丹",["wizard"]="魔力丹",["taoist"]="道力丹"};
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">三品平虏将军</font>  
----------------------------------------
[三品平虏将军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 96-160   魂    石: 1100
  魔法攻击: 96-160   绑定元宝: 1100
  道术攻击: 96-160   绑定金币: 350000</font>
----------------------------------------
[二品车骑将军]提升条件:
    <font color="#ff0000">等级达到45级
    魂石*10000,]]..x[player:get_job_name()]..[[*1</font>
----------------------------------------
<font color="#ffaa00">提升[二品车骑将军]可佩戴[二品车骑官印]</font>
----------------------------------------
[二品车骑将军]状态和俸禄:
  <font color="#ffff00">物理攻击: 120-200   魂    石: 1200
  魔法攻击: 120-200   绑定元宝: 1200
  道术攻击: 120-200   绑定金币: 400000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升二品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 8 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">二品车骑将军</font>  
----------------------------------------
[二品车骑将军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 120-200   魂    石: 1200
  魔法攻击: 120-200   绑定元宝: 1200
  道术攻击: 120-200   绑定金币: 400000</font>
----------------------------------------
[一品骠骑将军]提升条件:
    <font color="#ff0000">等级达到50级
    魂石*20000,七彩石*1</font>
----------------------------------------
<font color="#ffaa00">提升[一品骠骑将军]可佩戴[一品骠骑官印]</font>
----------------------------------------
[一品骠骑将军]状态和俸禄:
  <font color="#ffff00">物理攻击: 156-260   魂    石: 1300
  魔法攻击: 156-260   绑定元宝: 1300
  道术攻击: 156-260   绑定金币: 450000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升一品官职</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 9 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">一品骠骑将军</font>  
----------------------------------------
[一品骠骑将军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 156-260   魂    石: 1300
  魔法攻击: 156-260   绑定元宝: 1300
  道术攻击: 156-260   绑定金币: 450000</font>
----------------------------------------
[抚国大将军]提升条件:
    <font color="#ff0000">等级达到55级
    魂石*30000,七彩石*2</font>
----------------------------------------
<font color="#ffaa00">提升[抚国大将军]可佩戴[三等抚国官印]</font>
----------------------------------------
[抚国大将军]状态和俸禄:
  <font color="#ffff00">物理攻击: 192-320   魂    石: 1400
  魔法攻击: 192-320   绑定元宝: 1400
  道术攻击: 192-320   绑定金币: 500000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升抚国将军</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 10 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">抚国大将军</font>  
----------------------------------------
[抚国大将军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 192-320   魂    石: 1400
  魔法攻击: 192-320   绑定元宝: 1400
  道术攻击: 192-320   绑定金币: 500000</font>
----------------------------------------
[镇国大将军]提升条件:
    <font color="#ff0000">等级达到60级
    魂石*40000,七彩石*4</font>
----------------------------------------
<font color="#ffaa00">提升[镇国大将军]可佩戴[二等镇国官印]</font>
----------------------------------------
[镇国大将军]状态和俸禄:
  <font color="#ffff00">物理攻击: 240-400   魂    石: 1500
  魔法攻击: 240-400   绑定元宝: 1500
  道术攻击: 240-400   绑定金币: 550000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升镇国将军</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 11 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">镇国大将军</font>  
----------------------------------------
[镇国大将军]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 240-400   魂    石: 1500
  魔法攻击: 240-400   绑定元宝: 1500
  道术攻击: 240-400   绑定金币: 550000</font>
----------------------------------------
[兵马大元帅]提升条件:
    <font color="#ff0000">等级达到65级
    魂石*50000,七彩石*6</font>
----------------------------------------
<font color="#ffaa00">提升[兵马大元帅]可佩戴[一等元帅官印]</font>
----------------------------------------
[兵马大元帅]状态和俸禄:
  <font color="#ffff00">物理攻击: 300-500   魂    石: 2000
  魔法攻击: 300-500   绑定元宝: 2000
  道术攻击: 300-500   绑定金币: 600000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升兵马元帅</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 12 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">兵马大元帅</font>  
----------------------------------------
[兵马大元帅]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击: 300-500   魂    石: 2000
  魔法攻击: 300-500   绑定元宝: 2000
  道术攻击: 300-500   绑定金币: 600000</font>
----------------------------------------
您的下阶官职为: <font color="#ffaa00">镇北玄武王</font>  
----------------------------------------
[镇北玄武王]提升条件:
    <font color="#ff0000">等级达到70级
    魂石*60000,神器积分*1000</font>
----------------------------------------
[镇北玄武王]状态和俸禄:
  <font color="#ffff00">物理攻击: 420-700   魂    石: 2500
  魔法攻击: 420-700   绑定元宝: 2500
  道术攻击: 420-700   绑定金币: 700000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升镇北玄武王</a>     <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有神器积分: <font color="#ff0000">]]..util.ppn(player,const.PP_SQJF)..[[</font>点
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 13 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">镇北玄武王</font>  
----------------------------------------
[镇北玄武王]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击:420-700   魂    石:2500
  魔法攻击:420-700   绑定元宝:2500
  道术攻击:420-700   绑定金币:700000</font>
----------------------------------------
您的下阶官职为: <font color="#ffaa00">镇西白虎王</font>  
----------------------------------------
[镇西白虎王]提升条件:
    <font color="#ff0000">等级达到75级
    魂石*70000,神器积分*1500</font>
----------------------------------------
[镇西白虎王]状态和俸禄:
  <font color="#ffff00">物理攻击:600-1000  魂    石:3000
  魔法攻击:600-1000  绑定元宝:3000
  道术攻击:600-1000  绑定金币:800000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升镇西白虎王</a>     <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有神器积分: <font color="#ff0000">]]..util.ppn(player,const.PP_SQJF)..[[</font>点
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 14 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">镇西白虎王</font>  
----------------------------------------
[镇西白虎王]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击:600-1000  魂    石:3000
  魔法攻击:600-1000  绑定元宝:3000
  道术攻击:600-1000  绑定金币:800000</font>
----------------------------------------
您的下阶官职为: <font color="#ffaa00">镇南朱雀王</font>  
----------------------------------------
[镇南朱雀王]提升条件:
    <font color="#ff0000">等级达到80级
    魂石*80000,神器积分*2500</font>
----------------------------------------
[镇南朱雀王]状态和俸禄:
  <font color="#ffff00">物理攻击:840-1400  魂    石:3500
  魔法攻击:840-1400  绑定元宝:3500
  道术攻击:840-1400  绑定金币:900000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升镇南朱雀王</a>     <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有神器积分: <font color="#ff0000">]]..util.ppn(player,const.PP_SQJF)..[[</font>点
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 15 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">镇南朱雀王</font>  
----------------------------------------
[镇南朱雀王]状态和俸禄: <a href="event:talk_lqfl">领取每日俸禄</a>
  <font color="#ffff00">物理攻击:840-1400  魂    石:3500
  魔法攻击:840-1400  绑定元宝:3500
  道术攻击:840-1400  绑定金币:900000</font>
----------------------------------------
您的下阶官职为: <font color="#ffaa00">镇东青龙王</font>  
----------------------------------------
[镇东青龙王]提升条件:
    <font color="#ff0000">等级达到85级
    魂石*100000,神器积分*3500</font>
----------------------------------------
[镇东青龙王]状态和俸禄:
  <font color="#ffff00">物理攻击:1200-2000 魂    石:4000
  魔法攻击:1200-2000 绑定元宝:4000
  道术攻击:1200-2000 绑定金币:1000000</font>
----------------------------------------
    <a href="event:talk_tsgz">提升镇东青龙王</a>     <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有神器积分: <font color="#ff0000">]]..util.ppn(player,const.PP_SQJF)..[[</font>点
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
	if util.ppn(player,const.PP_GUANZHI) == 16 then
		npc:echo([[----------------------------------------
               <font color="#ff0000">加官进爵</font>
----------------------------------------
您当前的官职为: <font color="#ffff00">镇东青龙王</font>  
----------------------------------------
<font color="#ffff00">您已经成为人中龙凤,达到了官职最大等级</font>
----------------------------------------
[镇东青龙王]状态和俸禄:
  <font color="#ffff00">物理攻击:1200-2000 魂    石:4000
  魔法攻击:1200-2000 绑定元宝:4000
  道术攻击:1200-2000 绑定金币:1000000</font> 
----------------------------------------
    <a href="event:talk_lqfl">领取每日俸禄</a>       <a href="event:talk_z100">魂石兑换官印</a>
----------------------------------------
您当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
                                <a href="event:talk_100">返回主页</a>]]);
	end
end

function onTalklqfl(npc,player)
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
		end
	else
		player:alert(1,1,"官职俸禄每天只可以领取1次哦!");
	end
	onTalkGuanZhi(npc,player);
end

function onTalkwakuang(npc,player)
	player:alert(11,1,"<font color='#ff0000'>[矿石]在僵尸洞[采矿区域]获得!</font>");
	player:alert(11,0,"矿石还可出售给商人换取金币!");
	player:enter_map("jsd2",19,94);
end

function onTalknuma(npc,player)
	player:enter_map("wmsm3",31,38);
end

function onTalkhdhunshi(npc,player)
	player:alert(11,1,"<font color='#ff0000'>[魂石]可以通过装备回收或者元宝兑换获得!!</font>");
	onTalkGuanZhi(npc,player);
end

function onTalktsgz(n,player)
	onTalkshuaxin(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
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
		onTalkshuaxin(n,player);
		onTalkGuanZhi(n,player);
		return;
	end
end

function onTalkshuaxin(npc,player)
	if player:get_task_state(3006) == 1 and util.ppn(player,const.PP_GUANZHI) <= 3 then
		player:set_task_state(3006,1);
		player:push_task_data(3006,0);
	else
		player:set_task_state(3006,3);
		player:push_task_data(3006,0);
	end
end



function onTalkz100(npc,player)
	if server_open_day() >= 16171 then
		if util.ppn(player,const.PP_GUANZHI_START) ~= 1 then
			player:alert(11,1,"官印系统将在累积登陆第六日后开启!");
			return
		end
	end
	npc:echo([[
         <b><font color="#ccbb77" size="14px">官印兑换兑换列表</font></b>
----------------------------------------
你当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
##九品将兵官印##        <a href="event:talk_z200">魂石兑换官印</a>
需要:魂石[<font color="#ff0000">511</font>]个
----------------------------------------
##八品抚夷官印##        <a href="event:talk_z201">魂石升级官印</a>
需要:魂石[<font color="#ff0000">1134</font>]个
----------------------------------------
##七品安夷官印##        <a href="event:talk_z202">魂石升级官印</a>
需要:魂石[<font color="#ff0000">2123</font>]个
----------------------------------------
##六品讨寇官印##        <a href="event:talk_z203">魂石升级官印</a>
需要:魂石[<font color="#ff0000">4196</font>]个
----------------------------------------
##五品平寇官印##        <a href="event:talk_z204">魂石升级官印</a>
需要:魂石[<font color="#ff0000">8273</font>]个
----------------------------------------
##四品破虏官印##        <a href="event:talk_z205">魂石升级官印</a>
需要:魂石[<font color="#ff0000">16312</font>]个
----------------------------------------
<a href="event:talk_dhryz">元宝兑换魂石</a>      　　<a href="event:talk_z300">下一页</a>  <a href="event:talk_100">返回主页</a>
----------------------------------------
]]);
end

function onTalkz200(npc,player)
	if  player:num_item("九品将兵官印",1) >= 1 or  player:num_item("九品将兵官印",10) >= 1 or player:num_item("九品将兵官印",100) >= 1 then
		player:alert(1,1,"您已经有[九品将兵官印],还是别兑换了!!")
		onTalkz100(npc,player);
	else
		if util.ppn(player,const.PP_HUNSHI) >= 511 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-511);
				player:add_item("九品将兵官印",1,1);
				player:alert(11,1,"恭喜您成功兑换[九品将兵官印]");
				player:alert(11,0,"您当前魂石还有:"..util.ppn(player,const.PP_HUNSHI).."个");
				onTalkz100(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkz100(npc,player);
			end
		else
			player:alert(1,1,"您的魂石不足[511]个,无法兑换!")
			onTalkz100(npc,player);
		end
	end
end

function onTalkz300(npc,player)
	npc:echo([[
         <b><font color="#ccbb77" size="14px">官印兑换兑换列表</font></b>
----------------------------------------
你当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
##三品平虏官印##        <a href="event:talk_z206">魂石升级官印</a>
需要:魂石[<font color="#ff0000">32570</font>]个
----------------------------------------
##二品车骑官印##        <a href="event:talk_z207">魂石升级官印</a>
需要:魂石[<font color="#ff0000">64209</font>]个
----------------------------------------
##一品骠骑官印##        <a href="event:talk_z208">魂石升级官印</a>
需要:魂石[<font color="#ff0000">128431</font>]个
----------------------------------------
##三等抚国官印##        <a href="event:talk_z209">魂石升级官印</a>
需要:魂石[<font color="#ff0000">256352</font>]个
----------------------------------------
##二等镇国官印##        <a href="event:talk_z210">魂石升级官印</a>
需要:魂石[<font color="#ff0000">512801</font>]个
----------------------------------------
##一等元帅官印##        <a href="event:talk_z211">魂石升级官印</a>
需要:魂石[<font color="#ff0000">1024129</font>]个
----------------------------------------
<a href="event:talk_dhryz">元宝兑换魂石</a>      　　<a href="event:talk_z100">上一页</a>  <a href="event:talk_100">返回主页</a>
----------------------------------------]]);
end



function onTalkz201(npc,player) ryxzsj(npc,player,110001,1134,"九品将兵官印","八品抚夷官印",110002,1) end
function onTalkz202(npc,player) ryxzsj(npc,player,110002,2123,"八品抚夷官印","七品安夷官印",110003,1) end
function onTalkz203(npc,player) ryxzsj(npc,player,110003,4196,"七品安夷官印","六品讨寇官印",110004,1) end
function onTalkz204(npc,player) ryxzsj(npc,player,110004,8273,"六品讨寇官印","五品平寇官印",110005,1) end
function onTalkz205(npc,player) ryxzsj(npc,player,110005,16312,"五品平寇官印","四品破虏官印",110006,1) end
function onTalkz206(npc,player) ryxzsj(npc,player,110006,32570,"四品破虏官印","三品平虏官印",110007,2) end
function onTalkz207(npc,player) ryxzsj(npc,player,110007,64209,"三品平虏官印","二品车骑官印",110008,2) end
function onTalkz208(npc,player) ryxzsj(npc,player,110008,128431,"二品车骑官印","一品骠骑官印",110009,2) end
function onTalkz209(npc,player) ryxzsj(npc,player,110009,256352,"一品骠骑官印","三等抚国官印",110010,2) end
function onTalkz210(npc,player) ryxzsj(npc,player,110010,512801,"三等抚国官印","二等镇国官印",110011,2) end
function onTalkz211(npc,player) ryxzsj(npc,player,110011,1024129,"二等镇国官印","一等元帅官印",110012,2) end
function onTalkz210a(npc,player) ryxzsj(npc,player,110010,512801,"三等抚国官印","二等镇国官印1",110013,2) end
function onTalkz211a(npc,player) ryxzsj(npc,player,110013,1024129,"二等镇国官印1","一等元帅官印1",110014,2) end
function onTalkz210b(npc,player) ryxzsj(npc,player,110010,512801,"三等抚国官印","二等镇国官印2",110015,2) end
function onTalkz211b(npc,player) ryxzsj(npc,player,110015,1024129,"二等镇国官印2","一等元帅官印2",110016,2) end

function ryxzsj(npc,player,a,b,c,d,e,f)
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
		if f==1 then onTalkz100(npc,player); end
		if f==2 then onTalkz300(npc,player); end
	end
end



function onTalkdhryz(npc,player)
	npc:echo([[
----------------------------------------
<b><font color="#ccbb77" size="14px">元宝兑换魂石</font></b>
----------------------------------------
当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
如何获得魂石: <font color="#ff0000">魂石可以通过装备回收获得</font>
----------------------------------------
<a href="event:talk_dh100">兑换100个魂石</a>        <font color="#ffaa00">需要元宝:60</font>
----------------------------------------
<a href="event:talk_dh500">兑换500个魂石</a>        <font color="#ffaa00">需要元宝:300</font>
----------------------------------------
<a href="event:talk_dh1000">兑换1000个魂石</a>       <font color="#ffaa00">需要元宝:600</font>
----------------------------------------
<a href="event:talk_dh5000">兑换5000个魂石</a>       <font color="#ffaa00">需要元宝:3000</font>
----------------------------------------
<a href="event:talk_dh10000">兑换10000个魂石</a>      <font color="#ffaa00">需要元宝:6000</font>
----------------------------------------
<a href="event:talk_dh50000">兑换50000个魂石</a>      <font color="#ffaa00">需要元宝:30000</font>
----------------------------------------
<a href="event:talk_dh100000">兑换100000个魂石</a>     <font color="#ffaa00">需要元宝:60000</font>
----------------------------------------
                              <a href="event:talk_100">返回首页</a>
----------------------------------------
]]);
end


function onTalktqhs(npc,player)
	npc:echo([[
----------------------------------------
<b><font color="#ccbb77" size="14px">提取魂石卷轴</font></b>
----------------------------------------
当前共有魂石: <font color="#ff0000">]]..util.ppn(player,const.PP_HUNSHI)..[[</font>个
----------------------------------------
如何获得魂石: <font color="#ff0000">魂石可以通过装备回收获得</font>
----------------------------------------
<a href="event:talk_tqhs1">提取魂石(1)</a>         <font color="#ffaa00">需要魂石:1</font>
----------------------------------------
<a href="event:talk_tqhs10">提取魂石(10)</a>        <font color="#ffaa00">需要魂石:10</font>
----------------------------------------
<a href="event:talk_tqhs100">提取魂石(100)</a>       <font color="#ffaa00">需要魂石:100</font>
----------------------------------------
<a href="event:talk_tqhs1000">提取魂石(1000)</a>      <font color="#ffaa00">需要魂石:1000</font>
----------------------------------------
<a href="event:talk_tqhs10000">提取魂石(10000)</a>     <font color="#ffaa00">需要魂石:10000</font>
----------------------------------------
<a href="event:talk_tqhs100000">提取魂石(100000)</a>    <font color="#ffaa00">需要魂石:100000</font>
----------------------------------------
<a href="event:talk_dhryz">元宝兑换魂石</a>                 <a href="event:talk_100">返回首页</a>
----------------------------------------
]]);
end

--function onTalktqhs1(npc,player) tqhs(npc,player,1,"魂石卷轴(1)"); end
--function onTalktqhs10(npc,player) tqhs(npc,player,10,"魂石卷轴(10)"); end
--function onTalktqhs100(npc,player) tqhs(npc,player,100,"魂石卷轴(100)"); end
--function onTalktqhs1000(npc,player) tqhs(npc,player,1000,"魂石卷轴(1000)"); end
--function onTalktqhs10000(npc,player) tqhs(npc,player,10000,"魂石卷轴(10000)"); end
--function onTalktqhs100000(npc,player) tqhs(npc,player,100000,"魂石卷轴(100000)"); end

function tqhs(npc,player,a,b)
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
	onTalktqhs(npc,player);
end

function onTalkdh100(npc,player) dhryz(npc,player,60,100); end
function onTalkdh500(npc,player) dhryz(npc,player,300,500); end
function onTalkdh1000(npc,player) dhryz(npc,player,600,1000); end
function onTalkdh5000(npc,player) dhryz(npc,player,3000,5000); end
function onTalkdh10000(npc,player) dhryz(npc,player,6000,10000); end
function onTalkdh50000(npc,player) dhryz(npc,player,30000,50000); end
function onTalkdh100000(npc,player) dhryz(npc,player,60000,100000); end

function dhryz(npc,player,a,b)
	if a and b then
		if player:get_vcoin() >= a then
			player:sub_vcoin(a,"hunshi");
			player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+b);
			player:alert(11,1,"成功使用["..a.."]元宝兑换["..b.."]个魂石!");
			player:alert(11,0,"您的当前魂石为:"..util.ppn(player,const.PP_HUNSHI).."个");
			onTalkdhryz(npc,player);
		else
			player:alert(11,1,"您的元宝不足["..a.."],无法兑换魂石!");
			onTalkdhryz(npc,player);
		end
	end
end