module(..., package.seeall)
local ACTIONSET_NAME="zuoqi";
local PANEL_ACTIONSET_NAME="panelzuoqi";--角色属性面板
local MAX_ZUOQI_LV = 15;

local mount_data={
	["tmount1"]={lv=1,mount=2001,attr={attmin=6,attmax=10,defmin=3,defmax=5,nodef=1,fight=88,speed=4},},
	["tmount2"]={lv=2,mount=2002,attr={attmin=12,attmax=20,defmin=6,defmax=10,nodef=2,fight=176,speed=8},},
	["tmount3"]={lv=3,mount=2003,attr={attmin=24,attmax=40,defmin=9,defmax=15,nodef=4,fight=352,speed=12},},
	["tmount4"]={lv=4,mount=2004,attr={attmin=36,attmax=60,defmin=12,defmax=20,nodef=6,fight=496,speed=16},},
	["tmount5"]={lv=5,mount=2005,attr={attmin=54,attmax=90,defmin=15,defmax=25,nodef=9,fight=656,speed=20},},
	["tmount6"]={lv=6,mount=2006,attr={attmin=81,attmax=136,defmin=18,defmax=30,nodef=12,fight=1017,speed=24},},
	["tmount7"]={lv=7,mount=2007,attr={attmin=125,attmax=209,defmin=21,defmax=35,nodef=15,fight=1435,speed=28},},
	["tmount8"]={lv=8,mount=2008,attr={attmin=195,attmax=326,defmin=24,defmax=40,nodef=20,fight=2083,speed=32},},
	["tmount9"]={lv=9,mount=2009,attr={attmin=309,attmax=515,defmin=27,defmax=45,nodef=30,fight=3130,speed=36},},
	["tmount10"]={lv=10,mount=2010,attr={attmin=494,attmax=824,defmin=30,defmax=50,nodef=40,fight=4820,speed=40},},
	["tmount11"]={lv=11,mount=2011,attr={attmin=800,attmax=1334,defmin=42,defmax=70,nodef=55,fight=7409,speed=45},},
	["tmount12"]={lv=12,mount=2012,attr={attmin=1312,attmax=2187,defmin=60,defmax=100,nodef=80,fight=11690,speed=50},},
	["tmount13"]={lv=13,mount=2013,attr={attmin=1824,attmax=3040,defmin=78,defmax=130,nodef=85,fight=15971,speed=55},},
	["tmount14"]={lv=14,mount=2014,attr={attmin=2336,attmax=3893,defmin=96,defmax=160,nodef=90,fight=20252,speed=60},},
	["tmount15"]={lv=15,mount=2015,attr={attmin=2848,attmax=4746,defmin=114,defmax=190,nodef=95,fight=24533,speed=65},},
};

local mount_type={
	[1]={id=2001,name="黑鬃马(1阶)",speed=130011,jh_exp=2000,need_exp=10000,key="tmount1"},
	[2]={id=2002,name="白良马(2阶)",speed=130012,jh_exp=2000,need_exp=197462,key="tmount2"},
	[3]={id=2003,name="赤红马(3阶)",speed=130013,jh_exp=2000,need_exp=394924,key="tmount3"},
	[4]={id=2004,name="斑斓虎(4阶)",speed=130014,jh_exp=2000,need_exp=789848,key="tmount4"},
	[5]={id=2005,name="苍云虎(5阶)",speed=130015,jh_exp=2000,need_exp=1579696,key="tmount5"},
	[6]={id=2006,name="啸天虎(6阶)",speed=130016,jh_exp=2000,need_exp=3159392,key="tmount6"},
	[7]={id=2007,name="震威战狮(7阶)",speed=130017,jh_exp=2000,need_exp=6318784,key="tmount7"},
	[8]={id=2008,name="血影雄狮(8阶)",speed=130018,jh_exp=2000,need_exp=12637568,key="tmount8"},
	[9]={id=2009,name="金甲圣狮(9阶)",speed=130019,jh_exp=2000,need_exp=25275136,key="tmount9"},
	[10]={id=2010,name="赤焰火麒麟(10阶)",speed=130020,jh_exp=2000,need_exp=50550272,key="tmount10"},
	[11]={id=2011,name="碧玉蓝麒麟(11阶)",speed=130021,jh_exp=2000,need_exp=101100544,key="tmount11"},
	[12]={id=2012,name="至尊金麒麟(12阶)",speed=130022,jh_exp=2000,need_exp=202201088,key="tmount12"},
	[13]={id=2013,name="赤焰混天蛟(13阶)",speed=130023,jh_exp=2000,need_exp=202201088,key="tmount13"},
	[14]={id=2014,name="碧玉焚天蛟(14阶)",speed=130024,jh_exp=2000,need_exp=202201088,key="tmount14"},
	[15]={id=2015,name="至尊诛天蛟(15阶)",speed=130025,jh_exp=2000,need_exp=202201088,key="tmount15"},
};
function first_set_mount_attr(player)
	for i=1,#mount_type do
		local key_id = mount_type[i].key;
		if mount_data[key_id] then
			player:set_mountlv_data(mount_data[key_id].lv,mount_data[key_id].attr.attmin,mount_data[key_id].attr.attmax,mount_data[key_id].attr.defmin,mount_data[key_id].attr.defmax,mount_data[key_id].attr.nodef,mount_data[key_id].attr.fight);
		end
	end
end
function process_zuoqiproperty(player,actionset,panelid,actionid,data)
	-----------------------------------坐骑面板交互信息
	if actionid == "btnmountYBTS" then
		mountYBTS(player);return;
	end
	if actionid =="btnSHANGMA" then
		mountSHANGMA(player);return;
	end
	if actionid == "btnmountYJTS" then
		mountYJTS(player);return;
	end
	if actionid == "btnmountRYTS" then
		mountRYTS(player);return;
	end
	if actionid == "btnJiHuo" then
		activeMountStatus(player);return;
	end
	local m_data = mount_data[actionid];
	if m_data then
		player:set_temp_param(const.PTP_ID_MOUNT_SELECTED,m_data.lv);
		local mnnn = mount_type[m_data.lv];
		if mnnn then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtZQname","text",mnnn.name);
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtZQname","text","坐骑预览");
		end
		player:set_panel_data(PANEL_ACTIONSET_NAME,"mcpreviewvatar","resMounts",m_data.mount);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc","text",""..m_data.attr.attmin.."-"..m_data.attr.attmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc","text",""..m_data.attr.attmin.."-"..m_data.attr.attmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc","text",""..m_data.attr.attmin.."-"..m_data.attr.attmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac","text",""..m_data.attr.defmin.."-"..m_data.attr.defmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac","text",""..m_data.attr.defmin.."-"..m_data.attr.defmax);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsd","text",m_data.attr.speed.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzlts","text",m_data.attr.fight);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthswl","text","无视目标"..m_data.attr.nodef.."%物防");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthsmf","text","无视目标"..m_data.attr.nodef.."%魔防");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzl","htmlText",m_data.attr.fight);
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtZQname","text","坐骑预览");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtdc","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmc","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtsc","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtac","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmac","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsd","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthswl","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txthsmf","text"," ");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzl","htmlText"," ");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
end
--ckpanel.add_listener(ACTIONSET_NAME,process_zuoqiproperty);

function doFirstFreshMount(player)
	local lv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL);
	local act = "tmount1";
	if lv >= 1 and lv <= 15 then
		act = "tmount"..lv;
	end
	process_zuoqiproperty(player,ACTIONSET_NAME,PANEL_ACTIONSET_NAME,act)
end
--login.add_login_listener(doFirstFreshMount);

-----------------------------------------坐骑面板--------------------------------------
function mountYBTS(player)
	local next_lv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL)+1;
	if next_lv >= MAX_ZUOQI_LV+1 then player:alert(1,1,"坐骑已经满级"); return; end
	if player:get_vcoin() >= 300 then
		if  next_lv == MAX_ZUOQI_LV+1 then
			player:alert(1,1,"坐骑已经满级,无需提升."); return;
			--if mount_type[MAX_ZUOQI_LV].need_exp - util.ppn(player,const.PP_ZUOQI_EXP) > 100000 then
			--	player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)+100000);
			--	player:alert(1,1,"坐骑经验增加100000点");
			--else
			--	player:set_param(const.PP_ZUOQI_EXP,mount_type[MAX_ZUOQI_LV].need_exp);
			--end
			--player:sub_vcoin(1000);
			--fresh_mount_panel(player);
			--return;
		end
		if mount_type[next_lv] then
			if mount_type[next_lv].need_exp - util.ppn(player,const.PP_ZUOQI_EXP) > 100000 then
				player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)+100000);
				player:alert(1,1,"坐骑经验增加100000点");
			else	
				player:set_param(const.PP_CUR_ZUOQI_LEVEL,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL)+1);
				player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)+100000-mount_type[next_lv].need_exp);
				player:set_status(35,86400,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL),1,1);
				player:set_model(7,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL));
				achieve_active_zuoqi(player);
				newgui.property.fresh_self_info(player);
				player:alert(1,1,"坐骑升级,"..util.ppn(player,const.PP_CUR_ZUOQI_LEVEL).."级坐骑状态已激活.");
				player:alert(1,1,"消耗300元宝,获得100000经验,激活"..util.ppn(player,const.PP_CUR_ZUOQI_LEVEL).."级坐骑.");
				server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..mount_type[next_lv].name.."</font>]");
				player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
			end
			player:sub_vcoin(300,"zuoqi");
			fresh_mount_panel(player);
		end
	else
		player:alert(1,1,"元宝不足300.");
	end
end
function mountYJTS(player)
	local next_lv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL)+1;
	if next_lv > MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); return; end
	if mount_type[next_lv] then
		local need = mount_type[next_lv].need_exp - util.ppn(player,const.PP_ZUOQI_EXP);
		local cost = math.floor(need*3/1000);
		if cost <= 0 then cost = 1 end
		if player:get_vcoin() >= cost then
			player:sub_vcoin(cost,"zuoqi")
			if next_lv > MAX_ZUOQI_LV then player:alert(1,1,"坐骑已经满级"); player:set_param(const.PP_ZUOQI_EXP,mount_type[next_lv].need_exp);return; end
			player:set_param(const.PP_CUR_ZUOQI_LEVEL,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL)+1);
			achieve_active_zuoqi(player);
			player:set_param(const.PP_ZUOQI_EXP,0);
			fresh_mount_panel(player);
			player:set_status(35,86400,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL),1,1);
			player:set_model(7,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL));
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"消耗"..cost.."元宝,获得"..need.."经验,激活"..util.ppn(player,const.PP_CUR_ZUOQI_LEVEL).."级坐骑.");
			server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..mount_type[next_lv].name.."</font>]");
			player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
		else
			player:alert(1,1,"元宝不足"..cost);
		end
	end
end
function mountRYTS(player)
	--荣誉提升
end
function mountAddExp(player,addexp)
	local next_lv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL)+1;
	if next_lv > MAX_ZUOQI_LV+1 then return 0; end
	if  next_lv == MAX_ZUOQI_LV+1 then
		if mount_type[MAX_ZUOQI_LV].need_exp - util.ppn(player,const.PP_ZUOQI_EXP) > addexp then
			player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)+addexp);
			player:alert(1,1,"坐骑经验增加"..addexp.."点.");
			fresh_mount_panel(player);
		else
			player:set_param(const.PP_ZUOQI_EXP,mount_type[MAX_ZUOQI_LV].need_exp);
			player:alert(1,1,"坐骑已达到经验上限.");
			fresh_mount_panel(player);
			return 0;
		end
		return 1;
	end
	if mount_type[next_lv] then
		if mount_type[next_lv].need_exp - util.ppn(player,const.PP_ZUOQI_EXP) > addexp then
			player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)+addexp);
			player:alert(1,1,"坐骑经验增加"..addexp.."点.");
		else	
			player:set_param(const.PP_CUR_ZUOQI_LEVEL,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL)+1);
			achieve_active_zuoqi(player);
			player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)+addexp-mount_type[next_lv].need_exp);
			player:set_status(35,86400,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL),1,1);
			player:set_model(7,util.ppn(player,const.PP_CUR_ZUOQI_LEVEL));
			newgui.property.fresh_self_info(player);
			player:alert(1,1,"坐骑经验增加"..addexp.."点,并激活"..util.ppn(player,const.PP_CUR_ZUOQI_LEVEL).."级坐骑.");
			server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将坐骑提升至[<font color='#ff0000'>"..mount_type[next_lv].name.."</font>]");
			player:alert(11,0,"<font color='#FF0000'>打开坐骑界面可查看坐骑详细说明!</font>");
			player:alert(11,0,"<font color='#FF0000'>使用快捷键[X]可以快速上马下马!</font>");
		end
		fresh_mount_panel(player);
		return 1;
	end
	return 0;
end
function activeMountStatus(player)
	local cur_mount_lv = util.ptpn(player,const.PTP_ID_MOUNT_SELECTED)
	if cur_mount_lv > 0 then
		if util.ppn(player,const.PP_CUR_ZUOQI_LEVEL) >= cur_mount_lv then
			if mount_type[cur_mount_lv] then
				if player:is_status(35) and player:get_status_param(35) == cur_mount_lv then
					player:alert(1,1,"您已激活当前等级坐骑状态.");return;
				end
				if player:is_status(35) and player:get_status_param(35) > cur_mount_lv then
					player:alert(1,1,"您已激活较高等级的坐骑状态.");return;
				end
				if util.ppn(player,const.PP_ZUOQI_EXP) >= mount_type[cur_mount_lv].jh_exp then
					player:set_param(const.PP_ZUOQI_EXP,util.ppn(player,const.PP_ZUOQI_EXP)-mount_type[cur_mount_lv].jh_exp);
					player:set_status(35,86400,cur_mount_lv,1,1);
					fresh_mount_panel(player);
					newgui.property.fresh_self_info(player);
					player:alert(1,1,"恭喜您激活成功当前等级坐骑状态.");
				else
					player:alert(1,1,"激活当前状态需要消耗坐骑经验"..mount_type[cur_mount_lv].jh_exp);
				end
			end
		else
			player:alert(1,1,"当前坐骑尚未拥有.");
		end
	end
end
function ChangeAvatarMount(player)
	local a,b,c=player:get_mount_info();
	local cur_mount_lv = util.ptpn(player,const.PTP_ID_MOUNT_SELECTED)
	if cur_mount_lv > 0 then
		if util.ppn(player,const.PP_CUR_ZUOQI_LEVEL) >= cur_mount_lv then
			if mount_type[cur_mount_lv] then
				if mount_type[cur_mount_lv].id ==  b then
					player:set_mount_info(0,0,0);
					player:set_mount_show(0);
				else
					player:set_mount_info(1,mount_type[cur_mount_lv].id,mount_type[cur_mount_lv].speed);
					player:set_mount_show(0);
					player:set_mount_show(1);
				end
			end
		else
			player:alert(1,1,"当前坐骑尚未拥有.");
		end
	end
end
function mountSHANGMA(player)
	local zqlv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL);
	if zqlv >= 1 then
		local a,b,c=player:get_mount_info();
		if mount_type[zqlv] then
			if b > 0 and player:get_mount_show() == 1 then
				player:set_mount_info(0,0,0);
				player:set_mount_show(0);
			else
				local nomunt = player:get_map():get_flag_mount();
				if nomunt == 1 then player:alert(1,1,"该地图禁止坐骑."); return; end
				player:start_progress_bar(2,"上马中...");
				player:set_mount_info(1,mount_type[zqlv].id,mount_type[zqlv].speed);
				player:change_mount();
			end
		end
	else
		player:alert(1,1,"您尚未拥有坐骑.");
	end
end

function check_map_nomount(player)
	local a,b,c=player:get_mount_info();
	player:set_mount_info(0,0,0);
	player:set_mount_show(0);
end
function check_mount_cd(player)
	--player:set_param(const.PP_CHANGE_MOUNT_INCD,10);
	--player:set_timer(11,1000);
end
function fresh_mount_panel(player)
	local lv = util.ppn(player,const.PP_CUR_ZUOQI_LEVEL);
	local md = mount_type[lv+1];
	if lv >= MAX_ZUOQI_LV then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYJTS","tooltip_text","坐骑达到最大等级,无需提升.");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYBTS","tooltip_text","坐骑达到最大等级,无需提升.");
	end
	if md then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zuoqi","mountExpMax",md.need_exp);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zuoqi","mountExp",util.ppn(player,const.PP_ZUOQI_EXP));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmountjy","text",""..util.ppn(player,const.PP_ZUOQI_EXP).."/"..md.need_exp);
		local need = md.need_exp - util.ppn(player,const.PP_ZUOQI_EXP);
		local cost = math.floor(need*3/1000);
		if cost <= 0 then cost = 1 end
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYJTS","tooltip_text","消耗"..cost.."元宝一键提升等级.");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnmountYBTS","tooltip_text","消耗300元宝获得100000经验.");
	else
		if lv == MAX_ZUOQI_LV then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtmountjy","text",""..util.ppn(player,const.PP_ZUOQI_EXP).."/"..mount_type[MAX_ZUOQI_LV].need_exp);
			player:set_panel_data(PANEL_ACTIONSET_NAME,ACTIONSET_NAME,"mountExpMax",mount_type[MAX_ZUOQI_LV].need_exp);
			player:set_panel_data(PANEL_ACTIONSET_NAME,ACTIONSET_NAME,"mountExp",util.ppn(player,const.PP_ZUOQI_EXP));
		end
	end
	for i=1,#mount_type do
		if i <= lv then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"tmount"..i,"grayFilter","false");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"tmount"..i,"grayFilter","true");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end