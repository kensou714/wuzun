module(..., package.seeall)

function gxgonggao(player,param100)
	Show_tt(player,1);
end

local hd_data_btf = {
	[1] = {name="2014年03月20日",funb = function(a,b) t_contentf(a,b); end},
	[2] = {name="2014年02月22日",funb = function(a,b) t_contentf(a,b); end},
	[3] = {name="2014年01月28日",funb = function(a,b) t_contentf(a,b); end},
	[4] = {name="2014年01月23日",funb = function(a,b) t_contentf(a,b); end},
	[5] = {name="2014年01月18日",funb = function(a,b) t_contentf(a,b); end},
--	[3] = {name="2014年01月18日",funb = function(a,b) t_contentf(a,b); end},
}

function Show_tt(player,id)
	for i = 1,#hd_data_btf do
		if i == id then
			player:echo("--------------<br><font color='#ffaaee'>"..hd_data_btf[i].name .."</font><br>");
		else
			player:echo("--------------<br><a href='event:talk_tf"..i.."'>" .. hd_data_btf[i].name .."</a><br>");
		end
	end
		player:echo("--------------");
	player:listtalk_list(200);
	hd_data_btf[id].funb(player,id);
	player:listtalk_content(200);
	player:listtalk_title("",200);
end


function t_contentf(player,id)
	if id == 1 then help51(player,id); end
	if id == 2 then help52(player,id); end
	if id == 3 then help53(player,id); end
	if id == 4 then help54(player,id); end
	if id == 5 then help55(player,id); end
end


function onTalktf1(player) Show_tt(player,1); end
function onTalktf2(player) Show_tt(player,2); end
function onTalktf3(player) Show_tt(player,3); end
function onTalktf4(player) Show_tt(player,4); end
function onTalktf5(player) Show_tt(player,5); end

function help51(player,id)
	if id == 1 then
		player:echo([[ 
<font color="#FFFF00">本次更新说明</font>
<font color="#FFFF00">1.积分神器和神甲加入特殊属性效果:</font>
神器每次攻击有几率附加额外伤害；
神甲每次受到攻击有几率回避该次伤害；

<font color="#FFFF00">2.新增活跃类活动:</font>
远古废墟(可产出玄晶和转生技能书);

<font color="#FFFF00">3.复活机制优化:</font>
玩家回城复活后在安全区获得3分钟buff，每3秒回复3000生命值和1200点魔法值；
玩家在神魔战场中死亡后复活，血量为100%；

<font color="#FFFF00">4.玩家进入皇宫后自动关闭翅膀和法宝.</font>]]);
	end
end

function help55(player,id)
	if id == 5 then
		player:echo([[      <font color="#FFFF00">转生技能和技能升级</font> 

<font color="#FFFF00">1.转生技能书的获得</font> 
击败僵尸洞穴的尸王殿中有几率获得转生技能书.尸王BOSS 1小时刷新一次.

<font color="#FFFF00">2.合成技能书</font> 
获得技能书后,可在礼官处将低级技能书,合成更高级的技能书.技能书为3合1.

<font color="#FFFF00">3.技能升级和转生技能说明</font>
战士：
技能升级：战圣烈焰→破天斩（二格伤害,70级可学,战圣烈焰伤害增加）,第二格为正常攻击伤害;
转生技能：奔雷剑法（三格伤害,战胜烈焰伤害增加）,第二格为正常攻击伤害,第三格为正常攻击伤害.

法师：
技能升级：冰雪咆哮→龙息气焰（70级可学）,冰咆伤害增加,并附加灼烧效果,持续3秒. 
转生技能：烈焰火雨,冰咆伤害增加,并附加3秒灼烧效果.
为了职业技能平衡,法师的个别技能伤害略微降低.

道士：
70级新技能：气功波,1级把目标推开1格,2级把目标推开2格,3级把目标推开3格.
转生技能：炎龙召唤,召唤强大远程攻击宝宝.]]);
	end
end

function help54(player,id)
	if id == 4 then
		player:echo([[ 
<font color="#FFFF00">玄晶更新说明</font>
1. 在人物属性界面的玄晶面板中,可打开玄晶界面;
2. 在玄晶镶嵌界面,先选择希望镶嵌的部位,再选择左键单击玄晶,可将玄晶镶嵌在此部位上;
3. 每个部位同类玄晶只能镶嵌一颗,已镶嵌的玄晶左键单击可拆卸;
4. 只有穿戴装备,相应部位上镶嵌的玄晶属性才会起效;
5. 玄晶分为攻击、物防、魔防、生命四种,每种玄晶提升对应的人物能力;
6. 在玄晶合成界面,可以将3颗同样的玄晶合成更高级的玄晶,不同等级的玄晶合成有不同的合成成功率;
7. 玄晶在玩家死亡后不会掉落;
8. 玩家可在绑定商城、寻宝中获得玄晶.

<font color="#FFFF00">原地复活功能优化</font>
玩家每人每天第一次复活需要100元宝或者还魂丹*1,此后每次原地复活将消耗上一次元宝*2或者还魂丹*2;复活次数将在每日0时清零,切换地图将无法重置当日已复活次数.

<font color="#FFFF00">客户端显示的优化</font>
1.修改行会点击无法显示成员问题
2.解决切换地图后翅膀等素材重新加载的问题
3.添加主动显示隐藏翅膀的开关 人物角色界面
4.解决了一版客户端内存泄露导致浏览器奔溃的问题]]);
	end
end

function help53(player,id)
	if id == 3 then
		player:echo([[      <font color="#FFFF00">新春祈福与新春活动</font> 

<font color="#FFFF00">1.三转积分武器</font> 
开放110级积分神器：
    战士：神虚倚天剑·武威 (战力 18474)
    法师：神虚倚天剑·烈焰 (战力 18474)
    道士：神虚倚天剑·无极 (战力 18474)

玩家可在沙漠土城NPC神器使者处升级兑换。

<font color="#FFFF00">2.贺岁版界面</font> 
贺岁版主界面炫目登场,更便捷、更美观、更实用.

<font color="#FFFF00">3.新春祈福活动</font>
贺新春,大家一起来祈福!
在1月28、29日,只要玩家每日祈福次数达到30次,
即可领取四级攻击玄晶、四级生命玄晶、四级物防玄晶、四级魔防玄晶各一颗.

<font color="#FFFF00">4.新春贺岁活动</font>
新春活动持续时间1月30日至2月6日,让您过年八天乐.]]);
	end
end

function help52(player,id)
	if id == 2 then
		player:echo([[            <font color="#FFFF00">游戏优化与二月末活动</font> 

1.寻宝界面资源优化

2.心法开启新的等级上限:71级-100级

3.雷达图边栏增加屏蔽翅膀和神器的功能按钮

4.加入第一神腕:镇北玄武王腕,战力1947

5.任务调整:46级~80级之后加入新的主线任务,指引玩家到对应的最佳练级点

6.新增成长进阶礼包,玩家创建角色后可拥有,3天内使用有限，打开需花费998元宝

7.45级主线任务完成后增加30分钟临时vip状态,拥有特权与正式会员相同

8.开放活动倒计时队列

9.寻宝积分增加兑换玄晶选项

10.每日首充礼包中荣誉令牌替换为三级攻击玄晶
]]);
	end
end

