module(..., package.seeall)
local ACTIONSET_NAME="newfanlishengdian";
local PANEL_ACTIONSET_NAME="panelnewfanlishengdian";

local award_data={
[1]={needcz=5000,tishi="充值5000元宝",con=const.PP_FANLISHENGDIAN_LEIJI5000,award={{"八级生命玄晶",1,1}}},
[2]={needcz=10000,tishi="充值10000元宝",con=const.PP_FANLISHENGDIAN_LEIJI10000,award={{"八级攻击玄晶",1,1}}},
[3]={needcz=100000,tishi="充值100000元宝",con=const.PP_FANLISHENGDIAN_LEIJI100000,award={{"九级攻击玄晶",1,1},{"九级生命玄晶",1,1}}},
[4]={needcz=300000,tishi="充值300000元宝",con=const.PP_FANLISHENGDIAN_LEIJI300000,award={{"十级物防玄晶",1,1},{"十级魔防玄晶",1,1}}},
[5]={needcz=500000,tishi="充值500000元宝",con=const.PP_FANLISHENGDIAN_LEIJI500000,award={{"十级攻击玄晶",1,1},{"十级生命玄晶",1,1},{"十一级魔防玄晶",1,1}}},
[6]={needcz=1500000,tishi="充值1500000元宝",con=const.PP_FANLISHENGDIAN_LEIJI1500000,award={{"十一级攻击玄晶",1,1},{"十一级生命玄晶",1,1},{"十一级物防玄晶",1,1}}},
};

function process_fanlishengdian(player,actionset,panelid,actionid,data)
	if string.sub(actionid,1,12) == "btnnewflsdlq" then
		local lv = tonumber(string.sub(actionid,13));
		flsdlingqu(player,lv);return;
	end
	if actionid == "btnnewflsdlingqu" then
		getyuanbao(player);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_fanlishengdian);

function getyuanbao(player,lv)
	if activity.isFanLiShengDian() then
		local linqu= util.ppn(player,const.PP_FANLISHENGDIAN_CZ);
		local rest = util.ppn(player,const.PP_DAILY_CONGZI)-linqu;

		if rest > 0 then
			local tmp = 0;
			tmp = rest*0.2;
			player:add_vcoin_best_enable(math.floor(tmp));
			player:alert(1,1,"恭喜你成功领取["..math.floor(tmp).."元宝]返利");
			player:set_param(const.PP_FANLISHENGDIAN_CZ,util.ppn(player,const.PP_DAILY_CONGZI));
		else
			player:alert(1,1,"您没有返利可以领取!");
		end
	else
		player:alert(1,1,"不在活动时间内!");
	end
	freshfanlishengdian(player);
	player:push_ckpanel_data("newfanlishengdian","panelnewfanlishengdian");
end

function flsdlingqu(player,lv)
	local item_data = award_data[lv].award;
	if activity.isFanLiShengDian()  then
		if util.ppn(player,const.PP_DAILY_CONGZI) >= award_data[lv].needcz then
			if util.ppn(player,award_data[lv].con) ~= 3 then
				player:set_param(award_data[lv].con,3);

				for i=1,#item_data do
					player:add_item(item_data[i][1],item_data[i][2],item_data[i][3]);
				end

				server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]领取【返利盛典】礼包![<a href='event:push_local_panelcdxiaoqian'><u><font color='#00FF00'>我要充值</font></u></a>]");
				if lv== 1 then 
					player:alert(11,1,"恭喜您成功领取【返利盛典】的5000元宝奖励<br>八级生命玄晶        数量:1");
				end
				if lv == 2 then 
					player:alert(11,1,"恭喜您成功领取【返利盛典】的10000元宝奖励<br>八级攻击玄晶	数量:1");
				end
				if lv == 3 then 
					player:alert(11,1,"恭喜您成功领取【返利盛典】的100000元宝奖励<br>九级攻击玄晶       数量:1<br>九级生命玄晶       数量:1");
				end
				if lv == 4 then 
					player:alert(11,1,"恭喜您成功领取【返利盛典】的300000元宝奖励<br>十级物防玄晶       数量:1<br>十级魔防玄晶       数量:1");
				end
				if lv == 5 then 
					player:alert(11,1,"恭喜您成功领取【返利盛典】的500000元宝奖励<br>十级攻击玄晶       数量:1<br>十级生命玄晶       数量:1<br>十一级魔防玄晶       数量:1");
				end
				if lv == 6 then 
					player:alert(11,1,"恭喜您成功领取【返利盛典】的1500000元宝奖励<br>十一级攻击玄晶    数量:1<br>十一级生命玄晶     数量:1<br>十一级物防玄晶       数量:1");
				end
			else
				player:alert(1,1,"您已经领取过该礼包，不能再次领取喔!")
			end
		else
			player:alert(1,1,"您未达到充值要求，无法领取该礼包!");
		end
	else
		player:alert(1,1,"不在活动时间内!");
	end
end

function freshfanlishengdian(player)
	player:set_panel_data("panelnewfanlishengdian","newflsdleijitxt","text",util.ppn(player,const.PP_DAILY_CONGZI).." 元宝");
	if activity.isFanLiShengDian()  then
		local tmp = (util.ppn(player,const.PP_DAILY_CONGZI)-util.ppn(player,const.PP_FANLISHENGDIAN_CZ))*0.2;
		player:set_panel_data("panelnewfanlishengdian","newflsdkeyitxt","text",tmp.." 元宝");	
	end	
end

function resetFanLiShengDian(player)
	if util.ppn(player,const.PP_FANLISHENGDIAN_FLAG)<activity.FLSD_BIAOSHI then
		player:set_param(const.PP_FANLISHENGDIAN_FLAG,activity.FLSD_BIAOSHI);
		player:set_param(const.PP_FANLISHENGDIAN_LEIJI5000,0);
		player:set_param(const.PP_FANLISHENGDIAN_LEIJI10000,0);
		player:set_param(const.PP_FANLISHENGDIAN_LEIJI100000,0);
		player:set_param(const.PP_FANLISHENGDIAN_LEIJI300000,0);
		player:set_param(const.PP_FANLISHENGDIAN_LEIJI500000,0);
		player:set_param(const.PP_FANLISHENGDIAN_LEIJI1500000,0);
		player:set_param(const.PP_FANLISHENGDIAN_CZ,0);
		--player:set_param(const.PP_FANLISHENGDIAN_TOTAL,0);
	end
end