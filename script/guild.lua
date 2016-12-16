module(..., package.seeall)
--检测结婚条件

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