module(..., package.seeall)
local ACTIONSET_NAME = "strong"
local PANEL_ACTIONSET_NAME = "panelstrong"

local strongdata=
{
	["1"]=
	{
		strongname="寻宝",
	},
	["2"]=
	{
		strongname="C界面心法分页",
	},
	["3"]=
	{
		strongname="坐骑",
		npcname="button2",
	},
	["4"]=
	{
		strongname="神器",
	},
	["5"]=
	{
		strongname="熔炉",
	},
	["6"]=
	{
		strongname="C界面祈福",
	},
	["7"]=
	{
		strongname="翅膀",
		npcname="灵羽使者", --npc
	},
	["8"]=
	{
		strongname="官印",
		npcname="官职系统", --npc
	},
	["9"]=
	{
		strongname="荣誉勋章",--npc
		npcname="伏魔使者", --npc
	},
	["10"]=
	{
		strongname="武器祈福 商城 元宝商城分页",
	},
	["11"]=
	{
		strongname="积分武器",
		npcname="神器使者", --npc
	},
	["12"]=
	{
		strongname="特戒",
		npcname="神器使者", --npc
	},
	["13"]=
	{
		strongname="转生 c界面转生",
	},
	["14"]=
	{
		strongname="红钻状态",
		npcname="福利礼官", --npc
	},
	["15"]=
	{
		strongname="会员状态 -商城界面元宝分页",
	},
};
function  process_self(player,actionset,panelid,actionid,data)
	local index= string.sub(actionid,7,#actionid)
	local npcdata=strongdata[index]
	if not npcdata then 
		print("error toindex:" .. index)
		server.c_bt()
		return 
	end
	if npcdata.npcname then
		posnpc.go(player,npcdata.npcname);
		return
	end
	local num=tonumber(index)
	if num == 2 then
		player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","2");
		player:push_ckpanel_data("showproperty","panelshowproperty");
	elseif num ==6 then
		player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","4");
		player:push_ckpanel_data("showproperty","panelshowproperty");
	elseif num ==13 then
		player:set_panel_data("panelshowproperty","panelshowproperty","panel_visible","true");
		player:set_panel_data("panelshowproperty","showpropertytabcontrol","selected","3");
		player:push_ckpanel_data("showproperty","panelshowproperty");
	end
end

ckpanel.add_listener(ACTIONSET_NAME,process_self);

function process_strong(player)
	--do things
	player:set_panel_data(PANEL_ACTIONSET_NAME,"fightpoint","text",player:fight_point());
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME)
end

