module(..., package.seeall)
local data={
	[1]	={ q="您现在玩的游戏叫什么名字？", a={"武尊","西游记","水浒传","红楼梦",}, },
	[2]	={ q="游戏里现在分几个职业？", a={"3个","2个","1个","4个",}, },
	[3]	={ q="你在武尊里怎样获得经验？", a={"打怪,做任务","站着发呆","吃饭","看电视",}, },
	[4]	={ q="你知道怎样获得金币吗？", a={"采集任务,挖矿","睡觉","吃饭","看电视",}, },
	[5]	={ q="你知道怎样获得装备吗?", a={"打BOSS,副本","大喊我要装备","做梦","听音乐",}, },
	[6]	={ q="包裹一共有多少个空格?", a={"42个","1个","100个","1000个",}, },
	[7]	={ q="做日常任务可以获得什么?", a={"大量经验,金币","梨","香蕉","苹果",}, },
	[8]	={ q="做采集任务可以获得什么?", a={"大量金币","美女","帅哥","情人",}, },
	[9]	={ q="泡温泉可以捕捉什么动物", a={"鱼","虾","螃蟹","乌龟",}, },
	[10]	={ q="土城烤火需要什么道具?", a={"女儿红酒","木材","汽油","打火机",}, },
	[11]	={ q="做降妖除魔任务的NPC叫?", a={"伏魔使者","李大嘴","张三","王四",}, },
	[12]	={ q="送财童子会掉落些什么?", a={"大量金币","袜子","内衣","鞋子",}, },
	[13]	={ q="开心富贵虎有什么用呢?", a={"兑换绑定元宝","可以看门","可以杀了吃","可以带着遛街",}, },
	[14]	={ q="进入玛雅神殿需要什么道具?", a={"玛雅令牌","机票","火车票","汽车票",}, },
	[15]	={ q="掉落神器积分的BOSS叫什么?", a={"天魔兽","老虎","狮子","大象",}, },
	[16]	={ q="荣誉值可以兑换什么东西?", a={"荣誉勋章","包子","烧饼","油条",}, },
	[17]	={ q="提升官职可以佩戴什么呢?", a={"官印","城管制服","太阳镜","牛仔帽",}, },
	[18]	={ q="押镖任务的夏镖头在哪个地图?", a={"沙漠土城","云南","福建","香港",}, },
	[19]	={ q="你知道上下马的快捷键是什么吗?", a={"X键","Z键","W键","A键",}, },
	
};
function begin_qanda(target,player,ret,qid)
	if not qid or qid <= 0 or qid > #data then
		qid=math.random(1,#data);
	end
	player:set_temp_param(const.PTP_QANDA_QID,qid);
	player:set_temp_param(const.PTP_QANDA_RET,ret);
	show_qanda(target,player);
end
function show_qanda(target,player)
	local d=data[ util.ptpn(player,const.PTP_QANDA_QID) ];
	if not d then return ;end;
	target:echo("-------------------------------------<br><font color='#ffff00'>都说你勇猛无比,不知道智商如何!<br>让我出几道题目考考你!</font><br><br>题目是:<font color='#ff00ff'>");
	target:echo(d.q);
	target:echo("</font><br><br>-------------------------------------<br><br>");
	local b = math.random(1,#d.a);
	for i=1,#d.a do
		local x=(b+i)%#d.a + 1;
		if x == 1 then
			target:echo(i..".<a href='event:talk_".. player:get_temp_param(const.PTP_QANDA_RET) .."'>"..d.a[x].."<s='r'>√</s></a>");target:echo("<br><br>");
		else
			target:echo(i..".<a href='event:talk_QANDAError'>"..d.a[x].."</a>");target:echo("<br><br>");
		end
	end
	target:echo("-------------------------------------");
end
function onTalkQANDAError(npc,player)
	show_qanda(npc,player);
	player:alert(1,1,"回答错误哦!再试一次吧!!");
end
