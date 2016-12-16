module(..., package.seeall)
function onStart()
	server.info(10,0,"王城争霸开始");
	local map = server.find_map("v005");
	if map then
		map:set_flag_pkallow(1);
		map:set_flag_autoalive(1);
	end
	local map = server.find_map("kinghome");
	if map then
		map:set_flag_pkallow(1);
		map:set_flag_autoalive(1);
		map:set_timer(1,3000);
		map:set_timer(3,600000);
	end
end

function onStop()
	local map = server.find_map("v005");
	if map then
		map:set_flag_pkallow(0);
		map:set_flag_autoalive(0);
	end
	local map = server.find_map("kinghome");
	if map then
		map:set_flag_pkallow(0);
		map:set_flag_autoalive(0);
	end
	server.info(10,0,"王城争霸已经结束");
end

function onStartKuafu()
	server.info(10,0,"跨服战开始");
	local map = server.find_map("vkfz");
	if map then
		map:set_flag_pkallow(1);
		map:set_flag_autoalive(1);
	end
	local map = server.find_map("vkfz");
	if map then
		map:set_flag_pkallow(1);
		map:set_flag_autoalive(1);
		map:set_timer(1,3000);
		--map:set_timer(3,600000);
	end
end

function onStopKuafu()
	local map = server.find_map("vkfz");
	if map then
		map:set_flag_pkallow(0);
		map:set_flag_autoalive(0);
	end
	local map = server.find_map("vkfz");
	if map then
		map:set_flag_pkallow(0);
		map:set_flag_autoalive(0);
	end
	server.info(10,0,"跨服战已经结束");
end
