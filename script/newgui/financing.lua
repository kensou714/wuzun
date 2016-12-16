module(..., package.seeall)
local ACTIONSET_NAME="financing";
local PANEL_ACTIONSET_NAME="panelfinancing";

local isMail = true;
local fanli_data = {
	[1]={
			date = 20140625,con=const.PP_LICAI_FANLI1,
	},
	[2]={
			date = 20140702,con=const.PP_LICAI_FANLI2,
	},
	[3]={
			date = 20140709,con=const.PP_LICAI_FANLI3,
	},
	[4]={
			date = 20140716,con=const.PP_LICAI_FANLI4,
	},
};
local jlwp_data = {
	[1]={
			needvcoin = 5000,con=const.PP_LICAI_LB1,djaward={
			},bdybaward = 500,needbags = 0,isUiSend=false,
	},
	[2]={
			needvcoin = 10000,con=const.PP_LICAI_LB2,djaward={
				[1] ={attr = "装备宝箱", sl = 2,typeid="10179"},
			},bdybaward = 1000,needbags = 1,isUiSend=false,
	},
	[3]={
			needvcoin = 50000,con=const.PP_LICAI_LB3,djaward={
				[1] ={attr = "装备宝箱", sl = 3,typeid="10179"},
				[2] ={attr = "进阶石", sl = 100,typeid="10209"},
			},bdybaward = 5000,needbags = 2,isUiSend=false,
	},
	[4]={
			needvcoin = 100000,con=const.PP_LICAI_LB4,djaward={
				[1] ={attr = "装备宝箱", sl = 5,typeid="10179"},
				[2] ={attr = "进阶石", sl = 200,typeid="10209"},
				[3] ={attr = "六级攻击玄晶", sl = 1,typeid="10229"},
			},bdybaward = 10000,needbags = 3,isUiSend=false,
	},
	[5]={
			needvcoin = 300000,con=const.PP_LICAI_LB5,djaward={
				[1] ={attr = "灵羽宝箱", sl = 2,typeid="10206"},
				[2] ={attr = "进阶石", sl = 500,typeid="10209"},
				[3] ={attr = "六级生命玄晶", sl = 1,typeid="10265"},
				[4] ={attr = "九级宝石", sl = 1,typeid="10143"},
			},bdybaward = 30000,needbags = 4,isUiSend=false,
	},
	[6]={
			needvcoin = 500000,con=const.PP_LICAI_LB6,djaward={
				[1] ={attr = "灵羽宝箱", sl = 3,typeid="10206"},
				[2] ={attr = "进阶石", sl = 1000,typeid="10209"},
				[3] ={attr = "七级攻击玄晶", sl = 1,typeid="10230"},
				[4] ={attr = "七级生命玄晶", sl = 1,typeid="10266"},
				[5] ={attr = "十级宝石", sl = 1,typeid="10144"},
			},bdybaward = 50000,needbags = 5,isUiSend=false,
	},
};

function process_panelfinancing(player,actionset,panelid,actionid,data)
	if string.sub(actionid,1,4) == "lqjl" then
		local index = tonumber(string.sub(actionid,5));
		if index > 0 then
			player:set_panel_data("panelmail","panelmail","panel_visible","true");
			player:push_ckpanel_data("mail","panelmail");
			--jlwp_data[index].isUiSend = true;
			fresh_panel_info(player);
		end		
		return;
	end
	if string.sub(actionid,1,4) == "lqfl" then
		local ind = tonumber(string.sub(actionid,5));
		if ind > 0 then
			getFanli(player,ind);
		end
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_panelfinancing);

function isSendMail()
	return isMail;
end
function isLicaiTime()
	if ymd() >= 20140618 and ymd() <= 20140716 or server.get_temp_var("licai1")=="1" then
		return true;
	end
end
function isLcczDay()
	if ymd() >= 20140618 and ymd() <= 20140624 or server.get_temp_var("licai1")=="1" then
		return true;
	else
		return false;
	end
end

function  setlicaicongzhi( player ,add)
	if util.ppn(player,const.PP_CONGZI_DAY) == today() then
		player:set_param(const.PP_LICAI_CONGZHI,util.ppn(player,const.PP_LICAI_CONGZHI)+add);	
		fresh_panel_info(player);
	end
end

function fresh_panel_info(player)
	local dqcz = util.ppn(player,const.PP_LICAI_CONGZHI);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ljczybs","text",dqcz.." 元宝");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"klqybs","text",(dqcz*0.1).." 元宝");
	for j=1,6 do
		local tempData = jlwp_data[j];
		if dqcz < tempData.needvcoin then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lqjl"..j,"label","不可领");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lqjl"..j,"grayFilter","true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lqjl"..j,"mouseEnabled","false");
		else
			if util.ppn(player,tempData.con) == 0 then				
				sendAward(player,j);
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lqjl"..j,"label","已发送");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lqjl"..j,"grayFilter","false");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"lqjl"..j,"mouseEnabled","true");
		end
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end
login.add_login_listener(fresh_panel_info);



function sendAward(player,index)
	local awardData = jlwp_data[index];
	local licaimoney = util.ppn(player,const.PP_LICAI_CONGZHI);
	if licaimoney >= awardData.needvcoin then
		if util.ppn(player,awardData.con) == 0 then
			if index == 1 then
				player:post_mail("理财活动奖励1","累计充值5000元宝道具奖励",19009,500);
			elseif index == 2 then
				player:post_mail("理财活动奖励2","累计充值10000元宝道具奖励",19009,1000,10179,2);
			elseif index == 3 then
				player:post_mail("理财活动奖励3","累计充值50000元宝道具奖励",19009,5000,10179,3,10209,100);
			elseif index == 4 then
				player:post_mail("理财活动奖励4","累计充值100000元宝道具奖励",19009,10000,10179,5,10209,200,10229,1);
			elseif index == 5 then
				player:post_mail("理财活动奖励5","累计充值300000元宝道具奖励",19009,30000,10206,2,10209,500,10265,1,10143,1);
			elseif index == 6 then
				player:post_mail("理财活动奖励6","累计充值500000元宝道具奖励",19009,50000,10206,3,10209,1000,10230,1,10266,1,10144,1);
			end
			player:set_param(awardData.con,1);
		end
	end
end

function getAward(player,index)
	local awardData = jlwp_data[index];
	local licaimoney = util.ppn(player,const.PP_LICAI_CONGZHI);
	if licaimoney >= awardData.needvcoin then
		if util.ppn(player,awardData.con) == 0 then
			if player:num_bag_black() >= awardData.needbags then
				local  awardwp = awardData.djaward;
				local  info = "恭喜您成功领取";
				for i=1,#awardwp do
					player:add_item(awardwp[i].attr,awardwp[i].sl,1);
					info=info.."<br>"..awardwp[i].attr.."        数量:"..awardwp[i].sl;
				end
				player:add_vcoin_bind(awardData.bdybaward);
				info= info.."<br>绑定元宝("..awardData.bdybaward..")";
				--server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]".."获得"..data.title.."!");
				player:alert(11,1,info);
				player:set_param(awardData.con,1);
			else
				player:alert(1,1,"您的背包不足"..awardData.needbags.."格,您也不想这些好东西都掉下地吧!");
			end
		else
			player:alert(1,1,"对不起,您已经领取过!");
		end
	else
		player:alert(1,1,"对不起,理财充值不足["..awardData.needvcoin.."],无法领取!");
	end
	fresh_panel_info(player);
end

function getFanli(player,index)
	local data = fanli_data[index];
	if ymd() >= data.date or server.get_temp_var("licai1")=="1" then
		if util.ppn(player,data.con) == 0 then
			local licaimoney = util.ppn(player,const.PP_LICAI_CONGZHI);
			local fanli = licaimoney * 0.1;
			player:add_vcoin_best_enable(math.floor(tonumber(fanli)));
			player:set_param(data.con,1);
		else
			player:alert(1,1,"对不起,此返利只能领取一次!");
		end
	else
		player:alert(1,1,"对不起,未到领取返利时间!");
	end	
end
function sendFanli(player,index)
	local data = fanli_data[index];
	if ymd() >= data.date or server.get_temp_var("licai1")=="1" then
		if util.ppn(player,data.con) == 0 then
			local licaimoney = util.ppn(player,const.PP_LICAI_CONGZHI);
			local fanli = licaimoney * 0.1;
			player:post_mail("理财活动返利","活动期间内充值，每隔一周后，可以领取10%的返利，总计140%!",19008,math.floor(tonumber(fanli)));
			player:set_param(data.con,1);
		end
	end	
end