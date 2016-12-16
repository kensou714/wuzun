module(..., package.seeall)

function onTalk100(npc,player)
npc:echo([[
<b><font color="#ccbb77" size="14px">闯塔说明</font></b>
<font color="#ff0000">
<font color="#ccbb77">本层目标</font> 5分钟内消灭本层怪物

<font color="#ccbb77">经验奖励</font> ]]..to_exp(player)..[[点<br>
]]);
	if player:get_map():get_id() ~= "zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."12" then npc:echo([[<font color="#ccbb77">下层需要</font> ]]..to_lingpai(player)..[[块镇魔令牌]]); end
npc:echo([[<br>
<font color="#ccbb77">提示说明</font> 等级越高需要的镇魔令越多并且经验也越来越高

<font color="#ccbb77">您的镇魔令数量为</font> ]]..util.ppn(player,const.PP_SUOYAOTA_PAI)..[[个</font><br><br>
]]);
	if player:get_map():get_id() == "zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."12" then
	npc:echo([[
<font color="#ccbb77">终极关</font>
##continue##<a href="event:talk_z200">领取镇魔塔12层终极奖励</a><br>
]]);
	else
	npc:echo([[
<font color="#ccbb77">打道</font>
##continue##<a href="event:talk_z200">领取经验直接回城</a><br>
<font color="#ccbb77">冲关</font>
##continue##<a href="event:talk_z300">领取经验进入下层</a><br>
]]);
	end
end
--/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function onTalkz200(npc,player) z500(npc,player); end
function onTalkz300(npc,player)
	local mmap = player:get_map():get_id();
	z600(npc,player,mmap);
	if player:get_task_state(202) == 2 then
		player:set_task_state(202,3);
		player:push_task_data(202,0);
		player:alert(1,0,"成功完成[勇闯镇魔塔]任务")
	end
end
--/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function z500(npc,player)
	local imexp = to_exp(player);
	if player:get_map():get_id() == player:get_map():get_id() then
		local map = server.find_map(player:get_map():get_id());
		if map:num_monster() == 0  then
			if player:get_map():get_id() == "zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."12" then
				if player:num_bag_black() >= 2 and util.ppn(player,const.PP_SUOYAOTA_AWARD) == 0 then
					player:set_param(const.PP_SUOYAOTA_AWARD,1);
					player:add_exp(imexp);
					player:add_item("五级宝石",2,1);
					player:set_timer(1,0);

					

					player:go_home();
					server.info(10010,0,"玩家["..player:get_name().."]闯过了镇魔塔第12层,获得了大量经验和五级宝石2块,大家恭喜他!");
				else
					player:alert(1,0,"您的包裹少于2个空格,请将包裹清理下再来找我!");
				end
			else
				if util.ppn(player,const.PP_SUOYAOTA_AWARD) == 0 then
					player:set_param(const.PP_SUOYAOTA_AWARD,1);
					player:add_exp(imexp);
					player:set_timer(1,0);
					player:go_home();
					player:alert(1,0,"本次闯塔关您获得了"..imexp.."点经验值!");
				end
			end
		else
			player:alert(1,0,"请将这里的怪物清理完了再来找我!");
		end
	end
end
--/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function z600(npc,player,mmap)
	local imexp = to_exp(player);
	local ou = {
		[1] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."2",mmon="猛犸雕像4"},
		[2] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."3",mmon="猛犸卫士4"},
		[3] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."4",mmon="蛮牛侍卫4"},
		[4] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."5",mmon="蛮牛将军4"},
		[5] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."6",mmon="蛮牛祭司4"},
		[6] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."7",mmon="钢刺蜘蛛4"},
		[7] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."8",mmon="妖毒蜘蛛4"},
		[8] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."9",mmon="赤锷蜘蛛4"},
		[9] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."10",mmon="巨灵战士4"},
		[10] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."11",mmon="巨灵战斧4"},
		[11] = {omap="zzmt"..player:get_param(const.PP_SUOYAOTA_MAP).."12",mmon="巨灵守卫4"},
	};
	if player:get_map():get_id() == mmap then
		local map = server.find_map(mmap);
		if map:num_monster() == 0 then
			if util.ppn(player,const.PP_SUOYAOTA_PAI) >= to_lingpai(player) then
				local map = server.find_map(ou[(string.sub(mmap,6))*1].omap);
				if  map:num_player() == 0 and util.ppn(player,const.PP_SUOYAOTA_AWARD) == 0 then
					player:set_param(const.PP_SUOYAOTA_AWARD,1);
					player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)-to_lingpai(player));
					player:set_param(const.PP_SUOYAOTA_AWARD,0);
					player:enter_map(ou[(string.sub(mmap,6))*1].omap,27,35);
					map:clear_mon();
					map:clear_item();
					map:mon_gen(32,40,ou[(string.sub(mmap,6))*1].mmon,8,5,5,1);
					player:add_exp(imexp);
					player:set_timer(1,0);
					player:set_timer(1,300000);
					player:alert(1,0,"你只有5分钟的时间清除里面的怪物!");
					player:alert(1,0,"上一塔关您获得了"..imexp.."点经验值!");
				else
					player:alert(1,0,"下一层有人正在闯关,请稍候尝试进入!");
				end
			else
				player:alert(1,0,"您的镇魔令少于"..to_lingpai(player).."个,无法继续闯关!");
			end
		else
			player:alert(1,0,"只有将本层的怪物全部杀死,才能继续闯下一层!");
		end
	end
end

function to_exp(player)
	if player:get_level() >= 80 then
		return math.ceil(80*80*80*(string.sub(player:get_map():get_id(),6)) *(6.6132));
	else
		return math.ceil(player:get_level()*player:get_level()*player:get_level()*(string.sub(player:get_map():get_id(),6)) *(6.6132));
	end
end
function to_lingpai(player) return math.ceil(player:get_level()* (string.sub(player:get_map():get_id(),6)+1) /5); end
--/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@