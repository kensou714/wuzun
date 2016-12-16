module(..., package.seeall)

function molidan(player)
	if player:is_status(11) then
		player:echo([[
尊敬的玩家,
      您已经拥有魔力神丹的状态!是否需要覆盖当前状态?

      <a href="event:talk_fg11">覆盖当前状态</a>   <a href="event:local_exit">退出服务</a>]]);
	return 0;
      else
		local a,b = player:get_mc();
		local c= math.floor(b*0.2,1)
		if b <= 1500 then
			player:set_status(11,600,300,1,11);
			player:alert(1,1,"魔力丹效果生效,10分钟内魔法攻击力+300");
		end
		if b >= 1501 and b <= 5000 then
			player:set_status(11,600,c,1,11);
			player:alert(1,1,"魔力丹效果生效,10分钟内魔法攻击力+"..c);
		end
		if b >= 5001 then
			player:set_status(11,600,1000,1,11);
			player:alert(1,1,"魔力丹效果生效,10分钟内魔法攻击力+1000");
		end
	end
end



function onTalkfg11(player)
	if player:num_item("魔力丹",1) >= 1 then
		player:remove_item("魔力丹",1);
		local a,b = player:get_mc();
		local c= math.floor(b*0.2,1)
		if b <= 1500 then
			player:set_status(11,600,300,1,11);
			player:alert(1,1,"魔力丹效果生效,10分钟内魔法攻击力+300");
		end
		if b >= 1501 and b <= 5000 then
			player:set_status(11,600,c,1,11);
			player:alert(1,1,"魔力丹效果生效,10分钟内魔法攻击力+"..c);
		end
		if b >= 5001 then
			player:set_status(11,600,1000,1,11);
			player:alert(1,1,"魔力丹效果生效,10分钟内魔法攻击力+1000");
		end
	else
		player:alert(1,1,"对不起,您的背包没有魔力丹,覆盖失败!");
	end
end