module(..., package.seeall)

local ACTIONSET_NAME="actlist";
local PANEL_ACTIONSET_NAME="panelActivityList";

local actdata ={
	[1] ={name="冰火岛寻宝",begin=1000,tend=1030,serverday=0},
	[2] ={name="怪物攻城"  ,begin=1030,tend=1114,serverday=0},
	[3] ={name="远古废墟"  ,begin=1045,tend=1115,serverday=0},
	[4] ={name="死亡禁地"  ,begin=1115,tend=1145,serverday=1},
	[5] ={name="泡温泉"    ,begin=1200,tend=1230,serverday=1},
	[6] ={name="武林争霸"  ,begin=1300,tend=1400,serverday=1},
	[7] ={name="远古废墟"  ,begin=1345,tend=1415,serverday=0},
	[8] ={name="天晶战场"  ,begin=1439,tend=1459,serverday=0},
	[9] ={name="皇城宝藏"  ,begin=1615,tend=1644,serverday=0},
	[10]={name="冰火岛寻宝",begin=1659,tend=1729,serverday=0},
	[11]={name="天魔兽来袭",begin=1730,tend=1800,serverday=0},
	[12]={name="泡温泉"    ,begin=1800,tend=1830,serverday=1},
	[13]={name="麒麟圣殿"  ,begin=1845,tend=1859,serverday=0},
	[14]={name="天晶战场"  ,begin=1910,tend=1930,serverday=1},
	[15]={name="天魔兽来袭",begin=1931,tend=2000,serverday=0},
	[16]={name="怪物攻城"  ,begin=2030,tend=2058,serverday=0},
	[17]={name="麒麟圣殿"  ,begin=2045,tend=2059,serverday=0},
	[18]={name="远古废墟"  ,begin=2145,tend=2215,serverday=0},
	[19]={name="冰火岛寻宝",begin=2159,tend=2229,serverday=0},
	[20]={name="死亡禁地"  ,begin=2215,tend=2244,serverday=0},
	[21]={name="麒麟圣殿"  ,begin=2245,tend=2259,serverday=0},
	[22]={name="怪物攻城"  ,begin=2300,tend=2330,serverday=0},
}

function onActivityClick(player,act)
	if act == 1  then ActEnterbhdao(player);end
	if act == 2  then ActEnterkinggwgc(player);end
	if act == 3  then ActEnterygfx(player);end
	if act == 4  then ActEnterswjd(player);end
	if act == 5  then ActEnterwenquan(player);end
	if act == 6  then ActEnterwlzb(player);end
	if act == 7  then ActEnterygfx(player);end
	if act == 8  then ActEntertjzc(player);end
	if act == 9  then ActEnterhcbz(player);end
	if act == 10 then ActEnterbhdao(player);end
	if act == 11 then ActEntersqbg(player);end
	if act == 12 then ActEnterwenquan(player);end
	if act == 13 then ActEnterqlsd(player);end
	if act == 14 then ActEntertjzc(player);end
	if act == 15 then ActEntersqbg(player);end
	if act == 16 then ActEnterkinggwgc(player);end
	if act == 17 then ActEnterqlsd(player);end
	if act == 18 then ActEnterygfx(player);end
	if act == 19 then ActEnterbhdao(player);end
	if act == 20 then ActEnterswjd(player);end
	if act == 21 then ActEnterqlsd(player);end
	if act == 22 then ActEnterkinggwgc(player);end
end

function setRandName(player,team)
	if team == 1 then
		local tx = util.svn("numberred")+1;
		server.set_var("numberred",tx);
		player:set_name_plus("红方"..tx);
		player:set_param(const.PP_ZHANCHANG_NIMING,"红方"..tx);
	end
	if team == 2 then
		local tx = util.svn("numberblue")+1;
		server.set_var("numberblue",tx);
		player:set_name_plus("蓝方"..tx);
		player:set_param(const.PP_ZHANCHANG_NIMING,"蓝方"..tx);
	end
end

function ActEntertjzc(player)
	if player:get_dart_task_flag() == 1 and util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then
		player:alert(1,1,"请先将现在这趟镖走完再进入战场吧!");return;
	end
	if server.get_temp_var("tjzc") == "1" then
	if player:get_level() >= 70 then
		local m=server.find_map("tjzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 1 then
				if m:num_team_member(1)- m:num_team_member(2) >= 5 then
					player:alert(1,1,"对不起,红方阵营人数过多,请稍后再加入!");
					--onTalksmzc(npc,player);
				else
					player:set_team_info(1,"红方阵营");
					player:enter_map("tjzc",107,29);

					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end

					player:alert(1,1,"恭喜您成功加入红方阵营");
				end
			end
			if util.ppn(player,const.PP_SMZCZHENY) == 2 then
				if m:num_team_member(2) - m:num_team_member(1) >= 5 then
					player:alert(1,1,"对不起,蓝方阵营人数过多,请稍后再加入!");
				else
					player:set_team_info(2,"蓝方阵营");
					player:enter_map("tjzc",17,150);

					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end

					player:alert(1,1,"恭喜您成功加入蓝方阵营");
				end
			end
		else
		if m:num_team_member(2) >= m:num_team_member(1) then
			if m:num_team_member(2) == m:num_team_member(1) then
				local sj = math.random(1,2);
				if sj == 1 then
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,1);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(1,"红方阵营");
					setRandName(player,1);
					player:enter_map("tjzc",107,29);

					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end

					player:alert(1,1,"恭喜您成功加入红方阵营");
				else
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,2);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(2,"蓝方阵营");
					setRandName(player,2);
					player:enter_map("tjzc",17,150);

					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end

					player:alert(1,1,"恭喜您成功加入蓝方阵营");
				end
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,1);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
				player:set_team_info(1,"红方阵营");
				setRandName(player,1);
				player:enter_map("tjzc",107,29);

				--统计活跃度--
				player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
				if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
					player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
				end

				player:alert(1,1,"恭喜您成功加入红方阵营");
			end
		else
		player:set_param(const.PP_SMZCHOUR,hour());
		player:set_param(const.PP_SMZCZHENY,2);
		player:set_param(const.PP_SMZCKILL,0);
		player:set_param(const.PP_SMZCJIFEN,0);
		player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
		player:set_team_info(2,"蓝方阵营");
		setRandName(player,2);
		player:enter_map("tjzc",17,150);

		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
		end

		player:alert(1,1,"恭喜您成功加入蓝方阵营");
		end
	end
	else
		player:alert(1,1,"对不起,您的等级不足70级,无法进入!");
	end
	else
	player:alert(1,1,"对不起,天晶战场没有开启,暂时无法进入!");
	end
end

function ActEnterbhdao(player)
	if server.get_temp_var("BHDAO") == "1" then
		if player:get_map():get_id() == "binghuodao" then
			player:alert(1,1,"你已经在冰火岛咯!!");
		else
			if player:get_level() >= 50 then
				player:enter_map("binghuodao",13,141);

				--统计活跃度--
				player:set_param(const.PP_HUOYUEDU_NUM9,util.ppn(player,const.PP_HUOYUEDU_NUM9)+1);
				if util.ppn(player,const.PP_HUOYUEDU_NUM9)==2 then
					player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
				end

				go.givehuicheng(player);
				if util.ppn(player,const.PP_JINRUBHDAO) ~= hour() then
					player:set_param(const.PP_JINRUBHDAO,hour());
				end
			else
			player:alert(1,1,"想要进入冰火岛?你还是先到50级再说吧!!");
			end
		end
	else
		player:alert(1,1,"对不起,冰火岛活动还没有开启,暂时无法进入!");
	end
end

function ActEnterygfx(player)
	if server.get_temp_var("YGFX") == "1" then
		if player:get_map():get_id() == "ygfx" then
			player:alert(1,1,"你已经在远古废墟咯!!");
		else
			if player:get_level() >= 50 then
				player:enter_map("ygfx",61,163);
				--统计活跃度--
				player:set_param(const.PP_HUOYUEDU_NUM11,util.ppn(player,const.PP_HUOYUEDU_NUM11)+1);
				if util.ppn(player,const.PP_HUOYUEDU_NUM11)==2 then
					player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
				end 
				go.givehuicheng(player);
				if util.ppn(player,const.PP_JINRUYGFX) ~= hour() then
					player:set_param(const.PP_JINRUYGFX,hour());
					server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入了远古废墟!");
				end
			else
			player:alert(1,1,"想要进入远古废墟?你还是先到50级再说吧!!");
			end
		end
	else
		player:alert(1,1,"对不起,远古废墟活动还没有开启,暂时无法进入!");
	end
end

function ActEnterhcbz(player)
	if server.get_temp_var("HCBZ") == "1" then
		if player:get_level() >= 50 then
			player:enter_map("hcbz",45,135);

			--统计活跃度--
			player:set_param(const.PP_HUOYUEDU_NUM10,util.ppn(player,const.PP_HUOYUEDU_NUM10)+1);
			if util.ppn(player,const.PP_HUOYUEDU_NUM10)==2 then
				player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			end 
			
			go.givehuicheng(player);
			if util.ppn(player,const.PP_JINRUHCBZ) ~= hour() then
				player:set_param(const.PP_JINRUHCBZ,hour());
				server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入了皇城宝藏!");
			end
		else
		player:alert(1,1,"想要进入皇城宝藏?你还是先到50级再说吧!!");
		end
	else
		player:alert(1,1,"对不起,皇城宝藏活动还没有开启,暂时无法进入!");
	end
end


function ActEnterkinggwgc(player)
	if player:get_map():get_id() == "v005" then
		player:alert(1,1,"你已经在王城咯!!");
	else
		if player:get_level() >= 35 then
			player:enter_map("v005",57,103);
			go.givehuicheng(player);
		else
			player:alert(1,1,"想去王城??还是35级以后再去吧!");
		end
	end
end

function ActEnterswjd(player)
	if server.get_temp_var("swjd") == "1" then
		if player:get_map():get_id() == "swjd1" then
			player:alert(1,1,"你已经在死亡禁地咯!!");
		else
			if player:get_level() >= 45 then
				player:enter_map("swjd1",217,226);
				go.givehuicheng(player);
			else
			player:alert(1,1,"由于死亡禁地过于凶险,你还是[45级]以后再进入吧!");
			end
		end
	else
		player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!<br>开启时间:11点15分,22点15分");
	end
end

function ActEnterwenquan(player)
	if tonumber(server_start_day()) >= 1 then
		local h = os.date("%H%M",os.time());
		if tonumber(h) >= 1200 and tonumber(h) <= 1229 or tonumber(h) >= 1800 and tonumber(h) <= 1829 or server.get_temp_var("wenquan") == "1" then
			if player:get_map():get_id() == "wenquan" then
				player:alert(1,1,"你已经在温泉馆咯!!");
			else
				if player:get_level() >= 40 then
					local map = server.find_map("wenquan");
					local x,y;
					x,y=map:gen_rand_position();
					if( x and y )then
						player:enter_map("wenquan",x,y);
						go.givehuicheng(player);
					end
				else
					player:alert(1,1,"想要泡温泉?你还是先到40级再说吧!!");
				end
			end
		else
			player:alert(1,1,"温泉馆只在中午[12:00-12:30]和下午[18:00-18:30]营业哦!");
		end
	else
		player:alert(1,1,"[温泉馆]将于明天正式开始营业哦!届时欢迎您的大驾光临!!");
	end
end

function ActEnterwlzb(player)
	if server.get_temp_var("wlzb") == "2" then
			player:alert(1,1,"武林争霸活动已经开始,入口已经关闭");
	else
		if player:get_map():get_id() == "wlzb" then
			player:alert(1,1,"你已经在武林争霸大厅咯!!");
		else
			if server.get_temp_var("wlzb") == "1" then
				if player:get_level() >= 40 then
				local map = server.find_map("wlzb");
					local x,y;
					x,y=map:gen_rand_position();
					if( x and y )then
						player:enter_map("wlzb",x,y);
					end
					player:alert(1,1,"武林争霸赛将于[13:10]正式开始!请做好准备!")
				else
				player:alert(1,1,"对不起,参与武林争霸活动需要达到40级!");
				end
			else
				player:alert(1,1,"现在不是报名时间,请到报名时间再来找我吧!");
			end
		end
	end
end

function ActEntersqbg(player)
	if player:get_map():get_id() == "sqbg" then
		player:alert(1,1,"你已经在神器宝阁咯!!");
	else
		if player:get_level() >= 45 then
			local map = server.find_map("sqbg");
			local x,y;
			x,y=map:gen_rand_position();
			if( x and y )then
				player:enter_map("sqbg",x,y);
				go.givehuicheng(player);
			end
		else
			player:alert(1,1,"进入神器宝阁需要等级达到45级以上");
		end
	end
end

function ActEnterqlsd(player)
	if server.get_temp_var("qlsd") == "1" then
		if player:get_map():get_id() == "qlsd" then
			player:alert(1,1,"你已经在麒麟圣殿咯!!");
		else
			if player:get_level() >= 45 then
				local map = server.find_map("qlsd");
				local x,y;
				x,y=map:gen_rand_position();
				if( x and y )then
					player:enter_map("qlsd",x,y);
					go.givehuicheng(player);
				end
			else
			player:alert(1,1,"由于麒麟圣殿过于凶险,您还是[45级]以后再进入吧!");
			end
		end
	else
		player:alert(1,1,"对不起,目前[麒麟圣殿]入口尚未打开!");
	end
end


function process_actinfo_fresh(player,actionset,panelid,actionid)
	if string.sub(actionid,1,11) == "txtactivity" then
		local click = tonumber(string.sub(actionid,12));
		if click == 1 or click == 2 or click == 3 then
			process_actinfo_click(player,click);
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_actinfo_fresh);


function process_actinfo_click(player,ck)
	local curt = tonumber(os.date("%H%M",os.time()));
	local record = 0;
	for i = 1,#actdata do
		local td = actdata[i];
		if td then
			if server_start_day() >= td.serverday then
				if curt < td.tend then
					record = record + 1;
					if record == ck then
						if td.begin <= curt then
							onActivityClick(player,i)
						else
							player:alert(1,1,"活动尚未开启!");
						end
					end
					if record >= 3 then break; end
				end
			end
		end
	end
end

function getSecond(pass)
	local hour = math.floor(pass/100);
	local minute = pass - 100*hour;
	local second = 3600*hour + minute*60;
	return second;
end

function fresh_actinfo_show(player)
	local curt = tonumber(os.date("%H%M",os.time()));
	local record = 0;
	for i = 1,#actdata do
		local td = actdata[i];
		if td then
			if server_start_day() >= td.serverday then
				if curt < td.tend then
					record = record + 1;
					if td.begin > curt then
						local ss = tonumber(os.date("%S",os.time()));
						local second = getSecond(td.begin) - getSecond(curt) - ss;
						player:set_panel_data(PANEL_ACTIONSET_NAME,"actilist","act"..record,actdata[i].name.."_"..second.."_1");
					else
						player:set_panel_data(PANEL_ACTIONSET_NAME,"actilist","act"..record,actdata[i].name.."_0_0");
					end
					if record >= 3 then break; end
				end
			end
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_actinfo_show);