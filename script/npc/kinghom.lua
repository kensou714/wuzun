module(..., package.seeall)



function onTalk100(npc,player)
	npc:echo([[您好,我是<font color="#FFFF00">王城</font>的管理员!
<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:talk_101">[每日王城奖励]</a>: <font color="#FF0000">200万金币和2000元宝</font>
]]);
end



function onTalk101(npc,player)
	if tonumber(server.get_var("jiangli")) == "" then
		server.set_var("jiangli","0");
	end
	if server.get_war_state() == 1 then
		player:alert(1,0,"对不起,攻城期间无法领取");
	return;
	end
	if server.get_king_guild() ~= "" and server.get_king_guild() == player:get_guild() and 1000==player:get_guild_title() then
		if today() ~= tonumber(server.get_var("jiangli")) then
				server.set_var("jiangli",today());
				player:add_gamemoney(2000000);
				player:add_vcoin_best_enable(2000);
				server.info(10000,0,player:get_name().."已经成功领取今日王城奖励[200万金币和2000元宝]");
			else
				player:alert(1,0,"对不起,今日王城奖励已经被领取！")
		end
	else
		player:alert(1,0,"对不起,你不是王城行会老大无法领取！");
	end
end