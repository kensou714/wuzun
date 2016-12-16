module(..., package.seeall)
--检测结婚条件
function checkInviteToMarry(player)
        --player男方玩家,lover女方玩家
	local lover = server.find_player(player:get_double_name());
	if lover then
		if player:get_level() >= 40 and lover:get_level() >= 40 then
			if player:get_map():get_id() == "jiehun" and lover:get_map():get_id() == "jiehun" then
				if player:num_item("情定三生戒",1) >= 1 then
					if player:get_gamemoney() >= 100000 then
						player:sub_gamemoney(100000);
						player:remove_item("情定三生戒",1);
						player:echo("true");
						player:play_effect(102,615);
						lover:play_effect(102,615);
						server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]先生和[<font color='#ff0000'>"..lover:get_name().."</font>]小姐喜结连理,永结同心!愿天下有情人终成眷属!");
						server.info(10000,0,"恭喜["..player:get_name().."]先生和["..lover:get_name().."]小姐喜结连理,永结同心!愿天下有情人终成眷属!");
					else
					player:alert(1,1,"想结婚,你连结婚需要的费用都没有!去筹集10万金币再来吧?!");
					return;
					end
				else
				player:alert(1,1,"想结婚,你居然连【情定三生戒】都没有?!");
				return;
				end
			else
			player:alert(1,1,"想要结婚,夫妻双方至少都要到婚姻殿堂来吧!!");
			lover:alert(1,1,"想要结婚,夫妻双方至少都要到婚姻殿堂来吧!!");
			return;
			end
		else
		player:alert(1,1,"结婚需要情侣双方等级达到40级以上哦!");
		lover:alert(1,1,"结婚需要情侣双方等级达到40级以上哦!");
		return;
		end
	end
end

function conditionInviteToMarry(player)
	player:echo("申请结婚必须支付10万金币的礼金");
end

--检测和平分手时,当前玩家需要的条件
function checkPeaceDivorce(player)
	if player:get_vcoin() >= 200 then
		player:sub_vcoin(200,"lihun");
		player:alert(11,0,"和平分手,系统扣除200元宝!");
		player:echo("true");
	else
	player:alert(1,1,"和平分手,需要支付200元宝!");
	end
end

--检测强制分手时,当前玩家需要的条件
function checkForceDivorce(player)
	if player:get_vcoin() >= 1000 then
		player:sub_vcoin(1000,"lihun");
		player:alert(11,0,"强制分手,系统扣除1000元宝!");
		player:echo("true");
	else
	player:alert(1,1,"强制分手,单方需要支付1000元宝!"); 
	end
end

function conditionForceDivorce(player)
	player:echo("强制离婚必须支付1万金币的礼金");
end

function onMarrySucc(player)
end

function onDivorceSuc(player)
end