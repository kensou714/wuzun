module(..., package.seeall)
function onTalk100(npc,player)
	npc:echo([[<font color="#FF0000">             裁  决  之  地</font>
---------------------------------------
<font color="#FFff00">    在这里,力量就是一切,无论出身、经历、种族,只要能在这里取得胜利,就可以获得大量的名望及财富</font>
---------------------------------------

              <a href="event:talk_entermiwut">开始裁决之旅</a>

---------------------------------------
<font color="#FFff00">裁决之地说明:</font>
--------------------------------------
<font color="#FFff00">1. 裁决之地共10层，每层都会有一个强大的BOSS!</font>
--------------------------------------
<font color="#FFff00">2. 击败BOSS可以获得大量经验及真气，并有概率掉落转生石，获得进入下一层的资格!</font>
--------------------------------------
<font color="#FFff00">3. 每层限制时间为3分钟，被BOSS击败或超过时间未进入下一层视为失败!</font>
--------------------------------------
<font color="#FFff00">4. 每天每人只能进入一次!</font>
---------------------------------------
]]);
end

function find_empty_mwt(npc,player,lv)
	local map=nil;
	for i=1,100 do
		--local id = math.fmod(lv,2)*50 + i;
		map = server.find_map("slzd"..i);
		if map and map:num_player() < 1 then
			break;
		else
			map=nil;
		end
	end
	return map;
end

function onTalkentermiwut(npc,player)
	check_zmt_day(player);
	if player:get_level() < 50 then player:alert(1,0,"等级不足50级不可以进入");return;end;
	if util.ppn(player,const.PP_SHILIAN_NUM) >= const.SHILIAN_MAX_NUM then player:alert(1,0,"您今天允许进入裁决之地的次数已用完,无法进入!");return;end;
	local m=find_empty_mwt(npc,player,1);
	if m then
		player:set_param(const.PP_MWT_LV,1);
		player:set_param(const.PP_SHILIAN_NUM,util.ppn(player,const.PP_SHILIAN_NUM)+1);
		player:enter_map(m:get_id(),23,42);
		go.givehuicheng(player);
	else
		player:alert(1,1,"由于闯关人数过多,请稍后再试!") ;
	end
end

function check_zmt_day(player)
	if util.ppn(player,const.PP_SHILIAN_DAY) ~= today() then
		player:set_param(const.PP_SHILIAN_DAY,today());
		player:set_param(const.PP_SHILIAN_NUM,0);
	end
end