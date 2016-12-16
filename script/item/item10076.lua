module(..., package.seeall)

function open(player)
	local qtbc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*4.079);
	local hjbc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*8.159);
	local lybc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*16.319);
	local zjbc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*32.638);
	player:echo([[由于世道混乱,沙漠土城的镇远镖局生意大好!人手严重短缺!凭此令牌可以前往镖局代为运镖,可以获得大量奖励哦!

请选择你要押运的镖车:

	     <font color='#00ff00'>青铜镖车</font> (<s='r'>经验]]..qtbc..[[</s>)

	     <font color='#FFff00'>黄金镖车</font> (<s='r'>经验]]..hjbc..[[</s>)
	 
	     <font color='#3300FF'>蓝玉镖车</font> (<s='r'>经验]]..lybc..[[</s>)

	     <font color='#EE00EE'>紫金镖车</font> (<s='r'>经验]]..zjbc..[[</s>)

                   <a href="event:local_goto_v003_47_107_夏镖头">前往镇远镖局押镖</a>

<font color='#FFff00'>请注意:镖车被劫只可获得[60%]的经验</font><br><br>]]);
show_merge(player,player);
		return 0;
end


function show_merge(npc,player)
	npc:echo("<font color='#FFaa00'>请选择您想合成的押镖令牌:</font>\n     <a href='event:talk_merge2'>黄金镖令</a>: 需要<font color='#FFff00'>5块青铜镖令</font> [<font color='#FF0000'>2倍</font>]\n     <a href='event:talk_merge2'>蓝玉镖令</a>: 需要<font color='#FFff00'>5块黄金镖令</font> [<font color='#FF0000'>4倍</font>]\n     <a href='event:talk_merge2'>紫金镖令</a>: 需要<font color='#FFff00'>5块蓝玉镖令</font> [<font color='#FF0000'>8倍</font>]\n<font color='#FFaa00'>请注意:合成需要缴纳[5万金币]的费用!</font>\n");
end
function onTalkmerge2(player)
	player:alert(1,1,"打开[熔炉]可以合成您所需要的押镖令!");
	item.item10076.open(player);
end