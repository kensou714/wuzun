module(..., package.seeall)
function youxifh(player)
	local f_data={
		["warrior"]={name="svr_warrior_name",num="svr_warrior_number",fh="maxzhan"},
		["wizard"]={name="svr_wizard_name",num="svr_wizard_number",fh="maxfa"},
		["taoist"]={name="svr_taoist_name",num="svr_taoist_number",fh="maxdao"},
	}
	local jdata = f_data[player:get_job_name()];
	if player:get_name() ~= server.get_var(jdata.name) then
		player:set_name_pro("");
	end
	local guildname = player:get_guild1();
	local localserver = server.get_server_title();
	if guildname == server.get_var("kuafuguild") and localserver == server.get_var("kuafuarea") and player:kuafu_get_jl_state() >= 1 then
		local kuafutime = util.ppn(player,const.PP_KUAFU_TIME);
		local serverkuafutime = server.get_var("server_kuafu_timer");
		if serverkuafutime ~= nil and serverkuafutime ~= "" and kuafutime >= tonumber(serverkuafutime) then
			player:set_name_pro("kfsz");
		end
	end

	local a = util.ppn(player,const.PP_GUANZHI);
	local pre = "";
	local sb = {
		[1]={a="<font color='#6CAAD9'>★九品将兵都卫★</font>"},
		[2]={a="<font color='#6CAAD9'>★八品抚夷护军★</font>"},
		[3]={a="<font color='#CAE1FF'>★七品安夷护军★</font>"},
		[4]={a="<font color='#CAE1FF'>★六品讨寇校卫★</font>"},
		[5]={a="<font color='#F279AF'>★五品平寇校卫★</font>"},
		[6]={a="<font color='#F279AF'>★四品破虏将军★</font>"},
		[7]={a="<font color='#FFD700'>★三品平虏将军★</font>"},
		[8]={a="<font color='#FFD700'>★二品车骑将军★</font>"},
		[9]={a="<font color='#FFD700'>★一品骠骑将军★</font>"},
		[10]={a="<font color='#FF0000'>★</font><font color='#FF6600'>抚</font><font color='#FF9900'>国</font><font color='#FFCC00'>大</font><font color='#FFFF00'>将</font><font color='#99FF00'>军</font><font color='#009999'>★</font>"},
		[11]={a="<font color='#FF0000'>★</font><font color='#FF6600'>镇</font><font color='#FF9900'>国</font><font color='#FFCC00'>大</font><font color='#FFFF00'>将</font><font color='#99FF00'>军</font><font color='#009999'>★</font>"},
		[12]={a="<font color='#FF0000'>★</font><font color='#FF6600'>兵</font><font color='#FF9900'>马</font><font color='#FFCC00'>大</font><font color='#FFFF00'>元</font><font color='#99FF00'>帅</font><font color='#009999'>★</font>"},
		[13]={a="<font color='#FF0000'>★</font><font color='#FF6600'>镇</font><font color='#FF9900'>北</font><font color='#FFCC00'>玄</font><font color='#FFFF00'>武</font><font color='#99FF00'>王</font><font color='#009999'>★</font>"},
		[14]={a="<font color='#FF0000'>★</font><font color='#FF6600'>镇</font><font color='#FF9900'>西</font><font color='#FFCC00'>白</font><font color='#FFFF00'>虎</font><font color='#99FF00'>王</font><font color='#009999'>★</font>"},
		[15]={a="<font color='#FF0000'>★</font><font color='#FF6600'>镇</font><font color='#FF9900'>南</font><font color='#FFCC00'>朱</font><font color='#FFFF00'>雀</font><font color='#99FF00'>王</font><font color='#009999'>★</font>"},
		[16]={a="<font color='#FF0000'>★</font><font color='#FF6600'>镇</font><font color='#FF9900'>东</font><font color='#FFCC00'>青</font><font color='#FFFF00'>龙</font><font color='#99FF00'>王</font><font color='#009999'>★</font>"},
	};
	if a >= 1 and a <= 16 then
		pre = sb[a].a;
	end
	if util.ppn(player,const.PP_37WAN37HUODONG) >= 10000 and ymd() <= 20140309 then
		if pre == "" then
			pre = "37wan";
		else
			pre = "37wan" .. "<br>" .. pre;
		end
	end
	if util.ppn(player,const.PP_360TEQUANCH) >= 1  then
		if pre == "" then
			pre = "<font color='#00EE00'>360唯我独尊</font>";
		else
			pre = "<font color='#00EE00'>360唯我独尊</font>" .. "<br>" .. pre;
		end
	end
	if util.ppn(player,const.PP_WWDZCH) >= 1  then
		if pre == "" then
			pre = "<font color='#00EE00'>唯武独尊</font>";
		else
			pre = "<font color='#00EE00'>唯武独尊</font>" .. "<br>" .. pre;
		end
	end
	if tonumber(player:achieve_get_point()) >= 1000 then
		if tonumber(player:achieve_get_point()) >= 2000 and tonumber(player:achieve_get_point()) <= 4999  then
			if pre == "" then
				player:set_status(22,86400,1,1,1);
				pre = "<font color='#EE9A00'>【人中★豪杰】</font>";
			else
				player:set_status(22,86400,1,1,1);
				pre = "<font color='#EE9A00'>【人中★豪杰】</font>" .. "<br>" .. pre;
			end
		end
		if tonumber(player:achieve_get_point()) >= 5000 and tonumber(player:achieve_get_point()) <= 9999  then
			if pre == "" then
				player:set_status(22,86400,2,1,1);
				pre = "<font color='#EE9A00'>【乱世★英雄】</font>";
			else
				player:set_status(22,86400,2,1,1);
				pre = "<font color='#EE9A00'>【乱世★英雄】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","乱世英雄");
		end
		if tonumber(player:achieve_get_point()) >= 10000 and tonumber(player:achieve_get_point()) <= 19999  then
			if pre == "" then
				player:set_status(22,86400,4,1,1);
				pre = "<font color='#EE9A00'>【只手★遮天】</font>";
			else
				player:set_status(22,86400,4,1,1);
				pre = "<font color='#EE9A00'>【只手★遮天】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","只手遮天");
		end
		if tonumber(player:achieve_get_point()) >= 20000 and tonumber(player:achieve_get_point()) <= 39999  then
			if pre == "" then
				player:set_status(22,86400,6,1,1);
				pre = "<font color='#EE9A00'>【威震★八方】</font>";
			else
				player:set_status(22,86400,6,1,1);
				pre = "<font color='#EE9A00'>【威震★八方】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","威震八方");
		end
		if tonumber(player:achieve_get_point()) >= 40000 and tonumber(player:achieve_get_point()) <= 59999  then
			if pre == "" then
				player:set_status(22,86400,10,1,1);
				pre = "<font color='#EE9A00'>【百胜★天师】</font>";
			else
				player:set_status(22,86400,10,1,1);
				pre = "<font color='#EE9A00'>【百胜★天师】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","百胜天师");
		end
		if tonumber(player:achieve_get_point()) >= 60000 and tonumber(player:achieve_get_point()) <= 99999  then
			if pre == "" then
				player:set_status(22,86400,14,1,1);
				pre = "<font color='#EE9A00'>【横扫★千军】</font>";
			else
				player:set_status(22,86400,14,1,1);
				pre = "<font color='#EE9A00'>【横扫★千军】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","横扫千军");
		end
		if tonumber(player:achieve_get_point()) >= 100000 and tonumber(player:achieve_get_point()) <= 159999  then
			if pre == "" then
				player:set_status(22,86400,20,1,1);
				pre = "<font color='#EE9A00'>【万夫★莫敌】</font>";
			else
				player:set_status(22,86400,20,1,1);
				pre = "<font color='#EE9A00'>【万夫★莫敌】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","万夫莫敌");
		end
		if tonumber(player:achieve_get_point()) >= 160000 and tonumber(player:achieve_get_point()) <= 219999  then
			if pre == "" then
				player:set_status(22,86400,28,1,1);
				pre = "<font color='#EE9A00'>【盖世★奇侠】</font>";
			else
				player:set_status(22,86400,28,1,1);
				pre = "<font color='#EE9A00'>【盖世★奇侠】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","盖世奇侠");
		end
		if tonumber(player:achieve_get_point()) >= 220000 and tonumber(player:achieve_get_point()) <= 299999  then
			if pre == "" then
				player:set_status(22,86400,38,1,1);
				pre = "<font color='#EE9A00'>【杀戮★之神】</font>";
			else
				player:set_status(22,86400,38,1,1);
				pre = "<font color='#EE9A00'>【杀戮★之神】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","杀戮之神");
		end
		if tonumber(player:achieve_get_point()) >= 300000 then
			if pre == "" then
				player:set_status(22,86400,50,1,1);
				pre = "<font color='#EE9A00'>【神魔★霸主】</font>";
			else
				player:set_status(22,86400,50,1,1);
				pre = "<font color='#EE9A00'>【神魔★霸主】</font>" .. "<br>" .. pre;
			end
			newgui.jingcaihuodong.setawardpcon(player,"chsj","神魔霸主");
		end
	end
	if player:get_name() == server.get_var("wlmz") then
		player:set_status(32,36000,1,1,0);
			if pre == "" then
				pre = "<font color='#FF00FF'>★武林盟主★</font>";
			else
				pre = "<font color='#FF00FF'>★武林盟主★</font>" .. "<br>" .. pre;
			end
	end
	player:set_name_pre(pre);
end

function tshz(player)
	if player:get_vcoin_accu() >= 1 and util.ppn(player,const.PP_CZHZ_LV) <= 9  then
		if player:get_vcoin_accu() >= 10000000 and util.ppn(player,const.PP_CZHZ_LV) <= 9 then
			player:set_param(const.PP_CZHZ_LV,10);
			player:set_model(2,10);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[十级]");
		return;
		end
		if player:get_vcoin_accu() >= 5000000 and util.ppn(player,const.PP_CZHZ_LV) <= 8 then
			player:set_param(const.PP_CZHZ_LV,9);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,9);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[九级]");
		return;
		end
		if player:get_vcoin_accu() >= 3000000 and util.ppn(player,const.PP_CZHZ_LV) <= 7 then
			player:set_param(const.PP_CZHZ_LV,8);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,8);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[八级]");
		return;
		end
		if player:get_vcoin_accu() >= 1000000 and util.ppn(player,const.PP_CZHZ_LV) <= 6 then
			player:set_param(const.PP_CZHZ_LV,7);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,7);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[七级]");
		return;
		end
		if player:get_vcoin_accu() >= 500000 and util.ppn(player,const.PP_CZHZ_LV) <= 5 then
			player:set_param(const.PP_CZHZ_LV,6);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,6);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[六级]");
		return;
		end
		if player:get_vcoin_accu() >= 300000 and util.ppn(player,const.PP_CZHZ_LV) <= 4 then
			player:set_param(const.PP_CZHZ_LV,5);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,5);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[五级]");
		return;
		end
		if player:get_vcoin_accu() >= 100000 and util.ppn(player,const.PP_CZHZ_LV) <= 3 then
			player:set_param(const.PP_CZHZ_LV,4);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,4);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[四级]");
		return;
		end
		if player:get_vcoin_accu() >= 50000 and util.ppn(player,const.PP_CZHZ_LV) <= 2 then
			player:set_param(const.PP_CZHZ_LV,3);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,3);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[三级]");
		return;
		end
		if player:get_vcoin_accu() >= 10000 and util.ppn(player,const.PP_CZHZ_LV) <= 1 then
			player:set_param(const.PP_CZHZ_LV,2);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,2);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[二级]");
		return;
		end
		if player:get_vcoin_accu() >= 100 and util.ppn(player,const.PP_CZHZ_LV) == 0 then
			player:set_param(const.PP_CZHZ_LV,1);
			player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
			player:set_model(2,1);
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"恭喜您成为VIP红钻[一级]");
		return;
		end
	end
end