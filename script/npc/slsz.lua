module(..., package.seeall)
function to_exp(player)
	if player:get_level() >= 80 then
		return math.ceil(80*80*80*(util.ppn(player,const.PP_MWT_LV)) *(1.1132));
	else
		return math.ceil(player:get_level()*player:get_level()*player:get_level()*(util.ppn(player,const.PP_MWT_LV)) *(1.1132));
	end
end
function to_hunj(player)
	return math.floor(util.ppn(player,const.PP_MWT_LV)/10)*50 + 50 * util.ppn(player,const.PP_MWT_LV) + 50;
end

function onTalk100(npc,player)
	local ceng=util.ppn(player,const.PP_MWT_LV);
	local zmtjy = to_exp(player);
	local slhj = to_hunj(player);
	local num = player:get_map():num_monster();
	npc:echo([[--------------------------------------
<b><font color="#ccbb77" size="14px">闯塔说明</font></b>

<font color="#ccbb77">当前层数</font>: 裁决]]..ceng..[[层

<font color="#ccbb77">本层目标</font>: 消灭本层怪物

<font color="#ccbb77">经验奖励</font>: ]]..zmtjy..[[点

<font color="#ccbb77">真气奖励</font>: ]]..slhj..[[点

<font color="#ccbb77">剩余怪物</font>: [<font color="#FFFF00">]]..num..[[</font>]只

]]);
	
		if ceng < 10 then
			if util.ptpn(player,const.PTP_SHILIAN_AWARD) > 0 then
				if(ceng>=5)then
				npc:echo([[<font color="#ccbb77">黑店</font>
##continue##<a href='event:talk_openheishi'>黑市商店</a>]]);
				end
				npc:echo([[


<font color="#ccbb77">打道</font>
##continue##<a href="event:talk_getaward2">领取经验直接回城</a>

<font color="#ccbb77">冲关</font>
##continue##<a href="event:talk_getaward">领取经验进入下层</a> 

--------------------------------------]]);
			else
				if(ceng>=4)then
				npc:echo([[<font color="#ccbb77">黑店</font>
##continue##<a href='event:talk_openheishi'>黑市商店</a>]]);
				end
				npc:echo([[--------------------------------------

                <a href='event:talk_enternext'>进入下一层</a>

                <a href='event:talk_enterhome'>点击此处回城</a>

--------------------------------------]]);
			end
		else
			if util.ptpn(player,const.PTP_SHILIAN_AWARD) > 0 then
				npc:echo([[--------------------------------------
<font color="#ccbb77">终极关</font>
                <a href='event:talk_getaward2'>领取裁决之地10层终极奖励</a>

--------------------------------------]]);
			else
				npc:echo([[--------------------------------------

                <a href='event:talk_enterhome'>点击此处回城</a>

--------------------------------------]]);
			end
		end
end


function onTalkgetaward(npc,player)
	local num = player:get_map():num_monster();
	if num > 0 then
		player:alert(1,1,"对不起,需要将怪物全部清完才可领取奖励!");
		return 100;
	end
	if util.ptpn(player,const.PTP_SHILIAN_AWARD) > 0 then
		player:set_temp_param(const.PTP_SHILIAN_AWARD,0);
		local ceng=util.ppn(player,const.PP_MWT_LV);
		local zmtjy = to_exp(player);
		local slhjj = to_hunj(player);
		player:add_exp(zmtjy);
		player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+slhjj);
		newgui.lianhun.fresh_lianhun_info(player);
		player:alert(1,1,"成功通关,获得经验:"..zmtjy.."点     真气:"..slhjj.."点<br>");
		onTalkenternext(npc,player);
		return;
	end
	return 100;
end


function onTalkgetaward2(npc,player)
	local num = player:get_map():num_monster();
	if num > 0 then
		player:alert(1,1,"对不起,需要将怪物全部清完才可领取奖励!");
		return 100;
	end
	if util.ptpn(player,const.PTP_SHILIAN_AWARD) > 0 then
		local ceng=util.ppn(player,const.PP_MWT_LV);
		local zmtjy = to_exp(player);
		local slhjj = to_hunj(player);
		if ceng==10 then
			player:set_temp_param(const.PTP_SHILIAN_AWARD,0);
			player:add_exp(zmtjy);
			player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+slhjj);
			newgui.lianhun.fresh_lianhun_info(player);
			player:alert(11,1,"恭喜您成功通关裁决之地,获得经验:"..zmtjy.."点<br>真气:"..slhjj.."点");
			server.info(10010,0,"玩家["..player:get_name().."]闯过了裁决之地第10层,获得了大量经验和真气,大家恭喜他!");
		else
			player:set_temp_param(const.PTP_SHILIAN_AWARD,0);
			player:add_exp(zmtjy);
			player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)+slhjj);
			newgui.lianhun.fresh_lianhun_info(player);
			player:alert(1,1,"成功通关,获得经验:"..zmtjy.."点     真气:"..slhjj.."点<br>");
		end
		onTalkenterhome(npc,player);
		return;
	end
	return 100;
end



function find_empty_mwt(npc,player,lv)
	local map=nil;
	for i=1,100 do
		map = server.find_map("slzd"..i);
		if map and map:num_player() < 1 then
			break;
		else
			map=nil;
		end
	end
	return map;
end

function onTalkopenheishi( npc,player )
	player:set_panel_data("panelheishi","panelheishi","panel_visible","true");
	player:push_ckpanel_data("heishi","panelheishi");
end
function onTalkenternext(npc,player)
	local map = player:get_map();
	local num = player:get_map():num_monster();
	if num <= 0 then
		local ceng=util.ppn(player,const.PP_MWT_LV);
		local map = find_empty_mwt(npc,player,ceng+1);
		if map and map:num_player() < 1 then
			player:set_param(const.PP_MWT_LV,ceng+1);
			player:enter_map(map:get_id(),31,40);
			return;
		else
			player:alert(1,0,"有人正在闯关,请稍候再试");
		end
	end
	return 100;
end

function onTalkenterhome(npc,player)
	go.home(player);
end