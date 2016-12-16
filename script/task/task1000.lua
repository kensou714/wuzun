module(..., package.seeall)
local task_id=1000;
local task_data={
	ttype="主线",		focus=true,		autogo=true,
	[1	]={
		tid=1,		nid=2,		need_level=1,		name="苏醒",	accepter="云天河",	doner="药店老板1",
		award={
			{name="桃木剑",	num=1,	use=true},
			{name="魔血石[50W]",   num=1,bind=1,use=true},
			{name="经验",		num=100},
			{name="绑定金币",	num=1000},
		},
		accept_talk=function (npc,player,td) return "孩子,你终于醒了.我们的世界经历了一场恶战,其结果真是伤亡惨重,你爹娘也在战争中牺牲了!唉!老朽作为一村之长,实在无颜面对村中父老……罢了罢了,你还是去找药店老板想他讨点有用的东西吧!";end;
		done_talk  =function (npc,player,td) return "小白菜啊,地里黄啊,两三岁啊,没了爹娘……孩子,这说的就是你呗!莫要生气,老夫跟你开个玩笑!活跃一下战后紧张的气氛嘛!武器拿去,早就给你准备好了!";end;
	},
	[2	]={
		tid=2,		nid=3,		need_level=1,		name="试试身手",	accepter="药店老板1",	doner="杂货铺老板1",
		award={
			{name="回城石",		num=1,bind=1,use=true},
			{name="布衣(男)",	num=1,		gender='male',use=true},
			{name="布衣(女)",	num=1,		gender='female',use=true},
			{name="经验",		num=100},
			{name="绑定金币",	num=1000},
		},
		accept_talk=function (npc,player,td) return "怎么样?你爹娘留给你的武器还趁手啊?什么?怕是钝器?那你去杀只鸡送给杂货铺老板去!";end; 
		done_talk  =function (npc,player,td) return "看你面色红润,面带桃花……咳咳!总之,病好了就好啊~";end; 
	},
	[3	]={
		tid=3,		nid=4,		need_level=1,		name="儿时伙伴",	accepter="杂货铺老板1",	doner="元霜",
		award={
			{name="黄色项链",	num=1,		use=true},
			{name="经验",		num=200},
			{name="绑定金币",	num=2000},
		},
		accept_talk=function (npc,player,td) return "看你这样我也就放心了,元霜是你从小玩大的朋友,知道你醒了,约你进城逛街呢!你快去吧!";end; 
		done_talk  =function (npc,player,td) return "["..player:get_name().."],我等你半天了,怎么才来啊!怎么?不认识我了吗!人家好失望的哟!";end; 
	},
	[4	]={
		tid=4,		nid=5,		need_level=1,		name="伙伴调皮",	accepter="元霜",	doner="元霜",
		need_type="mon",	need_target="山羊",			need_num=1,
		award={
			{name="暗金戒指",	num=2,job='warrior',use=true},
			{name="棱角指环",	num=2,job='wizard',use=true},
			{name="透明戒指",	num=2,job='taoist',use=true},
			{name="经验",		num=400},
			{name="绑定金币",	num=4000},
		},
		accept_talk=function (npc,player,td) return "来迟了可是要接受我对你的惩罚的哟!你去打只山羊来给我好不好嘛!";end; 
		done_talk  =function (npc,player,td) return "真是个可爱的小家伙,嘻嘻~谢啦~";end; 
	},
	[5	]={
		tid=5,		nid=6,		need_level=1,		name="卖萌老太",	accepter="元霜",	doner="蒙老太",
		award={
			{name="经验",		num=300},
			{name="绑定金币",	num=3000},
		},
		accept_talk=function (npc,player,td) return "讨厌的蒙老太,知道你醒了立马要你去帮她干活了.那你快去快回吧!人家等你哦~";end; 
		done_talk  =function (npc,player,td) return "你知道咩?最近村里出现了很多蛤蟆怪,很是烦人!~";end; 
	},
	[6	]={
		tid=6,		nid=7,		need_level=1,		name="教训蛤蟆",	accepter="蒙老太",	doner="蒙老太",
		need_type="mon",	need_target="蛤蟆怪",			need_num=2,
		award={
			{name="经验",		num=600},
			{name="绑定金币",	num=3000},
		},
		accept_talk=function (npc,player,td) return "你去帮我抓几只蛤蟆怪来,让我看看到底是怎么回事吧!";end; 
		done_talk  =function (npc,player,td) return "你可真有本事啊!不一会儿就把这蛤蟆怪收拾的服服帖帖了~";end; 
	},
	[7	]={
		tid=7,		nid=8,		need_level=1,		name="夕阳红",	accepter="蒙老太",	doner="慕容仲伯",
		award={
			{name="铁质头盔",	num=1,		use=true},
			{name="经验",		num=400},
			{name="绑定金币",	num=3000},
		},
		accept_talk=function (npc,player,td) return "老太婆我还有一事相求,慕容俊这个老家伙真是老不正经,都一把年纪了,还要跟我来个夕阳红说的,这让我在村里怎么抬得起头啊,你去告诉他,我们不可能的!";end; 
		done_talk  =function (npc,player,td) return "开什么玩笑,我彩礼都准备好了,想不嫁,不说没门了,窗子都不带开的!";end; 
	},
	[8	]={
		tid=8,		nid=9,		need_level=1,		name="洋气的老头",	accepter="慕容仲伯",	doner="慕容仲伯",
		need_type="mon",		need_target="霜草",			need_num=1,
		award={
			{name="经验",		num=800},
			{name="绑定金币",	num=4000},
		},
		accept_talk=function (npc,player,td) return "你快去帮我采几朵花来,我马上就去向她求婚!";end; 
		done_talk  =function (npc,player,td) return "就采这么几颗烂菜叶叶,["..player:get_name().."],你可长点心吧!";end; 
	},
	[9	]={
		tid=9,		nid=10,		need_level=1,		name="俊秋落难",	accepter="慕容仲伯",	doner="慕容俊秋",
		award={
			{name="经验",		num=500},
			{name="绑定金币",	num=4000},
		},
		accept_talk=function (npc,player,td) return "好了好了,还是老朽我自己进城去买吧!我儿俊秋像是遇到了什么麻烦,你快去看看吧!";end; 
		done_talk  =function (npc,player,td) return "你可是那帮怪物请来的救兵?";end; 
	},
	[10	]={
		tid=10,		nid=11,		need_level=1,		name="制服狼人",	accepter="慕容俊秋",	doner="慕容俊秋",
		need_type="mon",	need_target="狼人",			need_num=2,
		award={
			{name="经验",		num=1200},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "["..player:get_name().."],原来是你啊,是我看走眼了,你莫要怪我才好!实在是最近谷中妖气大增,拥进了不少怪物,这不我旁边的狼人哭着喊着就想挠我一下,还好我有我的金钟罩.至于除掉它们嘛,还是交给你吧!";end; 
		done_talk  =function (npc,player,td) return "小样身手还是那么矫健啊!我可要对你刮目相看了!";end; 
	},
	[11	]={
		tid=11,		nid=12,		need_level=1,		name="初涉云霄",	accepter="慕容俊秋",	doner="秦沉言",
		award={
			{name="巨人手镯",		num=2,		use=true},
			{name="经验",		num=1500},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "给你个发展的机会吧!我的把兄弟秦沉言在城里当个小官,你去向他讨教讨教,看看能否混个一官半职的,发财了可得记着我啊!";end; 
		done_talk  =function (npc,player,td) return "你可是俊秋介绍来的?";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[12	]={
		tid=12,		nid=13,		need_level=1,		name="拜见城主",	accepter="秦沉言",	doner="上月空",
		award={
			{name="经验",		num=2000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "云霄城可是众所周知的大都市,想要的应有尽有.你大可以去逛逛,只是总要先去拜见一下城主大人的.城主上月空大人正在等你呢,快去吧!";end; 
		done_talk  =function (npc,player,td) return "你就是沉言说的["..player:get_name().."]啊,欢迎来到云霄城!";end; 
	},
	[13	]={
		tid=13,		nid=14,		need_level=1,		name="粗鲁匠工",	accepter="上月空",	doner="铁匠铺老板2",
		award={
			{name="经验",		num=2500},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "按说你第一次来我云霄城,我该领着你到处逛逛的,只是苦于公务缠身,无法陪你.你去找铁匠铺老板聊聊吧,说不定还能讨得件趁手的兵器!";end; 
		done_talk  =function (npc,player,td) return "闪开闪开!没看老子忙着呢!有话快说,有气快放!";end; 
	},
	[14	]={
		tid=14,		nid=15,		need_level=1,		name="变脸",	accepter="铁匠铺老板2",	doner="药店老板2",
		award={
			{name="经验",		num=3000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return " 啊!原来是上大人的人啊~失敬失敬!老朽正在为您打造兵器呢,你先去前面药店老板那边逛逛吧,我这马上就好!";end; 
		done_talk  =function (npc,player,td) return "小店药材齐全,保证药到病除,少侠看看需要点什么?";end; 
	},
	[15	]={
		tid=15,		nid=16,		need_level=1,		name="善良老板",	accepter="药店老板2",	doner="仓库管理员2",
		award={
			{name="经验",		num=3500},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "不买也不妨事.您再看看就是了!我看你行李也挺重的,背着多不方便,快放到前面的仓库哪里去吧!";end; 
		done_talk  =function (npc,player,td) return "你好!请问 需要什么帮助吗?";end; 
	},
	[16	]={
		tid=16,		nid=17,		need_level=1,		name="美女商人",	accepter="仓库管理员2",	doner="装备店老板2",
		award={
			{name="轻型铠甲(男)",	num=1,		gender='male',use=true},
			{name="轻型铠甲(女)",	num=1,		gender='female',use=true},
			{name="经验",		num=3000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "这东西啊放在我这你就把心放肚子里吧!要用的时候随时来取就是了!";end; 
		done_talk  =function (npc,player,td) return "少侠,请留步!您可是["..player:get_name().."]这是城主大人让我给你准备的衣服,你快穿上吧!";end; 
	},
	[17	]={
		tid=17,		nid=18,		need_level=1,		name="城主赐物",	accepter="装备店老板2",	doner="叶蓉",
		award={
			{name="死亡戒指",	num=2,job='warrior',use=true},
			{name="蝎眼戒指",	num=2,job='wizard',use=true},
			{name="纯白戒指",	num=2,job='taoist',use=true},
			{name="经验",		num=3500},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "城主大人可真是设想周到啊,还为你准备了些首饰放在了叶蓉那,你快快去取吧!";end; 
		done_talk  =function (npc,player,td) return "你怎么才来啊!等你半天了!";end; 
	},
	[18	]={
		tid=18,		nid=19,		need_level=1,		name="不耐烦",	accepter="叶蓉",	doner="南云",
		award={
			{name="黑水晶项链",	num=1,job='warrior',use=true},
			{name="檀木项链",	num=1,job='wizard',use=true},
			{name="黄水晶项链",	num=1,job='taoist',use=true},
			{name="经验",		num=4000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "要不要进老奴家里坐一会啊!算了算了,我看你也没时间的样子!";end; 
		done_talk  =function (npc,player,td) return "少侠留步!这是城主咬我转角给你的项链,少侠请万万收好!";end; 
	},
	[19	]={
		tid=19,		nid=20,		need_level=1,		name="冰柏相邀",	accepter="南云",	doner="冰柏",
		award={
			{name="经验",		num=4000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "冰柏这个名字你熟悉吗?他自称是你的旧相识!他就在前面你去看看吧!";end; 
		done_talk  =function (npc,player,td) return "呦!这不是老乡嘛~让我告诉你个惊人的秘密!在这云霄城的北侧有一处矿洞,里面的宝藏可想而知而知啊!";end; 
	},
	[20	]={
		tid=20,		nid=21,		need_level=1,		name="美差",	accepter="冰柏",	doner="依青",
		award={
			{name="八荒刀",	num=1,job='warrior',use=true},
			{name="魔叉",	num=1,job='wizard',use=true},
			{name="弯月刀",	num=1,job='taoist',use=true},
			{name="经验",		num=4000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "矿洞主人就再前面呢,他只需要你帮他个小忙就承诺给你一堆金银珠宝,怎么样?我这个老乡对你可不薄吧!";end; 
		done_talk  =function (npc,player,td) return "你就是大人差来的勇士?帮助我夺回矿洞的勇士?这是我给你的武器.快进去大战僵尸吧!";end; 
	},
	[21	]={
		tid=21,		nid=22,		need_level=1,		name="进入矿洞",	accepter="依青",	doner="司弈",
		award={
			{name="隐士头盔",	num=1,		use=true},
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "且慢,我已经派司家三兄弟前去探洞了,你可要找到他们啊~我钱都付了,他们却音信全无,莫不是骗我老头子~";end; 
		done_talk  =function (npc,player,td) return "什么?你也是被依青那个老头骗进来的?";end; 
	},
	[22	]={
		tid=22,		nid=23,		need_level=1,		name="首战僵尸",	accepter="司弈",	doner="司弈",
		need_type="mon",	need_target="瘸腿僵尸",			need_num=3,
		award={
			{name="经验",		num=12000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "先不多说了,你先助我打退这一波瘸腿僵尸吧!";end; 
		done_talk  =function (npc,player,td) return "少侠好武功!不是你我估计要葬身于这群尸爪之下了.";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player);end;
	},
	[23	]={
		tid=23,		nid=24,		need_level=1,		name="兄弟情谊",	accepter="司弈",	doner="司超",
		award={
			{name="防护手套",	num=2,job='warrior',use=true},
			{name="檀木手镯",	num=2,job='wizard',use=true},
			{name="道力手镯",	num=2,job='taoist',use=true},
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "我们兄弟三人都是被依青那个老家伙骗进来了,说什么这矿洞里面财宝无数,拿到了就全是我们的,没曾想进来就出不去了,兄弟三人也走散了.你能帮我去前面看看他们是否还活着?";end; 
		done_talk  =function (npc,player,td) return "我哥他还活着?你救了他?真是太感谢了,这是我刚打到的手镯,就赠与你吧!";end; 
	},
	[24	]={
		tid=24,		nid=25,		need_level=1,		name="采集铁矿",	accepter="司超",	doner="司超",
		need_type="mon",		need_target="铁矿",			need_num=2,
		award={
			{name="经验",		num=12000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "消灭这些僵尸没有好的武器可不行,这矿洞里的铁矿可是炼制武器的上佳材料,你去帮我采集2块吧!!";end; 
		done_talk  =function (npc,player,td) return "多谢少侠相助!只是我正忧心三弟安危,奈何我身受重伤,无力亲自去寻他?我看少侠慈悲心肠,定是能助我兄弟三人走出矿洞的.";end; 
	},
	[25	]={
		tid=25,		nid=26,		need_level=1,		name="寻人",	accepter="司超",	doner="司仕",
		award={
			{name="魔灵项链",	num=1,job='warrior',use=true},
			{name="白银项链",	num=1,job='wizard',use=true},
			{name="凤凰灵珠",	num=1,job='taoist',use=true},
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "三弟他就是沿着前面这条路走的,应该不会走出很远,你快去寻他吧!";end; 
		done_talk  =function (npc,player,td) return "你救了我两个哥哥,这点小意思还望笑纳!";end; 
	},
	[26	]={
		tid=26,		nid=27,		need_level=1,		name="最后一波",	accepter="司仕",	doner="司仕",
		need_type="mon",	need_target="爬行僵尸",			need_num=3,
		award={
			{name="经验",		num=12000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "只是你还需帮我一帮,打退这些爬行僵尸,我看着它们着实恶心,杀了他们真是脏了我的手!";end; 
		done_talk  =function (npc,player,td) return "少侠武功深不可测!你这一路走来,已为我们开辟了回家之路,多谢少侠!";end; 
	},
	[27	]={
		tid=27,		nid=28,		need_level=1,		name="拜见大人",	accepter="司仕",	doner="贺承念",
		award={
			{name="凝霜剑",	num=1,job='warrior',use=true},
			{name="偃月刀",	num=1,job='wizard',use=true},
			{name="降魔剑",	num=1,job='taoist',use=true},
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "其实我手上还有一个时空穿越符,奈何我兄弟三人落难在此,我不能丢弃他们.我可以先将你传送回去,你且把事情原委告知贺大人,让他一定要为我们做主啊!";end; 
		done_talk  =function (npc,player,td) return "侠士你经过了铁矿洞穴的考验!这是给你的奖励~";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[28	]={
		tid=28,		nid=80,		need_level=1,		name="考验",	accepter="贺承念",	doner="秦妍",
		award={
			{name="重铠甲(男)",	num=1,job='warrior',gender='male',use=true},
			{name="法师魔袍(男)",	num=1,job='wizard',gender='male',use=true},
			{name="灵魂道袍(男)",	num=1,job='taoist',gender='male',use=true},
			{name="重铠甲(女)",	num=1,job='warrior',gender='female',use=true},
			{name="法师魔袍(女)",	num=1,job='wizard',gender='female',use=true},
			{name="灵魂道袍(女)",	num=1,job='taoist',gender='female',use=true},
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "你莫要多说,事情原委我已知晓!司家兄弟连同矿主阿青跟你开了个玩笑,想要试探一下你功力如何,你果真没让我们失望啊!看你衣衫褴褛,我夫人一双玉手甚是灵巧,为你做了衣衫,你快去试上一试!";end; 
		done_talk  =function (npc,player,td) return "少侠快快穿上试试是否合身,不然奴家再改来!";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[29	]={
		tid=29,		nid=30,		need_level=1,		name="再帮一忙",	accepter="温泉老板娘",	doner="南宫翔冰",
		award={
			{name="死亡头盔",	num=1,use=true},
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "不行,你必须再帮我一忙！不然我心有不甘啊！家有一兄,名唤翔冰,在城中当差,多日不见,甚是挂念,少侠能否替我跑一趟,送些衣物与他!";end; 
		done_talk  =function (npc,player,td) return "我也很想念姐姐,等手上事情忙完,定是要回去看望她的!只是我现在是衙门的卧底.我扮作游历的诗人时刻盯着奴玛森林里面妖怪的动静~";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[30	]={
		tid=30,		nid=31,		need_level=1,		name="奴玛森林",	accepter="南宫翔冰",	doner="裴伊楚",
		award={
			{name="经验",		num=8000},
			{name="绑定金币",	num=6000},
		},
		accept_talk=function (npc,player,td) return "什么?你愿意帮我除去奴玛森林的妖怪,少侠可莫要说大话啊!也好,你助我除去妖怪,我也好早日回家!前些日子我夫人带着一个道长去了奴玛森林,至今不见回来~你可以先去找到他们问问情况!";end; 
		done_talk  =function (npc,player,td) return "那个没良心的人,人家说男怕入错行,女怕加错郎!你说我怎么这么倒霉啊,这么危险的地方他就把我一人放在这,自己却办成什么云游诗人在那泡美眉~";end; 
	},
	[31	]={
		tid=31,		nid=32,		need_level=1,		name="一探究竟",	accepter="裴伊楚",	doner="苍神薰",
		award={
			{name="经验",		num=8000},
			{name="绑定金币",	num=6000},
		},
		accept_talk=function (npc,player,td) return "算了,不提那个负心汉也罢.多亏苍道人施法将森林里面的怪物都困进了奴玛寺庙中,不然我早就性命不保了,他就在前面呢!具体情况你 可以问问他去!";end; 
		done_talk  =function (npc,player,td) return "不要阻碍平道施法!";end; 
	},
	[32	]={
		tid=32,		nid=33,		need_level=1,		name="进入寺庙",	accepter="苍神薰",	doner="司徒修",
		award={
			{name="经验",		num=8000},
			{name="绑定金币",	num=6000},
		},
		accept_talk=function (npc,player,td) return "你可是衙门派来的救兵?太好了!这下我们来个里应外合!这里面嘛,定是要你前去了.我的三个徒弟是司徒家的儿子,你帮我看看他们在里面怎么样了!";end; 
		done_talk  =function (npc,player,td) return "是师傅让你前来救我们兄弟三人的?";end; 
	},
	[33	]={
		tid=33,		nid=34,		need_level=1,		name="司徒老大",	accepter="司徒修",	doner="司徒修",
		need_type="mon",	need_target="奴玛战士",			need_num=5,
		award={
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "看你弱不禁风的样子,实在不像是能帮到我们什么忙啊!不然你先打退我周围的奴玛战士试试身手?";end; 
		done_talk  =function (npc,player,td) return "哎呦喂!还真是看不出来啊~身手还挺麻利的!";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player);end;
	},
	[34	]={
		tid=34,		nid=35,		need_level=1,		name="协助老二",	accepter="司徒修",	doner="司徒伊",
		award={
			{name="经验",		num=10000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "好了!我这暂时是没什么问题了,你去看看老二老三吧,应该就在前面不远的地方!";end; 
		done_talk  =function (npc,player,td) return "有没有人啊!快来帮帮我吧~实在是支撑不了了~";end; 
	},
	[35	]={
		tid=35,		nid=36,		need_level=1,		name="异形勇士",	accepter="司徒伊",	doner="司徒伊",
		need_type="mon",	need_target="奴玛勇士",			need_num=5,
		award={
			{name="战力手套",	num=2,job='warrior',use=true},
			{name="思魔手镯",	num=2,job='wizard',use=true},
			{name="清幽手镯",	num=2,job='taoist',use=true},
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "你,你……没错就是你!帮我杀掉这个奴玛勇士,我会给你大大的报酬的!";end; 
		done_talk  =function (npc,player,td) return "说到做到!这是给你的首饰和金银!怎么样?够意思吧!";end; 
	},
	[36	]={
		tid=36,		nid=37,		need_level=1,		name="老三呼救",	accepter="司徒伊",	doner="司徒智",
		award={
			{name="珊瑚战戒",	num=2,job='warrior',use=true},
			{name="魔力戒指",	num=2,job='wizard',use=true},
			{name="道力戒指",	num=2,job='taoist',use=true},
			{name="经验",		num=10000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "你可有听到老三的声音,哎呀!大事不好~三弟可别在这里面丢了性命啊,你快去找他一找!";end; 
		done_talk  =function (npc,player,td) return "终于见着正常人了!";end; 
	},
	[37	]={
		tid=37,		nid=38,		need_level=1,		name="斩杀战将",	accepter="司徒智",	doner="司徒智",
		need_type="mon",	need_target="奴玛战将",			need_num=5,
		award={
			{name="翡翠项链",	num=1,job='warrior',use=true},
			{name="魔力镜",	num=1,job='wizard',use=true},
			{name="道笛",	num=1,job='taoist',use=true},
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "莫要嫌我丢了男人的脸,这么多的怪物,我实在是抵挡不住了,看你的了少侠!";end; 
		done_talk  =function (npc,player,td) return "真是好武功,好身手啊!";end; 
	},
	[38	]={
		tid=38,		nid=39,		need_level=1,		name="回禀师傅",	accepter="司徒智",	doner="苍神薰",
		award={
			{name="经验",		num=10000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "经过你这一路走来,奴玛寺庙里面的怪物也死的死伤的伤了.我们兄弟三个留下来做最后的清扫工作就可以了,你快回去告诉师傅吧!";end; 
		done_talk  =function (npc,player,td) return "多谢少侠相救,如若不然,我那三个徒儿定是不能活着走出奴玛寺庙的!";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[39	]={
		tid=39,		nid=40,		need_level=1,		name="初入土城",	accepter="苍神薰",	doner="乔迎",
		award={
			{name="炼狱斧",	num=1,job='warrior',use=true},
			{name="魔杖",	num=1,job='wizard',use=true},
			{name="天尊银蛇",	num=1,job='taoist',use=true},
			{name="经验",		num=10000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "少侠有所不知,这奴玛森林是连接土城和云霄城这两大主城的交通要道,所以安全问题就显的尤为重要.怎么样?是不是想去土城看看了!哈哈……快去吧!";end; 
		done_talk  =function (npc,player,td) return "少侠可是["..player:get_name().."],城主大人差我在此等候多时了,这是给你的兵器!";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[40	]={
		tid=40,		nid=41,		need_level=1,		name="善良城主",	accepter="乔迎",	doner="苍昊云",
		award={
			{name="明月头盔",	num=1,use=true},
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "他老人家说你身上的装备到这边肯定是 不够用了.让我给你准备着.他在前面等你呢!";end; 
		done_talk  =function (npc,player,td) return "上月空这个老家伙飞鸽传出过来说银杏山谷的那个奇才醒了,说的就是你吧!";end; 
	},
	[41	]={
		tid=41,		nid=42,		need_level=1,		name="发小情",	accepter="苍昊云",	doner="以寒",
		award={
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "不急问我以往的事情,其实有时候遗忘何尝不是一件令人庆幸的事情呢!但是有个人你定是要见上一见的,她见到你也一定很开心!";end; 
		done_talk  =function (npc,player,td) return "["..player:get_name().."],果真是你!你真的醒了,真怕你有什么不测.你说你只是失忆了,没事的,痛苦的事情还是忘了吧!";end; 
	},
	[42	]={
		tid=42,		nid=43,		need_level=1,		name="以寒父",	accepter="以寒",	doner="楚时云",
		award={
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "元霜应该还在村里吧!等忙完这阵子我们一起回村里去找她玩吧!好了,也不能多聊了.我爹娘遇上了些麻烦,你能去帮帮忙吗?额……你知道我打小从文,从未习武过~";end; 
		done_talk  =function (npc,player,td) return "寒寒让你来的?可真是我了我的孩子了!我家老婆子独自去了荒漠就再也没出来了,我几次想进去都被妖气逼退了回来.";end; 
	},
	[43	]={
		tid=43,		nid=44,		need_level=1,		name="以寒母",	accepter="楚时云",	doner="祝之燃",
		award={
			{name="经验",		num=15000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "无奈便只能带上被褥,长年守候在此,只盼的我家老婆子早日回家!什么?你愿意前去寻她?唉!我还是不要太欢喜了,你进不进得去还得另说了!";end; 
		done_talk  =function (npc,player,td) return "我们家寒寒和我那老头子可好?这荒漠的妖气可真是不得了!怪物用妖气将我困于此地为它们打扫地盘.";end; 
	},
	[44	]={
		tid=44,		nid=45,		need_level=1,		name="进入洞穴",	accepter="祝之燃",	doner="左丘东",
		award={
			{name="经验",		num=20000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "他们还抓了左丘家族的人在里面挖洞穴?不知少侠有没有本事进的去那邪恶洞穴!";end; 
		done_talk  =function (npc,player,td) return "人类?我才不相信!开掌~<br><br>"..player:get_name()..":我真的是人啦!我是来救你们兄弟三人出去的!是祝大娘告诉我的!";end; 
	},
	[45	]={
		tid=45,		nid=46,		need_level=1,		name="解释清楚",	accepter="左丘东",	doner="左丘东",
		need_type="mon",	need_target="百足长虫",			need_num=5,
		award={
			{name="经验",		num=45000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "真不好意思,我真是被这些怪物搞的人畜不分了.";end; 
		done_talk  =function (npc,player,td) return "看看又来一波,这边的怪物还真是杀不完啊!";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player);end;
	},
	[46	]={
		tid=46,		nid=47,		need_level=1,		name="兵分三路",	accepter="左丘东",	doner="左丘南",
		award={
			{name="经验",		num=20000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "我们兄弟三人说好兵分三路,杀完所有怪物在这门口会合的!他们二弟和三弟怎么还不出来啊!<br><br>"..player:get_name()..":你就在这等吧!我进去找他们!";end; 
		done_talk  =function (npc,player,td) return "大哥就是大哥啊~比我们都快!";end; 
	},
	[47	]={
		tid=47,		nid=48,		need_level=1,		name="男儿强",	accepter="左丘南",	doner="左丘南",
		need_type="mon",	need_target="穿山甲",			need_num=5,
		award={
			{name="经验",		num=45000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "前面还有多远啊?我是不是也要到了啊!<br><br>"..player:get_name()..":你受伤了啊!这一波怪物交给我吧~";end; 
		done_talk  =function (npc,player,td) return "果然年轻就是资本啊!身手麻利多了~";end; 
	},
	[48	]={
		tid=48,		nid=49,		need_level=1,		name="客气三弟",	accepter="左丘南",	doner="左丘西",
		award={
			{name="龙之战戒",	num=2,job='warrior',bind=1,use=true},
			{name="红玛瑙戒指",	num=2,job='wizard',bind=1,use=true},
			{name="清幽戒指",	num=2,job='taoist',bind=1,use=true},
			{name="经验",		num=20000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "你再往里走走吧~三弟还在里面呢!不要有什么危险才好~";end; 
		done_talk  =function (npc,player,td) return "多谢你前来搭救我们兄弟三人~这是给你的小意思!";end; 
	},
	[49	]={
		tid=49,		nid=50,		need_level=1,		name="雇佣",	accepter="左丘西",	doner="左丘西",
		need_type="mon",	need_target="蠕虫",			need_num=5,
		award={
			{name="明月项链",	num=1,job='warrior',bind=1,use=true},
			{name="生命之链",	num=1,job='wizard',bind=1,use=true},
			{name="天珠项链",	num=1,job='taoist',bind=1,use=true},
			{name="经验",		num=45000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "我知道你来也就是为了点珠宝钱财的!我都给你,只要你把该办的事情办好!<br><br>"..player:get_name()..":你把我想成什么人了,不是祝大娘让我来看看你们我才不会进来!看你还小,我便不与你一般见识.";end; 
		done_talk  =function (npc,player,td) return "果真是好人啊!这是送给你的谢礼~";end; 
	},
	[50	]={
		tid=50,		nid=51,		need_level=1,		name="回到土城",	accepter="左丘西",	doner="楚时云",
		award={
			{name="经验",		num=20000},
			{name="绑定金币",	num=10000},
		},
		accept_talk=function (npc,player,td) return "你受伤了吗?这样吧~我先把你送出去!我去跟我两个哥哥会合~";end; 
		done_talk  =function (npc,player,td) return "怎么样?我家老婆子还好吧!";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[51	]={
		tid=51,		nid=52,		need_level=1,		name="以寒薄礼",	accepter="楚时云",	doner="以寒",
		award={
			{name="审判之杖",	num=1,job='warrior',bind=1,use=true},
			{name="骨玉法杖",	num=1,job='wizard',bind=1,use=true},
			{name="龙渊剑",	num=1,job='taoist',use=true},
			{name="经验",		num=40000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "多谢少侠搭救啊~我让以寒为你准备件更为趁手的兵器~你快去取吧!";end; 
		done_talk  =function (npc,player,td) return ""..player:get_name()..":咱们是发小了,这点小事还客气啥!<br>这是爹让准备的,你就拿了吧!";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[52	]={
		tid=52,		nid=53,		need_level=1,		name="以寒相求",	accepter="以寒",	doner="禹峰",
		award={
			{name="战神铠甲(男)",	num=1,job='warrior',gender='male',bind=1,use=true},
			{name="恶魔法袍(男)",	num=1,job='wizard',gender='male',bind=1,use=true},
			{name="幽灵道袍(男)",	num=1,job='taoist',gender='male',bind=1,use=true},
			{name="战神铠甲(女)",	num=1,job='warrior',gender='female',bind=1,use=true},
			{name="恶魔法袍(女)",	num=1,job='wizard',gender='female',bind=1,use=true},
			{name="幽灵道袍(女)",	num=1,job='taoist',gender='female',bind=1,use=true},
			{name="经验",		num=50000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "看见我身后的城堡了吗?告诉你个不好的消息,猪妖已经进城了,它们在这上面挖了山洞,自封为王了!城主派武馆的禹式兄弟去绞杀了,你能去看看吗!我好生担心禹峰啊~你能懂的,是不是?";end; 
		done_talk  =function (npc,player,td) return "让以寒姑娘为我担心了,在下实在罪该万死~";end; 
	},
	[53	]={
		tid=53,		nid=54,		need_level=1,		name="两情相悦",	accepter="禹峰",	doner="禹峰",
		need_type="mon",	need_target="红猪妖",			need_num=5,
		award={
			{name="祈福头盔",	num=1,bind=1,use=true},
			{name="经验",		num=120000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "若我能平安出去,定是要娶以寒姑娘为妻的!<br><br>"..player:get_name()..":看你有情有意的,我也定是要祝你们兄弟一臂之力的!";end; 
		done_talk  =function (npc,player,td) return "多谢少侠!这个头盔是我打到的,送与你当作礼物吧!";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player);end;
	},
	[54	]={
		tid=54,		nid=55,		need_level=1,		name="有情有义",	accepter="禹峰",	doner="禹言",
		award={
			{name="狂战手镯",	num=2,job='warrior',bind=1,use=true},
			{name="龙之魔镯",	num=2,job='wizard',bind=1,use=true},
			{name="三眼道镯",	num=2,job='taoist',bind=1,use=true},
			{name="经验",		num=50000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "只是我仍担心着我两个兄弟,我们一起进去找他们,您意下如何?";end; 
		done_talk  =function (npc,player,td) return "不远就听到你和我哥的交谈了!我也先送上我的一点小意思!";end; 
	},
	[55	]={
		tid=55,		nid=56,		need_level=1,		name="大战猪妖",	accepter="禹言",	doner="禹言",
		need_type="mon",	need_target="黑猪妖",			need_num=5,		
		award={
			{name="经验",		num=120000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "哈哈~不送你点装备,你怎肯帮我杀死这些个黑猪妖啊~";end; 
		done_talk  =function (npc,player,td) return "太好了,我们走吧~";end; 
	},
	[56	]={
		tid=56,		nid=57,		need_level=1,		name="寻找三弟",	accepter="禹言",	doner="禹诺",
		award={
			{name="力量之戒",	num=2,job='warrior',bind=1,use=true},
			{name="紫螺戒",	num=2,job='wizard',bind=1,use=true},
			{name="泰坦之戒",	num=2,job='taoist',bind=1,use=true},
			{name="经验",		num=50000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "一起去找我那三弟去~然后我们就可以团圆咯!";end; 
		done_talk  =function (npc,player,td) return "我两个哥哥都送了谢礼了,我不送实在是说不过去了啊!";end; 
	},
	[57	]={
		tid=57,		nid=58,		need_level=1,		name="重口味",	accepter="禹诺",	doner="禹诺",
		need_type="mon",	need_target="食人蛾",			need_num=5,
		award={
			{name="经验",		num=120000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "这些食人蛾肉质鲜美,定是能给我哥新婚晚宴上增添一道美味佳肴的.";end; 
		done_talk  =function (npc,player,td) return "不错不错,看上去就是美味佳肴!";end; 
	},
	[58	]={
		tid=58,		nid=59,		need_level=1,		name="再回土城",	accepter="禹诺",	doner="以寒",
		award={
			{name="经验",		num=50000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "好了,我们回去吧~回去就可以吃喜酒咯!我什么时候能当上叔叔呢~";end; 
		done_talk  =function (npc,player,td) return "禹峰都胡说些什么啊!谁答应嫁他了!真是的~";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[59	]={
		tid=59,		nid=60,		need_level=1,		name="女儿娇",	accepter="以寒",	doner="路驰",
		award={
			{name="绿玉项链",	num=1,job='warrior',bind=1,use=true},
			{name="邪恶铃铛",	num=1,job='wizard',bind=1,use=true},
			{name="道魂项链",	num=1,job='taoist',bind=1,use=true},
			{name="经验",		num=80000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "我这就去揍他~对了,路驰说带你去王城见见世面呢,在城外等你呢!";end; 
		done_talk  =function (npc,player,td) return "你来拉,我等候你多时了!";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[60	]={
		tid=60,		nid=61,		need_level=1,		name="初入王城",	accepter="路驰",	doner="张振海",
		award={
			{name="经验",		num=80000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "王城可是皇上居住的地方,进去看看就好,可别胡乱走动,胡言乱语.好了,你这就上路吧!";end; 
		done_talk  =function (npc,player,td) return "大胆!王城重地,何人胆敢来此~";end; 
		accept_hook=function(npc,player,td) player:set_task_param(task_id,4,0);end;
	},
	[61	]={
		tid=61,		nid=62,		need_level=1,		name="皇宫禁地",	accepter="张振海",	doner="白问锦",
		award={
			{name="经验",		num=80000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "前面就是皇宫入口了,你的参观也就在这边止步吧!来这参观也不是免费,什么?没带钱?那你就去猛犸森林去大冒险吧!没有别的选择了~";end; 
		done_talk  =function (npc,player,td) return "哎呦喂!又是个被罚来大冒险的啊?";end; 
	},
	[62	]={
		tid=62,		nid=63,		need_level=1,		name="猛犸寺庙",	accepter="白问锦",	doner="安陵",
		award={
			{name="经验",		num=80000},
			{name="绑定金币",	num=20000},
		},
		accept_talk=function (npc,player,td) return "行啦!没空跟你废话!没看我被子都铺下了,就准备睡觉了!自己进去吧!";end; 
		done_talk  =function (npc,player,td) return "什么人?尽然来跟我们抢宝贝!安平、安期快来将他杀了灭口!";end; 
	},
	[63	]={
		tid=63,		nid=64,		need_level=1,		name="巧遇",	accepter="安陵",	doner="安陵",
		need_type="mon",	need_target="蛇蝎",			need_num=5,
		award={
			{name="经验",		num=220000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "什么?你说以寒,你跟她什么关系?算了!先不说,你帮我抓些蝎子回来再说~";end; 
		done_talk  =function (npc,player,td) return "什么?你说她就要嫁给禹峰了?不可能的~";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player);end;
	},
	[64	]={
		tid=64,		nid=65,		need_level=1,		name="痴情种子",	accepter="安陵",	doner="安平",
		award={
			{name="经验",		num=100000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "以寒姑娘一直是喜欢我的!怎么会嫁给那个穷小子~<br><br>"..player:get_name()..":（这个人是不是疯了,还是不要理他了,我还是走吧……）";end; 
		done_talk  =function (npc,player,td) return "少侠留步,请问有看到我弟弟安陵吗?";end; 
	},
	[65	]={
		tid=65,		nid=66,		need_level=1,		name="无奈兄弟",	accepter="安平",	doner="安平",
		need_type="mon",	need_target="猛犸雕像",			need_num=5,
		award={
			{name="经验",		num=220000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "唉~都是为了帮他追求以寒小姐,我们冒着生命危险前来打些蝎肉,抢些宝藏什么的!";end; 
		done_talk  =function (npc,player,td) return "没办法啊~他是家里最小的,爹娘都让我们让着他~苦命啊~";end; 
	},
	[66	]={
		tid=66,		nid=67,		need_level=1,		name="找到安期",	accepter="安平",	doner="安期",
		award={
			{name="经验",		num=100000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "是的~我们还有个兄弟,叫安期,你能去找到他让他快回来吗?这里面的危险比我们预计的大多了!";end; 
		done_talk  =function (npc,player,td) return "嘘!前面有帮猛犸卫士来了!";end; 
	},
	[67	]={
		tid=67,		nid=68,		need_level=1,		name="杀掉卫士",	accepter="安期",	doner="安期",
		need_type="mon",	need_target="猛犸卫士",			need_num=5,
		award={
			{name="经验",		num=220000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "看来要杀死他们才能出去了!求少侠助我一臂之力!";end; 
		done_talk  =function (npc,player,td) return "少侠好武功啊!不是你我肯定是尸骨无存了!";end; 
	},
	[68	]={
		tid=68,		nid=69,		need_level=1,		name="冒险结束",	accepter="安期",	doner="以寒",
		award={
			{name="经验",		num=100000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "咱们回去吧~我那两个兄弟也应该自行出去了,你大可不必担心~";end; 
		done_talk  =function (npc,player,td) return "你回来了!怎么样?王城可好玩?你有见到皇上吗?";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[69	]={
		tid=69,		nid=70,		need_level=1,		name="新的旅途",	accepter="以寒",	doner="地图传送员1",
		award={
			{name="经验",		num=100000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "没想到你这一去这么曲折.更没想到安陵竟然为了我去冒险~";end; 
		done_talk  =function (npc,player,td) return "好了,你们两别在那儿女情长的唠嗑了!";end; 
		accept_hook=function (npc,player,td) gm.gm.mount3(player);end;
	},
	[70	]={
		tid=70,		nid=82,		need_level=1,		name="孤月岛",	accepter="地图传送员1",	doner="孤月岛主",
		award={
			{name="经验",		num=100000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "孤月岛出了些麻烦,孤月岛主正到处招募人才呢,好处可是不少的哟!怎么样?动心了吧!我这就把你送过去!";end; 
		done_talk  =function (npc,player,td) return "又是从土城来的?我还能再相信那边送来的人吗?进去一个死一个,进去一个死一个!<br><br>"..player:get_name()..":讲的那么吓人,到底什么事啊!";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[71	]={
		tid=71,		nid=72,		need_level=1,		name="大战蛮牛",	accepter="林奕莲",	doner="韩飞",
		award={
			{name="经验",		num=150000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "没想到你这么聪明呀!快去蛮牛洞找下韩飞吧!~";end; 
		done_talk  =function (npc,player,td) return "你也是被孤月岛主夫妇骗进来受死的嘛?";end; 
	},
	[72	]={
		tid=72,		nid=73,		need_level=1,		name="魔化战士",	accepter="韩飞",	doner="韩飞",
		need_type="mon",	need_target="蛮牛战士",			need_num=5,
		award={
			{name="经验",		num=320000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "什么暴乱,就是原本守在这边的战士们都被魔化了,我怀疑还有什么不可告人的秘密!";end; 
		done_talk  =function (npc,player,td) return "看你身手真的不一般啊!师出哪一门啊?";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player);end;
	},
	[73	]={
		tid=73,		nid=74,		need_level=1,		name="魔化生物",	accepter="韩飞",	doner="韩士",
		award={
			{name="经验",		num=150000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "原来是银杏山谷走出来的啊!那里可是盛产武林奇才的~不知道我哥在前面有没有找到战士魔化的起因~";end; 
		done_talk  =function (npc,player,td) return "什么?你说你是一路打过来的?不止蛮牛洞?世界各地都出现了魔化生物?";end; 
	},
	[74	]={
		tid=74,		nid=75,		need_level=1,		name="研究抗体",	accepter="韩士",	doner="韩士",
		need_type="mon",	need_target="蛮牛斗士",			need_num=5,
		award={
			{name="经验",		num=320000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "既然来了,我们就不要放过这个大好的机会,抓点蛮牛斗士回去,看看是否是被魔气所控!";end; 
		done_talk  =function (npc,player,td) return "太棒了,还抓了个活的,我这就回去闭关研究,定是能将抗体研究出来解救众生的!";end; 
	},
	[75	]={
		tid=75,		nid=76,		need_level=1,		name="传递抗体",	accepter="韩士",	doner="韩耀",
		award={
			{name="经验",		num=150000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "看我神一样的速度,这就是能将这群怪物改邪归正的抗体,只需一一喷在他们的颈后,他们就能恢复正常了!你去给我弟弟韩耀送点吧~";end; 
		done_talk  =function (npc,player,td) return "我哥给你的抗体?他是什么时候学会科学研究了?";end; 
	},
	[76	]={
		tid=76,		nid=77,		need_level=1,		name="试验",	accepter="韩耀",	doner="韩耀",
		need_type="mon",	need_target="蛮牛法师",			need_num=5,
		award={
			{name="经验",		num=320000},
			{name="绑定金币",	num=50000},
		},
		accept_talk=function (npc,player,td) return "我可不相信,不然你去拿那些蛮牛法师试验看看……";end; 
		done_talk  =function (npc,player,td) return "啊~果真有效啊!真的全死了啊~";end; 
	},
	[77	]={
		tid=77,		nid=78,		need_level=1,		name="重聚",	accepter="韩耀",	doner="以寒",
		award={
			{name="经验",		num=200000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "既然已经研究出了抗体,这个世界终于可以归于平静了~你快回去把这个好消息告诉大家伙吧~";end; 
		done_talk  =function (npc,player,td) return "["..player:get_name().."],你回来了!我真是担心你会遇到什么不测呢!看你平安回来就好啦~";end; 
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[78	]={
		tid=78,		nid=79,		need_level=1,		name="储备药物",	accepter="以寒",	doner="药店老板3",
		award={
			{name="经验",		num=200000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "什么抗体?没用的~各地的怪物还在肆虐,还时不时来城里骚扰.你可能还需要继续战斗!去药店老板那备点药吧~必要时兴许能救你一命~";end; 
		done_talk  =function (npc,player,td) return "这沙漠土城历经千年万载,至今屹立不倒,被世人称为奇迹之城.世界上奇人高人常常在此现身.";end; 
		accept_hook=function (npc,player,td) ckpanel.open_yjchushou(player); end;
	},
	[79	]={
		tid=79,		nid=83,		need_level=1,		name="城主警言",	accepter="药店老板3",	doner="地图传送员1",
		award={
			{name="强效太阳水(包)",	num=5},
			{name="经验",		num=300000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "呵呵~唠叨这么多了!言归正传~本店专治疑难杂症,跌打损伤,若有需求尽管来找我.来买点药,放在身上,关键时候定能救你性命!";end; 
		done_talk  =function (npc,player,td) return "孩子!你的战斗才刚刚开始~各地妖魔猖獗!你肩上的重担挑着的是我们世人的身家性命!请受老夫一拜~继续前进~";end; 
		done_hook=function (npc,player,td) ckpanel.tempVip(player); ckpanel.miniEffShow(player,1,1); player:set_task_state(3100,1); player:push_task_data(3100,0); end;
	},
	[80	]={
		tid=80,		nid=81,		need_level=1,		name="休闲一会",	accepter="秦妍",	doner="温泉老板娘",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		accept_talk=function (npc,player,td) return "不是奴家手巧,定是大人身形健硕,穿什么衣服都是有模有样!看你略显疲态,前面就是我们云霄城有名的温泉馆了,何不进去泡上一泡！";end; 
		done_talk  =function (npc,player,td) return "高档温泉会所,童叟无欺！";end; 
	},
	[81	]={
		tid=81,		nid=29,		need_level=1,		name="帮忙抓鱼",	accepter="温泉老板娘",	doner="温泉老板娘",
		need_type="mon",		need_target="鱼1",			need_num=2,
		award={
			{name="经验",		num=10000},
			{name="绑定金币",	num=4000},
		},
		accept_talk=function (npc,player,td) return "本店现有优惠活动如下：凡是在温泉中捉2条鱼交予我的,当天消费全部免单！";end; 
		done_talk  =function (npc,player,td) return "这鱼这么好捉啊！这活动要把我亏死啦！";end; 
		accept_hook=function (npc,player,td) gm.gm.unmount(player); posmon.fly(player,"鱼1");player:alert(1,1,"帮老板娘捕捉5条[鱼]"); end;
	},
	[82	]={
		tid=82,		nid=71,		need_level=1,		name="岛主夫人",	accepter="孤月岛主",	doner="林奕莲",
		award={
			{name="经验",		num=100000},
			{name="绑定金币",	num=30000},
		},
		accept_talk=function (npc,player,td) return "具体情况，你去问问我夫人吧，她就守在那蛮牛洞口。";end; 
		done_talk  =function (npc,player,td) return "你也是传说中的武林奇才吗？";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function(npc,player,td) player:set_task_param(task_id,4,0);end;
	},
	[83	]={
		tid=83,		nid=84,		need_level=50,		name="妖月传说",	accepter="地图传送员1",	doner="凌宇",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "白云观的凌家兄弟要求我们派人过去协助调查妖月峡谷的异动，你速去找凌宇报道吧。";end; 
		done_talk  =function (npc,player,td) return "你是土城派来的勇士吧？";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[84	]={
		tid=84,		nid=85,		need_level=50,		name="初探妖月",	accepter="凌宇",	doner="凌宇",
		need_type="mon",	need_target="狼牙蜘蛛",			need_num=10,
		award={
			{name="经验",		num=336000},
			{name="绑定金币",	num=50000},
			{name="屠龙刀",	        num=1,job='warrior',bind=1,use=true},
			{name="魔魂法杖",	num=1,job='wizard',bind=1,use=true},
			{name="玄天剑",	        num=1,job='taoist',bind=1,use=true},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "妖月峡谷之内，涌现了大量的巨型蜘蛛，你去调查一下是什么原因造成的吧。";end; 
		done_talk  =function (npc,player,td) return "这些巨型蜘蛛体型巨大，攻击性强，你虽除去了一部分，但是还是凶险万分。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[85	]={
		tid=85,		nid=86,		need_level=50,		name="蜘蛛洞穴",	accepter="凌宇",	doner="凌峰",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="天神战甲",	num=1,job='warrior',gender='male',use=true},
			{name="魔神披风",	num=1,job='wizard',gender='male',use=true},
			{name="天师道袍",	num=1,job='taoist',gender='male',use=true},
			{name="天神战衣",	num=1,job='warrior',gender='female',use=true},
			{name="魔神羽衣",	num=1,job='wizard',gender='female',use=true},
			{name="天师道衣",	num=1,job='taoist',gender='female',use=true},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "二弟深入洞穴内部，已失去联系，劳烦勇士帮我去寻一下二弟吧。";end; 
		done_talk  =function (npc,player,td) return "大哥让你来找我？";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[86	]={
		tid=86,		nid=87,		need_level=50,		name="再探妖月",	accepter="凌峰",	doner="凌峰",
		need_type="mon",	need_target="妖魔蜘蛛",		need_num=10,
		award={
			{name="经验",		num=345546},
			{name="绑定金币",	num=55000},
			{name="战圣头盔",	num=1,job='warrior',bind=1,use=true},
			{name="魔神头盔",	num=1,job='wizard',bind=1,use=true},
			{name="天师头盔",	num=1,job='taoist',bind=1,use=true},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "妖月峡谷之内竟然有会飞的要蜘蛛，你去杀一些，帮我收集一些。";end; 
		done_talk  =function (npc,player,td) return "难道真的道高一尺魔高一丈么……";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[87	]={
		tid=87,		nid=88,		need_level=50,		name="剧毒蜘蛛",	accepter="凌峰",	doner="凌戟",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="战圣项链",	num=1,job='warrior',bind=1,use=true},
			{name="魔神项链",	num=1,job='wizard',bind=1,use=true},
			{name="天师项链",	num=1,job='taoist',bind=1,use=true},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "我三弟热心药术，都快走火入魔了。前阵子让我收集毒液，我耽搁了一阵子，竟然自己走到洞中去找了，请大侠帮我寻回三弟";end; 
		done_talk  =function (npc,player,td) return "太好了，二哥派人来帮我了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[88	]={
		tid=88,		nid=89,		need_level=50,		name="三探妖月",	accepter="凌戟",	doner="凌戟",
		need_type="mon",	need_target="妖毒蜘蛛",		need_num=15,
		award={
			{name="经验",		num=358400},
			{name="绑定金币",	num=60000},
			{name="战圣手镯",	num=2,job='warrior',bind=1,use=true},
			{name="魔神手镯",	num=2,job='wizard',bind=1,use=true},
			{name="天师手镯",	num=2,job='taoist',bind=1,use=true},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "去妖月峡谷，在妖毒蜘蛛身上提取毒液，我要研究以毒攻毒之法。";end; 
		done_talk  =function (npc,player,td) return "这些毒液应该够用了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[89	]={
		tid=89,		nid=90,		need_level=50,		name="配送秘药",	accepter="凌戟",	doner="凌云",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "老四老五是和我一起来的，我醉心药术，就在此地留下了，你去帮我找下我的弟弟们吧。";end; 
		done_talk  =function (npc,player,td) return "终于来帮手了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[90	]={
		tid=90,		nid=91,		need_level=50,		name="血战妖月",	accepter="凌云",	doner="凌云",
		need_type="mon",	need_target="钢刺蜘蛛",			need_num=15,
		award={
			{name="经验",		num=368640},
			{name="绑定金币",	num=65000},
			{name="战圣戒指",	num=2,job='warrior',bind=1,use=true},
			{name="魔神戒指",	num=2,job='wizard',bind=1,use=true},
			{name="天师戒指",	num=2,job='taoist',bind=1,use=true},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "钢刺蜘蛛凶猛异常，尤其一对钢刺，锋利无比，去杀死他们，减少对我们的威胁。";end; 
		done_talk  =function (npc,player,td) return "多亏有了你，真是场恶战。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[91	]={
		tid=91,		nid=92,		need_level=50,		name="妖月蜘蛛",	accepter="凌云",	doner="凌战",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "深处似乎传来了老五的求救的声音，你去帮帮他吧。";end; 
		done_talk  =function (npc,player,td) return "俺才没有求救，洒家正站的痛快。。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[92	]={
		tid=92,		nid=153,		need_level=50,		name="永绝后患",	accepter="凌战",	doner="凌战",
		need_type="mon",	need_target="赤锷蜘蛛",			need_num=15,
		award={
			{name="经验",		num=372960},
			{name="绑定金币",	num=70000},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "去清除妖月峡谷的赤锷蜘蛛，永绝后患。";end; 
		done_talk  =function (npc,player,td) return "妖月峡谷这下应该安全了。";end;
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[93	]={
		tid=93,		nid=94,		need_level=55,		name="石窟之谜",	accepter="地图传送员1",	doner="探险队长",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "前阵子探险队发现了一个巨大的石窟后就失踪了，你去查看一下，看是否有幸存者。";end; 
		done_talk  =function (npc,player,td) return "快来帮帮我。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[94	]={
		tid=94,		nid=95,		need_level=55,		name="石窟异动",	accepter="探险队长",	doner="探险队长",
		need_type="mon",	need_target="巨灵勇士",		need_num=20,
		award={
			{name="经验",		num=393000},
			{name="绑定金币",	num=75000},
			{name="凤天战甲·武威",	num=1,job='warrior',gender='male',use=true},
			{name="凤天战甲·烈焰",	num=1,job='wizard',gender='male',use=true},
			{name="凤天战甲·无极",	num=1,job='taoist',gender='male',use=true},
			{name="凤天战衣·武威",	num=1,job='warrior',gender='female',use=true},
			{name="凤天战衣·烈焰",	num=1,job='wizard',gender='female',use=true},
			{name="凤天战衣·无极",	num=1,job='taoist',gender='female',use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "前阵子探险队发现了一个巨大的石窟后就失踪了，你去查看一下，看是否有幸存者。";end; 
		done_talk  =function (npc,player,td) return "原来石窟下竟然这么凶险。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[95	]={
		tid=95,		nid=96,		need_level=55,		name="一线生机",	accepter="探险队长",	doner="胆小的车夫",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="天地头盔",	num=1,job='warrior',bind=1,use=true},
			{name="乾坤头盔",	num=1,job='wizard',bind=1,use=true},
			{name="无极头盔",	num=1,job='taoist',bind=1,use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "我的探险队，主要的任务是护送云霄城重要货物，我的队员都跑散了，你去帮我找找他们吧。";end; 
		done_talk  =function (npc,player,td) return "快来救我。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[96	]={
		tid=96,		nid=97,		need_level=55,		name="矢石之难",	accepter="胆小的车夫",	doner="胆小的车夫",
		need_type="mon",	need_target="巨灵战士",		need_num=20,
		award={
			{name="经验",		num=413400},
			{name="绑定金币",	num=80000},
			{name="天地项链",	num=1,job='warrior',bind=1,use=true},
			{name="乾坤项链",	num=1,job='wizard',bind=1,use=true},
			{name="无极项链",	num=1,job='taoist',bind=1,use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "有人发现巨灵战士还带着我们先遣队的饰物，去巨灵石窟击杀巨灵战士，夺回殉难者的尊严。";end; 
		done_talk  =function (npc,player,td) return "这下他们可以安息了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[97	]={
		tid=97,		nid=98,		need_level=55,		name="百密一疏",	accepter="胆小的车夫",	doner="蒋神算",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "老实讲，我觉得我们这趟货运得很蹊跷，昼伏夜行，没走过大路。你去找下账房，也许他知道些什么。";end; 
		done_talk  =function (npc,player,td) return "这次竟然百密一疏。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[98	]={
		tid=98,		nid=99,		need_level=55,		name="铁石心肠",	accepter="蒋神算",	doner="蒋神算",
		need_type="mon",	need_target="巨灵战斧",		need_num=20,
		award={
			{name="经验",		num=463104},
			{name="绑定金币",	num=85000},
			{name="天地护腕",	num=2,job='warrior',bind=1,use=true},
			{name="乾坤护腕",	num=2,job='wizard',bind=1,use=true},
			{name="无极护腕",	num=2,job='taoist',bind=1,use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "巨灵战斧对我们是个威胁，去除掉他们。";end; 
		done_talk  =function (npc,player,td) return "感谢你,["..player:get_name().."],为我们带来了胜利的希望。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[99	]={
		tid=99,		nid=100,	need_level=55,		name="秘密行进",	accepter="蒋神算",	doner="王老爷",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="天地戒指",	num=2,job='warrior',bind=1,use=true},
			{name="乾坤戒指",	num=2,job='wizard',bind=1,use=true},
			{name="无极戒指",	num=2,job='taoist',bind=1,use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "我只是管账的，对其他的一概不知道。不过，老爷穿着便装，混在众人之间，你可以去问问老爷，顺便让他帮我把工钱结了。";end; 
		done_talk  =function (npc,player,td) return "我有的是钱，救了我，我可以大大的赏你。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[100	]={
		tid=100,	nid=101,	need_level=55,		name="裂石穿云",	accepter="王老爷",	doner="王老爷",
		need_type="mon",	need_target="巨灵守卫",			need_num=20,
		award={
			{name="经验",		num=515116},
			{name="绑定金币",	num=90000},
			{name="天地腰带",	num=1,job='warrior',bind=1,use=true},
			{name="乾坤腰带",	num=1,job='wizard',bind=1,use=true},
			{name="无极腰带",	num=1,job='taoist',bind=1,use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "巨灵守卫驻守着巨灵石窟三层，去杀死他们，找到巨灵石窟的秘密。";end; 
		done_talk  =function (npc,player,td) return "这下我们离石窟的秘密又进了一步。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[101	]={
		tid=101,	nid=102,	need_level=55,		name="父子连心",	accepter="王老爷",	doner="王强",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "找到我儿子，一切才有商量。";end; 
		done_talk  =function (npc,player,td) return "父亲派你来的？";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[102	]={
		tid=102,	nid=154,	need_level=55,		name="电光火石",	accepter="王强",	doner="王强",
		need_type="mon",	need_target="巨灵守卫",			need_num=20,
		award={
			{name="经验",		num=568002},
			{name="绑定金币",	num=95000},
			{name="天地靴",	num=1,job='warrior',bind=1,use=true},
			{name="乾坤靴",	num=1,job='wizard',bind=1,use=true},
			{name="无极靴",	num=1,job='taoist',bind=1,use=true},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "狭路相逢勇者胜，既然巨灵们不会与我们和平相处，我们只有一战定生死。";end; 
		done_talk  =function (npc,player,td) return "终于解决巨灵石窟的危机了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[103	]={
		tid=103,	nid=104,	need_level=60,		name="混沌初现",	accepter="地图传送员1",	doner="许烦了",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "远方突然出现了一片混沌之光，你去与前线将官汇合，看看是什么原因。";end; 
		done_talk  =function (npc,player,td) return "叫我长官！！";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[104	]={
		tid=104,	nid=105,	need_level=60,		name="混沌魔境",	accepter="许烦了",	doner="许烦了",
		need_type="mon",	need_target="混沌斗士",			need_num=20,
		award={
			{name="经验",		num=620009},
			{name="绑定金币",	num=100000},
			{name="凌云剑·武威",	num=1,job='warrior',use=true},
			{name="凌云剑·烈焰",	num=1,job='wizard',use=true},
			{name="凌云剑·无极",	num=1,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "混沌究竟是什么呢，你去混沌之门探索一下吧。";end; 
		done_talk  =function (npc,player,td) return "这难道就是混沌么。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[105	]={
		tid=105,	nid=106,	need_level=60,		name="混沌困境",	accepter="许烦了",	doner="不辣",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "烦死了，不辣那小子又给我惹麻烦了，你去帮帮他吧。";end; 
		done_talk  =function (npc,player,td) return "不是我！！";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[106	]={
		tid=106,	nid=107,	need_level=60,		name="混沌守卫",	accepter="不辣",	doner="不辣",
		need_type="mon",	need_target="混沌侍卫",			need_num=20,
		award={
			{name="经验",		num=668416},
			{name="绑定金币",	num=105000},
			{name="凌云头盔·武威",	num=1,job='warrior',use=true},
			{name="凌云头盔·烈焰",	num=1,job='wizard',use=true},
			{name="凌云头盔·无极",	num=1,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "混沌之门的守卫，勇猛无比，去击杀他们，让我们的大军有机会冲进去。";end; 
		done_talk  =function (npc,player,td) return "少了守卫，攻破混沌之门就指日可待了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[107	]={
		tid=107,	nid=108,	need_level=60,		name="混沌之声",	accepter="不辣",	doner="小译",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "麻烦，我才不是最麻烦的。你去见见小译就知道什么叫麻烦了。";end; 
		done_talk  =function (npc,player,td) return "不辣又说我坏话了吧。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[108	]={
		tid=108,	nid=109,	need_level=60,		name="混沌军势",	accepter="小译",	doner="小译",
		need_type="mon",	need_target="混沌将军",			need_num=20,
		award={
			{name="经验",		num=709198},
			{name="绑定金币",	num=110000},
			{name="凌云项链·武威",	num=1,job='warrior',use=true},
			{name="凌云项链·烈焰",	num=1,job='wizard',use=true},
			{name="凌云项链·无极",	num=1,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "混沌之门的将军们，誓死守护着远古的秘密。杀死他们，既然他们不说，就让秘密伴随他们长眠。";end; 
		done_talk  =function (npc,player,td) return "这下就安全了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[109	]={
		tid=109,	nid=110,	need_level=60,		name="混沌迷龙",	accepter="小译",	doner="迷龙",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="凌云护腕·武威",	num=2,job='warrior',use=true},
			{name="凌云护腕·烈焰",	num=2,job='wizard',use=true},
			{name="凌云护腕·无极",	num=2,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "迷龙这家伙，虽然膀大腰圆，但是老是迷迷糊糊的。你去他那里帮忙吧。";end; 
		done_talk  =function (npc,player,td) return "我是迷龙。恩，对，迷龙。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[110	]={
		tid=110,	nid=111,	need_level=60,		name="混沌之源",	accepter="迷龙",	doner="迷龙",
		need_type="mon",	need_target="混沌祭司",			need_num=20,
		award={
			{name="经验",		num=857193},
			{name="绑定金币",	num=115000},
			{name="凌云戒指·武威",	num=2,job='warrior',use=true},
			{name="凌云戒指·烈焰",	num=2,job='wizard',use=true},
			{name="凌云戒指·无极",	num=2,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "混沌祭司身上的混沌能量，对我们威胁太大了，要时刻警惕。";end; 
		done_talk  =function (npc,player,td) return "干得好，混沌的力量减弱了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[111	]={
		tid=111,	nid=112,	need_level=60,		name="我是豆豆",	accepter="迷龙",	doner="豆豆",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="凌云腰带·武威",	num=1,job='warrior',use=true},
			{name="凌云腰带·烈焰",	num=1,job='wizard',use=true},
			{name="凌云腰带·无极",	num=1,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "我喜欢玩一种游戏，叫打豆豆。你去看看豆豆去哪了。";end; 
		done_talk  =function (npc,player,td) return "我就是豆豆。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[112	]={
		tid=112,	nid=155,	need_level=60,		name="混沌之源",	accepter="豆豆",	doner="豆豆",
		need_type="mon",	need_target="混沌祭司",			need_num=20,
		award={
			{name="经验",		num=944897},
			{name="绑定金币",	num=120000},
			{name="凌云靴·武威",	num=1,job='warrior',use=true},
			{name="凌云靴·烈焰",	num=1,job='wizard',use=true},
			{name="凌云靴·无极",	num=1,job='taoist',use=true},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "击杀混沌祭司，彻底分崔混沌之门的力量源泉。";end; 
		done_talk  =function (npc,player,td) return "混沌的能量终于稳定了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[113	]={
		tid=113,	nid=114,	need_level=65,		name="雪域勇士",	accepter="地图传送员1",	doner="贺英",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "混沌的战斗果然精彩，下一个要攻陷的目标是雪域。";end; 
		done_talk  =function (npc,player,td) return "你是来报道的吧。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[114	]={
		tid=114,	nid=115,	need_level=65,		name="冰雪严寒",	accepter="贺英",	doner="贺英",
		need_type="mon",	need_target="雪狼勇士",			need_num=20,
		award={
			{name="经验",		num=1107029},
			{name="绑定金币",	num=125000},
			{name="惊世头盔·武威",	num=1,job='warrior',use=true},
			{name="惊世头盔·烈焰",	num=1,job='wizard',use=true},
			{name="惊世头盔·无极",	num=1,job='taoist',use=true},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "冰封雪域是一块未知的土地，严寒形成了天然的壁垒。去探索一下，为我们带回第一手的情报吧。";end; 
		done_talk  =function (npc,player,td) return "["..player:get_name().."]真是我们的开路先锋啊！";end;
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[115	]={
		tid=115,	nid=116,	need_level=65,		name="巾帼之美",	accepter="贺英",	doner="美美",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "你帮我把这件皮衣送给美美吧，别冻坏了她。";end; 
		done_talk  =function (npc,player,td) return "回头替我谢谢英哥，我才没那么娇贵。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[116	]={
		tid=116,	nid=117,	need_level=65,		name="决战冰封",	accepter="美美",	doner="美美",
		need_type="mon",	need_target="雪狼战士",			need_num=20,
		award={
			{name="经验",		num=1329301},
			{name="绑定金币",	num=130000},
			{name="惊世项链·武威",	num=1,job='warrior',use=true},
			{name="惊世项链·烈焰",	num=1,job='wizard',use=true},
			{name="惊世项链·无极",	num=1,job='taoist',use=true},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "领主大人下令进攻冰封领域了，我们要做好前期准备，去击杀雪狼战士吧。";end; 
		done_talk  =function (npc,player,td) return "这下攻击会顺利的多了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[117	]={
		tid=117,	nid=118,	need_level=65,		name="虎力啸天",	accepter="美美",	doner="聂虎",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "聂虎才是真男人，你要不信就去亲眼看看。";end; 
		done_talk  =function (npc,player,td) return "还有谁！！";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[118	]={
		tid=118,	nid=119,	need_level=65,		name="永冻大陆",	accepter="聂虎",	doner="聂虎",
		need_type="mon",	need_target="雪狼斗士",			need_num=20,
		award={
			{name="经验",		num=1475885},
			{name="绑定金币",	num=135000},
			{name="惊世护腕·武威",	num=2,job='warrior',use=true},
			{name="惊世护腕·烈焰",	num=2,job='wizard',use=true},
			{name="惊世护腕·无极",	num=2,job='taoist',use=true},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "杀死雪域的斗士，可以极大的降低敌人的士气，这个光荣的使命就交给你来完成了。";end; 
		done_talk  =function (npc,player,td) return "果然不负众望。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[119	]={
		tid=119,	nid=120,	need_level=65,		name="龙争虎斗",	accepter="聂虎",	doner="元龙",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "元龙老是想抢我第一的位置，你去看看他的工作情况，别说我欺负他。";end; 
		done_talk  =function (npc,player,td) return "切，虎怎么能与龙比。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[120	]={
		tid=120,	nid=121,	need_level=65,		name="冰河时代",	accepter="元龙",	doner="元龙",
		need_type="mon",	need_target="雪狼战斧",			need_num=20,
		award={
			{name="经验",		num=1645176},
			{name="绑定金币",	num=140000},
			{name="惊世戒指·武威",	num=2,job='warrior',use=true},
			{name="惊世戒指·烈焰",	num=2,job='wizard',use=true},
			{name="惊世戒指·无极",	num=2,job='taoist',use=true},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "现在摆在我们面前的危险，是雪域战斧，这种敌人十分疯狂。看来这个任务只有你能完成了。";end; 
		done_talk  =function (npc,player,td) return "这下敌人的势力就不足为惧了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[121	]={
		tid=121,	nid=122,	need_level=65,		name="火速救援",	accepter="元龙",	doner="韩啸",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="惊世腰带·武威",	num=1,job='warrior',use=true},
			{name="惊世腰带·烈焰",	num=1,job='wizard',use=true},
			{name="惊世腰带·无极",	num=1,job='taoist',use=true},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "韩大人深入敌阵，原本以为一介书生手无缚鸡之力，这下俺算服了。";end; 
		done_talk  =function (npc,player,td) return "元大哥有心了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[122	]={
		tid=122,	nid=156,	need_level=65,		name="决战冰峰",	accepter="韩啸",	doner="韩啸",
		need_type="mon",	need_target="雪狼战斧",			need_num=20,
		award={
			{name="经验",		num=1839520},
			{name="绑定金币",	num=145000},
			{name="惊世靴·武威",	num=1,job='warrior',use=true},
			{name="惊世靴·烈焰",	num=1,job='wizard',use=true},
			{name="惊世靴·无极",	num=1,job='taoist',use=true},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "时机成熟了，终于等到这一刻了，向冰封雪域进攻的时候到了。";end; 
		done_talk  =function (npc,player,td) return "我们的英雄["..player:get_name().."]凯旋了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[123	]={
		tid=123,	nid=124,	need_level=70,		name="星星之火",	accepter="地图传送员1",	doner="石铁",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "石铁派人来请求增援，他们在烈炎魔窟遇到了麻烦。";end; 
		done_talk  =function (npc,player,td) return "等你好久了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[124	]={
		tid=124,	nid=125,	need_level=70,		name="火焰世界",	accepter="石铁",	doner="石铁",
		need_type="mon",	need_target="地狱战士",			need_num=20,
		award={
			{name="经验",		num=2023397},
			{name="绑定金币",	num=150000},
			{name="承影剑·武威",	num=1,job='warrior',use=true},
			{name="承影剑·烈焰",	num=1,job='wizard',use=true},
			{name="承影剑·无极",	num=1,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "烈焰魔窟是雪域之后摆在我们面前的下一个难题。";end; 
		done_talk  =function (npc,player,td) return "果然我们已经接近地狱了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[125	]={
		tid=125,	nid=126,	need_level=70,		name="一路向南",	accepter="石铁",	doner="南宫翔",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "南宫翔是南宫家的少主，你去看看，可别让他出意外。";end; 
		done_talk  =function (npc,player,td) return "我可不是纸糊的。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[126	]={
		tid=126,	nid=127,	need_level=70,		name="突破炼狱",	accepter="南宫翔",	doner="南宫翔",
		need_type="mon",	need_target="地狱护卫",			need_num=20,
		award={
			{name="经验",		num=2241028},
			{name="绑定金币",	num=155000},
			{name="混天镇元甲·武威",	num=1,job='warrior',gender='male',use=true},
			{name="混天镇元甲·烈焰",	num=1,job='wizard',gender='male',use=true},
			{name="混天镇元甲·无极",	num=1,job='taoist',gender='male',use=true},
			{name="混天镇元衣·武威",	num=1,job='warrior',gender='female',use=true},
			{name="混天镇元衣·烈焰",	num=1,job='wizard',gender='female',use=true},
			{name="混天镇元衣·无极",	num=1,job='taoist',gender='female',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "即使是地狱，也无法阻挡我们的前进，杀死地狱的护卫。";end; 
		done_talk  =function (npc,player,td) return "我们即将征服地狱。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[127	]={
		tid=127,	nid=128,	need_level=70,		name="斩钉截铁",	accepter="南宫翔",	doner="斩铁",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="混天头盔·武威",	num=1,job='warrior',use=true},
			{name="混天头盔·烈焰",	num=1,job='wizard',use=true},
			{name="混天头盔·无极",	num=1,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "斩铁是我的好兄弟，你去帮帮他吧。";end; 
		done_talk  =function (npc,player,td) return "斩。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[128	]={
		tid=128,	nid=129,	need_level=70,		name="斩首烈炎",	accepter="斩铁",	doner="斩铁",
		need_type="mon",	need_target="地狱战将",			need_num=20,
		award={
			{name="经验",		num=2460373},
			{name="绑定金币",	num=160000},
			{name="混天项链·武威",	num=1,job='warrior',use=true},
			{name="混天项链·烈焰",	num=1,job='wizard',use=true},
			{name="混天项链·无极",	num=1,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "我们遇到麻烦了，地狱战将个个一骑当千，我们损失惨重，这个任务只有交给你了。";end; 
		done_talk  =function (npc,player,td) return "干得好，你才是真正的一骑当千。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[129	]={
		tid=129,	nid=130,	need_level=70,		name="神拳无敌",	accepter="斩铁",	doner="释拳",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="混天护腕·武威",	num=2,job='warrior',use=true},
			{name="混天护腕·烈焰",	num=2,job='wizard',use=true},
			{name="混天护腕·无极",	num=2,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "斩铁是我的好兄弟，你去帮帮他吧。";end; 
		done_talk  =function (npc,player,td) return "斩。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[130	]={
		tid=130,	nid=131,	need_level=70,		name="火炎将军",	accepter="释拳",	doner="释拳",
		need_type="mon",	need_target="地狱将军",			need_num=20,
		award={
			{name="经验",		num=2721084},
			{name="绑定金币",	num=165000},
			{name="混天戒指·武威",	num=2,job='warrior',use=true},
			{name="混天戒指·烈焰",	num=2,job='wizard',use=true},
			{name="混天戒指·无极",	num=2,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "消灭地狱将军，下面的小卒就是一盘散撒了。";end; 
		done_talk  =function (npc,player,td) return "干得好，准备发起总攻。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[131	]={
		tid=131,	nid=132,	need_level=70,		name="百炼成钢",	accepter="释拳",	doner="铁猛",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="混天腰带·武威",	num=1,job='warrior',use=true},
			{name="混天腰带·烈焰",	num=1,job='wizard',use=true},
			{name="混天腰带·无极",	num=1,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "铁猛这家伙，不会出什么事吧。";end; 
		done_talk  =function (npc,player,td) return "我没事。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[132	]={
		tid=132,	nid=157,	need_level=70,		name="炼狱裁决",	accepter="铁猛",	doner="铁猛",
		need_type="mon",	need_target="地狱将军",			need_num=20,
		award={
			{name="经验",		num=3600915},
			{name="绑定金币",	num=170000},
			{name="混天靴·武威",	num=1,job='warrior',use=true},
			{name="混天靴·烈焰",	num=1,job='wizard',use=true},
			{name="混天靴·无极",	num=1,job='taoist',use=true},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "直击地狱心脏的一刻来临了，勇士们，发起攻击。";end; 
		done_talk  =function (npc,player,td) return "征服了炼狱，我们就可能征服一切。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[133	]={
		tid=133,	nid=134,	need_level=75,		name="死亡通道",	accepter="地图传送员1",	doner="邢威",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "落日峡谷回报有人类俘虏被关押，我们已经派出了救援队。";end; 
		done_talk  =function (npc,player,td) return "我的任务是来这里救援被抓的人。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[134	]={
		tid=134,	nid=135,	need_level=75,		name="勇闯刑场",	accepter="邢威",	doner="邢威",
		need_type="mon",	need_target="死亡战士",			need_num=20,
		award={
			{name="经验",		num=4822777},
			{name="绑定金币",	num=175000},
			{name="潜龙头盔·武威",	num=1,job='warrior',use=true},
			{name="潜龙头盔·烈焰",	num=1,job='wizard',use=true},
			{name="潜龙头盔·无极",	num=1,job='taoist',use=true},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "我们的先遣队探查到了一个刑场，里面有不少被处刑的妖魔以及人类，去想办法解救他们。";end; 
		done_talk  =function (npc,player,td) return "还是晚了一步么。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[135	]={
		tid=135,	nid=136,	need_level=75,		name="异域增援",	accepter="邢威",	doner="苏珊娜",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "救援队里，有一位跨海而来的美女，你想认识她就自己过去找吧。";end; 
		done_talk  =function (npc,player,td) return "嗨，帅哥，你好。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[136	]={
		tid=136,	nid=137,	need_level=75,		name="勇斗死亡",	accepter="苏珊娜",	doner="苏珊娜",
		need_type="mon",	need_target="死亡斗士",			need_num=20,
		award={
			{name="经验",		num=6875829},
			{name="绑定金币",	num=180000},
			{name="潜龙项链·武威",	num=1,job='warrior',use=true},
			{name="潜龙项链·烈焰",	num=1,job='wizard',use=true},
			{name="潜龙项链·无极",	num=1,job='taoist',use=true},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "这里有与死亡为伍的斗士，让他们体验真正的死亡吧。";end; 
		done_talk  =function (npc,player,td) return "虽然胜利了，我们也付出了极大的代价。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[137	]={
		tid=137,	nid=138,	need_level=75,		name="虎胆龙威",	accepter="苏珊娜",	doner="郑虎",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "这里的战斗就交给我了，你去帮其他人吧。";end; 
		done_talk  =function (npc,player,td) return "我要努力坚持到最后。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[138	]={
		tid=138,	nid=139,	need_level=75,		name="落日战斧",	accepter="郑虎",	doner="郑虎",
		need_type="mon",	need_target="死亡战斧",			need_num=20,
		award={
			{name="经验",		num=7786430},
			{name="绑定金币",	num=185000},
			{name="潜龙护腕·武威",	num=2,job='warrior',use=true},
			{name="潜龙护腕·烈焰",	num=2,job='wizard',use=true},
			{name="潜龙护腕·无极",	num=2,job='taoist',use=true},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "我们将组织先遣队，进行一次试探性的进攻，交给你了。";end; 
		done_talk  =function (npc,player,td) return "干得好，我们成功的打击了敌人的士气。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[139	]={
		tid=139,	nid=140,	need_level=75,		name="寻找何欢",	accepter="郑虎",	doner="何欢",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "前面是何欢何惧两兄弟。";end; 
		done_talk  =function (npc,player,td) return "我是何欢。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[140	]={
		tid=140,	nid=141,	need_level=75,		name="生有何欢",	accepter="何欢",	doner="何欢",
		need_type="mon",	need_target="死亡勇士",			need_num=20,
		award={
			{name="经验",		num=8646951},
			{name="绑定金币",	num=190000},
			{name="潜龙戒指·武威",	num=2,job='warrior',use=true},
			{name="潜龙戒指·烈焰",	num=2,job='wizard',use=true},
			{name="潜龙戒指·无极",	num=2,job='taoist',use=true},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "死亡勇士勇猛无比，早先派出的先遣队都被击败了。这个重任只有交给你了。";end; 
		done_talk  =function (npc,player,td) return "终于报仇了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[141	]={
		tid=141,	nid=142,	need_level=75,		name="死救何惧",	accepter="何欢",	doner="何惧",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="潜龙腰带·武威",	num=1,job='warrior',use=true},
			{name="潜龙腰带·烈焰",	num=1,job='wizard',use=true},
			{name="潜龙腰带·无极",	num=1,job='taoist',use=true},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "我兄弟不会出危险吧。";end; 
		done_talk  =function (npc,player,td) return "我受伤了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+1); end;
	},
	[142	]={
		tid=142,	nid=158,	need_level=75,		name="死有何惧",	accepter="何惧",	doner="何惧",
		need_type="mon",	need_target="死亡勇士",			need_num=20,
		award={
			{name="经验",		num=9126081},
			{name="绑定金币",	num=195000},
			{name="潜龙靴·武威",	num=1,job='warrior',use=true},
			{name="潜龙靴·烈焰",	num=1,job='wizard',use=true},
			{name="潜龙靴·无极",	num=1,job='taoist',use=true},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "落日刑场，我不希望再看到这里处决人类，去彻底摧毁它。";end; 
		done_talk  =function (npc,player,td) return "希望先行者可以安息。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[143	]={
		tid=143,	nid=144,	need_level=80,		name="巫师使命",	accepter="地图传送员1",	doner="巫祝",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "神庙祭坛里传出了魔法的波动，你去和巫师小队取得联系，看看到底是什么原因。";end; 
		done_talk  =function (npc,player,td) return "你是新来的增援么?";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[144	]={
		tid=144,	nid=145,	need_level=80,		name="破坏祭坛",	accepter="巫祝",	doner="巫祝",
		need_type="mon",	need_target="神庙士兵",			need_num=20,
		award={
			{name="经验",		num=10221841},
			{name="绑定金币",	num=200000},
			{name="无双头盔·武威",	num=1,job='warrior',use=true},
			{name="无双头盔·烈焰",	num=1,job='wizard',use=true},
			{name="无双头盔·无极",	num=1,job='taoist',use=true},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "祭坛是妖魔的圣地，我们去激怒他们，好一网打尽。";end; 
		done_talk  =function (npc,player,td) return "干得好。这下就可以激怒妖魔了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[145	]={
		tid=145,	nid=146,	need_level=80,		name="巫师使命",	accepter="巫祝",	doner="李三山",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "三山兄勇猛无敌，已经带人冲向敌阵了。";end; 
		done_talk  =function (npc,player,td) return "该死，被暗算了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[146	]={
		tid=146,	nid=147,	need_level=80,		name="一战成名",	accepter="李三山",	doner="李三山",
		need_type="mon",	need_target="神庙战斧",			need_num=20,
		award={
			{name="经验",		num=10757601},
			{name="绑定金币",	num=205000},
			{name="无双项链·武威",	num=1,job='warrior',use=true},
			{name="无双项链·烈焰",	num=1,job='wizard',use=true},
			{name="无双项链·无极",	num=1,job='taoist',use=true},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "妖魔越聚越多，到了决战的时刻了。你是新的开路先锋，去打个漂亮仗。";end; 
		done_talk  =function (npc,player,td) return "干得漂亮，现在你已经威名远播了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[147	]={
		tid=147,	nid=148,	need_level=80,		name="向前看齐",	accepter="李三山",	doner="向齐",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "我受伤了，你去找下我的其他手下。";end; 
		done_talk  =function (npc,player,td) return "你是来救我的？";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[148	]={
		tid=148,	nid=149,	need_level=80,		name="摧枯拉朽",	accepter="向齐",	doner="向齐",
		need_type="mon",	need_target="神庙魔兵",			need_num=20,
		award={
			{name="经验",		num=10996126},
			{name="绑定金币",	num=210000},
			{name="无双护腕·武威",	num=2,job='warrior',use=true},
			{name="无双护腕·烈焰",	num=2,job='wizard',use=true},
			{name="无双护腕·无极",	num=2,job='taoist',use=true},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "勇士，带领我们去再下一城吧。";end; 
		done_talk  =function (npc,player,td) return "虽然胜利了，但是妖魔的实力还是不可小觑啊。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[149	]={
		tid=149,	nid=150,	need_level=80,		name="上官英豪",	accepter="向齐",	doner="上官涛",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "我可不怕，你去找上官涛吧。";end; 
		done_talk  =function (npc,player,td) return "吓死我了，这么厉害的妖魔。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[150	]={
		tid=150,	nid=151,	need_level=80,		name="一将难求",	accepter="上官涛",	doner="上官涛",
		need_type="mon",	need_target="神庙魔将",			need_num=20,
		award={
			{name="经验",		num=11625861},
			{name="绑定金币",	num=215000},
			{name="无双戒指·武威",	num=2,job='warrior',use=true},
			{name="无双戒指·烈焰",	num=2,job='wizard',use=true},
			{name="无双戒指·无极",	num=2,job='taoist',use=true},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "魔将是妖魔的精锐部队，杀了他们，就加重了我们胜利的筹码。";end; 
		done_talk  =function (npc,player,td) return "胜利的天平开始倾向我们了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[151	]={
		tid=151,	nid=152,	need_level=80,		name="刺客信条",	accepter="上官涛",	doner="盖聂",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
			{name="无双腰带·武威",	num=1,job='warrior',use=true},
			{name="无双腰带·烈焰",	num=1,job='wizard',use=true},
			{name="无双腰带·无极",	num=1,job='taoist',use=true},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "盖聂是我们的第一刺客，你去看看他有什么要帮忙的。";end; 
		done_talk  =function (npc,player,td) return "我一定可以完成目标。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[152	]={
		tid=152,	nid=159,	need_level=80,		name="神魔战争",	accepter="盖聂",	doner="盖聂",
		need_type="mon",	need_target="神庙魔将",			need_num=20,
		award={
			{name="经验",		num=11634441},
			{name="绑定金币",	num=220000},
			{name="无双靴·武威",	num=1,job='warrior',use=true},
			{name="无双靴·烈焰",	num=1,job='wizard',use=true},
			{name="无双靴·无极",	num=1,job='taoist',use=true},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "魔将是妖魔的精锐部队，杀了他们，就加重了我们胜利的筹码。";end; 
		done_talk  =function (npc,player,td) return "我们在神庙的战争告一段落了。剩下的就是直面实力强大的妖魔领主了。祝你好运。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
	},
	[153	]={
		tid=153,	nid=93,		need_level=50,		name="平息妖月",	accepter="凌战",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="蛮牛洞1",
		accept_talk=function (npc,player,td) return "妖月峡谷的战斗终于告一段落了。";end; 
		done_talk  =function (npc,player,td) return "干得好，妖月峡谷安全了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[154	]={
		tid=154,	nid=103,	need_level=55,		name="一路平安",	accepter="王强",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="妖月峡谷3",
		accept_talk=function (npc,player,td) return "我们终于成功脱险了。";end; 
		done_talk  =function (npc,player,td) return "这下巨灵石窟以后不会再有危险了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[155	]={
		tid=155,	nid=113,	need_level=60,		name="混沌不再",	accepter="豆豆",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="巨灵石窟2",
		accept_talk=function (npc,player,td) return "混沌之力开始消散了。";end; 
		done_talk  =function (npc,player,td) return "我们制服了混沌。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[156	]={
		tid=156,	nid=123,	need_level=65,		name="不再有风",	accepter="韩啸",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="混沌之门2",
		accept_talk=function (npc,player,td) return "冰封雪域的战斗胜利了。";end; 
		done_talk  =function (npc,player,td) return "你是我们的英雄。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[157	]={
		tid=157,	nid=133,	need_level=70,		name="征服炼狱",	accepter="铁猛",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="冰封雪域2",
		accept_talk=function (npc,player,td) return "烈炎也有熄灭的一天。";end; 
		done_talk  =function (npc,player,td) return "你征服了炼狱！";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[158	]={
		tid=158,	nid=143,	need_level=75,		name="死刑得免",	accepter="何惧",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="地狱熔岩2",
		accept_talk=function (npc,player,td) return "我们成功的摧毁了落日刑场。";end; 
		done_talk  =function (npc,player,td) return "希望这里不再有杀戮。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
	[159	]={
		tid=159,	nid=160,	need_level=80,		name="神魔战争",	accepter="盖聂",	doner="地图传送员1",
		award={
			{name="经验",		num=6000},
			{name="绑定金币",	num=5000},
		},
		bestmap="落日峡谷1",
		accept_talk=function (npc,player,td) return "神魔战争就要开始了。";end; 
		done_talk  =function (npc,player,td) return "你现在有资格面对强大的魔王们了。";end; 
		done_hook=function (npc,player,td) player:set_free_direct_fly(player:get_free_direct_fly()+2); end;
		accept_hook=function (npc,player,td) posnpc.fly(player,td.doner);end;
	},
};

local task_state_data={};

function onGetTaskName(player)			task.util.show_task_name(player,player,task_id,task_data);end
function onGetTaskShortDesp(player)		task.util.show_task_short_desp(player,player,task_id,task_state_data,task_data);end
function onGetTaskDesp(player)			task.util.show_task_desp(player,player,task_id,task_state_data,task_data);end

function show_title(npc,player)			task.util.show_task_title(npc,player,task_id,task_state_data,task_data);end
function show_task(npc,player)			task.util.show_task_talk(npc,player,task_id,task_state_data,task_data);end

function get_npc_flags(npc,player)		return task.util.get_npc_flags(npc,player,task_id,task_state_data,task_data);end

function check_mon_kill(player,mon)		task.util.check_mon_kill(player,mon,task_id,task_state_data,task_data);end
function check_item_change(player,i_name,i_id)	task.util.check_item_change(player,i_name,i_id,task_id,task_state_data,task_data);end
function check_level(player,lv)			task.util.check_level(player,lv,task_id,task_state_data,task_data);end
function check_mon_caiji(player,mon,group)
	if group then return;end;
	local s = player:get_task_state(task_id);
	local b = math.floor(s / const.TASK_STATE_NUM);
	if b == 8 then
		if s ==  task.util.ts(8,const.TSCOMP) then
			player:set_task_state(task_id,task.util.ts(8,const.TSCOMP));
			posnpc.go(player,"慕容仲伯");
			focus.f(player,"mini_task");
		end
		player:push_task_data(task_id,0);
	end
	if b == 24 then
		if s ==  task.util.ts(24,const.TSCOMP) then
			player:set_task_state(task_id,task.util.ts(24,const.TSCOMP));
			posnpc.go(player,"司超");
			focus.f(player,"mini_task");
		end
		player:push_task_data(task_id,0);
	end
	if b == 81 then
		if s ==  task.util.ts(81,const.TSACED) then
			if mon:get_name() == "鱼1" then
				if player:num_bag_black() >= 1 then
					player:add_item("青鱼",1,1);
					player:alert(11,1,"成功捕获:<font color='#ff0000'>青鱼</font>");
				end
			end
		end
		if s == task.util.ts(81,const.TSCOMP) then
			posnpc.fly(player,"温泉老板娘");
		end
		if s == task.util.ts(92,const.TSCOMP) then
			posnpc.fly(player,"地图传送员1");
		end
		player:push_task_data(task_id,0);
	end
end
ckmon.add_caiji_listener("霜草",check_mon_caiji);
ckmon.add_caiji_listener("铁矿",check_mon_caiji);
ckmon.add_caiji_listener("鱼1",check_mon_caiji);


function startkuang(player,mon)
	player:start_progress_bar(mon:get_caiji_duration(),"正在采集中...");
end
function startbuzhuo(player,mon)
	player:start_progress_bar(mon:get_caiji_duration(),"正在捕捉中...");
end
ckmon.add_caijistart_listener("霜草",startkuang);
ckmon.add_caijistart_listener("铁矿",startkuang);
ckmon.add_caijistart_listener("鱼1",startbuzhuo);
function init_task_60()
	local td = task_data[60];
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].alltalk=function(target,player)
		if player:get_task_param(task_id,4) < 5 then
			if player:get_task_param(task_id,4) >= 1 then
				player:add_exp(20000);
				player:alert(11,1,"<font color='#ff0000'>恭喜您答对了,获得20000经验!</font>");
			end
			player:set_task_param(task_id,4,player:get_task_param(task_id,4)+1)
			qanda.begin_qanda(target,player,'T'..task_id..'Show');
			return 1;
		else
			return;
		end
	end
end
function init_task_82()
	local td = task_data[82];
	task_state_data[task.util.ts(td.tid,const.TSCOMP)].alltalk=function(target,player)
		if player:get_task_param(task_id,4) < 5 then
			if player:get_task_param(task_id,4) >= 1 then
				player:add_exp(20000);
				player:alert(11,1,"<font color='#ff0000'>恭喜您答对了,获得20000经验!</font>");
			end
			player:set_task_param(task_id,4,player:get_task_param(task_id,4)+1)
			qanda.begin_qanda(target,player,'T'..task_id..'Show');
			return 1;
		else
			return;
		end
	end
end
_M['onTalkT'..task_id..'Show']=function (npc,player) task.util.show_task_talk(npc,player,task_id,task_state_data,task_data); end
_M['onTalkT'..task_id..'Do']=function (npc,player) return task.util.task_done(npc,player,task_id,task_state_data,task_data); end

for i=1,#task_data do
	task.util.build_task_state(task_id,task_data[i],task_data,task_state_data);
	if task_data[i].need_type == "mon" then
		ckmon.add_listener(task_data[i].need_target,check_mon_kill);
	end
	if task_data[i].need_type == "item" then
		ckitem.add_listener(task_data[i].need_item,check_item_change);
	end
	cklevel.add_listener(check_level);
end;
for i=1,100 do if _M['init_task_'..i] then _M['init_task_'..i](); end; end;

function first_login(player)
	player:set_task_state(task_id,task.util.ts(1,const.TSACCE));
	player:push_task_data(task_id,1);
end
login.add_first_login_listener(first_login);
