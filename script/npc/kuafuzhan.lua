module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[
跨服战使者:

跨服战时间:每周三,周六的 16:00-17:20

跨服战资格:活动开启当天,王城行会的会长

跨服战规则:周三为阵营战,周六为武林争霸
           
        注:进入时间为 16:00-16:10
	   



     <a href="event:talk_enterkfz">进入跨服战</a>


]]);
end

function onTalkenterkfz(npc,player)
	--[[local t = tonumber(os.date("%H%M",os.time()));
	if week_day() == 3 or week_day() == 6 then
		if t >= 1600 and t <= 1610 then
			if server.get_king_guild() == player:get_guild() and 1000==player:get_guild_title() then]]
				--player:enter_map("v103",50,50);--此处进入跨服战服务器
				player:gs_kuafu("","","test");                             
				server.info(100,0,"伟大的玩家"..player:get_name().."进入了跨服战,期待他为大家带来好消息!")
			--[[else
				player:alert(1,1,"只有王城行会的会长才有资格参加跨服战.");
			end
		else
			player:alert(1,1,"跨服战时间未到.");
		end
	else
		player:alert(1,1,"跨服战时间未到.");
	end]]
end