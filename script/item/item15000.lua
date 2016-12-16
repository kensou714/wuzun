module(..., package.seeall)

function fuguihu(player)
	if util.ppn(player,const.PP_FUGUIHU) <= 4  then
		player:set_param(const.PP_FUGUIHU,util.ppn(player,const.PP_FUGUIHU)+1);
		player:add_vcoin_bind(500);
		player:alert(1,1,"恭喜您成功获得500绑定元宝");
		player:alert(1,0,"您今天已打开"..util.ppn(player,const.PP_FUGUIHU).."次开心富贵虎");
	else
		player:alert(1,1,"对不起,每天最多只可使用5次[开心富贵虎]");
	return 0;
	end
end

