module(..., package.seeall)


function cangku(player)
	player:echo([[
您好,欢迎您使用<font color="#FFFF00">移动仓库</font>!
我将为您提供以下服务:
]]);
	player:echo([[
<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:local_depot">仓库服务</a> 
]]);
end
