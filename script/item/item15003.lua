module(..., package.seeall)


function cjzfy(player)
	if player:check_euqip(-4) == 0 then
	player:alert(1,0,"由于您没有佩带武器,无法使用");
	return 0;
	end
	if player:get_weapon_luck() <= 6 then
	player:set_weapon_luck(7);
	player:alert(1,0,"武器幸运增加");
	else
	player:alert(1,0,"对不起,您的武器已经幸运+7");
	return 0;
	end
end

function yjp(player)
	if player:check_euqip(-4) == 0 then
	player:alert(1,0,"由于您没有佩带武器,无法使用");
	return 0;
	end
	if player:get_weapon_luck() <= 6 then
	player:set_weapon_luck(player:get_weapon_luck()+1);
	player:alert(1,0,"武器幸运增加");
	else
	player:alert(1,0,"对不起,您的武器已经幸运+7");
	return 0;
	end
end

