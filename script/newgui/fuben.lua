module(..., package.seeall)
local ACTIONSET_NAME = "copy"
local PANEL_ACTIONSET_NAME = "panelcopy"


local copy_data=
{
	[1]=
	{
		bossname = "奴玛教主",
		expratio = 181,
		money = 50000,
		need_level = 45,
		max_times = const.RAIN_SEXP_MAX_NUM1,
		cur_times = const.PP_RAIN_SEXP_NUM1,
		posx = "220",
		posy = "100",
		award = 
		{
			[1]={typeid = "10009"},
			[2]={typeid = "20107"},
			[3]={typeid = "10009"},
			[4]={typeid = "10009"},
			[5]={typeid = "10009"},
			[6]={typeid = "10009"},
		},
	},
	[2]=
	{
		bossname = "猛犸神殿",
		expratio = 363,
		money = 50000,
		need_level = 50,
		posx = "240",
		posy = "240",
		max_times = const.RAIN_SEXP_MAX_NUM2,
		cur_times = const.PP_RAIN_SEXP_NUM2,
		award = 
		{
			[1]={typeid = "10009"},
			[2]={typeid = "10009"},
			[3]={typeid = "20206"},
			[4]={typeid = "10009"},
			[5]={typeid = "10009"},
			[6]={typeid = "10009"},
		},
	},
	[3]=
	{
		bossname = "蛮牛大厅",
		expratio = 569,
		money = 55000,
		need_level = 55,
		posx = "340",
		posy = "260",
		max_times = const.RAIN_SEXP_MAX_NUM3,
		cur_times = const.PP_RAIN_SEXP_NUM3,
		award = 
		{
			[1]={typeid = "10009"},
			[2]={typeid = "10009"},
			[3]={typeid = "10009"},
			[4]={typeid = "20302"},
			[5]={typeid = "10009"},
			[6]={typeid = "10009"},
		},
	},
	[4]=
	{
		bossname = "妖月巢穴",
		expratio = 735,
		money = 100000,
		need_level = 60,
		posx = "520",
		posy = "300",
		max_times = const.RAIN_SEXP_MAX_NUM4,
		cur_times = const.PP_RAIN_SEXP_NUM4,
		award = 
		{
			[1]={typeid = "10009"},
			[2]={typeid = "10009"},
			[3]={typeid = "10009"},
			[4]={typeid = "10009"},
			[5]={typeid = "20303"},
			[6]={typeid = "10009"},
		},
	},
	[5]=
	{
		bossname = "巨灵魔窟",
		expratio = 1102,
		money = 150000,
		need_level = 65,
		max_times = const.RAIN_SEXP_MAX_NUM5,
		cur_times = const.PP_RAIN_SEXP_NUM5,
		posx = "620",
		posy = "100",
		award = 
		{
			[1]={typeid = "10009"},
			[2]={typeid = "10009"},
			[3]={typeid = "10009"},
			[4]={typeid = "10009"},
			[5]={typeid = "10009"},
			[6]={typeid = "20304"},
		},
	},
	[6]=
	{
		bossname = "混沌魔域",
		expratio = 1462,
		money = 200000,
		need_level = 70,
		posx = "620",
		posy = "260",
		max_times = const.RAIN_SEXP_MAX_NUM6,
		cur_times = const.PP_RAIN_SEXP_NUM6,
		award = 
		{
			[1]={typeid = "10009"},
			[2]={typeid = "10009"},
			[3]={typeid = "10009"},
			[4]={typeid = "10009"},
			[5]={typeid = "10009"},
			[6]={typeid = "20305"},
		},
	},
};

local data_sexp={
	map_pre='rs',
	{need_level=45,		min_slot=1,	max_slot=200,	enter_x=17,	enter_y=18,
		mg={
			{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
			{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
			{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
			{mgname='[BOSS]奴玛教主',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
		},
	},
	{need_level=50,		min_slot=201,	max_slot=300,	enter_x=29,	enter_y=73,
		mg={
			{mgname='[精英]猛犸雕像',	mgx=35,		mgy=55,		mgnum=6,	mgrange=15},
			{mgname='[精英]猛犸弓箭手',	mgx=28,		mgy=36,		mgnum=4,	mgrange=20},
			{mgname='[精英]猛犸卫士',	mgx=22,		mgy=25,		mgnum=6,	mgrange=15},
			{mgname='[BOSS]猛犸教主',	mgx=22,		mgy=25,		mgnum=1,	mgrange=15},
		},
	},
	{need_level=55,		min_slot=301,	max_slot=400,	enter_x=30,	enter_y=74,
		mg={
			{mgname='[精英]蛮牛法师',	mgx=20,		mgy=65,		mgnum=4,	mgrange=15},
			{mgname='[精英]蛮牛将军',	mgx=24,		mgy=44,		mgnum=6,	mgrange=15},
			{mgname='[精英]蛮牛祭司',	mgx=29,		mgy=29,		mgnum=6,	mgrange=15},
			{mgname='[BOSS]蛮牛王',		mgx=29,		mgy=25,		mgnum=1,	mgrange=15},
		},
	},
	{need_level=60,		min_slot=401,	max_slot=500,	enter_x=15,	enter_y=20,
		mg={
			{mgname='[精英]妖魔蜘蛛',	mgx=37,		mgy=24,		mgnum=4,	mgrange=15},
			{mgname='[精英]妖毒蜘蛛',	mgx=30,		mgy=41,		mgnum=6,	mgrange=15},
			{mgname='[精英]赤锷蜘蛛',	mgx=25,		mgy=58,		mgnum=6,	mgrange=15},
			{mgname='[BOSS]妖月血魔',	mgx=25,		mgy=55,		mgnum=1,	mgrange=15},
		},
	},
	{need_level=65,		min_slot=501,	max_slot=600,	enter_x=17,	enter_y=20,
		mg={
			{mgname='[精英]巨灵战士',	mgx=37,		mgy=27,		mgnum=8,	mgrange=15},
			{mgname='[精英]巨灵战斧',	mgx=30,		mgy=36,		mgnum=8,	mgrange=15},
			{mgname='[精英]巨灵守卫',	mgx=25,		mgy=55,		mgnum=8,	mgrange=15},
			{mgname='[BOSS]巨灵天魔',	mgx=33,		mgy=43,		mgnum=1,	mgrange=15},
		},
	},
	{need_level=70,		min_slot=601,	max_slot=700,	enter_x=45,	enter_y=73,
		mg={
			{mgname='[精英]混沌侍卫',	mgx=29,		mgy=67,		mgnum=8,	mgrange=15},
			{mgname='[精英]混沌将军',	mgx=28,		mgy=44,		mgnum=8,	mgrange=15},
			{mgname='[精英]混沌祭司',	mgx=21,		mgy=29,		mgnum=8,	mgrange=15},
			{mgname='[BOSS]混沌魔君',	mgx=17,		mgy=25,		mgnum=1,	mgrange=15},
		},
	},
};
mg1={--战士第一次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主1',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg2={--法师第一次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主2',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg3={--道士第一次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主3',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg4={--男战士第三次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主11',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg5={--女战士第三次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主12',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg6={--男法师第三次.
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主21',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg7={--女法师第三次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主22',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg8={--男道士第三次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主31',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};
mg9={--女道士第三次
	{mgname='[精英]奴玛勇士',	mgx=26,		mgy=28,		mgnum=5,	mgrange=15},
	{mgname='[精英]奴玛战将',	mgx=28,		mgy=44,		mgnum=5,	mgrange=15},
	{mgname='[精英]火焰奴玛',	mgx=28,		mgy=63,		mgnum=5,	mgrange=15},
	{mgname='[BOSS]奴玛教主32',	mgx=28,		mgy=44,		mgnum=1,	mgrange=15},
};



function process_copy(player,actionset,panelid,actionid,data)
	check_fuben_day(player)
	if actionid == "enterCopy" then
		enterCopy(player)
		return 
	end
	if string.sub(actionid,1,7) == "btnCopy" then
		local index = tonumber(string.sub(actionid,8))
		if index >0 and index <=#copy_data then
			player:set_temp_param(const.PTP_COPYSCENE_SELECTED,index)
		end
	end
	--todo action id
	fresh_copy_info(player)
end
function onTalkentersexpp1(player) return entersexpp(player,1,const.PP_RAIN_SEXP_NUM1,const.RAIN_SEXP_MAX_NUM1);end;
function onTalkentersexpp2(player) return entersexpp(player,2,const.PP_RAIN_SEXP_NUM2,const.RAIN_SEXP_MAX_NUM2);end;
function onTalkentersexpp3(player) return entersexpp(player,3,const.PP_RAIN_SEXP_NUM3,const.RAIN_SEXP_MAX_NUM3);end;
function onTalkentersexpp4(player) return entersexpp(player,4,const.PP_RAIN_SEXP_NUM4,const.RAIN_SEXP_MAX_NUM4);end;
function onTalkentersexpp5(player) return entersexpp(player,5,const.PP_RAIN_SEXP_NUM5,const.RAIN_SEXP_MAX_NUM5);end;
function onTalkentersexpp6(player) return entersexpp(player,6,const.PP_RAIN_SEXP_NUM6,const.RAIN_SEXP_MAX_NUM6);end;

ENTER_FUN = 
{
	["1"] = onTalkentersexpp1,
	["2"] = onTalkentersexpp2,
	["3"] = onTalkentersexpp3,
	["4"] = onTalkentersexpp4,
	["5"] = onTalkentersexpp5,
	["6"] = onTalkentersexpp6,
}

function enterCopy(player)
	local select = util.ptpn(player,const.PTP_COPYSCENE_SELECTED) or 1
	if select >#copy_data  or select <=0 then
		return
	end
	local data = copy_data[select]
	if not data then return end

	local fun = ENTER_FUN[tostring(select)]
	return fun(player)
end

ckpanel.add_listener(ACTIONSET_NAME,process_copy);


function fresh_copy_info(player)
	local select = util.ptpn(player,const.PTP_COPYSCENE_SELECTED) or 1
	local data = copy_data[select]
	if not data then return end

	local cur_level = player:get_level()
	for k,v in pairs(copy_data) do
		if cur_level < v.need_level then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnCopy" .. k,"grayFilter","true")
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnCopy" .. k,"grayFilter","false")
		end
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"bossname","text",data.bossname)
	for k,v in pairs(data.award) do 
		local name = "copygift" .. k
		player:set_panel_data(PANEL_ACTIONSET_NAME,name,"typeid",v.typeid)
	end
	local expnum = math.floor(math.min(80,cur_level)*math.min(80,cur_level)*data.expratio) 
	local exp_info ="经验值:" .. tostring(expnum)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"exp","text",exp_info)
	local money = data.money
	local money_info = "绑定金币:" .. tostring(money)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"money","text",money_info)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"copyaward","visible","true")
	player:set_panel_data(PANEL_ACTIONSET_NAME,"copyaward","x",data.posx)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"copyaward","y",data.posy)
	if cur_level >= data.need_level  then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"enterCopy","grayFilter","false")
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"enterCopy","grayFilter","true")
	end
	local cur_times = util.ppn(player,data.cur_times)
	local max_times = data.max_times
	if max_times > cur_times then
		--TODO do what you want
	end
	local fight_info = "挑战次数:" .. cur_times .. "/" .. max_times
	player:set_panel_data(PANEL_ACTIONSET_NAME,"chltimes","text",fight_info)
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME)
end
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
function onTalkCopyScene(player)
	check_fuben_day(player)
	player:set_temp_param(const.PTP_COPYSCENE_SELECTED,1)
	fresh_copy_info(player)
end

function entersexpp(player,id,ppname,maxnum)
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
			map:set_timer(1,30*60*1000);
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
			player:alert(11,0,"您只有30分钟时间通过本副本!")
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
--------------end of copy scene

