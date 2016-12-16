module(..., package.seeall)
function to_exp(player)
	if player:get_level() >= 80 then
		return math.ceil(80*80*80*(util.ppn(player,const.PP_ZMT3_LV)) *(6.6132));
	else
		return math.ceil(player:get_level()*player:get_level()*player:get_level()*(util.ppn(player,const.PP_ZMT3_LV)) *(6.6132));
	end
end
function to_lingpai(player) return math.ceil(player:get_level()* (util.ppn(player,const.PP_ZMT3_LV)+1) /5); end

function onTalk100(npc,player)
	local ceng=util.ppn(player,const.PP_ZMT3_LV);
	local zmtjy = to_exp(player);
	local num = player:get_map():num_monster();
	npc:echo([[--------------------------------------
<b><font color="#ccbb77" size="14px">闯塔说明</font></b>
<font color="#ff0000">
<font color="#ccbb77">本层目标</font>: 5分钟内消灭本层怪物

<font color="#ccbb77">经验奖励</font>: ]]..zmtjy..[[点

<font color="#ccbb77">剩余怪物</font>: [<font color="#FFFF00">]]..num..[[</font>]只

<font color="#ccbb77">提示说明</font>: 等级越高需要的镇魔令越多并且经
          验也越来越高

<font color="#ccbb77">您的镇魔令数量为</font>: ]]..util.ppn(player,const.PP_SUOYAOTA_PAI)..[[个</font><br>
]]);
		if ceng < 12 then
			if util.ptpn(player,const.PTP_ZMT3_AWARD) > 0 then
				npc:echo([[--------------------------------------
<font color="#ccbb77">打道</font>
##continue##<a href="event:talk_getaward2">领取经验直接回城</a>

<font color="#ccbb77">冲关</font>
##continue##<a href="event:talk_getaward">领取经验进入下层</a>  <font color="#ff0000"><font color="#ccbb77">需要</font>]]..to_lingpai(player)..[[块镇魔令牌</font>

--------------------------------------]]);
			else
				npc:echo([[--------------------------------------

                <a href='event:talk_enternext'>进入下一层</a>

                <a href='event:talk_enterhome'>点击此处回城</a>

--------------------------------------]]);
			end;
		else
			if util.ptpn(player,const.PTP_ZMT3_AWARD) > 0 then
				npc:echo([[--------------------------------------
<font color="#ccbb77">终极关</font>
                <a href='event:talk_getaward2'>领取镇魔塔12层终极奖励</a>

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
	if util.ptpn(player,const.PTP_ZMT3_AWARD) > 0 then
		player:set_temp_param(const.PTP_ZMT3_AWARD,0);
		local ceng=util.ppn(player,const.PP_ZMT3_LV);
		local zmtjy = to_exp(player);
		player:add_exp(zmtjy);
		player:alert(1,1,"成功通关,获得经验:"..zmtjy.."点<br>");
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
	if util.ptpn(player,const.PTP_ZMT3_AWARD) > 0 then
		local ceng=util.ppn(player,const.PP_ZMT3_LV);
		local zmtjy = to_exp(player);
		if ceng==12 then
			if player:num_bag_black() >= 2 then
				player:set_temp_param(const.PTP_ZMT3_AWARD,0);
				player:add_exp(zmtjy);
				player:add_item("五级宝石",2,1);
				player:alert(11,1,"恭喜您成功通关镇魔塔,获得经验:"..zmtjy.."点<br>");

				--统计活跃度--
				player:set_param(const.PP_HUOYUEDU_NUM7,util.ppn(player,const.PP_HUOYUEDU_NUM7)+1);
				if util.ppn(player,const.PP_HUOYUEDU_NUM7)==1 then
					player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
				end
					
				server.info(10010,0,"玩家["..player:get_name().."]闯过了镇魔塔第12层,获得了大量经验和五级宝石2块,大家恭喜他!");
			else
				player:alert(1,0,"您的包裹少于2个空格,请将包裹清理下再来找我!");return 100;
			end
		else
			player:set_temp_param(const.PTP_ZMT3_AWARD,0);
			player:add_exp(zmtjy);
			player:alert(1,1,"成功通关,获得经验:"..zmtjy.."点<br>");
		end
		onTalkenterhome(npc,player);
		return;
	end
	return 100;
end
function find_empty_zmt(npc,player,lv)
	local map=nil;
	for i=1,100 do
		--local id = math.fmod(lv,2)*50 + i;
		map = server.find_map("mtmt"..i);
		if map and map:num_player() < 1 then
			break;
		else
			map=nil;
		end
	end
	return map;
end
function onTalkenternext(npc,player)
	local map = player:get_map();
	local num = player:get_map():num_monster();
	if num <= 0 then
		local ceng=util.ppn(player,const.PP_ZMT3_LV);
		--local nmapname=string.sub(map:get_id(),1,5)..(ceng+1);
		--local map = server.find_map(nmapname);
		if util.ppn(player,const.PP_SUOYAOTA_PAI) >= to_lingpai(player) then
			local map = find_empty_zmt(npc,player,ceng+1);
			if map and map:num_player() < 1 then
				player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)-to_lingpai(player));
				player:set_param(const.PP_ZMT3_LV,ceng+1);
				player:enter_map(map:get_id(),31,40);
				return;
			else
				player:alert(1,0,"有人正在闯关,请稍候再试");
			end
		else
			player:alert(1,0,"您的镇魔令少于"..to_lingpai(player).."个,无法继续闯关!");
		end
	end
	return 100;
end
function onTalkenterhome(npc,player)
	go.home(player);
end