module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[
           跨服战接待员

欢迎来到跨服战服务器.

跨服战时间:每周三,周六的 16:00-17:20

跨服战资格:活动开启当天,王城行会的会长

跨服战规则:周三为阵营战,周六为争霸战
           跨服战中可以免费购买药品
	   
进入时间 :16:10-16:20 请抓紧时间进入           
           
        
<a href="event:talk_enterzyz">进入阵营战</a>

<a href="event:talk_enterzbz">进入争霸战</a>


]]);
end

function onTalkenterzyz(npc,player)
	local t = tonumber(os.date("%H%M",os.time()));
	if t >= 1610 and t <= 1620 then
		if week_day() == 3 then
			player:enter_map("v103",60,90);
			player:alert(1,1,"跨服阵营战即将开始...");
			server.info(1,0,"玩家"..player:get_name().."进入了阵营战地图,请大家抓紧时间进入.");
		else
			player:alert(1,1,"阵营战时间未到.");
		end
	else
		player:alert(1,1,"进入时间已过,无法进入.");
	end
end
function onTalkenterzbz(npc,player)
	local t = tonumber(os.date("%H%M",os.time()));
	if t >= 1610 and t <= 1620 then
		if week_day() == 6 then
			player:enter_map("v103",55,90);
			player:alert(1,1,"跨服争霸战即将开始...");
			server.info(1,0,"玩家"..player:get_name().."进入了争霸战地图,请大家抓紧时间进入.");
		else
			player:alert(1,1,"争霸战时间未到.");
		end
	else
		player:alert(1,1,"进入时间已过,无法进入.");
	end
end