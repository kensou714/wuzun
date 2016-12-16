module(..., package.seeall)
function onTalk100(npc,player)
	check_zmt_day(player);
	npc:echo([[--------------------------------------
<font color="#FFff00">我乃通天塔使者!</font>
--------------------------------------
请选择您想进入的通天塔:
--------------------------------------
      <a href="event:talk_enterzmt">通天塔[东]</a>      <a href="event:talk_enterzmt">通天塔[南]</a>
								         
      <a href="event:talk_enterzmt">通天塔[西]</a>      <a href="event:talk_enterzmt">通天塔[北]</a>

您今天还可以进入通天塔:[<font color="#FF0000">]]..const.ZMT_MAX_NUM-util.ppn(player,const.PP_ZMT_NUM)..[[</font>]次
--------------------------------------
<font color="#FFff00">通天塔说明:</font>
--------------------------------------
<font color="#FFff00">1. 每三层通天塔将会出现一个BOSS守关!</font>
--------------------------------------
<font color="#FFff00">2. 每通关三层通天塔都将获得大量经验!</font>
--------------------------------------
<font color="#FFff00">3. 必须杀完每层所有怪物才可进入下层!</font>
--------------------------------------
<font color="#FFff00">4. 每通关任何一层都会获得经验的奖励!</font>
--------------------------------------
<font color="#FFff00">5. 全部通关12层通天塔将获得特殊奖励!</font>
--------------------------------------
]]);
end
function onTalkenterzmt(npc,player)
	if player:get_level() < 45 then player:alert(1,0,"等级不足45级不可以进入");return;end;
	if util.ppn(player,const.PP_ZMT_NUM) >= const.ZMT_MAX_NUM then player:alert(1,0,"您今天允许进入通天塔的次数已用完,无法进入!");return;end;
	local m=find_empty_zmt(npc,player,1);
	if m then
		player:set_param(const.PP_ZMT_NUM,util.ppn(player,const.PP_ZMT_NUM)+1);
		player:set_param(const.PP_ZMT_LV,1);
		player:enter_map(m:get_id(),31,40);
	else
		player:alert(1,0,"由于闯关人数过多,请稍后再试!");
	end
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
function check_zmt_day(player)
	if util.ppn(player,const.PP_ZMT_DAY) ~= today() then
		player:set_param(const.PP_ZMT_DAY,today());
		player:set_param(const.PP_ZMT_NUM,0);
	end
end
