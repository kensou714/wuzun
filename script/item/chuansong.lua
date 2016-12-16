module(..., package.seeall)
function RandOnThisMap(player)
	local x,y;
	x,y=player:gen_rand_position();
	if( x and y )then
		player:move(x,y);
	end
end
function GoHome(player)
	player:go_home();
end

function gohuangcheng(player)
	player:enter_map("v005",57,103);
end


