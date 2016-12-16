module(..., package.seeall)
function onTalk100(npc,player)
	if util.ppn(player,const.PP_SUOYAOTA_PAI) < 0 then
		player:set_param(const.PP_SUOYAOTA_PAI,0);
	end
	local llevel = math.ceil(player:get_level()/5);
	npc:echo([[
<b><font color="#ccbb77" size="14px">吾奉命镇守镇魔塔,闲杂人等闪开!</font></b>

<font color="#ed6655">您当前拥有镇魔令牌</font>: ]]..util.ppn(player,const.PP_SUOYAOTA_PAI)..[[个

<font color="#ff0000">闯塔需要 ]]..llevel..[[ 块(等级越高需越多)镇魔令</font>


   <a href="event:talk_z200">进入1号镇魔塔</a>      <a href="event:talk_z201">进入2号镇魔塔</a>
								         
   <a href="event:talk_z202">进入3号镇魔塔</a>      <a href="event:talk_z203">进入4号镇魔塔</a>

<font color="#ff00ff">今天还可进入镇魔塔</font>: ]]..util.ppn(player,const.PP_ZHENMOTACISHU)..[[次
-------------------------------------

			<a href="event:talk_z100">查看镇魔塔简介</a>


	  <font color="#ff8000">适度游戏益脑 沉迷游戏伤身
	  合理安排时间 享受健康生活</font>
]]);
end
--//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
--//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function onTalkz200(npc,player) goto(npc,player,"zzmta1") end
function onTalkz201(npc,player) goto(npc,player,"zzmtb1") end
function onTalkz202(npc,player) goto(npc,player,"zzmtc1") end
function onTalkz203(npc,player) goto(npc,player,"zzmtd1") end
function onTalkz204(npc,player) goto(npc,player,"zzmte1") end
function onTalkz205(npc,player) goto(npc,player,"zzmtf1") end
function onTalkz206(npc,player) goto(npc,player,"zzmtg1") end
function onTalkz207(npc,player) goto(npc,player,"zzmth1") end

function goto(npc,player,mmap)
	local llevel = math.ceil(player:get_level()/5);
	if player:get_level() >= 50 and player:get_level() <= 150 then
		if util.ppn(player,const.PP_ZHENMOTACISHU) >= 1 then
			if llevel <= util.ppn(player,const.PP_SUOYAOTA_PAI) then
				local map = server.find_map(mmap);
				if map:num_player() < 1 then
					--player:set_param(const.PP_ZHENMOTACISHU,util.ppn(player,const.PP_ZHENMOTACISHU)-1);
					player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)-llevel);
					player:set_param(const.PP_SUOYAOTA_AWARD,0);
					player:enter_map(mmap,27,35);
					player:set_param(const.PP_SUOYAOTA_MAP,string.sub(player:get_map():get_id(),5,-2));
					map:clear_mon();
					map:clear_item();
					map:mon_gen(32,40,"蛇蝎4",8,5,5,1);
					go.givehuicheng(player);
					player:set_timer(1,0)
					player:set_timer(1,300000);
					player:alert(111,0,"你只有5分钟的时间清除里面的怪物!");
				else
					player:alert(111,0,"当前地图有人请稍候尝试进入!") ;
				end
			else
				player:alert(1,0,"你的镇魔令不足"..llevel.."个(镇魔令可以在商铺购买)!") ;
			end
		else
			player:alert(1,0,"您今天进入镇魔塔的次数已经用完,无法再进入!") ;
		end
	else
		player:alert(1,0,"镇魔塔岂能乱闯?镇魔塔只适合(50-150)级的玩家进入!");
	end
end