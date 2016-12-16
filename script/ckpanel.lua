module(..., package.seeall)
local data={};
local all_data={};
function add_listener(param,fun)
	if not data[param] then
		data[param] = {};
	end
	local d = data[param];
	d[fun] = fun;
end
function add_all_listener(fun)
	all_data[fun]=fun;
end
function triger_panel(player,actionset,panelid,actionid,t_data)
	for i,v in pairs(all_data) do
		v(player,actionset,panelid,actionid,t_data);
	end
	local d = data[actionset];
	if d then
		for i,v in pairs(d) do
			v(player,actionset,panelid,actionid,t_data);
		end
	end
end
--打开一键出售面板
function open_yjchushou(player)
	player:set_panel_data("panelhuishou","panelhuishou","panel_visible","true");
	player:push_ckpanel_data("huishou","panelhuishou");
end
--打开强化面板
function open_qiling(player)
	player:set_panel_data("panelfuse","panelfuse","panel_visible","true");
	player:push_ckpanel_data("fuse","panelfuse");
end

local effs={"effActivity","effLottery","effVcoinGift","effLevelGift"};
--1：活动图标 2：寻宝图标 3：首充图标 4：升级奖励
function miniEffShow(player,id,flag)
	if flag>0 then
		player:set_panel_data("panelminimapfun",effs[id],"visible","true");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
	else
		player:set_panel_data("panelminimapfun",effs[id],"visible","false");
		player:set_panel_data("panelminimapfun","btnHBox","visible","true");
		player:push_ckpanel_data("minimapfun","panelminimapfun");
	end
end

function open_fuhuo_panel(player,tick,p2,p3,p4)
	local otick = util.ppn(player,const.PP_RELIVE_TICK);
	if otick <= 0 then
		otick = tick;
	end
	player:set_panel_data("panelfuhuo","fhcost","text","消耗还魂丹*"..otick.."或"..(otick*100).."元宝");
	player:set_panel_data("panelfuhuo","panelfuhuo","panel_visible","true");
	player:set_param(const.PP_RELIVE_TICK,math.min(otick*2,8));
	player:set_timer(16,60000);
	player:set_panel_data("panelfuhuo","relive","act1",60);
	player:push_ckpanel_data("fuhuo","panelfuhuo");
	return otick;
end

function tempVip(player)
	if util.ppn(player,const.PP_HUIYUAN) == 0 then
		player:set_param(const.PP_TEMP_VIP_TIMER,1800);
		player:set_timer(11,1000);
		player:set_status(34,1800,1,1,1)
		--player:set_model(5,1);
		player:set_vip(1);
		player:set_panel_data("panelvip","vipdesp","bgid","4187");
		player:set_panel_data("panelvip","panelvip","panel_visible","true");
		player:push_ckpanel_data("vip","panelvip");
		server.info(10,0,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成为临时VIP会员!");
		player:alert(11,0,"恭喜您获得30分钟VIP体验时间!");
	end
end

function tempVipOver(player)
	if util.ppn(player,const.PP_HUIYUAN) == 0 then
		player:set_vip(0);
		player:clear_status(34)
		player:set_panel_data("panelvip","vipdesp","bgid","4109");
		player:set_panel_data("panelvip","btnVipCZ","visible","false");
		player:set_panel_data("panelvip","panelvip","panel_visible","true");
		player:push_ckpanel_data("vip","panelvip");
		player:alert(11,0,"您30分钟VIP体验时间已到,赶快成为尊贵的VIP成员吧!");
	end
	player:set_panel_data("panelvip","btnVipCZ","visible","true");
	player:set_panel_data("panelvip","vipdesp","bgid","3236");
end