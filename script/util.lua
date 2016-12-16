module(..., package.seeall)
function use_function(use,base)    
	for funcname, func in pairs(base) do
		if string.sub(funcname, 1,6) == "onTalk" then
			use[funcname] = func
		end
	end
end
function ppn(player,id)
	if not id then server.c_bt() end
	local v = player:get_param(id);
	if v == nil or v == "" then return 0;end
	return tonumber(v);
end
function ptpn(player,id)
	if not id then server.c_bt() end
	local v = player:get_temp_param(id);
	if v == nil or v == "" then return 0;end
	return tonumber(v);
end
function mvn(map,id)
	if not id then server.c_bt() end
	local v = map:get_var(id);
	if v == nil or v == "" then return 0;end
	return tonumber(v);
end
function svn(id)
	if not id then server.c_bt() end
	local v = server.get_var(id);
	if v == nil or v == "" then return 0;end
	return tonumber(v);	
end
function stvn(id)
	if not id then server.c_bt() end
	local v = server.get_temp_var(id);
	if v == nil or v == "" then return 0;end
	return tonumber(v);	
end