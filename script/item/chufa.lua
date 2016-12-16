	module(..., package.seeall)

function tempVip(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() then
		player:alert(1,0,"您已经属于尊贵的VIP会员!");
	else
		player:set_param(const.PP_HUIYUAN,0);
	end
	if util.ppn(player,const.PP_HUIYUAN) == 0 then
		player:set_param(const.PP_TEMP_VIP_TIMER,1800);
		player:set_timer(11,1000);
		player:set_status(34,1800,1,1,1)
		server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成为VIP会员!");
		player:alert(1,0,"您的会员时间还有30分钟到期!");
	end
end

--PP_TEMP_VIP_TIMER

function dabuwan(player)
	if player:get_safearea_id() > 0 then
		player:hpmp_full_fresh();
		player:alert(10,1,"成功使用十全大补丸!");
	else
		player:alert(11,1,"如此神药只能在安全区使用!");
		return 0;
	end
end

function yongjiusxd200(player)
	if util.ppn(player,const.PP_YONGJIU_ATTR_NUM) <= 0 then
		player:set_param(const.PP_YONGJIU_ATTR_NUM,1);
		if player:get_job_name() == "warrior" then
			player:add_reincarnate_mdcmax(200);
			player:alert(11,1,"使用[永久属性丹],物理攻击+200!");
		end
		if player:get_job_name() == "wizard" then
			player:add_reincarnate_mmcmax(200);
			player:alert(11,1,"使用[永久属性丹],魔法攻击+200!");
		end
		if player:get_job_name() == "taoist" then
			player:add_reincarnate_mscmax(200);
			player:alert(11,1,"使用[永久属性丹],道术攻击+200!");
		end
	else
		player:alert(11,1,"永久属性丹,只可以使用一次哦!");
		return 0;
	end
end


function qifulp1bind(player)
	if util.ppn(player,const.PP_QIFULPBIND) <= 0 then
		player:set_param(const.PP_QIFULPBIND,util.ppn(player,const.PP_QIFULPBIND)+1);
		player:alert(10,0,"今天已使用"..util.ppn(player,const.PP_QIFULPBIND).."个[祈福令(绑)]");
		player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+10);
		player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)+1);
		player:alert(11,1,"祈福声望增加10点!");
		player:alert(11,0,"祈福次数增加1次!");
		player:alert(11,0,"当前祈福声望:"..util.ppn(player,const.PP_QIFU_SHENGWANG).."点!");
		player:alert(11,0,"当前祈福次数:"..util.ppn(player,const.PP_QIFU_NUMBER).."次!");
		newgui.qifu.fresh_qifu_info(player);
	else
		player:alert(1,1,"您今天已使用[祈福令(绑)],无法再使用!")
		return 0;
	end
end

function qifulp1(player)
	player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+10);
	player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)+1);
	player:alert(11,1,"祈福声望增加10点!");
	player:alert(11,0,"祈福次数增加1次!");
	player:alert(11,0,"当前祈福声望:"..util.ppn(player,const.PP_QIFU_SHENGWANG).."点!");
	player:alert(11,0,"当前祈福次数:"..util.ppn(player,const.PP_QIFU_NUMBER).."次!");
	newgui.qifu.fresh_qifu_info(player);
end

function qifulp2(player)
	player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+50);
	player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)+5);
	player:alert(11,1,"祈福声望增加50点!");
	player:alert(11,0,"祈福次数增加5次!");
	player:alert(11,0,"当前祈福声望:"..util.ppn(player,const.PP_QIFU_SHENGWANG).."点!");
	player:alert(11,0,"当前祈福次数:"..util.ppn(player,const.PP_QIFU_NUMBER).."次!");
	newgui.qifu.fresh_qifu_info(player);
end

function qifulp3(player)
	player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+100);
	player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)+10);
	player:alert(11,1,"祈福声望增加100点!");
	player:alert(11,0,"祈福次数增加10次!");
	player:alert(11,0,"当前祈福声望:"..util.ppn(player,const.PP_QIFU_SHENGWANG).."点!");
	player:alert(11,0,"当前祈福次数:"..util.ppn(player,const.PP_QIFU_NUMBER).."次!");
	newgui.qifu.fresh_qifu_info(player);
end

function jingyan50(player)
	player:add_exp(50000000);
	player:alert(11,1,"经验值增加5000万!")
end

function jingyan100(player)
	player:add_exp(100000000);
	player:alert(11,1,"经验值增加1亿!")
end

function jingyan200(player)
	player:add_exp(200000000);
	player:alert(11,1,"经验值增加2亿!")
end

function jingyan500(player)
	player:add_exp(50000000);
	player:alert(11,1,"经验值增加5亿!")
end

function jingyan1000(player)
	player:add_exp(1000000000);
	player:alert(11,1,"经验值增加10亿!")
end

function jingyan2000(player)
	player:add_exp(2000000000);
	player:alert(11,1,"经验值增加20亿!")
end

function jingyan5000(player)
	player:add_exp(5000000000);
	player:alert(11,1,"经验值增加50亿!")
end

function zhenpinbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"完美的无双头盔·武威","完美的无双项链·武威","完美的无双护腕·武威","完美的无双戒指·武威","完美的无双腰带·武威","完美的无双靴·武威","完美的无双头盔·烈焰","完美的无双项链·烈焰","完美的无双护腕·烈焰","完美的无双戒指·烈焰","完美的无双腰带·烈焰","完美的无双靴·烈焰","完美的无双头盔·无极","完美的无双项链·无极","完美的无双护腕·无极","完美的无双戒指·无极","完美的无双腰带·无极","完美的无双靴·无极"};
		local d = {"完美的至尊头盔·武威","完美的至尊项链·武威","完美的至尊护腕·武威","完美的至尊戒指·武威","完美的至尊腰带·武威","完美的至尊靴·武威","完美的至尊头盔·烈焰","完美的至尊项链·烈焰","完美的至尊护腕·烈焰","完美的至尊戒指·烈焰","完美的至尊腰带·烈焰","完美的至尊靴·烈焰","完美的至尊头盔·无极","完美的至尊项链·无极","完美的至尊护腕·无极","完美的至尊戒指·无极","完美的至尊腰带·无极","完美的至尊靴·无极"};
		local e = {"完美的天龙头盔·武威","完美的天龙项链·武威","完美的天龙护腕·武威","完美的天龙戒指·武威","完美的天龙腰带·武威","完美的天龙靴·武威","完美的天龙头盔·烈焰","完美的天龙项链·烈焰","完美的天龙护腕·烈焰","完美的天龙戒指·烈焰","完美的天龙腰带·烈焰","完美的天龙靴·烈焰","完美的天龙头盔·无极","完美的天龙项链·无极","完美的天龙护腕·无极","完美的天龙戒指·无极","完美的天龙腰带·无极","完美的天龙靴·无极"};
		local g = {"完美的三皇头盔·武威","完美的三皇项链·武威","完美的三皇护腕·武威","完美的三皇戒指·武威","完美的三皇腰带·武威","完美的三皇靴·武威","完美的三皇头盔·烈焰","完美的三皇项链·烈焰","完美的三皇护腕·烈焰","完美的三皇戒指·烈焰","完美的三皇腰带·烈焰","完美的三皇靴·烈焰","完美的三皇头盔·无极","完美的三皇项链·无极","完美的三皇护腕·无极","完美的三皇戒指·无极","完美的三皇腰带·无极","完美的三皇靴·无极"};
			if z >= 1 and z <= 400 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1);
				player:alert(1,1,"恭喜您成功打开珍品宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开珍品宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 401 and z <= 700 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1);
				player:alert(1,1,"恭喜您成功打开珍品宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开珍品宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 701 and z <= 900 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1);
				player:alert(1,1,"恭喜您成功打开珍品宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开珍品宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开珍品宝箱,获得:"..i);
				return;
			end
			if z >= 901 and z <= 1000 then
				local i = g[math.random(#g)];
				player:add_item_log(i,217,1);
				player:alert(1,1,"恭喜您成功打开珍品宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开珍品宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开珍品宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end


function shanggubx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"完美的至尊头盔·武威","完美的至尊项链·武威","完美的至尊护腕·武威","完美的至尊戒指·武威","完美的至尊腰带·武威","完美的至尊靴·武威","完美的至尊头盔·烈焰","完美的至尊项链·烈焰","完美的至尊护腕·烈焰","完美的至尊戒指·烈焰","完美的至尊腰带·烈焰","完美的至尊靴·烈焰","完美的至尊头盔·无极","完美的至尊项链·无极","完美的至尊护腕·无极","完美的至尊戒指·无极","完美的至尊腰带·无极","完美的至尊靴·无极"};
		local d = {"完美的天龙头盔·武威","完美的天龙项链·武威","完美的天龙护腕·武威","完美的天龙戒指·武威","完美的天龙腰带·武威","完美的天龙靴·武威","完美的天龙头盔·烈焰","完美的天龙项链·烈焰","完美的天龙护腕·烈焰","完美的天龙戒指·烈焰","完美的天龙腰带·烈焰","完美的天龙靴·烈焰","完美的天龙头盔·无极","完美的天龙项链·无极","完美的天龙护腕·无极","完美的天龙戒指·无极","完美的天龙腰带·无极","完美的天龙靴·无极"};
		local e = {"完美的三皇头盔·武威","完美的三皇项链·武威","完美的三皇护腕·武威","完美的三皇戒指·武威","完美的三皇腰带·武威","完美的三皇靴·武威","完美的三皇头盔·烈焰","完美的三皇项链·烈焰","完美的三皇护腕·烈焰","完美的三皇戒指·烈焰","完美的三皇腰带·烈焰","完美的三皇靴·烈焰","完美的三皇头盔·无极","完美的三皇项链·无极","完美的三皇护腕·无极","完美的三皇戒指·无极","完美的三皇腰带·无极","完美的三皇靴·无极"};
		local g = {"完美的天威头盔·武威","完美的天威项链·武威","完美的天威护腕·武威","完美的天威戒指·武威","完美的天威腰带·武威","完美的天威靴·武威","完美的天威头盔·烈焰","完美的天威项链·烈焰","完美的天威护腕·烈焰","完美的天威戒指·烈焰","完美的天威腰带·烈焰","完美的天威靴·烈焰","完美的天威头盔·无极","完美的天威项链·无极","完美的天威护腕·无极","完美的天威戒指·无极","完美的天威腰带·无极","完美的天威靴·无极"};
			if z >= 1 and z <= 400 then
				local i = b[math.random(#b)];
				player:add_item_log(i,218,1);
				player:alert(1,1,"恭喜您成功打开上古宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开上古宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 401 and z <= 700 then
				local i = d[math.random(#d)];
				player:add_item_log(i,218,1);
				player:alert(1,1,"恭喜您成功打开上古宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开上古宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 701 and z <= 900 then
				local i = e[math.random(#e)];
				player:add_item_log(i,218,1);
				player:alert(1,1,"恭喜您成功打开上古宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开上古宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开上古宝箱,获得:"..i);
				return;
			end
			if z >= 901 and z <= 1000 then
				local i = g[math.random(#g)];
				player:add_item_log(i,218,1);
				player:alert(1,1,"恭喜您成功打开上古宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开上古宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开上古宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end



function lingyubx(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,1000);
			if z >= 1 and z <= 500 then
				player:add_item_log("四级灵羽",219,1,1);
				player:alert(1,1,"恭喜您成功打开灵羽宝箱,获得[四级灵羽]");
				player:alert(10,0,"恭喜您成功打开灵羽宝箱,获得:[<font color='#ff0000'>四级灵羽</font>]");
			return;
			end
			if z >= 501 and z <= 800 then
				player:add_item_log("五级灵羽",219,1,1);
				player:alert(1,1,"恭喜您成功打开灵羽宝箱,获得[五级灵羽]");
				player:alert(10,0,"恭喜您成功打开灵羽宝箱,获得:[<font color='#ff0000'>五级灵羽</font>]");
			return;
			end
			if z >= 801 and z <= 975 then
				player:add_item_log("六级灵羽",219,1,1);
				player:alert(1,1,"恭喜您成功打开灵羽宝箱,获得[六级灵羽]");
				player:alert(10,0,"恭喜您成功打开灵羽宝箱,获得:[<font color='#ff0000'>六级灵羽</font>]");
			return;
			end
			if z >= 976 and z <= 995 then
				player:add_item_log("七级灵羽",219,1,1);
				player:alert(11,1,"恭喜您成功打开灵羽宝箱,获得:[<font color='#ff0000'>七级灵羽</font>]");
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开灵羽宝箱,获得:[<font color='#ff0000'>七级灵羽</font>]");
			return;
			end
			if z >= 996 and z <= 1000 then
				player:add_item_log("八级灵羽",219,1,1);
				player:alert(11,1,"恭喜您成功打开灵羽宝箱,获得:[<font color='#ff0000'>八级灵羽</font>]");
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开灵羽宝箱,获得:[<font color='#ff0000'>八级灵羽</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想玄铁掉下地吧?!");
		return 0;
	end
end

function shenmibx(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,1000);
			if z >= 1 and z <= 500 then
				player:add_item_log("五级宝石",220,1,1);
				player:alert(1,1,"恭喜您成功打开神秘宝石箱,获得[五级宝石]");
				player:alert(10,0,"恭喜您成功打开神秘宝石箱,获得:[<font color='#ff0000'>五级宝石</font>]");
			return;
			end
			if z >= 501 and z <= 800 then
				player:add_item_log("六级宝石",220,1,1);
				player:alert(1,1,"恭喜您成功打开神秘宝石箱,获得[六级宝石]");
				player:alert(10,0,"恭喜您成功打开神秘宝石箱,获得:[<font color='#ff0000'>六级宝石</font>]");
			return;
			end
			if z >= 801 and z <= 975 then
				player:add_item_log("七级宝石",220,1,1);
				player:alert(1,1,"恭喜您成功打开神秘宝石箱,获得[七级宝石]");
				player:alert(10,0,"恭喜您成功打开神秘宝石箱,获得:[<font color='#ff0000'>七级宝石</font>]");
			return;
			end
			if z >= 976 and z <= 995 then
				player:add_item_log("八级宝石",220,1,1);
				player:alert(11,1,"恭喜您成功打开神秘宝石箱,获得:[<font color='#ff0000'>八级宝石</font>]");
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开神秘宝石箱,获得:[<font color='#ff0000'>八级宝石</font>]");
			return;
			end
			if z >= 996 and z <= 1000 then
				player:add_item_log("九级宝石",220,1,1);
				player:alert(11,1,"恭喜您成功打开神秘宝石箱,获得:[<font color='#ff0000'>九级宝石</font>]");
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开神秘宝石箱,获得:[<font color='#ff0000'>九级宝石</font>]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想玄铁掉下地吧?!");
		return 0;
	end
end

function zitie(player)
	player:add_vcoin_bind(50);
	player:alert(10,1,"获得:<font color='#ff0000'>50绑定元宝</font>")
end


function bfjzbai(player)
	player:add_vcoin_bind(50);
	player:alert(10,1,"使用【百】获得:50绑定元宝")
end

function bfjzfu(player)
	player:add_vcoin_bind(50);
	player:alert(10,1,"使用【服】获得:50绑定元宝")
end

function bfjzqing(player)
	player:add_vcoin_bind(50);
	player:alert(10,1,"使用【庆】获得:50绑定元宝")
end

function bfjzdian(player)
	player:add_vcoin_bind(50);
	player:alert(10,1,"使用【典】获得:50绑定元宝")
end


function zbj85(player)
	if player:num_bag_black() >= 1 then
		if( player:get_job_name() == "warrior" ) then
			local b = {"三皇头盔·武威","三皇项链·武威","三皇护腕·武威","三皇护腕·武威","三皇戒指·武威","三皇戒指·武威","三皇腰带·武威","三皇靴·武威","刑天之逆·武威"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "wizard" ) then
			local b = {"三皇头盔·烈焰","三皇项链·烈焰","三皇护腕·烈焰","三皇护腕·烈焰","三皇戒指·烈焰","三皇戒指·烈焰","三皇腰带·烈焰","三皇靴·烈焰","刑天之逆·烈焰"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "taoist" ) then
			local b = {"三皇头盔·无极","三皇项链·无极","三皇护腕·无极","三皇护腕·无极","三皇戒指·无极","三皇戒指·无极","三皇腰带·无极","三皇靴·无极","刑天之逆·无极"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end

function zbj80(player)
	if player:num_bag_black() >= 1 then
		if( player:get_job_name() == "warrior" ) then
			local b = {"天龙头盔·武威","天龙项链·武威","天龙护腕·武威","天龙护腕·武威","天龙戒指·武威","天龙戒指·武威","天龙腰带·武威","天龙靴·武威","游龙惊鸿·武威"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "wizard" ) then
			local b = {"天龙头盔·烈焰","天龙项链·烈焰","天龙护腕·烈焰","天龙护腕·烈焰","天龙戒指·烈焰","天龙戒指·烈焰","天龙腰带·烈焰","天龙靴·烈焰","游龙惊鸿·烈焰"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "taoist" ) then
			local b = {"天龙头盔·无极","天龙项链·无极","天龙护腕·无极","天龙护腕·无极","天龙戒指·无极","天龙戒指·无极","天龙腰带·无极","天龙靴·无极","游龙惊鸿·无极"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end

function zbj75(player)
	if player:num_bag_black() >= 1 then
		if( player:get_job_name() == "warrior" ) then
			local b = {"至尊头盔·武威","至尊项链·武威","至尊护腕·武威","至尊护腕·武威","至尊戒指·武威","至尊戒指·武威","至尊腰带·武威","至尊靴·武威","帝陨剑·武威"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "wizard" ) then
			local b = {"至尊头盔·烈焰","至尊项链·烈焰","至尊护腕·烈焰","至尊护腕·烈焰","至尊戒指·烈焰","至尊戒指·烈焰","至尊腰带·烈焰","至尊靴·烈焰","帝陨剑·烈焰"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "taoist" ) then
			local b = {"至尊头盔·无极","至尊项链·无极","至尊护腕·无极","至尊护腕·无极","至尊戒指·无极","至尊戒指·无极","至尊腰带·无极","至尊靴·无极","帝陨剑·无极"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end


function zbj70(player)
	if player:num_bag_black() >= 1 then
		if( player:get_job_name() == "warrior" ) then
			local b = {"无双头盔·武威","无双项链·武威","无双护腕·武威","无双护腕·武威","无双戒指·武威","无双戒指·武威","无双腰带·武威","无双靴·武威","破空斩·武威"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "wizard" ) then
			local b = {"无双头盔·烈焰","无双项链·烈焰","无双护腕·烈焰","无双护腕·烈焰","无双戒指·烈焰","无双戒指·烈焰","无双腰带·烈焰","无双靴·烈焰","破空斩·烈焰"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "taoist" ) then
			local b = {"无双头盔·无极","无双项链·无极","无双护腕·无极","无双护腕·无极","无双戒指·无极","无双戒指·无极","无双腰带·无极","无双靴·无极","破空斩·无极"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end

function zbj65(player)
	if player:num_bag_black() >= 1 then
		if( player:get_job_name() == "warrior" ) then
			local b = {"潜龙头盔·武威","潜龙项链·武威","潜龙护腕·武威","潜龙护腕·武威","潜龙戒指·武威","潜龙戒指·武威","潜龙腰带·武威","潜龙靴·武威","炙炎刀·武威"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "wizard" ) then
			local b = {"潜龙头盔·烈焰","潜龙项链·烈焰","潜龙护腕·烈焰","潜龙护腕·烈焰","潜龙戒指·烈焰","潜龙戒指·烈焰","潜龙腰带·烈焰","潜龙靴·烈焰","炙炎刀·烈焰"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "taoist" ) then
			local b = {"潜龙头盔·无极","潜龙项链·无极","潜龙护腕·无极","潜龙护腕·无极","潜龙戒指·无极","潜龙戒指·无极","潜龙腰带·无极","潜龙靴·无极","炙炎刀·无极"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end

function zbj55(player)
	if player:num_bag_black() >= 1 then
		if( player:get_job_name() == "warrior" ) then
			local b = {"惊世头盔·武威","惊世项链·武威","惊世护腕·武威","惊世护腕·武威","惊世戒指·武威","惊世戒指·武威","惊世腰带·武威","惊世靴·武威","承影剑·武威"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "wizard" ) then
			local b = {"惊世头盔·烈焰","惊世项链·烈焰","惊世护腕·烈焰","惊世护腕·烈焰","惊世戒指·烈焰","惊世戒指·烈焰","惊世腰带·烈焰","惊世靴·烈焰","承影剑·烈焰"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
		if( player:get_job_name() == "taoist" ) then
			local b = {"惊世头盔·无极","惊世项链·无极","惊世护腕·无极","惊世护腕·无极","惊世戒指·无极","惊世戒指·无极","惊世腰带·无极","惊世靴·无极","承影剑·无极"};
			local i = b[math.random(#b)];
			player:add_item_log(i,221,1);
			player:alert(11,1,"打开装备卷获得:<font color='#ff0000'>"..i.."</font>");
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end


function xiuwei10000(player)
	player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+10000);
	player:alert(11,1,"修为增加:10000点");
	player:alert(10,0,"当前修为:"..util.ppn(player,const.PP_XINFA_XIUWEI).."点");
end

function xiuwei3000(player)
	player:set_param(const.PP_XINFA_XIUWEI,util.ppn(player,const.PP_XINFA_XIUWEI)+3000);
	player:alert(11,1,"修为增加:3000点");
	player:alert(10,0,"当前修为:"..util.ppn(player,const.PP_XINFA_XIUWEI).."点");
end

function wwlp200(player)
--	if util.ppn(player,const.PP_CHENGJIULINGPAI) <= 9 then
--		player:set_param(const.PP_CHENGJIULINGPAI,util.ppn(player,const.PP_CHENGJIULINGPAI)+1);
--		player:alert(10,0,"今天已使用"..util.ppn(player,const.PP_CHENGJIULINGPAI).."个成就令牌!");
		player:achieve_add_point(200);
		player:alert(11,1,"成就点数:增加200点");
		player:alert(10,0,"当前成就:"..player:achieve_get_point().."点");
		npc.renwu.fenghao.youxifh(player);
--	else
--		player:alert(1,0,"对不起，您今天使用的次数超过限制！");
--	return 0;
--	end
end


function wwlp200bind(player)
	if util.ppn(player,const.PP_CHENGJIULPBIND) <= 4 then
		player:set_param(const.PP_CHENGJIULPBIND,util.ppn(player,const.PP_CHENGJIULPBIND)+1);
		player:alert(10,0,"今天已使用"..util.ppn(player,const.PP_CHENGJIULPBIND).."个成就令牌(绑)!");
		player:achieve_add_point(200);
		player:alert(11,1,"成就点数:增加200点");
		player:alert(10,0,"当前成就:"..player:achieve_get_point().."点");
		npc.renwu.fenghao.youxifh(player);
	else
		player:alert(1,0,"对不起，您今天使用的次数超过限制！");
	return 0;
	end
end

function xqjianshao1000(player)
	if util.ppn(player,const.PP_XINQUCHONGZHI) >= 100000 then
		player:set_param(const.PP_XINQUCHONGZHI,util.ppn(player,const.PP_XINQUCHONGZHI)-100000);
		player:alert(1,1,"您当前的充值累计金额减少1000!!")
		player:alert(1,0,"您当前累计充值:"..util.ppn(player,const.PP_XINQUCHONGZHI).."元宝");
	else
		player:set_param(const.PP_XINQUCHONGZHI,0);
		player:alert(1,1,"您当前的充值已经被清零!!")
	end
	if player:get_name() == server.get_var("xqczpma1") then
		server.set_var("xqczpma1","");
		server.set_var("xqczpmb1",499999);
	end
	if player:get_name() == server.get_var("xqczpma2") then
		server.set_var("xqczpma2","");
		server.set_var("xqczpmb2",299999);
	end
	if player:get_name() == server.get_var("xqczpma3") then
		server.set_var("xqczpma3","");
		server.set_var("xqczpmb3",99999);
	end
	if player:get_name() == server.get_var("xqczpma4") then
		server.set_var("xqczpma4","");
		server.set_var("xqczpmb4",0);
	end
		npc.huodong.Recharge_process2(player,0);
end



function xqzengjia1000(player)
		player:set_param(const.PP_XINQUCHONGZHI,util.ppn(player,const.PP_XINQUCHONGZHI)+100000);
		player:alert(1,1,"您当前的新区充值累计金额增加1000!!")
		player:alert(1,0,"您当前累计充值:"..util.ppn(player,const.PP_XINQUCHONGZHI).."元宝");
		npc.huodong.Recharge_process2(player,0);
end

function ceshi(player)
		player:set_param(const.PP_CZHZ_LV,10);
		player:set_status(37,86400,util.ppn(player,const.PP_CZHZ_LV),1,1);
		player:set_model(2,10);
		newgui.property.fresh_self_info(player);
		player:set_param(const.PP_CHONGZHIJIFEN,util.ppn(player,const.PP_CHONGZHIJIFEN)+100000);
		player:set_param(const.PP_XQCZFL,util.ppn(player,const.PP_XQCZFL)+math.floor(10000 * 0.2));
		player:set_param(const.PP_HUIYUAN,today()+30);
		player:set_level(55);
		if( player:get_job_name() == "warrior" ) then
		player:add_item("屠龙刀",1);
		if player:get_gender_name() == "male" then
		player:add_item("天神战甲",1);
		else
		player:add_item("天神战衣",1);
		end
		player:add_item("凌云头盔·武威",1);
		player:add_item("凌云项链·武威",1);
		player:add_item("凌云护腕·武威",2);
		player:add_item("凌云戒指·武威",2);
		player:add_item("凌云腰带·武威",1);
		player:add_item("凌云靴·武威",1);
		end
		if( player:get_job_name() == "taoist" ) then
		player:add_item("玄天剑",1);
		if player:get_gender_name() == "male" then
		player:add_item("天师道袍",1);
		else
		player:add_item("天师道衣",1);
		end
		player:add_item("凌云头盔·无极",1);
		player:add_item("凌云项链·无极",1);
		player:add_item("凌云护腕·无极",2);
		player:add_item("凌云戒指·无极",2);
		player:add_item("凌云腰带·无极",1);
		player:add_item("凌云靴·无极",1);
		end
		if( player:get_job_name() == "wizard" ) then
		player:add_item("魔魂法杖",1);
		if player:get_gender_name() == "male" then
		player:add_item("魔神披风",1);
		else
		player:add_item("魔神羽衣",1);
		end
		player:add_item("凌云头盔·烈焰",1);
		player:add_item("凌云项链·烈焰",1);
		player:add_item("凌云护腕·烈焰",2);
		player:add_item("凌云戒指·烈焰",2);
		player:add_item("凌云腰带·烈焰",1);
		player:add_item("凌云靴·烈焰",1);
		end
end

function yu1(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:add_exp(12000);
		player:alert(11,1,"食用[青鱼]获得:12000经验");
	else
		player:add_exp(10000);
		player:alert(11,1,"食用[青鱼]获得:10000经验");
	end
end

function yu2(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:add_exp(24000);
		player:alert(11,1,"食用[红虎鱼]获得:24000经验");
	else
		player:add_exp(20000);
		player:alert(11,1,"食用[红虎鱼]获得:20000经验");
	end
end

function yu3(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:add_exp(60000);
		player:alert(11,1,"食用[紫龙鱼]获得:60000经验");
	else
		player:add_exp(50000);
		player:alert(11,1,"食用[紫龙鱼]获得:50000经验");
	end
end

function yu4(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:add_exp(120000);
		player:alert(11,1,"食用[帝龙鱼]获得:120000经验");
	else
		player:add_exp(100000);
		player:alert(11,1,"食用[帝龙鱼]获得:100000经验");
	end
end

function hhjyf(player)
	if player:get_guild() ~= "" then
		if util.ppn(player,const.PP_HHJYF) == 0 then
			player:set_param(const.PP_HHJYF,1);
			player:add_exp(1000000);
			server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]打开[行会经验符]获得了大量经验!");
		else
			player:alert(1,1,"每人最多只可打开一次[行会经验符]!");
		end
	else
		player:alert(1,1,"按下[H]键加入行会,才可打开经验符!");
		return 0;
	end
end

function baoxiang(player)
	if player:num_bag_black() >= 1 then
		player:add_item("天璇仙魄",1,1)
		player:alert(10000,0,"恭喜["..player:get_name().."]打开[幸运宝箱]意外获得传说中的[天璇仙魄]!");
		player:alert(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]打开[幸运宝箱]意外获得传说中的[<font color='#ff0000'>天璇仙魄</font>]!");
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧!");
		return 0;
	end
end

function xianpo(player)
	if util.ppn(player,const.PP_SCLIBAO_XIANPO1) == 0 then
		if player:get_level() <= 59 then
			player:set_param(const.PP_SCLIBAO_XIANPO1,1);
			player:set_level(player:get_level()+1);
			player:alert(1,1,"使用[天璇仙魄]成功将等级提升1级!");
		else
			player:alert(1,1,"由于您的等级达到60级以上,[天璇仙魄]失效!");
		end
	end
end

function xianpo70(player)
	if util.ppn(player,const.PP_SCLIBAO_XIANPO2) == 0 then
		if player:get_level() <= 69 then
			player:set_param(const.PP_SCLIBAO_XIANPO2,1);
			player:set_level(player:get_level()+1);
			player:alert(1,1,"使用[天璇仙魄]成功将等级提升1级!");
		else
			player:alert(1,1,"由于您的等级达到70级以上,[天璇仙魄]失效!");
		end
	else
		player:alert(1,1,"您已经使用过一次，系统回收该物品");
	end
end

function xianpo80(player)
	if util.ppn(player,const.PP_SCLIBAO_XIANPO3) == 0 then
		if player:get_level() <= 79 then
			player:set_param(const.PP_SCLIBAO_XIANPO3,1);
			player:set_level(player:get_level()+1);
			player:alert(1,1,"使用[天璇仙魄]成功将等级提升1级!");
		else
			player:alert(1,1,"由于您的等级达到80级以上,[天璇仙魄]失效!");
		end
	else
		player:alert(1,1,"您已经使用过一次，系统回收该物品");
	end
end


function scjt(player)
	if util.ppn(player,const.PP_SCLIBAO_JINTIAO) == 0 then
		player:set_param(const.PP_SCLIBAO_JINTIAO,1);
		player:add_gamemoney_bind(1000000);
		player:alert(11,1,"使用[首充金条]获得100万绑定金币!");
	else
		player:alert(1,1,"您已经使用过一次，系统回收该物品");
	end
end


function scyb(player)
	if util.ppn(player,const.PP_SCLIBAO_YUANBAO) == 0 then
		player:set_param(const.PP_SCLIBAO_YUANBAO,1);
		player:add_vcoin_bind(2000);
		player:alert(11,1,"使用[首充元宝]获得2000绑定元宝!");
	else
		player:alert(1,1,"您已经使用过一次，系统回收该物品");
	end
end



function czlbjt(player)
	if util.ppn(player,const.PP_CHONGZHI_JINTIAO) == 0 then
		player:set_param(const.PP_CHONGZHI_JINTIAO,1);
		player:add_gamemoney_bind(1000000);
		player:alert(11,1,"使用[礼包金条]获得100万绑定金币!");
	else
		player:alert(1,1,"您已经使用过一次，系统回收该物品");
	end
end


function czlbyb(player)
	if util.ppn(player,const.PP_CHONGZHI_YUANBAO) <= 1 then
		player:set_param(const.PP_CHONGZHI_YUANBAO,util.ppn(player,const.PP_CHONGZHI_YUANBAO)+1);
		player:add_vcoin_bind(10000);
		player:alert(11,1,"使用[礼包元宝]获得10000绑定元宝!");
	else
		player:alert(1,1,"您已经使用过一次，系统回收该物品");
	end
end

function hunshi50(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+50)
		player:alert(11,1,"魂石增加50个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end
function hunshi250(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+250)
		player:alert(11,1,"魂石增加250个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end
function hunshi500(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+500)
		player:alert(11,1,"魂石增加500个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end
function hunshi1000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1000)
		player:alert(11,1,"魂石增加1000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end
function hunshi10000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+10000)
		player:alert(11,1,"魂石增加10000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end
function hunshi100000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+100000)
		player:alert(11,1,"魂石增加100000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end


function yjbslb(player)
	if util.ppn(player,const.PP_YIJIBAOSHILB) <= 3 then
		player:set_param(const.PP_YIJIBAOSHILB,util.ppn(player,const.PP_YIJIBAOSHILB)+1);
		if( player:get_job_name() == "warrior" ) then
			player:add_item("一级力量石",5,1);
			player:alert(11,1,"打开宝石包获得:[<font color='#FF0000'>一级力量石*5</font>]");
		end
		if( player:get_job_name() == "wizard" ) then
			player:add_item("一级魔法石",5,1);
			player:alert(11,1,"打开宝石包获得:[<font color='#FF0000'>一级魔法石*5</font>]");
		end
		if( player:get_job_name() == "taoist" ) then
			player:add_item("一级精神石",5,1);
			player:alert(11,1,"打开宝石包获得:[<font color='#FF0000'>一级精神石*5</font>]");
		end
	else
		player:alert(1,1,"对不起,每天最多只可使用4次[一级宝石包]");
	return 0;
	end
end


function hsbind100(player)
	if util.ppn(player,const.PP_HUNSHIBIND) <= 9 then
		player:set_param(const.PP_HUNSHIBIND,util.ppn(player,const.PP_HUNSHIBIND)+1);
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+100)
		player:alert(10,0,"今天已使用["..util.ppn(player,const.PP_HUNSHIBIND).."]个[魂石令牌(100)]");
		player:alert(11,1,"魂石增加100个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
	else
		player:alert(1,1,"对不起,每天最多只可使用10次[魂石令牌(100)]");
	return 0;
	end
end


function rybind2000(player)
	if util.ppn(player,const.PP_RONGYUBIND) <= 9 then
		player:set_param(const.PP_RONGYUBIND,util.ppn(player,const.PP_RONGYUBIND)+1);
		player:add_honor(2000);
		player:alert(10,0,"今天已使用["..util.ppn(player,const.PP_RONGYUBIND).."]个[荣誉令牌(2000)]");
		player:alert(11,1,"荣誉值增加2000点,您共有荣誉值:"..player:get_honor().."点");
	else
		player:alert(1,1,"对不起,每天最多只可使用10次[荣誉令牌(2000)]");
	return 0;
	end
end


function hs200(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+200)
		player:alert(11,1,"魂石增加200个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function hs500(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+500)
		player:alert(11,1,"魂石增加500个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function hs1000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1000)
		player:alert(11,1,"魂石增加1000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function hs2000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+2000)
		player:alert(11,1,"魂石增加2000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function hs5000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+5000)
		player:alert(11,1,"魂石增加5000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function hs10000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+10000)
		player:alert(11,1,"魂石增加10000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function hs50000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+50000)
		player:alert(11,1,"魂石增加50000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
end


function ry1000(player)
		player:add_honor(1000);
		player:alert(11,1,"荣誉值增加1000点,您共有荣誉值:"..player:get_honor().."点");
end

function ry5000(player)
		player:add_honor(5000);
		player:alert(11,1,"荣誉值增加5000点,您共有荣誉值:"..player:get_honor().."点");
end

function ry10000(player)
		player:add_honor(10000);
		player:alert(11,1,"荣誉值增加10000点,您共有荣誉值:"..player:get_honor().."点");
end


function sqjf1(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+1);
		player:alert(11,1,"神器积分增加1点");
		player:alert(11,1,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

function sqjf5(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+5);
		player:alert(11,1,"神器积分增加5点");
		player:alert(11,1,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

function sqjf10(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+10);
		player:alert(11,1,"神器积分增加10点");
		player:alert(11,1,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

function sqjf20(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+20);
		player:alert(11,1,"神器积分增加20点");
		player:alert(11,0,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

function sqjf50(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+50);
		player:alert(11,1,"神器积分增加50点");
		player:alert(11,1,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

function sqjf100(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+100);
		player:alert(11,1,"神器积分增加100点");
		player:alert(11,1,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

function sqjf1000(player)
		player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+1000);
		player:alert(11,1,"神器积分增加1000点");
		player:alert(11,1,"您的神器积分为:"..util.ppn(player,const.PP_SQJF).."点");
		return;
end

--//真气
function hunjing100(player)
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+100)
		player:alert(11,1,"获得真气100个,您共有真气:"..util.ppn(player,const.PP_HUNJING_NUMBER).."个");
		newgui.lianhun.fresh_lianhun_info(player);
		return;
end
function hunjing500(player)
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+500)
		player:alert(11,1,"获得真气500个,您共有真气:"..util.ppn(player,const.PP_HUNJING_NUMBER).."个");
		newgui.lianhun.fresh_lianhun_info(player);
		return;
end
function hunjing1000(player)
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+1000)
		player:alert(11,1,"获得真气1000个,您共有真气:"..util.ppn(player,const.PP_HUNJING_NUMBER).."个");
		newgui.lianhun.fresh_lianhun_info(player);
		return;
end
function hunjing5000(player)
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+5000)
		player:alert(11,1,"获得真气5000个,您共有真气:"..util.ppn(player,const.PP_HUNJING_NUMBER).."个");
		newgui.lianhun.fresh_lianhun_info(player);
		return;
end
function hunjing10000(player)
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+10000)
		newgui.lianhun.fresh_lianhun_info(player);
		player:alert(11,1,"获得真气10000个,您共有真气:"..util.ppn(player,const.PP_HUNJING_NUMBER).."个");
		return;
end
--//绑定真气
function hunjing100_bind(player)
	if util.ppn(player,const.PP_HUNJING_BIND) ~= today() then
		player:set_param(const.PP_HUNJING_BIND,today());
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+100);
		newgui.lianhun.fresh_lianhun_info(player);
		player:alert(10,0,"您今天已经使用1个真气丹(100)[绑]");
		player:alert(1,1,"恭喜您成功获得100真气");
	else
		player:alert(1,1,"对不起,每天最多只可使用1次真气丹(100)[绑]");
	return 0;
	end
end

--//灵气珠
function lingqi100(player)
		player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+100);
		player:alert(11,1,"获得灵气100,您共有灵气:"..util.ppn(player,const.PP_SWORD_LINGQI).."");
		return;
end
function lingqi500(player)
		player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+500);
		player:alert(11,1,"获得灵气500,您共有灵气:"..util.ppn(player,const.PP_SWORD_LINGQI).."");
		return;
end
function lingqi1000(player)
		player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+1000);
		player:alert(11,1,"获得灵气1000,您共有灵气:"..util.ppn(player,const.PP_SWORD_LINGQI).."");
		return;
end
function lingqi5000(player)
		player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+5000);
		player:alert(11,1,"获得灵气5000,您共有灵气:"..util.ppn(player,const.PP_SWORD_LINGQI).."");
		return;
end
function lingqi10000(player)
		player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+10000);
		player:alert(11,1,"获得灵气10000,您共有灵气:"..util.ppn(player,const.PP_SWORD_LINGQI).."");
		return;
end
--//绑定灵气珠
function lingqi500_bind(player)
	if util.ppn(player,const.PP_SWORD_LINGQI_BIND) ~= today() then
		player:set_param(const.PP_SWORD_LINGQI_BIND,today());
		player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+500);
		player:alert(10,0,"您今天已经使用1个灵气珠(500)[绑]");
		player:alert(1,1,"恭喜您成功获得500灵气");
	else
		player:alert(1,1,"对不起,每天最多只可使用1次灵气珠(500)[绑]");
	return 0;
	end
end

--//兽灵精华
function shoulingjinghua100(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+100)
		player:alert(11,1,"获得兽灵精华100,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua500(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+500)
		player:alert(11,1,"获得兽灵精华500,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua1000(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+1000)
		player:alert(11,1,"获得兽灵精华1000,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua5000(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+5000)
		player:alert(11,1,"获得兽灵精华5000,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua10000(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+10000)
		player:alert(11,1,"获得兽灵精华10000,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua30(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+30)
		player:alert(11,1,"获得兽灵精华30,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua90(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+90)
		player:alert(11,1,"获得兽灵精华90,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua150(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+150)
		player:alert(11,1,"获得兽灵精华150,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua200(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+200)
		player:alert(11,1,"获得兽灵精华200,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
function shoulingjinghua250(player)
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+250)
		player:alert(11,1,"获得兽灵精华250,您共有兽灵精华:"..util.ppn(player,const.PP_SHOULING_JINGHUA).."");
		return;
end
--//绑定兽灵精华
function shoulingjinghua100_bind(player)
	if util.ppn(player,const.PP_SHOULING_JINGHUA_BIND) ~= today() then
		player:set_param(const.PP_SHOULING_JINGHUA_BIND,today());
		player:set_param(const.PP_SHOULING_JINGHUA,util.ppn(player,const.PP_SHOULING_JINGHUA)+100);
		player:alert(10,0,"您今天已经使用1个兽灵精华(100)[绑]");
		player:alert(1,1,"恭喜您成功获得100兽灵精华");
	else
		player:alert(1,1,"对不起,每天最多只可使用1次兽灵精华(100)[绑]");
	return 0;
	end
end

--//装备灵魂石
function linghunshi1(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+1);
	player:alert(11,1,"获得装备灵魂石*1,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end

function linghunshi5(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+5)
	player:alert(11,1,"获得装备灵魂石*5,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end

function linghunshi10(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+10)
	player:alert(11,1,"获得装备灵魂石*10,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end

function linghunshi50(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+50)
	player:alert(11,1,"获得装备灵魂石*50,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end

function linghunshi100(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+100)
	player:alert(11,1,"获得装备灵魂石*100,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end

function linghunshi500(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+500)
	player:alert(11,1,"获得装备灵魂石*500,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end

function linghunshi1000(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+1000)
	player:alert(11,1,"获得装备灵魂石*1000,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	return;
end
--//绑定装备灵魂石50
function linghunshi50_bind(player)
	newgui.fuse.fresh_zhuhun(player);
	player:push_ckpanel_data("fuse","panelfuse");
	if util.ppn(player,const.PP_ZBLINGHUNSHI_BIND) ~= today() then
		player:set_param(const.PP_ZBLINGHUNSHI_BIND,today());
		player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+50);
		player:alert(10,0,"您今天已经使用1个装备灵魂石(50)[绑]");
		player:alert(1,1,"恭喜您成功获得50装备灵魂石");
	else
		player:alert(1,1,"对不起,每天最多只可使用1次装备灵魂石(50)[绑]");
	return 0;
	end
end

--//星尘
function xingchen5(player)
		player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+5)
		player:alert(11,1,"获得星尘5,您共有星尘:"..util.ppn(player,const.PP_PERSONAL_XINGCHEN).."");
		return;
end
function xingchen25(player)
		player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+25)
		player:alert(11,1,"获得星尘25,您共有星尘:"..util.ppn(player,const.PP_PERSONAL_XINGCHEN).."");
		return;
end
function xingchen50(player)
		player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+50)
		player:alert(11,1,"获得星尘50,您共有星尘:"..util.ppn(player,const.PP_PERSONAL_XINGCHEN).."");
		return;
end
function xingchen100(player)
		player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+100)
		player:alert(11,1,"获得星尘100,您共有星尘:"..util.ppn(player,const.PP_PERSONAL_XINGCHEN).."");
		return;
end

--//招财神符
function zhaocai(player)
--	if util.ppn(player,const.PP_HUIYUAN) >= today() and util.ppn(player,const.PP_ZHAOCAI) <= 39 or util.ppn(player,const.PP_HUIYUAN) < today() and util.ppn(player,const.PP_ZHAOCAI) <= 19 then
		player:add_gamemoney_bind(200000);
--		player:set_param(const.PP_ZHAOCAI,util.ppn(player,const.PP_ZHAOCAI)+1);
		player:alert(1,1,"绑定金币增加:200000");
--		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_ZHAOCAI).."]个招财神符");
--	else
--		player:alert(1,1,"您今天已经使用了["..util.ppn(player,const.PP_ZHAOCAI).."]个招财神符!<br>建议您留到明天再开启!<br>会员玩家每天可开启40个招财神符!<br>");
--		return 0;
--	end
end

--//招财神符(大)
function zhaocaida(player)
	if util.ppn(player,const.PP_ZHAOCAISHENFU) == 0 then
		player:set_param(const.PP_ZHAOCAISHENFU,1);
	end
		player:add_gamemoney_bind(2000000);
		player:alert(1,1,"绑定金币增加:2000000");
end



function fuguihu(player)
	if util.ppn(player,const.PP_FUGUIHU) <= 4 then
		player:set_param(const.PP_FUGUIHU,util.ppn(player,const.PP_FUGUIHU)+1);
		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_FUGUIHU).."]个富贵虎");
		if activity.isDay14thOpen() then
			player:add_vcoin_bind(1000);
			player:alert(1,1,"恭喜您成功获得1000绑定元宝");
		else
			player:add_vcoin_bind(500);
			player:alert(1,1,"恭喜您成功获得500绑定元宝");
		end
	else
		player:alert(1,1,"对不起,每天最多只可使用5次[开心富贵虎]");
	return 0;
	end
end



--//聚灵珠
function slanlingzhu(player)
--	if util.ppn(player,const.PP_SHENLANLZ) <= 39 then
--		player:set_param(const.PP_SHENLANLZ,util.ppn(player,const.PP_SHENLANLZ)+1);
--		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_SHENLANLZ).."]个聚灵珠");
		if util.ppn(player,const.PP_SLLINGZHU1) ~= 2 then
			player:set_param(const.PP_SLLINGZHU1,2)
			player:set_param(const.PP_SLLINGZHU2,0)
			player:set_param(const.PP_SLLINGZHU3,600);
			player:alert(1,1,"聚灵珠开启,每击杀3只同等级以上的怪物便会经验爆发1次,杀满"..util.ppn(player,const.PP_SLLINGZHU3).."只怪后聚灵珠效果消散！");
		else
			player:set_param(const.PP_SLLINGZHU3,util.ppn(player,const.PP_SLLINGZHU3)+600);
			player:alert(1,1,"聚灵珠效果增强,每击杀3只同等级以上的怪物便会经验爆发1次,杀满"..util.ppn(player,const.PP_SLLINGZHU3).."只怪后聚灵珠效果消散！");
		return;
		end
--	else
--		player:alert(1,1,"您今天使用聚灵珠已经达到40次,无法再使用!")
--		return 0;
--	end
end


--//聚灵珠(小)
function xiaolingzhu(player)
	if util.ppn(player,const.PP_SLLINGZHU1) ~= 2 then
		player:set_param(const.PP_SLLINGZHU1,2)
		player:set_param(const.PP_SLLINGZHU2,0)
		player:set_param(const.PP_SLLINGZHU3,300);
		player:alert(1,1,"聚灵珠开启,每击杀3只同等级以上的怪物便会经验爆发1次,杀满"..util.ppn(player,const.PP_SLLINGZHU3).."只怪后聚灵珠效果消散！");
	else
		player:set_param(const.PP_SLLINGZHU3,util.ppn(player,const.PP_SLLINGZHU3)+300);
		player:alert(1,1,"聚灵珠效果增强,每击杀3只同等级以上的怪物便会经验爆发1次,杀满"..util.ppn(player,const.PP_SLLINGZHU3).."只怪后聚灵珠效果消散！");
	return;
	end
end


--//聚灵珠[绑]
function slanlingzhubind(player)
	if util.ppn(player,const.PP_SHENLANLZ_BIND) <= 4 then
		player:set_param(const.PP_SHENLANLZ_BIND,util.ppn(player,const.PP_SHENLANLZ_BIND)+1);
		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_SHENLANLZ_BIND).."]个聚灵珠[绑]");
		if util.ppn(player,const.PP_SLLINGZHU1) ~= 2 then
			player:set_param(const.PP_SLLINGZHU1,2)
			player:set_param(const.PP_SLLINGZHU2,0)
			player:set_param(const.PP_SLLINGZHU3,600);
			player:alert(1,1,"聚灵珠开启,每击杀3只同等级以上的怪物便会经验爆发1次,杀满"..util.ppn(player,const.PP_SLLINGZHU3).."只怪后聚灵珠效果消散！");
		else
			player:set_param(const.PP_SLLINGZHU3,util.ppn(player,const.PP_SLLINGZHU3)+600);
			player:alert(1,1,"聚灵珠效果增强,每击杀3只同等级以上的怪物便会经验爆发1次,杀满"..util.ppn(player,const.PP_SLLINGZHU3).."只怪后聚灵珠效果消散！");
		return;
		end
	else
		player:alert(1,1,"您今天使用聚灵珠[绑]已经达到5次,无法再使用!")
		return 0;
	end
end

--//祝福油
function zhufuyou(player)
	if player:check_euqip(-4) == 0 then
	player:alert(11,0,"由于您没有佩带武器,无法使用");
	return 0;
	end
	local z = math.random(1,100);
	if player:get_weapon_luck() <= 0 then
		if z <= 90 then
		player:set_weapon_luck(player:get_weapon_luck()+1);
		player:alert(10,0,"武器幸运增加");
		return;
		else
		player:alert(10,0,"祝福无效");
		return;
		end
	end
	if player:get_weapon_luck() == 1 then
		if z <= 30  then
		player:set_weapon_luck(2);
		player:alert(10,0,"武器幸运增加");
		return;
		end
		if z >= 31 and z <= 80  then
		player:alert(10,0,"祝福无效");
		return;
		end
		if z >= 81 and z <= 100  then
		player:set_weapon_luck(0);
		player:alert(10,0,"武器被诅咒了");
		return;
		end
	end
	if player:get_weapon_luck() == 2 then
		if z <= 10  then
		player:set_weapon_luck(3);
		player:alert(10,0,"武器幸运增加");
		return;
		end
		if z >= 11 and z <= 60  then
		player:alert(10,0,"祝福无效");
		return;
		end
		if z >= 61 and z <= 100  then
		player:set_weapon_luck(1);
		player:alert(10,0,"武器被诅咒了");
		return;
		end
	end
	if player:get_weapon_luck() == 3 then
		if z <= 5  then
		player:set_weapon_luck(4);
		player:alert(10,0,"武器幸运增加");
		return;
		end
		if z >= 6 and z <= 40  then
		player:alert(10,0,"祝福无效");
		return;
		end
		if z >= 41 and z <= 100  then
		player:set_weapon_luck(2);
		player:alert(10,0,"武器被诅咒了");
		return;
		end
	end
	if player:get_weapon_luck() == 4 then
		if z <= 1  then
		player:set_weapon_luck(5);
		player:alert(10,0,"武器幸运增加");
		return;
		end
		if z >= 2 and z <= 30  then
		player:alert(10,0,"祝福无效");
		return;
		end
		if z >= 31 and z <= 100  then
		player:set_weapon_luck(3);
		player:alert(10,0,"武器被诅咒了");
		return;
		end
	end
	if player:get_weapon_luck() == 5 then
		if z <= 1  then
		player:set_weapon_luck(6);
		player:alert(10,0,"武器幸运增加");
		return;
		end
		if z >= 2 and z <= 20  then
		player:alert(10,0,"祝福无效");
		return;
		end
		if z >= 21 and z <= 100  then
		player:set_weapon_luck(4);
		player:alert(10,0,"武器被诅咒了");
		return;
		end
	end
	if player:get_weapon_luck() == 6 then
		if z <= 1  then
		player:set_weapon_luck(7);
		player:alert(10,0,"武器幸运增加");
		return;
		end
		if z >= 2 and z <= 10  then
		player:alert(10,0,"祝福无效");
		return;
		end
		if z >= 11 and z <= 100  then
		player:set_weapon_luck(5);
		player:alert(10,0,"武器被诅咒了");
		return;
		end
	end
	if player:get_weapon_luck() >= 7 then
		player:alert(10,0,"武器已经达到最大幸运上限");
		return 0;
	end
end
--//超级祝福油
function superzfyu(player)
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

--//VIP会员(30天)
function viphuiy30(player)
	player:set_model(5,1);
	if util.ppn(player,const.PP_HUIYUAN) >= today() then
		player:set_param(const.PP_HUIYUAN,util.ppn(player,const.PP_HUIYUAN)+30);
		newgui.property.fresh_self_info(player);
		player:alert(1,0,"您的会员时间还有"..(util.ppn(player,const.PP_HUIYUAN) - today()).."天到期");
	else
		player:set_param(const.PP_HUIYUAN,0);
	end
	if util.ppn(player,const.PP_HUIYUAN) == 0 then
		player:set_model(5,1);
		player:set_vip(1);
		player:set_param(const.PP_HUIYUAN,today()+30);
		newgui.property.fresh_self_info(player);
		server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成为VIP会员!");
		player:alert(1,0,"您的会员时间还有"..(util.ppn(player,const.PP_HUIYUAN) - today()).."天到期");
		newgui.xhuodong.setVIPTeQuan(player);--修改日常活动 降妖除魔 擒贼擒王 次数问题
	end
end

--//VIP会员(3天)
function viphuiy3(player)
	player:set_model(5,1);
	player:set_vip(1);
	if util.ppn(player,const.PP_HUIYUAN) >= today() then
		player:set_param(const.PP_HUIYUAN,util.ppn(player,const.PP_HUIYUAN)+3);
		newgui.property.fresh_self_info(player);
		player:alert(1,0,"您的会员时间还有"..(util.ppn(player,const.PP_HUIYUAN) - today()).."天到期");
	else
		player:set_param(const.PP_HUIYUAN,0);
	end
	if util.ppn(player,const.PP_HUIYUAN) == 0 then
		player:set_param(const.PP_HUIYUAN,today()+3);
		newgui.property.fresh_self_info(player);
		server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成为VIP会员!");
		player:alert(1,0,"您的会员时间还有"..(util.ppn(player,const.PP_HUIYUAN) - today()).."天到期");
		newgui.xhuodong.setVIPTeQuan(player);--修改日常活动 降妖除魔 擒贼擒王 次数问题
	end
end

--//赎罪药水
function shuzuiyas(player)
	if player:get_pk_value() >= 200 then
		player:set_pk_value(player:get_pk_value()-200);
		player:alert(1,0,"赎罪药水发挥功效!您的PK值减少200点");
	else
		player:set_pk_value(0);
		player:alert(1,0,"赎罪药水发挥功效!您的PK值减少200点");
	end
end


function hunshi1(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1)
		player:alert(11,1,"魂石增加1个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end


function hunshi10(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+10)
		player:alert(11,1,"魂石增加10个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end


function hunshi100(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+100)
		player:alert(11,1,"魂石增加100个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end


function hunshi1000(player)
		player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+1000)
		player:alert(11,1,"魂石增加1000个,您共有魂石:"..util.ppn(player,const.PP_HUNSHI).."个");
		return;
end

--//骰子
function r10122(player)
	local i = math.random(701,706);
	player:set_temp_param(100,i)
	player:set_temp_param(101,0)
	player:play_effect(102,i);
	player:set_timer(const.PT_SAIZI,3000);
end

function alee(player)
	if player:get_temp_param(100) then
		player:alert(1001,1,"掷出了"..(player:get_temp_param(100)-700).."点.");
	end
end
--坐骑经验丹
function zqjyd1(player)
	local result = newgui.zuoqi.mountAddExp(player,10000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end
function zqjyd5(player)
	local result = newgui.zuoqi.mountAddExp(player,50000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end
function zqjyd10(player)
	local result = newgui.zuoqi.mountAddExp(player,100000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end
function zqjyd20(player)
	local result = newgui.zuoqi.mountAddExp(player,200000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end
function zqjyd30(player)
	local result = newgui.zuoqi.mountAddExp(player,300000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end
function zqjyd50(player)
	local result = newgui.zuoqi.mountAddExp(player,500000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end
function zqjyd100(player)
	local result = newgui.zuoqi.mountAddExp(player,1000000);
	if result == 0 then
		player:alert(1,1,"坐骑已达到经验上限!");
		return 0;
	end
end


--坐骑经验丹(绑定)
function zqjyd1bind(player)
	if util.ppn(player,const.PP_ZQJYD1) <= 9 then
		player:set_param(const.PP_ZQJYD1,util.ppn(player,const.PP_ZQJYD1)+1);
		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_ZQJYD1).."]个坐骑经验丹(小)[绑]");
		local result = newgui.zuoqi.mountAddExp(player,10000);
		if result == 0 then
			player:alert(1,1,"坐骑已达到经验上限!");
			return 0;
		end
	else
	player:alert(1,1,"对不起,每天最多只可使用10次坐骑经验丹(小)[绑]");
	return 0;
	end
end
function zqjyd5bind(player)
	if util.ppn(player,const.PP_ZQJYD5) <= 1 then
		player:set_param(const.PP_ZQJYD5,util.ppn(player,const.PP_ZQJYD5)+1);
		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_ZQJYD5).."]个坐骑经验丹(中)[绑]");
		local result = newgui.zuoqi.mountAddExp(player,50000);
		if result == 0 then
			player:alert(1,1,"坐骑已达到经验上限!");
			return 0;
		end
	else
	player:alert(1,1,"对不起,每天最多只可使用2次坐骑经验丹(中)[绑]");
	return 0;
	end
end
function zqjyd10bind(player)
	if util.ppn(player,const.PP_ZQJYD10) <= 0 then
		player:set_param(const.PP_ZQJYD10,util.ppn(player,const.PP_ZQJYD10)+1);
		player:alert(10,0,"您今天已经使用["..util.ppn(player,const.PP_ZQJYD10).."]个坐骑经验丹(大)[绑]");
		local result = newgui.zuoqi.mountAddExp(player,100000);
		if result == 0 then
			player:alert(1,1,"坐骑已达到经验上限!");
			return 0;
		end
	else
	player:alert(1,1,"对不起,每天最多只可使用1次坐骑经验丹(大)[绑]");
	return 0;
	end
end

function zhongqiuyb(player)
	if ymd() >= 20130919 and ymd() <= 20130930 then
		if util.ppn(player,const.PP_ZHONGQIUYBCS) <= 9 then
			player:set_param(const.PP_ZHONGQIUYBCS,util.ppn(player,const.PP_ZHONGQIUYBCS)+1);
			local a = {
				[1]={y=math.random(200,1000)},
				[2]={y=math.random(8000,15000)},
				[3]={y=math.random(100000,200000)},
				};
			local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"食用月饼获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"食用月饼获得[经验]:<font color='#ff0000'>"..j.."</font>");
			end
			if x == a[3] then
				player:add_gamemoney_bind(a[3].y);
				player:alert(11,1,"食用月饼获得[绑定金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			end
			player:alert(10,0,"您今天已经食用["..util.ppn(player,const.PP_ZHONGQIUYBCS).."]个中秋月饼!");
		else
		player:alert(1,1,"对不起,每天最多只可食用10块中秋月饼!");
		return 0;
		end
	else
		player:add_exp(10000);
		player:alert(11,1,"月饼已过期!获得10000经验!");
	end
end


function choujiang(player)
	if server.get_var("xybx") == "" then
		server.set_var("xybx",0);
	end
	if player:num_bag_black() >= 1 then
	server.set_var("xybx",tonumber(server.get_var("xybx"))+1);
	--if activity.isBaifuSjieOpen() then
	--	player:set_param(const.PP_MEIRIXUNBAOCISHU,util.ppn(player,const.PP_MEIRIXUNBAOCISHU)+1);
	--end
	player:set_param(const.PP_XUNBAOJIFEN,util.ppn(player,const.PP_XUNBAOJIFEN)+1);
	player:alert(11,1,"寻宝积分增加:<font color='#ff0000'>1点</font>");
	player:alert(11,0,"共有寻宝积分:<font color='#ff0000'>"..util.ppn(player,const.PP_XUNBAOJIFEN).."点</font>");
	local eq={[1]="·武威",[2]="·烈焰",[3]="·无极"};
	local sui = math.random(1,3);
	local job = eq[sui];
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(200,500)},
		[2]={y=math.random(20000,50000)},
		[3]={y=math.random(100000,200000)},
		};
	local c = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","二级灵羽","二级宝石","真气丹(100)","经验珠(50万)","坐骑经验丹(小)","魂石令牌(200)"};
	local d = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","二级灵羽","三级宝石","真气丹(500)","经验珠(100万)","祈福令牌(小)","转生石","坐骑经验丹(中)","魂石令牌(500)"};
	local e = {"二级生命玄晶","二级攻击玄晶","三级生命玄晶","三级攻击玄晶","二级灵羽","三级灵羽","三级宝石","四级宝石","真气丹(500)","经验珠(200万)","祈福令牌(小)","转生石","进阶石包(100)","坐骑经验丹(大)","魂石令牌(1000)","完美的混天头盔"..job,"完美的混天项链"..job,"完美的混天护腕"..job,"完美的混天戒指"..job,"完美的混天腰带"..job,"完美的混天靴"..job,"混天镇元甲"..job,"混天镇元衣"..job,"承影剑"..job};
	local f = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","三级灵羽","四级灵羽","四级宝石","五级宝石","真气丹(1000)","经验珠(500万)","祈福令牌(中)","进阶石包(200)","坐骑经验丹(20万)","魂石令牌(2000)","完美的潜龙头盔"..job,"完美的潜龙项链"..job,"完美的潜龙护腕"..job,"完美的潜龙戒指"..job,"完美的潜龙腰带"..job,"完美的潜龙靴"..job,"潜龙吟渊甲"..job,"潜龙吟渊衣"..job,"炙炎刀"..job};
	local g = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级灵羽","五级灵羽","五级宝石","六级宝石","真气丹(1000)","真气丹(5000)","经验珠(1000万)","祈福令牌(中)","进阶石包(300)","坐骑经验丹(30万)","魂石令牌(5000)","完美的无双头盔"..job,"完美的无双项链"..job,"完美的无双护腕"..job,"完美的无双戒指"..job,"完美的无双腰带"..job,"完美的无双靴"..job,"无双传说甲"..job,"无双传说衣"..job,"破空斩"..job};
	local h = {"四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","五级灵羽","六级灵羽","六级宝石","七级宝石","真气丹(5000)","经验珠(2000万)","祈福令牌(大)","进阶石包(500)","坐骑经验丹(100万)","魂石令牌(10000)","完美的至尊头盔"..job,"完美的至尊项链"..job,"完美的至尊护腕"..job,"完美的至尊戒指"..job,"完美的至尊腰带"..job,"完美的至尊靴"..job,"至尊王者甲"..job,"至尊王者衣"..job,"帝陨剑"..job,"完美的天龙头盔"..job,"完美的天龙项链"..job,"完美的天龙护腕"..job,"完美的天龙戒指"..job,"完美的天龙腰带"..job,"完美的天龙靴"..job,"游龙惊鸿甲"..job,"游龙惊鸿衣"..job,"游龙惊鸿"..job,"完美的三皇头盔"..job,"完美的三皇项链"..job,"完美的三皇护腕"..job,"完美的三皇戒指"..job,"完美的三皇腰带"..job,"完美的三皇靴"..job,"三皇震天甲"..job,"三皇震天衣"..job,"刑天之逆"..job,"完美的天威头盔"..job,"完美的天威项链"..job,"完美的天威护腕"..job,"完美的天威戒指"..job,"完美的天威腰带"..job,"完美的天威靴"..job,"天威炎阳甲"..job,"天威炎阳衣"..job,"天威炎阳剑"..job};
	local l = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","七级灵羽","八级宝石","真气丹(10000)","经验珠(5000万)","神器积分[100分]","骠骑将军护腕","抚国大将军戒","镇国大将军链","兵马大元帅盔","完美的神皇头盔"..job,"完美的神皇项链"..job,"完美的神皇护腕"..job,"完美的神皇戒指"..job,"完美的神皇腰带"..job,"完美的神皇靴"..job,"神皇震威甲"..job,"神皇震威衣"..job,"神皇震威剑"..job,"三转螭龙盔"..job,"三转螭龙链"..job,"三转螭龙镯"..job,"三转螭龙戒"..job,"三转螭龙腰带"..job,"三转螭龙靴"..job,"三转螭龙甲"..job,"三转螭龙衣"..job,"三转螭龙剑"..job};
	local k = {"八级灵羽","八级宝石","九级宝石","十级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","神器积分[1000分]","龙皇离火剑·武威","龙皇离火剑·烈焰","龙皇离火剑·无极","四转洪荒盔"..job,"四转洪荒链"..job,"四转洪荒镯"..job,"四转洪荒戒"..job,"四转洪荒腰带"..job,"四转洪荒靴"..job,"四转洪荒甲"..job,"四转洪荒衣"..job,"四转洪荒剑"..job};
		if tonumber(server.get_var("xybx")) >= 5000 then
			server.set_var("xybx",0);
			local i = k[math.random(#k)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"打开藏宝箱获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]打开藏宝箱获得:"..i);
			return;
		end
		if z >= 1 and z <= 350 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"打开藏宝箱获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"打开藏宝箱获得[经验]:<font color='#ff0000'>"..j.."</font>");
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(11,1,"打开藏宝箱获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			return;
			end
		end
		if z >= 351 and z <= 600 then
			local i = c[math.random(#c)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 601 and z <= 750 then
			local i = d[math.random(#d)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 751 and z <= 850 then
			local i = e[math.random(#e)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 851 and z <= 920 then
			local i = f[math.random(#f)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 921 and z <= 970 then
			local i = g[math.random(#g)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"打开藏宝箱获得:"..i);
--			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
--			server.info(10000,0,"勇士["..player:get_name().."]打开藏宝箱获得:"..i);
			return;
		end
		if z >= 971 and z <= 995 then
			local i = h[math.random(#h)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"打开藏宝箱获得:"..i);
--			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
--			server.info(10000,0,"勇士["..player:get_name().."]打开藏宝箱获得:"..i);
			return;
		end
		if z >= 996 and z <= 1000 then
			local i = l[math.random(#l)];
			player:add_item_log(i,222,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"打开藏宝箱获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]打开藏宝箱获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]打开藏宝箱获得:"..i);
			return;
		end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end
--//镇魔令
function zmlp(player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI) >= 0 then
		player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+1);
		player:alert(1,1,"镇魔令数量增加1,您现在有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令");
	else
		player:set_param(const.PP_SUOYAOTA_PAI,0);
		player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+1);
		player:alert(1,1,"镇魔令数量增加1,您现在有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令");
	end
end
--//镇魔令
function zmlps(player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI) >= 0 then
		player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+10);
		player:alert(1,1,"镇魔令数量增加10,您现在有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令");
	else
		player:set_param(const.PP_SUOYAOTA_PAI,0);
		player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+10);
		player:alert(1,1,"镇魔令数量增加10,您现在有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令");
	end
end
--//镇魔令
function zmlpb(player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI) >= 0 then
		player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+100);
		player:alert(1,1,"镇魔令数量增加100,您现在有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令");
	else
		player:set_param(const.PP_SUOYAOTA_PAI,0);
		player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+100);
		player:alert(1,1,"镇魔令数量增加100,您现在有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令");
	end
end
--//镇魔令 
function zmlpbind(player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI1NUM) >= 10 then
		player:alert(1,1,"绑定的镇魔令每天限制使用10个,非绑定的镇魔令无使用限制!");
		return 0;
	else
		if util.ppn(player,const.PP_SUOYAOTA_PAI) >= 0 then
			player:set_param(const.PP_SUOYAOTA_PAI1NUM,util.ppn(player,const.PP_SUOYAOTA_PAI1NUM)+1);
			player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+1);
			player:alert(1,1,"镇魔令数量增加1个,您现在共有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令!");
		else
			player:set_param(const.PP_SUOYAOTA_PAI,0);
			player:set_param(const.PP_SUOYAOTA_PAI1NUM,util.ppn(player,const.PP_SUOYAOTA_PAI1NUM)+1);
			player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+1);
			player:alert(1,1,"镇魔令数量增加1个,您现在共有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令!");
		end
	end
end
--//镇魔令
function zmlpsbind(player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI2NUM) >= 5 then
		player:alert(1,1,"绑定的镇魔令包每天限制使用5个,非绑定的镇魔令包无使用限制!");
		return 0;
	else
		if util.ppn(player,const.PP_SUOYAOTA_PAI) >= 0 then
			player:set_param(const.PP_SUOYAOTA_PAI2NUM,util.ppn(player,const.PP_SUOYAOTA_PAI2NUM)+1);
			player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+10);
			player:alert(1,1,"镇魔令数量增加10个,您现在共有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令!");
		else
			player:set_param(const.PP_SUOYAOTA_PAI,0);
			player:set_param(const.PP_SUOYAOTA_PAI2NUM,util.ppn(player,const.PP_SUOYAOTA_PAI2NUM)+1);
			player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+10);
			player:alert(1,1,"镇魔令数量增加10个,您现在共有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令!");
		end
	end
end
--//镇魔令
function zmlpbbind(player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI3NUM) >= 3 then
		player:alert(1,1,"绑定的镇魔令大包每天限制使用3个,非绑定的镇魔令大包无使用限制!");
		return 0;
	else
		if util.ppn(player,const.PP_SUOYAOTA_PAI) >= 0 then
			player:set_param(const.PP_SUOYAOTA_PAI3NUM,util.ppn(player,const.PP_SUOYAOTA_PAI3NUM)+1);
			player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+100);
			player:alert(1,1,"镇魔令数量增加100个,您现在共有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令!");
		else
			player:set_param(const.PP_SUOYAOTA_PAI,0);
			player:set_param(const.PP_SUOYAOTA_PAI3NUM,util.ppn(player,const.PP_SUOYAOTA_PAI3NUM)+1);
			player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)+100);
			player:alert(1,1,"镇魔令数量增加100个,您现在共有"..util.ppn(player,const.PP_SUOYAOTA_PAI).."个镇魔令!");
		end
	end
end






function smzongzi(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local e = {"四级宝石","五级宝石","完美的混天头盔·武威","完美的混天头盔·烈焰","完美的混天头盔·无极","完美的混天项链·武威","完美的混天项链·烈焰","完美的混天项链·无极","完美的混天护腕·武威","完美的混天护腕·烈焰","完美的混天护腕·无极","完美的混天戒指·武威","完美的混天戒指·烈焰","完美的混天戒指·无极","完美的混天腰带·武威","完美的混天腰带·烈焰","完美的混天腰带·无极","完美的混天靴·武威","完美的混天靴·烈焰","完美的混天靴·无极","混天镇元甲·武威","混天镇元甲·烈焰","混天镇元甲·无极","混天镇元衣·武威","混天镇元衣·烈焰","混天镇元衣·无极","承影剑·武威","承影剑·武威","承影剑·武威"};
		local f = {"五级宝石","六级宝石","完美的潜龙头盔·武威","完美的潜龙头盔·烈焰","完美的潜龙头盔·无极","完美的潜龙项链·武威","完美的潜龙项链·烈焰","完美的潜龙项链·无极","完美的潜龙护腕·武威","完美的潜龙护腕·烈焰","完美的潜龙护腕·无极","完美的潜龙戒指·武威","完美的潜龙戒指·烈焰","完美的潜龙戒指·无极","完美的潜龙腰带·武威","完美的潜龙腰带·烈焰","完美的潜龙腰带·无极","完美的潜龙靴·武威","完美的潜龙靴·烈焰","完美的潜龙靴·无极","潜龙吟渊甲·武威","潜龙吟渊甲·烈焰","潜龙吟渊甲·无极","潜龙吟渊衣·武威","潜龙吟渊衣·烈焰","潜龙吟渊衣·无极","炙炎刀·武威","炙炎刀·烈焰","炙炎刀·无极"};
		local g = {"六级宝石","七级宝石","完美的无双头盔·武威","完美的无双头盔·烈焰","完美的无双头盔·无极","完美的无双项链·武威","完美的无双项链·烈焰","完美的无双项链·无极","完美的无双护腕·武威","完美的无双护腕·烈焰","完美的无双护腕·无极","完美的无双戒指·武威","完美的无双戒指·烈焰","完美的无双戒指·无极","完美的无双腰带·武威","完美的无双腰带·烈焰","完美的无双腰带·无极","完美的无双靴·武威","完美的无双靴·烈焰","完美的无双靴·无极","无双传说甲·武威","无双传说甲·烈焰","无双传说甲·无极","无双传说衣·武威","无双传说衣·烈焰","无双传说衣·无极","破空斩·武威","破空斩·烈焰","破空斩·无极","完美的至尊头盔·武威","完美的至尊头盔·烈焰","完美的至尊头盔·无极","完美的至尊项链·武威","完美的至尊项链·烈焰","完美的至尊项链·无极","完美的至尊护腕·武威","完美的至尊护腕·烈焰","完美的至尊护腕·无极","完美的至尊戒指·武威","完美的至尊戒指·烈焰","完美的至尊戒指·无极","完美的至尊腰带·武威","完美的至尊腰带·烈焰","完美的至尊腰带·无极","完美的至尊靴·武威","完美的至尊靴·烈焰","完美的至尊靴·无极","至尊王者甲·武威","至尊王者甲·烈焰","至尊王者甲·无极","至尊王者衣·武威","至尊王者衣·烈焰","至尊王者衣·无极","帝陨剑·武威","帝陨剑·烈焰","帝陨剑·无极"};
		local h = {"七级宝石","八级宝石","九级宝石","车骑将军头盔","骠骑将军护腕","完美的天龙头盔·武威","完美的天龙头盔·烈焰","完美的天龙头盔·无极","完美的天龙护腕·武威","完美的天龙护腕·烈焰","完美的天龙护腕·无极","完美的天龙戒指·武威","完美的天龙戒指·烈焰","完美的天龙戒指·无极","完美的天龙腰带·武威","完美的天龙腰带·烈焰","完美的天龙腰带·无极","完美的天龙靴·武威","完美的天龙靴·烈焰","完美的天龙靴·无极","游龙惊鸿甲·武威","游龙惊鸿甲·烈焰","游龙惊鸿甲·无极","游龙惊鸿衣·武威","游龙惊鸿衣·烈焰","游龙惊鸿衣·无极","游龙惊鸿·武威","游龙惊鸿·烈焰","游龙惊鸿·无极","完美的三皇头盔·武威","完美的三皇头盔·烈焰","完美的三皇头盔·无极","完美的三皇护腕·武威","完美的三皇护腕·烈焰","完美的三皇护腕·无极","完美的三皇戒指·武威","完美的三皇戒指·烈焰","完美的三皇戒指·无极","完美的三皇腰带·武威","完美的三皇腰带·烈焰","完美的三皇腰带·无极","完美的三皇靴·武威","完美的三皇靴·烈焰","完美的三皇靴·无极","三皇震天甲·武威","三皇震天甲·烈焰","三皇震天甲·无极","三皇震天衣·武威","三皇震天衣·烈焰","三皇震天衣·无极","刑天之逆·武威","刑天之逆·烈焰","刑天之逆·无极","抚国大将军戒","镇国大将军链","兵马大元帅盔"};
			if z >= 1 and z <= 500 then
				local i = e[math.random(#e)];
				player:add_item(i,1);
				player:alert(11,1,"打开装备宝箱获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 501 and z <= 800 then
				local i = f[math.random(#f)];
				player:add_item(i,1);
				player:alert(11,1,"打开装备宝箱获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 801 and z <= 980 then
				local i = g[math.random(#g)];
				player:add_item(i,1);
				player:alert(1,1,"打开装备宝箱获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]打开装备宝箱获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 981 and z <= 1000 then
				local i = h[math.random(#h)];
				player:add_item(i,1);
				player:alert(1,1,"打开装备宝箱获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]打开装备宝箱获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]打开装备宝箱获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end


function zdqlwksjj(player)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == 49001 then
			if player:num_item("兵马大元帅盔",1) >= 1 then
				local result = player:remove_item_by_type_pos(ittype_id,0);
				if result == 0 then
				--player:remove_item("兵马大元帅盔",1);
				player:add_item_log("镇东青龙王盔",223,1);
				player:set_item_data(49002,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
				player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级[镇东青龙王盔]!</font>");
				end
			else
				player:alert(1,1,"你连[兵马大元帅盔]都没有,我怎么给您升级呢?!");
				return 0;
			end
		else
			player:alert(1,1,"请将要升级的[兵马大元帅盔]放在您包裹里的第1个格子里!");
			return 0;
		end
	else
		player:alert(1,1,"请将要升级的[兵马大元帅盔]放在您包裹里的第1个格子里!");
		return 0;
	end
end


function znzqwlsjj(player)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == 79000 then
			if player:num_item("镇国大将军链",1) >= 1 then
				local result = player:remove_item_by_type_pos(ittype_id,0);
				if result == 0 then
				--player:remove_item("镇国大将军链",1);
				player:add_item_log("镇南朱雀王链",223,1);
				player:set_item_data(79001,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
				player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级[镇南朱雀王链]!</font>");
				end
			else
				player:alert(1,1,"你连[镇国大将军链]都没有,我怎么给您升级呢?!");
				return 0;
			end
		else
			player:alert(1,1,"请将要升级的[镇国大将军链]放在您包裹里的第1个格子里!");
			return 0;
		end
	else
		player:alert(1,1,"请将要升级的[镇国大将军链]放在您包裹里的第1个格子里!");
		return 0;
	end
end


function zxbhwjsjj(player)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == 59000 then
			if player:num_item("抚国大将军戒",1) >= 1 then
				local result = player:remove_item_by_type_pos(ittype_id,0);
				if result == 0 then
				--player:remove_item("抚国大将军戒",1);
				player:add_item_log("镇西白虎王戒",223,1);
				player:set_item_data(59001,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
				player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级[镇西白虎王戒]!</font>");
				end
			else
				player:alert(1,1,"你连[抚国大将军戒]都没有,我怎么给您升级呢?!");
				return 0;
			end
		else
			player:alert(1,1,"请将要升级的[抚国大将军戒]放在您包裹里的第1个格子里!");
			return 0;
		end
	else
		player:alert(1,1,"请将要升级的[抚国大将军戒]放在您包裹里的第1个格子里!");
		return 0;
	end
end


function zbxwwwsjj(player)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == 69000 then
			if player:num_item("骠骑将军护腕",1) >= 1 then
				local result = player:remove_item_by_type_pos(ittype_id,0);
				if result == 0 then
				--player:remove_item("骠骑将军护腕",1);
				player:add_item_log("镇北玄武王腕",223,1);
				player:set_item_data(69001,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
				player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级[镇北玄武王腕]!</font>");
				end
			else
				player:alert(1,1,"你连[骠骑将军护腕]都没有,我怎么给您升级呢?!");
				return 0;
			end
		else
			player:alert(1,1,"请将要升级的[骠骑将军护腕]放在您包裹里的第1个格子里!");
			return 0;
		end
	else
		player:alert(1,1,"请将要升级的[骠骑将军护腕]放在您包裹里的第1个格子里!");
		return 0;
	end
end

--//玄晶礼包
function xuanjingbx(player)
        if util.ppn(player,const.PP_XUANJING1J_NUM) >= 1 then
		player:alert(1,1,"一级玄晶宝箱（绑）每天只可以使用1个!");
		return 0;
	else
	        if player:num_bag_black() >= 1 then
				player:set_param(const.PP_XUANJING1J_NUM,util.ppn(player,const.PP_XUANJING1J_NUM)+1);
				player:add_item_log("一级攻击玄晶",245,1,0);
				player:add_item_log("一级物防玄晶",245,1,0);
				player:add_item_log("一级魔防玄晶",245,1,0);
				player:add_item_log("一级生命玄晶",245,1,0);
				player:alert(1,1,"获得[一级攻击玄晶*1，一级物防玄晶*1，一级魔防玄晶*1，一级生命玄晶*1]");
		else
			player:alert(1,1,"您的背包空格不足1格,你也不想玄晶掉下地吧?!");
			return 0;
		end
	end
end

function yijixuanjingbx(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,1000);
			if z >= 1 and z <= 250 then
				player:add_item_log("一级攻击玄晶",245,1,1);
				player:alert(1,1,"成功打开玄晶宝箱,获得[一级攻击玄晶]");
			return;
			end
			if z >= 501 and z <= 500 then
				player:add_item_log("一级物防玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[一级物防玄晶]");
			return;
			end
			if z >= 801 and z <= 750 then
				player:add_item_log("一级魔防玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[一级魔防玄晶]");
			return;
			end
			if z >= 976 and z <= 1000 then
				player:add_item_log("一级生命玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[一级生命玄晶]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想玄晶掉下地吧?!");
		return 0;
	end
end

function erjixuanjingbx(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,1000);
			if z >= 1 and z <= 250 then
				player:add_item_log("二级攻击玄晶",245,1,1);
				player:alert(1,1,"成功打开玄晶宝箱,获得[二级攻击玄晶]");
			return;
			end
			if z >= 501 and z <= 500 then
				player:add_item_log("二级物防玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[二级物防玄晶]");
			return;
			end
			if z >= 801 and z <= 750 then
				player:add_item_log("二级魔防玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[二级魔防玄晶]");
			return;
			end
			if z >= 976 and z <= 1000 then
				player:add_item_log("二级生命玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[二级生命玄晶]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想玄晶掉下地吧?!");
		return 0;
	end
end

function sanjixuanjingbx(player)
	if player:num_bag_black() >= 1 then
			local z = math.random(1,1000);
			if z >= 1 and z <= 250 then
				player:add_item_log("三级攻击玄晶",245,1,1);
				player:alert(1,1,"成功打开玄晶宝箱,获得[三级攻击玄晶]");
			return;
			end
			if z >= 501 and z <= 500 then
				player:add_item_log("三级物防玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[三级物防玄晶]");
			return;
			end
			if z >= 801 and z <= 750 then
				player:add_item_log("三级魔防玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[三级魔防玄晶]");
			return;
			end
			if z >= 976 and z <= 1000 then
				player:add_item_log("三级生命玄晶",245,1,1);
				player:alert(1,1,"恭喜您成功打开玄晶宝箱,获得[三级生命玄晶]");
			return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想玄晶掉下地吧?!");
		return 0;
	end
end

local ygfx_bx_data={
[1]={
	[1]={name="一级攻击玄晶",id=10224},
        [2]={name="一级物防玄晶",id=10236},
        [3]={name="一级魔防玄晶",id=10248},
	[4]={name="一级生命玄晶",id=10260},
	},
[2]={
        [1]={name="二级攻击玄晶",id=10225},
        [2]={name="二级物防玄晶",id=10237},
	[3]={name="二级魔防玄晶",id=10249},
        [4]={name="二级生命玄晶",id=10261},
	},
[3]={
        [1]={name="三级攻击玄晶",id=10226},
	[2]={name="三级物防玄晶",id=10238},
        [3]={name="三级魔防玄晶",id=10250},
        [4]={name="三级生命玄晶",id=10262},
	},
[4]={
	[1]={name="破天斩(1级)",id=10272},
        [2]={name="龙息气焰(1级)",id=10278},
        [3]={name="气功波(1级)",id=10284},
	},
};


function ygfxqtbx(player)
	local num = util.ppn(player,const.PP_YGFXBX);
	if num < 20 then
		if player:num_bag_black() >= 1 then		
			player:set_param(const.PP_YGFXBX,util.ppn(player,const.PP_YGFXBX)+1);
			player:alert(10,0,"您今天已经打开<font color='#ff0000'>["..util.ppn(player,const.PP_YGFXBX).."]<font color='#EDED32'>个玄晶宝箱");
			local m_data = ygfx_bx_data[1];
			local z = math.random(1,4);
			player:add_item_log(m_data[z].name,245,1,1);
			player:alert(11,1,"青铜玄晶宝箱:<font color='#10DA2F'>"..m_data[z].name.."<font color='#10DA2F'>*1");
		else
			player:alert(1,1,"您的背包空格不足1格,你也不想宝物掉下地吧?!");
			return 0;
		end
	else
		player:alert(1,0,"您今天已经开启了["..util.ppn(player,const.PP_YGFXBX).."]个玄晶宝箱!<br>建议您留到明天再开启!<br>");
		return 0;
	end
end


function ygfxbybx(player)
	local num = util.ppn(player,const.PP_YGFXBX);
	if num < 20 then
		if player:num_bag_black() >= 2 then
			player:set_param(const.PP_YGFXBX,util.ppn(player,const.PP_YGFXBX)+1);
			player:alert(10,0,"您今天已经打开<font color='#ff0000'>["..util.ppn(player,const.PP_YGFXBX).."]<font color='#EDED32'>个玄晶宝箱");
			local m_data = ygfx_bx_data[2];
			local z = math.random(1,4);
			local y =  math.random(1,4);
			player:add_item_log(m_data[z].name,245,1,1);
			player:alert(11,1,"白银玄晶宝箱:<font color='#10DA2F'>"..m_data[z].name.."<font color='#10DA2F'>*1");
			if y==3  then
				local n = math.random(1,3);
				player:add_item_log(ygfx_bx_data[4][n].name,245,1,1);
				player:alert(11,1,"白银玄晶宝箱:<font color='#10DA2F'>"..ygfx_bx_data[4][n].name.."<font color='#10DA2F'>*1");
			end
		else
			player:alert(1,1,"您的背包空格不足2格,你也不想宝物掉下地吧?!");
			return 0;
		end
	else
		player:alert(1,0,"您今天已经开启了["..util.ppn(player,const.PP_YGFXBX).."]个玄晶宝箱!<br>建议您留到明天再开启!<br>");
		return 0;
	end
end


function ygfxhjbx(player)
	local num = util.ppn(player,const.PP_YGFXBX);
	if num < 20 then
		if player:num_bag_black() >= 2 then
			player:set_param(const.PP_YGFXBX,util.ppn(player,const.PP_YGFXBX)+1);
			player:alert(10,0,"您今天已经打开<font color='#ff0000'>["..util.ppn(player,const.PP_YGFXBX).."]<font color='#EDED32'>个玄晶宝箱");
			local m_data = ygfx_bx_data[3];
			local z = math.random(1,4);
			local n = math.random(1,3);
			player:add_item_log(m_data[z].name,245,1,1);
			player:alert(11,1,"黄金玄晶宝箱:<font color='#10DA2F'>"..m_data[z].name.."<font color='#10DA2F'>*1");
			player:add_item_log(ygfx_bx_data[4][n].name,245,1,1);
			player:alert(11,1,"黄金玄晶宝箱:<font color='#10DA2F'>"..ygfx_bx_data[4][n].name.."<font color='#10DA2F'>*1");
		else
			player:alert(1,1,"您的背包空格不足2格,你也不想宝物掉下地吧?!");
			return 0;
		end
	else
		player:alert(1,0,"您今天已经开启了[<font color='#ff0000'>"..util.ppn(player,const.PP_YGFXBX).."]个玄晶宝箱!<br>建议您留到明天再开启!<br>");
		return 0;
	end
end

function xiaoxingbsbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"六级宝石"};
		local d = {"七级宝石"};
		local e = {"八级宝石"};
			if z >= 1 and z <= 800 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开小型宝石宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开小型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 801 and z <= 950 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开小型宝石宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开小型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 951 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开小型宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开小型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开小型宝石宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function zhongxingbsbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"七级宝石"};
		local d = {"八级宝石"};
		local e = {"九级宝石"};
			if z >= 1 and z <= 800 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开中型宝石宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开中型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 801 and z <= 950 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开中型宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开中型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开中型宝石宝箱,获得:"..i);
				return;
			end
			if z >= 951 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开中型宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开中型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开中型宝石宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function daxingbsbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"八级宝石"};
		local d = {"九级宝石"};
		local e = {"十级宝石"};
			if z >= 1 and z <= 900 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开大型宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开大型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开大型宝石宝箱,获得:"..i);
				return;
			end
			if z >= 901 and z <= 990 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开大型宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开大型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开大型宝石宝箱,获得:"..i);
				return;
			end
			if z >= 991 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开大型宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开大型宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开大型宝石宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function chaojibsbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"九级宝石"};
		local d = {"十级宝石"};
		local e = {"十一级宝石"};
			if z >= 1 and z <= 900 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开超级宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开超级宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开超级宝石宝箱,获得:"..i);
				return;
			end
			if z >= 901 and z <= 990 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开超级宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开超级宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开超级宝石宝箱,获得:"..i);
				return;
			end
			if z >= 991 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开超级宝石宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开超级宝石宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开超级宝石宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function sbjyk15(player)
	if player:num_item("双倍经验卡(15天)",1) >= 1 then
		player:set_status(76,1296000,10000,1,11);
		--player:remove_item("双倍经验卡(15天)",1);
		player:alert(1,1,"您成功获得15天双倍经验");
	else
		player:alert(1,1,"对不起,您的背包没有双倍经验卡(15天),覆盖失败!");
	end
end
function sbjyk10(player)
	if player:num_item("双倍经验卡(10天)",1) >= 1 then
		player:set_status(76,864000,10000,1,11);
		--player:remove_item("双倍经验卡(10天)",1);
		player:alert(1,1,"您成功获得10天双倍经验");
	else
		player:alert(1,1,"对不起,您的背包没有双倍经验卡(10天),覆盖失败!");
	end
end
function sbjyk7(player)
	if player:num_item("双倍经验卡(7天)",1) >= 1 then
		player:set_status(76,604800,10000,1,11);
		--player:remove_item("双倍经验卡(7天)",1);
		player:alert(1,1,"您成功获得7天双倍经验");
	else
		player:alert(1,1,"对不起,您的背包没有双倍经验卡(7天),覆盖失败!");
	end
end
function sbjyk5(player)
	if player:num_item("双倍经验卡(5天)",1) >= 1 then
		player:set_status(76,432000,10000,1,11);
		--player:remove_item("双倍经验卡(5天)",1);
		player:alert(1,1,"您成功获得5天双倍经验");
	else
		player:alert(1,1,"对不起,您的背包没有双倍经验卡(5天),覆盖失败!");
	end
end
function sbjyk3(player)
	if player:num_item("双倍经验卡(3天)",1) >= 1 then
		player:set_status(76,259200,10000,1,11);
		--player:remove_item("双倍经验卡(3天)",1);
		player:alert(1,1,"您成功获得3天双倍经验");
	else
		player:alert(1,1,"对不起,您的背包没有双倍经验卡(3天),覆盖失败!");
	end
end
function getmrk(player)
	if player:num_item("名人卡",1) >= 1 then
		player:set_param(const.PP_37WAN_MR_TAG,1);--设置玩家登录提示名人上线了
		player:set_mrt(1);
		local dqsj = tonumber(os.date("%Y%m%d",(today()+30)*60*60*24));
		player:set_param(const.PP_37WAN_MR_DQSJ,dqsj);
		player:alert(1,1,"您成功获得名人卡");
	else
		player:alert(1,1,"对不起,您的背包没有名人卡,覆盖失败!");
	end
end

function xiaoxingxjbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶"};
		local d = {"六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶"};
		local e = {"七级生命玄晶","七级攻击玄晶","七级物防玄晶","七级魔防玄晶"};
			if z >= 1 and z <= 800 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开小型玄晶宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开小型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 801 and z <= 950 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开小型玄晶宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开小型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 951 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开小型玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开小型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开小型玄晶宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function zhongxingxjbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶"};
		local d = {"七级生命玄晶","七级攻击玄晶","七级物防玄晶","七级魔防玄晶"};
		local e = {"八级生命玄晶","八级攻击玄晶","八级物防玄晶","八级魔防玄晶"};
			if z >= 1 and z <= 800 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开中型玄晶宝箱,获得:"..i);
				player:alert(10,0,"恭喜您成功打开中型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				return;
			end
			if z >= 801 and z <= 950 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开中型玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开中型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开中型玄晶宝箱,获得:"..i);
				return;
			end
			if z >= 951 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开中型玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开中型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开中型玄晶宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function daxingxjbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"七级生命玄晶","七级攻击玄晶","七级物防玄晶","七级魔防玄晶"};
		local d = {"八级生命玄晶","八级攻击玄晶","八级物防玄晶","八级魔防玄晶"};
		local e = {"九级生命玄晶","九级攻击玄晶","九级物防玄晶","九级魔防玄晶"};
			if z >= 1 and z <= 900 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开大型玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开大型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开大型玄晶宝箱,获得:"..i);
				return;
			end
			if z >= 901 and z <= 990 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开大型玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开大型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开大型玄晶宝箱,获得:"..i);
				return;
			end
			if z >= 991 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开大型玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开大型玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开大型玄晶宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function chaojixjbx(player)
	if player:num_bag_black() >= 1 then
		local z = math.random(1,1000);
		local b = {"八级生命玄晶","八级攻击玄晶","八级物防玄晶","八级魔防玄晶"};
		local d = {"九级生命玄晶","九级攻击玄晶","九级物防玄晶","九级魔防玄晶"};
		local e = {"十级生命玄晶","十级攻击玄晶","十级物防玄晶","十级魔防玄晶"};
			if z >= 1 and z <= 900 then
				local i = b[math.random(#b)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开超级玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开超级玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开超级玄晶宝箱,获得:"..i);
				return;
			end
			if z >= 901 and z <= 990 then
				local i = d[math.random(#d)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开超级玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开超级玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开超级玄晶宝箱,获得:"..i);
				return;
			end
			if z >= 991 and z <= 1000 then
				local i = e[math.random(#e)];
				player:add_item_log(i,217,1,1);
				player:alert(1,1,"恭喜您成功打开超级玄晶宝箱,获得:"..i);
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开超级玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
				server.info(10000,0,"勇士["..player:get_name().."]成功打开超级玄晶宝箱,获得:"..i);
				return;
			end
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function shijixjbx(player)
	if player:num_bag_black() >= 1 then
		local b = {"十级生命玄晶","十级攻击玄晶","十级物防玄晶","十级魔防玄晶"};
		local i = b[math.random(#b)];
		player:add_item_log(i,217,1,1);
		player:alert(1,1,"恭喜您成功打开十级玄晶宝箱,获得:"..i);
		server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]成功打开十级玄晶宝箱,获得:<font color='#ff0000'>"..i.."</font>");
		server.info(10000,0,"勇士["..player:get_name().."]成功打开十级玄晶宝箱,获得:"..i);
		return;
	else
		player:alert(1,1,"您的背包空格不足1格,你也不想好东西掉下地吧?!");
		return 0;
	end
end

function cjzqd(player)   -- 超级坐骑丹
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zjie >= 16 then player:alert(1,1,"坐骑已经满级"); return 0; end
	local zxing = util.ppn(player,const.PP_NEW_ZUOQI_XING_LEVEL);
	local zexp = util.ppn(player,const.PP_NEW_ZUOQI_EXP);
	local bjzqd = util.ppn(player,const.PP_BAOJI_ZUOQIDAN);
	local  mran = 1000;
	if bjzqd~=today() then
		mran = math.random(1, 1000);
	else
		mran = math.random(11, 1000);
	end
	if mran <=10 then
		player:set_param(const.PP_BAOJI_ZUOQIDAN,today());
		newgui.zuoqi.mountAddStar(player);
		newgui.zuoqi.mountAddExp(player,300000);
		player:alert(1,1,"鸿运当头大暴击，坐骑提升一星，并且获得坐骑经验 300000 点");
		server.info(10000,1,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]鸿运当头，成功使用超级坐骑丹,坐骑提升一星，并获得坐骑经验 300000");
	elseif mran<180 then
		newgui.zuoqi.mountAddExp(player,600000);
		player:alert(1,1,"运气不错，小暴击了一下，坐骑经验增加 600000 点");
	else
		newgui.zuoqi.mountAddExp(player,300000);
		player:alert(1,1,"坐骑经验增加 300000 点");
	end
end

function cjlhs(player)
	local bjzqd = util.ppn(player,const.PP_BAOJI_LINHUNSHI);
	local  mran = 1000;
	if bjzqd~=today() then
		mran = math.random(1, 1000);
	else
		mran = math.random(11, 1000);
	end
	if mran <=10 then
		player:set_param(const.PP_BAOJI_LINHUNSHI,today());
		newgui.fuse.fresh_zhuhun(player);
		player:push_ckpanel_data("fuse","panelfuse");
		player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+500)
		player:alert(11,1,"鸿运当头大暴击，获得 500 灵魂石,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
		server.info(10000,1,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]鸿运当头，成功使用超级灵魂石，获得 500 灵魂石");
	elseif mran<180 then
		player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+200);
		player:alert(1,1,"运气不错，小暴击了一下，获得灵魂石 200,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	else
		player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)+100);
		player:alert(1,1,"获得灵魂石 100,您共有装备灵魂石:"..util.ppn(player,const.PP_LINGHUNSHI_NUM).."");
	end
end

function cjjjsb(player)   -- 超级进阶石
	if player:num_bag_black() >= 2 then
		local jie = util.ppn(player,const.PP_SHENQI_JIELV);--阶
		local xing = util.ppn(player,const.PP_SHENQI_XINGLV);--星
		if jie >= 11 and xing>=10 then player:alert(1,1,"您当前已达到最高法宝等级"); return 0; end
		local bjzqd = util.ppn(player,const.PP_BAOJI_JINJIESHI);
		local  mran = 1000;
		if bjzqd~=today() then
			mran = math.random(1, 1000);
		else
			mran = math.random(11, 1000);
		end
		if mran <=10 then
			player:set_param(const.PP_BAOJI_JINJIESHI,today());
			newgui.shenqi.tishengyijifabao(player);
			player:alert(1,1,"鸿运当头大暴击，法宝提升一星，并且获得进阶石 100 颗");
			player:add_item("进阶石",100,1);
			server.info(10000,1,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]鸿运当头，成功使用超级进阶石包,法宝提升一星，并且获得进阶石 100 颗");
		elseif mran<180 then
			player:add_item("进阶石",200,1);
			player:alert(1,1,"运气不错，小暴击了一下，获得进阶石 200 颗");
		else
			player:add_item("进阶石",100,1);
			player:alert(1,1,"获得进阶石 100 颗");
		end
	else
		player:alert(1,1,"您的背包不足2格,不能使用此物品");
		return 0;
	end
end

function cjhj(player)   -- 超级魂晶
	local level = util.ppn(player,const.PP_LIANHUN_LEVEL);
	local xing = util.ppn(player,const.PP_LIANHUN_XING);
	--print(level,xing);
	if level >= 25 and xing >= 12 then
		player:alert(1,1,"下一转天命尚未开放!");return 0;
	end
		local bjzqd = util.ppn(player,const.PP_BAOJI_HUNJING);
		local  mran = 1000;
		if bjzqd~=today() then
			mran = math.random(1, 1000);
		else
			mran = math.random(11, 1000);
		end
		if mran <=10 then
			player:set_param(const.PP_BAOJI_HUNJING,today());
			newgui.lianhun.uplianhunlevel(player);
			player:alert(1,1,"鸿运当头大暴击，天命提升一星，并且获得真气 1000 点");
			player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+1000);
			server.info(10000,1,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]鸿运当头，成功使用超级真气丹，天命提升一星，并且获得真气 1000 点");
		elseif mran<180 then
			player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+2000);
			player:alert(1,1,"运气不错，小暴击了一下，获得真气 2000 点");
		else
			player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+1000);
			player:alert(1,1,"获得真气 1000 点");
		end
end

function cwjyd2000(player)
	local pp = util.ppn(player,const.PP_PET_ACTIVE_POS);
	if pp > 0 then
		local pet = player:find_pet_by_pos(pp);
		if pet then
			if pet:get_lv() >= 25 then
				newgui.pet.do_useExpDan(player,pp,20000000);
				player:set_panel_data("panelpet","panelpet","panel_visible","true");
				player:push_ckpanel_data("pet","panelpet");
			else
				player:alert(11,1,"守护等级需要达到25级!")return 0;
			end
		else
			player:alert(11,1,"该守护尚未拥有或未出战!")return 0;
		end
	else
		player:alert(11,1,"您尚未有守护出战!")return 0;
	end
end
function cwjyd5000(player)
	local pp = util.ppn(player,const.PP_PET_ACTIVE_POS);
	if pp > 0 then
		local pet = player:find_pet_by_pos(pp);
		if pet then
			if pet:get_lv() >= 60 then
				newgui.pet.do_useExpDan(player,pp,50000000);
				player:set_panel_data("panelpet","panelpet","panel_visible","true");
				player:push_ckpanel_data("pet","panelpet");
			else
				player:alert(11,1,"守护等级需要达到60级!")return 0;
			end
		else
			player:alert(11,1,"该守护尚未拥有或未出战!")return 0;
		end
	else
		player:alert(11,1,"您尚未有守护出战!")return 0;
	end
end
function cwjhdb(player)
	if util.ppn(player,const.PP_CWJHDB) ~= today()  then
		if player:num_bag_black() >= 1 then
			player:set_param(const.PP_CWJHDB,today());
			player:add_item("守护进化丹",1,1);
			player:alert(11,1,"成功打开守护进化丹包!");
			player:alert(11,0,"获得物品:守护进化丹*1");
		else
			player:alert(1,1,"您的背包不足1格,无法领取!");
			return 0;
		end
	else
		player:alert(1,1,"守护进化丹包每人每天只可使用一次!");
		return 0;
	end
end

function longdan(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
		end
		local pet = player:find_pet_by_pos(2);
		if not pet then
			player:add_pet(20000,2,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,2);
			player:set_outpet_pos(2);
			player:set_panel_data("panelpet","panelpet","panel_visible","true");
			newgui.pet.freshPetPanel(player,3);
			newgui.pet.freshPetPanel(player,2);
			player:recal_attr();
		else
			player:set_panel_data("panelpet","panelpet","panel_visible","true");
			newgui.pet.freshPetPanel(player,3);
			newgui.pet.freshPetPanel(player,2);
			player:recal_attr();
			player:alert(11,1,"您已激活该守护!");return 0;
		end
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function qiubite(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
		end
		local pet = player:find_pet_by_pos(3);
		if not pet then
			player:add_pet(30000,3,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,3);
			player:set_outpet_pos(3);
			player:set_panel_data("panelpet","panelpet","panel_visible","true");
			newgui.pet.freshPetPanel(player,2);
			newgui.pet.freshPetPanel(player,3);
			player:recal_attr();
		else
			player:set_panel_data("panelpet","panelpet","panel_visible","true");
			newgui.pet.freshPetPanel(player,2);
			newgui.pet.freshPetPanel(player,3);
			player:recal_attr();
			player:alert(11,1,"您已激活该守护!");return 0;
		end
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function yangtuo(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
		end
		local pet = player:find_pet_by_pos(4);
		if not pet then
			player:add_pet(40000,4,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,4);
			player:set_outpet_pos(4);
			player:set_panel_data("panelpet","panelpet","panel_visible","true");												
			newgui.pet.freshPetPanel(player,2);										
			newgui.pet.freshPetPanel(player,3);				
			newgui.pet.freshPetPanel(player,5);	
			newgui.pet.freshPetPanel(player,4);				
			player:recal_attr();
		else
			player:set_panel_data("panelpet","panelpet","panel_visible","true");																				
			newgui.pet.freshPetPanel(player,2);										
			newgui.pet.freshPetPanel(player,3);				
			newgui.pet.freshPetPanel(player,5);	
			newgui.pet.freshPetPanel(player,4);					
			player:recal_attr();
			player:alert(11,1,"您已激活该守护!");return 0;
		end
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function qilinguo(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);	
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
		end
		local pet = player:find_pet_by_pos(5);
		if not pet then
			player:add_pet(50000,5,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,5);
			player:set_outpet_pos(5);
			player:set_panel_data("panelpet","panelpet","panel_visible","true");											
			newgui.pet.freshPetPanel(player,2);										
			newgui.pet.freshPetPanel(player,3);	
			newgui.pet.freshPetPanel(player,4);										
			newgui.pet.freshPetPanel(player,5);	
			player:recal_attr();
		else
			player:set_panel_data("panelpet","panelpet","panel_visible","true");									
			newgui.pet.freshPetPanel(player,2);										
			newgui.pet.freshPetPanel(player,3);	
			newgui.pet.freshPetPanel(player,4);										
			newgui.pet.freshPetPanel(player,5);	
			player:recal_attr();
			player:alert(11,1,"您已激活该守护!");return 0;
		end
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function sibada(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);	
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
		end
		local pet = player:find_pet_by_pos(6);
		if not pet then
			player:add_pet(60000,6,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,6);
			player:set_outpet_pos(6);
			player:set_panel_data("panelpet","panelpet","panel_visible","true");											
			newgui.pet.freshPetPanel(player,2);										
			newgui.pet.freshPetPanel(player,3);	
			newgui.pet.freshPetPanel(player,4);										
			newgui.pet.freshPetPanel(player,5);
			newgui.pet.freshPetPanel(player,6);			
			player:recal_attr();
		else
			player:set_panel_data("panelpet","panelpet","panel_visible","true");									
			newgui.pet.freshPetPanel(player,2);										
			newgui.pet.freshPetPanel(player,3);	
			newgui.pet.freshPetPanel(player,4);										
			newgui.pet.freshPetPanel(player,5);
			newgui.pet.freshPetPanel(player,6);	
			player:recal_attr();
			player:alert(11,1,"您已激活该守护!");return 0;
		end
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function lingdang(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);	
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
			newgui.pet.freshPetPanel(player,1);	
		end
		local pet = player:find_pet_by_pos(7);
		if not pet then
			player:add_pet(70000,7,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,7);
			player:set_outpet_pos(7);
		else
			player:alert(11,1,"您已激活该守护!");return 0;
		end			
		player:set_panel_data("panelpet","panelpet","panel_visible","true");		
		newgui.pet.freshPetPanel(player,7);
		player:recal_attr();								
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function nianshou(player)
	local zjie = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);	
	if zjie >= 6 then
		local pet = player:find_pet_by_pos(1);
		if not pet then
			player:add_pet(10000,1,1,1,1,50,101);
			newgui.pet.freshPetPanel(player,1);	
		end
		local pet = player:find_pet_by_pos(8);
		if not pet then
			player:add_pet(80000,8,1,1,1,50,101);
			player:set_param(const.PP_PET_ACTIVE_POS,8);
			player:set_outpet_pos(8);
			player:set_panel_data("panelpet","panelpet","panel_visible","true");											
			newgui.pet.freshPetPanel(player,8);	
			player:recal_attr();
		else
			player:set_panel_data("panelpet","panelpet","panel_visible","true");									
			player:recal_attr();
			player:alert(11,1,"您已激活该守护!");return 0;
		end
		
	else
		player:alert(11,1,"坐骑等级达到6级后方可使用!");return 0;
	end
end

function superdan(player)
	local ps = util.ptpn(player,const.PTP_PET_ACTIVE_POS);
	if ps > 0 then
		local pet = player:find_pet_by_pos(ps);
		if pet then
			local ret = newgui.pet.add_quality_upgrade(player,ps,1);
			if ret == 0 then return 0;end
		else
			player:alert(11,1,"当前守护尚未激活!");return 0;
		end
	else
		player:alert(11,1,"当前守护尚未激活!");return 0;
	end
end

function cjcwjyd(player)
	local ps = util.ptpn(player,const.PTP_PET_ACTIVE_POS);
	if ps > 0 then
		local pet = player:find_pet_by_pos(ps);
		if pet then
			if pet:get_lv() >= 100 then
				player:alert(11,1,"当前守护已经满级!");return 0;
			end
			if pet:get_lv() < 50 then
				player:alert(11,1,"守护等级达到50级才能使用!");return 0;
			end
			-----------------
			local petbj = util.ppn(player,const.PP_BAOJI_CHONGWUDAN);
			local  mran = 1000;
			if petbj ~= today() then
				mran = math.random(1, 1000);
			else
				mran = math.random(11, 1000);
			end
			if mran <= 10 then
				player:set_param(const.PP_BAOJI_CHONGWUDAN,today());
				local ret = newgui.pet.do_useExpDan(player,ps,50000000);
				if ret == 0 then return 0;end
				player:alert(1,1,"鸿运当头大暴击,守护提升一级!");
				server.info(10000,1,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]鸿运当头,成功使用超级守护经验丹,守护提升一级,守护经验5000W!");
			elseif mran < 180 then
				local ret = newgui.pet.do_useExpDan(player,ps,100000000);
				if ret == 0 then return 0;end
				player:alert(1,1,"运气不错，小暴击了一下,守护经验一亿!");
			else
				local ret = newgui.pet.do_useExpDan(player,ps,50000000);
				if ret == 0 then return 0;end
				player:alert(1,1,"获得守护经验5000W!");
			end
		else
			player:alert(11,1,"当前守护尚未激活!");return 0;
		end
	else
		player:alert(11,1,"当前守护尚未激活!");return 0;
	end
end