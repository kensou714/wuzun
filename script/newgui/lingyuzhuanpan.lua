module(..., package.seeall)
--灵玉转盘面板
local ACTIONSET_NAME="lingyuzhuanpan";
local PANEL_ACTIONSET_NAME="panellingyuzhuanpan";

local TMP=0;

local award_data={
[1]={name="天书碎片",num="5000"},
[2]={name="天书碎片",num="1000"},
[3]={name="天书碎片",num="500"},
[4]={name="天书碎片",num="100"},
[5]={name="装备灵魂石(1000)",num="1"},
[6]={name="装备灵魂石(500)",num="1"},
[7]={name="装备灵魂石(100)",num="1"},
[8]={name="装备灵魂石(50)",num="1"},
[9]={name="天蚕丝",num="5000"},
[10]={name="天蚕丝",num="1000"},
[11]={name="天蚕丝",num="500"},
[12]={name="天蚕丝",num="100"},
};

function process_lingyuzhuanpan(player,actionset,panelid,actionid)
	if actionid == "btnlingyuone" then
		if activity.islingyuzhuanpan() then
			if player:num_bag_black()>=1 then
				if player:get_vcoin() >= 500 then
					player:sub_vcoin(500,"lingyuzhuanpanone");			
					getnum(player);
					zhuanlo(player,TMP-1);
					giveaward(player);
				else
					player:alert(11,1,"元宝不足500");
					return;
				end
			else 
				player:alert(11,1,"包裹空格不足1格,无法开启!");
			end
		else 
			player:alert(11,1,"非活动时间，谢谢参与");
		end
	end
	if actionid == "btnlingyuten" then
		if activity.islingyuzhuanpan() then
			if player:num_bag_black()>=10 then
				if player:get_vcoin() >= 4800 then
					player:sub_vcoin(4800,"lingyuzhuanpanten");	
					for i=1,10 do
						getnum(player);
						zhuanlo(player,TMP-1);
						giveaward(player);
					end
				else
					player:alert(11,1,"元宝不足4800");
					return;
				end
			else 
				player:alert(11,1,"包裹空格不足10格,无法开启!");
			end
		else 
			player:alert(11,1,"非活动时间，谢谢参与");
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lingyuzhuanpan);

function zhuanlo(player,num)
	player:set_panel_data("panellingyuzhuanpan","lyzpLogic","actiontype",num);
	player:push_ckpanel_data("lingyuzhuanpan","panellingyuzhuanpan");
end

function getnum(player)
	local z = math.random(1,100);
	if z >= 1 and z <= 3 then
		TMP = 1;
		return;
	end
	if z >= 4 and z <= 7 then
		TMP = 2;
		return;
	end
	if z >= 8 and z <= 13 then
		TMP = 3;
		return;
	end
	if z >= 14 and z <= 35 then
		TMP = 4;
		return;
	end
	if z >= 36 and z <= 37 then
		TMP = 5;
		return;
	end
	if z >= 38 and z <= 40 then
		TMP = 6;
		return;
	end
	if z >= 41 and z <= 51 then
		TMP = 7;
		return;
	end
	if z >= 52 and z <= 72 then
		TMP = 8;
		return;
	end
	if z == 73  then
		TMP = 9;
		return;
	end
	if z >= 74 and z <= 75 then
		TMP = 10;
		return;
	end
	if z >= 76 and z <= 80 then
		TMP = 11;
		return;
	end
	if z >= 81 and z <= 100 then
		TMP = 12;
		return;
	end
end

function giveaward(player)
	if TMP>= 1 and TMP<= 4 then
		--player:add_item(award_data[TMP].name,award_data[TMP].num,1);
		player:set_param(const.PP_TIANSHU_SUIPIAN,util.ppn(player,const.PP_TIANSHU_SUIPIAN)+award_data[TMP].num);
	end
	if TMP>= 5 and TMP<= 8 then
		player:add_item(award_data[TMP].name,award_data[TMP].num,1);
	end
	if TMP>= 9 and TMP<= 12 then
		player:set_param(const.PP_PERSONAL_TIANCAN,util.ppn(player,const.PP_PERSONAL_TIANCAN)+award_data[TMP].num);
	end
	player:alert(11,1,"通过灵玉转盘获得【"..award_data[TMP].name.."】".."   数量:"..award_data[TMP].num.."!");
	if TMP== 1 or TMP== 2 or TMP== 5 or TMP== 6 or TMP== 9 or TMP== 10 then
		server.info(10,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]通过灵玉转盘获得[<font color='#ff0000'>"..award_data[TMP].name.."*"..award_data[TMP].num.."</font>][<a href='event:push_local_panellingyuzhuanpan'><u><font color='#00FF00'>我要参与</font></u></a>]");
	end
end