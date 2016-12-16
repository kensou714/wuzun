module(..., package.seeall)

function zhuangbei(player,param100)
	Show_tt(player,1);
end

local hd_data_btd = {
	[1] = {name="凌云套装(50级)",funb = function(a,b) t_contentd(a,b); end},
	[2] = {name="惊世套装(55级)",funb = function(a,b) t_contentd(a,b); end},
	[3] = {name="混天套装(60级)",funb = function(a,b) t_contentd(a,b); end},
	[4] = {name="潜龙套装(65级)",funb = function(a,b) t_contentd(a,b); end},
	[5] = {name="无双套装(70级)",funb = function(a,b) t_contentd(a,b); end},
	[6] = {name="至尊套装(75级)",funb = function(a,b) t_contentd(a,b); end},
	[7] = {name="天龙套装(80级)",funb = function(a,b) t_contentd(a,b); end},
	[8] = {name="三皇套装(85级)",funb = function(a,b) t_contentd(a,b); end},
	[9] = {name="积分神器(终极)",funb = function(a,b) t_contentd(a,b); end},
}

function Show_tt(player,id)
	for i = 1,#hd_data_btd do
		if i == id then
			player:echo("--------------<br><font color='#ffaaee'>"..hd_data_btd[i].name .."</font><br>");
		else
			player:echo("--------------<br><a href='event:talk_td"..i.."'>" .. hd_data_btd[i].name .."</a><br>");
		end
	end
		player:echo("--------------");
	player:listtalk_list(200);
	hd_data_btd[id].funb(player,id);
	player:listtalk_content(200);
	player:listtalk_title("",200);
end


function t_contentd(player,id)
	if id == 1 then help31(player,id); end
	if id == 2 then help32(player,id); end
	if id == 3 then help33(player,id); end
	if id == 4 then help34(player,id); end
	if id == 5 then help35(player,id); end
	if id == 6 then help36(player,id); end
	if id == 7 then help37(player,id); end
	if id == 8 then help38(player,id); end
	if id == 9 then help39(player,id); end
end


function onTalktd1(player) Show_tt(player,1); end
function onTalktd2(player) Show_tt(player,2); end
function onTalktd3(player) Show_tt(player,3); end
function onTalktd4(player) Show_tt(player,4); end
function onTalktd5(player) Show_tt(player,5); end
function onTalktd6(player) Show_tt(player,6); end
function onTalktd7(player) Show_tt(player,7); end
function onTalktd8(player) Show_tt(player,8); end
function onTalktd9(player) Show_tt(player,9); end

function help31(player,id)
	if id == 1 then
	local map1 = server.find_map("wmsm3");
	local map2 = server.find_map("wgd5");
	local map3 = server.find_map("zhudong4");
	local map4 = server.find_map("zuma5");
	local map5 = server.find_map("fengmo4");
	local map6 = server.find_map("niumo4");
	local map7 = server.find_map("chiyue4");
	if map1:num_monster("奴玛教主") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("嗜血毒虫") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("邪恶蛇蝎") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("猛犸教主") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("魔魂教主") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("蛮牛王") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("妖月金刚") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("妖月血魔") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">凌云套装(50级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">奴玛教主</font>   地点:<a href="event:talk_nmsm1">奴玛寺庙</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">嗜血毒虫</font>   地点:<a href="event:talk_xedx2">邪恶洞穴</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">邪恶蛇蝎</font>   地点:<a href="event:talk_zycx3">猪妖巢穴</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">猛犸教主</font>   地点:<a href="event:talk_mmsd4">猛犸神殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">魔魂教主</font>   地点:<a href="event:talk_mohd5">魔 魂 殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">蛮 牛 王</font>   地点:<a href="event:talk_mmdd6">蛮牛大殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">妖月金刚</font>   地点:<a href="event:talk_yyxg7">妖月峡谷</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">妖月血魔</font>   地点:<a href="event:talk_yyxg7">妖月峡谷</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">60级混天套装</font></font>
---------------------------------------------------]]);
	end
end


function onTalkyyxg7(player)
	if  player:get_level()>= 40 then
		player:enter_map("chiyue1",214,41);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去妖月峡谷??还是40级以后再去吧!");
		Show_tt(player,1);
	end
end


function onTalkmmdd6(player)
	if  player:get_level()>= 35 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去蛮牛洞??还是35级以后再去吧!");
		Show_tt(player,1);
	end
end


function onTalkmohd5(player)
	if  player:get_level()>= 30 then
		player:enter_map("fengmo1",179,173);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去魔魂殿??还是30级以后再去吧!");
		Show_tt(player,1);
	end
end


function onTalkmmsd4(player)
	if  player:get_level()>= 30 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猛犸寺庙??还是30级以后再去吧!");
		Show_tt(player,1);
	end
end


function onTalkzycx3(player)
	if  player:get_level()>= 25 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猪妖洞??还是25级以后再去吧!");
		Show_tt(player,1);
	end
end

function onTalkxedx2(player)
	if  player:get_level()>= 20 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去邪恶洞穴??还是20级以后再去吧!");
		Show_tt(player,1);
	end
end

function onTalknmsm1(player)
	if  player:get_level()>= 15 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去奴玛寺庙??还是15级以后再去吧!");
		Show_tt(player,1);
	end
end

function help32(player,id)
	if id == 2 then
	local map1 = server.find_map("wmsm3");
	local map2 = server.find_map("wgd5");
	local map3 = server.find_map("zhudong4");
	local map4 = server.find_map("zuma5");
	local map5 = server.find_map("fengmo4");
	local map6 = server.find_map("niumo4");
	local map7 = server.find_map("chiyue4");
	if map1:num_monster("奴玛教主") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("嗜血毒虫") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("邪恶蛇蝎") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("猛犸教主") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("魔魂教主") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("蛮牛王") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("妖月金刚") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("妖月血魔") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">惊世套装(55级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">奴玛教主</font>   地点:<a href="event:talk_nmsm1b">奴玛寺庙</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">嗜血毒虫</font>   地点:<a href="event:talk_xedx2b">邪恶洞穴</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">邪恶蛇蝎</font>   地点:<a href="event:talk_zycx3b">猪妖巢穴</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">猛犸教主</font>   地点:<a href="event:talk_mmsd4b">猛犸神殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">魔魂教主</font>   地点:<a href="event:talk_mohd5b">魔 魂 殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">蛮 牛 王</font>   地点:<a href="event:talk_mmdd6b">蛮牛大殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">妖月金刚</font>   地点:<a href="event:talk_yyxg7b">妖月峡谷</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">妖月血魔</font>   地点:<a href="event:talk_yyxg7b">妖月峡谷</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">60级混天套装</font></font>
---------------------------------------------------]]);
	end
end


function onTalkyyxg7b(player)
	if  player:get_level()>= 40 then
		player:enter_map("chiyue1",214,41);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去妖月峡谷??还是40级以后再去吧!");
		Show_tt(player,2);
	end
end


function onTalkmmdd6b(player)
	if  player:get_level()>= 35 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去蛮牛洞??还是35级以后再去吧!");
		Show_tt(player,2);
	end
end


function onTalkmohd5b(player)
	if  player:get_level()>= 30 then
		player:enter_map("fengmo1",179,173);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去魔魂殿??还是30级以后再去吧!");
		Show_tt(player,2);
	end
end


function onTalkmmsd4b(player)
	if  player:get_level()>= 30 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猛犸寺庙??还是30级以后再去吧!");
		Show_tt(player,2);
	end
end


function onTalkzycx3b(player)
	if  player:get_level()>= 25 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猪妖洞??还是25级以后再去吧!");
		Show_tt(player,2);
	end
end

function onTalkxedx2b(player)
	if  player:get_level()>= 20 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去邪恶洞穴??还是20级以后再去吧!");
		Show_tt(player,2);
	end
end

function onTalknmsm1b(player)
	if  player:get_level()>= 15 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去奴玛寺庙??还是15级以后再去吧!");
		Show_tt(player,2);
	end
end




function help33(player,id)
	if id == 3 then
	local map1 = server.find_map("wmsm3");
	local map2 = server.find_map("wgd5");
	local map3 = server.find_map("zhudong4");
	local map4 = server.find_map("zuma5");
	local map5 = server.find_map("fengmo4");
	local map6 = server.find_map("niumo4");
	local map7 = server.find_map("chiyue4");
	if map1:num_monster("奴玛教主") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("嗜血毒虫") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("邪恶蛇蝎") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("猛犸教主") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("魔魂教主") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("蛮牛王") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("妖月金刚") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("妖月血魔") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">混天套装(60级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">奴玛教主</font>   地点:<a href="event:talk_nmsm1c">奴玛寺庙</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">嗜血毒虫</font>   地点:<a href="event:talk_xedx2c">邪恶洞穴</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">邪恶蛇蝎</font>   地点:<a href="event:talk_zycx3c">猪妖巢穴</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">猛犸教主</font>   地点:<a href="event:talk_mmsd4c">猛犸神殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">魔魂教主</font>   地点:<a href="event:talk_mohd5c">魔 魂 殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">蛮 牛 王</font>   地点:<a href="event:talk_mmdd6c">蛮牛大殿</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">妖月金刚</font>   地点:<a href="event:talk_yyxg7c">妖月峡谷</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">妖月血魔</font>   地点:<a href="event:talk_yyxg7c">妖月峡谷</a>  刷新间隔:<font color="#ffaa00">5分钟</font> (]]..server.get_var("bosssx8")..[[)
---------------------------------------------------]]);
	end
end


function onTalkyyxg7c(player)
	if  player:get_level()>= 40 then
		player:enter_map("chiyue1",214,41);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去妖月峡谷??还是40级以后再去吧!");
		Show_tt(player,3);
	end
end


function onTalkmmdd6c(player)
	if  player:get_level()>= 35 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去蛮牛洞??还是35级以后再去吧!");
		Show_tt(player,3);
	end
end


function onTalkmohd5c(player)
	if  player:get_level()>= 30 then
		player:enter_map("fengmo1",179,173);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去魔魂殿??还是30级以后再去吧!");
		Show_tt(player,3);
	end
end


function onTalkmmsd4c(player)
	if  player:get_level()>= 30 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猛犸寺庙??还是30级以后再去吧!");
		Show_tt(player,3);
	end
end


function onTalkzycx3c(player)
	if  player:get_level()>= 25 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猪妖洞??还是25级以后再去吧!");
		Show_tt(player,3);
	end
end

function onTalkxedx2c(player)
	if  player:get_level()>= 20 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去邪恶洞穴??还是20级以后再去吧!");
		Show_tt(player,3);
	end
end

function onTalknmsm1c(player)
	if  player:get_level()>= 15 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去奴玛寺庙??还是15级以后再去吧!");
		Show_tt(player,3);
	end
end




function help34(player,id)
	if id == 4 then
	local map1 = server.find_map("wmsm4");
	local map2 = server.find_map("wgd6");
	local map3 = server.find_map("zhudong5");
	local map4 = server.find_map("zuma6");
	local map5 = server.find_map("niumo5");
	local map6 = server.find_map("wwsd");
	local map7 = server.find_map("lysd");
	local map8 = server.find_map("wjsd");
	if map1:num_monster("奴玛教皇") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("邪龙神") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("变异蛇蝎王") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("猛犸教皇") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("牛魔圣君") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("武威战神") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("烈焰法神") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map8:num_monster("无极天尊") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">潜龙套装(65级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">奴玛教皇</font>   地点:<a href="event:talk_nmhg8d">奴玛后宫</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">邪 龙 神</font>   地点:<a href="event:talk_xelg9d">邪 龙 谷</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">变异蛇蝎王</font> 地点:<a href="event:talk_zymk10d">猪妖魔窟</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">猛犸教皇</font>   地点:<a href="event:talk_mmhg11d">猛犸后宫</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">牛魔圣君</font>   地点:<a href="event:talk_mnsd12d">蛮牛圣殿</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">武威战神</font>   地点:<a href="event:local_goto_wwsd_31_39">武 威 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">烈焰法神</font>   地点:<a href="event:local_goto_lysd_31_39">烈 焰 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">无极天尊</font>   地点:<a href="event:local_goto_wjsd_31_39">无 极 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">高级官职装备</font></font>
---------------------------------------------------]]);
	end
end


function onTalknmhg8d(player)
	if  player:get_level()>= 45 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>奴玛后宫</font>]需从[<font color='#ff0000'>奴玛神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去奴玛后宫??还是45级以后再去吧!");
		Show_tt(player,4);
	end
end

function onTalkxelg9d(player)
	if  player:get_level()>= 45 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>邪龙谷</font>]需从[<font color='#ff0000'>邪恶之谷</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去邪龙谷??还是45级以后再去吧!");
		Show_tt(player,4);
	end
end

function onTalkzymk10d(player)
	if  player:get_level()>= 45 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>猪妖魔窟</font>]需从[<font color='#ff0000'>猪妖巢穴</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去猪妖魔窟??还是45级以后再去吧!");
		Show_tt(player,4);
	end
end

function onTalkmmhg11d(player)
	if  player:get_level()>= 45 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>猛犸后宫</font>]需从[<font color='#ff0000'>猛犸神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去猛犸后宫??还是45级以后再去吧!");
		Show_tt(player,4);
	end
end

function onTalkmnsd12d(player)
	if  player:get_level()>= 45 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>蛮牛圣殿</font>]需从[<font color='#ff0000'>蛮牛大殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去蛮牛圣殿??还是45级以后再去吧!");
		Show_tt(player,4);
	end
end




function help35(player,id)
	if id == 5 then
	local map1 = server.find_map("wmsm4");
	local map2 = server.find_map("wgd6");
	local map3 = server.find_map("zhudong5");
	local map4 = server.find_map("zuma6");
	local map5 = server.find_map("niumo5");
	local map6 = server.find_map("wwsd");
	local map7 = server.find_map("lysd");
	local map8 = server.find_map("wjsd");
	if map1:num_monster("奴玛教皇") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("邪龙神") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("变异蛇蝎王") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("猛犸教皇") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("牛魔圣君") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("武威战神") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("烈焰法神") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map8:num_monster("无极天尊") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">无双套装(70级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">奴玛教皇</font>   地点:<a href="event:talk_nmhg8e">奴玛后宫</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">邪 龙 神</font>   地点:<a href="event:talk_xelg9e">邪 龙 谷</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">变异蛇蝎王</font> 地点:<a href="event:talk_zymk10e">猪妖魔窟</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">猛犸教皇</font>   地点:<a href="event:talk_mmhg11e">猛犸后宫</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">牛魔圣君</font>   地点:<a href="event:talk_mnsd12e">蛮牛圣殿</a>  刷新间隔:<font color="#ffaa00">30分钟</font> (]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">武威战神</font>   地点:<a href="event:local_goto_wwsd_31_39">武 威 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">烈焰法神</font>   地点:<a href="event:local_goto_lysd_31_39">烈 焰 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">无极天尊</font>   地点:<a href="event:local_goto_wjsd_31_39">无 极 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">高级官职装备</font></font>
---------------------------------------------------]]);
	end
end


function onTalknmhg8e(player)
	if  player:get_level()>= 45 then
		player:enter_map("wmsm1",282,270);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>奴玛后宫</font>]需从[<font color='#ff0000'>奴玛神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去奴玛后宫??还是45级以后再去吧!");
		Show_tt(player,5);
	end
end

function onTalkxelg9e(player)
	if  player:get_level()>= 45 then
		player:enter_map("wgd1",374,373);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>邪龙谷</font>]需从[<font color='#ff0000'>邪恶之谷</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去邪龙谷??还是45级以后再去吧!");
		Show_tt(player,5);
	end
end

function onTalkzymk10e(player)
	if  player:get_level()>= 45 then
		player:enter_map("zhudong1",21,231);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>猪妖魔窟</font>]需从[<font color='#ff0000'>猪妖巢穴</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去猪妖魔窟??还是45级以后再去吧!");
		Show_tt(player,5);
	end
end

function onTalkmmhg11e(player)
	if  player:get_level()>= 45 then
		player:enter_map("zuma1",29,226);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>猛犸后宫</font>]需从[<font color='#ff0000'>猛犸神殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去猛犸后宫??还是45级以后再去吧!");
		Show_tt(player,5);
	end
end

function onTalkmnsd12e(player)
	if  player:get_level()>= 45 then
		player:enter_map("niumo1",40,150);
		go.givehuicheng(player);
		player:alert(11,1,"[<font color='#ff0000'>蛮牛圣殿</font>]需从[<font color='#ff0000'>蛮牛大殿</font>]的[<font color='#ff0000'>封印使者</font>]进入!");
	else
		player:alert(1,1,"想去蛮牛圣殿??还是45级以后再去吧!");
		Show_tt(player,5);
	end
end



function help36(player,id)
	if id == 6 then
	local map1 = server.find_map("wwsd");
	local map2 = server.find_map("lysd");
	local map3 = server.find_map("wjsd");
	local map4 = server.find_map("jlsk4");
	local map5 = server.find_map("hund4");
	local map6 = server.find_map("bfxy4");
	local map7 = server.find_map("dyry4");
	local map8 = server.find_map("swxc4");
	if map1:num_monster("武威战神") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("烈焰法神") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("无极天尊") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("巨灵天魔") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("混沌魔君") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("噬日魔兽") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("地狱炎魔") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map8:num_monster("落日恶魔") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">至尊套装(75级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">武威战神</font>   地点:<a href="event:local_goto_wwsd_31_39">武 威 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">烈焰法神</font>   地点:<a href="event:local_goto_lysd_31_39">烈 焰 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">无极天尊</font>   地点:<a href="event:local_goto_wjsd_31_39">无 极 殿</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">巨灵天魔</font>   地点:<a href="event:talk_jlsk14f">巨灵石窟</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">混沌魔君</font>   地点:<a href="event:talk_hdzm15f">混沌之门</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">噬日魔兽</font>   地点:<a href="event:talk_bfxy16f">冰封雪域</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">地狱炎魔</font>   地点:<a href="event:talk_lymk18f">烈炎魔窟</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">落日恶魔</font>   地点:<a href="event:talk_lrxc19f">落日刑场</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">高级官职装备</font></font>
---------------------------------------------------
]]);
	end
end


function onTalklrxc19f(player)
	if  player:get_level()>= 55 then
		player:enter_map("swxc1",23,230);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去落日刑场??还是55级以后再去吧!");
		Show_tt(player,6);
	end
end


function onTalklymk18f(player)
	if  player:get_level()>= 50 then
		player:enter_map("dyry1",15,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去烈炎魔窟??还是50级以后再去吧!");
		Show_tt(player,6);
	end
end

function onTalkbfxy16f(player)
	if  player:get_level()>= 50 then
		player:enter_map("bfxy1",196,57);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去冰封雪域??还是50级以后再去吧!");
		Show_tt(player,6);
	end
end

function onTalkhdzm15f(player)
	if  player:get_level()>= 50 then
		player:enter_map("hund1",237,232);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去混沌之门??还是50级以后再去吧!");
		Show_tt(player,6);
	end
end

function onTalkjlsk14f(player)
	if  player:get_level()>= 50 then
		player:enter_map("jlsk1",19,92);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去巨灵石窟??还是50级以后再去吧!");
		Show_tt(player,6);
	end
end



function help37(player,id)
	if id == 7 then
	local map1 = server.find_map("jlsk4");
	local map2 = server.find_map("hund4");
	local map3 = server.find_map("bfxy4");
	local map4 = server.find_map("dyry4");
	local map5 = server.find_map("swxc4");
	local map6 = server.find_map("zzzd4");
	local map7 = server.find_map("qshl4");
	local map8 = server.find_map("ygsy4");
	if map1:num_monster("巨灵天魔") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("混沌魔君") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("噬日魔兽") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("地狱炎魔") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("落日恶魔") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("亘古魔王") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("天威魔帝") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map8:num_monster("远古大帝") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">天龙套装(80级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">巨灵天魔</font>   地点:<a href="event:talk_jlsk14g">巨灵石窟</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">混沌魔君</font>   地点:<a href="event:talk_hdzm15g">混沌之门</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">噬日魔兽</font>   地点:<a href="event:talk_bfxy16g">冰封雪域</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">地狱炎魔</font>   地点:<a href="event:talk_lymk18g">烈炎魔窟</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">落日恶魔</font>   地点:<a href="event:talk_lrxc19g">落日刑场</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">亘古魔王</font>   地点:<a href="event:talk_smjt20g">神庙祭坛</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">天威魔帝</font>   地点:<a href="event:talk_twsd21g">天威圣殿</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">远古大帝</font>   地点:<a href="event:talk_ygsy22g">远古深渊</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">高级官职装备</font></font>
---------------------------------------------------
]]);
	end
end

function onTalkygsy22g(player)
	if  player:get_level()>= 70 then
		player:enter_map("ygsy1",46,102);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去远古深渊??还是70级以后再去吧!");
		Show_tt(player,7);
	end
end

function onTalktwsd21g(player)
	if  player:get_level()>= 65 then
		player:enter_map("qshl1",71,185);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去天威圣殿??还是65级以后再去吧!");
		Show_tt(player,7);
	end
end

function onTalksmjt20g(player)
	if  player:get_level()>= 60 then
		player:enter_map("zzzd1",75,212);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去神庙祭坛??还是60级以后再去吧!");
		Show_tt(player,7);
	end
end

function onTalklrxc19g(player)
	if  player:get_level()>= 55 then
		player:enter_map("swxc1",23,230);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去落日峡谷??还是55级以后再去吧!");
		Show_tt(player,7);
	end
end

function onTalklymk18g(player)
	if  player:get_level()>= 50 then
		player:enter_map("dyry1",15,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去地狱熔岩??还是50级以后再去吧!");
		Show_tt(player,7);
	end
end


function onTalkbfxy16g(player)
	if  player:get_level()>= 50 then
		player:enter_map("bfxy1",196,57);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去冰封雪域??还是50级以后再去吧!");
		Show_tt(player,7);
	end
end

function onTalkhdzm15g(player)
	if  player:get_level()>= 50 then
		player:enter_map("hund1",237,232);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去混沌之门??还是50级以后再去吧!");
		Show_tt(player,7);
	end
end

function onTalkjlsk14g(player)
	if  player:get_level()>= 50 then
		player:enter_map("jlsk1",19,92);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去巨灵石窟??还是50级以后再去吧!");
		Show_tt(player,7);
	end
end





function help38(player,id)
	if id == 8 then
	local map1 = server.find_map("jlsk4");
	local map2 = server.find_map("hund4");
	local map3 = server.find_map("bfxy4");
	local map4 = server.find_map("dyry4");
	local map5 = server.find_map("swxc4");
	local map6 = server.find_map("zzzd4");
	local map7 = server.find_map("qshl4");
	local map8 = server.find_map("ygsy4");
	if map1:num_monster("巨灵天魔") == 0 then server.set_var("bosssx1","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx1","<font color='#00EE00'>已刷新</font>"); end
	if map2:num_monster("混沌魔君") == 0 then server.set_var("bosssx2","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx2","<font color='#00EE00'>已刷新</font>"); end
	if map3:num_monster("噬日魔兽") == 0 then server.set_var("bosssx3","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx3","<font color='#00EE00'>已刷新</font>"); end
	if map4:num_monster("地狱炎魔") == 0 then server.set_var("bosssx4","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx4","<font color='#00EE00'>已刷新</font>"); end
	if map5:num_monster("落日恶魔") == 0 then server.set_var("bosssx5","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx5","<font color='#00EE00'>已刷新</font>"); end
	if map6:num_monster("亘古魔王") == 0 then server.set_var("bosssx6","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx6","<font color='#00EE00'>已刷新</font>"); end
	if map7:num_monster("天威魔帝") == 0 then server.set_var("bosssx7","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx7","<font color='#00EE00'>已刷新</font>"); end
	if map8:num_monster("远古大帝") == 0 then server.set_var("bosssx8","<font color='#ff0000'>未出现</font>"); else server.set_var("bosssx8","<font color='#00EE00'>已刷新</font>"); end
		player:echo([[---------------------------------------------------
<font color="#ffff00">三皇套装(85级)主要在以下BOSS身上掉落:</font>
---------------------------------------------------
<font color="#ffaa00">巨灵天魔</font>   地点:<a href="event:talk_jlsk14h">巨灵石窟</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx1")..[[)
---------------------------------------------------
<font color="#ffaa00">混沌魔君</font>   地点:<a href="event:talk_hdzm15h">混沌之门</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx2")..[[)
---------------------------------------------------
<font color="#ffaa00">噬日魔兽</font>   地点:<a href="event:talk_bfxy16h">冰封雪域</a>  刷新间隔:<font color="#ffaa00">60分钟</font> (]]..server.get_var("bosssx3")..[[)
---------------------------------------------------
<font color="#ffaa00">地狱炎魔</font>   地点:<a href="event:talk_lymk18h">烈炎魔窟</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx4")..[[)
---------------------------------------------------
<font color="#ffaa00">落日恶魔</font>   地点:<a href="event:talk_lrxc19h">落日刑场</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx5")..[[)
---------------------------------------------------
<font color="#ffaa00">亘古魔王</font>   地点:<a href="event:talk_smjt20h">神庙祭坛</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx6")..[[)
---------------------------------------------------
<font color="#ffaa00">天威魔帝</font>   地点:<a href="event:talk_twsd21h">天威圣殿</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx7")..[[)
---------------------------------------------------
<font color="#ffaa00">远古大帝</font>   地点:<a href="event:talk_ygsy22h">远古深渊</a>  刷新间隔:<font color="#ffaa00">120分钟</font>(]]..server.get_var("bosssx8")..[[)
---------------------------------------------------
<font color="#ff0000">请注意:消灭以上BOSS将会有几率掉落<font color="#ff00ff">高级官职装备</font></font>
---------------------------------------------------
]]);
	end
end

function onTalkygsy22h(player)
	if  player:get_level()>= 70 then
		player:enter_map("ygsy1",46,102);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去远古深渊??还是70级以后再去吧!");
		Show_tt(player,8);
	end
end

function onTalktwsd21h(player)
	if  player:get_level()>= 65 then
		player:enter_map("qshl1",71,185);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去天威圣殿??还是65级以后再去吧!");
		Show_tt(player,8);
	end
end

function onTalksmjt20h(player)
	if  player:get_level()>= 60 then
		player:enter_map("zzzd1",75,212);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去神庙祭坛??还是60级以后再去吧!");
		Show_tt(player,8);
	end
end

function onTalklrxc19h(player)
	if  player:get_level()>= 55 then
		player:enter_map("swxc1",23,230);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去落日峡谷??还是55级以后再去吧!");
		Show_tt(player,8);
	end
end

function onTalklymk18h(player)
	if  player:get_level()>= 50 then
		player:enter_map("dyry1",15,226);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去地狱熔岩??还是50级以后再去吧!");
		Show_tt(player,8);
	end
end


function onTalkbfxy16h(player)
	if  player:get_level()>= 45 then
		player:enter_map("bfxy1",196,57);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去冰封雪域??还是45级以后再去吧!");
		Show_tt(player,8);
	end
end

function onTalkhdzm15h(player)
	if  player:get_level()>= 45 then
		player:enter_map("hund1",237,232);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去混沌之门??还是45级以后再去吧!");
		Show_tt(player,8);
	end
end

function onTalkjlsk14h(player)
	if  player:get_level()>= 45 then
		player:enter_map("jlsk1",19,92);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去巨灵石窟??还是45级以后再去吧!");
		Show_tt(player,8);
	end
end



function help39(player,id)
	if id == 9 then
		player:echo([[---------------------------------------------------
<font color="#ffff00">[武尊]终极神器积分装备说明:</font>
---------------------------------------------------
<font color="#ffaa00">消灭[神器宝阁]的[天魔兽]获得神器积分即可兑换[神器]</font>

[天魔兽]将会在每天的[<font color="#ff0000">10:30</font>][<font color="#ff0000">14:30</font>][<font color="#ff0000">17:30</font>]出现!

<a href="event:talk_sqbg">点击进入神器宝阁</a>: 需要等级达到[<font color="#ff0000">45</font>]级方可进入
---------------------------------------------------
<font color="#ccbb77">您当前</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>

##龙皇离火剑·武威## <a href="event:talk_jfdh1">积分兑换</a> 需要:1500点神器积分

##龙皇离火剑·烈焰## <a href="event:talk_jfdh2">积分兑换</a> 需要:1500点神器积分

##龙皇离火剑·无极## <a href="event:talk_jfdh3">积分兑换</a> 需要:1500点神器积分

---------------------------------------------------
<a href="event:talk_dhjf2">盘古神石兑换积分</a> <font color="#ff0000">兑换(80-150)神器积分,商铺有售</font>
---------------------------------------------------
<a href="event:local_goto_v003_128_102_神器使者">点击前往神器使者</a> <font color="#ff0000">神器使者处可查询其他神器信息</font>
---------------------------------------------------

]]);
	end
end

function onTalkdhjf2(player)
	if player:num_item("盘古神石",1) >= 1 then
		player:remove_item("盘古神石",1);
		local i = math.random(1,100);
		if i >= 1 and i <= 80 then
			local jf = math.random(80,110);
			player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+jf);
			player:alert(11,1,"神器积分增加:"..jf.."分");
			player:alert(11,0,"当前神器积分:"..util.ppn(player,const.PP_SQJF).."分");
		end
		if i >= 81 and i <= 100 then
			local jf = math.random(80,150);
			player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+jf);
			player:alert(11,1,"神器积分增加:"..jf.."分");
			player:alert(11,0,"当前神器积分:"..util.ppn(player,const.PP_SQJF).."分");
		end
	else
		player:alert(1,1,"您没有[盘古神石]无法兑换神器积分哦!<br><br>[盘古神石]可在商铺获得!");
	end
		Show_tt(player,9);
end

function onTalksqbg(player)
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
		Show_tt(player,9);
	end
end





function onTalkjfdh1(player) jfdhsq(player,1500,"龙皇离火剑·武威") end
function onTalkjfdh2(player) jfdhsq(player,1500,"龙皇离火剑·烈焰") end
function onTalkjfdh3(player) jfdhsq(player,1500,"龙皇离火剑·无极") end


function jfdhsq(player,a,b)
	if a and b then
		if util.ppn(player,const.PP_SQJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-a);
				player:add_item_log(b,216,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."点神器积分成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."点神器积分成功兑换[<font color='#ff0000'>"..b.."</font>]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				Show_tt(player,9);
			end
		else
			player:alert(1,1,"对不起,您的神器积分不足"..a.."点,无法兑换!");
			Show_tt(player,9);
		end
	end
end