module(..., package.seeall)
util.use_function(_M,task.task1000);
--这个是封魔岭地图内NPC的脚本
function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);

end
function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
local a=player:num_item("守卫令牌",1)
local b=player:num_item("精英守卫令牌",1)
npc:echo([[
<font color="#FFFF00">守卫试炼:</font>

<font color="#CCBB77">当前拥有守卫令牌: <font color="#00FF00">]]..a..[[</font> 个</font>

<font color="#CCBB77">当前拥有精英令牌: <font color="#00FF00">]]..b..[[</font> 个</font>    <a href='event:talk_101'>购买令牌</a>

--------------------------------------
<font color="#FFFF00">令牌使用:

   1.使用令牌可召唤守卫协助防守！

   2.每次闯关最多召唤5名弓箭护卫！

   3.精英护卫攻击是普通护卫的2倍！

   4.合理放置护卫可最大杀伤怪物！</font>

--------------------------------------

<font color="#CCBB77">当前可以领取经验: <font color="#00FF00">]]..util.ppn(player,const.PP_FMKILL_EXP)..[[</font></font>

<font color="#CCBB77">当前可以领取玉石: <font color="#00FF00">]]..util.ppn(player,const.PP_FENGMOLING_YUSHINUM)..[[</font></font>
             
                     <a href='event:talk_lqyushi'>领取奖励并且回城</a> <font color="#00FF00">
]]);
return 105;
end

function checkhighestyushi(player)
	if util.ppn(player,const.PP_FENGMOLING_YUSHINUM) > util.ppn(player,const.PP_FENGMOLING_YUSHINUM_HIGHEST) then
		player:set_param(const.PP_FENGMOLING_YUSHINUM_HIGHEST,util.ppn(player,const.PP_FENGMOLING_YUSHINUM));
	end  
	if util.ppn(player,const.PP_FMKILL_EXP) > util.ppn(player,const.PP_FMKILL_EXP_HIGHEST) then
		player:set_param(const.PP_FMKILL_EXP_HIGHEST,util.ppn(player,const.PP_FMKILL_EXP));
	end
end

function onTalklqyushi(npc,player)
	if nil == string.find(player:get_map():get_id(),"fengml") then
		return ;
	end
	player:add_exp(util.ppn(player,const.PP_FMKILL_EXP));--领取经验
	player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+util.ppn(player,const.PP_FENGMOLING_YUSHINUM));--领取玉石
	checkhighestyushi(player);
	player:alert(11,0,"守卫试炼结束,获得玉石"..util.ppn(player,const.PP_FENGMOLING_YUSHINUM)..",获得经验"..util.ppn(player,const.PP_FMKILL_EXP).."");
	player:go_home();
end



function onTalk105(npc,player)
	if util.ppn(player,const.PP_FMSHUA_PM) == 0 then
		player:gui_high_focus(1003,"axzvczcv",228,171,4);
	else
		if util.ptpn(player,const.PTP_FENGMO_MON_NUMBER) == 140 then
		player:gui_high_focus(1003,"axzvczcv",190,357,4);
		end
	end
end

function onTalkkssg(npc,player)--通过个人定时器的方式刷怪
	--
end

function onTalk101(npc,player)
npc:echo([[
<p>##精英守卫令牌##</p>
<a href='event:talk_gmfml1'>购买1个</a> <font color="#CCBB77">精英守卫令牌需元宝198</font><br>
<a href='event:talk_gmfml5'>购买5个</a> <font color="#CCBB77">精英守卫令牌需要元宝958</font></a><br>
<p>##守卫令牌##</p>
<a href='event:talk_gmfml11'>购买1个</a> <font color="#CCBB77">守卫令牌需要绑定元宝288</font></a><br>
<a href='event:talk_gmfml51'>购买5个</a> <font color="#CCBB77">守卫令牌需要绑定元宝1288</font></a><br>
--------------------------------------
<font color="#FF0000">
1.每次闯关最多召唤5个弓箭护卫

2.精英护卫攻击是普通护卫的2倍

3.合理放置护卫可最大杀伤怪物</font><br><br>
                          <a href='event:talk_100'>返回上一页</a>
]]);
end
function onTalkgmfml11(npc,player)
	if player:get_vcoin_bind() >= 288 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin_bind(288)
			player:add_item("守卫令牌",1,1)
		else
			player:alert(11,0,"包裹空间不足1格,购买失败!");
		end
	else
		player:alert(11,0,"绑定元宝不足288,购买失败!");
	end
end

function onTalkgmfml51(npc,player)
	if player:get_vcoin_bind() >= 1288 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin_bind(1288)
			player:add_item("守卫令牌",5,1)
		else
			player:alert(11,0,"包裹空间不足1格,购买失败!");
		end
	else
		player:alert(11,0,"绑定元宝不足1288,购买失败!");
	end
end

function onTalkgmfml1(npc,player)
	if player:get_vcoin() >= 198 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin(198,"fmlp1")
			player:add_item("精英守卫令牌",1,1);
			player:alert(10,0,"成功购买精英守卫令牌1个!");
			return 101;
		else
			player:alert(11,0,"包裹空间不足1格,购买失败!");
		end
	else
		player:alert(11,0,"元宝不足,不能购买");
		return 101;
	end
end

function onTalkgmfml5(npc,player)
	if player:get_vcoin() >= 958 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin(958,"fmlp5")
			player:add_item("精英守卫令牌",5,1);
			player:alert(10,0,"成功购买精英守卫令牌5个!");
			return 101;
		else
			player:alert(11,0,"包裹空间不足1格,购买失败!");
		end
	else
		player:alert(11,0,"元宝不足,不能购买");
		return 101;
	end
end
