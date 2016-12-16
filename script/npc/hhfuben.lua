module(..., package.seeall)
function onTalk100(npc,player)
	npc:echo("行会会长来申请开启行会副本,每天只可以开启一次,行会人数达到50人才可以开启.");
	local gfd = get_guild_fuben_day(player);
	if gfd ~= today() then
		player:set_guild_param("fubenday",today());
		player:set_guild_param("fubenopen","");
	end;
	local gfo = get_guild_fuben_open(player);
	local gn = player:get_guild();
	local gt = player:get_guild_title();
	if gn == "" or gt < 102 then
		npc:echo("需要先加入行会才可以进入行会副本");
	end
	if gfo == 0 then
		if gt==1000 then
			npc:echo("<a href='event:talk_sqopen'>开启行会副本</a>");
		else
			npc:echo("行会会长才可以打开行会副本");
		end
	end
	if gfo == 1 then
		local m = find_guild_fuben_map(gn);
		if m then
			if util.ppn(player,const.PP_GUILD_FUBEN_ENTER_NUM) == today() then 
				npc:echo("今天已经进入过一次行会副本,不可以再进入了");
			else
				npc:echo("<a href='event:talk_enterfuben'>进入行会副本</a>");
			end
		else
			player:set_guild_param("fubenopen",2);gfo=2;
		end
	end
	if gfo == 2 then
		npc:echo("行会副本已完成");
	end
end
function onTalkenterfuben(npc,player)
	if util.ppn(player,const.PP_GUILD_FUBEN_ENTER_NUM) == today() then 
		player:alert(1,1,"今天已经进入过一次行会副本,不可以再进入了");
		return 100;
	end
	local gfo = get_guild_fuben_open(player);
	local gn = player:get_guild();
	local gt = player:get_guild_title();
	if gn ~= "" and gt >= 102 and gfo==1 then
		local m = find_guild_fuben_map(gn);
		if m then
			player:set_param(const.PP_GUILD_FUBEN_ENTER_NUM,today());
			player:enter_map(m:get_id(),66,66);
		end
	end
end
function onTalksqopen(npc,player)
	if "" ~= player:get_guild() and 1000==player:get_guild_title() then
		if player:get_guild_size() < 1 then player:alert(1,1,"行会人数不足50人,不可以开启");return;end;
		local gfd = get_guild_fuben_day(player);
		if gfd ~= today() then
			player:set_guild_param("fubenday",today());
			player:set_guild_param("fubenopen","");
		end;
		local gfo = get_guild_fuben_open(player);
		if gfo == 1 then player:alert(1,1,"副本已开启");return;end;
		if gfo == 2 then player:alert(1,1,"部分已完成");return;end;
		local gn = player:get_guild();
		if gfo == 0 then
			local m = find_empty_guild_fuben_map(npc,player);
			if m then
				m:set_var("guildname",gn);
				player:set_guild_param("fubenopen",1);
				--TODO 刷怪物
				m:set_timer(1,1000*60*60);
				m:set_timer(2,1000*5);
				onTalkenterfuben(npc,player);
				player:guild_exe("npc.hhfuben.exefubenopen");
			else
				player:alert(1,1,"有行会正在副本中,请稍候再试");
			end
		else
			player:alert(1,1,"系统错误.联系管理员");
		end
	else
		player:alert(1,1,"不是行会老大不能申请开启");
	end
end
function get_guild_fuben_open(player)
	local gfo = player:get_guild_param("fubenopen");
	if gfo and gfo~="" then return tonumber(gfo);end;
	return 0;
end
function get_guild_fuben_day(player)
	local gfd = player:get_guild_param("fubenday");
	if gfd and gfd~="" then return tonumber(gfd);end;
	return 0;
end
function find_guild_fuben_map(gn)
	local map=nil;
	for i=1,20 do
		map = server.find_map("hhfb"..i);
		if map and map:get_var("guildname")==gn then
			break;
		else
			map=nil;
		end
	end
	return map;
end
function find_empty_guild_fuben_map(npc,player)
	local map=nil;
	for i=1,20 do
		map = server.find_map("hhfb"..i);
		if map and ((not map:get_var("guildname")) or map:get_var("guildname")=="" or map:get_var("guildname")==player:get_guild()) then
			break;
		else
			map=nil;
		end
	end
	return map;
end
function exefubenopen(player)
	if 1000 ~= player:get_guild_title() then
		if util.ppn(player,const.PP_GUILD_FUBEN_ENTER_NUM) ~= today() then 
			player:echo("行会副本开始了.<a href='event:talk_HHFBEnter'>是否进入行会副本?</a>");
		end
	end
end
function onTalkHHFBEnter(player)
	onTalkenterfuben(nil,player);
end