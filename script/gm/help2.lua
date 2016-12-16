module(..., package.seeall)

function xqhuodong(player,param100)
	Show_tt(player,1);
end

local hd_data_btc = {
	[1] = {name="首次充值大礼包",funb = function(a,b) t_contentc(a,b); end},
	[2] = {name="充值排名得神器",funb = function(a,b) t_contentc(a,b); end},
	[3] = {name="新区充值大返利",funb = function(a,b) t_contentc(a,b); end},
	[4] = {name="贺新区冲级大礼",funb = function(a,b) t_contentc(a,b); end},
	[5] = {name="全民升级乐翻天",funb = function(a,b) t_contentc(a,b); end},
	[6] = {name="新手卡豪华礼包",funb = function(a,b) t_contentc(a,b); end},
	[7] = {name="贺新区全服升级",funb = function(a,b) t_contentc(a,b); end},
	[8] = {name="新区冲级排名奖",funb = function(a,b) t_contentc(a,b); end},
	[9] = {name="三魔兽逆袭王城",funb = function(a,b) t_contentc(a,b); end},
	[10] = {name="充值积分换豪礼",funb = function(a,b) t_contentc(a,b); end},
}
local hd_data_btc2 = {
	[1] = {name="合区豪华大礼包",funb = function(a,b) t_contentc2(a,b); end},
	[2] = {name="合区充值排名榜",funb = function(a,b) t_contentc2(a,b); end},
	[3] = {name="合区充值大返利",funb = function(a,b) t_contentc2(a,b); end},
	[4] = {name="贺新区冲级大礼",funb = function(a,b) t_contentc(a,b); end},
	[5] = {name="全民升级乐翻天",funb = function(a,b) t_contentc(a,b); end},
	[6] = {name="新手卡豪华礼包",funb = function(a,b) t_contentc(a,b); end},
	[7] = {name="贺新区全服升级",funb = function(a,b) t_contentc(a,b); end},
	[8] = {name="新区冲级排名奖",funb = function(a,b) t_contentc(a,b); end},
	[9] = {name="三魔兽逆袭王城",funb = function(a,b) t_contentc(a,b); end},
	[10] = {name="充值积分换豪礼",funb = function(a,b) t_contentc(a,b); end},
}
function Show_tt(player,id)
	if is_merge_server() then
		for i = 1,#hd_data_btc2 do
			if i == id then
				player:echo("--------------<br><font color='#ffaaee'>"..hd_data_btc2[i].name .."</font><br>");
			else
				player:echo("--------------<br><a href='event:talk_tc"..i.."'>" .. hd_data_btc2[i].name .."</a><br>");
			end
		end
	else
		for i = 1,#hd_data_btc do
			if i == id then
				player:echo("--------------<br><font color='#ffaaee'>"..hd_data_btc[i].name .."</font><br>");
			else
				player:echo("--------------<br><a href='event:talk_tc"..i.."'>" .. hd_data_btc[i].name .."</a><br>");
			end
		end
	end
	player:echo("--------------");
	player:listtalk_list(200);
	if is_merge_server() then
		hd_data_btc2[id].funb(player,id);
	else
		hd_data_btc[id].funb(player,id);
	end
	player:listtalk_content(200);
	player:listtalk_title("",200);
end

function t_contentc2(player,id)
	if id == 1 then help21_merg(player,id); end
	if id == 2 then help22_merg(player,id); end
	if id == 3 then help23_merg(player,id); end
end
function t_contentc(player,id)
	if id == 1 then help21(player,id); end
	if id == 2 then help22(player,id); end
	if id == 3 then help23(player,id); end
	if id == 4 then help24(player,id); end
	if id == 5 then help25(player,id); end
	if id == 6 then help26(player,id); end
	if id == 7 then help27(player,id); end
	if id == 8 then help28(player,id); end
	if id == 9 then help29(player,id); end
	if id == 10 then help210(player,id); end
end


function onTalktc1(player) Show_tt(player,1); end
function onTalktc2(player) Show_tt(player,2); end
function onTalktc3(player) Show_tt(player,3); end
function onTalktc4(player) Show_tt(player,4); end
function onTalktc5(player) Show_tt(player,5); end
function onTalktc6(player) Show_tt(player,6); end
function onTalktc7(player) Show_tt(player,7); end
function onTalktc8(player) Show_tt(player,8); end
function onTalktc9(player) Show_tt(player,9); end
function onTalktc10(player) Show_tt(player,10); end

function help21(player,id)
	local x={["warrior"]="天之屠龙刀",["wizard"]="天之魔魂杖",["taoist"]="天之玄天剑"};
	if id == 1 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>首次充值大礼包</b></font>  领取条件: <font color="#ffff00">充值任意金额</font>
----------------------------------------------------
主要物品: 
----------------------------------------------------
<p>##四倍宝典##        <font color="#ffbbff">四倍打怪经验</font></p>
<p>##玛雅令牌##        <font color="#ffbbff">进入BOSS神殿</font></p>
<p>##天璇仙魄(70级)##  <font color="#ffbbff">直接提升一级</font></p>
<p>##]]..x[player:get_job_name()]..[[##      <font color="#ffbbff">初期高级武器</font></p>
<p>##聚灵珠(小)##      <font color="#ffbbff">快速升级道具</font></p>
<p>##首充元宝(2000)##  <font color="#ffbbff">2000绑定元宝</font></p>
<p>##首充金条(100万)## <font color="#ffbbff">100万绑定金币</font></p>
----------------------------------------------------
点击此处: <A href="]]..player:get_pay_url()..[[" target="_blank">点击此处充值</a>   <a href="event:talk_scczlb">领取首次充值礼包</a>
----------------------------------------------------]]);
	end
end

function onTalkscczlb(player)
	local x={["warrior"]="天之屠龙刀",["wizard"]="天之魔魂杖",["taoist"]="天之玄天剑"};
	if util.ppn(player,const.PP_SCCZLB) == 0 then
		if player:get_vcoin_accu() >= 1 then
			if player:num_bag_black() >= 8 then
				player:set_param(const.PP_SCCZLB,1);
				player:add_item_log("四倍宝典",211,1,1);
				player:add_item_log("玛雅令牌",211,1,1);
				player:add_item_log("天璇仙魄(70级)",211,1,1);
				player:add_item_log(x[player:get_job_name()],211,1,1);
				player:add_item_log("聚灵珠(小)",211,1,1);
				player:add_item_log("首充元宝(2000)",211,1,1);
				player:add_item_log("首充金条(100万)",211,1,1);
				server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]领取首次充值礼包!");
				player:alert(11,1,"恭喜您成功领取[首次充值礼包]<br>四倍宝典        数量:1<br>天璇仙魄(70级)  数量:1<br>"..x[player:get_job_name()].."      数量:1<br>聚灵珠(小)      数量:1<br>首充元宝(2000)  数量:1<br>首充金条(100万) 数量:1");
				Show_tt(player,1);
			else
				player:alert(1,1,"您的背包不足8格,您也不想这些好东西都掉下地吧!");
				Show_tt(player,1);
			end
		else
		player:alert(1,1,"只需要充值任意元宝即可领取该礼包!");
		Show_tt(player,1);
		end
	else
	player:alert(1,1,"对不起,您已经领取过首次充值礼包!");
	Show_tt(player,1);
	end
end


function help22(player,id)
	if id == 2 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>新区充值排名奖励</b></font>
----------------------------------------------------
已经开放: <font color="#ffff00">服务器当前开放第[<font color="#ff0000">]]..(tonumber(server_start_day())+1)..[[</font>]天</font>
----------------------------------------------------
<font color="#ffff00">开区前五天充值排名前三即可领取以下奖励:</font>

##镇国大将军链## 和 九级宝石*1  <font color="#EE82EE">第一名奖励</font>

##抚国大将军戒## 和 八级宝石*1  <font color="#EE82EE">第二名奖励</font>

##骠骑将军护腕## 和 七级宝石*1  <font color="#EE82EE">第三名奖励</font>

----------------------------------------------------
当前第一名: <font color="#FFFF00">]]..server.get_var("xqczpma1")..[[</font><font color="#FF0000">]]..server.get_var("xqczpmc1")..[[</font> <font color="#FFaa00">需累充50万元宝</font>
当前第二名: <font color="#FFFF00">]]..server.get_var("xqczpma2")..[[</font><font color="#FF0000">]]..server.get_var("xqczpmc2")..[[</font> <font color="#FFaa00">需累充30万元宝</font>
当前第三名: <font color="#FFFF00">]]..server.get_var("xqczpma3")..[[</font><font color="#FF0000">]]..server.get_var("xqczpmc3")..[[</font> <font color="#FFaa00">需累充10万元宝</font>
----------------------------------------------------
点此处领取: <a href="event:talk_lqczpmj">领取新区充值排名奖励</a>
----------------------------------------------------]]);
	end
end


function onTalklqczpmj(player)
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
	Show_tt(player,2);
end


function help23(player,id)
	if id == 3 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>新区充值大返利</b></font>
----------------------------------------------------
活动对象: 新区开放前五天的所有玩家
----------------------------------------------------
已经开放: <font color="#ffff00">服务器当前开放第[<font color="#ff0000">]]..(tonumber(server_start_day())+1)..[[</font>]天</font>
----------------------------------------------------
活动说明: <font color="#FFff00">为感谢各位玩家的厚爱,在新区开放五天内,
          充值的所有玩家将会获得服务器赠送[<font color="#ff0000">20%</font>]
          的元宝返利!</font>
----------------------------------------------------
累计返利: 当前累计充值返利[<font color="#FF0000">]]..util.ppn(player,const.PP_XQCZFL)..[[</font>]元宝
----------------------------------------------------
点击领取: <a href="event:talk_lqxqczfl">点击此处领取新区充值返利</a>
----------------------------------------------------]]);
	end
end


function onTalklqxqczfl(player)
	if util.ppn(player,const.PP_XQCZFL) >= 1 then
		player:add_vcoin_best_enable(util.ppn(player,const.PP_XQCZFL));
		player:alert(11,1,"恭喜您成功领取[新区充值返利]");
		player:alert(11,0,"获得元宝:<font color='#ff0000'>"..util.ppn(player,const.PP_XQCZFL).."</font>");
		player:set_param(const.PP_XQCZFL,0);
	else
	player:alert(1,1,"对不起,您当前没有累计到任何充值返利,无法领取!!");
	end
	Show_tt(player,3);
end


function help24(player,id)
	if id == 4 then
	if server.get_var("xqcjpmjl") == "" then
		server.set_var("xqcjpmjl",1);
		if tonumber(server_start_day()) <= 2 then
			server.set_var("xqcjjl50",1000);
			server.set_var("xqcjjl60",500);
			server.set_var("xqcjjl65",100);
			server.set_var("xqcjjl70",30);
			server.set_var("xqcjjl75",5);
			server.set_var("xqcjjl80",3);
		else
			server.set_var("xqcjjl50",0);
			server.set_var("xqcjjl60",0);
			server.set_var("xqcjjl65",0);
			server.set_var("xqcjjl70",0);
			server.set_var("xqcjjl75",0);
			server.set_var("xqcjjl80",0);
		end
	end
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>贺新区冲级大礼</b></font>
----------------------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
----------------------------------------------------
领取条件: <font color="#FFFF00">率先达到等级的玩家即可领取奖励!</font>
----------------------------------------------------
奖励说明:

<a href="event:talk_xqcjjl50">达到50级</a>: <font color="#FFBBFF">55级装备卷*1 绑定金币20万</font> 剩余: ]]..tonumber(server.get_var("xqcjjl50"))..[[/1000

<a href="event:talk_xqcjjl60">达到60级</a>: <font color="#FFBBFF">65级装备卷*1 玛雅令牌*1</font>   剩余: ]]..tonumber(server.get_var("xqcjjl60"))..[[/500

<a href="event:talk_xqcjjl65">达到65级</a>: <font color="#FFBBFF">70级装备卷*1 绑定元宝2000</font> 剩余: ]]..tonumber(server.get_var("xqcjjl65"))..[[/100

<a href="event:talk_xqcjjl70">达到70级</a>: <font color="#FFBBFF">75级装备卷*1 七级宝石*1</font>   剩余: ]]..tonumber(server.get_var("xqcjjl70"))..[[/30

<a href="event:talk_xqcjjl75">达到75级</a>: <font color="#FFBBFF">80级装备卷*1 八级宝石*1</font>   剩余: ]]..tonumber(server.get_var("xqcjjl75"))..[[/5

<a href="event:talk_xqcjjl80">达到80级</a>: <font color="#FFBBFF">85级装备卷*1 九级宝石*1</font>   剩余: ]]..tonumber(server.get_var("xqcjjl80"))..[[/3
----------------------------------------------------]]);
	end
end

function onTalkxqcjjl50(player)
	if player:get_level() >= 50 then
	if util.ppn(player,const.PP_XQCJJL50) == 0 then
		if tonumber(server.get_var("xqcjjl50")) >= 1 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_XQCJJL50,1);
				server.set_var("xqcjjl50",tonumber(server.get_var("xqcjjl50"))-1);
				player:add_item_log("[55级]装备卷",213,1);
				player:add_gamemoney_bind(200000);
				player:alert(11,1,"恭喜您领取50级冲级大礼!")
				player:alert(11,0,"获得物品:    <font color='#FF0000'>55级装备卷</font>")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>绑定金币20万</font>")
			else
			player:alert(1,1,"背包空格不足1格,无法领取!")
			end
		else
		player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
	player:alert(1,1,"您已经领取过该奖励!")
	end
	else
	player:alert(1,1,"对不起,您的等级不足50级!")
	end
	Show_tt(player,4);
end

function onTalkxqcjjl60(player)
	if player:get_level() >= 60 then
	if util.ppn(player,const.PP_XQCJJL60) == 0 then
		if tonumber(server.get_var("xqcjjl60")) >= 1 then
			if player:num_bag_black() >= 2 then
				player:set_param(const.PP_XQCJJL60,1);
				server.set_var("xqcjjl60",tonumber(server.get_var("xqcjjl60"))-1);
				player:add_item_log("[65级]装备卷",213,1);
				player:add_item_log("玛雅令牌",213,1);
				player:alert(11,1,"恭喜您领取60级冲级大礼!")
				player:alert(11,0,"获得物品:      <font color='#FF0000'>玛雅令牌</font>")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>[65级]装备卷</font>")
				if tonumber(server.get_var("xqcjjl60")) >= 1 then
					server.info(10,0,"玩家[<font color='#FF0000'>"..player:get_name().."</font>]在活动面板领取60级冲级奖励!目前还剩[<font color='#FF0000'>"..tonumber(server.get_var("xqcjjl60")).."</font>]个名额!")
				end
			else
			player:alert(1,1,"背包空格不足2格,无法领取!")
			end
		else
		player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
	player:alert(1,1,"您已经领取过该奖励!")
	end
	else
	player:alert(1,1,"对不起,您的等级不足60级!")
	end
	Show_tt(player,4);
end

function onTalkxqcjjl65(player)
	if player:get_level() >= 65 then
	if util.ppn(player,const.PP_XQCJJL65) == 0 then
		if tonumber(server.get_var("xqcjjl65")) >= 1 then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_XQCJJL65,1);
				server.set_var("xqcjjl65",tonumber(server.get_var("xqcjjl65"))-1);
				player:add_item_log("[70级]装备卷",213,1);
				player:add_vcoin_bind(2000);
				player:alert(11,1,"恭喜您领取65级冲级大礼!")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>[70级]装备卷</font>")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>绑定元宝2000</font>")
			else
			player:alert(1,1,"背包空格不足1格,无法领取!")
			end
		else
		player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
	player:alert(1,1,"您已经领取过该奖励!")
	end
	else
	player:alert(1,1,"对不起,您的等级不足65级!")
	end
	Show_tt(player,4);
end

function onTalkxqcjjl70(player)
	if player:get_level() >= 70 then
	if util.ppn(player,const.PP_XQCJJL70) == 0 then
		if tonumber(server.get_var("xqcjjl70")) >= 1 then
			if player:num_bag_black() >= 2 then
				player:set_param(const.PP_XQCJJL70,1);
				server.set_var("xqcjjl70",tonumber(server.get_var("xqcjjl70"))-1);
				player:add_item_log("[75级]装备卷",213,1);
				player:add_item_log("七级宝石",213,1);
				player:alert(11,1,"恭喜您领取70级冲级大礼!")
				player:alert(11,0,"获得物品:      <font color='#FF0000'>七级宝石</font>")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>[75级]装备卷</font>")
			else
			player:alert(1,1,"背包空格不足2格,无法领取!")
			end
		else
		player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
	player:alert(1,1,"您已经领取过该奖励!")
	end
	else
	player:alert(1,1,"对不起,您的等级不足70级!")
	end
	Show_tt(player,4);
end

function onTalkxqcjjl75(player)
	if player:get_level() >= 75 then
	if util.ppn(player,const.PP_XQCJJL75) == 0 then
		if tonumber(server.get_var("xqcjjl75")) >= 1 then
			if player:num_bag_black() >= 2 then
				player:set_param(const.PP_XQCJJL75,1);
				server.set_var("xqcjjl75",tonumber(server.get_var("xqcjjl75"))-1);
				player:add_item_log("[80级]装备卷",213,1);
				player:add_item_log("八级宝石",213,1);
				player:alert(11,1,"恭喜您领取75级冲级大礼!")
				player:alert(11,0,"获得物品:      <font color='#FF0000'>八级宝石</font>")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>[80级]装备卷</font>")
				server.info(10,0,"玩家[<font color='#FF0000'>"..player:get_name().."</font>]成功领取75级冲级奖励!获得:<font color='#FFaa00'>八级宝石和[80级]装备卷</font>!")
			else
			player:alert(1,1,"背包空格不足2格,无法领取!")
			end
		else
		player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
	player:alert(1,1,"您已经领取过该奖励!")
	end
	else
	player:alert(1,1,"对不起,您的等级不足75级!")
	end
	Show_tt(player,4);
end

function onTalkxqcjjl80(player)
	if player:get_level() >= 80 then
	if util.ppn(player,const.PP_XQCJJL80) == 0 then
		if tonumber(server.get_var("xqcjjl80")) >= 1 then
			if player:num_bag_black() >= 2 then
				player:set_param(const.PP_XQCJJL80,1);
				server.set_var("xqcjjl80",tonumber(server.get_var("xqcjjl80"))-1);
				player:add_item_log("[85级]装备卷",213,1);
				player:add_item_log("九级宝石",213,1);
				player:alert(11,1,"恭喜您领取80级冲级大礼!")
				player:alert(11,0,"获得物品:      <font color='#FF0000'>九级宝石</font>")
				player:alert(11,0,"获得物品:  <font color='#FF0000'>[85级]装备卷</font>")
				server.info(10000,0,"玩家["..player:get_name().."]成功领取80级冲级奖励!获得:九级宝石和[85级]装备卷!")
				server.info(10,0,"玩家[<font color='#FF0000'>"..player:get_name().."</font>]成功领取80级冲级奖励!获得:<font color='#FFaa00'>九级宝石和[85级]装备卷</font>!")
			else
			player:alert(1,1,"背包空格不足2格,无法领取!")
			end
		else
		player:alert(1,1,"对不起,该奖励可领取名额为0,无法领取!")
		end
	else
	player:alert(1,1,"您已经领取过该奖励!")
	end
	else
	player:alert(1,1,"对不起,您的等级不足80级!")
	end
	Show_tt(player,4);
end

function help25(player,id)
	if id == 5 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>全民升级乐翻天</b></font>
----------------------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
----------------------------------------------------
活动说明: <font color="#FFFF00">新区开放后达到等级的玩家即可领取奖励!</font>
----------------------------------------------------
活动奖励:

          <a href="event:talk_lqsjjl30">30级领取</a>: <font color="#FFBBFF">绑定金币100000</font>

          <a href="event:talk_lqsjjl40">40级领取</a>: <font color="#FFBBFF">绑定金币300000</font>

          <a href="event:talk_lqsjjl50">50级领取</a>: <font color="#FFBBFF">绑定元宝2000</font>

          <a href="event:talk_lqsjjl60">60级领取</a>: <font color="#FFBBFF">绑定元宝5000</font>

          <a href="event:talk_lqsjjl70">70级领取</a>: <font color="#FFBBFF">绑定元宝10000</font>

          <a href="event:talk_lqsjjl80">80级领取</a>: <font color="#FFBBFF">绑定元宝20000</font>
----------------------------------------------------]]);
	end
end


function onTalklqsjjl30(player)
	if player:get_level() >= 30 then
		if util.ppn(player,const.PP_SJJL30) == 0 then
			player:set_param(const.PP_SJJL30,1);
			player:add_gamemoney_bind(100000);
			player:alert(11,1,"领取30级奖励:<font color='#FF0000'>绑定金币100000</font>");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足30级!无法领取!")
	end
	Show_tt(player,5);
end


function onTalklqsjjl40(player)
	if player:get_level() >= 40 then
		if util.ppn(player,const.PP_SJJL40) == 0 then
			player:set_param(const.PP_SJJL40,1);
			player:add_gamemoney_bind(300000);
			player:alert(11,1,"领取40级奖励:<font color='#FF0000'>绑定金币300000</font>");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足40级!无法领取!")
	end
	Show_tt(player,5);
end


function onTalklqsjjl50(player)
	if player:get_level() >= 50 then
		if util.ppn(player,const.PP_SJJL50) == 0 then
			player:set_param(const.PP_SJJL50,1);
			player:add_vcoin_bind(2000);
			player:alert(11,1,"领取50级奖励:<font color='#FF0000'>绑定元宝2000</font>");
			server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]在活动面板<font color='#FF0000'>领取50级奖励</font>!");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足50级!无法领取!")
	end
	Show_tt(player,5);
end


function onTalklqsjjl60(player)
	if player:get_level() >= 60 then
		if util.ppn(player,const.PP_SJJL60) == 0 then
			player:set_param(const.PP_SJJL60,1);
			player:add_vcoin_bind(5000);
			player:alert(11,1,"领取60级奖励:<font color='#FF0000'>绑定元宝5000</font>");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足60级!无法领取!")
	end
	Show_tt(player,5);
end


function onTalklqsjjl70(player)
	if player:get_level() >= 70 then
		if util.ppn(player,const.PP_SJJL70) == 0 then
			player:set_param(const.PP_SJJL70,1);
			player:add_vcoin_bind(10000);
			player:alert(11,1,"领取70级奖励:<font color='#FF0000'>绑定元宝10000</font>");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足70级!无法领取!")
	end
	Show_tt(player,5);
end


function onTalklqsjjl80(player)
	if player:get_level() >= 80 then
		if util.ppn(player,const.PP_SJJL80) == 0 then
			player:set_param(const.PP_SJJL80,1);
			player:add_vcoin_bind(20000);
			player:alert(11,1,"领取80级奖励:<font color='#FF0000'>绑定元宝20000</font>");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足80级!无法领取!")
	end
	Show_tt(player,5);
end




function help26(player,id)
	if id == 6 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>新手卡豪华礼包</b></font>
----------------------------------------------------
主要物品: 
----------------------------------------------------
<p>##还魂丹##x1          <font color="#FFBBFF">原地复活道具</font></p>
<p>##招财神符##x1        <font color="#FFBBFF">绑定金币20万</font></p>
<p>##玛雅令牌##x1        <font color="#FFBBFF">进入BOSS神殿</font></p>
<p>##魔血石[50W]##x1     <font color="#FFBBFF">可恢复HP和MP</font></p>
<p>##疗伤药(包)##x5      <font color="#FFBBFF">瞬间恢复血量</font></p>
<p>##双倍宝典##x1        <font color="#FFBBFF">获得双倍经验</font></p>
----------------------------------------------------
领取礼包: <A href="]]..server.get_param_url(1)..[[" target="_blank">点击领取新手卡</a>       <a href="event:local_getgift">点击兑换激活码</a>
----------------------------------------------------]]);
	end
end


function help27(player,id)--第一天的[20:00]到[24:00]
	if id == 7 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>贺新区全服升级活动</b></font>
----------------------------------------------------
活动时间: <font color="#ffff00">新区开放第三天全天</font>
----------------------------------------------------
活动对象: <font color="#ffff00">所有玩家</font>
----------------------------------------------------
已经开放: <font color="#ffff00">服务器当前开放第[<font color="#ff0000">]]..(tonumber(server_start_day())+1)..[[</font>]天</font>
----------------------------------------------------
活动说明: <font color="#FFaa00">为感谢广大玩家对我们的支持!在新区开放
          之际,特别推出全服升级活动!

          打怪经验额外增加1倍,可别错过哦!</font>
----------------------------------------------------
          <font color="#FF0000">使用多倍宝典将会增加1倍经验!</font>
----------------------------------------------------]]);
	end
end


function help28(player,id)
	if id == 8 then
		if  server_open_day()  >= 15945 then
					player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>新区冲级排名奖励</b></font>
----------------------------------------------------
已经开放: <font color="#ffff00">服务器当前开放第[<font color="#ff0000">]]..(tonumber(server_start_day())+1)..[[</font>]天</font>
----------------------------------------------------
截止时间: <font color="#FFff00">新区开放第[4]天的中午12点</font>
----------------------------------------------------
奖励说明(综合等级与经验值进行排名): 
 <font color="#FFaa00">第一名:(10000元宝) ]]..(server.get_var("SvrLvRankName1")).."  等级 "..(server.get_var("SvrLvRankLv1"))..[[</br>
 第二名:(8000元宝)  ]]..(server.get_var("SvrLvRankName2")).."  等级 "..(server.get_var("SvrLvRankLv2"))..[[</br>
 第三名:(6000元宝)  ]]..(server.get_var("SvrLvRankName3")).."  等级 "..(server.get_var("SvrLvRankLv3"))..[[</br>
 第四名:(3000元宝)  ]]..(server.get_var("SvrLvRankName4")).."  等级 "..(server.get_var("SvrLvRankLv4"))..[[</br>
 第五名:(3000元宝)  ]]..(server.get_var("SvrLvRankName5")).."  等级 "..(server.get_var("SvrLvRankLv5"))..[[</br>
 第六名:(3000元宝)  ]]..(server.get_var("SvrLvRankName6")).."  等级 "..(server.get_var("SvrLvRankLv6"))..[[</br>
 第七名:(3000元宝)  ]]..(server.get_var("SvrLvRankName7")).."  等级 "..(server.get_var("SvrLvRankLv7"))..[[</br>
 第八名:(3000元宝)  ]]..(server.get_var("SvrLvRankName8")).."  等级 "..(server.get_var("SvrLvRankLv8"))..[[</br>
 第九名:(3000元宝)  ]]..(server.get_var("SvrLvRankName9")).."  等级 "..(server.get_var("SvrLvRankLv9"))..[[</br>
 第十名:(3000元宝)  ]]..(server.get_var("SvrLvRankName10")).."  等级 "..(server.get_var("SvrLvRankLv10"))..[[</br></font>
 <a href="event:talk_lvrankjl">在榜玩家领取奖励</a>
----------------------------------------------------]]);
		else
player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>新区冲级排名奖励</b></font>
----------------------------------------------------
已经开放: <font color="#ffff00">服务器当前开放第[<font color="#ff0000">]]..(tonumber(server_start_day())+1)..[[</font>]天</font>
----------------------------------------------------
截止时间: <font color="#FFff00">新区开放第[4]天的中午12点</font>
----------------------------------------------------
奖励说明: 
<font color="#FFaa00">根据截止时间的游戏等级排行榜名次奖励!
          第1名奖励:10000元宝
          第2名奖励:8000元宝
          第3名奖励:6000元宝
          第4-10名奖励:3000元宝</font>
----------------------------------------------------
          <font color="#FF0000">欢迎各位玩家踊跃参加本次活动!</font>
----------------------------------------------------]]);
		end
	end
end

local lv_jl={10000,8000,6000,3000,3000,3000,3000,3000,3000,3000}

function onTalklvrankjl(player)
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
          
--记录合区后5天内的充值
--等级排名问题 同一等级 先后顺序不固定
function levelrank_Recharge_process(player)
	local lv = player:get_level();
	if lv >= 10 then
		local a = player:get_name();
		local e = player:get_exp();
		for i = 1,11 do
			if a == server.get_var("SvrLvRankName"..i) then
				server.set_var("SvrLvRankLv"..i,lv);
				server.set_var("SvrLvRankExp"..i,e);
				levelrank_Recharge_chuli();
				return;
			end
		end
		if lv > util.svn("SvrLvRankLv11") then
			server.set_var("SvrLvRankName11",a);
			server.set_var("SvrLvRankLv11",lv);
			server.set_var("SvrLvRankExp11",e);
			levelrank_Recharge_chuli();
		end
	end
end

function levelrank_Recharge_chuli()
	local lvdata = {};
	for u = 1,11 do
		table.insert(lvdata,{
			name = server.get_var("SvrLvRankName"..u),
			num = util.svn("SvrLvRankLv"..u),
			nexp = util.svn("SvrLvRankExp"..u),
		})
	end
	function lvCompare(q,w) 
		if q and w then
			if tonumber(w.num) < tonumber(q.num) then
				return true;
			else
				if tonumber(w.num) == tonumber(q.num) then
					if tonumber(w.nexp) < tonumber(q.nexp) then
						return true;
					else
						return false;
					end
				else
					return false;
				end
			end
		end
		return false;
	end
	table.sort(lvdata,lvCompare);
	for idx,value in ipairs(lvdata) do
		server.set_var("SvrLvRankName"..idx,value.name);
		server.set_var("SvrLvRankLv"..idx,value.num);
		server.set_var("SvrLvRankExp"..idx,value.nexp);
	end
end

function freshLvRankInfo()
	for u = 1,11 do
		local name = server.get_var("SvrLvRankName"..u);
		local ranker = server.find_player(name);
		if ranker then
			levelrank_Recharge_process(ranker);
		end
	end
end

function help29(player,id)
	if id == 9 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>三魔兽逆袭王城</b></font>
----------------------------------------------------
活 动 一: <font color="#FFaa00">[<font color="#FFFF00">地魔兽</font>]将在开区第二天(13:30)带领魔界
          大军逆袭王城!消灭它将100%掉落盘古大神
          遗落神石[<font color="#FFFF00">骠骑将军护腕</font>]!千万别错过!</font>
----------------------------------------------------
<p>##骠骑将军护腕##</p>
----------------------------------------------------
活 动 二: <font color="#FFaa00">[<font color="#FFFF00">炎魔兽</font>]将在开区第三天(13:30)带领魔界
          大军逆袭王城!消灭它将100%掉落盘古大神
          遗落神石[<font color="#FFFF00">八级宝石</font>]!千万别错过!</font>
----------------------------------------------------
<p>##八级宝石##</p>
----------------------------------------------------
活 动 三: <font color="#FFaa00">[<font color="#FFFF00">暗魔兽</font>]将在开区第四天(13:30)带领魔界
          大军逆袭王城!消灭它将100%掉落盘古大神
          遗落神石[<font color="#FFFF00">九级宝石</font>]!千万别错过!</font>
----------------------------------------------------
<p>##九级宝石##</p>
----------------------------------------------------]]);
	end
end


function help210(player,id)
	if util.ppn(player,const.PP_CHONGZHIJIFEN_CHONGZHI) <= 0 then
		player:set_param(const.PP_CHONGZHIJIFEN_CHONGZHI,1);
		player:set_param(const.PP_CHONGZHIJIFEN,util.ppn(player,const.PP_CHONGZHIJIFEN_OLD));--将老的积分赋值到新的里面去
	end
	if id == 10 then
		player:echo([[---------------------------------------------------
您当前的充值总积分为: [<font color="#FF0000">]]..util.ppn(player,const.PP_CHONGZHIJIFEN)..[[</font>] 点
---------------------------------------------------
<font color="#FFFF00"><b>转 生 石</b></font>        需要充值积分:<font color="#FFff00">5点</font>          <a href="event:talk_lq0a">点击兑换</a>
---------------------------------------------------
<font color="#FFFF00"><b>转 生 石</b>*10</font>     需要充值积分:<font color="#FFff00">50点</font>         <a href="event:talk_lq0b">点击兑换</a>
---------------------------------------------------
<font color="#FFFF00"><b>五级宝石</b></font>        需要充值积分:<font color="#FFff00">30点</font>         <a href="event:talk_lq1a">点击兑换</a>
---------------------------------------------------
<font color="#FFFF00"><b>六级宝石</b></font>        需要充值积分:<font color="#FFff00">80点</font>         <a href="event:talk_lq2a">点击兑换</a>
---------------------------------------------------
<font color="#FFFF00"><b>七级宝石</b></font>        需要充值积分:<font color="#FFff00">200点</font>        <a href="event:talk_lq3a">点击兑换</a>
---------------------------------------------------
<font color="#FFFF00"><b>八级宝石</b></font>        需要充值积分:<font color="#FFff00">550点</font>        <a href="event:talk_lq4a">点击兑换</a>
---------------------------------------------------
<font color="#FFFF00"><b>九级宝石</b></font>        需要充值积分:<font color="#FFff00">1600点</font>       <a href="event:talk_lq5a">点击兑换</a>
---------------------------------------------------
<font color="#FF00ff"><b>六级灵羽</b></font>        需要充值积分:<font color="#FFff00">90点</font>         <a href="event:talk_lq6a">点击兑换</a>
---------------------------------------------------
<font color="#FF00ff"><b>七级灵羽</b></font>        需要充值积分:<font color="#FFff00">270点</font>        <a href="event:talk_lq7a">点击兑换</a>
---------------------------------------------------
<font color="#FF00ff"><b>八级灵羽</b></font>        需要充值积分:<font color="#FFff00">810点</font>        <a href="event:talk_lq8a">点击兑换</a>
---------------------------------------------------
]]);
	end
end



function onTalklq0a(player) jfdh(player,5,"转生石",1); end
function onTalklq0b(player) jfdh(player,50,"转生石",10); end
function onTalklq1a(player) jfdh(player,30,"五级宝石",1); end
function onTalklq2a(player) jfdh(player,80,"六级宝石",1); end
function onTalklq3a(player) jfdh(player,200,"七级宝石",1); end
function onTalklq4a(player) jfdh(player,550,"八级宝石",1); end
function onTalklq5a(player) jfdh(player,1600,"九级宝石",1); end
function onTalklq6a(player) jfdh(player,90,"六级灵羽",1); end
function onTalklq7a(player) jfdh(player,270,"七级灵羽",1); end
function onTalklq8a(player) jfdh(player,810,"八级灵羽",1); end
function onTalklq9a(player) jfdh(player,2430,"九级灵羽",1); end

function jfdh(player,a,b,c)
	if util.ppn(player,const.PP_CHONGZHIJIFEN) >= a then
		if player:num_bag_black() >= 2 then
			player:set_param(const.PP_CHONGZHIJIFEN,util.ppn(player,const.PP_CHONGZHIJIFEN)-a);
			player:add_item_log(b,214,c,1);
			player:alert(11,1,"使用["..a.."]积分兑换:<font color='#FF0000'>"..b.."*"..c.."</font>");
		else
			player:alert(1,1,"您的背包不足2格,您也不想这些好东西都掉下地吧!");
		end
	else
	player:alert(1,1,"此礼包需要充值积分达到"..a.."点方可领取");
	end
	Show_tt(player,10);
end






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

function help21_merg(player,id)
	if id==1 then
		player:echo([[----------------------------------------------------
活动名称: <font color="#FFFF00"><b>合区豪华大礼包</b></font>   领取条件: <font color="#ffff00">等级达到45级</font>

主要物品: 

<p>##绑定元宝##        <font color="#ffbbff">数量:2000</font></p>
<p>##绑定金币##        <font color="#ffbbff">数量:500000</font></p>
<p>##四倍宝典##        <font color="#ffbbff">数量:1</font></p>
<p>##玛雅令牌##        <font color="#ffbbff">数量:1</font></p>
<p>##魂石令牌(500)##   <font color="#ffbbff">数量:1</font></p>
<p>##坐骑经验丹(大)##  <font color="#ffbbff">数量:1</font></p>
<p>##荣誉令牌(10000)## <font color="#ffbbff">数量:1</font></p>

点击此处: <a href='event:talk_help2svrmeglibaoget'>领取合区豪华大礼包</a>
----------------------------------------------------]]);
	end
end
function onTalkhelp2svrmeglibaoget(player)
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
				player:add_item_log("四倍宝典",215,1,1);
				player:add_item_log("玛雅令牌",215,1,1);
				player:add_item_log("魂石令牌(500)",215,1,1);
				player:add_item_log("坐骑经验丹(大)",215,1,1);
				player:add_item_log("荣誉令牌(10000)",215,1,1);
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
	Show_tt(player,1);
end
function help22_merg(player,id)
	if id==2 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00"><b>合区充值排名奖励</b></font>

当前时间: <font color="#ffff00">服务器已经合区第[<font color="#ff0000">]]..(tonumber(server_merge_day()+1))..[[</font>]天</font>
---------------------------------------------------
<font color="#ffff00">合区前五天充值排名前三即可领取以下奖励:</font>

##镇国大将军链## 和 九级宝石*1  <font color="#ff0000">第一名奖励</font>

##抚国大将军戒## 和 八级宝石*1  <font color="#ff0000">第二名奖励</font>

##骠骑将军护腕## 和 七级宝石*1  <font color="#ff0000">第三名奖励</font>

---------------------------------------------------
当前第一名: <font color="#FFFF00">]]..server.get_var("svrmegcza1")..[[</font><font color="#FF0000">]]..server.get_var("svrmegczc1")..[[</font> <font color="#FFaa00">需累充50万元宝</font>
当前第二名: <font color="#FFFF00">]]..server.get_var("svrmegcza2")..[[</font><font color="#FF0000">]]..server.get_var("svrmegczc2")..[[</font> <font color="#FFaa00">需累充30万元宝</font>
当前第三名: <font color="#FFFF00">]]..server.get_var("svrmegcza3")..[[</font><font color="#FF0000">]]..server.get_var("svrmegczc3")..[[</font> <font color="#FFaa00">需累充10万元宝</font>

点此处领取: <a href='event:talk_help2svrmegchartaward'>领取合区充值排名奖励</a>
---------------------------------------------------]]);
	end
end
function onTalkhelp2svrmegchartaward(player)
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
						player:add_item_log("镇国大将军链",215,1);
						player:add_item_log("九级宝石",215,1);
						player:alert(11,1,"成功领取充值排名第一奖励!");
						player:alert(11,0,"镇国大将军链 数量:1");
						player:alert(11,0,"九级宝石     数量:1");
						Show_tt(player,2);
						return;
					else
						player:alert(1,1,"背包空格不足2格!无法领取!");
					end
				end
				if i == 2 then
					if player:num_bag_black() >= 2 then
						server.set_var("svrmegczc"..i,"已领取");
						player:add_item_log("抚国大将军戒",215,1);
						player:add_item_log("八级宝石",215,1);
						player:alert(11,1,"成功领取充值排名第二奖励!");
						player:alert(11,0,"抚国大将军戒 数量:1");
						player:alert(11,0,"八级宝石     数量:1");
						Show_tt(player,2);
						return;
					else
						player:alert(1,1,"背包空格不足2格!无法领取!");
					end
				end
				if i == 3 then
					if player:num_bag_black() >= 2 then
						server.set_var("svrmegczc"..i,"已领取");
						player:add_item_log("骠骑将军护腕",215,1);
						player:add_item_log("七级宝石",215,1);
						player:alert(11,1,"成功领取充值排名第二奖励!");
						player:alert(11,0,"骠骑将军护腕 数量:1");
						player:alert(11,0,"七级宝石     数量:1");
						Show_tt(player,2);
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
--记录合区后5天内的充值
function svrmeg_Recharge_process(player,price)
	if price then
		player:set_param(const.PP_SVRMEG_CONGZI,util.ppn(player,const.PP_SVRMEG_CONGZI)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_SVRMEG_CONGZI);
		for i = 1,4 do
			if a == server.get_var("svrmegcza"..i) then
				server.set_var("svrmegczb"..i,b);
				svrmeg_Recharge_chuli();
				return;
			end
		end
		if b > util.svn("svrmegczb4") then
			server.set_var("svrmegcza4",a);
			server.set_var("svrmegczb4",b);
			svrmeg_Recharge_chuli();
		end
		newgui.newhefu.fresh_newhfRank_info(player);
	end
end
function svrmeg_Recharge_chuli()
	local Recharge = {};
	for u = 1,4 do
		table.insert(Recharge,{
			name = server.get_var("svrmegcza"..u),
			num = util.svn("svrmegczb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("svrmegcza"..idx,value.name);
		server.set_var("svrmegczb"..idx,value.num);
	end
end

function player_svrmeg_congzi(player,add)
	if not is_merge_server() then return; end
	--reset_player_svrmeg_info(player);
	--resetmergeinfo(player);
	if server_merge_day() <= 4 then
		svrmeg_Recharge_process(player,add);
		player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,util.ppn(player,const.PP_SVRMEG_CONGZI_FANHUAN)+math.floor(add*0.2));
	end
end

function help23_merg(player,id)
	if id==3 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00"><b>合区充值大返利</b></font>

活动对象: 服务器合区前五天的所有玩家

当前时间: <font color="#ffff00">服务器已经合区第[<font color="#ff0000">]]..(tonumber(server_merge_day()+1))..[[</font>]天</font>

活动说明: <font color="#FFff00">为感谢各位玩家厚爱,在服务器合区前五天,
          充值的所有玩家将会获得服务器赠送[<font color="#ff0000">20%</font>]
          的元宝返利!</font>

累计返利: 当前累计充值返利[<font color="#FF0000">]]..util.ppn(player,const.PP_SVRMEG_CONGZI_FANHUAN)..[[</font>]元宝

点击领取: <a href='event:talk_help2svrmegczgiveback'>点击此处领取合区充值大返利</a>
---------------------------------------------------]]);
	end
end
function onTalkhelp2svrmegczgiveback(player)
	if not is_merge_server() then return; end
	reset_player_svrmeg_info(player);
	resetmergeinfo(player);
	local b = util.ppn(player,const.PP_SVRMEG_CONGZI_FANHUAN);
	if b > 0 then
		player:add_vcoin_best_enable(b);
		player:alert(11,1,"恭喜您成功领取[合区充值大返利]");
		player:alert(11,0,"获得元宝:<font color='#ff0000'>"..b.."</font>");
		player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);
	else
		player:alert(1,1,"对不起,您当前没有累计到任何充值返利,无法领取!!");
	end
	Show_tt(player,3);
end
