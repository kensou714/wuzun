module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[--------------------------------------
<font color="#FFaa00">您好,我是武尊的福利礼官!</font>
--------------------------------------
<font color="#FFaa00">请选择您想要领取的福利:</font>
--------------------------------------
<font color="#FFff00">游戏活动:</font>
--------------------------------------
           <a href="event:talk_fuli1">首次充值超值礼包</a> 
--------------------------------------
           <a href="event:talk_fuli2">新区升级超级大礼</a> 
--------------------------------------
<font color="#FFff00">游戏福利:</font>
]]);
	if ymd()<=20130613 then
npc:echo([[--------------------------------------
           <a href="event:talk_mrczpm">每日充值排名大奖</a>
]]);
	else
npc:echo([[--------------------------------------
           <a href="event:talk_mzczpm">每周充值排名大奖</a>
]]);
	end
npc:echo([[--------------------------------------
           <a href="event:talk_yxfl1">每日签到元宝奖励</a>
--------------------------------------
           <a href="event:talk_yxfl2">轻松在线免费领奖</a>
--------------------------------------
           <a href="event:talk_czjl1">充值免费成为红钻</a>
--------------------------------------
           <a href="event:local_getgift">点击此处激活礼包</a>
--------------------------------------
           <a href="event:talk_zsjnshc">点击合成高级技能</a>
--------------------------------------
           <a href="event:talk_hqxjbx">点击换取玄晶宝箱</a>
--------------------------------------
]]);
end

function onTalkhqxjbx(npc,player)
	reset_player_hqxjbx_info(player);
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">玄晶宝箱兑换列表</font></b>
--------------------------------------
##小型玄晶宝箱##            <a href="event:talk_hqxjbx1">点击兑换</a>
需要: <font color="#FF0000">进阶石*1000</font>             
--------------------------------------
##小型玄晶宝箱##            <a href="event:talk_hqxjbx2">点击兑换</a>
需要: <font color="#FF0000">坐骑经验丹(大)*40</font>
--------------------------------------
##小型玄晶宝箱##            <a href="event:talk_hqxjbx3">点击兑换</a>
需要: <font color="#FF0000">坐骑经验丹(中)*80</font>
--------------------------------------
##小型玄晶宝箱##            <a href="event:talk_hqxjbx4">点击兑换</a>
需要: <font color="#FF0000">坐骑经验丹(小)*400</font>
--------------------------------------
##小型玄晶宝箱##            <a href="event:talk_hqxjbx5">点击兑换</a>
需要: <font color="#FF0000">魂石*20000</font>
--------------------------------------
<font color="#ff0000">说明：</font>
<font color="#ffaa00">1、每种资源每日仅限兑换3次；</font>
<font color="#ffaa00">2、王族行会兑换所消耗的资源9折优惠！</font>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------]]);
end

function onTalkhqxjbx1(npc,player) xjbxhq(npc,player,1); end
function onTalkhqxjbx2(npc,player) xjbxhq(npc,player,2); end
function onTalkhqxjbx3(npc,player) xjbxhq(npc,player,3); end
function onTalkhqxjbx4(npc,player) xjbxhq(npc,player,4); end
function onTalkhqxjbx5(npc,player) xjbxhq(npc,player,5); end

function reset_player_hqxjbx_info(player)
	if util.ppn(player,const.PP_HQXJBX_DATE) ~= today() then
		player:set_param(const.PP_HQXJBX_DATE,today());
		player:set_param(const.PP_HQXJBX_T1,0);
		player:set_param(const.PP_HQXJBX_T2,0);
		player:set_param(const.PP_HQXJBX_T3,0);
		player:set_param(const.PP_HQXJBX_T4,0);
		player:set_param(const.PP_HQXJBX_T5,0);
	end
	return
end

function xjbxhq(npc,player,no)
	local xjhq_data={
		[1]={szItemName="进阶石",nNum=1000,nMax=3,nBagBlack=1,isBind=1,awardpcon = const.PP_HQXJBX_T1},
		[2]={szItemName="坐骑经验丹(大)",nNum=40,nMax=3,nBagBlack=1,isBind=1,awardpcon = const.PP_HQXJBX_T2},
		[3]={szItemName="坐骑经验丹(中)",nNum=80,nMax=3,nBagBlack=1,isBind=1,awardpcon = const.PP_HQXJBX_T3},
		[4]={szItemName="坐骑经验丹(小)",nNum=400,nMax=3,nBagBlack=1,isBind=1,awardpcon = const.PP_HQXJBX_T4},
		[5]={szItemName="魂石",nNum=20000,nMax=3,nBagBlack=1,isBind=1,awardpcon = const.PP_HQXJBX_T5},
	};
	local data = xjhq_data[no];

	if util.ppn(player, data.awardpcon) >= data.nMax then
		player:alert(11,1,"每人每天最多只可兑换"..data.nMax.."次!")
		onTalkhqxjbx(npc,player);
		return
	end
	local nPrice = data.nNum;

	local kg = player:get_guild();
	if kg ~= "" and kg == server.get_king_guild() then
		nPrice = nPrice*0.9;
	end
	local xydata = 0;
	if no >= 1 and no <= 4 then
		xydata = player:num_item(data.szItemName,111);
	elseif no == 5 then
		xydata = util.ppn(player,const.PP_HUNSHI);
	end
	if  xydata < nPrice then
		player:alert(11,1,"您的"..data.szItemName.."不足["..nPrice.."],无法兑换!");
		onTalkhqxjbx(npc,player);
		return
	end 

	if player:num_bag_black() < data.nBagBlack then
		player:alert(1,1,"对不起,您的背包空格不足"..data.nBagBlack.."格,无法兑换!")
		onTalkhqxjbx(npc,player);
		return
	end
	player:set_param(data.awardpcon, util.ppn(player,data.awardpcon)+1);
	if no >= 1 and no <= 4 then 
		player:remove_item(data.szItemName,nPrice);
	elseif no == 5 then
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-nPrice);
	end
	player:add_item("小型玄晶宝箱", 1, 1);
	player:alert(11,1,"成功使用["..nPrice.."]个["..data.szItemName.."]兑换小型玄晶宝箱!");
	onTalkhqxjbx(npc,player);
	return;
end


function onTalkzsjnshc(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">战士技能合成列表</font></b>
--------------------------------------
  <font color="#ffaa00">战士技能</font>     <a href="event:talk_fsjnshc">法师技能</a>     <a href="event:talk_dsjnshc">道士技能</a>
--------------------------------------
##破天斩(2级)##             <a href="event:talk_zsjn1">点击合成</a>
需要: <font color="#FF0000">破天斩(1级)*3,元宝*100</font>
--------------------------------------
##破天斩(3级)##             <a href="event:talk_zsjn2">点击合成</a>
需要: <font color="#FF0000">破天斩(2级)*3,元宝*100</font>
--------------------------------------
##奔雷剑法(1级)##           <a href="event:talk_zsjn3">点击合成</a>
需要: <font color="#FF0000">破天斩(3级)*3,元宝*100</font>
--------------------------------------
##奔雷剑法(2级)##           <a href="event:talk_zsjn4">点击合成</a>
需要: <font color="#FF0000">奔雷剑法(1级)*3,元宝*100</font>
--------------------------------------
##奔雷剑法(3级)##           <a href="event:talk_zsjn5">点击合成</a>
需要: <font color="#FF0000">奔雷剑法(2级)*3,元宝*100</font>
--------------------------------------
<font color="#ffaa00">高级技能书可在尸王殿的<font color="#ff0000">蚀骨尸王</font>处掉落</font>!
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end


function onTalkzsjn1(npc,player) gjjnshc(npc,player,"破天斩(1级)","破天斩(2级)",1); end
function onTalkzsjn2(npc,player) gjjnshc(npc,player,"破天斩(2级)","破天斩(3级)",1); end
function onTalkzsjn3(npc,player) gjjnshc(npc,player,"破天斩(3级)","奔雷剑法(1级)",1); end
function onTalkzsjn4(npc,player) gjjnshc(npc,player,"奔雷剑法(1级)","奔雷剑法(2级)",1); end
function onTalkzsjn5(npc,player) gjjnshc(npc,player,"奔雷剑法(2级)","奔雷剑法(3级)",1); end




function onTalkfsjnshc(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">法师技能合成列表</font></b>
--------------------------------------
  <a href="event:talk_zsjnshc">战士技能</a>     <font color="#ffaa00">法师技能</font>     <a href="event:talk_dsjnshc">道士技能</a>
--------------------------------------
##龙息气焰(2级)##           <a href="event:talk_fsjn1">点击合成</a>
需要: <font color="#FF0000">龙息气焰(1级)*3,元宝*100</font>
--------------------------------------
##龙息气焰(3级)##           <a href="event:talk_fsjn2">点击合成</a>
需要: <font color="#FF0000">龙息气焰(2级)*3,元宝*100</font>
--------------------------------------
##烈焰火雨(1级)##           <a href="event:talk_fsjn3">点击合成</a>
需要: <font color="#FF0000">龙息气焰(3级)*3,元宝*100</font>
--------------------------------------
##烈焰火雨(2级)##           <a href="event:talk_fsjn4">点击合成</a>
需要: <font color="#FF0000">烈焰火雨(1级)*3,元宝*100</font>
--------------------------------------
##烈焰火雨(3级)##           <a href="event:talk_fsjn5">点击合成</a>
需要: <font color="#FF0000">烈焰火雨(2级)*3,元宝*100</font>
--------------------------------------
<font color="#ffaa00">高级技能书可在尸王殿的<font color="#ff0000">蚀骨尸王</font>处掉落</font>!
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end


function onTalkfsjn1(npc,player) gjjnshc(npc,player,"龙息气焰(1级)","龙息气焰(2级)",2); end
function onTalkfsjn2(npc,player) gjjnshc(npc,player,"龙息气焰(2级)","龙息气焰(3级)",2); end
function onTalkfsjn3(npc,player) gjjnshc(npc,player,"龙息气焰(3级)","烈焰火雨(1级)",2); end
function onTalkfsjn4(npc,player) gjjnshc(npc,player,"烈焰火雨(1级)","烈焰火雨(2级)",2); end
function onTalkfsjn5(npc,player) gjjnshc(npc,player,"烈焰火雨(2级)","烈焰火雨(3级)",2); end




function onTalkdsjnshc(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">道士技能合成列表</font></b>
--------------------------------------
  <a href="event:talk_zsjnshc">战士技能</a>    <a href="event:talk_fsjnshc">法师技能</a>     <font color="#ffaa00">道士技能</font> 
--------------------------------------
##气功波(2级)##             <a href="event:talk_dsjn1">点击合成</a>
需要: <font color="#FF0000">气功波(1级)*3,元宝*100</font>
--------------------------------------
##气功波(3级)##             <a href="event:talk_dsjn2">点击合成</a>
需要: <font color="#FF0000">气功波(2级)*3,元宝*100</font>
--------------------------------------
##炎龙召唤(1级)##           <a href="event:talk_dsjn3">点击合成</a>
需要: <font color="#FF0000">气功波(3级)*3,元宝*100</font>
--------------------------------------
##炎龙召唤(2级)##           <a href="event:talk_dsjn4">点击合成</a>
需要: <font color="#FF0000">炎龙召唤(1级)*3,元宝*100</font>
--------------------------------------
##炎龙召唤(3级)##           <a href="event:talk_dsjn5">点击合成</a>
需要: <font color="#FF0000">炎龙召唤(2级)*3,元宝*100</font>
--------------------------------------
<font color="#ffaa00">高级技能书可在尸王殿的<font color="#ff0000">蚀骨尸王</font>处掉落</font>!
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end


function onTalkdsjn1(npc,player) gjjnshc(npc,player,"气功波(1级)","气功波(2级)",3); end
function onTalkdsjn2(npc,player) gjjnshc(npc,player,"气功波(2级)","气功波(3级)",3); end
function onTalkdsjn3(npc,player) gjjnshc(npc,player,"气功波(3级)","炎龙召唤(1级)",3); end
function onTalkdsjn4(npc,player) gjjnshc(npc,player,"炎龙召唤(1级)","炎龙召唤(2级)",3); end
function onTalkdsjn5(npc,player) gjjnshc(npc,player,"炎龙召唤(2级)","炎龙召唤(3级)",3); end

function gjjnshc(npc,player,a,b,c)
	if player:num_item(a,1) >= 3 then
		if player:get_vcoin() >= 100 then
			if player:num_bag_black() >= 1 then
				player:sub_vcoin(100,"jinenghc");
				player:remove_item(a,3);
				player:add_item(b,1);
				player:alert(11,1,"成功合成["..b.."]!");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法合成!");
			end
		else
			player:alert(11,1,"您的元宝不足[100],无法合成["..b.."]!");
		end
	else
		player:alert(11,1,"对不起,您没有3本["..a.."]无法合成["..b.."]!");
	end
	if c==1 then onTalkzsjnshc(npc,player); end
	if c==2 then onTalkfsjnshc(npc,player); end
	if c==3 then onTalkdsjnshc(npc,player); end
end


function onTalkmrczpm(npc,player)
	reset_player_mrczpm_info(player);
	npc:echo([[--------------------------------------
            <font color="#FFFF00">每日充值排名大奖</font>
--------------------------------------
活动截止时间: <font color="#FF0000">6月12日</font>
--------------------------------------
<font color="#ffff00">每日累计充值排名前三即可领取以下奖励:</font>

##九级宝石##   <font color="#EE82EE">第一名</font><font color="#FFaa00">(累充10万元宝)</font>

##八级宝石##   <font color="#EE82EE">第二名</font><font color="#FFaa00">(累充5万元宝)</font>

##七级宝石##   <font color="#EE82EE">第三名</font>

--------------------------------------
<font color="#EE799F">当前第一名: <font color="#FFFF00">]]..server.get_var("mrczpma1")..[[</font><font color="#FF0000">]]..server.get_var("mrczpmc1")..[[</font>
当前第二名: <font color="#FFFF00">]]..server.get_var("mrczpma2")..[[</font><font color="#FF0000">]]..server.get_var("mrczpmc2")..[[</font>
当前第三名: <font color="#FFFF00">]]..server.get_var("mrczpma3")..[[</font><font color="#FF0000">]]..server.get_var("mrczpmc3")..[[</font></font> 
--------------------------------------
<font color="#C0FF3E">昨天充值排名:</font>         <a href="event:talk_lqjl3">领取充值排名奖励</a>
<font color="#EE799F">昨天第一名: <font color="#FFFF00">]]..server.get_var("zrczpma1")..[[</font><font color="#FF0000">]]..server.get_var("zrczpmc1")..[[</font>
昨天第二名: <font color="#FFFF00">]]..server.get_var("zrczpma2")..[[</font><font color="#FF0000">]]..server.get_var("zrczpmc2")..[[</font>
昨天第三名: <font color="#FFFF00">]]..server.get_var("zrczpma3")..[[</font><font color="#FF0000">]]..server.get_var("zrczpmc3")..[[</font></font>
--------------------------------------
<font color="#FF0000">此活动最终解释权归官方所有</font>    <a href="event:talk_100">返回首页</a>
--------------------------------------]]);
end
function onTalklqjl3(npc,player)
--领取奖励
	local no_award=true;
	local a = player:get_name();
	for i = 1,3 do
		if a == server.get_var("zrczpma"..i) then
			if server.get_var("zrczpmc"..i) == "" then
				if i == 1 then
					if player:num_bag_black() >= 1 then
						server.set_var("zrczpmc"..i,"(已领取)");
						player:add_item("九级宝石",1,1);
						player:alert(11,1,"成功领取充值排名第一奖励!");
						player:alert(11,0,"九级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每日充值排名第一奖励:<font color='#FF0000'>九级宝石*1</font>");
						onTalkmrczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");
					end
				end
				if i == 2 then
					if player:num_bag_black() >= 1 then
						server.set_var("zrczpmc"..i,"(已领取)");
						player:add_item("八级宝石",1,1);
						player:alert(11,1,"成功领取充值排名第二奖励!");
						player:alert(11,0,"八级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每日充值排名第二奖励:<font color='#FF0000'>八级宝石*1</font>");
						onTalkmrczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");
					end
				end
				if i == 3 then
					if player:num_bag_black() >= 1 then
						server.set_var("zrczpmc"..i,"(已领取)");
						player:add_item("七级宝石",1,1);
						player:alert(11,1,"成功领取充值排名第三奖励!");
						player:alert(11,0,"七级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每日充值排名第三奖励:<font color='#FF0000'>七级宝石*1</font>");
						onTalkmrczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");
					end
				end
			else
				player:alert(1,1,"您已经领取过该奖励了!");
				no_award=false;--return;
			end
		end
	end
	for i = 1,3 do
		if a == server.get_var("qrczpma"..i) then
			if server.get_var("qrczpmc"..i) == "" then
				if i == 1 then
					if player:num_bag_black() >= 1 then
						server.set_var("qrczpmc"..i,"(已领取)");
						player:add_item("九级宝石",1,1);
						player:alert(11,0,"成功领取前天充值排名第一奖励!");
						player:alert(11,0,"九级宝石     数量:1");
						onTalkmrczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");
					end
				end
				if i == 2 then
					if player:num_bag_black() >= 1 then
						server.set_var("qrczpmc"..i,"(已领取)");
						player:add_item("八级宝石",1,1);
						player:alert(11,0,"成功领取前天充值排名第二奖励!");
						player:alert(11,0,"八级宝石     数量:1");
						onTalkmrczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");
					end
				end
				if i == 3 then
					if player:num_bag_black() >= 1 then
						server.set_var("qrczpmc"..i,"(已领取)");
						player:add_item("七级宝石",1,1);
						player:alert(11,0,"成功领取前天充值排名第二奖励!");
						player:alert(11,0,"七级宝石     数量:1");
						onTalkmrczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");
					end
				end
			else
				player:alert(1,1,"您已经领取过该奖励了!");
				no_award=false;--return;
			end
		end
	end
	if no_award then
		player:alert(1,1,"由于您不在排名中,无法领取奖励!");
	end
	onTalkmrczpm(npc,player);
end
function reset_server_mrczpm_info()
	if util.svn("mrczpmtag") ~= today() then
		server.set_var("mrczpmtag",today());

		server.set_var("qrczpma1",server.get_var("zrczpma1"));
		server.set_var("qrczpma2",server.get_var("zrczpma2"));
		server.set_var("qrczpma3",server.get_var("zrczpma3"));
		server.set_var("qrczpmb1",server.get_var("zrczpmb1"));
		server.set_var("qrczpmb2",server.get_var("zrczpmb2"));
		server.set_var("qrczpmb3",server.get_var("zrczpmb3"));
		server.set_var("qrczpmc1",server.get_var("zrczpmc1"));
		server.set_var("qrczpmc2",server.get_var("zrczpmc2"));
		server.set_var("qrczpmc3",server.get_var("zrczpmc3"));

		server.set_var("zrczpma1",server.get_var("mrczpma1"));
		server.set_var("zrczpma2",server.get_var("mrczpma2"));
		server.set_var("zrczpma3",server.get_var("mrczpma3"));
		server.set_var("zrczpmb1",server.get_var("mrczpmb1"));
		server.set_var("zrczpmb2",server.get_var("mrczpmb2"));
		server.set_var("zrczpmb3",server.get_var("mrczpmb3"));
		server.set_var("zrczpmc1",server.get_var("mrczpmc1"));
		server.set_var("zrczpmc2",server.get_var("mrczpmc2"));
		server.set_var("zrczpmc3",server.get_var("mrczpmc3"));

		server.set_var("mrczpma1","");
		server.set_var("mrczpma2","");
		server.set_var("mrczpma3","");
		server.set_var("mrczpma4","");
		server.set_var("mrczpmb1",99999);
		server.set_var("mrczpmb2",49999);
		server.set_var("mrczpmb3",0);
		server.set_var("mrczpmb4",0);
		server.set_var("mrczpmc1","");
		server.set_var("mrczpmc2","");
		server.set_var("mrczpmc3","");
	end
end

function reset_player_mrczpm_info(player)
	if util.ppn(player,const.PP_MRCZPM_TAG) ~= today() then
		player:set_param(const.PP_MRCZPM_TAG,today());
		player:set_param(const.PP_MRCZPM_CONGZI,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end
--记录合区后5天内的充值
function mrczpm_Recharge_process(player,price)
	if price then
		player:set_param(const.PP_MRCZPM_CONGZI,util.ppn(player,const.PP_MRCZPM_CONGZI)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_MRCZPM_CONGZI);
		for i = 1,4 do
			if a == server.get_var("mrczpma"..i) then
				server.set_var("mrczpmb"..i,b);
				mrczpm_Recharge_chuli();
				mrczpm_Recharge_chuli();
				return;
			end
		end
		if b > util.svn("mrczpmb4") then
			server.set_var("mrczpma4",a);
			server.set_var("mrczpmb4",b);
			mrczpm_Recharge_chuli();
			mrczpm_Recharge_chuli();
		end
	end
end
function mrczpm_Recharge_chuli()
	local Recharge = {};
	for u = 1,4 do
		table.insert(Recharge,{
			name = server.get_var("mrczpma"..u),
			num = util.svn("mrczpmb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("mrczpma"..idx,value.name);
		server.set_var("mrczpmb"..idx,value.num);
	end
	if "" == server.get_var("mrczpma2") then
		server.set_var("mrczpmb2",49999);
	end
	if "" == server.get_var("mrczpma3") then
		server.set_var("mrczpmb3",0);
	end
	if "" == server.get_var("mrczpma4") then
		server.set_var("mrczpmb4",0);
	end
end
function player_mrczpm_congzi(player,add)
	reset_server_mrczpm_info();
	reset_player_mrczpm_info(player);
	mrczpm_Recharge_process(player,add);
end

function onTalkczjl1(npc,player)
	npc:echo([[--------------------------------------
<font color="#FFFF00">红钻[VIP]说明:</font>可点亮角色框红钻图标!
--------------------------------------
<font color="#ff0000">注:如红钻等级与充值金额不符,请重新登录</font>
--------------------------------------
充值达到<font color="#FFFF00">100元宝</font>       成为<font color="#ff0000"><a href="event:talk_hongzuan1">红钻[1级]</a></font>
充值达到<font color="#FFFF00">10000元宝</font>     成为<font color="#ff0000"><a href="event:talk_hongzuan2">红钻[2级]</a></font>
充值达到<font color="#FFFF00">50000元宝</font>     成为<font color="#ff0000"><a href="event:talk_hongzuan3">红钻[3级]</a></font>
充值达到<font color="#FFFF00">100000元宝</font>    成为<font color="#ff0000"><a href="event:talk_hongzuan4">红钻[4级]</a></font>
充值达到<font color="#FFFF00">300000元宝</font>    成为<font color="#ff0000"><a href="event:talk_hongzuan5">红钻[5级]</a></font>
充值达到<font color="#FFFF00">500000元宝</font>    成为<font color="#ff0000"><a href="event:talk_hongzuan6">红钻[6级]</a></font>
充值达到<font color="#FFFF00">1000000元宝</font>   成为<font color="#ff0000"><a href="event:talk_hongzuan7">红钻[7级]</a></font>
充值达到<font color="#FFFF00">3000000元宝</font>   成为<font color="#ff0000"><a href="event:talk_hongzuan8">红钻[8级]</a></font>
充值达到<font color="#FFFF00">5000000元宝</font>   成为<font color="#ff0000"><a href="event:talk_hongzuan9">红钻[9级]</a></font>
充值达到<font color="#FFFF00">10000000元宝</font>  成为<font color="#ff0000"><a href="event:talk_hongzuan10">红钻[10级]</a></font>
--------------------------------------
<font color="#FFFF00">您已经累计充值:</font>]]..player:get_vcoin_accu()..[[元宝
--------------------------------------
                            <a href="event:talk_100">返回首页</a>
--------------------------------------]]);
end



function onTalkhongzuan1(npc,player)
	player:alert(11,1,"成为[1级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:3-5");
	player:alert(11,0,"魔法防御增加:2-3");
	player:alert(11,0,"物理攻击增加:6-10");
	player:alert(11,0,"魔法攻击增加:6-10");
	player:alert(11,0,"道术攻击增加:6-10");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan2(npc,player)
	player:alert(11,1,"成为[2级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:6-10");
	player:alert(11,0,"魔法防御增加:4-6");
	player:alert(11,0,"物理攻击增加:12-20");
	player:alert(11,0,"魔法攻击增加:12-20");
	player:alert(11,0,"道术攻击增加:12-20");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan3(npc,player)
	player:alert(11,1,"成为[3级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:12-20");
	player:alert(11,0,"魔法防御增加:8-12");
	player:alert(11,0,"物理攻击增加:24-40");
	player:alert(11,0,"魔法攻击增加:24-40");
	player:alert(11,0,"道术攻击增加:24-40");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan4(npc,player)
	player:alert(11,1,"成为[4级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:18-30");
	player:alert(11,0,"魔法防御增加:12-18");
	player:alert(11,0,"物理攻击增加:36-60");
	player:alert(11,0,"魔法攻击增加:36-60");
	player:alert(11,0,"道术攻击增加:36-60");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan5(npc,player)
	player:alert(11,1,"成为[5级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:30-50");
	player:alert(11,0,"魔法防御增加:20-30");
	player:alert(11,0,"物理攻击增加:60-100");
	player:alert(11,0,"魔法攻击增加:60-100");
	player:alert(11,0,"道术攻击增加:60-100");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan6(npc,player)
	player:alert(11,1,"成为[6级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:42-70");
	player:alert(11,0,"魔法防御增加:28-42");
	player:alert(11,0,"物理攻击增加:84-140");
	player:alert(11,0,"魔法攻击增加:84-140");
	player:alert(11,0,"道术攻击增加:84-140");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan7(npc,player)
	player:alert(11,1,"成为[7级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:60-100");
	player:alert(11,0,"魔法防御增加:40-60");
	player:alert(11,0,"物理攻击增加:120-200");
	player:alert(11,0,"魔法攻击增加:120-200");
	player:alert(11,0,"道术攻击增加:120-200");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan8(npc,player)
	player:alert(11,1,"成为[8级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:84-140");
	player:alert(11,0,"魔法防御增加:56-84");
	player:alert(11,0,"物理攻击增加:168-280");
	player:alert(11,0,"魔法攻击增加:168-280");
	player:alert(11,0,"道术攻击增加:168-280");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan9(npc,player)
	player:alert(11,1,"成为[9级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:114-190");
	player:alert(11,0,"魔法防御增加:76-114");
	player:alert(11,0,"物理攻击增加:228-380");
	player:alert(11,0,"魔法攻击增加:228-380");
	player:alert(11,0,"道术攻击增加:228-380");
	onTalkczjl1(npc,player);
end

function onTalkhongzuan10(npc,player)
	player:alert(11,1,"成为[10级]红钻状态属性如下:");
	player:alert(11,0,"物理防御增加:150-250");
	player:alert(11,0,"魔法防御增加:100-150");
	player:alert(11,0,"物理攻击增加:300-500");
	player:alert(11,0,"魔法攻击增加:300-500");
	player:alert(11,0,"道术攻击增加:300-500");
	onTalkczjl1(npc,player);
end


function onTalkyxfl2(npc,player)
	npc:echo([[--------------------------------------
            <font color="#FFFF00">轻松在线免费领奖</font>
--------------------------------------
<font color="#FFaa00">活动对象</font>: 所有玩家
--------------------------------------
<font color="#FFaa00">活动内容</font>: 每天登陆武尊,在线达到一定时
          间,即可领取奖励!
--------------------------------------
<font color="#FFaa00">已连续在线</font>:  [<font color="#FF0000">]]..math.floor(player:get_online_time_today()/60)..[[</font>] 分钟
--------------------------------------
<font color="#FFaa00">在线60分钟</font>:  <font color="#FFFF00">绑定金币30万</font>     <a href="event:talk_zxjl60">领取奖励</a>
--------------------------------------
<font color="#FFaa00">在线120分钟</font>: <font color="#FFFF00">荣誉值*5000</font>      <a href="event:talk_zxjl120">领取奖励</a>
--------------------------------------
<font color="#FFaa00">在线240分钟</font>: <font color="#FFFF00">坐骑经验丹(大)</font>   <a href="event:talk_zxjl240">领取奖励</a>
--------------------------------------
<font color="#FFaa00">在线360分钟</font>: <font color="#FFFF00">魂石*500</font>         <a href="event:talk_zxjl360">领取奖励</a>
--------------------------------------
<font color="#FFaa00">在线480分钟</font>: <font color="#FFFF00">绑定元宝*1000</font>    <a href="event:talk_zxjl480">领取奖励</a>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------]]);
end

function onTalkzxjl480(npc,player)
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
	onTalkyxfl2(npc,player);
end

function onTalkzxjl360(npc,player)
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
	onTalkyxfl2(npc,player);
end

function onTalkzxjl240(npc,player)
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
	onTalkyxfl2(npc,player);
end

function onTalkzxjl120(npc,player)
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
	onTalkyxfl2(npc,player);
end

function onTalkzxjl60(npc,player)
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
	onTalkyxfl2(npc,player);
end

function onTalkfuli2(npc,player)
		npc:echo([[--------------------------------------
活动名称: <font color="#FFFF00"><b>全民升级乐翻天</b></font>
--------------------------------------
活动对象: <font color="#FFFF00">所有玩家</font>
--------------------------------------
活动说明: <font color="#FFFF00">新区开放后达到等级的玩家!</font>
--------------------------------------
<a href="event:talk_lqsjjl30">30级领取</a>: <font color="#FFaa00">绑定金币100000</font>
--------------------------------------
<a href="event:talk_lqsjjl40">40级领取</a>: <font color="#FFaa00">绑定金币300000</font>
--------------------------------------
<a href="event:talk_lqsjjl50">50级领取</a>: <font color="#FFaa00">绑定元宝2000</font>
--------------------------------------
<a href="event:talk_lqsjjl60">60级领取</a>: <font color="#FFaa00">绑定元宝5000</font>
--------------------------------------
<a href="event:talk_lqsjjl70">70级领取</a>: <font color="#FFaa00">绑定元宝10000</font>
--------------------------------------
<a href="event:talk_lqsjjl80">80级领取</a>: <font color="#FFaa00">绑定元宝20000</font>
--------------------------------------
<font color="#FFFF00">以上活动奖励每人只可领取一次!</font>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end



function onTalklqsjjl30(npc,player)
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
	onTalkfuli2(npc,player);
end


function onTalklqsjjl40(npc,player)
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
	onTalkfuli2(npc,player);
end


function onTalklqsjjl50(npc,player)
	if player:get_level() >= 50 then
		if util.ppn(player,const.PP_SJJL50) == 0 then
			player:set_param(const.PP_SJJL50,1);
			player:add_vcoin_bind(2000);
			player:alert(11,1,"领取50级奖励:<font color='#FF0000'>绑定元宝2000</font>");
			server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]在土城福利礼官<font color='#FF0000'>领取50级奖励</font>!");
		else
		player:alert(1,1,"对不起,该奖励只可领取1次!");
		end
	else
		player:alert(1,1,"对不起,您的等级不足50级!无法领取!")
	end
	onTalkfuli2(npc,player);
end


function onTalklqsjjl60(npc,player)
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
	onTalkfuli2(npc,player);
end


function onTalklqsjjl70(npc,player)
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
	onTalkfuli2(npc,player);
end


function onTalklqsjjl80(npc,player)
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
	onTalkfuli2(npc,player);
end


function onTalkfuli1(npc,player)
	local x={["warrior"]="天之屠龙刀",["wizard"]="天之魔魂杖",["taoist"]="天之玄天剑"};
		npc:echo([[--------------------------------------
活动名称: <font color="#FFFF00"><b>首次充值大礼包</b></font>
--------------------------------------
领取条件: <font color="#ffff00">充值任意金额</font>
--------------------------------------
主要物品: 

<p>##天璇仙魄(70级)##  <font color="#ff0000">70级前可提升一级</font></p>
<p>##]]..x[player:get_job_name()]..[[##      <font color="#ff0000">前期特别重要武器</font></p>
<p>##四倍宝典##        <font color="#ff0000">获得四倍打怪经验</font></p>
<p>##玛雅令牌##        <font color="#ff0000">双倍爆率BOSS神殿</font></p>
<p>##聚灵珠(小)##      <font color="#ff0000">每3只怪爆1次经验</font></p>
<p>##首充元宝(2000)##  <font color="#ff0000">获得2000绑定元宝</font></p>
<p>##首充金条(100万)## <font color="#ff0000">兑100万绑定金币!</font></p>
--------------------------------------
点击此处: <a href="event:talk_scczlb">领取首充礼包</a>    <A href="]]..player:get_pay_url()..[[" target="_blank">点击此处充值</a>
--------------------------------------]]);
end


function onTalkscczlb(npc,player)
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
	onTalkfuli1(npc,player)
end
--每日登录福利
function get_qiandao_fuli_num(player)
	return 500+ 100 * math.min(5,math.max(0,util.ppn(player,const.PP_QIANDAO_DAY_NUM)) );
end
function onTalkyxfl1(npc,player)
	--模拟昨天已经登录过 	player:set_param(const.PP_QIANDAO_DAY,today()-2);
	--模拟今日已充值 	player:set_param(const.PP_QIANDAO_CZ_TAG,util.ppn(player,const.PP_QIANDAO_CZ_TAG)+10);
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
	npc:echo([[--------------------------------------
活动名称: <font color="#FFFF00"><b>每日签到元宝奖励</b></font>
--------------------------------------
<font color="#FFaa00">连续签到奖励说明:</font>
--------------------------------------
<font color="#FFaa00">连续签到[1]天奖励: <font color="#FF0000">500绑定元宝</font>
连续签到[2]天奖励: <font color="#FF0000">600绑定元宝</font>
连续签到[3]天奖励: <font color="#FF0000">700绑定元宝</font>
连续签到[4]天奖励: <font color="#FF0000">800绑定元宝</font>
连续签到[5]天奖励: <font color="#FF0000">900绑定元宝</font>
连续签到[6]天以上: <font color="#FF0000">1000绑定元宝</font></font>
--------------------------------------
<font color="#FF0000">中途中断签到,将会自动从[0]天开始计算!</font>
--------------------------------------
]]);
	if util.ppn(player,const.PP_QIANDAO_QU1) ~= 0 or util.ppn(player,const.PP_QIANDAO_QU2) ~= 0 then
		npc:echo([[您已经连续签到: [<font color="#FF0000">]]..util.ppn(player,const.PP_QIANDAO_DAY_NUM) +1 ..[[</font>] 天<br>]]);
	else
		npc:echo([[您已经连续签到: [<font color="#FF0000">]]..util.ppn(player,const.PP_QIANDAO_DAY_NUM) ..[[</font>] 天<br>]]);
	end
	npc:echo([[--------------------------------------
今日可领取签到奖励: <font color="#FF0000">]].. get_qiandao_fuli_num(player)..[[绑定元宝</font>
--------------------------------------
              <a href='event:talk_qiandaoqu1'>点击此处签到并且领取奖励</a>
--------------------------------------
              <a href='event:talk_qiandaoqu2'>充值任意金额再次领取奖励</a>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end

function onTalkqiandaoqu1(npc,player)
	if util.ppn(player,const.PP_QIANDAO_QU1) == 0 then
		player:set_param(const.PP_QIANDAO_QU1,1);
		player:add_vcoin_bind(get_qiandao_fuli_num(player));
		player:alert(11,1,"领取今日签到福利:<font color='#FF0000'>"..get_qiandao_fuli_num(player).."绑定元宝</font>");
		server.info(100,1,"<font color='#FF0000'>["..player:get_name().."]在福利礼官领取签到奖励!</font>")
	else
		player:alert(1,1,"签到福利每天只可以领取一次哦!");
	end
	onTalkyxfl1(npc,player);
end
function onTalkqiandaoqu2(npc,player)
	if util.ppn(player,const.PP_QIANDAO_CZ_TAG) > 0 then
		if util.ppn(player,const.PP_QIANDAO_QU2) == 0 then
			player:set_param(const.PP_QIANDAO_QU2,1);
			player:add_vcoin_bind(get_qiandao_fuli_num(player));
			player:alert(11,1,"领取充值签到福利:<font color='#FF0000'>"..get_qiandao_fuli_num(player).."绑定元宝</font>");
		else
			player:alert(1,1,"充值签到福利每天只可以领取一次哦!");
		end
	else
		player:alert(1,1,"只需充值任意金额即可领取充值签到福利!");
	end
	onTalkyxfl1(npc,player);
end

function onTalkmzczpm(npc,player)
	reset_player_mzczpm_info(player);
	npc:echo([[--------------------------------------
            <font color="#FFFF00">每周充值排名大奖</font>
--------------------------------------
<font color="#ffff00">每周累计充值排名前三即可领取以下奖励:</font>

##十级宝石##   <font color="#EE82EE">第一名</font><font color="#FFaa00">(累充50万元宝)</font>

##九级宝石##   <font color="#EE82EE">第二名</font><font color="#FFaa00">(累充30万元宝)</font>

##八级宝石##   <font color="#EE82EE">第三名</font><font color="#FFaa00">(累充10万元宝)</font>

--------------------------------------
<font color="#EE799F">当前第一名: <font color="#FFFF00">]]..server.get_var("mzczpma1")..[[</font><font color="#FF0000">]]..server.get_var("mzczpmc1")..[[</font>
当前第二名: <font color="#FFFF00">]]..server.get_var("mzczpma2")..[[</font><font color="#FF0000">]]..server.get_var("mzczpmc2")..[[</font>
当前第三名: <font color="#FFFF00">]]..server.get_var("mzczpma3")..[[</font><font color="#FF0000">]]..server.get_var("mzczpmc3")..[[</font></font> 
--------------------------------------
<font color="#C0FF3E">上周充值排名:</font>         <a href="event:talk_mzczlqjl3">领取充值排名奖励</a>
<font color="#EE799F">上周第一名: <font color="#FFFF00">]]..server.get_var("szczpma1")..[[</font><font color="#FF0000">]]..server.get_var("szczpmc1")..[[</font>
上周第二名: <font color="#FFFF00">]]..server.get_var("szczpma2")..[[</font><font color="#FF0000">]]..server.get_var("szczpmc2")..[[</font>
上周第三名: <font color="#FFFF00">]]..server.get_var("szczpma3")..[[</font><font color="#FF0000">]]..server.get_var("szczpmc3")..[[</font></font>
--------------------------------------
<font color="#C0FF3E">本周已经充值:</font> ]]..util.ppn(player,const.PP_MZCZPM_CONGZI)..[[ 元宝
--------------------------------------
<font color="#FF0000">此活动最终解释权归官方所有</font>    <a href="event:talk_100">返回首页</a>
--------------------------------------]]);
end
function onTalkmzczlqjl3(npc,player)
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
						onTalkmzczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");onTalkmzczpm(npc,player);return;
					end
				end
				if i == 2 then
					if player:num_bag_black() >= 1 then
						server.set_var("szczpmc"..i,"(已领取)");
						player:add_item("九级宝石",1,1);
						player:alert(11,1,"成功领取每周充值排名第二奖励!");
						player:alert(11,0,"九级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每周充值排名第二奖励:<font color='#FF0000'>九级宝石*1</font>");
						onTalkmzczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");onTalkmzczpm(npc,player);return;
					end
				end
				if i == 3 then
					if player:num_bag_black() >= 1 then
						server.set_var("szczpmc"..i,"(已领取)");
						player:add_item("八级宝石",1,1);
						player:alert(11,1,"成功领取每周充值排名第三奖励!");
						player:alert(11,0,"八级宝石     数量:1");
						server.info(10,1,"恭喜[<font color='#FF0000'>"..player:get_name().."</font>]成功领取每周充值排名第三奖励:<font color='#FF0000'>八级宝石*1</font>");
						onTalkmzczpm(npc,player);
						return;
					else
						player:alert(1,1,"背包空格不足1格!无法领取!");onTalkmzczpm(npc,player);return;
					end
				end
			else
				player:alert(1,1,"您已经领取过该奖励了!");
				no_award=false;--return;
			end
		end
	end
	if no_award then
		player:alert(1,1,"由于您不在排名中,无法领取奖励!");
	end
	onTalkmzczpm(npc,player);
end
function reset_server_mzczpm_info()
	if util.svn("mzczpmtag") ~= week() then
		server.set_var("mzczpmtag",week());

		server.set_var("szczpma1",server.get_var("mzczpma1"));
		server.set_var("szczpma2",server.get_var("mzczpma2"));
		server.set_var("szczpma3",server.get_var("mzczpma3"));
		server.set_var("szczpmb1",server.get_var("mzczpmb1"));
		server.set_var("szczpmb2",server.get_var("mzczpmb2"));
		server.set_var("szczpmb3",server.get_var("mzczpmb3"));
		server.set_var("szczpmc1",server.get_var("mzczpmc1"));
		server.set_var("szczpmc2",server.get_var("mzczpmc2"));
		server.set_var("szczpmc3",server.get_var("mzczpmc3"));

		server.set_var("mzczpma1","");
		server.set_var("mzczpma2","");
		server.set_var("mzczpma3","");
		server.set_var("mzczpma4","");
		server.set_var("mzczpmb1",499999);
		server.set_var("mzczpmb2",299999);
		server.set_var("mzczpmb3",99999);
		server.set_var("mzczpmb4",0);
		server.set_var("mzczpmc1","");
		server.set_var("mzczpmc2","");
		server.set_var("mzczpmc3","");
	end
end

function reset_player_mzczpm_info(player)
	if util.ppn(player,const.PP_MZCZPM_TAG) ~= week() then
		player:set_param(const.PP_MZCZPM_TAG,week());
		player:set_param(const.PP_MZCZPM_CONGZI,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end

function player_mzczpm_congzi(player,add)
	reset_server_mzczpm_info();
	reset_player_mzczpm_info(player);
	mzczpm_Recharge_process(player,add);
end

function mzczpm_Recharge_process(player,price)
	if price then
		player:set_param(const.PP_MZCZPM_CONGZI,util.ppn(player,const.PP_MZCZPM_CONGZI)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_MZCZPM_CONGZI);
		for i = 1,4 do
			if a == server.get_var("mzczpma"..i) then
				server.set_var("mzczpmb"..i,b);
				mzczpm_Recharge_chuli();
				mzczpm_Recharge_chuli();
				return;
			end
		end
		if b > util.svn("mzczpmb4") then
			server.set_var("mzczpma4",a);
			server.set_var("mzczpmb4",b);
			mzczpm_Recharge_chuli();
			mzczpm_Recharge_chuli();
		end
	end
end
function mzczpm_Recharge_chuli()
	local Recharge = {};
	for u = 1,4 do
		table.insert(Recharge,{
			name = server.get_var("mzczpma"..u),
			num = util.svn("mzczpmb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("mzczpma"..idx,value.name);
		server.set_var("mzczpmb"..idx,value.num);
	end
	if "" == server.get_var("mzczpma2") then
		server.set_var("mzczpmb2",299999);
	end
	if "" == server.get_var("mzczpma3") then
		server.set_var("mzczpmb3",99999);
	end
	if "" == server.get_var("mzczpma4") then
		server.set_var("mzczpmb4",0);
	end
end

function player_mrczlj_congzi(player,add)
	reset_player_mrczlj_info(player);
	player:set_param(const.PP_LEIJICZJL,util.ppn(player,const.PP_LEIJICZJL)+add);
	--if activity.isBaifuSjieOpen() and add > 0 then
	--	newgui.accgift.fresh_mrcaward_info(player);
	--end
end


function reset_player_mrczlj_info(player)
	if util.ppn(player,const.PP_MRCZLJ_TAG) ~= today() then
		player:set_param(const.PP_MRCZLJ_TAG,today());
		player:set_param(const.PP_LEIJICZJL,0);
	else
		--如果信息相同就不重置信息,该函数可以多次调用.不会有问题.
	end
end


function player_mrxflj_xiaofei(player,add)
	reset_player_mrxflj_info(player);
	player:set_param(const.PP_LEIJIXF,util.ppn(player,const.PP_LEIJIXF)+add);
end


function reset_player_mrxflj_info(player)
	if util.ppn(player,const.PP_LEIJIXF_DATE) ~= today() then
		player:set_param(const.PP_LEIJIXF_DATE,today());
		player:set_param(const.PP_LEIJIXF,0);
	end
end

function xiaofeitjpm_Recharge_process(player,price)
	if price then
		if server.get_var("xf20131206tjpmb1") == "" then
			server.set_var("xf20131206tjpmb1",999999);
			server.set_var("xf20131206tjpmb2",499999);
			server.set_var("xf20131206tjpmb3",299999);
			server.set_var("xf20131206tjpmb4",0);
		end
		player:set_param(const.PP_131205XIAOFEIYB,util.ppn(player,const.PP_131205XIAOFEIYB)+price);
		local a = player:get_name();
		local b = util.ppn(player,const.PP_131205XIAOFEIYB);
		for i = 1,4 do
			if a == server.get_var("xf20131206tjpma"..i) then
				server.set_var("xf20131206tjpmb"..i,b);
				xiaofeitjpm_Recharge_chuli();
				xiaofeitjpm_Recharge_chuli();
				return;
			end
		end
		if b > util.svn("xf20131206tjpmb4") then
			server.set_var("xf20131206tjpma4",a);
			server.set_var("xf20131206tjpmb4",b);
			xiaofeitjpm_Recharge_chuli();
			xiaofeitjpm_Recharge_chuli();
		end
	end
end
function xiaofeitjpm_Recharge_chuli()
	local Recharge = {};
	for u = 1,4 do
		table.insert(Recharge,{
			name = server.get_var("xf20131206tjpma"..u),
			num = util.svn("xf20131206tjpmb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("xf20131206tjpma"..idx,value.name);
		server.set_var("xf20131206tjpmb"..idx,value.num);
	end
	if "" == server.get_var("xf20131206tjpma2") then
		server.set_var("xf20131206tjpmb2",499999);
	end
	if "" == server.get_var("xf20131206tjpma3") then
		server.set_var("xf20131206tjpmb3",299999);
	end
	if "" == server.get_var("xf20131206tjpma4") then
		server.set_var("xf20131206tjpmb4",0);
	end
end