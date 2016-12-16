module(..., package.seeall)

function onRefreshShowFlags(npc,player)
	if util.ppn(player,const.PP_BOSSTZ) >= 1 and player:get_level() >= 40 then
		player:show_npc_flags(npc,1);
		return;
	end
		player:show_npc_flags(npc,0);
end

function onTalk100(npc,player)
npc:echo([[
<b><font color="#ccbb77" size="14px">想要挑战BOSS吗?</font></b>

从<font color="#ffaa00">40级</font>开始就可以BOSS挑战了!
每5级一个BOSS,最高BOSS等级为60级!

BOSS爆装备的几率超级高!
而且还有一定几率掉落<font color="#ff0000">特殊装备</font>哦!!!

<font color="#00ff00">BOSS挑战活动每天赠送玩家3次机会!</font>

<font color="#ff8000">您今天还可以BOSS挑战 ]]..(util.ppn(player,const.PP_BOSSTZ))..[[ 次.</font>

##continue##<a href="event:talk_101">我要开始挑战BOSS...</a>

--------------------------------------
<font color="#ffff00">消灭各地图的BOSS是获取装备的最快途径</font>
]]);
end
--/--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function find_empty_room()
	local map;
	for i=1,50 do
		map=server.find_map("boss"..i);
		if map and map:num_player()<1 then
			return map;
		end
	end
	return nil;
end

function tolv(i)
	if i >= 40 then
		if (math.floor(i/5)*5) >= 60 then
			return 60;
		else
			return (math.floor(i/5)*5);
		end
	end
end

function onTalk101(npc,player)
	if player:get_level() >= 40 then
		if util.ppn(player,const.PP_BOSSTZ) >= 1 then
			local boss = {
					[40] = "奴玛教主1",
					[45] = "邪恶蛇蝎1",
					[50] = "猛犸教主1",
					[55] = "蛮牛王1",
					[60] = "妖月金刚1",
				};
			if boss[tolv(player:get_level())] then
				local map = find_empty_room();
				if map then
					player:set_param(const.PP_BOSSTZ,util.ppn(player,const.PP_BOSSTZ)-1);
					player:enter_map(map:get_id(),17,41);
					map:clear_mon();
					map:clear_item();
					map:mon_gen(31,41,boss[tolv(player:get_level())],1,5,10,1);
					map:set_timer(1,0);
					map:set_timer(1,600000);
					player:alert(111,0,"你只有10分钟的时间清除里面的怪物");
					go.givehuicheng(player);
				else
					player:alert(1,1,"很抱歉,没有空余的BOSS挑战房间,请稍后再来!");
					onTalk100(npc,player)
				end
			else
				player:alert(1,1,"很抱歉,没有您这个等级段能够挑战的BOSS!");
				onTalk100(npc,player)
			end
		end
	else
		player:alert(1,1,"40级以上才可进行BOSS挑战!");
		onTalk100(npc,player)
	end
end