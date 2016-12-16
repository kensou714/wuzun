module(..., package.seeall)

local expdata={
	[1] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*0.586);end;
	[2] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*0.684);end;
	[3] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*1.953);end;
	[4] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*0.782);end;
	[5] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*0.879);end;
	[6] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*3.907);end;
	[7] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*0.977);end;
	[8] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*1.075);end;
	[9] = function(player)  return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*5.859);end;
	[10] = function(player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*1.172);end;
	[11] = function(player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*1.269);end;
	[12] = function(player) return math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*60*7.813);end;
};

function onTalk100(npc,player)
	local ceng=util.ppn(player,const.PP_ZMT_LV);
	local zmtjy = expdata[ceng](player);
	local num = player:get_map():num_monster();
	npc:echo([[--------------------------------------
我乃通天塔使者,奉命镇守此塔!
--------------------------------------

当前层数: <font color="#FFFF00">通天塔]]..ceng..[[层</font>

剩余怪物: [<font color="#FFFF00">]]..num..[[</font>]只

通关条件: <font color="#FFFF00">消灭本地图中的所有怪物</font>

--------------------------------------
通关奖励:

##经验##  ]]..zmtjy..[[<br>
]]);
		if ceng < 12 then
			if util.ptpn(player,const.PTP_ZMT_AWARD) > 0 then
				npc:echo([[--------------------------------------

                <a href='event:talk_getaward'>领取奖励并进入下一层</a>

--------------------------------------]]);
			else
				npc:echo([[--------------------------------------

                <a href='event:talk_enternext'>领取奖励并进入下一层</a>

--------------------------------------]]);
			end;
		else
			if util.ptpn(player,const.PTP_ZMT_AWARD) > 0 then
				npc:echo([[--------------------------------------

                <a href='event:talk_getaward2'>领取奖励并回城</a>

--------------------------------------]]);
			else
				npc:echo([[--------------------------------------

                <a href='event:talk_enterhome'>领取奖励并回城</a>

--------------------------------------]]);
			end
		end
end
function onTalkgetaward(npc,player)
	local num = player:get_map():num_monster();
	if num > 0 then
		player:alert(1,1,"对不起,需要将怪物全部清完才可领取奖励并进入下层!");
		return 100;
	end
	if util.ppn(player,const.PP_ZHENMOTACISHU) < 0 then
		player:alert(11,1,"闯关次数数据异常!");
		go.home(player);
		return;
	end
	if util.ptpn(player,const.PTP_ZMT_AWARD) > 0 then
		player:set_temp_param(const.PTP_ZMT_AWARD,0);
		local ceng=util.ppn(player,const.PP_ZMT_LV);
		local zmtjy = expdata[ceng](player);
		player:add_exp(zmtjy);
		player:alert(1,1,"成功通关进入下一层,获得经验:"..zmtjy.."点<br>")
			onTalkenternext(npc,player);
	return;
	end
	return 100;
end


function onTalkgetaward2(npc,player)
	local num = player:get_map():num_monster();
	if num > 0 then
		player:alert(1,1,"对不起,需要将怪物全部清完才可领取奖励并进入下层!");
		return 100;
	end
	if util.ppn(player,const.PP_ZHENMOTACISHU) < 0 then
		player:alert(11,1,"闯关次数数据异常!");
		go.home(player);
		return;
	end
	if  util.ptpn(player,const.PTP_ZMT_AWARD) > 0 then
		player:set_temp_param(const.PTP_ZMT_AWARD,0);
		local ceng=util.ppn(player,const.PP_ZMT_LV);
		local zmtjy = expdata[ceng](player);
		player:add_exp(zmtjy);
		player:alert(11,1,"恭喜您成功通关通天塔,获得经验:"..zmtjy.."点<br>")

		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM6,util.ppn(player,const.PP_HUOYUEDU_NUM6)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM6)==2 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+10);
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
		map = server.find_map("zzmt"..i);
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
		local ceng=util.ppn(player,const.PP_ZMT_LV);
		--local nmapname=string.sub(map:get_id(),1,5)..(ceng+1);
		--local map = server.find_map(nmapname);
		local map = find_empty_zmt(npc,player,ceng+1);
		if map and map:num_player() < 1 then
			player:set_param(const.PP_ZMT_LV,ceng+1);
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