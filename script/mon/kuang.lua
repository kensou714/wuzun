module(..., package.seeall)
function kuang(player,mon,group)
	if player:get_level() >= 40 then
		if util.ppn(player,const.PP_GUANZHI) == 1 and util.ppn(player,const.PP_WAKUANG) == 0 then
			player:set_param(const.PP_WAKUANG,1);
			player:add_item("金矿",1,1);
			player:alert(11,1,"采矿获得:<font color='#ff0000'>金矿</font>");
			return;
		end
		local i = math.random(1,1000);
		if player:num_bag_black() >= 1 then
			if i >= 1 and i <= 400 then
				player:add_item("铁矿",1,1);
				player:alert(11,1,"采矿获得:<font color='#ff0000'>铁矿</font>");
			end
			if i >= 401 and i <= 700 then
				player:add_item("铜矿",1,1);
				player:alert(11,1,"采矿获得:<font color='#ff0000'>铜矿</font>");
			end
			if i >= 701 and i <= 900 then
				player:add_item("银矿",1,1);
				player:alert(11,1,"采矿获得:<font color='#ff0000'>银矿</font>");
			end
			if i >= 901 and i <= 1000 then
				player:add_item("金矿",1,1);
				player:alert(11,1,"采矿获得:<font color='#ff0000'>金矿</font>");
			end
		else
		player:alert(1,1,"背包空格不足1格,未获得矿石!");
		end
	else
		player:alert(1,1,"以你现在的实力,还不能采集矿石!");
	end
end
ckmon.add_caiji_listener("矿石",kuang);

function startkuang(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在采矿中...");
end
ckmon.add_caijistart_listener("矿石",startkuang);




function kuang2(player,mon,group)
	if player:get_level() >= 40 then
		player:alert(11,1,"<font color='#ff0000'>此为任务矿,采矿请到[采矿区域]</font>");
		player:alert(11,0,"<font color='#ff0000'>使用快捷键[M]可打开小地图前往</font>");
	end
end
ckmon.add_caiji_listener("铁矿",kuang2);

function startkuang2(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在采矿中...");
end
ckmon.add_caijistart_listener("铁矿",startkuang2);


function yu1(player,mon,group)
	local h = os.date("%H%M",os.time());
	if tonumber(h) >= 1200 and tonumber(h) <= 1229 or tonumber(h) >= 1800 and tonumber(h) <= 1829 or server.get_temp_var("wenquan") == "1" then
		if player:get_level() >= 40 then
			local i = math.random(1,1000);
			if player:num_bag_black() >= 1 then
				if i >= 1 and i <= 400 then
					player:add_item("青鱼",1,1);
					player:alert(11,1,"成功捕获:<font color='#ff0000'>青鱼</font>");
				end
				if i >= 401 and i <= 700 then
					player:add_item("红虎鱼",1,1);
					player:alert(11,1,"成功捕获:<font color='#ff0000'>红虎鱼</font>");
				end
				if i >= 701 and i <= 900 then
					player:add_item("紫龙鱼",1,1);
					player:alert(11,1,"成功捕获:<font color='#ff0000'>紫龙鱼</font>");
				end
				if i >= 901 and i <= 1000 then
					player:add_item("帝龙鱼",1,1);
					player:alert(11,1,"成功捕获:<font color='#ff0000'>帝龙鱼</font>");
				end
			else
			player:alert(1,1,"背包空格不足1格,未抓到鱼!");
			end
		else
			player:alert(1,1,"以你现在的实力,还不能抓鱼!");
		end
	else
		player:go_home();
		player:alert(1,1,"泡温泉活动已经结束,无法抓鱼!");
	end
end

ckmon.add_caiji_listener("鱼",yu1);


function startbuzhuo(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在捕捉中...");
end
ckmon.add_caijistart_listener("鱼",startbuzhuo);




function bjshi(player,mon,group)
	if server.get_temp_var("BHDAO") == "1" then
		if player:num_bag_black() >= 2 then
			if util.ppn(player,const.PP_CAIJIKUANGSHI) <= 19 then
				local a = math.random(2,4);
				local b = math.random(1000,2000);
				local c = b*math.min(80,player:get_level())
				player:set_param(const.PP_CAIJIKUANGSHI,util.ppn(player,const.PP_CAIJIKUANGSHI)+1);
				player:add_exp(c);
				player:add_item("进阶石",a,1);
				player:alert(10,0,"成功采集[<font color='#ff0000'>冰晶石</font>]");
				player:alert(10,0,"获得:<font color='#ff0000'>进阶石*"..a.."</font>");
				player:alert(10,0,"获得:<font color='#ff0000'>经验值*"..c.."</font>");
				player:alert(10,0,"您今天已经采集("..util.ppn(player,const.PP_CAIJIKUANGSHI).."/20)次");
			else
			player:alert(11,1,"您今天已采集满20次,无法再采集!");
			end
		else
		player:alert(11,1,"背包空格不足2格,采集失败!");
		end
	else
	player:alert(1,1,"对不起,冰火岛活动没有开启,暂时无法采集!");
	player:go_home();
	end
end
ckmon.add_caiji_listener("冰晶石",bjshi);

function startbjshi(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在采集冰晶石...");
end
ckmon.add_caijistart_listener("冰晶石",startbjshi);


function bjshida(player,mon,group)
	if server.get_temp_var("BHDAO") == "1" then
		if player:num_bag_black() >= 2 then
			if util.ppn(player,const.PP_CAIJIKUANGSHI) <= 19 then
				local a = math.random(6,12);
				local b = math.random(3000,5000);
				local c = b*math.min(80,player:get_level())
				player:set_param(const.PP_CAIJIKUANGSHI,util.ppn(player,const.PP_CAIJIKUANGSHI)+1);
				player:add_exp(c);
				player:add_item("进阶石",a,1);
				player:alert(10,0,"成功采集[<font color='#ff0000'>巨型冰晶石</font>]");
				player:alert(10,0,"获得:<font color='#ff0000'>进阶石*"..a.."</font>");
				player:alert(10,0,"获得:<font color='#ff0000'>经验值*"..c.."</font>");
				player:alert(10,0,"您今天已经采集("..util.ppn(player,const.PP_CAIJIKUANGSHI).."/20)次");
			else
			player:alert(11,1,"您今天已采集满20次,无法再采集!");
			end
		else
		player:alert(11,1,"背包空格不足2格,采集失败!");
		end
	else
	player:alert(1,1,"对不起,冰火岛活动没有开启,暂时无法采集!");
	player:go_home();
	end
end
ckmon.add_caiji_listener("巨型冰晶石",bjshida);

function startbjshida(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在采集巨型冰晶石...");
end
ckmon.add_caijistart_listener("巨型冰晶石",startbjshida);


function hyshi(player,mon,group)
	if server.get_temp_var("BHDAO") == "1" then
		if player:num_bag_black() >= 2 then
			if util.ppn(player,const.PP_CAIJIKUANGSHI) <= 19 then
				local a = math.random(2,4);
				local b = math.random(1000,2000);
				local c = b*math.min(80,player:get_level())
				player:set_param(const.PP_CAIJIKUANGSHI,util.ppn(player,const.PP_CAIJIKUANGSHI)+1);
				player:add_exp(c);
				player:add_item("进阶石",a,1);
				player:alert(10,0,"成功采集[<font color='#ff0000'>火焰石</font>]");
				player:alert(10,0,"获得:<font color='#ff0000'>进阶石*"..a.."</font>");
				player:alert(10,0,"获得:<font color='#ff0000'>经验值*"..c.."</font>");
				player:alert(10,0,"您今天已经采集("..util.ppn(player,const.PP_CAIJIKUANGSHI).."/20)次");
			else
			player:alert(11,1,"您今天已采集满20次,无法再采集!");
			end
		else
		player:alert(11,1,"背包空格不足2格,采集失败!");
		end
	else
	player:alert(1,1,"对不起,冰火岛活动没有开启,暂时无法采集!");
	player:go_home();
	end
end
ckmon.add_caiji_listener("火焰石",hyshi);

function starthyshi(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在采集火焰石...");
end
ckmon.add_caijistart_listener("火焰石",starthyshi);


function hyshida(player,mon,group)
	if server.get_temp_var("BHDAO") == "1" then
		if player:num_bag_black() >= 2 then
			if util.ppn(player,const.PP_CAIJIKUANGSHI) <= 19 then
				local a = math.random(6,12);
				local b = math.random(2000,4000);
				local c = b*math.min(80,player:get_level())
				player:set_param(const.PP_CAIJIKUANGSHI,util.ppn(player,const.PP_CAIJIKUANGSHI)+1);
				player:add_exp(c);
				player:add_item("进阶石",a,1);
				player:alert(10,0,"成功采集[<font color='#ff0000'>巨型火焰石</font>]");
				player:alert(10,0,"获得:<font color='#ff0000'>进阶石*"..a.."</font>");
				player:alert(10,0,"获得:<font color='#ff0000'>经验值*"..c.."</font>");
				player:alert(10,0,"您今天已经采集("..util.ppn(player,const.PP_CAIJIKUANGSHI).."/20)次");
			else
			player:alert(11,1,"您今天已采集满20次,无法再采集!");
			end
		else
		player:alert(11,1,"背包空格不足2格,采集失败!");
		end
	else
	player:alert(1,1,"对不起,冰火岛活动没有开启,暂时无法采集!");
	player:go_home();
	end
end
ckmon.add_caiji_listener("巨型火焰石",hyshida);

function starthyshida(player,mon)
	--player:alert(1,1,"开启采集!");
	player:start_progress_bar(mon:get_caiji_duration(),"正在采集巨型火焰石...");
end
ckmon.add_caijistart_listener("巨型火焰石",starthyshida);

function colxxtjk(player,mon,group)
	if server.get_temp_var("tjzc") == "1" then
		if util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then
			player:set_param(const.PP_ZHANCHANG_CHETYPE,1);
			player:accept_dart_task("搬运小妖");
		else
			player:alert(11,1,"您当前已经采集成功,请先运送至矿石老板!");
		end
	else
		player:alert(1,1,"对不起,活动没有开启,暂时无法采集!");
		player:go_home();
	end
end
ckmon.add_caiji_listener("小型天晶矿",colxxtjk);

function coljxtjk(player,mon,group)
	if server.get_temp_var("tjzc") == "1" then
		if util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then
			player:set_param(const.PP_ZHANCHANG_CHETYPE,2);
			player:accept_dart_task("搬运巨兽");
		else
			player:alert(11,1,"您当前已经采集成功,请先运送至矿石老板!");
		end
	else
		player:alert(1,1,"对不起,活动没有开启,暂时无法采集!");
		player:go_home();
	end
end
ckmon.add_caiji_listener("巨型天晶矿",coljxtjk);


function startxxtjk(player,mon) player:start_progress_bar(mon:get_caiji_duration(),"正在采集小型天晶矿..."); end
ckmon.add_caijistart_listener("小型天晶矿",startxxtjk);

function startjxtjk(player,mon) player:start_progress_bar(mon:get_caiji_duration(),"正在采集巨型天晶矿..."); end
ckmon.add_caijistart_listener("巨型天晶矿",startjxtjk);