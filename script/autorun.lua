module(..., package.seeall)
--------------跨服战--------------
function checkkuafustart()
	if true then return; end
	if tonumber(weekday()) ~= 0 then return; end
	server.start_kuafu();

	server.set_var("server_kuafu_timer",tostring(os.time()));
	server.set_var("kuafuownertime","");
	server.set_var("kuafuowner","");
	server.set_var("kuafuguild","");
	server.set_var("kuafuarea","");
	
	server.server_exe("newgui.lingdi.kuafubegin");
	server.info(100,0,"跨服战已开启!")
end
function checkkuafustop()
	if true then return; end
	if tonumber(weekday()) ~= 0 then return; end
	kuafustop();
end
function kuafustop()
	if server.get_kuafu_state() > 0 then
		server.set_temp_var("kuafuzhan","");
		server.stop_kuafu();
		server.set_var("kuafuowner","");
		server.server_exe("newgui.lingdi.kuafustop");
		server.info(100,0,"跨服战已关闭!")
	end
end
function kuafuInfo()
	if true then return; end
	if tonumber(weekday()) ~= 0 then return; end
	local kuafuarea = server.get_var("kuafuarea");
	local kuafuguild = server.get_var("kuafuguild");
	if kuafuarea ~= "" and kuafuguild ~= "" then
		server.info(100,0,"异界占领者为 "..kuafuarea.." "..kuafuguild.."!");
	end
end
function checkwarstart()
	---------------------------------
	local kg = server.get_king_guild();
	server.set_var("preking",kg);
	----------------------------------
	local today_name = "war_tag_" .. today();
	if server.get_var(today_name) ~= "" then
		server.set_var(today_name,"");
		server.start_war();
	end
	----------------------------------------------------------------------↑攻城战↓领地争夺战
	newgui.lingdi.openLingDI();
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function checkwarstop()
	if server.get_war_state() > 0 then
		server.stop_war();
	end
	---------------------------------------------------------------------
	if server.get_var("hold_guild") == nil or server.get_var("hold_guild") == ""  then
		server.set_var("hold_guild",0);
	end
	if is_merge_server() then
		local kg = server.get_king_guild();
		local hfkg = server.get_var("king3name");
		local prekg = server.get_var("preking");
		if kg ~= "" and ( hfkg == nil or hfkg == "" ) then
			if prekg == kg then
				server.set_var("hold_guild",(tonumber(server.get_var("hold_guild"))+1));
			else
				server.set_var("hold_guild",1);
			end
			if tonumber(server.get_var("hold_guild")) == 3 then
				server.set_var("king3name",kg);
			end
			--server.server_exe("newgui.hequ.freshHfGuildInfo");
		end
	else
		server.set_var("hold_guild",0);
		server.set_var("gotkg_day",0);
		server.set_var("king3name","");
		server.set_var("preking","");
	end
	---------------------------------------------------------------------
end

function checklingdistop()
	newgui.lingdi.closeLingDI();
end

function gxxx()
	qfsb();
	afbsts();
	server.server_exe("npc.genxxx.gx");
	server.server_exe("task.task3002.check_richang_day");
	server.server_exe("task.task3003.check_richang_day");
	server.server_exe("task.task3004.check_richang_day");
	server.server_exe("task.task3005.check_yabiao_day");
	server.server_exe("task.task3010.check_yxtie_day");
	server.server_exe("npc.fuben.check_fuben_day");
	server.server_exe("npc.mijing.check_mijing_day");
	server.server_exe("npc.dituyidong.check_ymsy_day");
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function openhcbz()
	server.set_temp_var("HCBZ","1");
	local map = server.find_map("hcbz");
	if map then
		map:clear_mon();
		map:mon_gen(67,97,"皇家骑卫",50,30,120,0);
		map:mon_gen(67,97,"皇家侍卫",50,30,120,0);

		map:mon_gen(67,97,"万年摇钱树",1,0,300,0,"no_owner");
		map:mon_gen(27,105,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(10,88,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(39,63,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(67,35,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(110,93,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(89,132,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(67,153,"摇钱树",1,0,120,0,"no_owner");
		map:mon_gen(89,62,"摇钱树",1,0,120,0,"no_owner");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.info(10010,0,"皇城宝藏开启了,请速从地图传送员点击进入!");
end

function closehcbz()
	server.set_temp_var("HCBZ","");
	server.info(10010,0,"皇城宝藏地图已关闭,感谢您的参与!");
	local map = server.find_map("hcbz");
	if map then
		map:map_exe("go.home");
		map:clear_mon();
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function start_exp_mul(gap,mul)
	if gap == 0 and mul == 1 then
		server.info(10010,0,"全服多倍经验活动已经关闭,感谢您对我们游戏的支持!");return;
	end
	if gap > 0 and mul > 1 and mul <= 10 then
		server.info(10010,0,"全服"..mul.."倍经验活动已经开启,感谢您对我们游戏的支持!");
	end
end

function afbsts()
	if newgui.jingcaihuodong.isOpenActivity(nil,"bshcsd") then
		server.set_merge_mul(20);
	else
		server.set_merge_mul(0);
	end
end

function qfsb()
	if activity.isDoubleExpOpen() or newgui.jingcaihuodong.isOpenActivity(nil,"qfsbge")  then
		server.info(10010,0,"全服双倍经验活动已经开启,感谢您对我们游戏的支持!");
		server.set_exp_mul(2);
	else
		if ymd() == activity.CONST_DOUBLE_EXP_CLOSE then
		server.info(10010,0,"全服双倍经验活动已经关闭,感谢您对我们游戏的支持!");
		server.set_exp_mul(1);
		end
		if tonumber(server_start_day()) == 3 then
			server.info(10010,0,"全服双倍经验活动已经关闭,感谢您对我们游戏的支持!");
			server.set_exp_mul(1);
		end
		if tonumber(server.get_exp_mul()) >= 2 and ymd() > activity.CONST_DOUBLE_EXP_CLOSE and tonumber(server_start_day()) > 3 then
			server.info(10010,0,"全服双倍经验活动已经关闭,感谢您对我们游戏的支持!");
			server.set_exp_mul(1);
		end
	end
end


function sqjf()
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("sqbg");
		if map:num_monster("天魔兽") == 0 and map:num_monster("天魔兽10") == 0 then
			map:mon_gen(31,40,"天魔兽",1,0,1,1,"no_owner");
		end
	else
		local map = server.find_map("sqbg");
		if map:num_monster("天魔兽") == 0 and map:num_monster("天魔兽10") == 0 then
			map:mon_gen(31,40,"天魔兽10",1,0,1,1,"no_owner");
		end
	end
	server.server_exe("npc.dituyidong.move_sqbg");
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.info(10000,0,"上古魔兽[天魔兽]出现在[神器宝阁],从土城[神器使者]进入挑战可获得神器积分");
end

function sctz()
	local map = server.find_map("v002");
	if map:num_monster("送财童子") == 0 then
		local x,y;
		x,y=map:gen_rand_position();
		if( x and y )then
		map:mon_gen(x,y,"送财童子",1,0,1,1,"no_owner");
		end
	end
	if map:num_monster("送财童子") == 1 then
		local x,y;
		x,y=map:gen_rand_position();
		if( x and y )then
		map:mon_gen(x,y,"送财童子",1,0,1,1,"no_owner");
		end
	end
	local map1 = server.find_map("v003");
	if map1:num_monster("送财童子") == 0 then
		local x,y;
		x,y=map1:gen_rand_position();
		if( x and y )then
		map1:mon_gen(x,y,"送财童子",1,0,1,1,"no_owner");
		end
	end
	if map1:num_monster("送财童子") == 1 then
		local x,y;
		x,y=map1:gen_rand_position();
		if( x and y )then
		map1:mon_gen(x,y,"送财童子",1,0,1,1,"no_owner");
		end
	end
	server.info(10000,0,"[送财童子]出现在[云霄城]和[沙漠土城],勇士们,发财的机会到啦!!");
end


function wlzbgg()
	if tonumber(server_start_day()) >= 1 then
			server.server_exe("npc.renwu.wlzb.wlmzontime");
			server.server_exe("newgui.actinfo.fresh_actinfo_show");
			server.set_var("wlmz","");
			server.info(10000,0,"[武林争霸]报名已经开始,各位勇士可以从土城[武林争霸使者]处报名进入!参加活动可获得丰厚奖励哦!");
			server.info(10,0,"<font color='#ff0000'>武林争霸入口开启,10分钟后关闭!</font>");
			local map = server.find_map("wlzb");
			map:set_flag_pkprohibit(1);
			server.set_temp_var("wlzb",1);
			server.server_exe("npc.dituyidong.move_wlzb");
	else
		server.info(10000,0,"武林争霸将于开区1天后每天的(13:00)举行,请各位勇士互相转告!");
	end	
end
	


function wlzbkq()
	if server.get_temp_var("wlzb") == "1" then
		server.server_exe("newgui.actinfo.fresh_actinfo_show");
		server.server_exe("npc.renwu.wlzb.wlzbjiangli");
		server.set_var("wlmz","");
		server.info(10,0,"<font color='#ff0000'>武林争霸赛已经开始,入口关闭!</font>");
		server.info(10,0,"<font color='#ff0000'>大厅所有人获得荣誉和经验奖励</font>");
		server.info(10000,0,"武林争霸现在开始,让我们期待新一任的武林盟主诞生吧!");
		local map = server.find_map("wlzb");
		map:set_flag_pkprohibit(0);
		server.set_temp_var("wlzb",2);
	end
end


function wlzbgb()
	if server.get_temp_var("wlzb") == "2" then
		server.set_temp_var("wlzb",0);
		local map = server.find_map("wlzb");
		map:map_exe("npc.renwu.wlzb.cwlmz");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end



function kqsbjy()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if tonumber(server_start_day()) >= 1 then
		if tonumber(server.get_exp_mul()) == 1 then
			server.info(10010,0,"升级乐翻天活动已经开启,打怪经验增加1倍,活动时间为:1小时");
			server.set_exp_mul(2);
			if server.get_temp_var("sbjy") == "" then
				server.set_temp_var("sbjy",1);
			end
		end
	end
end


function gbsbjy()
	if ymd() == 20140123 or ymd() == 20140124  or ymd() == 20140125 or ymd() == 20140126 or ymd() == 20140127 then
	else
		if server.get_temp_var("sbjy") == "1" then
			server.info(10010,0,"升级乐翻天活动已经关闭,感谢各位玩家的参与");
			server.set_exp_mul(1);
			server.set_temp_var("sbjy","");
		end
	end
end



function smzcgg()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("smzc");
		map:clear_mon();
		server.set_var("zhanchangmvp","");
		server.set_var("smzcpma1","");
		server.set_var("smzcpmb1",0);
		server.set_var("smzcpmc1","");
		server.set_var("smzcpma2","");
		server.set_var("smzcpmb2",0);
		server.set_var("smzcpmc2","");
		server.set_var("smzcpma3","");
		server.set_var("smzcpmb3",0);
		server.set_var("smzcpmc3","");
		server.info(10000,0,"神魔战场的入口将在十分钟后开启,请各位勇士做好准备从土城进入!");
	else
		server.info(10000,0,"神魔战场将在新区开放后的第二天全面开启,请各位玩家互相告知!");
	end
end

function smzckq()
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("smzc");
		map:clear_mon();
		server.set_temp_var("smzc",1);
		server.set_temp_var("szzy",0);
		server.set_temp_var("mzzy",0);
		server.set_var("zhanchangmvp","");
		server.set_var("smzcpma1","");
		server.set_var("smzcpmb1",0);
		server.set_var("smzcpmc1","");
		server.set_var("smzcpma2","");
		server.set_var("smzcpmb2",0);
		server.set_var("smzcpmc2","");
		server.set_var("smzcpma3","");
		server.set_var("smzcpmb3",0);
		server.set_var("smzcpmc3","");
		server.set_var("numberred","0");
		server.set_var("numberblue","0");
		
		server.info(10000,0,"神魔战场已经开启,40级以上勇士可从土城进入[神魔战场]");
		map:map_exe("npc.zhanchang.onTalktuichu");
		local map = server.find_map("smzc");
		if map then
			map:mon_gen(81,58,"修罗战士",100,50,1,0);
			map:mon_gen(53,86,"修罗战士",100,50,1,0);
		end
	end
end


function smzcboss()
	if server.get_temp_var("smzc") == "1" then
	local map1 = server.find_map("smzc");
		if map1:num_monster("修罗王") == 0  then
			map1:mon_gen(69,70,"修罗王",1,0,1,1,"no_owner");
		end
		server.info(10010,0,"上古邪神[修罗王]出现在神魔战场,勇士们获取神装的机会来了!!");
	end
end

function smzcgb()
	local ydzy = server.get_temp_var("szzy");
	local hdzy = server.get_temp_var("mzzy");
	if ydzy == nil or ydzy == "" then
		ydzy = 0;
	else
		ydzy = tonumber(ydzy);
	end
	if hdzy == nil or hdzy == "" then
		hdzy = 0;
	else
		hdzy = tonumber(hdzy);
	end
	if server.get_temp_var("smzc") == "1" then
		local map = server.find_map("smzc");
		if ydzy == hdzy then
			server.set_temp_var("smzc",0);
			server.info(10010,0,"神魔战场已经结束,本次战场以平局告终!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.zhanchang.onTalkping");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy >= hdzy then
			server.set_temp_var("smzc",0);
			server.info(10010,0,"神魔战场已经结束,[神族阵营]取得了胜利!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.zhanchang.onTalkshenzu");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy <= hdzy then
			server.set_temp_var("smzc",0);
			server.info(10010,0,"神魔战场已经结束,[魔族阵营]取得了胜利!["..server.get_var("smzcpma1").."]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.zhanchang.onTalkmozu");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
	end
end

function tjzcgg()
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("tjzc");
		server.set_var("zhanchangmvp","");
		server.set_var("smzcpma1","");
		server.set_var("smzcpmb1",0);
		server.set_var("smzcpmc1","");
		server.set_var("smzcpmd1","");
		server.set_var("smzcpma2","");
		server.set_var("smzcpmb2",0);
		server.set_var("smzcpmc2","");
		server.set_var("smzcpmd2","");
		server.set_var("smzcpma3","");
		server.set_var("smzcpmb3",0);
		server.set_var("smzcpmc3","");
		server.set_var("smzcpmd3","");
		server.info(10010,0,"天晶战场的入口将在十分钟后开启,请各位勇士做好准备从土城进入!");
	else
		server.info(10010,0,"天晶战场将在新区开放后的第二天全面开启,请各位玩家互相告知!");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function tjzckq()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("tjzc");
		server.set_temp_var("tjzc",1);
		server.set_temp_var("szzy",0);
		server.set_temp_var("mzzy",0);
		server.set_var("zhanchangmvp","");
		server.set_var("smzcpma1","");
		server.set_var("smzcpmb1",0);
		server.set_var("smzcpmc1","");
		server.set_var("smzcpmd1","");
		server.set_var("smzcpma2","");
		server.set_var("smzcpmb2",0);
		server.set_var("smzcpmc2","");
		server.set_var("smzcpmd2","");
		server.set_var("smzcpma3","");
		server.set_var("smzcpmb3",0);
		server.set_var("smzcpmc3","");
		server.set_var("smzcpmd3","");

		server.set_var("numberred",0);
		server.set_var("numberblue",0);

		server.set_var("server_tj_timer",tostring(os.time()));
		server.info(10010,0,"天晶战场已经开启,70级以上勇士可从土城进入[天晶战场]!");
	end
end


function tjzcgb()
	local ydzy = server.get_temp_var("szzy");
	local hdzy = server.get_temp_var("mzzy");
	if ydzy == nil or ydzy == "" then
		ydzy = 0;
	else
		ydzy = tonumber(ydzy);
	end
	if hdzy == nil or hdzy == "" then
		hdzy = 0;
	else
		hdzy = tonumber(hdzy);
	end
	if server.get_temp_var("tjzc") == "1" then
		local map = server.find_map("tjzc");
		if ydzy == hdzy then
			server.set_temp_var("tjzc",0);
			server.info(10010,0,"天晶战场已经结束,本次战场以平局告终!["..server.get_var("smzcpma1").."("..server.get_var("smzcpmd1")..")]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.tjkuang.EndPing");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy >= hdzy then
			server.set_temp_var("tjzc",0);
			server.info(10010,0,"天晶战场已经结束,[红方阵营]取得了胜利!["..server.get_var("smzcpma1").."("..server.get_var("smzcpmd1")..")]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.tjkuang.EndHong");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
		if ydzy <= hdzy then
			server.set_temp_var("tjzc",0);
			server.info(10010,0,"天晶战场已经结束,[蓝方阵营]取得了胜利!["..server.get_var("smzcpma1").."("..server.get_var("smzcpmd1")..")]勇夺本次战场积分第一名![成就+2000]");
			server.set_var("smzcpmc1",server.get_var("smzcpma1"));
			map:map_exe("npc.tjkuang.EndLan");
			server.set_temp_var("szzy",0);
			server.set_temp_var("mzzy",0);
		return;
		end
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function swjdkq()
	server.set_temp_var("swjd",1);
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.info(10000,0,"[死亡禁地之门]已经打开,想要获取神级装备的可从传送员进入挑战!!");
	server.info(10,0,"[死亡禁地之门]已经打开,想要获取神级装备及装备灵魂石的勇士们可从传送员进入挑战!![<a href='event:push_lua_goswjd'><u><font color='#00FF00'>我要参与</font></u></a>]");
end

function swjdsx()
	if server.get_temp_var("swjd") == "1" then
		local map2 = server.find_map("swjd1");
		if map2:num_monster("八十万鱼妖教头") == 0 then
			map2:mon_gen(93,99,"八十万鱼妖教头",1,0,1,1);
		end
		if map2:num_monster("奔波儿灞") == 0 then
			map2:mon_gen(112,214,"奔波儿灞",1,0,1,1);
		end
		if map2:num_monster("灞波尔奔") == 0 then
			map2:mon_gen(206,116,"灞波尔奔",1,0,1,1);
		end
		local map1 = server.find_map("swjd2");
		if map1:num_monster("灵剑侍卫") == 0 then
			map1:mon_gen(97,100,"灵剑侍卫",1,0,1,1);
		end
		if map1:num_monster("告密者马拉修斯") == 0 then
			map1:mon_gen(106,216,"告密者马拉修斯",1,0,1,1);
		end
		if map1:num_monster("八十万鱼妖教头") == 0 then
			map1:mon_gen(207,112,"八十万鱼妖教头",1,0,1,1);
		end
		local map = server.find_map("swjd3");
		if map:num_monster("灵剑侍卫") == 0 then
			map:mon_gen(106,96,"灵剑侍卫",1,0,1,1);
		end
		if map:num_monster("控火者费尔斯通") == 0 then
			map:mon_gen(55,44,"控火者费尔斯通",1,0,1,1);
		end
		server.info(10,0,"[<font color='#ff0000'>控火者费尔斯通</font>]出现在[死亡禁地]!");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function swjdgb()
	if server.get_temp_var("swjd") == "1" then
		server.set_temp_var("swjd",0);
		server.info(10000,0,"[死亡禁地之门]已经关闭,请耐心等待下次开启!");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end




function ymsykq()
--	server.set_temp_var("ymsy",1);
--	server.info(10010,0,"[幽冥圣域]已经开放,想要获取神级装备的可从传送员进入挑战!!");
end

function ymsygb()
--	if server.get_temp_var("ymsy") == "1" then
--		server.set_temp_var("ymsy",0);
--		server.info(10000,0,"[幽冥圣域]已经关闭,请耐心等待下次开启!");
--	end
end



function tmd1()
	if tonumber(server_start_day()) >= 1 then
		local map1 = server.find_map("tmda");
			map1:clear_mon();
		local map2 = server.find_map("tmdb");
			map2:clear_mon();
		server.set_temp_var("tmd",1);
		server.set_temp_var("tmd1",0);
		server.set_temp_var("tmd2",0);
		server.info(10010,0,"[天魔殿]的入口已经打开,各位勇士可在[土城传送员]处进入[天魔殿]!入口将在10分钟后关闭!");
	end
end


function tmd2()
	if server.get_temp_var("tmd") == "1" then
		server.set_temp_var("tmd",2);
		local map1 = server.find_map("tmda");
		local map2 = server.find_map("tmdb");
			map1:mon_gen(45,55,"天魔殿统领1",1,0,1,1,"no_owner");
			map2:mon_gen(45,55,"天魔殿统领2",1,0,1,1,"no_owner");
			server.info(10010,0,"[天魔殿]入口已经关闭,[天魔殿统领]已经出现!打败他即可进入[天魔殿]挑战[无相天魔]!");
	end
end


function tmdboss()
	if server.get_temp_var("tmd") == "2" then
		local map2 = server.find_map("tmdc");
		map2:mon_gen(45,55,"无相天魔",1,0,1,1);
		server.info(10010,0,"[无相天魔]已经出现在[天魔殿],打败他就有机会获取顶级神兵,神级套装和鸿天混元盔哦!");
	end
end

function tmd3()
	if server.get_temp_var("tmd") == "2" then
		local map1 = server.find_map("tmda");
		local map2 = server.find_map("tmdb");
		local map3 = server.find_map("tmdc");
			map1:map_exe("npc.tmd.onTalktctmd");
			map2:map_exe("npc.tmd.onTalktctmd");
			map3:map_exe("npc.tmd.onTalktctmd");
			server.set_temp_var("tmd",0);
			server.info(10010,0,"[勇闯天魔殿]的活动已经结束,感谢各位勇士的参与!");
	end
end


function gwgc1()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("v005");
		map:clear_mon();
		if map:num_monster("玄天星君") == 0 then
			map:mon_gen(40,75,"玄天星君",1,80,1,1,"no_owner");
		        server.info(10,0,"[<font color='#ff0000'>玄天星君</font>]出现在[王城]!");
		end
		map:mon_gen(40,75,"星河悍将",4,80,1,1,"no_owner");
		map:mon_gen(40,75,"角木蛟",40,80,10,1,"no_owner");
		map:mon_gen(40,75,"壁水貐",40,80,10,1,"no_owner");
		map:mon_gen(40,75,"氐土貉",40,80,10,1,"no_owner");
		server.info(10010,0,"灾星降临[王城]，[玄天星君]率领星界大军入侵,勇士们快快前往王城抵挡!");
	else
		server.info(10010,0,"[王城]上空惊现九星连珠异像,近日必有灾星降临，勇士们要做好准备!");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end

function gwgc2()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if tonumber(server_start_day()) >= 1 then
		local map = server.find_map("v005");
		map:clear_mon();
		if map:num_monster("玄天星君") == 0 then
			map:mon_gen(40,75,"玄天星君",1,80,1,1,"no_owner");
		        server.info(10,0,"[<font color='#ff0000'>玄天星君</font>]出现在[王城]!");
		end
		map:mon_gen(40,75,"星河悍将",4,80,1,1,"no_owner");
		map:mon_gen(40,75,"角木蛟",40,80,10,1,"no_owner");
		map:mon_gen(40,75,"壁水貐",40,80,10,1,"no_owner");
		map:mon_gen(40,75,"氐土貉",40,80,10,1,"no_owner");
		server.info(10010,0,"灾星降临[王城]，[玄天星君]率领星界大军入侵,勇士们快快前往王城抵挡!");
	else
		server.info(10010,0,"[王城]上空惊现九星连珠异像,近日必有灾星降临，勇士们要做好准备!");
	end
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
end





function kqwenquan()
	if tonumber(server_start_day()) >= 1 then
		server.server_exe("newgui.actinfo.fresh_actinfo_show");
		server.info(10010,0,"云霄城的[温泉馆]已经开张啦!快去泡温泉吧!不仅对身体好,还能获得大量经验哦!");
		if server.get_temp_var("wenquan") == "" then
			server.set_temp_var("wenquan",1);
		end
	else
		server.info(10010,0,"云霄城的[温泉馆]将于明天正式开业啦!欢迎大家光临哦!");
	end
end


function gbwenquan()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if server.get_temp_var("wenquan") == "1" then
		server.info(10010,0,"[温泉馆]的歇业时间已经到了!请大家下次再来吧!");
		server.set_temp_var("wenquan","");
	end
end




function kqmijingjy()
	local exp_data = {"mijing40","mijing50","mijing60","mijing70","mijing80","mijing90","mijing100"}
	for i=1,#exp_data do
	local map = server.find_map(exp_data[i]);
	   if map then
	       map:set_exp_mul(120);
	   end
	end
	if server.get_temp_var("mijing") == "" then
		server.set_temp_var("mijing",1);
		server.info(10010,0,"练级场地图[1.2倍经验]已经开启,现在进入可获得更多经验!");
	end
end


function gbmijingjy()
	local exp_data = {"mijing40","mijing50","mijing60","mijing70","mijing80","mijing90","mijing100"}
	for i=1,#exp_data do
	local map = server.find_map(exp_data[i]);
	   if map then
	       map:set_exp_mul(100);
	   end
	end
	if server.get_temp_var("mijing") == "1" then
		server.info(10010,0,"练级场地图[1.2倍经验]已经关闭,感谢您的参与!");
		if ymd() == 20140123 or ymd() == 20140124  or ymd() == 20140125 or ymd() == 20140126 or ymd() == 20140127 then
		else
			server.set_exp_mul(1);
		end
		server.set_temp_var("mijing","");
	end
end



function xqsbjy()
	if tonumber(server_start_day()) == 2 then
		if tonumber(server.get_exp_mul()) == 1 then
			server.info(10010,0,"新区升级乐翻天活动已经开启,打怪经验增加1倍,结束时间为[24:00]");
			server.set_exp_mul(2);
			if server.get_temp_var("sbjy") == "" then
				server.set_temp_var("sbjy",1);
			end
		end
	end
end


function gbxqsb()
	if server.get_temp_var("sbjy") == "1" then
		server.info(10010,0,"新区升级乐翻天活动已经关闭,感谢各位玩家的参与");
		server.set_exp_mul(1);
		server.set_temp_var("sbjy","");
	end
end



function xqboss()
	if tonumber(server_start_day()) == 1 then
		local map = server.find_map("v005");
		if map:num_monster("地魔兽") == 0 then
			map:mon_gen(40,70,"地魔兽",1,1,1,1,"no_owner");
		end
		if map:num_monster("奴玛教皇") == 0 then
			map:mon_gen(40,75,"奴玛教皇",1,100,1,1);
		end
		if map:num_monster("变异蛇蝎王") == 0 then
			map:mon_gen(40,75,"变异蛇蝎王",1,100,1,1);
		end
		if map:num_monster("猛犸教皇") == 0 then
			map:mon_gen(40,75,"猛犸教皇",1,100,1,1);
		end
		if map:num_monster("牛魔圣君") == 0 then
			map:mon_gen(40,75,"牛魔圣君",1,100,1,1);
		end
		if map:num_monster("妖月金刚") <= 2 then
			map:mon_gen(40,75,"妖月金刚",4,100,10,1);
		end
		if map:num_monster("妖月血魔") <= 2 then
			map:mon_gen(40,75,"妖月血魔",4,100,10,1);
		end
		if map:num_monster("蛮牛王") <= 2 then
			map:mon_gen(40,75,"蛮牛王",4,100,10,1);
		end
		if map:num_monster("巨灵勇士") <= 10 then
			map:mon_gen(40,75,"巨灵勇士",30,100,10,1);
		end
		if map:num_monster("巨灵战士") <= 10 then
			map:mon_gen(40,75,"巨灵战士",30,100,10,1);
		end
		if map:num_monster("巨灵战斧") <= 10 then
			map:mon_gen(40,75,"巨灵战斧",30,100,10,1);
		end
		if map:num_monster("巨灵守卫") <= 10 then
			map:mon_gen(40,75,"巨灵守卫",30,100,10,1);
		end
		server.info(10010,0,"[王城]正遭受[地魔兽]所带领的魔界大军入侵,消灭[地魔兽]将会100%掉落传说的[骠骑将军护腕]!");
		server.server_exe("npc.dituyidong.move_kingcity1");
	end
	if tonumber(server_start_day()) == 2 then
		local map = server.find_map("v005");
		if map:num_monster("炎魔兽") == 0 then
			map:mon_gen(40,70,"炎魔兽",1,1,1,1,"no_owner");
		end
		if map:num_monster("奴玛教皇") == 0 then
			map:mon_gen(40,75,"奴玛教皇",1,100,1,1);
		end
		if map:num_monster("变异蛇蝎王") == 0 then
			map:mon_gen(40,75,"变异蛇蝎王",1,100,1,1);
		end
		if map:num_monster("猛犸教皇") == 0 then
			map:mon_gen(40,75,"猛犸教皇",1,100,1,1);
		end
		if map:num_monster("牛魔圣君") == 0 then
			map:mon_gen(40,75,"牛魔圣君",1,100,1,1);
		end
		if map:num_monster("妖月金刚") <= 2 then
			map:mon_gen(40,75,"妖月金刚",4,100,10,1);
		end
		if map:num_monster("妖月血魔") <= 2 then
			map:mon_gen(40,75,"妖月血魔",4,100,10,1);
		end
		if map:num_monster("蛮牛王") <= 2 then
			map:mon_gen(40,75,"蛮牛王",4,100,10,1);
		end
		if map:num_monster("巨灵勇士") <= 10 then
			map:mon_gen(40,75,"巨灵勇士",30,100,10,1);
		end
		if map:num_monster("巨灵战士") <= 10 then
			map:mon_gen(40,75,"巨灵战士",30,100,10,1);
		end
		if map:num_monster("巨灵战斧") <= 10 then
			map:mon_gen(40,75,"巨灵战斧",30,100,10,1);
		end
		if map:num_monster("巨灵守卫") <= 10 then
			map:mon_gen(40,75,"巨灵守卫",30,100,10,1);
		end
		server.info(10010,0,"[王城]正遭受[炎魔兽]所带领的魔界大军入侵,消灭[炎魔兽]将会100%掉落[八级宝石]!");
		server.server_exe("npc.dituyidong.move_kingcity2");
	end
	if tonumber(server_start_day()) == 3 then
		local map = server.find_map("v005");
		if map:num_monster("暗魔兽") == 0 then
			map:mon_gen(40,70,"暗魔兽",1,1,1,1,"no_owner");
		end
		if map:num_monster("奴玛教皇") == 0 then
			map:mon_gen(40,75,"奴玛教皇",1,100,1,1);
		end
		if map:num_monster("变异蛇蝎王") == 0 then
			map:mon_gen(40,75,"变异蛇蝎王",1,100,1,1);
		end
		if map:num_monster("猛犸教皇") == 0 then
			map:mon_gen(40,75,"猛犸教皇",1,100,1,1);
		end
		if map:num_monster("牛魔圣君") == 0 then
			map:mon_gen(40,75,"牛魔圣君",1,100,1,1);
		end
		if map:num_monster("妖月金刚") <= 2 then
			map:mon_gen(40,75,"妖月金刚",4,100,10,1);
		end
		if map:num_monster("妖月血魔") <= 2 then
			map:mon_gen(40,75,"妖月血魔",4,100,10,1);
		end
		if map:num_monster("蛮牛王") <= 2 then
			map:mon_gen(40,75,"蛮牛王",4,100,10,1);
		end
		if map:num_monster("巨灵勇士") <= 10 then
			map:mon_gen(40,75,"巨灵勇士",30,100,10,1);
		end
		if map:num_monster("巨灵战士") <= 10 then
			map:mon_gen(40,75,"巨灵战士",30,100,10,1);
		end
		if map:num_monster("巨灵战斧") <= 10 then
			map:mon_gen(40,75,"巨灵战斧",30,100,10,1);
		end
		if map:num_monster("巨灵守卫") <= 10 then
			map:mon_gen(40,75,"巨灵守卫",30,100,10,1);
		end
		server.info(10010,0,"[王城]正遭受[暗魔兽]所带领的魔界大军入侵,消灭[暗魔兽]将会100%掉落[九级宝石]!");
		server.server_exe("npc.dituyidong.move_kingcity3");
	end
end




function qlsd()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	local map1 = server.find_map("qlsd");
	if tonumber(server_start_day()) >= 1 then
		if map1:num_monster("麒麟圣兽") == 0 and map1:num_monster("麒麟圣兽10") == 0 then
			map1:mon_gen(31,40,"麒麟圣兽",1,0,1,1,"no_owner");
		end
	else
		if map1:num_monster("麒麟圣兽") == 0 and map1:num_monster("麒麟圣兽10") == 0 then
			map1:mon_gen(31,40,"麒麟圣兽10",1,0,1,1,"no_owner");
		end
	end
	server.set_temp_var("qlsd",1);
	server.info(10000,0,"[麒麟圣兽]出现在[麒麟圣殿]!勇士们快从传送员处进入[麒麟圣殿]吧!");
	server.info(10,0,"[<font color='#ff0000'>麒麟圣兽</font>]出现在[<font color='#ff0000'>麒麟圣殿</font>]!勇士们快从传送员处进入[<font color='#ff0000'>麒麟圣殿</font>]吧!");
	server.server_exe("npc.dituyidong.move_qilingdian");
end

function qlsdgb()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.set_temp_var("qlsd",0);
end




function dwjboss()
	if tonumber(server_start_day()) >= 1 then
		local map1 = server.find_map("v003");
		if ymd() >= 20140405 and ymd() <= 20140407 then
			if map1:num_monster("远古恶魔") == 0 then
				map1:mon_gen(50,80,"远古恶魔",1,0,1,1,"no_owner");
			end
			server.info(10000,0,"[远古恶魔]出现在[沙漠土城(50,80)]!消灭它将会100%掉落八级宝石和神级装备哦!");
		end
	end
end

function zhuanshengsd()
	local map1 = server.find_map("zssd1");
	local map2 = server.find_map("zssd2");
	local map3 = server.find_map("zssd3");
	local map4 = server.find_map("zssd4");
	if map1:num_monster("[一转]赤焰魔君") == 0 then
		map1:mon_gen(22,31,"[一转]赤焰魔君",1,0,1,1);
	end
	if map2:num_monster("[二转]鬼斧恶魔") == 0 then
		map2:mon_gen(53,64,"[二转]鬼斧恶魔",1,0,1,1);
	end
	if map3:num_monster("[三转]暗夜领主") == 0 then
		map3:mon_gen(55,81,"[三转]暗夜领主",1,0,1,1);
	end
	if map4:num_monster("[四转]暗影妖后") == 0 then
		map4:mon_gen(38,77,"[四转]暗影妖后",1,0,1,1);
	end
	server.server_exe("npc.dituyidong.move_zssd");
	server.info(10000,0,"携带十级宝石和转生装备的超级转生BOSS出现在转生神殿,勇士们快从传送员处进入挑战吧!");
end


function kqbhdao()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.info(10010,0,"冰火岛活动已经开启,各位勇士可从传送员处进入冰火岛采集矿石,奖励丰厚哦!");
	if server.get_temp_var("BHDAO") == "" then
		server.set_temp_var("BHDAO",1);
	end
end


function gbbhdao()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if server.get_temp_var("BHDAO") == "1" then
		server.info(10010,0,"冰火岛活动已经关闭,请耐心等待下次开启,感谢您的参与!");
		server.set_temp_var("BHDAO","");
		server.server_exe("npc.dituyidong.move_bhdao");
	end
end

function kqygfx()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	server.info(10010,0,"远古废墟已经开启,各位勇士可从传送员处进入,打败大女皇萨麦尔及其部下获得奖励丰厚!");
	if server.get_temp_var("YGFX") == "" then	
		server.set_temp_var("YGFX",1);
	end
	local map = server.find_map("ygfx");
	if map then
		if map:num_monster("蜥蜴勇士") <= 100  then
			map:mon_gen(63,74,"蜥蜴勇士",100,70,30,0);
		end
		if map:num_monster("花妖侍女") <=100  then
			map:mon_gen(63,74,"花妖侍女",100,70,30,0);
		end
	end
end

function gbygfx()
	server.server_exe("newgui.actinfo.fresh_actinfo_show");
	if server.get_temp_var("YGFX") == "1" then
		server.info(10010,0,"远古废墟已经关闭,请耐心等待下次开启,感谢您的参与!");
		local map = server.find_map("ygfx");
		map:clear_mon();
		server.set_temp_var("YGFX","");
		server.server_exe("npc.dituyidong.move_ygfx");
	end
end

function ygfxboss1() --暴食领主
	if server.get_temp_var("YGFX") == "1" then
	local map1 = server.find_map("ygfx");
		if map1:num_monster("暴食领主") == 0  then
			map1:mon_gen(26,137,"暴食领主",1,0,1,1);
			server.info(10,0,"[<font color='#ff0000'>暴食领主</font>]出现在[远古废墟]!");
		end
	end
end

function ygfxboss2() --克劳缪斯女爵
	if server.get_temp_var("YGFX") == "1" then
	local map1 = server.find_map("ygfx");
		if map1:num_monster("克劳缪斯女爵") == 0  then
			map1:mon_gen(33,23,"克劳缪斯女爵",1,0,1,1);
			server.info(10,0,"[<font color='#ff0000'>克劳缪斯女爵</font>]出现在[远古废墟]!");
		end
	end
end

function ygfxboss3() --大女皇萨麦尔
	if server.get_temp_var("YGFX") == "1" then
	local map1 = server.find_map("ygfx");
		if map1:num_monster("大女皇萨麦尔") == 0  then
			map1:mon_gen(63,76,"大女皇萨麦尔",1,0,1,1);
			server.info(10,0,"[<font color='#ff0000'>大女皇萨麦尔</font>]出现在[远古废墟]!");
		end
	end
end

function ygfxboss4() --玄石领主
	if server.get_temp_var("YGFX") == "1" then
	local map1 = server.find_map("ygfx");
		if map1:num_monster("玄石领主") == 0  then
			map1:mon_gen(98,22,"玄石领主",1,0,1,1);
			server.info(10,0,"[<font color='#ff0000'>玄石领主</font>]出现在[远古废墟]!");
		end
	end
end

function ygfxboss5() --玄石领主
	if server.get_temp_var("YGFX") == "1" then
	local map1 = server.find_map("ygfx");
		if map1:num_monster("噩梦领主") == 0  then
			map1:mon_gen(101,130,"噩梦领主",1,0,1,1);
			server.info(10,0,"[<font color='#ff0000'>噩梦领主</font>]出现在[远古废墟]!");
		end
	end
end