module(..., package.seeall)

local ACTIONSET_NAME="showproperty";
local PANEL_ACTIONSET_NAME="panelshowproperty";

local qf_data={
	[1]={name="金",bgid=4222,stat=51,info="攻击",attr={
		[1]={bg=4242,mul=1,tips="1级金属性<br><br>攻击属性增加: 6-10"},
		[2]={bg=4243,mul=2,tips="2级金属性<br><br>攻击属性增加: 12-20"},
		[3]={bg=4244,mul=6,tips="3级金属性<br><br>攻击属性增加: 36-60"},
		[4]={bg=4245,mul=18,tips="4级金属性<br><br>攻击属性增加: 108-180"},
		[5]={bg=4246,mul=54,tips="5级金属性<br><br>攻击属性增加: 324-540"},
		},
	},
	[2]={name="木",bgid=4223,stat=52,info="魔防",attr={
		[1]={bg=4247,mul=1,tips="1级木属性<br><br>魔法防御增加: 3-6"},
		[2]={bg=4248,mul=2,tips="2级木属性<br><br>魔法防御增加: 6-12"},
		[3]={bg=4249,mul=6,tips="3级木属性<br><br>魔法防御增加: 18-36"},
		[4]={bg=4250,mul=18,tips="4级木属性<br><br>魔法防御增加: 54-108"},
		[5]={bg=4251,mul=54,tips="5级木属性<br><br>魔法防御增加: 162-324"},
		},
	},
	[3]={name="水",bgid=4224,stat=53,info="生命",attr={
		[1]={bg=4252,mul=1,tips="1级水属性<br><br>生命上限增加: 1%"},
		[2]={bg=4253,mul=2,tips="2级水属性<br><br>生命上限增加: 2%"},
		[3]={bg=4254,mul=4,tips="3级水属性<br><br>生命上限增加: 4%"},
		[4]={bg=4255,mul=8,tips="4级水属性<br><br>生命上限增加: 8%"},
		[5]={bg=4256,mul=16,tips="5级水属性<br><br>生命上限增加: 16%"},
		},
	},
	[4]={name="火",bgid=4225,stat=54,info="暴击",attr={
		[1]={bg=4257,mul=1,tips="1级火属性<br><br>暴击几率增加: 0.5%"},
		[2]={bg=4258,mul=2,tips="2级火属性<br><br>暴击几率增加: 1%"},
		[3]={bg=4259,mul=4,tips="3级火属性<br><br>暴击几率增加: 2%"},
		[4]={bg=4260,mul=8,tips="4级火属性<br><br>暴击几率增加: 4%"},
		[5]={bg=4261,mul=16,tips="5级火属性<br><br>暴击几率增加: 8%"},
		},
	},
	[5]={name="土",bgid=4226,stat=55,info="物防",attr={
		[1]={bg=4262,mul=1,tips="1级土属性<br><br>物理防御增加: 3-6"},
		[2]={bg=4263,mul=2,tips="2级土属性<br><br>物理防御增加: 6-12"},
		[3]={bg=4264,mul=6,tips="3级土属性<br><br>物理防御增加: 18-36"},
		[4]={bg=4265,mul=18,tips="4级土属性<br><br>物理防御增加: 54-108"},
		[5]={bg=4266,mul=54,tips="5级土属性<br><br>物理防御增加: 162-324"},
		},
	},
};


local qf_status = {
	[1]={str=const.PP_QIFU_STATUS1,posx=326,attr=5,},
	[2]={str=const.PP_QIFU_STATUS2,posx=369,attr=10,},
	[3]={str=const.PP_QIFU_STATUS3,posx=412,attr=30,},
	[4]={str=const.PP_QIFU_STATUS4,posx=455,attr=100,},
	[5]={str=const.PP_QIFU_STATUS5,posx=498,attr=500,},
}


function process_qifu(player,actionset,panelid,actionid)
	player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","4");
	if actionid == "btnStartQF" then
		just_do_qifu(player);return;
	end
	if actionid == "btnYjQF" then
		yijian_qifu(player);return;
	end
	if actionid == "btnDHlpai" then
		player:set_panel_data("panelshowproperty","dhlinngpai1","visible","false");
		player:push_ckpanel_data("showproperty","panelshowproperty");
		player:script_exe_code("newgui.minimap.duihuan_lingpai");return;
	end
	if actionid == "btnAccQf" then
		gain_qifu_attr(player);return;
	end
	if actionid == "btnGiuQf" then
		giveup_qifu_attr(player);return;
	end
	if actionid == "compturn" then
		fresh_qifu_info(player);return;
	end
end
ckpanel.add_listener("qifu",process_qifu);

function yijian_qifu(player)
	if not check_qifu_limit(player) then
		player:alert(1,1,"请先领取祈福状态!");return;
	end
	if util.ppn(player,const.PP_QIFU_NUMBER) > 0 then
		yj_qifu_logic(player);
	else
		player:alert(1,1,"你祈福次数已经用光!");
		fresh_qifu_info(player);return;
	end
end

function just_do_qifu(player)
	if not check_qifu_limit(player) then
		player:alert(1,1,"请先领取祈福状态!");return;
	end
	if util.ppn(player,const.PP_QIFU_NUMBER) > 0 then
		do_qifu_logic(player);
	else
		player:alert(1,1,"你祈福次数已经用光!");
		fresh_qifu_info(player);return;
	end
end

function start_go(player,target)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"qifuLogic","actiontype",target);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function yj_qifu_logic(player)
	local ret = 0;
	for i=1,5 do
		local rk = util.ppn(player,qf_status[i].str);
		if rk <= 0 then
			local result = math.random(1,5);
			ret = result;
			player:set_param(qf_status[i].str,result);
			local first = util.ppn(player,const.PP_QIFU_STATUS1);
			if result ~= first then 
				break;
			end
		end
	end
	if ret <= 0 then
		player:alert(1,1,"请先领取祈福状态!");return;
	else
		start_go(player,ret-1);
		local qfs = util.ppn(player,const.PP_QIFU_STATUS1);
		local fku = 1;
		if  qfs > 0 then
			for i=2,5 do
				local rk = util.ppn(player,qf_status[i].str);
				if rk > 0 then
					if rk ~= qfs then
						break;
					else
						fku = fku + 1;
					end
				else
					fku = 0;
				end
			end
		end
		if fku > 0 then
			player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+qf_status[fku].attr);
			player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)-1);
			player:set_param(const.PP_MEIRIQIFU,util.ppn(player,const.PP_MEIRIQIFU)+1);
			player:alert(11,1,"本次祈福已结束,祈福声望增加"..qf_status[fku].attr);
			if fku == 3 then
				server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功祈福到3个相同状态,获得祈福声望30点!");
			end
			if fku == 4 then
				server.info(10000,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功祈福到4个相同状态,获得祈福声望100点!");
			end
			if fku == 5 then
				server.info(10000,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功祈福到5个相同状态,获得祈福声望500点!真是鸿福齐天!");
			end
		end
	end
end


function do_qifu_logic(player)
	local ret = 0;
	for i=1,5 do
		local rk = util.ppn(player,qf_status[i].str);
		if rk <= 0 then
			local result = math.random(1,5);
			ret = result;
			player:set_param(qf_status[i].str,result);
			break;
		end
	end
	if ret <= 0 then
		player:alert(1,1,"请先领取祈福状态!");return;
	else
		start_go(player,ret-1);
		local qfs = util.ppn(player,const.PP_QIFU_STATUS1);
		local fku = 1;
		if  qfs > 0 then
			for i=2,5 do
				local rk = util.ppn(player,qf_status[i].str);
				if rk > 0 then
					if rk ~= qfs then
						break;
					else
						fku = fku + 1;
					end
				else
					fku = 0;
				end
			end
		end
		if fku > 0 then
			player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+qf_status[fku].attr);
			player:set_param(const.PP_MEIRIQIFU,util.ppn(player,const.PP_MEIRIQIFU)+1);
			player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)-1);
			player:alert(11,1,"本次祈福已结束,祈福声望增加"..qf_status[fku].attr);
		end
	end
end

function check_qifu_limit(player)
	local qfs = util.ppn(player,const.PP_QIFU_STATUS1);
	if  qfs > 0 then
		for i=2,5 do
			local rk = util.ppn(player,qf_status[i].str);
			if rk > 0 then
				if rk ~= qfs then
					return false;
				else
					if i == 5 then
						return false;--gray
					end
				end
			end
		end
	end
	return true; 
end

function giveup_qifu_attr(player)
	local qfs = util.ppn(player,const.PP_QIFU_STATUS1);
	--local numattr = 5;
	if  qfs <= 0 then
		player:alert(11,1,"您当前尚未祈福到任何状态!");return;
	end
	if check_qifu_limit(player) then
		player:alert(1,1,"当前可以继续祈福!");return;
	end
	for i=1,5 do
		player:set_param(qf_status[i].str,0);
	end
	fresh_qifu_info(player);
end

function gain_qifu_attr(player)
	local qfs = util.ppn(player,const.PP_QIFU_STATUS1);
	--local numattr = 5;
	if  qfs > 0 then
		--if util.ppn(player,const.PP_QIFU_STATUS_DAY) ~= today() then
			local qflv = qf_data[qfs].attr[1].mul;
			for i=2,5 do
				local rk = util.ppn(player,qf_status[i].str);
				if rk > 0 then
					if rk == qfs then
						--numattr = qf_status[i].number;
						qflv = qf_data[qfs].attr[i].mul;
					else
						break;
					end
				else
					player:alert(11,1,"当次祈福尚未结束!");
					return;
				end
			end
			--player:set_param(const.PP_QIFU_SHENGWANG,util.ppn(player,const.PP_QIFU_SHENGWANG)+numattr);
			--player:set_param(const.PP_QIFU_STATUS_DAY,today());
			if player:is_status(qf_data[qfs].stat) then
				player:clear_status(qf_data[qfs].stat);
			end
			player:set_status(qf_data[qfs].stat,1800,qflv,1,11);
			fresh_qifu_info(player);
			--player:alert(11,1,"祈福声望增加"..numattr);
			player:alert(11,1,"您成功领取30分钟"..qf_data[qfs].name.."属性状态!");

			for i=1,5 do
				player:set_param(qf_status[i].str,0);
			end
			fresh_qifu_info(player);
		--else
		--	player:alert(11,1,"您今日已经领取过祈福状态!");
		--end
	else
		player:alert(11,1,"您当前尚未祈福到任何状态!");
	end
end

function fresh_qifu_info(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"qifuLogic","actiontype",-1);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"qfsycsh","text",util.ppn(player,const.PP_QIFU_NUMBER)); -- 祈福次数
	player:set_panel_data(PANEL_ACTIONSET_NAME,"qfcursw","text",util.ppn(player,const.PP_QIFU_SHENGWANG)); -- 祈福声望

	local qfs = util.ppn(player,const.PP_QIFU_STATUS1);
	local fku = 1;
	if  qfs > 0 then
		for i=2,5 do
			local rk = util.ppn(player,qf_status[i].str);
			if rk > 0 then
				if rk ~= qfs then
					break;
				else
					fku = fku + 1;
				end
			end
		end
		player:set_panel_data(PANEL_ACTIONSET_NAME,"statips","tooltip_text",qf_data[qfs].attr[fku].tips);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"statipbg","bgid",qf_data[qfs].attr[fku].bg);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"statips","tooltip_text","");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"statipbg","bgid",0);
	end

	for i=1,5 do
		local rk = util.ppn(player,qf_status[i].str);
		if rk > 0 then
			local qf = qf_data[rk];
			if qf then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"bgid",qf.bgid);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"x",qf_status[i].posx);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"y",105);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"bgid",0);
			end
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"bgid",0);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"x",qf_status[i].posx);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"QFstatus"..i,"y",105);
		end
	end

	if check_qifu_limit(player) then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnStartQF","grayFilter","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnYjQF","grayFilter","false");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnStartQF","grayFilter","true");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnYjQF","grayFilter","true");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
