module(..., package.seeall)
function home(player)
	player:set_temp_param(const.PTP_ID_TIMER_GO,'h');
	player:set_timer(const.PT_GO,1);
end

function soonhome(player)
	player:set_temp_param(const.PTP_ID_TIMER_GO,'h');
	player:set_timer(const.PT_GO,1000);
end

function rand(player)
	player:set_temp_param(const.PTP_ID_TIMER_GO,'r');
	player:set_timer(const.PT_GO,1);
end
function move(player,t,x,y,msg)
	player:set_temp_param(const.PTP_ID_TIMER_GO,'m');
	player:set_temp_param(const.PTP_ID_TIMER_GO_X,x);
	player:set_temp_param(const.PTP_ID_TIMER_GO_Y,y);
	player:set_timer(const.PT_GO,t);
	if msg ~= "" then player:alert(11,0,msg); end
end
function gmove(player,t,map,x,y,msg)
	player:set_temp_param(const.PTP_ID_TIMER_GO,'gm');
	player:set_temp_param(const.PTP_ID_TIMER_GO_X,x);
	player:set_temp_param(const.PTP_ID_TIMER_GO_Y,y);
	player:set_temp_param(const.PTP_ID_TIMER_GO_MAP,map);
	player:set_timer(const.PT_GO,t);
	if msg ~= "" then player:alert(11,0,msg); end
end
function relive(player,t,r,msg)
	player:set_temp_param(const.PTP_ID_TIMER_GO,'l');
	player:set_temp_param(const.PTP_ID_TIMER_GO_X,r);
	player:set_timer(const.PT_GO,t);
	if msg ~= "" then player:alert(11,0,msg); end
end
function stop(player)
	player:set_timer(const.PT_GO,0);
end
function timer(player)
	player:set_timer(const.PT_GO,0);
	local t = player:get_temp_param(const.PTP_ID_TIMER_GO);
	if t == 'h' then player:go_home();end
	if t == 'r' then local x,y;x,y=player:gen_rand_position();if( x and y )then player:move(x,y); end; end
	if t == 'l' then player:relive(util.ptpnumber(player,const.PTP_ID_TIMER_GO_X));end
	if t == 'm' then player:move(util.ptpnumber(player,const.PTP_ID_TIMER_GO_X),util.ptpnumber(player,const.PTP_ID_TIMER_GO_Y)); end
	if t == 'gm' then player:enter_map(player:get_temp_param(const.PTP_ID_TIMER_GO_MAP),util.ptpnumber(player,const.PTP_ID_TIMER_GO_X),util.ptpnumber(player,const.PTP_ID_TIMER_GO_Y)); end
	--if player:get_pk_value() >= 200 then player:enter_map("v004",35,44); end
end
function givehuicheng(player)
	if player:num_item("回城卷",1) < 1 and player:num_bag_black() >= 1 then
		player:add_item_log("回城卷",203,1);
	end
end