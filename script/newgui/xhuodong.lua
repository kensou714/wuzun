module(..., package.seeall)

local ACTIONSET_NAME="xhuodong";
local PANEL_ACTIONSET_NAME="panelHuodong";


local jyboss_data={
[1] = {bossname="奴玛教主",bossditu="奴玛寺庙",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="45",gomap ={"wmsm1",282,270},mapname="wmsm3",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[2] = {bossname="嗜血毒虫",bossditu="邪恶洞穴",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="20",gomap ={"wgd1",374,373},mapname="wgd5",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[3] = {bossname="邪恶蛇蝎",bossditu="猪妖巢穴",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="25",gomap ={"zhudong1",21,231},mapname="zhudong4",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[4] = {bossname="猛犸教主",bossditu="猛犸神殿",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="30",gomap ={"zuma1",29,226},mapname="zuma5",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[5] = {bossname="魔魂教主",bossditu="魔魂殿",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="30",gomap ={"fengmo1",179,173},mapname="fengmo4",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[6] = {bossname="蛮牛王",bossditu="蛮牛大殿",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="35",gomap ={"niumo1",40,150},mapname="niumo4",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[7] = {bossname="妖月金刚",bossditu="妖月峡谷",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="40",gomap ={"chiyue1",214,41},mapname="chiyue4",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
[8] = {bossname="妖月血魔",bossditu="妖月峡谷",bosstime="5分钟",bossdrop="凌云套装(50级)  惊世套装(55级)  混天套装(60级)",needlv="40",gomap ={"chiyue1",214,41},mapname="chiyue4",
	info = {"20403","20400","10209","10180","10138","10137","10136","10135"},alertinfo=""
	},
};
local mjboss_data={
[1] = {bossname="奴玛教皇",bossditu="奴玛后宫",bosstime="30分钟",bossdrop="潜龙套装(65级)  无双套装(70级)",needlv="45",gomap ={"wmsm1",282,270},mapname="wmsm4",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo="[<font color='#ff0000'>奴玛后宫</font>]需从[<font color='#ff0000'>奴玛神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!"
	},
[2] = {bossname="邪龙神",bossditu="邪龙谷",bosstime="30分钟",bossdrop="潜龙套装(65级)  无双套装(70级)",needlv="45",gomap ={"wgd1",374,373},mapname="wgd6",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo="[<font color='#ff0000'>邪龙谷</font>]需从[<font color='#ff0000'>邪恶之谷</font>]的[<font color='#ff0000'>封印使者</font>]进入!"
	},
[3] = {bossname="变异蛇蝎王",bossditu="猪妖魔窟",bosstime="30分钟",bossdrop="潜龙套装(65级)  无双套装(70级)",needlv="45",gomap ={"zhudong1",21,231},mapname="zhudong5",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo="[<font color='#ff0000'>猪妖魔窟</font>]需从[<font color='#ff0000'>猪妖巢穴</font>]的[<font color='#ff0000'>封印使者</font>]进入!"
	},
[4] = {bossname="猛犸教皇",bossditu="猛犸后宫",bosstime="30分钟",bossdrop="潜龙套装(65级)  无双套装(70级)",needlv="45",gomap ={"zuma1",29,226},mapname="zuma6",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo="[<font color='#ff0000'>猛犸后宫</font>]需从[<font color='#ff0000'>猛犸神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!"
	},
[5] = {bossname="牛魔圣君",bossditu="蛮牛圣殿",bosstime="30分钟",bossdrop="潜龙套装(65级)  无双套装(70级)",needlv="45",gomap ={"niumo1",40,150},mapname="niumo5",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo="[<font color='#ff0000'>蛮牛圣殿</font>]需从[<font color='#ff0000'>蛮牛大殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!"
	},
[6] = {bossname="武威战神",bossditu="武威殿",bosstime="60分钟",bossdrop="潜龙套装(65级)  无双套装(70级)  至尊套装(75级)",needlv="无",gomap ={"wwsd",28,39},mapname="wwsd",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo=""
	},
[7] = {bossname="烈焰法神",bossditu="烈焰殿",bosstime="60分钟",bossdrop="潜龙套装(65级)  无双套装(70级)  至尊套装(75级)",needlv="无",gomap ={"lysd",31,39},mapname="lysd",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo=""
	},
[8] = {bossname="无极天尊",bossditu="无极殿",bosstime="60分钟",bossdrop="潜龙套装(65级)  无双套装(70级)  至尊套装(75级)",needlv="无",gomap ={"wjsd",31,39},mapname="wjsd",
	info = {"69000","49000","99000","109000","10139","10138","10209","10180"},alertinfo=""
	},
};
local msboss_data={
[1] = {bossname="巨灵天魔",bossditu="巨灵石窟",bosstime="60分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="45",gomap ={"jlsk1",19,92},mapname="jlsk4",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"},alertinfo=""
	},

[2] = {bossname="混沌魔君",bossditu="混沌之门",bosstime="60分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="50",gomap ={"hund1",237,232},mapname="hund4",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"},alertinfo=""
	},
[3] = {bossname="噬日魔兽",bossditu="冰封雪域",bosstime="60分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="50",gomap ={"bfxy1",196,57},mapname="bfxy4",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"},alertinfo=""
	},

[4] = {bossname="地狱炎魔",bossditu="烈焰魔窟",bosstime="120分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="45",gomap ={"dyry1",15,226},mapname="dyry4",
	info = {"59000","69000","20436","20439","10141","10140","10139","10217"},alertinfo=""
	},

[5] = {bossname="落日恶魔",bossditu="落日刑场",bosstime="120分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="45",gomap ={"swxc1",23,230},mapname="swxc4",
	info = {"59000","69000","20436","20439","10141","10140","10139","10217"},alertinfo=""
	},
[6] = {bossname="亘古魔王",bossditu="神庙废墟",bosstime="120分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="45",gomap ={"zzzd1",75,212},mapname="zzzd4",
	info = {"59000","69000","20436","20439","10141","10140","10139","10217"},alertinfo=""
	},

[7] = {bossname="天威魔帝",bossditu="天威魔狱",bosstime="120分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="45",gomap ={"qshl1",71,185},mapname="qshl4",
	info = {"59000","69000","20436","20439","10141","10140","10139","10217"},alertinfo=""
	},
[8] = {bossname="远古大帝",bossditu="远古深渊",bosstime="120分钟",bossdrop="天龙套装(80级)  三皇套装(85级)",needlv="45",gomap ={"ygsy1",46,102},mapname="ygsy4",
	info = {"59000","69000","20436","20439","10141","10140","10139","10217"},alertinfo=""
	},
};

function process_xhuodong(player,actionset,panelid,actionid)
---BOSS信息jybosshd
	if string.sub(actionid,3,8) == "bosshd" then
		local tag = string.sub(actionid,1,2);
		local bosm = tonumber(string.sub(actionid,9,10));
		freshbossyou(player,bosm,tag);
		return;
	end
	if string.sub(actionid,3,8) == "bossgo" then
		local tag = string.sub(actionid,1,2);
		local go = tonumber(string.sub(actionid,9,10));
		bossgo(player,go,tag);
		return;
	end
	if  string.sub(actionid,3,8) == "sxboss" then
		local tag = string.sub(actionid,1,2);
		freshbosspanel(player,tag);
		return;
	end
---每日活动
	if string.sub(actionid,1,5) == "mrtab" then
		local mrm = tonumber(string.sub(actionid,6,7));
		freshmryou(player,mrm);
		return;
	end
	--print(actionid);
	if actionid == "btnmrhd" then
		freshmrhdpanel(player);
		return;
	end
	if actionid == "huodong1" or  actionid == "huodong14" or  actionid == "huodong25"  then
		if	server.get_temp_var("BHDAO") ~= "1" then
			player:alert(1,1,"冰火岛尚未开启!");
			return;
		end
		if player:get_map():get_id() == "binghuodao" then
			player:alert(1,1,"你已经在冰火岛咯!!");
		else
			if  player:get_level() >= 50 then
				player:enter_map("binghuodao",13,141);
				--统计活跃度--
				player:set_param(const.PP_HUOYUEDU_NUM9,util.ppn(player,const.PP_HUOYUEDU_NUM9)+1);
				if util.ppn(player,const.PP_HUOYUEDU_NUM9)==2 then
					player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
				end
				gm.go.givehuicheng(player);
			else
				player:alert(1,1,"想去冰火岛??还是50级以后再去吧!");
			end
			return;
		end
	end
	if  actionid=="huodong16" or  actionid == "huodong20" then
		if player:get_level() >= 45 then
			posnpc.go(player,"神器使者"); 
			return;
		else
			player:alert(1,1,"想去挑战天魔兽??还是45级以后再去吧!");
			return;
		end
	end
	if actionid == "huodong5" then 
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
			player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!");
		end
		return;
	end
	if actionid == "huodong13" then 
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
		return;
	end
	if actionid == "huodong6" or actionid == "huodong17" then
		if server.get_temp_var("wenquan") == "1" then
			posnpc.go(player,"温泉老板娘"); 
		else
			player:alert(1,1,"温泉馆只在中午[12:00-12:30]和下午[18:00-18:30]营业哦!");
		end
		return;
	end
	if actionid == "huodong7" or actionid == "huodong18"  or actionid == "huodong23" or actionid == "huodong26" then
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
		return;
	end
	if actionid == "huodong8" then
		if server.get_temp_var("wlzb") == "2" then
			player:alert(1,1,"武林争霸活动已经开始,入口已经关闭");
			--Show_tt(player,3);
		else
			if player:get_map():get_id() == "wlzb" then
				player:alert(1,1,"你已经在武林争霸大厅咯!!");
			else
				if server.get_temp_var("wlzb") == "1" then
					if player:get_level() >= 45 then
					local map = server.find_map("wlzb");
						local x,y;
						x,y=map:gen_rand_position();
						if( x and y )then
							player:enter_map("wlzb",x,y);
						end
						player:alert(1,1,"武林争霸赛将于[13:10]正式开始!请做好准备!")
						server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了武林争霸大厅!");
					else
					player:alert(1,1,"对不起,参与武林争霸活动需要达到45级!");
					end
				else
					player:alert(1,1,"现在不是报名时间,请到报名时间再来找我吧!");
				end
			end
		end
		return;
	end
	if  actionid == "huodong3" or  actionid == "huodong22" or actionid == "huodong27" then
		if player:get_map():get_id() == "v005" then
			player:alert(1,1,"你已经在王城咯!!");
		else
			if player:get_level() >= 45 then
				player:enter_map("v005",57,103);
				go.givehuicheng(player);
			else
				player:alert(1,1,"想去王城??还是45级以后再去吧!");
			end
		end
		return;
	end
	if actionid == "huodong4" or actionid == "huodong9" or actionid == "huodong24" then
		if server.get_temp_var("YGFX") ~= "1" then
			player:alert(1,1,"远古废墟活动已经关闭!");
			return;
		end
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
				player:alert(1,1,"想去远古废墟??还是50级以后再去吧!");
			end
		end
		return;
	end

	--天晶战场
	if actionid == "huodong11" or  actionid == "huodong19" then
		npc.dituyidong.onjretjzc(player);
	end
---每日任务
	if string.sub(actionid,1,7) == "renwugo" then
		local go = tonumber(string.sub(actionid,8,9));
		renwugo(player,go);
		return;
	end
	if string.sub(actionid,1,8) == "btnrenwu" then
		local num = tonumber(string.sub(actionid,9,10));
		freshmrrwpanel(player,num);
		return;
	end
	if actionid == "btnmrrw" then
		check_zmt_day(player);
		freshrenwujindu(player);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_xhuodong);

function freshbossyou(player,bosm,tag)
	--print(tag);
	local data;
	if tag == "jy" then
		data = jyboss_data[bosm];
	elseif tag=="mj" then
		data = mjboss_data[bosm];
	elseif tag == "ms" then
		data=msboss_data[bosm];
	else 
		return;
	end
	player:set_panel_data("panelHuodong",tag.."bossname","text",data.bossname);
	player:set_panel_data("panelHuodong",tag.."bossmap","text",data.bossditu);
	player:set_panel_data("panelHuodong",tag.."bosstime","text",data.bosstime);
	player:set_panel_data("panelHuodong",tag.."bossneedlv","text",data.needlv);
	player:set_panel_data("panelHuodong",tag.."bossdrop","text",data.bossdrop);
	for i = 1,#data.info do 
		player:set_panel_data("panelHuodong",tag.."bossitem"..i,"typeid",data.info[i]);
	end
	player:push_ckpanel_data("xhuodong","panelHuodong")
	freshbosspanel(player,tag);
end
function bossgo(player,go,tag)
	local data;
	if tag == "jy" then
		data = jyboss_data[go];
	elseif tag=="mj" then
		data = mjboss_data[go];
	elseif tag == "ms" then
		data=msboss_data[go];
	else 
		return;
	end
	local lel = data.needlv;
	if data.needlv == "无" then
		lel=0;
	end
	if  player:get_level() >= tonumber(lel) then
		player:enter_map(data.gomap[1],data.gomap[2],data.gomap[3]);
		gm.go.givehuicheng(player);
		if data.alertinfo ~= "" then
			player:alert(11,1,data.alertinfo);
		end
	else
		player:alert(1,1,"想去"..data.bossditu.."??还是"..data.needlv.."级以后再去吧!");
	end

end
function freshbosspanel(player,tag)
	local boss_data;
	if tag == "jy" then
		boss_data = jyboss_data;
	elseif tag=="mj" then
		boss_data = mjboss_data;
	elseif tag == "ms" then
		boss_data=msboss_data;
	else 
		return;
	end
	for i=1,#boss_data do
		local data = boss_data[i];
		local map = server.find_map(data.mapname);
		if map:num_monster(data.bossname) == 0 then
			player:set_panel_data("panelHuodong",tag.."bosssx"..i,"text","未出现");
		else
			player:set_panel_data("panelHuodong",tag.."bosssx"..i,"text","已刷新");
		end
	end
	player:push_ckpanel_data("xhuodong","panelHuodong");
end
function freshpanel(player)
	freshbosspanel(player,"jy");
	freshbosspanel(player,"mj");
	freshbosspanel(player,"ms");
end
login.add_login_listener(freshpanel);



local mrhd_data={
[1] = {huodongditu="冰火岛寻宝",starttime="10:00-10:30",st="1000",et="1030",hdjiangli="经验、进阶石",needlv="50",dhintro="每人每天可以进入冰火岛采集20次矿石，小型矿石可获得2-4个进阶石,少量经验，大型矿石可获得6-12个进阶石,大量经验。",
	info = {"19001","10209","","","","","",""}
	},
[2] = {huodongditu="送财童子",starttime="10:15:00",st="1015",et="1015",hdjiangli="金币",needlv="0",dhintro="在[云霄城]和[沙漠土城]会随机出现4个送财童子,可以获得大量的金币奖励哦!还有几率掉落金条哦!",
	info = {"19000","10037","","","","","",""}
	},
[3] = {huodongditu="怪物攻城",starttime="10:30-11:00",st="1030",et="1100",hdjiangli="装备、商城道具",needlv="45",dhintro="巨灵石窟的[巨灵天魔]带领魔界大军强袭王城,妄图统治全人类,勇士们是时候出击了!消灭恶魔,匡扶人间正道!快去消灭BOSS,获取极品装备的时机到了!巨灵天魔有几率掉落本服务器所有套装。",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"}
	},
[4] = {huodongditu="远古废墟",starttime="10:45-11:15",st="1045",et="1115",hdjiangli="装备、商城道具",needlv="50",dhintro="大女皇萨麦尔及其部下占据了远古废墟，等待勇士的挑战，击败他们可以获得丰厚的奖励。",
	info = {"59000","69000","10295","10294","10293","10141","10140","10217"}
	},
[5] = {huodongditu="死亡禁地",starttime="11:15-11:45",st="1115",et="1145",hdjiangli="装备、商城道具",needlv="45",dhintro="在死亡禁地有大量的BOSS,传说消灭死亡禁地的[禁地魔王]将会获得顶级天龙套装哦!由于死亡禁地的BOSS过多,勇士们要小心!",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"}
	},
[6] = {huodongditu="泡温泉",starttime="12:00-12:30",st="1200",et="1230",hdjiangli="经验",needlv="0",dhintro="活动开始后,您可以从云霄城温泉老板娘进入温泉哦!泡温泉可以获得大量经验!另外您还可以在温泉里抓鱼哦!同样也可以获得大量经验!",
	info = {"19001","10103","10102","10101","10100","","",""}
	},
[7] = {huodongditu="麒麟圣殿",starttime="12:45-13:00",st="1245",et="1300",hdjiangli="装备、坐骑经验",needlv="45",dhintro="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[天龙套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",
	info = {"59000","69000","20436","20439","10141","10140","15037","15035"}
	},
[8] = {huodongditu="武林争霸",starttime="13:00-14:00",st="1300",et="1400",hdjiangli="经验、荣誉、称号",needlv="45",dhintro="武林争霸大厅内自由PK,死亡不掉装备，当争霸大厅只剩1人时则成为武林盟主，活动开始,大厅所有人获得大量经验和荣誉。",
	info = {"19001","19010","","","","","",""}
	},
[9] = {huodongditu="远古废墟",starttime="13:45-14:15",st="1345",et="1415",hdjiangli="装备、商城道具",needlv="50",dhintro="大女皇萨麦尔及其部下占据了远古废墟，等待勇士的挑战，击败他们可以获得丰厚的奖励。",
	info = {"59000","69000","10295","10294","10293","10141","10140","10217"}
	},
[10] = {huodongditu="送财童子",starttime="14:15:00",st="1415",et="1415",hdjiangli="金币",needlv="0",dhintro="在[云霄城]和[沙漠土城]会随机出现4个送财童子,可以获得大量的金币奖励哦!还有几率掉落金条哦!",
	info = {"19000","10037","","","","","",""}
	},
[11] = {huodongditu="天晶战场",starttime="14:40-15:00",st="1440",et="1500",hdjiangli="经验、成就",needlv="70",dhintro="在战场内，有少量经验增长。战场结束时，将根据您的个人积分发放奖励，胜利方奖励是失败方的双倍，有成就点，相应成就点有对应的称号，将激活霸气护体，称号越高状态越强！",
	info = {"19001","","","","","","",""}
	},
[12] = {huodongditu="双倍经验",starttime="15:00-16:00",st="1500",et="1600",hdjiangli="经验",needlv="0",dhintro="为了感谢广大玩家对我们的支持和厚爱!我们推出全服双倍活动,活动期间全服打怪经验增加1倍哦!活动期间使用多倍宝典,打怪经验增加1倍!",
	info = {"19001","","","","","","",""}
	},
[13] = {huodongditu="皇城宝藏",starttime="16:15-16:45",st="1615",et="1645",hdjiangli="商城道具",needlv="45",dhintro="在死亡禁地有大量的BOSS,传说消灭死亡禁地的[禁地魔王]将会获得顶级天龙套装哦!由于死亡禁地的BOSS过多,勇士们要小心!",
	info = {"15105","15111","15104","15110","10207","10212","10211",""}
	},
[14] = {huodongditu="冰火岛寻宝",starttime="17:00-17:30",st="1700",et="1730",hdjiangli="经验、进阶石",needlv="50",dhintro="每人每天可以进入冰火岛采集20次矿石，小型矿石可获得2-4个进阶石,少量经验，大型矿石可获得6-12个进阶石,大量经验。",
	info = {"19001","10209","","","","","",""}
	},
[15] = {huodongditu="送财童子",starttime="17:15:00",st="1715",et="1715",hdjiangli="金币",needlv="0",dhintro="在[云霄城]和[沙漠土城]会随机出现4个送财童子,可以获得大量的金币奖励哦!还有几率掉落金条哦!",
	info = {"19000","10037","","","","","",""}
	},
[16] = {huodongditu="天魔兽来袭",starttime="17:30-18:00",st="1730",et="1800",hdjiangli="装备、神器积分",needlv="45",dhintro="在土城的神器使者可以进入[神器宝阁]，里面将会出现邪恶的上古魔兽[天魔兽]传说只有消灭天魔兽的勇士才可以获得神器积分,而神器积分可以兑换服务器顶级神器!",
	info = {"10085","59000","69000,","20436","20439","10141","10140","10139"}
	},
[17] = {huodongditu="泡温泉",starttime="18:00-18:30",st="1800",et="1830",hdjiangli="经验",needlv="0",dhintro="活动开始后,您可以从云霄城温泉老板娘进入温泉哦!泡温泉可以获得大量经验!另外您还可以在温泉里抓鱼哦!同样也可以获得大量经验!",
	info = {"19001","10103","10102","10101","10100","","",""}
	},
[18] = {huodongditu="麒麟圣殿",starttime="18:45-18:50",st="1845",et="1850",hdjiangli="装备、坐骑经验",needlv="45",dhintro="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[天龙套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",
	info = {"59000","69000","20436","20439","10141","10140","15037","15035"}
	},
[19] = {huodongditu="天晶战场",starttime="19:10-19:30",st="1910",et="1930",hdjiangli="经验、成就",needlv="70",dhintro="在战场内，有少量经验增长。战场结束时，将根据您的个人积分发放奖励，胜利方奖励是失败方的双倍，有成就点，相应成就点有对应的称号，将激活霸气护体，称号越高状态越强！",
	info = {"19001","","","","","","",""}
	},
[20] = {huodongditu="天魔兽来袭",starttime="19:30-20:00",st="1930",et="2000",hdjiangli="装备、神器积分",needlv="45",dhintro="在土城的神器使者可以进入[神器宝阁]，里面将会出现邪恶的上古魔兽[天魔兽]传说只有消灭天魔兽的勇士才可以获得神器积分,而神器积分可以兑换服务器顶级神器!",
	info = {"10085","59000","69000,","20436","20439","10141","10140","10139"}
	},

[21] = {huodongditu="王城争霸",starttime="20:00-21:30",st="2000",et="2130",hdjiangli="经验、元宝",needlv="0",dhintro="王城争霸开启后，所有玩家都进入攻城状态，角色名字颜色都会变为紫色，该状态下在王城PK不会增加PK值，获胜方行会将获得至高无上荣誉！",
	info = {"19001","19000","19008","","","","",""}
	},

[22] = {huodongditu="怪物攻城",starttime="20:30-21:00",st="2030",et="2100",hdjiangli="装备、商城道具",needlv="0",dhintro="巨灵石窟的[巨灵天魔]带领魔界大军强袭王城,妄图统治全人类,勇士们是时候出击了!消灭恶魔,匡扶人间正道!快去消灭BOSS,获取极品装备的时机到了!巨灵天魔有几率掉落本服务器所有套装。",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"}
	},
[23] = {huodongditu="麒麟圣殿",starttime="20:45-21:00",st="2045",et="2100",hdjiangli="装备、坐骑经验",needlv="45",dhintro="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[天龙套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",
	info = {"59000","69000","20436","20439","10141","10140","15037","15035"}
	},
[24] = {huodongditu="远古废墟",starttime="21:45-22:15",st="2145",et="2215",hdjiangli="装备、商城道具",needlv="50",dhintro="大女皇萨麦尔及其部下占据了远古废墟，等待勇士的挑战，击败他们可以获得丰厚的奖励。",
	info = {"59000","69000","10295","10294","10293","10141","10140","10217"}
	},
[25] = {huodongditu="冰火岛寻宝",starttime="22:00-22:30",st="2200",et="2230",hdjiangli="经验、进阶石",needlv="50",dhintro="每人每天可以进入冰火岛采集20次矿石，小型矿石可获得2-4个进阶石,少量经验，大型矿石可获得6-12个进阶石,大量经验。",
	info = {"19001","10209","","","","","",""}
	},
[26] = {huodongditu="麒麟圣殿",starttime="22:45-23:00",st="2245",et="2300",hdjiangli="装备、商城道具",needlv="45",dhintro="消灭麒麟圣兽将会掉落大量坐骑经验丹,还有几率掉落[天龙套装]!麒麟死亡时,圣殿所有人[坐骑经验+50000]",
	info = {"59000","69000","20436","20439","10141","10140","15037","15035"}
	},
[27] = {huodongditu="怪物攻城",starttime="23:00-23:30",st="2300",et="2330",hdjiangli="装备、商城道具",needlv="45",dhintro="巨灵石窟的[巨灵天魔]带领魔界大军强袭王城,妄图统治全人类,勇士们是时候出击了!消灭恶魔,匡扶人间正道!快去消灭BOSS,获取极品装备的时机到了!巨灵天魔有几率掉落本服务器所有套装。",
	info = {"59000","69000","49000","99000","109000","10141","10140","10139"}
	},
};

function freshmryou(player,mrm)
	local data = mrhd_data[mrm];
	player:set_panel_data("panelHuodong","hdname","text",data.huodongditu);
	player:set_panel_data("panelHuodong","hdneedlv","text",data.needlv);
	player:set_panel_data("panelHuodong","hdtime","text",data.starttime);
	player:set_panel_data("panelHuodong","dhintro","text",data.dhintro);
	for i = 1,#data.info do 
		player:set_panel_data("panelHuodong","mrhditem"..i,"typeid",data.info[i]);	
	end
	player:push_ckpanel_data("xhuodong","panelHuodong");
	freshmrhdpanel(player);
end

function freshmrhdpanel(player)
	for i = 1,#mrhd_data do 
		--2 10 12 15 19 21
		local data = mrhd_data[i];
		local h = os.date("%H%M",os.time());
		if i == 2 or i == 10 or i == 12 or i == 15 or i == 21 then
			player:set_panel_data("panelHuodong","huodong"..i,"mouseEnabled","false");
			player:set_panel_data("panelHuodong","huodong"..i,"text","--");
		else
			if tonumber(h) >= tonumber(data.st) and tonumber(h) < tonumber(data.et) then
				player:set_panel_data("panelHuodong","huodong"..i,"mouseEnabled","true");
				player:set_panel_data("panelHuodong","huodong"..i,"text","前往");
			else
				player:set_panel_data("panelHuodong","huodong"..i,"mouseEnabled","false");
				player:set_panel_data("panelHuodong","huodong"..i,"text","--");
			end
		end
		
		player:push_ckpanel_data("xhuodong","panelHuodong");
	end
end

local mrrw_data={
[1] = {renwuname="副本：奴玛神庙",needlv="45",jindu= {const.RAIN_SEXP_MAX_NUM1,const.PP_RAIN_SEXP_NUM1},gomap ={"v003",99,122,"副本使者"},dhintro="挑战副本、赢取装备、材料、经验",
	info = {"19001","19000","","","","","",""}
	},
[2] = {renwuname="副本：猛犸神殿",needlv="50",jindu= {const.RAIN_SEXP_MAX_NUM2,const.PP_RAIN_SEXP_NUM2},gomap ={"v003",99,122,"副本使者"},dhintro="挑战副本、赢取装备、材料、经验",
	info = {"19001","19000","","","","","",""}
	},
[3] = {renwuname="副本：蛮牛大殿",needlv="55",jindu= {const.RAIN_SEXP_MAX_NUM3,const.PP_RAIN_SEXP_NUM3},gomap ={"v003",99,122,"副本使者"},dhintro="挑战副本、赢取装备、材料、经验",
	info = {"19001","19000","","","","","",""}
	},
[4] = {renwuname="副本：妖月巢穴",needlv="60",jindu= {const.RAIN_SEXP_MAX_NUM4,const.PP_RAIN_SEXP_NUM4},gomap ={"v003",99,122,"副本使者"},dhintro="挑战副本、赢取装备、材料、经验",
	info = {"19001","19000","","","","","",""}
	},
[5] = {renwuname="副本：巨灵魔窟",needlv="65",jindu= {const.RAIN_SEXP_MAX_NUM5,const.PP_RAIN_SEXP_NUM5},gomap ={"v003",99,122,"副本使者"},dhintro="挑战副本、赢取装备、材料、经验",
	info = {"19001","19000","","","","","",""}
	},
[6] = {renwuname="副本：混沌魔域",needlv="70",jindu= {const.RAIN_SEXP_MAX_NUM6,const.PP_RAIN_SEXP_NUM6},gomap ={"v003",99,122,"副本使者"},dhintro="挑战副本、赢取装备、材料、经验",
	info = {"19001","19000","","","","","",""}
	},
[7] = {renwuname="降妖除魔",needlv="40",jindu= {const.RICHANG_MAX_NUM,const.PP_RICHANG_NUM},gomap ={"v003",65,107,"伏魔使者"},dhintro="苍茫大地,妖魔四起,值此乱世之秋,希望你能尽自己的一份绵薄之力以造福苍生!你愿意帮助我降妖除魔吗?",
	info = {"19001","19010","","","","","",""}
	},
[8] = {renwuname="擒贼擒王",needlv="45",jindu= {const.RICHANG2_MAX_NUM,const.PP_RICHANG2_NUM},gomap ={"v003",117,104,"赏金猎人"},dhintro="百年前的那场大战.伤及我百姓无数.此仇永世不共戴天!为了彻底摧毁它们的残余势力.现需要你去消灭它们的首领!少侠现在就上路吧!",
	info = {"19001","19010","19009","","","","",""}
	},
[9] = {renwuname="闯通天塔",needlv="50",jindu= {const.ZMT_MAX_NUM,const.const.PP_ZMT_NUM},gomap ={"v003",108,113,"通天塔使者"},dhintro="闯塔说明:1. 每三层通天塔都将会出现一个BOSS守关!2. 每通关三层通天塔都将获得大量的经验!",
	info = {"19001","","","","","","",""}
	},
[10] = {renwuname="裁决之地",needlv="50",jindu= {const.SHILIAN_MAX_NUM,const.PP_SHILIAN_NUM},gomap ={"v003",103,115,"裁决使者"},dhintro="挑战裁决之地，每通关一层，都会获得经验及真气奖励",
	info = {"19001","15092","","","","","",""}
	},
[11] = {renwuname="押运镖车",needlv="45",jindu= {const.YABIAO_MAX_NUM,const.PP_YABIAO_NUM},gomap ={"v003",47,107,"夏镖头"},dhintro="等级越高,经验越多押镖令在副本和BOSS获得运镖提醒: 镖车被劫只可获得[60%]的经验",
	info = {"19001","19007","","","","","",""}
	},
[12] = {renwuname="喝酒烤火",needlv="45",jindu= {const.JIU_MAX_NUM,const.PP_JIU_NUM},gomap ={"v003",97,100,"火堆"},dhintro="等级越高,经验越多女儿红在副本和BOSS获得，饮酒提醒饮酒后需要在土城安全区才可获得经验",
	info = {"19001","","","","","","",""}
	},
[13] = {renwuname="勇闯魔塔",needlv="0",jindu= {const.PP_ZHENMOTACISHU},gomap ={"v003",98,82,"镇魔使者"},dhintro="镇魔塔每层奖励:超大量经验镇魔塔终极奖励:五级宝石 2块镇魔塔闯关规则: 杀完怪物才可进下层",
	info = {"19001","10139","","","","","",""}
	},
[14] = {renwuname="百花争艳",needlv="45",jindu= {const.RICHANG3_MAX_NUM,const.PP_RICHANG3_NUM},gomap ={"v002",53,131,"百花仙子"},dhintro="人们总说我人比花娇!少侠,此事你怎么看?好吧!看你也说不出个所以然.那你去帮我摘点花回来,我自有判断!",
	info = {"19007","","","","","","",""}
	},
[15] = {renwuname="矿区采矿",needlv="40",jindu= {},gomap ={"jsd2",20,92,"采矿"},dhintro="采矿出售可以获得大量的金币,是本服务器主要金币来源之一!每种矿石的价格可都一样哦!",
	info = {"19007","","","","","","",""}
	},
};
function renwugo(player,go)
	local data = mrrw_data[go];
	if  player:get_level() >= tonumber(data.needlv) then
		if go ~= 13 then
			player:find_road_goto(data.gomap[1],data.gomap[2],data.gomap[3],data.gomap[4]);
		else
			player:enter_map("v003",101,82);
		end
	else
		player:alert(1,1,"想去"..data.renwuname.."??还是"..data.needlv.."级以后再去吧!");
	end
	freshrenwujindu(player);
end
function freshmrrwpanel(player,num)
	local data = mrrw_data[num];
	player:set_panel_data("panelHuodong","renwuname","text",data.renwuname);
	player:set_panel_data("panelHuodong","renwuneedlv","text",data.needlv);
	player:set_panel_data("panelHuodong","renwudhintro","text",data.dhintro);
	if num == 13 then
		player:set_panel_data("panelHuodong","renwucishu","text",util.ppn(player,data.jindu[1]));
	else
		 if  num ==  7 or  num ==  8   then
			if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
				player:set_panel_data("panelHuodong","renwucishu","text",data.jindu[1] - util.ppn(player,data.jindu[2]));
			else
				player:set_panel_data("panelHuodong","renwucishu","text",data.jindu[1] - util.ppn(player,data.jindu[2]));
			end
		else
			if #data.jindu >= 2 then
				player:set_panel_data("panelHuodong","renwucishu","text",data.jindu[1] - util.ppn(player,data.jindu[2]));
			end
		end
	end
	for i = 1,#data.info do 
		player:set_panel_data("panelHuodong","hditem"..i,"typeid",data.info[i]);
	end
	player:push_ckpanel_data("xhuodong","panelHuodong");
	if num == 10 then
		setcjzd(player,true);
	end
	freshrenwujindu(player);
end

local jindu_data={
[1] = {jindu= {const.RAIN_SEXP_MAX_NUM1,const.PP_RAIN_SEXP_NUM1},zong="2"
	},
[2] = {jindu= {const.RAIN_SEXP_MAX_NUM2,const.PP_RAIN_SEXP_NUM2},zong="2"
	},
[3] = {jindu= {const.RAIN_SEXP_MAX_NUM3,const.PP_RAIN_SEXP_NUM3},zong="2"
	},
[4] = {jindu= {const.RAIN_SEXP_MAX_NUM4,const.PP_RAIN_SEXP_NUM4},zong="2"
	},
[5] = {jindu= {const.RAIN_SEXP_MAX_NUM5,const.PP_RAIN_SEXP_NUM5},zong="2"
	},
[6] = {jindu= {const.RAIN_SEXP_MAX_NUM6,const.PP_RAIN_SEXP_NUM6},zong="2"
	},
[7] = {jindu= {const.RICHANG_MAX_NUM,const.PP_RICHANG_NUM},zong="10"
	},
[8] = {jindu= {const.RICHANG2_MAX_NUM,const.PP_RICHANG2_NUM},zong="6"
	},
[9] = {jindu= {const.ZMT_MAX_NUM,const.const.PP_ZMT_NUM},zong="2"
	},
[10] = {jindu= {const.SHILIAN_MAX_NUM,const.PP_SHILIAN_NUM},zong="1"
	},
[11] = {jindu= {const.YABIAO_MAX_NUM,const.PP_YABIAO_NUM},zong="3"
	},
[12] = {jindu= {const.JIU_MAX_NUM,const.PP_JIU_NUM},zong="6"
	},
[13] = {jindu= {const.PP_ZHENMOTACISHU},zong="10"
	},
[14] = {jindu= {const.RICHANG3_MAX_NUM,const.PP_RICHANG3_NUM},zong="10"
	},
};
function freshrenwujindu(player)
	for i =1,#jindu_data do 
		local zong,dq;
		if i==13 then
			dq = tonumber(jindu_data[i].zong)-tonumber(util.ppn(player,jindu_data[i].jindu[1]));
			zong = jindu_data[i].zong;
			--player:set_panel_data("panelHuodong","jindu"..i,"text",tonumber(jindu_data[i].zong)-tonumber(util.ppn(player,jindu_data[i].jindu[1])).."/"..jindu_data[i].zong);
		else
			if  i ==  7 or  i ==  8   then
				dq = util.ppn(player,jindu_data[i].jindu[2]);
				if util.ppn(player,const.PP_HUIYUAN) >= today() then
					zong = tonumber(jindu_data[i].zong)+1;
					dq = dq + 1;--原因暂不明
					--player:set_panel_data("panelHuodong","jindu"..i,"text",util.ppn(player,jindu_data[i].jindu[2]).."/"..tonumber(jindu_data[i].zong)+1);
				else
					zong = tonumber(jindu_data[i].zong);
					--player:set_panel_data("panelHuodong","jindu"..i,"text",util.ppn(player,jindu_data[i].jindu[2]).."/"..jindu_data[i].zong);
				end
			else
				dq = util.ppn(player,jindu_data[i].jindu[2]);
				zong = tonumber(jindu_data[i].zong);
				-- if i ==  10 then
				-- 	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
				-- 		dq = dq -1;
				-- 	end
				-- end
				
				--player:set_panel_data("panelHuodong","jindu"..i,"text",util.ppn(player,jindu_data[i].jindu[2]).."/"..jindu_data[i].zong);
			end
		end
		player:set_panel_data("panelHuodong","jindu"..i,"text",dq.."/"..zong);
	end
	player:push_ckpanel_data("xhuodong","panelHuodong")
	setcjzd(player,false);
end
function setcjzd(player,tag)
	--check_zmt_day(player);
	if util.ppn(player,const.PP_SHILIAN_NUM) <= const.SHILIAN_MAX_NUM then
		player:set_panel_data("panelHuodong","jindu10","text",util.ppn(player,const.PP_SHILIAN_NUM).."/"..const.SHILIAN_MAX_NUM);
		if tag then
			player:set_panel_data("panelHuodong","renwucishu","text",const.SHILIAN_MAX_NUM - util.ppn(player,const.PP_SHILIAN_NUM));

		end
	else
		player:set_panel_data("panelHuodong","jindu10","text","1/1");
	end
end
function check_zmt_day(player)
	--裁决之地时间检测
	if util.ppn(player,const.PP_SHILIAN_DAY) ~= today() then
		player:set_param(const.PP_SHILIAN_DAY,today());
		player:set_param(const.PP_SHILIAN_NUM,0);
	end
	--闯通天塔时间检测
	if util.ppn(player,const.PP_ZMT_DAY) ~= today() then
		player:set_param(const.PP_ZMT_DAY,today());
		player:set_param(const.PP_ZMT_NUM,0);
	end
	--副本时间检测 6个
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
	--降妖除魔 时间检测
	if util.ppn(player,const.PP_XYCM_TASKLV) == 0 then
		player:set_param(const.PP_XYCM_TASKLV,1);
	end
	if util.ppn(player,const.PP_RICHANG_DAY) ~= today() then
		player:set_param(const.PP_RICHANG_DAY,today());
		player:set_param(const.PP_RICHANG_NUM,0);
		if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_RICHANG_NUM,util.ppn(player,const.PP_RICHANG_NUM)-1); end;
		player:set_task_state(const.TASK_ID_RICHANG,player:get_task_state(const.TASK_ID_RICHANG));
		player:push_task_data(const.TASK_ID_RICHANG,0);
		player:refresh_npc_show_flags_inview();
	end
	--擒贼擒王 时间检测
	if util.ppn(player,const.PP_SJLR_TASKLV) == 0 then
		player:set_param(const.PP_SJLR_TASKLV,1);
	end
	player:set_param(const.PP_RICHANG2_LV,1);
	if util.ppn(player,const.PP_RICHANG2_DAY) ~= today() then
		player:set_param(const.PP_RICHANG2_DAY,today());
		player:set_param(const.PP_RICHANG2_NUM,0);
		if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_RICHANG2_NUM,util.ppn(player,const.PP_RICHANG2_NUM)-1); end;
		player:set_task_state(const.TASK_ID_RICHANG2,player:get_task_state(const.TASK_ID_RICHANG2));
		player:push_task_data(const.TASK_ID_RICHANG2,0);
		player:refresh_npc_show_flags_inview();
	end
	--押运镖车 时间检测
	if util.ppn(player,const.PP_YABIAO_DAY) ~= today() then
		player:set_param(const.PP_YABIAO_DAY,today());
		player:set_param(const.PP_YABIAO_NUM,0);
		player:set_param(const.PP_JIEBIAO,0);
		player:push_task_data(3005,0);
	end
	--喝酒烤火 时间检测
	if util.ppn(player,const.PP_JIU_DAY) ~= today() then
		player:set_param(const.PP_JIU_DAY,today());
		player:set_param(const.PP_JIU_NUM,0);
	end
	--百花争艳 时间检测
	if util.ppn(player,const.PP_RICHANG3_DAY) ~= today() then
		player:set_param(const.PP_RICHANG3_DAY,today());
		player:set_param(const.PP_RICHANG3_NUM,0);
		player:set_task_state(const.TASK_ID_RICHANG3,player:get_task_state(const.TASK_ID_RICHANG3));
		player:push_task_data(const.TASK_ID_RICHANG3,0);
		player:refresh_npc_show_flags_inview();
	end
end

function setVIPTeQuan(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_RICHANG_NUM,util.ppn(player,const.PP_RICHANG_NUM)-1); end;
	if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_RICHANG2_NUM,util.ppn(player,const.PP_RICHANG2_NUM)-1); end;
	if util.ppn(player,const.PP_RICHANG_NUM) < -1 then
		player:set_param(const.PP_RICHANG_NUM,-1);
	end
	if util.ppn(player,const.PP_RICHANG2_NUM) < -1 then
		player:set_param(const.PP_RICHANG2_NUM,-1);
	end
end