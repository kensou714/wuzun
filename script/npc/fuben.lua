module(..., package.seeall)
util.use_function(_M,task.task1000);
util.use_function(_M,task.task3001);
function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	flags = flags + task.task3001.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end
local data_sexp={
	map_pre='rs',
	{need_level=45,		min_slot=1,	max_slot=200,	enter_x=15,	enter_y=25,
		mg={
			{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
			{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
			{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
			{mgname='[BOSS]奴玛教主',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
		},
	},
	{need_level=50,		min_slot=201,	max_slot=300,	enter_x=17,	enter_y=69,
		mg={
			{mgname='[精英]猛犸雕像',	mgx=10,		mgy=50,		mgnum=6,	mgrange=25},
			{mgname='[精英]猛犸弓箭手',	mgx=18,		mgy=21,		mgnum=4,	mgrange=25},
			{mgname='[精英]猛犸卫士',	mgx=39,		mgy=22,		mgnum=6,	mgrange=25},
			{mgname='[BOSS]猛犸教主',	mgx=42,		mgy=57,		mgnum=1,	mgrange=1},
		},
	},
	{need_level=55,		min_slot=301,	max_slot=400,	enter_x=45,	enter_y=48,
		mg={
			{mgname='[精英]蛮牛法师',	mgx=35,		mgy=22,		mgnum=4,	mgrange=25},
			{mgname='[精英]蛮牛将军',	mgx=18,		mgy=29,		mgnum=6,	mgrange=25},
			{mgname='[精英]蛮牛祭司',	mgx=19,		mgy=64,		mgnum=6,	mgrange=25},
			{mgname='[BOSS]蛮牛王',		mgx=19,		mgy=69,		mgnum=1,	mgrange=1},
		},
	},
	{need_level=60,		min_slot=401,	max_slot=500,	enter_x=17,	enter_y=23,
		mg={
			{mgname='[精英]妖魔蜘蛛',	mgx=38,		mgy=23,		mgnum=4,	mgrange=25},
			{mgname='[精英]妖毒蜘蛛',	mgx=43,		mgy=70,		mgnum=6,	mgrange=25},
			{mgname='[精英]赤锷蜘蛛',	mgx=13,		mgy=71,		mgnum=6,	mgrange=25},
			{mgname='[BOSS]妖月血魔',	mgx=10,		mgy=50,		mgnum=1,	mgrange=1},
		},
	},
	{need_level=65,		min_slot=501,	max_slot=600,	enter_x=47,	enter_y=56,
		mg={
			{mgname='[精英]巨灵战士',	mgx=19,		mgy=60,		mgnum=8,	mgrange=25},
			{mgname='[精英]巨灵战斧',	mgx=16,		mgy=19,		mgnum=8,	mgrange=25},
			{mgname='[精英]巨灵守卫',	mgx=36,		mgy=23,		mgnum=8,	mgrange=25},
			{mgname='[BOSS]巨灵天魔',	mgx=39,		mgy=23,		mgnum=1,	mgrange=1},
		},
	},
	{need_level=70,		min_slot=601,	max_slot=700,	enter_x=16,	enter_y=24,
		mg={
			{mgname='[精英]混沌侍卫',	mgx=42,		mgy=27,		mgnum=8,	mgrange=25},
			{mgname='[精英]混沌将军',	mgx=44,		mgy=52,		mgnum=8,	mgrange=25},
			{mgname='[精英]混沌祭司',	mgx=32,		mgy=70,		mgnum=8,	mgrange=25},
			{mgname='[BOSS]混沌魔君',	mgx=18,		mgy=70,		mgnum=1,	mgrange=1},
		},
	},
};
mg1={--战士第一次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主1',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg2={--法师第一次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主2',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg3={--道士第一次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主3',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg4={--男战士第三次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主11',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg5={--女战士第三次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主12',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg6={--男法师第三次.
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主21',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg7={--女法师第三次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主22',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg8={--男道士第三次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主31',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};
mg9={--女道士第三次
	{mgname='[精英]奴玛勇士',	mgx=14,		mgy=47,		mgnum=5,	mgrange=25},
	{mgname='[精英]奴玛战将',	mgx=22,		mgy=69,		mgnum=5,	mgrange=25},
	{mgname='[精英]火焰奴玛',	mgx=45,		mgy=48,		mgnum=5,	mgrange=25},
	{mgname='[BOSS]奴玛教主32',	mgx=45,		mgy=23,		mgnum=1,	mgrange=1},
};

function check_fuben_day(player)
	if util.ppn(player,const.PP_RAIN_DAY) ~= today() then
		player:set_param(const.PP_RAIN_DAY,today());
		player:set_param(const.PP_RAIN_SEXP_NUM1,0);
		player:set_param(const.PP_RAIN_SEXP_NUM2,0);
		player:set_param(const.PP_RAIN_SEXP_NUM3,0);
		player:set_param(const.PP_RAIN_SEXP_NUM4,0);
		player:set_param(const.PP_RAIN_SEXP_NUM5,0);
		player:set_param(const.PP_RAIN_SEXP_NUM6,0);
		player:set_task_state(const.TASK_ID_FUBEN_I,task.util.ts(1,const.TSACCE));
		player:push_task_data(const.TASK_ID_FUBEN_I,0);
	end
end
function onTalk100(npc,player)
	check_fuben_day(player);
	npc:echo([[
--------------------------------------
本服目前共开放了以下几个单人副本地图供
玩家挑战!清理完副本中的所有怪物将有大
量经验奖励!
--------------------------------------
    <font color="#ff0000">消灭副本BOSS有几率掉落高级装备</font>
--------------------------------------
 <a href='event:talk_101a'>奴玛神庙副本[45级]</a>: 今天还可挑战]]..(const.RAIN_SEXP_MAX_NUM1 - util.ppn(player,const.PP_RAIN_SEXP_NUM1) )..[[次
--------------------------------------
 <a href='event:talk_102a'>猛犸神殿副本[50级]</a>: 今天还可挑战]]..(const.RAIN_SEXP_MAX_NUM2 - util.ppn(player,const.PP_RAIN_SEXP_NUM2) )..[[次
--------------------------------------
 <a href='event:talk_103a'>蛮牛大殿副本[55级]</a>: 今天还可挑战]]..(const.RAIN_SEXP_MAX_NUM3 - util.ppn(player,const.PP_RAIN_SEXP_NUM3) )..[[次
--------------------------------------
 <a href='event:talk_104a'>妖月巢穴副本[60级]</a>: 今天还可挑战]]..(const.RAIN_SEXP_MAX_NUM4 - util.ppn(player,const.PP_RAIN_SEXP_NUM4) )..[[次
--------------------------------------
 <a href='event:talk_105a'>巨灵魔窟副本[65级]</a>: 今天还可挑战]]..(const.RAIN_SEXP_MAX_NUM5 - util.ppn(player,const.PP_RAIN_SEXP_NUM5) )..[[次
--------------------------------------
 <a href='event:talk_106a'>混沌魔域副本[70级]</a>: 今天还可挑战]]..(const.RAIN_SEXP_MAX_NUM6 - util.ppn(player,const.PP_RAIN_SEXP_NUM6) )..[[次
 -------------------------------------
 ]]);
end


function onTalk101a(npc,player)
	if player:get_level() >= 45 then
	npc:echo([[
[奴玛神庙]目前主要包含以下怪物:

【BOSS】: <font color="#ffff00">奴玛教主</font>

【精英】: <font color="#ffaa00">奴玛勇士 奴玛战将 火焰奴玛</font>

消灭[副本怪物]就有几率掉落以下装备!

       <font color="#ffaaee">屠 龙 刀  魔魂法杖  40级套装

       天地套装  乾坤套装  无极套装</font>

            <font color="#ff0000">今天还可挑战该副本[]]..(const.RAIN_SEXP_MAX_NUM1 - util.ppn(player,const.PP_RAIN_SEXP_NUM1) )..[[]次</font>

                   <a href="event:talk_entersexp1">开始挑战奴玛神庙</a>

--------------------------------------
<font color="#ffcc00"><p>副本奖励:</p>
<p>##经验##     ]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*181)..[[</p>
<p>##绑定金币## 50000</p></font>]]);
	else
		player:alert(1,1,"45级以上才可挑战奴玛神庙副本!");
		onTalk100(npc,player)
	end
end


function onTalk102a(npc,player)
	if player:get_level() >= 50 then
	npc:echo([[
[猛犸神殿]目前主要包含以下怪物:

【BOSS】: <font color="#ffff00">猛犸教主</font>

【精英】: <font color="#ffaa00">猛犸弓箭 猛犸雕像 猛犸卫士</font>

消灭[副本怪物]就有几率掉落以下装备!

       <font color="#ffaaee">40级套装  45级套装  高级武器

       凌云武威  凌云烈焰  凌云无极</font>

            <font color="#ff0000">今天还可挑战该副本[]]..(const.RAIN_SEXP_MAX_NUM2 - util.ppn(player,const.PP_RAIN_SEXP_NUM2) )..[[]次</font>

                   <a href="event:talk_entersexp2">开始挑战猛犸神殿</a>

--------------------------------------
<font color="#ffcc00"><p>副本奖励:</p>
<p>##经验##     ]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*363)..[[</p>
<p>##绑定金币## 50000</p></font>]]);
	else
		player:alert(1,1,"50级以上才可挑战猛犸神殿副本!");
		onTalk100(npc,player)
	end
end


function onTalk103a(npc,player)
	if player:get_level() >= 55 then
	npc:echo([[
[蛮牛大殿]目前主要包含以下怪物:

【BOSS】: <font color="#ffff00">蛮牛王</font>

【精英】: <font color="#ffaa00">蛮牛法师 蛮牛将军 蛮牛祭司</font>

消灭[副本怪物]就有几率掉落以下装备!

       <font color="#ffaaee">40级套装  45级套装  50级套装

       惊世武威  惊世烈焰  惊世无极</font>

            <font color="#ff0000">今天还可挑战该副本[]]..(const.RAIN_SEXP_MAX_NUM3 - util.ppn(player,const.PP_RAIN_SEXP_NUM3) )..[[]次</font>

                   <a href="event:talk_entersexp3">开始挑战蛮牛大殿</a>

--------------------------------------
<font color="#ffcc00"><p>副本奖励:</p>
<p>##经验##     ]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*569)..[[</p>
<p>##绑定金币## 100000</p></font>]]);
	else
		player:alert(1,1,"55级以上才可挑战蛮牛大殿副本!");
		onTalk100(npc,player)
	end
end


function onTalk104a(npc,player)
	if player:get_level() >= 60 then
	npc:echo([[
[妖月巢穴]目前主要包含以下怪物:

【BOSS】: <font color="#ffff00">妖月血魔</font>

【精英】: <font color="#ffaa00">妖魔蜘蛛 妖毒蜘蛛 赤锷蜘蛛</font>

消灭[副本怪物]就有几率掉落以下装备!

       <font color="#ffaaee">40级套装  45级套装  50级套装

       惊世武威  惊世烈焰  惊世无极</font>

            <font color="#ff0000">今天还可挑战该副本[]]..(const.RAIN_SEXP_MAX_NUM4 - util.ppn(player,const.PP_RAIN_SEXP_NUM4) )..[[]次</font>

                   <a href="event:talk_entersexp4">开始挑战妖月巢穴</a>

--------------------------------------
<font color="#ffcc00"><p>副本奖励:</p>
<p>##经验##     ]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*735)..[[</p>
<p>##绑定金币## 100000</p></font>]]);
	else
		player:alert(1,1,"60级以上才可挑战妖月巢穴副本!");
		onTalk100(npc,player)
	end
end





function onTalk105a(npc,player)
	if player:get_level() >= 65 then
	npc:echo([[
[巨灵魔窟]目前主要包含以下怪物:

【BOSS】: <font color="#ffff00">巨灵天魔</font>

【精英】: <font color="#ffaa00">巨灵战士 巨灵战斧 巨灵守卫</font>

消灭[副本怪物]就有几率掉落以下装备!

       <font color="#ffaaee">凌云套装  惊世套装  混天套装

       潜龙武威  潜龙烈焰  潜龙无极</font>

            <font color="#ff0000">今天还可挑战该副本[]]..(const.RAIN_SEXP_MAX_NUM5 - util.ppn(player,const.PP_RAIN_SEXP_NUM5) )..[[]次</font>

                   <a href="event:talk_entersexp5">开始挑战巨灵魔窟</a>

--------------------------------------
<font color="#ffcc00"><p>副本奖励:</p>
<p>##经验##     ]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*1102)..[[</p>
<p>##绑定金币## 150000</p></font>]]);
	else
		player:alert(1,1,"65级以上才可挑战巨灵魔窟副本!");
		onTalk100(npc,player)
	end
end




function onTalk106a(npc,player)
	if player:get_level() >= 70 then
	npc:echo([[
[混沌魔域]目前主要包含以下怪物:

【BOSS】: <font color="#ffff00">混沌魔君</font>

【精英】: <font color="#ffaa00">混沌侍卫 混沌将军 混沌祭司</font>

消灭[副本怪物]就有几率掉落以下装备!

       <font color="#ffaaee">惊世套装  混天套装  潜龙套装

       无双武威  无双烈焰  无双无极</font>

            <font color="#ff0000">今天还可挑战该副本[]]..(const.RAIN_SEXP_MAX_NUM6 - util.ppn(player,const.PP_RAIN_SEXP_NUM6) )..[[]次</font>

                   <a href="event:talk_entersexp6">开始挑战混沌魔域</a>

--------------------------------------
<font color="#ffcc00"><p>副本奖励:</p>
<p>##经验##     ]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*1462)..[[点</p>
<p>##绑定金币## 200000</p></font>]]);
	else
		player:alert(1,1,"70级以上才可挑战混沌魔域副本!");
		onTalk100(npc,player)
	end
end

function onTalkentersexp1(npc,player) return entersexp(npc,player,1,const.PP_RAIN_SEXP_NUM1,const.RAIN_SEXP_MAX_NUM1);end;
function onTalkentersexp2(npc,player) return entersexp(npc,player,2,const.PP_RAIN_SEXP_NUM2,const.RAIN_SEXP_MAX_NUM2);end;
function onTalkentersexp3(npc,player) return entersexp(npc,player,3,const.PP_RAIN_SEXP_NUM3,const.RAIN_SEXP_MAX_NUM3);end;
function onTalkentersexp4(npc,player) return entersexp(npc,player,4,const.PP_RAIN_SEXP_NUM4,const.RAIN_SEXP_MAX_NUM4);end;
function onTalkentersexp5(npc,player) return entersexp(npc,player,5,const.PP_RAIN_SEXP_NUM5,const.RAIN_SEXP_MAX_NUM5);end;
function onTalkentersexp6(npc,player) return entersexp(npc,player,6,const.PP_RAIN_SEXP_NUM6,const.RAIN_SEXP_MAX_NUM6);end;

function entersexp(npc,player,id,ppname,maxnum)
	local d=data_sexp[id];
	if d.need_level > player:get_level() then
		player:alert(1,1,"您的等级不足"..d.need_level.."级,无法进入该副本!");
		return 100;
	end
	if maxnum > util.ppn(player,ppname) then
		local map=nil;
		for i=d.min_slot,d.max_slot do
			map = server.find_map(data_sexp.map_pre..i);
			if map and map:num_player() < 1 then
				break;
			else
				map=nil;
			end
		end
		if map and d then
			map:set_timer(1,15*60*1000);
			map:clear_mon();map:clear_item();
			local mg = d.mg;
			if (ppname==const.PP_RAIN_SEXP_NUM1) then
				player:set_param(const.PP_FUBEN_ALL_NUM,util.ppn(player,const.PP_FUBEN_ALL_NUM)+1);
				if (util.ppn(player,const.PP_FUBEN_ALL_NUM)==1) then
					local job=player:get_job_name();
					if job=="warrior" then
						mg = mg1;
					end
					if job=="wizard" then
						mg = mg2;
					end
					if job=="taoist" then
						mg = mg3;
					end
				end
				if (util.ppn(player,const.PP_FUBEN_ALL_NUM)==2) then
					local job=player:get_job_name();
					local gender=player:get_gender_name();
					if job=="warrior" then
						if gender == "male" then
							mg = mg4;
						else
							mg = mg5;
						end
					end
					if job=="wizard" then
						if gender == "male" then
							mg = mg6;
						else
							mg = mg7;
						end
					end
					if job=="taoist" then
						if gender == "male" then
							mg = mg8;
						else
							mg = mg9;
						end
					end
				end
			end
			for i=1,#mg do
				map:mon_gen(mg[i].mgx,mg[i].mgy,mg[i].mgname,mg[i].mgnum,mg[i].mgrange,1,1);
			end
			player:set_param(ppname,util.ppn(player,ppname)+1);
			player:enter_map(map:get_id(),d.enter_x,d.enter_y);player:find_road_goto(map:get_id(),d.enter_x,d.enter_y,"autofightstart");
			player:alert(11,0,"您只有15分钟时间通过本副本!")
			player:set_task_state(const.TASK_ID_FUBEN_I,task.util.ts(1,const.TSACCE));
			player:push_task_data(const.TASK_ID_FUBEN_I,0);
		end
	else
		player:alert(1,1,"您挑战该副本的次数为O,无法再挑战!");
		return 100;
	end
end
function check_show_task(player)
	check_fuben_day(player);
	local pl = player:get_level();
	if data_sexp[1].need_level <= pl and (const.RAIN_SEXP_MAX_NUM1 - util.ppn(player,const.PP_RAIN_SEXP_NUM1) )> 0 then return true;	end;
	if data_sexp[2].need_level <= pl and (const.RAIN_SEXP_MAX_NUM2 - util.ppn(player,const.PP_RAIN_SEXP_NUM2) )> 0 then return true;	end;
	if data_sexp[3].need_level <= pl and (const.RAIN_SEXP_MAX_NUM3 - util.ppn(player,const.PP_RAIN_SEXP_NUM3) )> 0 then return true;	end;
	if data_sexp[4].need_level <= pl and (const.RAIN_SEXP_MAX_NUM4 - util.ppn(player,const.PP_RAIN_SEXP_NUM4) )> 0 then return true;	end;
	if data_sexp[5].need_level <= pl and (const.RAIN_SEXP_MAX_NUM5 - util.ppn(player,const.PP_RAIN_SEXP_NUM5) )> 0 then return true;	end;
	if data_sexp[6].need_level <= pl and (const.RAIN_SEXP_MAX_NUM6 - util.ppn(player,const.PP_RAIN_SEXP_NUM6) )> 0 then return true;	end;
	return false;
end