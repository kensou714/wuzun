module(..., package.seeall)

function onTalk100(npc,player)
	local dt=player:get_map():get_id();
	if dt == "lianyu1" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱一层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">僵尸王</font>
--------------------------------------
刷新间隔: <font color="#ffff00">300秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">别看僵尸王的名字还蛮霸气的,
          其实实力一般般.经常被打的满
          地找牙!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu2" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱二层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">奴玛卫士</font>
--------------------------------------
刷新间隔: <font color="#ffff00">300秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">奴玛卫士是奴玛教主手下第一猛
          将,实力还行哦!您要小心应付!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu3" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱三层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">奴玛教主</font>
--------------------------------------
刷新间隔: <font color="#ffff00">900秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">奴玛教主的实力就不用我介绍了
          吧!毕竟是奴玛寺庙教主哦!不过
          打败它说不定会掉些好东西呢!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu4" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱四层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">嗜血毒虫</font>
--------------------------------------
刷新间隔: <font color="#ffff00">900秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">这是只来自邪恶洞穴的超级大蜈
          蚣,它的毒已经使很多人死于非
          命!你要小心呀!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu5" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱五层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">邪龙神</font>
--------------------------------------
刷新间隔: <font color="#ffff00">3600秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">嗜血毒虫的厉害你领教过吧!而
          邪龙神的实力是嗜血毒虫数倍!
          你还是识相点快走吧!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu6" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱六层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">邪恶蛇蝎</font>
--------------------------------------
刷新间隔: <font color="#ffff00">900秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">猪妖洞穴你应该听说过吧!邪恶
          蛇蝎是猪妖洞穴里的主要BOSS!
          得罪它可不是开玩笑的!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu7" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱七层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">变异蛇蝎王</font>
--------------------------------------
刷新间隔: <font color="#ffff00">3600秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">变异蛇蝎王,这个名字听着都可
          怕!它是猪妖洞穴的终极领主!
          小命要紧,快跑!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu8" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱八层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">重装使者</font>
--------------------------------------
刷新间隔: <font color="#ffff00">900秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">说起重装使者真是叫人又爱又恨
          啊,恨的是死在他手下的勇士不
          计其数!爱的是打败它可是会掉
          落好衣服哦!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">炼狱地图进入下层则不可以回到上层</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
	if dt == "lianyu9" then
		npc:echo([[--------------------------------------
               <font color="#ffff00">炼狱使者</font>
--------------------------------------
<font color="#ffff00">你好,我是炼狱九层的使者!</font>
--------------------------------------
主要BOSS: <font color="#ffff00">猛犸教主</font>
--------------------------------------
刷新间隔: <font color="#ffff00">900秒</font>
--------------------------------------
BOSS说明: <font color="#ffff00">你都闯到九层了,那猛犸教主相
          信不是你的对手了!快去跟它较
          量较量吧!</font>
--------------------------------------
<font color="#ffff00">给我些费用,我能将你传到下一层哦!</font>
--------------------------------------
<font color="#ff0000">我只能将你传到炼狱十层哦!下面就靠你了!</font>
--------------------------------------
               <a href="event:talk_lianyucs">使用20000金币传送到下层</a>
--------------------------------------
]]);
	end
end


function onTalklianyucs(npc,player)
	if player:get_gamemoney() >= 20000 then
		player:sub_gamemoney(20000);
		local dt=player:get_map():get_id();
		if dt == "lianyu1" then
			player:enter_map("lianyu2",282,270);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱二层!");
			return;
		end
		if dt == "lianyu2" then
			player:enter_map("lianyu3",103,25);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱三层!");
			return;
		end
		if dt == "lianyu3" then
			player:enter_map("lianyu4",38,23);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱四层!");
			return;
		end
		if dt == "lianyu4" then
			player:enter_map("lianyu5",24,33);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱五层!");
			return;
		end
		if dt == "lianyu5" then
			player:enter_map("lianyu6",141,164);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱六层!");
			return;
		end
		if dt == "lianyu6" then
			player:enter_map("lianyu7",20,232);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱七层!");
			return;
		end
		if dt == "lianyu7" then
			player:enter_map("lianyu8",166,26);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱八层!");
			return;
		end
		if dt == "lianyu8" then
			player:enter_map("lianyu9",11,154);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱九层!");
			return;
		end
		if dt == "lianyu9" then
			player:enter_map("lianyu10",120,237);
			go.givehuicheng(player);
			player:alert(1,1,"使用20000金币进入炼狱十层!");
			return;
		end
	else
	player:alert(1,1,"您的金币不足20000,恐怕我不能传送你哦!");
	onTalk100(npc,player);
	end
end
