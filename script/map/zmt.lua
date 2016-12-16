module(..., package.seeall)
local mon_gen={
	[1]={
		{mgname='蛇蝎2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[2]={
		{mgname='猛犸雕像2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[3]={
		{mgname='猛犸卫士2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
		{mgname='猛犸教主2',	mgx=31,		mgy=42,		mgnum=1,	mgrange=15},
	};
	[4]={
		{mgname='蛮牛侍卫2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[5]={
		{mgname='蛮牛将军2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[6]={
		{mgname='蛮牛祭司2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
		{mgname='蛮牛王2',	mgx=31,		mgy=42,		mgnum=1,	mgrange=15},
	};
	[7]={
		{mgname='钢刺蜘蛛2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[8]={
		{mgname='妖毒蜘蛛2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[9]={
		{mgname='赤锷蜘蛛2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
		{mgname='妖月血魔2',	mgx=31,		mgy=42,		mgnum=1,	mgrange=15},
	};
	[10]={
		{mgname='巨灵战士2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[11]={
		{mgname='巨灵战斧2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
	};
	[12]={
		{mgname='巨灵守卫2',	mgx=31,		mgy=41,		mgnum=10,	mgrange=15},
		{mgname='巨灵天魔2',	mgx=31,		mgy=42,		mgnum=1,	mgrange=15},
	};
}

function onPlayerEnter(map,player)
	player:set_temp_param(const.PTP_ZMT_AWARD,1);
	local ceng=util.ppn(player,const.PP_ZMT_LV);
	local mg = mon_gen[ceng];
	if mg then
		for i=1,#mg do
			map:mon_gen(mg[i].mgx,mg[i].mgy,mg[i].mgname,mg[i].mgnum,mg[i].mgrange,1,1);
		end
	end
	player:set_task_state(const.TASK_ID_ZMT,task.util.ts(ceng,const.TSACED));
	player:set_task_param(const.TASK_ID_ZMT,1,player:get_map():num_monster());
	player:push_task_data(const.TASK_ID_ZMT,0);
	map:set_timer(1,600000);
	player:alert(111,0,"你只有10分钟的时间清除里面的怪物!");
end
function onPlayerLeave(map,player)
	player:set_task_state(const.TASK_ID_ZMT,0);
	player:push_task_data(const.TASK_ID_ZMT,0);
	map:set_timer(1,0);	
	if map:num_player() <= 0 then	map:clear_mon();map:clear_item();end;
end
function onTimer1(map)
	map:map_exe("go.soonhome");
end
function onTimer2(map)
end
