--require "debugger"
function OncientUse(use,base)
	for funcname, func in pairs(base) do
		if string.sub(funcname, 1,2) == "on" or string.sub(funcname, 1,2) == "do" then
			use[funcname] = func
		end
	end
end

function get_day(t)
	return math.floor((t+8*60*60)/(60*60*24));
end

function hour()
	return math.floor((os.time()+8*60*60)/(60*60));
end

function today()
	return get_day(os.time());
end

function week()
	return math.floor((today()+3)/7)
end
function weekday()
	return tonumber(os.date("%w", os.time()));
end

function ymd()
	return tonumber(os.date("%Y%m%d"));
end

function h()
	return tonumber(os.date("%H"));
end

function server_start_time()
	local st = server.get_var("server_start_time");
	if st ~= "" then
		return os.time()-tonumber(st);
	end
	return 0;
end

function server_start_day()
	local st = server.get_var("server_start_time");
	if st ~= "" then
		return today()-get_day(tonumber(st));
	end
	return 0;
end

function server_open_day()
	local st = server.get_var("server_start_time");
	if st ~= "" then
		return get_day(tonumber(st));
	end
	return today();
end

function is_merge_server()
	return "" ~= server.get_var("server_merge_tag");
end

function server_merge_time()
	if is_merge_server() then
		local st = server.get_var("server_merge_time");
		if st ~= "" then
			return os.time()-tonumber(st);
		end
		return 0;
	else
		return -1;
	end
end

function server_merge_day()
	if is_merge_server() then
		local st = server.get_var("server_merge_time");
		if st ~= "" then
			return today()-get_day(tonumber(st));
		end
		return 0;
	else
		return -1;
	end
end

function reset_merge_seed()
	if is_merge_server() then
		if server.get_var("set_check_merge") == "opened" then
			if server.get_var("merge_log_time") ~= "" then
				return tonumber(server.get_var("merge_log_time"));
			end
		end
	end
	return 0;
end

function check_levelrk_timelt()
	if server_start_day() <= 2 then
		return true;
	end
	if server_start_day() == 3 then
		local h = tonumber(os.date("%H%M",os.time()));
		if h <= 1200 then
			return true;
		end
	end
	return false;
end

function link_active(msg,activetype,color)
	color = color or "#ff0000"
	local color_msg = "[<font color='" .. color .. "'>" .. msg .. "</font>]"
	local link_msg = "<b><u><a href='event:active_" .. activetype .."'>" .. color_msg .. "</a></u></b>"
	return link_msg
end

require "util"
require "const"
require "activity"

require "posnpc"
require "posmon"
require "posmap"
require "focus"
require "go"
require "qanda"

require "ckdead"
require "ckitem"
require "ckmon"
require "cklevel"
require "cktalk"
require "ckpanel"
require "login"
require "ckattr"

require "item"
require "couple"
require "guild"
require "const"
require "posnpc"
require "posmon"
require "task"
require "gm"
require "newgui"
require "player"
require "mon"
require "npc"
require "map"
require "vcoinshop"
require "autorun"
require "war"
require "cklevel"
require "upgrade"
require "lottery"
require "lieming"
require "achieve"
require "vcoingift"
require "levelgift"
require "biggift"
require "shortcut"

print("SCRIPT_VERSION_TAG");

function server_param_exp_open()
	if tonumber(server.get_exp_mul()) <= 1 then
		server.set_exp_mul(2);
		server.info(10010,0,"全服双倍经验已经开启!");
	end
end
function server_param_exp_close()
	if tonumber(server.get_exp_mul()) >= 2 then
		server.set_exp_mul(1);
		server.info(10010,0,"全服双倍经验已经关闭!");
	end
end

function OnInit()
	if "" == server.get_var("server_start_time") then
		server.set_var("server_start_time",tostring(os.time()));
	end
	if ""==server.get_var("xuyuanchi_item_total") then
		server.set_var("xuyuanchi_item_total",5000);
		server.set_var("xuyuanchi_item_now",0);
		server.set_var("xuyuanchi_item_cd_1",0);
		server.set_var("xuyuanchi_item_cd_2",0);
		server.set_var("xuyuanchi_item_cd_3",0);
		server.set_var("xuyuanchi_item_cd_4",0);
		server.set_var("xuyuanchi_item_cd_5",0);
		server.set_var("xuyuanchi_item_cd_6",0);
		server.set_var("xuyuanchi_item_cd_7",0);
		server.set_var("xuyuanchi_item_cd_8",0);
		server.set_var("xuyuanchi_item_cd_9",0);
		server.set_var("xuyuanchi_item_cd_10",0);
		server.set_var("xuyuanchi_item_cd_11",0);
		server.set_var("xuyuanchi_item_cd_12",0);
		server.set_var("xuyuanchi_item_cd_13",0);
		server.set_var("xuyuanchi_item_cd_14",0);
		server.set_var("xuyuanchi_item_cd_15",0);
		server.set_var("xuyuanchi_item_cd_16",0);
		server.set_var("xuyuanchi_item_cd_17",0);
		server.set_var("xuyuanchi_item_cd_18",0);
		server.set_var("xuyuanchi_item_cd_19",0);
		server.set_var("xuyuanchi_item_cd_20",0);

		server.set_var("xuyuanchi_item_remainder_0", 1);
		server.set_var("xuyuanchi_item_remainder_1", 1);
		server.set_var("xuyuanchi_item_remainder_2", 1);
		server.set_var("xuyuanchi_item_remainder_3", 1);
		server.set_var("xuyuanchi_item_remainder_4", 1);
		server.set_var("xuyuanchi_item_remainder_5", 5);
		server.set_var("xuyuanchi_item_remainder_6", 15);
		server.set_var("xuyuanchi_item_remainder_7", 15);
		server.set_var("xuyuanchi_item_remainder_8", 15);
		server.set_var("xuyuanchi_item_remainder_9", 15);
		server.set_var("xuyuanchi_item_remainder_10",15);
		server.set_var("xuyuanchi_item_remainder_11",45);
		server.set_var("xuyuanchi_item_remainder_12",75);
		server.set_var("xuyuanchi_item_remainder_13",100);
		server.set_var("xuyuanchi_item_remainder_14",145);
		server.set_var("xuyuanchi_item_remainder_15",200);
		server.set_var("xuyuanchi_item_remainder_16",311);
		server.set_var("xuyuanchi_item_remainder_17",1010);
		server.set_var("xuyuanchi_item_remainder_18",1010);
		server.set_var("xuyuanchi_item_remainder_19",1010);
		server.set_var("xuyuanchi_item_remainder_20",1010);
	end

	if server_start_day() >= 1 then
			server.add_item_alert(10141);
			server.add_item_alert(10142);
			server.add_item_alert(10143);
			server.add_item_alert(10144);
			server.add_item_alert(10037);
			server.add_item_alert(10272);
			server.add_item_alert(10278);
			server.add_item_alert(10284);
			server.add_item_alert(49000);
			server.add_item_alert(79000);
			server.add_item_alert(69000);
			server.add_item_alert(59000);
			server.add_item_alert(99000);
			server.add_item_alert(109000);
			server.add_item_alert(170000);
			server.add_item_alert(170010);
		for i = 1,36 do
			server.add_item_alert(20405+i);
			server.add_item_alert(30018+i);
			server.add_item_alert(35018+i);
		end
		for i = 1,21 do
			server.add_item_alert(40022+i);
			server.add_item_alert(70032+i);
			server.add_item_alert(60028+i);
			server.add_item_alert(50034+i);
			server.add_item_alert(90012+i);
			server.add_item_alert(100012+i);
		end
		for i = 1,24 do
			server.add_item_alert(41019+i);
			server.add_item_alert(71029+i);
			server.add_item_alert(61025+i);
			server.add_item_alert(51031+i);
			server.add_item_alert(91009+i);
			server.add_item_alert(101009+i);
		end
	else
			server.add_item_alert(10141);
			server.add_item_alert(10142);
			server.add_item_alert(10143);
			server.add_item_alert(10144);
			server.add_item_alert(10037);
			server.add_item_alert(10272);
			server.add_item_alert(10278);
			server.add_item_alert(10284);
			server.add_item_alert(49000);
			server.add_item_alert(79000);
			server.add_item_alert(69000);
			server.add_item_alert(59000);
			server.add_item_alert(99000);
			server.add_item_alert(109000);
			server.add_item_alert(170000);
			server.add_item_alert(170010);
		for i = 1,39 do
			server.add_item_alert(20402+i);
			server.add_item_alert(30015+i);
			server.add_item_alert(35015+i);
		end
		for i = 1,21 do
			server.add_item_alert(40019+i);
			server.add_item_alert(70029+i);
			server.add_item_alert(60025+i);
			server.add_item_alert(50031+i);
			server.add_item_alert(90009+i);
			server.add_item_alert(100009+i);
		end
		for i = 1,24 do
			server.add_item_alert(41019+i);
			server.add_item_alert(71029+i);
			server.add_item_alert(61025+i);
			server.add_item_alert(51031+i);
			server.add_item_alert(91009+i);
			server.add_item_alert(101009+i);
		end
	end
end