module(..., package.seeall)


function onShop(npc,player)
	npc:echo([[请选择您要购买的物品:]]);
end
function onTalk100(npc,player)
	npc:echo([[
您好,我是<font color="#FFFF00">杂货铺老板</font>!
我将为您提供以下服务:
]]);
	npc:echo([[

<p>##shop##<a href="event:local_shop">购买杂货</a></p>
<p>##shop##<a href="event:local_shop_10">购买杂货(绑定金币)</a></p>
<p>##shop##<a href="event:talk_yjcs">出售物品</a></p>
]]);
end


function onTalkyjcs(npc,player)
	ckpanel.open_yjchushou(player);
	onTalk100(npc,player);
end
