module(..., package.seeall)
local ACTIONSET_NAME = "charge"
local PANEL_ACTIONSET_NAME = "panelcharge"

local const_save = const.PP_HIDE_PAY_ALERT
local check_today = const.PP_HIDE_PAY_DAY

function process_self(player,actionset,panelid,actionid,data)
	if actionid == "hide" then 
		local cur = util.ppn(player,const_save)
		if cur == 1 then
			cur = 0
		elseif cur == 0 then
			cur = 1
		end
		player:set_param(const_save,cur)
	end
end

ckpanel.add_listener(ACTIONSET_NAME,process_self);

function checkOpenPayUrl(player)
	checkToday(player)
	local cur = util.ppn(player,const_save)
	if	cur == 0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end

function checkToday(player)
	if util.ppn(player,check_today) ~= today() then
		player:set_param(check_today,today())
		player:set_param(const_save,0)
	end
end
