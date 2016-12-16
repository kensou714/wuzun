module(..., package.seeall)
local mon_gen={
	[1]={
		{mgname='蛇蝎4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[2]={
		{mgname='猛犸雕像4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[3]={
		{mgname='猛犸卫士4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[4]={
		{mgname='蛮牛侍卫4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[5]={
		{mgname='蛮牛将军4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[6]={
		{mgname='蛮牛祭司4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[7]={
		{mgname='钢刺蜘蛛4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[8]={
		{mgname='妖毒蜘蛛4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[9]={
		{mgname='赤锷蜘蛛4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[10]={
		{mgname='巨灵战士4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[11]={
		{mgname='巨灵战斧4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
	[12]={
		{mgname='巨灵守卫4',	mgx=31,		mgy=41,		mgnum=8,	mgrange=5},
	};
}

function onPlayerEnter(map,player)
	local ceng=util.ppn(player,const.PP_ZMT3_LV);
	if ceng <= 1 then
		player:set_param(const.PP_ZHENMOTACISHU,util.ppn(player,const.PP_ZHENMOTACISHU)-1);
	end
	if map:num_player() >= 2 or util.ppn(player,const.PP_ZHENMOTACISHU) < 0 then
		player:set_param(const.PP_ZMT3_LV,0);
		map:set_timer(1,0);return;
	end
	player:set_temp_param(const.PTP_ZMT3_AWARD,1);
	local mg = mon_gen[ceng];
	if mg then
		for i=1,#mg do
			map:mon_gen(mg[i].mgx,mg[i].mgy,mg[i].mgname,mg[i].mgnum,mg[i].mgrange,1,1);
		end
	end
	player:set_task_state(const.TASK_ID_ZMT3,task.util.ts(ceng,const.TSACED));
	player:set_task_param(const.TASK_ID_ZMT3,1,player:get_map():num_monster());
	player:push_task_data(const.TASK_ID_ZMT3,0);
	map:set_timer(1,300000);
	player:alert(111,0,"你只有5分钟的时间清除里面的怪物!");
end
function onPlayerLeave(map,player)
	player:set_task_state(const.TASK_ID_ZMT3,0);
	player:push_task_data(const.TASK_ID_ZMT3,0);
	map:set_timer(1,0);	
	if map:num_player() <= 0 then	map:clear_mon();map:clear_item();end;
end
function onTimer1(map)
	map:map_exe("go.soonhome");
end
function onTimer2(map)
end
