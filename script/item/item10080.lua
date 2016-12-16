module(..., package.seeall)
util.use_function(_M,item.item10078);
local item_name="女儿红(10年)";
function open(player)
	return item.item10078.doopen(player,3);
end
function onTalkcommitjiu(player)
	local num = player:num_item(item_name);
	if num > 0 then
		if 0 ~= item.jiu.jiu3(player) then
			player:remove_item(item_name,1);
		end
	end
end