module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[您好,我是王城争霸管理员

<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:talk_101">申请王城争霸</a>
<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:talk_102">查看王城争霸时间</a>


占领王城每日领取:<font color="#FFff00">2000元宝和200万金币</font>

[王城印绶]可以在<font color="#FFaa00">[猛犸教主]</font>身上获得

]]);
end
function onTalk101(npc,player)
	if 1000==player:get_guild_title() then
	if tonumber(server_start_day()) >= 3 then
		if player:num_item("王城印绶",1) >= 1 then
			player:remove_item("王城印绶",1);
			local war_day_name = "war_tag_" .. (today() + 1);
			server.set_var(war_day_name,player:get_name());
		npc:echo([[ 
  你的请求已经被许可!
  王城争霸将会在明晚20:00开始,21:30结束!
  剩下的时间不多了,祝你好运!
 

                           <a href="event:local_exit">退出窗口</a>]]);
		else
			player:alert(1,0,"对不起,申请王城争霸需要[王城印绶]");
			onTalk100(npc,player);
		end
	else
		player:alert(1,0,"对不起,[王城争霸]将会在开服三天后开放申请");
		onTalk100(npc,player);
	end
	else
		player:alert(1,0,"对不起,您不是行会掌门无法申请[王城争霸]");
		onTalk100(npc,player);
	end
end
function onTalk102(npc,player)
	local war_day_name = "war_tag_" .. today();
	local war_day_name_1 = "war_tag_" .. (today()+1);
	if server.get_var(war_day_name) ~= "" or server.get_var(war_day_name_1) ~= "" then
		if server.get_var(war_day_name) ~= "" then
		npc:echo([[王城争霸将会在今天晚上20:00开始,21:30结束!]]);
		end
	if server.get_var(war_day_name_1) ~= "" then
		npc:echo([[王城争霸将会在明天晚上20:00开始,21:30结束!]]);
	end
	npc:echo([[
   请各大行会做好战争准备！


                           <a href="event:local_exit">退出窗口</a>]]);
			   else
		npc:echo([[
  暂无人申请王城争霸战。



                           <a href="event:local_exit">退出窗口</a>]]);
	end
end