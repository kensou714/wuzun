module(..., package.seeall)


function onTalk100(npc,player)
	if player:get_map():get_id() == "wmsm3" then
	npc:echo([[--------------------------------------
            <font color="#ffff00">封印的奴玛后宫</font>
--------------------------------------
几百年前,天尊将邪恶的[<font color="#ffaa00">沃玛教皇</font>]封印在[沃玛后宫]!如今封印的力量渐渐减弱,勇士们是时候消灭[<font color="#ffaa00">沃玛教皇</font>]了!
--------------------------------------
<font color="#ffff00">攻击方式: 远距离魔法单体攻击</font> 
--------------------------------------
<font color="#ffff00">刷新间隔: 3600秒</font> 
--------------------------------------
<font color="#ffff00">危险级别: ★★★★☆</font> 
--------------------------------------
<font color="#ffff00">进入需要: 等级达到45级</font> 
--------------------------------------
<font color="#ff0000">消灭[沃玛教皇]将会掉落衣服和装备哦!</font>
--------------------------------------
                    <a href="event:talk_jinru">进入封印的奴玛后宫</a>
--------------------------------------
	]]);
	end
	if player:get_map():get_id() == "wgd5" then
	npc:echo([[--------------------------------------
            <font color="#ffff00">封印的邪龙神谷</font>
--------------------------------------
几百年前,法神将邪恶的[<font color="#ffaa00">邪龙神</font>]封印在[邪龙神谷]!如今封印的力量渐渐减弱,勇士们是时候消灭[<font color="#ffaa00">邪龙神</font>]了!
--------------------------------------
<font color="#ffff00">攻击方式: 远距离魔法单体攻击</font> 
--------------------------------------
<font color="#ffff00">刷新间隔: 3600秒</font> 
--------------------------------------
<font color="#ffff00">危险级别: ★★★★★</font> 
--------------------------------------
<font color="#ffff00">进入需要: 等级达到45级</font> 
--------------------------------------
<font color="#ff0000">消灭[邪龙神]将会掉落衣服和装备哦哦!</font>
--------------------------------------
                    <a href="event:talk_jinru">进入封印的邪龙神谷</a>
--------------------------------------
	]]);
	end
	if player:get_map():get_id() == "zhudong4" then
	npc:echo([[--------------------------------------
            <font color="#ffff00">封印的猪妖魔窟</font>
--------------------------------------
几百年前,战神将邪恶的[<font color="#ffaa00">变异蛇蝎王</font>]封印在[猪妖魔窟]!如今封印的力量渐渐减弱,勇士们是时候消灭[<font color="#ffaa00">变异蛇蝎王</font>]了!
--------------------------------------
<font color="#ffff00">攻击方式: 近身物理攻击</font> 
--------------------------------------
<font color="#ffff00">刷新间隔: 3600秒</font> 
--------------------------------------
<font color="#ffff00">危险级别: ★★★★☆</font> 
--------------------------------------
<font color="#ffff00">进入需要: 等级达到45级</font> 
--------------------------------------
<font color="#ff0000">消灭[变异蛇蝎王]将会掉落衣服和装备哦!</font>
--------------------------------------
                    <a href="event:talk_jinru">进入封印的猪妖魔窟</a>
--------------------------------------
	]]);
	end
	if player:get_map():get_id() == "zuma5" then
	npc:echo([[--------------------------------------
            <font color="#ffff00">封印的猛犸后宫</font>
--------------------------------------
几百年前,战神将邪恶的[<font color="#ffaa00">猛犸教皇</font>]封印在[猛犸后宫]!如今封印的力量渐渐减弱,勇士们是时候消灭[<font color="#ffaa00">猛犸教皇</font>]了!
--------------------------------------
<font color="#ffff00">攻击方式: 远距离魔法单体攻击</font> 
--------------------------------------
<font color="#ffff00">刷新间隔: 3600秒</font> 
--------------------------------------
<font color="#ffff00">危险级别: ★★★★☆</font> 
--------------------------------------
<font color="#ffff00">进入需要: 等级达到45级</font> 
--------------------------------------
<font color="#ff0000">消灭[猛犸教皇]将会掉落衣服和装备哦!</font>
--------------------------------------
                    <a href="event:talk_jinru">进入封印的猛犸后宫</a>
--------------------------------------
	]]);
	end
	if player:get_map():get_id() == "niumo4" then
	npc:echo([[--------------------------------------
            <font color="#ffff00">封印的蛮牛圣殿</font>
--------------------------------------
几百年前,法神将邪恶的[<font color="#ffaa00">牛魔圣君</font>]封印在[蛮牛圣殿]!如今封印的力量渐渐减弱,勇士们是时候消灭[<font color="#ffaa00">牛魔圣君</font>]了!
--------------------------------------
<font color="#ffff00">攻击方式: 远距离魔法单体攻击</font> 
--------------------------------------
<font color="#ffff00">刷新间隔: 3600秒</font> 
--------------------------------------
<font color="#ffff00">危险级别: ★★★★☆</font> 
--------------------------------------
<font color="#ffff00">进入需要: 等级达到45级</font> 
--------------------------------------
<font color="#ff0000">消灭[牛魔圣君]将会掉落衣服和装备哦!</font>
--------------------------------------
                    <a href="event:talk_jinru">进入封印的蛮牛圣殿</a>
--------------------------------------
	]]);
	end
end

function onTalkjinru(npc,player)
		if player:get_map():get_id() == "wmsm3" then
			if player:get_level() >= 45 then
				player:enter_map("wmsm4",14,73);
				go.givehuicheng(player);
			else
				player:alert(1,1,"进入奴玛后宫需要等级达到45级!");
				onTalk100(npc,player);
			end
		end
		if player:get_map():get_id() == "wgd5" then
			if player:get_level() >= 45 then
				player:enter_map("wgd6",16,17);
				go.givehuicheng(player);
			else
				player:alert(1,1,"进入邪龙神谷需要等级达到45级!");
				onTalk100(npc,player);
			end
		end
		if player:get_map():get_id() == "zhudong4" then
			if player:get_level() >= 45 then
				player:enter_map("zhudong5",13,50);
				go.givehuicheng(player);
			else
				player:alert(1,1,"进入猪妖魔窟需要等级达到45级!");
				onTalk100(npc,player);
			end
		end
		if player:get_map():get_id() == "zuma5" then
			if player:get_level() >= 45 then
				player:enter_map("zuma6",17,71);
				go.givehuicheng(player);
			else
				player:alert(1,1,"进入猛犸后宫需要等级达到45级!");
				onTalk100(npc,player);
			end
		end
		if player:get_map():get_id() == "niumo4" then
			if player:get_level() >= 45 then
				player:enter_map("niumo5",20,20);
				go.givehuicheng(player);
			else
				player:alert(1,1,"进入蛮牛圣殿需要等级达到45级!")
				onTalk100(npc,player);
			end
		end
end