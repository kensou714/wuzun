module(..., package.seeall)
local mon_gen={
	[1]={
		{mgname='炎魔',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[2]={
		{mgname='上古君王',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[3]={
		{mgname='逍遥天尊',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[4]={
		{mgname='青面恶魔',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[5]={
		{mgname='蜥蜴统领',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[6]={
		{mgname='无双刀客',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[7]={
		{mgname='熔岩恶兽',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[8]={
		{mgname='恶魔领主',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[9]={
		{mgname='妖魔道君',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
	[10]={
		{mgname='玄天妖后',	mgx=29,		mgy=45,		mgnum=1,	mgrange=5},
	};
}


function onPlayerEnter(map,player)
	local ceng=util.ppn(player,const.PP_MWT_LV);
	player:set_temp_param(const.PTP_SHILIAN_AWARD,1);
	local mg = mon_gen[ceng];
	if mg then
		for i=1,#mg do
			map:mon_gen(mg[i].mgx,mg[i].mgy,mg[i].mgname,mg[i].mgnum,mg[i].mgrange,1,1);
		end
	end
	player:set_task_state(const.TASK_ID_SHILIAN,task.util.ts(ceng,const.TSACED));
	player:set_task_param(const.TASK_ID_SHILIAN,1,player:get_map():num_monster());
	player:push_task_data(const.TASK_ID_SHILIAN,0);
	map:set_timer(1,180000);
	player:alert(111,0,"你只有3分钟的时间击败本层的BOSS!");

	player:set_panel_data("panelleft","leftcount","act1",180);
	player:push_ckpanel_data("left","panelleft");
end

function onPlayerLeave(map,player)
	player:set_panel_data("panelleft","leftcount","act1",-1);
	player:push_ckpanel_data("left","panelleft");
	player:set_task_state(const.TASK_ID_SHILIAN,0);
	player:push_task_data(const.TASK_ID_SHILIAN,0);
	map:set_timer(1,0);	
	if map:num_player() <= 0 then map:clear_mon();map:clear_item();end;
end

function onTimer1(map)
	map:map_exe("go.home");
end