module(..., package.seeall)
util.use_function(_M,task.task3003);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task3003.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end

function onTalk100(npc,player)
	task.task3003.check_richang_day(player);
	npc:echo([[

##continue## <s='tb'>你好,我是赏金猎人!</s><l>]]);
	local s=player:get_task_state(3003);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG2_NUM)
	if const.RICHANG2_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG2_MAX_NUM == n) then
		task.task3003.task_fix(player);
		task.task3003.show_title(npc,player);
		task.task3003.show_fly(npc,player);
	else
		npc:echo("\n<font color='#ff0000'>您今天的赏金任务已全部完成!</font>\n");
	end
	npc:echo("<l>");
	npc:echo([[

<p>##continue##<a href="event:talk_z100">功勋兑换装备</a></p>
你的功勋: <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点

获得功勋: <font color="#ffff00">消灭BOSS即可获得功勋!</font>]]);
end
function onTalkz100(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">功勋兑换装备列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
45级: <a href="event:talk_45z">天地套装</a>   <a href="event:talk_45f">乾坤套装</a>   <a href="event:talk_45d">无极套装</a>
--------------------------------------
50级: <a href="event:talk_50z">凌云武威</a>   <a href="event:talk_50f">凌云烈焰</a>   <a href="event:talk_50d">凌云无极</a>
--------------------------------------
55级: <a href="event:talk_55z">惊世武威</a>   <a href="event:talk_55f">惊世烈焰</a>   <a href="event:talk_55d">惊世无极</a>
--------------------------------------
60级: <a href="event:talk_60z">混天武威</a>   <a href="event:talk_60f">混天烈焰</a>   <a href="event:talk_60d">混天无极</a>
--------------------------------------
65级: <a href="event:talk_65z">潜龙武威</a>   <a href="event:talk_65f">潜龙烈焰</a>   <a href="event:talk_65d">潜龙无极</a>
--------------------------------------
70级: <a href="event:talk_70z">无双武威</a>   <a href="event:talk_70f">无双烈焰</a>   <a href="event:talk_70d">无双无极</a>
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

--<a href="event:talk_dhbdyb">功勋兑绑定元宝</a>: <font color="#FFaa00">100点功勋=50绑定元宝</font>
--------------------------------------

function onTalkT3003sj(npc,player)
	if util.ppn(player,const.PP_SJLR_TASKLV) < 10 then
		if 1 == player:use_gamemoney(20000,179) then
			----------------------------------------------------------------刷新概率
			local dt = math.random(10,109);
			player:set_param(const.PP_SJLR_TASKLV,math.floor(dt/10))
			----------------------------------------------------------------
			player:alert(11,1,"刷新成功,当前任务等级:"..util.ppn(player,const.PP_SJLR_TASKLV));
		else
			player:alert(11,1,"金币不足20000,刷新失败!");
		end
	else
		player:alert(11,1,"当前任务等级已经达到10级!");
	end
	onTalkT3003Show(npc,player);
end

function onTalkdhbdybxxx(npc,player)
	if util.ppn(player,const.PP_GONGXUN) >= 100 then
		player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)-100);
		player:add_vcoin_bind(50);
		player:alert(1,1,"使用100点功勋兑换50绑定元宝");
	else
		player:alert(1,1,"您的功勋不足100点,无法兑换!")
	end
	onTalkz100(npc,player);
end


function onTalk45z(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">天地套装兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##天地头盔##            <a href="event:talk_45z1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##天地项链##            <a href="event:talk_45z2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##天地护腕##            <a href="event:talk_45z3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##天地戒指##            <a href="event:talk_45z4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##天地腰带##            <a href="event:talk_45z5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##天地靴##              <a href="event:talk_45z6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end


function onTalk45f(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">乾坤套装兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##乾坤头盔##            <a href="event:talk_45f1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##乾坤项链##            <a href="event:talk_45f2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##乾坤护腕##            <a href="event:talk_45f3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##乾坤戒指##            <a href="event:talk_45f4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##乾坤腰带##            <a href="event:talk_45f5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##乾坤靴##              <a href="event:talk_45f6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end


function onTalk45d(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">无极套装兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##无极头盔##            <a href="event:talk_45d1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##无极项链##            <a href="event:talk_45d2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##无极护腕##            <a href="event:talk_45d3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##无极戒指##            <a href="event:talk_45d4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##无极腰带##            <a href="event:talk_45d5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
##无极靴##              <a href="event:talk_45d6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">10</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk50z(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">凌云武威兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##凌云头盔·武威##      <a href="event:talk_50z1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云项链·武威##      <a href="event:talk_50z2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云护腕·武威##      <a href="event:talk_50z3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云戒指·武威##      <a href="event:talk_50z4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云腰带·武威##      <a href="event:talk_50z5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云靴·武威##        <a href="event:talk_50z6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk50f(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">凌云烈焰兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##凌云头盔·烈焰##      <a href="event:talk_50f1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云项链·烈焰##      <a href="event:talk_50f2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云护腕·烈焰##      <a href="event:talk_50f3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云戒指·烈焰##      <a href="event:talk_50f4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云腰带·烈焰##      <a href="event:talk_50f5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云靴·烈焰##        <a href="event:talk_50f6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk50d(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">凌云无极兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##凌云头盔·无极##      <a href="event:talk_50d1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云项链·无极##      <a href="event:talk_50d2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云护腕·无极##      <a href="event:talk_50d3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云戒指·无极##      <a href="event:talk_50d4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云腰带·无极##      <a href="event:talk_50d5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
##凌云靴·无极##        <a href="event:talk_50d6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">30</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk55z(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">惊世武威兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##惊世头盔·武威##      <a href="event:talk_55z1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世项链·武威##      <a href="event:talk_55z2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世护腕·武威##      <a href="event:talk_55z3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世戒指·武威##      <a href="event:talk_55z4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世腰带·武威##      <a href="event:talk_55z5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世靴·武威##        <a href="event:talk_55z6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk55f(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">惊世烈焰兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##惊世头盔·烈焰##      <a href="event:talk_55f1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世项链·烈焰##      <a href="event:talk_55f2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世护腕·烈焰##      <a href="event:talk_55f3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世戒指·烈焰##      <a href="event:talk_55f4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世腰带·烈焰##      <a href="event:talk_55f5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世靴·烈焰##        <a href="event:talk_55f6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk55d(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">惊世无极兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##惊世头盔·无极##      <a href="event:talk_55d1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世项链·无极##      <a href="event:talk_55d2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世护腕·无极##      <a href="event:talk_55d3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世戒指·无极##      <a href="event:talk_55d4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世腰带·无极##      <a href="event:talk_55d5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
##惊世靴·无极##        <a href="event:talk_55d6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">90</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk60z(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">混天武威兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##混天头盔·武威##      <a href="event:talk_60z1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天项链·武威##      <a href="event:talk_60z2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天护腕·武威##      <a href="event:talk_60z3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天戒指·武威##      <a href="event:talk_60z4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天腰带·武威##      <a href="event:talk_60z5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天靴·武威##        <a href="event:talk_60z6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk60f(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">混天烈焰兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##混天头盔·烈焰##      <a href="event:talk_60f1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天项链·烈焰##      <a href="event:talk_60f2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天护腕·烈焰##      <a href="event:talk_60f3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天戒指·烈焰##      <a href="event:talk_60f4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天腰带·烈焰##      <a href="event:talk_60f5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天靴·烈焰##        <a href="event:talk_60f6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk60d(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">混天无极兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##混天头盔·无极##      <a href="event:talk_60d1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天项链·无极##      <a href="event:talk_60d2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天护腕·无极##      <a href="event:talk_60d3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天戒指·无极##      <a href="event:talk_60d4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天腰带·无极##      <a href="event:talk_60d5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
##混天靴·无极##        <a href="event:talk_60d6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">270</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk65z(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">潜龙武威兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##潜龙头盔·武威##      <a href="event:talk_65z1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙项链·武威##      <a href="event:talk_65z2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙护腕·武威##      <a href="event:talk_65z3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙戒指·武威##      <a href="event:talk_65z4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙腰带·武威##      <a href="event:talk_65z5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙靴·武威##        <a href="event:talk_65z6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk65f(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">潜龙烈焰兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##潜龙头盔·烈焰##      <a href="event:talk_65f1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙项链·烈焰##      <a href="event:talk_65f2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙护腕·烈焰##      <a href="event:talk_65f3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙戒指·烈焰##      <a href="event:talk_65f4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙腰带·烈焰##      <a href="event:talk_65f5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙靴·烈焰##        <a href="event:talk_65f6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk65d(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">潜龙无极兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##潜龙头盔·无极##      <a href="event:talk_65d1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙项链·无极##      <a href="event:talk_65d2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙护腕·无极##      <a href="event:talk_65d3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙戒指·无极##      <a href="event:talk_65d4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙腰带·无极##      <a href="event:talk_65d5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
##潜龙靴·无极##        <a href="event:talk_65d6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">810</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk70z(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">无双武威兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##无双头盔·武威##      <a href="event:talk_70z1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双项链·武威##      <a href="event:talk_70z2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双护腕·武威##      <a href="event:talk_70z3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双戒指·武威##      <a href="event:talk_70z4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双腰带·武威##      <a href="event:talk_70z5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双靴·武威##        <a href="event:talk_70z6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk70f(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">无双烈焰兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##无双头盔·烈焰##      <a href="event:talk_70f1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双项链·烈焰##      <a href="event:talk_70f2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双护腕·烈焰##      <a href="event:talk_70f3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双戒指·烈焰##      <a href="event:talk_70f4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双腰带·烈焰##      <a href="event:talk_70f5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双靴·烈焰##        <a href="event:talk_70f6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk70d(npc,player)
	npc:echo([[--------------------------------------
         <b><font color="#ccbb77" size="14px">无双无极兑换列表</font></b>
--------------------------------------
<font color="#FFff00">请选择您想要兑换的装备:</font>
--------------------------------------
##无双头盔·无极##      <a href="event:talk_70d1">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双项链·无极##      <a href="event:talk_70d2">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双护腕·无极##      <a href="event:talk_70d3">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双戒指·无极##      <a href="event:talk_70d4">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双腰带·无极##      <a href="event:talk_70d5">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
##无双靴·无极##        <a href="event:talk_70d6">点击此处兑换</a>
兑换需要功勋:[<font color="#ff0000">2430</font>]点
--------------------------------------
<font color="#FFff00">您共有功勋:</font> <font color="#ff0000">]]..util.ppn(player,const.PP_GONGXUN)..[[</font>点(<font color="#ff0000">消灭BOSS获得功勋</font>)
--------------------------------------
                　　        <a href="event:talk_z100">返回主页</a>
--------------------------------------
]]);
end

function onTalk45z1(npc,player) gxdhzb(npc,player,10,"天地头盔",1); end
function onTalk45z2(npc,player) gxdhzb(npc,player,10,"天地项链",1); end
function onTalk45z3(npc,player) gxdhzb(npc,player,10,"天地护腕",1); end
function onTalk45z4(npc,player) gxdhzb(npc,player,10,"天地戒指",1); end
function onTalk45z5(npc,player) gxdhzb(npc,player,10,"天地腰带",1); end
function onTalk45z6(npc,player) gxdhzb(npc,player,10,"天地靴",1); end

function onTalk45f1(npc,player) gxdhzb(npc,player,10,"乾坤头盔",2); end
function onTalk45f2(npc,player) gxdhzb(npc,player,10,"乾坤项链",2); end
function onTalk45f3(npc,player) gxdhzb(npc,player,10,"乾坤护腕",2); end
function onTalk45f4(npc,player) gxdhzb(npc,player,10,"乾坤戒指",2); end
function onTalk45f5(npc,player) gxdhzb(npc,player,10,"乾坤腰带",2); end
function onTalk45f6(npc,player) gxdhzb(npc,player,10,"乾坤靴",2); end

function onTalk45d1(npc,player) gxdhzb(npc,player,10,"无极头盔",3); end
function onTalk45d2(npc,player) gxdhzb(npc,player,10,"无极项链",3); end
function onTalk45d3(npc,player) gxdhzb(npc,player,10,"无极护腕",3); end
function onTalk45d4(npc,player) gxdhzb(npc,player,10,"无极戒指",3); end
function onTalk45d5(npc,player) gxdhzb(npc,player,10,"无极腰带",3); end
function onTalk45d6(npc,player) gxdhzb(npc,player,10,"无极靴",3); end

function onTalk50z1(npc,player) gxdhzb(npc,player,30,"凌云头盔·武威",4); end
function onTalk50z2(npc,player) gxdhzb(npc,player,30,"凌云项链·武威",4); end
function onTalk50z3(npc,player) gxdhzb(npc,player,30,"凌云护腕·武威",4); end
function onTalk50z4(npc,player) gxdhzb(npc,player,30,"凌云戒指·武威",4); end
function onTalk50z5(npc,player) gxdhzb(npc,player,30,"凌云腰带·武威",4); end
function onTalk50z6(npc,player) gxdhzb(npc,player,30,"凌云靴·武威",4); end

function onTalk50f1(npc,player) gxdhzb(npc,player,30,"凌云头盔·烈焰",5); end
function onTalk50f2(npc,player) gxdhzb(npc,player,30,"凌云项链·烈焰",5); end
function onTalk50f3(npc,player) gxdhzb(npc,player,30,"凌云护腕·烈焰",5); end
function onTalk50f4(npc,player) gxdhzb(npc,player,30,"凌云戒指·烈焰",5); end
function onTalk50f5(npc,player) gxdhzb(npc,player,30,"凌云腰带·烈焰",5); end
function onTalk50f6(npc,player) gxdhzb(npc,player,30,"凌云靴·烈焰",5); end

function onTalk50d1(npc,player) gxdhzb(npc,player,30,"凌云头盔·无极",6); end
function onTalk50d2(npc,player) gxdhzb(npc,player,30,"凌云项链·无极",6); end
function onTalk50d3(npc,player) gxdhzb(npc,player,30,"凌云护腕·无极",6); end
function onTalk50d4(npc,player) gxdhzb(npc,player,30,"凌云戒指·无极",6); end
function onTalk50d5(npc,player) gxdhzb(npc,player,30,"凌云腰带·无极",6); end
function onTalk50d6(npc,player) gxdhzb(npc,player,30,"凌云靴·无极",6); end

function onTalk55z1(npc,player) gxdhzb(npc,player,90,"惊世头盔·武威",7); end
function onTalk55z2(npc,player) gxdhzb(npc,player,90,"惊世项链·武威",7); end
function onTalk55z3(npc,player) gxdhzb(npc,player,90,"惊世护腕·武威",7); end
function onTalk55z4(npc,player) gxdhzb(npc,player,90,"惊世戒指·武威",7); end
function onTalk55z5(npc,player) gxdhzb(npc,player,90,"惊世腰带·武威",7); end
function onTalk55z6(npc,player) gxdhzb(npc,player,90,"惊世靴·武威",7); end

function onTalk55f1(npc,player) gxdhzb(npc,player,90,"惊世头盔·烈焰",8); end
function onTalk55f2(npc,player) gxdhzb(npc,player,90,"惊世项链·烈焰",8); end
function onTalk55f3(npc,player) gxdhzb(npc,player,90,"惊世护腕·烈焰",8); end
function onTalk55f4(npc,player) gxdhzb(npc,player,90,"惊世戒指·烈焰",8); end
function onTalk55f5(npc,player) gxdhzb(npc,player,90,"惊世腰带·烈焰",8); end
function onTalk55f6(npc,player) gxdhzb(npc,player,90,"惊世靴·烈焰",8); end

function onTalk55d1(npc,player) gxdhzb(npc,player,90,"惊世头盔·无极",9); end
function onTalk55d2(npc,player) gxdhzb(npc,player,90,"惊世项链·无极",9); end
function onTalk55d3(npc,player) gxdhzb(npc,player,90,"惊世护腕·无极",9); end
function onTalk55d4(npc,player) gxdhzb(npc,player,90,"惊世戒指·无极",9); end
function onTalk55d5(npc,player) gxdhzb(npc,player,90,"惊世腰带·无极",9); end
function onTalk55d6(npc,player) gxdhzb(npc,player,90,"惊世靴·无极",9); end

function onTalk60z1(npc,player) gxdhzb(npc,player,270,"混天头盔·武威",10); end
function onTalk60z2(npc,player) gxdhzb(npc,player,270,"混天项链·武威",10); end
function onTalk60z3(npc,player) gxdhzb(npc,player,270,"混天护腕·武威",10); end
function onTalk60z4(npc,player) gxdhzb(npc,player,270,"混天戒指·武威",10); end
function onTalk60z5(npc,player) gxdhzb(npc,player,270,"混天腰带·武威",10); end
function onTalk60z6(npc,player) gxdhzb(npc,player,270,"混天靴·武威",10); end

function onTalk60f1(npc,player) gxdhzb(npc,player,270,"混天头盔·烈焰",11); end
function onTalk60f2(npc,player) gxdhzb(npc,player,270,"混天项链·烈焰",11); end
function onTalk60f3(npc,player) gxdhzb(npc,player,270,"混天护腕·烈焰",11); end
function onTalk60f4(npc,player) gxdhzb(npc,player,270,"混天戒指·烈焰",11); end
function onTalk60f5(npc,player) gxdhzb(npc,player,270,"混天腰带·烈焰",11); end
function onTalk60f6(npc,player) gxdhzb(npc,player,270,"混天靴·烈焰",11); end

function onTalk60d1(npc,player) gxdhzb(npc,player,270,"混天头盔·无极",12); end
function onTalk60d2(npc,player) gxdhzb(npc,player,270,"混天项链·无极",12); end
function onTalk60d3(npc,player) gxdhzb(npc,player,270,"混天护腕·无极",12); end
function onTalk60d4(npc,player) gxdhzb(npc,player,270,"混天戒指·无极",12); end
function onTalk60d5(npc,player) gxdhzb(npc,player,270,"混天腰带·无极",12); end
function onTalk60d6(npc,player) gxdhzb(npc,player,270,"混天靴·无极",12); end

function onTalk65z1(npc,player) gxdhzb(npc,player,810,"潜龙头盔·武威",13); end
function onTalk65z2(npc,player) gxdhzb(npc,player,810,"潜龙项链·武威",13); end
function onTalk65z3(npc,player) gxdhzb(npc,player,810,"潜龙护腕·武威",13); end
function onTalk65z4(npc,player) gxdhzb(npc,player,810,"潜龙戒指·武威",13); end
function onTalk65z5(npc,player) gxdhzb(npc,player,810,"潜龙腰带·武威",13); end
function onTalk65z6(npc,player) gxdhzb(npc,player,810,"潜龙靴·武威",13); end

function onTalk65f1(npc,player) gxdhzb(npc,player,810,"潜龙头盔·烈焰",14); end
function onTalk65f2(npc,player) gxdhzb(npc,player,810,"潜龙项链·烈焰",14); end
function onTalk65f3(npc,player) gxdhzb(npc,player,810,"潜龙护腕·烈焰",14); end
function onTalk65f4(npc,player) gxdhzb(npc,player,810,"潜龙戒指·烈焰",14); end
function onTalk65f5(npc,player) gxdhzb(npc,player,810,"潜龙腰带·烈焰",14); end
function onTalk65f6(npc,player) gxdhzb(npc,player,810,"潜龙靴·烈焰",14); end

function onTalk65d1(npc,player) gxdhzb(npc,player,810,"潜龙头盔·无极",15); end
function onTalk65d2(npc,player) gxdhzb(npc,player,810,"潜龙项链·无极",15); end
function onTalk65d3(npc,player) gxdhzb(npc,player,810,"潜龙护腕·无极",15); end
function onTalk65d4(npc,player) gxdhzb(npc,player,810,"潜龙戒指·无极",15); end
function onTalk65d5(npc,player) gxdhzb(npc,player,810,"潜龙腰带·无极",15); end
function onTalk65d6(npc,player) gxdhzb(npc,player,810,"潜龙靴·无极",15); end

function onTalk70z1(npc,player) gxdhzb(npc,player,2430,"无双头盔·武威",16); end
function onTalk70z2(npc,player) gxdhzb(npc,player,2430,"无双项链·武威",16); end
function onTalk70z3(npc,player) gxdhzb(npc,player,2430,"无双护腕·武威",16); end
function onTalk70z4(npc,player) gxdhzb(npc,player,2430,"无双戒指·武威",16); end
function onTalk70z5(npc,player) gxdhzb(npc,player,2430,"无双腰带·武威",16); end
function onTalk70z6(npc,player) gxdhzb(npc,player,2430,"无双靴·武威",16); end

function onTalk70f1(npc,player) gxdhzb(npc,player,2430,"无双头盔·烈焰",17); end
function onTalk70f2(npc,player) gxdhzb(npc,player,2430,"无双项链·烈焰",17); end
function onTalk70f3(npc,player) gxdhzb(npc,player,2430,"无双护腕·烈焰",17); end
function onTalk70f4(npc,player) gxdhzb(npc,player,2430,"无双戒指·烈焰",17); end
function onTalk70f5(npc,player) gxdhzb(npc,player,2430,"无双腰带·烈焰",17); end
function onTalk70f6(npc,player) gxdhzb(npc,player,2430,"无双靴·烈焰",17); end

function onTalk70d1(npc,player) gxdhzb(npc,player,2430,"无双头盔·无极",18); end
function onTalk70d2(npc,player) gxdhzb(npc,player,2430,"无双项链·无极",18); end
function onTalk70d3(npc,player) gxdhzb(npc,player,2430,"无双护腕·无极",18); end
function onTalk70d4(npc,player) gxdhzb(npc,player,2430,"无双戒指·无极",18); end
function onTalk70d5(npc,player) gxdhzb(npc,player,2430,"无双腰带·无极",18); end
function onTalk70d6(npc,player) gxdhzb(npc,player,2430,"无双靴·无极",18); end

function gxdhzb(npc,player,a,b,c)
	if util.ppn(player,const.PP_GONGXUN) >= a then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_GONGXUN,util.ppn(player,const.PP_GONGXUN)-a);
			player:add_item(b,1);
			player:alert(11,1,"恭喜您成功兑换["..b.."]");
			player:alert(11,0,"您当前功勋还有:"..util.ppn(player,const.PP_GONGXUN).."点");
			if a >= 30 and util.ppn(player,const.PP_GONGXUNDH) == 0 then
				player:set_param(const.PP_GONGXUNDH,1);
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[赏金猎人]处消耗"..a.."点功勋成功兑换[<font color='#ff0000'>"..b.."</font>]");
			end
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
		end
	else
		player:alert(1,1,"功勋不足["..a.."]点,无法兑换["..b.."]")
	end
	if c==1 then onTalk45z(npc,player); end
	if c==2 then onTalk45f(npc,player); end
	if c==3 then onTalk45d(npc,player); end
	if c==4 then onTalk50z(npc,player); end
	if c==5 then onTalk50f(npc,player); end
	if c==6 then onTalk50d(npc,player); end
	if c==7 then onTalk55z(npc,player); end
	if c==8 then onTalk55f(npc,player); end
	if c==9 then onTalk55d(npc,player); end
	if c==10 then onTalk60z(npc,player); end
	if c==11 then onTalk60f(npc,player); end
	if c==12 then onTalk60d(npc,player); end
	if c==13 then onTalk65z(npc,player); end
	if c==14 then onTalk65f(npc,player); end
	if c==15 then onTalk65d(npc,player); end
	if c==16 then onTalk70z(npc,player); end
	if c==17 then onTalk70f(npc,player); end
	if c==18 then onTalk70d(npc,player); end
end