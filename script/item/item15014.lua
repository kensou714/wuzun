module(..., package.seeall)

function shuzuiyaoshui(player)
	if player:get_pk_value() >= 200 then
		player:set_pk_value(player:get_pk_value()-200);
		player:alert(1,0,"赎罪药水发挥功效!您的PK值减少200点");
	else
		player:set_pk_value(0);
		player:alert(1,0,"赎罪药水发挥功效!您的PK值减少200点");
	end
end
