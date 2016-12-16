module(..., package.seeall)
util.use_function(_M,task.task3002);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task3002.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end

function onTalk100(npc,player)
	task.task3002.check_richang_day(player);
	npc:echo([[

##continue## <s='tb'>你好,我是伏魔使者!</s><l>]]);
	local s=player:get_task_state(3002);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG_NUM)
	if const.RICHANG_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG_MAX_NUM == n) then
		task.task3002.show_title(npc,player);
		task.task3002.show_fly(npc,player);
	else
		npc:echo("\n<font color='#ff0000'>您今天的降妖除魔任务已全部完成!</font>\n");
	end
	npc:echo("<l>");
	npc:echo([[

<p>##continue##<a href="event:talk_z100">荣誉值兑换勋章</a></p>
你的荣誉值: <font color="#ff0000">]]..player:get_honor()..[[</font>点

获得荣誉值: <font color="#ffff00">日常任务和商铺可获得!</font>]]);
end


function onTalkz100(npc,player)
	npc:echo([[
         <b><font color="#ccbb77" size="14px">荣誉勋章兑换列表</font></b>
--------------------------------------
你当前荣誉值为: <font color="#ff0000">]]..player:get_honor()..[[</font>点
--------------------------------------
##荣誉勋章·太极##    <a href="event:talk_z200">荣誉值兑换勋章</a>
需要:荣誉值[<font color="#ff0000">10110</font>]点
--------------------------------------
##荣誉勋章·两仪##    <a href="event:talk_z201">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">20240</font>]点
--------------------------------------
##荣誉勋章·三才##    <a href="event:talk_z202">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">40520</font>]点
--------------------------------------
##荣誉勋章·四象##    <a href="event:talk_z203">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">81120</font>]点
--------------------------------------
##荣誉勋章·五行##    <a href="event:talk_z204">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">162400</font>]点
--------------------------------------
##荣誉勋章·六合##    <a href="event:talk_z205">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">325120</font>]点
--------------------------------------
<a href="event:talk_dhryz">元宝兑换荣誉值</a>    　　<a href="event:talk_z300">下一页</a>  <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

function onTalkT3002sj(npc,player)
	if util.ppn(player,const.PP_XYCM_TASKLV) < 10 then
		if 1 == player:use_gamemoney(20000,179) then
			----------------------------------------------------------------刷新概率
			local dt = math.random(10,109);
			player:set_param(const.PP_XYCM_TASKLV,math.floor(dt/10))
			----------------------------------------------------------------
			player:alert(11,1,"刷新成功,当前任务等级:"..util.ppn(player,const.PP_XYCM_TASKLV));
		else
			player:alert(11,1,"金币不足20000,刷新失败!");
		end
	else
		player:alert(11,1,"当前任务等级已经达到10级!");
	end
	onTalkT3002Show(npc,player);
end

function onTalkz300(npc,player)
	npc:echo([[
         <b><font color="#ccbb77" size="14px">荣誉勋章兑换列表</font></b>
--------------------------------------
你当前荣誉值为: <font color="#ff0000">]]..player:get_honor()..[[</font>点
--------------------------------------
##荣誉勋章·七星##    <a href="event:talk_z206">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">650880</font>]点
--------------------------------------
##荣誉勋章·八卦##    <a href="event:talk_z207">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">1303040</font>]点
--------------------------------------
##荣誉勋章·九宫##    <a href="event:talk_z208">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">2608640</font>]点
--------------------------------------
##荣誉勋章·十方##    <a href="event:talk_z209">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">5222400</font>]点
--------------------------------------
##荣誉勋章·神威##    <a href="event:talk_z210">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">10455040</font>]点
--------------------------------------
##荣誉勋章·至尊##    <a href="event:talk_z211">荣誉值升级勋章</a>
需要:荣誉值[<font color="#ff0000">20930560</font>]点
--------------------------------------
<a href="event:talk_dhryz">元宝兑换荣誉值</a>    　　<a href="event:talk_z100">上一页</a>  <a href="event:talk_100">返回主页</a>
--------------------------------------]]);
end

function onTalkz200(npc,player)
	if  player:num_item("荣誉勋章·太极",1) >= 1 or player:num_item("荣誉勋章·太极",10) >= 1 or player:num_item("荣誉勋章·太极",100) >= 1 then
		player:alert(1,1,"您已经有[荣誉勋章·太极],还是别兑换了!!")
		onTalkz100(npc,player);
	else
		if player:get_honor() >= 10110 then
			if player:num_bag_black() >= 1 then
				player:sub_honor(10110);
				player:add_item("荣誉勋章·太极",1,1);
				player:alert(11,1,"恭喜您成功兑换[荣誉勋章·太极]");
				player:alert(11,0,"您的当前荣誉值:"..player:get_honor().."点");
				onTalkz100(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkz100(npc,player);
			end
		else
			player:alert(1,1,"您的荣誉值不足[10110]点,无法兑换!")
			onTalkz100(npc,player);
		end
	end
end


function onTalkz201(npc,player) ryxzsj(npc,player,80001,20240,"荣誉勋章·太极","荣誉勋章·两仪",80002,1) end
function onTalkz202(npc,player) ryxzsj(npc,player,80002,40520,"荣誉勋章·两仪","荣誉勋章·三才",80003,1) end
function onTalkz203(npc,player) ryxzsj(npc,player,80003,81120,"荣誉勋章·三才","荣誉勋章·四象",80004,1) end
function onTalkz204(npc,player) ryxzsj(npc,player,80004,162400,"荣誉勋章·四象","荣誉勋章·五行",80005,1) end
function onTalkz205(npc,player) ryxzsj(npc,player,80005,325120,"荣誉勋章·五行","荣誉勋章·六合",80006,1) end
function onTalkz206(npc,player) ryxzsj(npc,player,80006,650880,"荣誉勋章·六合","荣誉勋章·七星",80007,2) end
function onTalkz207(npc,player) ryxzsj(npc,player,80007,1303040,"荣誉勋章·七星","荣誉勋章·八卦",80008,2) end
function onTalkz208(npc,player) ryxzsj(npc,player,80008,2608640,"荣誉勋章·八卦","荣誉勋章·九宫",80009,2) end
function onTalkz209(npc,player) ryxzsj(npc,player,80009,5222400,"荣誉勋章·九宫","荣誉勋章·十方",80010,2) end
function onTalkz210(npc,player) ryxzsj(npc,player,80010,10455040,"荣誉勋章·十方","荣誉勋章·神威",80011,2) end
function onTalkz211(npc,player) ryxzsj(npc,player,80011,20930560,"荣誉勋章·神威","荣誉勋章·至尊",80012,2) end
function onTalkz210a(npc,player) ryxzsj(npc,player,80010,10455040,"荣誉勋章·十方","荣誉勋章·神威1",80013,2) end
function onTalkz211a(npc,player) ryxzsj(npc,player,80013,20930560,"荣誉勋章·神威1","荣誉勋章·至尊1",80014,2) end
function onTalkz210b(npc,player) ryxzsj(npc,player,80010,10455040,"荣誉勋章·十方","荣誉勋章·神威2",80015,2) end
function onTalkz211b(npc,player) ryxzsj(npc,player,80015,20930560,"荣誉勋章·神威2","荣誉勋章·至尊2",80016,2) end

function ryxzsj(npc,player,a,b,c,d,e,f)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == a then
			if player:get_honor() >= b then
				if player:num_item(c,1) >= 1 then
					local result = player:remove_item_by_type_pos(ittype_id,0);
					if result == 0 then
					--player:remove_item(c,1);
					player:sub_honor(b);
					player:add_item(d,1,1);
					player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
					player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级["..d.."]!</font>");
					if b >= 325120 then
					server.info(110,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在伏魔使者处将勋章升级为[<font color='#ff0000'>"..d.."</font>]");
					else
					server.info(100,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在伏魔使者处将勋章升级为[<font color='#ff0000'>"..d.."</font>]");
					end
					player:alert(11,0,"您的当前荣誉值:"..player:get_honor().."点");
					end
				else
					player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
				end
			else
				player:alert(1,1,"您的荣誉值不足["..b.."]点,升级失败!");
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

function onTalkdhryz(npc,player)
	npc:echo([[
--------------------------------------
<b><font color="#ccbb77" size="14px">元宝兑换荣誉值</font></b>
--------------------------------------
你当前荣誉值为: <font color="#ff0000">]]..player:get_honor()..[[</font>点
--------------------------------------
<a href="event:talk_dh1000">兑换1000点荣誉值</a>      <font color="#ffaa00">需要元宝:30</font>
--------------------------------------
<a href="event:talk_dh5000">兑换5000点荣誉值</a>      <font color="#ffaa00">需要元宝:150</font>
--------------------------------------
<a href="event:talk_dh10000">兑换10000点荣誉值</a>     <font color="#ffaa00">需要元宝:300</font>
--------------------------------------
<a href="event:talk_dh50000">兑换50000点荣誉值</a>     <font color="#ffaa00">需要元宝:1500</font>
--------------------------------------
<a href="event:talk_dh100000">兑换100000点荣誉值</a>    <font color="#ffaa00">需要元宝:3000</font>
--------------------------------------
<a href="event:talk_dh500000">兑换500000点荣誉值</a>    <font color="#ffaa00">需要元宝:15000</font>
--------------------------------------
<a href="event:talk_dh1000000">兑换1000000点荣誉值</a>   <font color="#ffaa00">需要元宝:30000</font>
--------------------------------------
                             <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end

function onTalkdh1000(npc,player) dhryz(npc,player,30,1000); end
function onTalkdh5000(npc,player) dhryz(npc,player,150,5000); end
function onTalkdh10000(npc,player) dhryz(npc,player,300,10000); end
function onTalkdh50000(npc,player) dhryz(npc,player,1500,50000); end
function onTalkdh100000(npc,player) dhryz(npc,player,3000,100000); end
function onTalkdh500000(npc,player) dhryz(npc,player,15000,500000); end
function onTalkdh1000000(npc,player) dhryz(npc,player,30000,1000000); end

function dhryz(npc,player,a,b)
	if player:get_vcoin() >= a then
		player:sub_vcoin(a,"rongyu");
		player:add_honor(b);
		player:alert(11,1,"成功使用["..a.."]元宝兑换["..b.."]荣誉值!");
		player:alert(11,0,"您的当前荣誉值为:"..player:get_honor().."点");
		onTalkdhryz(npc,player);
	else
		player:alert(11,1,"您的元宝不足["..a.."],无法兑换荣誉值!");
		onTalkdhryz(npc,player);
	end
end