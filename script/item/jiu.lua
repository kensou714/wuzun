module(..., package.seeall)
function jiu1(player)
	check_jiu_day(player);
	if util.ppn(player,const.PP_JIU_NUM) < const.JIU_MAX_NUM then
		player:set_param(const.PP_JIU_NUM,util.ppn(player,const.PP_JIU_NUM)+1);
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM3,util.ppn(player,const.PP_HUOYUEDU_NUM3)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM3)==5 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
		end

		if util.ppn(player,const.PP_JIUTYPE) == 1 then
			player:set_param(const.PP_JIULI,util.ppn(player,const.PP_JIULI)+5*60);
		else
			player:set_param(const.PP_JIUTYPE,1);
			player:set_param(const.PP_JIULI,5*60);
		end
		player:alert(1,1,"成功饮用[女儿红],当前醉酒时间剩余"..util.ppn(player,const.PP_JIULI).."秒");
		if util.ptpn(player,const.PTP_KAOHUO) == 1 then return;end;
		if util.ppn(player,const.PP_JIULI) >= 10 then
			player:set_temp_param(const.PTP_KAOHUO,1);
			player:set_timer(const.PT_HUODUI,10000);
		end
	else
		player:alert(1,1,"对不起,美酒虽好,可不要贪杯哦!<br><br>每人每天最多只可以饮用6瓶酒!");
		return 0;
	end
end
function jiu2(player)
	check_jiu_day(player);
	if util.ppn(player,const.PP_JIU_NUM) < const.JIU_MAX_NUM then
		player:set_param(const.PP_JIU_NUM,util.ppn(player,const.PP_JIU_NUM)+1);
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM3,util.ppn(player,const.PP_HUOYUEDU_NUM3)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM3)==5 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
		end
		if util.ppn(player,const.PP_JIUTYPE) == 2 then
			player:set_param(const.PP_JIULI,util.ppn(player,const.PP_JIULI)+5*60);
		else
			player:set_param(const.PP_JIUTYPE,2);
			player:set_param(const.PP_JIULI,5*60);
		end
		player:alert(1,1,"成功饮用[女儿红(5年)],当前醉酒时间剩余"..util.ppn(player,const.PP_JIULI).."秒");
		if util.ptpn(player,const.PTP_KAOHUO) == 1 then return;end;
		if util.ppn(player,const.PP_JIULI) >= 10 then
			player:set_temp_param(const.PTP_KAOHUO,1);
			player:set_timer(const.PT_HUODUI,10000);
		end
	else
		player:alert(1,1,"对不起,美酒虽好,可不要贪杯哦!<br><br>每人每天最多只可以饮用6瓶酒!");
		return 0;
	end
end
function jiu3(player)
	check_jiu_day(player);
	if util.ppn(player,const.PP_JIU_NUM) < const.JIU_MAX_NUM then
		player:set_param(const.PP_JIU_NUM,util.ppn(player,const.PP_JIU_NUM)+1);
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM3,util.ppn(player,const.PP_HUOYUEDU_NUM3)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM3)==5 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
		end
		if util.ppn(player,const.PP_JIUTYPE) == 3 then
			player:set_param(const.PP_JIULI,util.ppn(player,const.PP_JIULI)+5*60);
		else
			player:set_param(const.PP_JIUTYPE,3);
			player:set_param(const.PP_JIULI,5*60);
		end
		player:alert(1,1,"成功饮用[女儿红(10年)],当前醉酒时间剩余"..util.ppn(player,const.PP_JIULI).."秒");
		if util.ptpn(player,const.PTP_KAOHUO) == 1 then return;end;
		if util.ppn(player,const.PP_JIULI) >= 10 then
			player:set_temp_param(const.PTP_KAOHUO,1);
			player:set_timer(const.PT_HUODUI,10000);
		end
	else
		player:alert(1,1,"对不起,美酒虽好,可不要贪杯哦!<br><br>每人每天最多只可以饮用6瓶酒!");
		return 0;
	end
end
function jiu4(player)
	check_jiu_day(player);
	if util.ppn(player,const.PP_JIU_NUM) < const.JIU_MAX_NUM then
		player:set_param(const.PP_JIU_NUM,util.ppn(player,const.PP_JIU_NUM)+1);
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM3,util.ppn(player,const.PP_HUOYUEDU_NUM3)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM3)==5 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
		end
		if util.ppn(player,const.PP_JIUTYPE) == 4 then
			player:set_param(const.PP_JIULI,util.ppn(player,const.PP_JIULI)+5*60);
		else
			player:set_param(const.PP_JIUTYPE,4);
			player:set_param(const.PP_JIULI,5*60);
		end
		player:alert(1,1,"成功饮用[女儿红(20年)],当前醉酒时间剩余"..util.ppn(player,const.PP_JIULI).."秒");
		if util.ptpn(player,const.PTP_KAOHUO) == 1 then return;end;
		if util.ppn(player,const.PP_JIULI) >= 10 then
			player:set_temp_param(const.PTP_KAOHUO,1);
			player:set_timer(const.PT_HUODUI,10000);
		end
	else
		player:alert(1,1,"对不起,美酒虽好,可不要贪杯哦!<br><br>每人每天最多只可以饮用6瓶酒!");
		return 0;
	end
end
function check_jiu_day(player)
	if util.ppn(player,const.PP_JIU_DAY) ~= today() then
		player:set_param(const.PP_JIU_DAY,today());
		player:set_param(const.PP_JIU_NUM,0);
	end
end
