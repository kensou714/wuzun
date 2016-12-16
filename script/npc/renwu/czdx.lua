module(..., package.seeall)

function onTalk100(npc,player)
		npc:echo([[--------------------------------------
             <font color="#ff0000">王城之主雕像</font>
--------------------------------------
王城所属: <font color="#ffff00">武尊·雄霸天下</font>
--------------------------------------
王城城主: <font color="#ffff00">上山打老虎</font>      <a href='event:talk_ckczzb'>查看城主装备</a>
--------------------------------------
城主职业: <font color="#ffff00">法师</font>    当前战力: <font color="#ffff00">1000</font>
--------------------------------------
城主性别: <font color="#ffff00">男</font>      当前等级: <font color="#ffff00">99</font>
--------------------------------------
当前官职: <font color="#ffff00">兵马大元帅</font>
--------------------------------------
每日奖励: <font color="#ffff00">绑定金币+200万 绑定元宝+500</font>
--------------------------------------
王城争霸: <a href='event:talk_101'>申请王城争霸</a>    <a href='event:talk_102'>王城争霸时间</a>
--------------------------------------]]);
end

function onTalk101(npc,player)
	if 1000==player:get_guild_title() then
	if tonumber(server_start_day()) >= 3 then
		if player:num_item("王城印绶",1) >= 1 then
			player:remove_item("王城印绶",1);
			local war_day_name = "war_tag_" .. (today() + 1);
			server.set_var(war_day_name,player:get_name());
			player:alert(11,0,"你的请求已经被许可!");
			player:alert(11,0,"王城争霸将会在明晚20:00开始,21:30结束!");
			player:alert(11,0,"剩下的时间不多了,祝你好运!");
		else
			player:alert(1,1,"对不起,申请王城争霸需要[王城印绶]<br>");
			player:alert(1,0,"[王城印绶]可以消灭[猛犸教主]获得!");
		end
	else
		player:alert(1,1,"对不起,[王城争霸]将会在开服四天后开放申请");
	end
	else
		player:alert(1,1,"对不起,您不是行会掌门无法申请[王城争霸]");
	end
	onTalk100(npc,player);
end



function onTalk102(npc,player)
	local war_day_name = "war_tag_" .. today();
	local war_day_name_1 = "war_tag_" .. (today()+1);
	if server.get_var(war_day_name) ~= "" or server.get_var(war_day_name_1) ~= "" then
		if server.get_var(war_day_name) ~= "" then
		player:alert(1,1,"王城争霸将在今天晚上20:00开始,21:30结束!<br>");
		player:alert(10,0,"王城战将在今天[20:00-21:30]举行");
		end
	if server.get_var(war_day_name_1) ~= "" then
		player:alert(1,1,"王城争霸将在明天晚上20:00开始,21:30结束!<br>");
		player:alert(10,0,"王城战将在明天[20:00-21:30]举行");
	end
		player:alert(11,0,"请各大行会做好战争的准备!!");
			   else
		player:alert(11,0,"暂时没有行会申请王城争霸战!!");
	end
	onTalk100(npc,player);
end