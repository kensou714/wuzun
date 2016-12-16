module(..., package.seeall)
function onTalk100(npc,player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI) < 0 then
		player:set_param(const.PP_SUOYAOTA_PAI,0);
	end
	local llevel = math.ceil(player:get_level()/5);
	npc:echo([[---------------------------------------
<b><font color="#ccbb77" size="14px">吾奉命镇守镇魔塔,闲杂人等闪开!</font></b>
---------------------------------------
<font color="#ed6655">您当前拥有镇魔令牌</font>: ]]..util.ppn(player,const.PP_SUOYAOTA_PAI)..[[个
---------------------------------------
<font color="#ff0000">闯塔需要 ]]..llevel..[[ 块(等级越高需越多)镇魔令</font>
---------------------------------------

      <a href="event:talk_enterzmt">镇魔塔[东]</a>      <a href="event:talk_enterzmt">镇魔塔[南]</a>
								         
      <a href="event:talk_enterzmt">镇魔塔[西]</a>      <a href="event:talk_enterzmt">镇魔塔[北]</a>

---------------------------------------
<font color="#ff00ff">今天还可进入镇魔塔</font>: ]]..util.ppn(player,const.PP_ZHENMOTACISHU)..[[次
---------------------------------------

            <a href="event:talk_z100">查看镇魔塔简介</a>


       <font color="#ff8000">适度游戏益脑 沉迷游戏伤身
       合理安排时间 享受健康生活</font>

---------------------------------------
]]);
end

function onTalkz100(npc,player)
npc:echo([[
<b><font color="#ccbb77" size="14px">吾奉命镇守镇魔塔,闲杂人等闪开!</font></b>


<font color="#ccbb77">以下为镇魔塔介绍</font>

<font color="#87ba55">镇魔塔每层奖励:</font> 超大量经验

<font color="#87ba55">镇魔塔终极奖励:</font> 五级宝石 2块

<font color="#87ba55">镇魔塔闯关规则:</font> 杀完怪物才可进下层

<font color="#ff0000">(镇魔塔内死亡无法原地复活)</font>

------------------------------------

			　<a href="event:talk_100">返回主页</a>


	  <font color="#ff8000">适度游戏益脑 沉迷游戏伤身
	  合理安排时间 享受健康生活</font>
]]);
end

function onTalkenterzmt(npc,player)
	local llevel = math.ceil(player:get_level()/5);
	if util.ppn(player,const.PP_ZHENMOTACISHU) >= 1 then
		if llevel <= util.ppn(player,const.PP_SUOYAOTA_PAI) then
			local m = find_empty_zmt(npc,player,1);
			if m then
				--player:set_param(const.PP_ZHENMOTACISHU,util.ppn(player,const.PP_ZHENMOTACISHU)-1);
				player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)-llevel);
				player:set_param(const.PP_SUOYAOTA_AWARD,0);
				player:set_param(const.PP_ZMT3_LV,1);
				player:enter_map(m:get_id(),27,35);
				go.givehuicheng(player);
				server.info(10,0,"<font color='#00EE00'>玩家[<font color='#ff0000'>"..player:get_name().."</font>]进入了镇魔塔,镇魔塔可获得大量经验!</font>");
			else
				player:alert(1,1,"由于闯关人数过多,请稍后再试!") ;
			end
		else
			player:alert(1,1,"你的镇魔令不足"..llevel.."个(镇魔令可以在商铺购买)!") ;
		end
	else
		player:alert(1,1,"您今天进入镇魔塔的次数已经用完,无法再进入!") ;
	end
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