module(..., package.seeall)
util.use_function(_M,task.task1000);
--这个是封魔岭进入的NPC脚本
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
check_fengml_day(player)
	npc:echo([[              <b><font color="#FF6600" size="14px">守卫试炼</font></b>
--------------------------------------
我乃守卫试炼使者！

    <a href="event:talk_jrfml">开始守卫试炼</a>（<font color="#FFFF00">需等级 </font><font color="#00FF00">50级</font>）

    <font color="#FFFF00">今天剩余次数: </font><font color="#00FF00">]]..util.ppn(player,const.PP_FML_NUM)..[[/1次</font>
--------------------------------------
<font color="#FFFF00">守卫试炼说明：

    1.守卫图腾不被怪物摧毁！

    2.击杀怪物获得玉石及经验奖励！

    3.可召唤守卫协助防守！
</font>
--------------------------------------
历史最高奖励：

	<b>玉石奖励：]]..util.ppn(player,const.PP_FENGMOLING_YUSHINUM_HIGHEST)..[[</b>

	<b>经验奖励：]]..util.ppn(player,const.PP_FMKILL_EXP_HIGHEST)..[[</b>

       <a href="event:talk_lqzgjl">消耗998元宝,直接领取最高奖励！</a>

]]);
end

function onTalklqzgjl(npc,player)
	if player:get_vcoin() >= 998 then
		if util.ppn(player,const.PP_FML_NUM) >0 then
			if util.ppn(player,const.PP_FMKILL_EXP_HIGHEST)> 0 and util.ppn(player,const.PP_FENGMOLING_YUSHINUM_HIGHEST) >0 then
				player:set_param(const.PP_FML_NUM,util.ppn(player,const.PP_FML_NUM)-1);
				player:sub_vcoin(998,"shilianshouwei");
				player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+util.ppn(player,const.PP_FENGMOLING_YUSHINUM_HIGHEST));--领取玉石
				player:add_exp(util.ppn(player,const.PP_FMKILL_EXP_HIGHEST));
				player:alert(11,0,"恭喜您成功领取最高历史奖励!");
			else
				player:alert(11,0,"您未进行过守卫试炼，没有最高纪录哦！！");
			end
		else
			player:alert(11,0,"您今天的次数已经用完!");
		end
	else
		player:alert(11,0,"元宝不足998！");
	end
end

function onTalkjrfml(npc,player)
	if player:get_level() >= 50 then
		local map=find_empty_fml(npc,player,lv);
		if util.ppn(player,const.PP_FML_NUM) > 0 then
			if map then
			local mid =map:get_id();
					map:clear_mon();
					map:clear_tower();
					player:clear_tower();
					player:set_param(const.PP_FML_NUM,util.ppn(player,const.PP_FML_NUM)-1);
					player:set_param(const.PP_FMKILL_MON,0);
					player:set_param(const.PP_FMKILL_EXP,0);
					player:enter_map(mid,50,70);
					go.givehuicheng(player);

					map:mon_gen(47,67,"试炼图腾",1,0,1,1);
					player:set_panel_data("panelleft","leftcount","act1",10);
					player:set_panel_data("panelleft","imgbg","bgid",2313);
					player:set_panel_data("panelleft","leftcount","x",25);
					player:push_ckpanel_data("left","panelleft");
					player:set_timer(17,10000);
					player:set_timer(18,500);
			else
				player:alert(11,0,"当前地图以满,请稍后进入!");
			end
		else
			player:alert(11,0,"您今天的次数已经用完!");
		end
	else
		player:alert(11,0,"等级50级之后才能开启守卫试炼挑战任务!");
	end
end

function find_empty_fml(npc,player,lv)
	local map=nil;
	for i=1,200 do
		map = server.find_map("fengml"..i);
		if map and map:num_player() < 1 then
			break;
		else
			map=nil;
		end
	end
	return map;
end

function check_fengml_day(player)
	if util.ppn(player,const.PP_FENGML_DAY) ~= today() then
		player:set_param(const.PP_FENGML_DAY,today());
		player:set_param(const.PP_FML_NUM,1);
	end
end

--封魔岭每个怪物的经验计算
--所有怪物的种类，配置上相应的获得经验
local mondata={
	[1]={mon="远古狮妖(第1波)",exp1=1000,yushinum=1},
	[2]={mon="蛮荒野人(第2波)",exp1=2297,yushinum=1},
	[3]={mon="獠牙猪妖(第3波)",exp1=3737,yushinum=1},
	[4]={mon="不腐尸(第4波)",exp1=5278,yushinum=1},
	[5]={mon="地狱战神(第5波)",exp1=137972,yushinum=50},
	[6]={mon="游尸(第6波)",exp1=8585,yushinum=1},
	[7]={mon="不灭尸(第7波)",exp1=10330,yushinum=1},
	[8]={mon="诺玛战士(第8波)",exp1=12125,yushinum=1},
	[9]={mon="诺玛勇士(第9波)",exp1=13966,yushinum=1},
	[10]={mon="花魅妖后(第10波)",exp1=633957,yushinum=50},
	[11]={mon="蛮牛侍卫(第11波)",exp1=17769,yushinum=1},
	[12]={mon="蛮牛祭司(第12波)",exp1=19725,yushinum=1},
	[13]={mon="红猪妖(第13波)",exp1=21713,yushinum=1},
	[14]={mon="黑猪妖(第14波)",exp1=23733,yushinum=1},
	[15]={mon="妖翼领主(第15波)",exp1=1546894,yushinum=50},
	[16]={mon="猛犸护卫(第16波)",exp1=27857,yushinum=1},
	[17]={mon="猛犸雕像(第17波)",exp1=29959,yushinum=1},
	[18]={mon="蛮牛战士(第18波)",exp1=32086,yushinum=1},
	[19]={mon="蛮牛弓箭(第19波)",exp1=34237,yushinum=1},
	[20]={mon="骷髅统领(第20波)",exp1=2912902,yushinum=50},
	[21]={mon="魔眼蜘蛛(第21波)",exp1=38606,yushinum=1},
	[22]={mon="钢刺蜘蛛(第22波)",exp1=40823,yushinum=1},
	[23]={mon="人马战士(第23波)",exp1=43059,yushinum=1},
	[24]={mon="人马守卫(第24波)",exp1=45316,yushinum=1},
	[25]={mon="深渊领主(第25波)",exp1=4759134,yushinum=50},
	[26]={mon="混沌斗士(第26波)",exp1=49884,yushinum=1},
	[27]={mon="混沌祭司(第27波)",exp1=52195,yushinum=1},
	[28]={mon="邪恶僧人(第28波)",exp1=54524,yushinum=1},
	[29]={mon="邪恶蛇蝎(第29波)",exp1=56869,yushinum=1},
	[30]={mon="深渊吞天兽(第30波)",exp1=7107661,yushinum=50},
};
function check_mon(mon,player)
	local map = player:get_map();
	local mid = map:get_id()
	if string.find(mid,"fengml") then
		player:set_param(const.PP_FMKILL_MON,util.ppn(player,const.PP_FMKILL_MON)+1);
		local n = mon:get_name();
		for i = 1,#mondata do
			if n == mondata[i].mon then
				player:set_param(const.PP_FENGMOLING_YUSHINUM,util.ppn(player,const.PP_FENGMOLING_YUSHINUM)+mondata[i].yushinum);--获得玉石的数目
				player:set_param(const.PP_FMKILL_EXP,util.ppn(player,const.PP_FMKILL_EXP)+mondata[i].exp1);
				return;
			end
		end
	end
	
end