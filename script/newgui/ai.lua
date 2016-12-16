module(..., package.seeall)
local ACTIONSET_NAME = "ai"
local PANEL_ACTIONSET_NAME = "panelai"

local aidata=
{
	["autoPcikItem"]=
	{
		default =  1,
		value=const.PP_ASSIST_PICK_ITEM,
	},
	["autoPickGold"]=
	{
		default =  1,
		value=const.PP_ASSIST_PICK_GOLD,
	},
	["autoPcikDisp"]=
	{
		default =  1,
		value=const.PP_ASSIST_PICK_MED,
	},
	["autoFightBack"]=
	{
		default =  0,
		value=const.PP_ASSIST_AUTO_FIGHT,
	},
	["autoHpHigh"]=
	{
		default =  1,
		value=const.PP_PROTECT_NORMAL_HP,
	},
	["autoMpHigh"]=
	{
		default =  1,
		value=const.PP_PROTECT_NORMAL_MP,
	},
	["autoHpLow"]=
	{
		default =  1,
		value=const.PP_PROTECT_QUICK_HP,
	},
	["autoMpLow"]=
	{
		default =  1,
		value=const.PP_PROTECT_QUICK_MP,
	},
	["autoRand"]=
	{
		default =  0,
		value=const.PP_PROTECT_RANDOM,
	},
	["autoBack"]=
	{
		default =  0,
		value=const.PP_PROTECT_GOHOME,
	},
};
function  process_self(player,actionset,panelid,actionid,data)
	--print("set actionid is:" .. actionid)
	for k,v in pairs(aidata) do
		if k == actionid then
			local cur_value = util.ppn(player,v.value);
			local set_value = "false"
			if cur_value == 0 then
				set_value = "true"
				player:set_param(v.value,1)
			else
				player:set_param(v.value,0)
			end
		--	print("set value is " .. set_value)
			player:set_panel_data(PANEL_ACTIONSET_NAME,k,"selected",set_value)
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME)
			return
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_self);

function processDefaultSet(player)
	local default = util.ppn(player,const.PP_ASSIST_DEFAULT)
	--print("default is:" .. default)
	--没有设置过 就用默认配置
	if default == 0 then
	--	print("set default 1" )
		--set 
		player:set_param(const.PP_ASSIST_DEFAULT,1)
		for k,v in pairs(aidata)do
			player:set_param(v.value,v.default)
		end
	end
	for k,v in pairs(aidata) do
		local cur_value = util.ppn(player,v.value);
		local set_value = "true"
		if cur_value == 0 then
			set_value = "false"
		end
		player:set_panel_data(PANEL_ACTIONSET_NAME,k,"selected",set_value)
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME)
end
