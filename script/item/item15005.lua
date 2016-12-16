module(..., package.seeall)

function shuangbei(player)
	if player:is_status(7) then
		player:echo([[
尊敬的玩家,
      您已经拥有多倍经验的状态!是否需要覆盖当前状态?

      <a href="event:talk_fg7">覆盖当前状态</a>   <a href="event:local_exit">退出服务</a>]]);
	return 0;
      else
		player:set_status(7,10800,10000,1,11);
		player:alert(1,1,"您成功获得3小时双倍经验");
	end
end



function onTalkfg7(player)
	if player:num_item("双倍宝典(3小时)",1) >= 1 then
		player:set_status(7,10800,10000,1,11);
		player:remove_item("双倍宝典(3小时)",1);
		player:alert(1,1,"您成功获得3小时双倍经验");
	else
		player:alert(1,1,"对不起,您的背包没有双倍宝典(3小时),覆盖失败!");
	end
end