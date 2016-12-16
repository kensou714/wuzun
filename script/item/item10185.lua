module(..., package.seeall)

function lingyu(player)
	player:echo([[--------------------------------------
<font color="#FFff00">请选择您想要的服务:</font>
--------------------------------------
<a href="event:talk_cbsj">高级翅膀兑换</a>: <font color="#FFaa00">将低级翅膀升级为高级翅膀</font>
--------------------------------------
<a href="event:talk_lyhc">高级灵羽合成</a>: <font color="#FFaa00">将低级灵羽合成为高级灵羽</font>
--------------------------------------
<font color="#FFff00">如何获得灵羽</font>: <font color="#FFaa00">灵羽可消灭游戏中BOSS掉落</font>
--------------------------------------
]]);
return 0;
end

function onTalkcbsj(player)
	player:echo([[---------------------------------------
         <b><font color="#ccbb77" size="14px">翅膀升级兑换列表</font></b>
---------------------------------------
##精灵羽(1级)##          <a href="event:talk_sj1jcb">点击此处兑换</a>
兑换需要: <font color="#ffaa00">一级灵羽*1</font>
---------------------------------------
##虹霓羽(2级)##          <a href="event:talk_sj2jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">精灵羽*1,二级灵羽*1</font>
---------------------------------------
##碧焰羽(3级)##          <a href="event:talk_sj3jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">虹霓羽*1,三级灵羽*1</font>
---------------------------------------
##赤霞翼(4级)##          <a href="event:talk_sj4jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">碧焰羽*1,四级灵羽*1</font>
---------------------------------------
##冥光翼(5级)##          <a href="event:talk_sj5jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">赤霞翼*1,五级灵羽*1</font>
---------------------------------------
##苍龙翼(6级)##          <a href="event:talk_sj6jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">冥光翼*1,六级灵羽*1</font>
---------------------------------------
                   　　<a href="event:talk_cbsj2">下一页</a>  <a href="event:talk_fanhui">返回主页</a>
---------------------------------------
]]);
end



function onTalksj1jcb(player)
	if  player:num_item("精灵羽(1级)",1) >= 1 or  player:num_item("精灵羽(1级)",10) >= 1 or player:num_item("精灵羽(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[精灵羽],还是别兑换了!!")
	else
		if player:num_item("一级灵羽",1) >= 1 then
			if player:num_bag_black() >= 1 then
				player:remove_item("一级灵羽",1);
				player:add_item_log("精灵羽(1级)",229,1,1);
				player:alert(11,1,"恭喜您成功兑换[精灵羽(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"您没有[一级灵羽],无法兑换!")
		end
	end
	onTalkcbsj(player);
end

function onTalkcbsj2(player)
	player:echo([[---------------------------------------
##金天圣羽(7级)##        <a href="event:talk_sj7jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">苍龙翼*1,七级灵羽*1</font>
---------------------------------------
##烈焰炽羽(8级)##        <a href="event:talk_sj8jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">金天圣羽*1,八级灵羽*1</font>
---------------------------------------
##帝霄仙羽(9级)##        <a href="event:talk_sj9jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">烈焰炽羽*1,九级灵羽*1</font>
---------------------------------------
##天皇神翼(10级)##       <a href="event:talk_sj10jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">帝霄仙羽*1,十级灵羽*1</font>
---------------------------------------
##九天羽皇(11级)##       <a href="event:talk_sj11jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">天皇神翼*1,十一级灵羽*1</font>
---------------------------------------
##诛神凤翎(12级)##       <a href="event:talk_sj12jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">九天羽皇*1,十二级灵羽*1</font>
---------------------------------------
##炽天使之翼(13级)##     <a href="event:talk_sj13jcb">点击此处升级</a>
升级需要: <font color="#ffaa00">诛神凤翎*1,十三级灵羽*1</font>
---------------------------------------
                   　　<a href="event:talk_cbsj">上一页</a>  <a href="event:talk_fanhui">返回主页</a>
---------------------------------------
]]);
end


function onTalksj2jcb(player) cbsjxt(player,160001,"二级灵羽","精灵羽(1级)","虹霓羽(2级)",160002,1) end
function onTalksj3jcb(player) cbsjxt(player,160002,"三级灵羽","虹霓羽(2级)","碧焰羽(3级)",160003,1) end
function onTalksj4jcb(player) cbsjxt(player,160003,"四级灵羽","碧焰羽(3级)","赤霞翼(4级)",160004,1) end
function onTalksj5jcb(player) cbsjxt(player,160004,"五级灵羽","赤霞翼(4级)","冥光翼(5级)",160005,1) end
function onTalksj6jcb(player) cbsjxt(player,160005,"六级灵羽","冥光翼(5级)","苍龙翼(6级)",160006,1) end
function onTalksj7jcb(player) cbsjxt(player,160006,"七级灵羽","苍龙翼(6级)","金天圣羽(7级)",160007,2) end
function onTalksj8jcb(player) cbsjxt(player,160007,"八级灵羽","金天圣羽(7级)","烈焰炽羽(8级)",160008,2) end
function onTalksj9jcb(player) cbsjxt(player,160008,"九级灵羽","烈焰炽羽(8级)","帝霄仙羽(9级)",160009,2) end
function onTalksj10jcb(player) cbsjxt(player,160009,"十级灵羽","帝霄仙羽(9级)","天皇神翼(10级)",160010,2) end
function onTalksj11jcb(player) cbsjxt(player,160010,"十一级灵羽","天皇神翼(10级)","九天羽皇(11级)",160011,2) end
function onTalksj12jcb(player) cbsjxt(player,160011,"十二级灵羽","九天羽皇(11级)","诛神凤翎(12级)",160012,2) end
function onTalksj13jcb(player) cbsjxt(player,160012,"十三级灵羽","诛神凤翎(12级)","炽天使之翼(13级)",160013,2) end

function cbsjxt(player,a,b,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if player:num_item(b,1) >= 1 then
					if player:num_item(c,1) >= 1 then
						local result = player:remove_item_by_type_pos(ittype_id,0);
						if result == 0 then
						player:remove_item(b,1);
						--player:remove_item(c,1);
						player:add_item_log(d,229,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						newgui.jingcaihuodong.setawardpcon(player,"cbsj",e%100);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						if a >= 160005 then
						server.info(10000,1,"["..player:get_name().."]在土城灵羽使者处成功将翅膀升级为["..d.."]");
						server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在土城灵羽使者处成功将翅膀升级为[<font color='#ff0000'>"..d.."</font>]");
						end
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您没有["..b.."],升级失败!");
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
		if f==1 then onTalkcbsj(player); end
		if f==2 then onTalkcbsj2(player); end
	end
end

function onTalklyhc(player)
	player:echo([[---------------------------------------
         <b><font color="#ccbb77" size="14px">灵羽合成兑换列表</font></b>
---------------------------------------
##二级灵羽##       合成:<a href="event:talk_hc2jly">1次</a> <a href="event:talk_hc2jly10">10次</a> <a href="event:talk_hc2jly50">50次</a>
合成需要: <font color="#ffaa00">一级灵羽*3,元宝*10</font>
---------------------------------------
##三级灵羽##       合成:<a href="event:talk_hc3jly">1次</a> <a href="event:talk_hc3jly10">10次</a> <a href="event:talk_hc3jly50">50次</a>
合成需要: <font color="#ffaa00">二级灵羽*3,元宝*10</font>
---------------------------------------
##四级灵羽##       合成:<a href="event:talk_hc4jly">1次</a> <a href="event:talk_hc4jly10">10次</a> <a href="event:talk_hc4jly50">50次</a>
合成需要: <font color="#ffaa00">三级灵羽*3,元宝*10</font>
---------------------------------------
##五级灵羽##       合成:<a href="event:talk_hc5jly">1次</a> <a href="event:talk_hc5jly10">10次</a> <a href="event:talk_hc5jly50">50次</a>
合成需要: <font color="#ffaa00">四级灵羽*3,元宝*10</font>
---------------------------------------
##六级灵羽##       合成:<a href="event:talk_hc6jly">1次</a> <a href="event:talk_hc6jly10">10次</a> <a href="event:talk_hc6jly50">50次</a>
合成需要: <font color="#ffaa00">五级灵羽*3,元宝*10</font>
---------------------------------------
##七级灵羽##       合成:<a href="event:talk_hc7jly">1次</a> <a href="event:talk_hc7jly10">10次</a> <a href="event:talk_hc7jly50">50次</a>
合成需要: <font color="#ffaa00">六级灵羽*3,元宝*10</font>
---------------------------------------
                   　　<a href="event:talk_lyhc2">下一页</a>  <a href="event:talk_fanhui">返回主页</a>
---------------------------------------
]]);
end

function onTalklyhc2(player)
	player:echo([[---------------------------------------
         <b><font color="#ccbb77" size="14px">灵羽合成兑换列表</font></b>
---------------------------------------
##八级灵羽##       合成:<a href="event:talk_hc8jly">1次</a> <a href="event:talk_hc8jly10">10次</a> <a href="event:talk_hc8jly50">50次</a>
合成需要: <font color="#ffaa00">七级灵羽*3,元宝*10</font>
---------------------------------------
##九级灵羽##       合成:<a href="event:talk_hc9jly">1次</a> <a href="event:talk_hc9jly10">10次</a> <a href="event:talk_hc9jly50">50次</a>
合成需要: <font color="#ffaa00">八级灵羽*3,元宝*10</font>
---------------------------------------
##十级灵羽##       合成:<a href="event:talk_hc10jly">1次</a> <a href="event:talk_hc10jly10">10次</a> <a href="event:talk_hc10jly50">50次</a>
合成需要: <font color="#ffaa00">九级灵羽*3,元宝*10</font>
---------------------------------------
##十一级灵羽##     合成:<a href="event:talk_hc11jly">1次</a> <a href="event:talk_hc11jly10">10次</a> <a href="event:talk_hc11jly50">50次</a>
合成需要: <font color="#ffaa00">十级灵羽*3,元宝*10</font>
---------------------------------------
##十二级灵羽##     合成:<a href="event:talk_hc12jly">1次</a> <a href="event:talk_hc12jly10">10次</a> <a href="event:talk_hc12jly50">50次</a>
合成需要: <font color="#ffaa00">十一级灵羽*3,元宝*10</font>
---------------------------------------
##十三级灵羽##     合成:<a href="event:talk_hc13jly">1次</a> <a href="event:talk_hc13jly10">10次</a> <a href="event:talk_hc13jly50">50次</a>
合成需要: <font color="#ffaa00">十二级灵羽*3,元宝*10</font>
---------------------------------------
                   　　<a href="event:talk_lyhc">上一页</a>  <a href="event:talk_fanhui">返回主页</a>
---------------------------------------
]]);
end

function onTalkfanhui(player) lingyu(player); end


function onTalkhc2jly(player) lyhcxt(player,"一级灵羽","二级灵羽",1,3,10) end
function onTalkhc2jly10(player) lyhcxt(player,"一级灵羽","二级灵羽",1,30,100) end
function onTalkhc2jly50(player) lyhcxt(player,"一级灵羽","二级灵羽",1,150,500) end

function onTalkhc3jly(player) lyhcxt(player,"二级灵羽","三级灵羽",1,3,10) end
function onTalkhc3jly10(player) lyhcxt(player,"二级灵羽","三级灵羽",1,30,100) end
function onTalkhc3jly50(player) lyhcxt(player,"二级灵羽","三级灵羽",1,150,500) end

function onTalkhc4jly(player) lyhcxt(player,"三级灵羽","四级灵羽",1,3,10) end
function onTalkhc4jly10(player) lyhcxt(player,"三级灵羽","四级灵羽",1,30,100) end
function onTalkhc4jly50(player) lyhcxt(player,"三级灵羽","四级灵羽",1,150,500) end

function onTalkhc5jly(player) lyhcxt(player,"四级灵羽","五级灵羽",1,3,10) end
function onTalkhc5jly10(player) lyhcxt(player,"四级灵羽","五级灵羽",1,30,100) end
function onTalkhc5jly50(player) lyhcxt(player,"四级灵羽","五级灵羽",1,150,500) end

function onTalkhc6jly(player) lyhcxt(player,"五级灵羽","六级灵羽",1,3,10) end
function onTalkhc6jly10(player) lyhcxt(player,"五级灵羽","六级灵羽",1,30,100) end
function onTalkhc6jly50(player) lyhcxt(player,"五级灵羽","六级灵羽",1,150,500) end

function onTalkhc7jly(player) lyhcxt(player,"六级灵羽","七级灵羽",1,3,10) end
function onTalkhc7jly10(player) lyhcxt(player,"六级灵羽","七级灵羽",1,30,100) end
function onTalkhc7jly50(player) lyhcxt(player,"六级灵羽","七级灵羽",1,150,500) end

function onTalkhc8jly(player) lyhcxt(player,"七级灵羽","八级灵羽",2,3,10) end
function onTalkhc8jly10(player) lyhcxt(player,"七级灵羽","八级灵羽",2,30,100) end
function onTalkhc8jly50(player) lyhcxt(player,"七级灵羽","八级灵羽",2,150,500) end

function onTalkhc9jly(player) lyhcxt(player,"八级灵羽","九级灵羽",2,3,10) end
function onTalkhc9jly10(player) lyhcxt(player,"八级灵羽","九级灵羽",2,30,100) end
function onTalkhc9jly50(player) lyhcxt(player,"八级灵羽","九级灵羽",2,150,500) end

function onTalkhc10jly(player) lyhcxt(player,"九级灵羽","十级灵羽",2,3,10) end
function onTalkhc10jly10(player) lyhcxt(player,"九级灵羽","十级灵羽",2,30,100) end
function onTalkhc10jly50(player) lyhcxt(player,"九级灵羽","十级灵羽",2,150,500) end

function onTalkhc11jly(player) lyhcxt(player,"十级灵羽","十一级灵羽",2,3,10) end
function onTalkhc11jly10(player) lyhcxt(player,"十级灵羽","十一级灵羽",2,30,100) end
function onTalkhc11jly50(player) lyhcxt(player,"十级灵羽","十一级灵羽",2,150,500) end

function onTalkhc12jly(player) lyhcxt(player,"十一级灵羽","十二级灵羽",2,3,10) end
function onTalkhc12jly10(player) lyhcxt(player,"十一级灵羽","十二级灵羽",2,30,100) end
function onTalkhc12jly50(player) lyhcxt(player,"十一级灵羽","十二级灵羽",2,150,500) end

function onTalkhc13jly(player) lyhcxt(player,"十二级灵羽","十三级灵羽",2,3,10) end
function onTalkhc13jly10(player) lyhcxt(player,"十二级灵羽","十三级灵羽",2,30,100) end
function onTalkhc13jly50(player) lyhcxt(player,"十二级灵羽","十三级灵羽",2,150,500) end

function lyhcxt(player,a,b,c,d,e)
	if a and b and c and d and e then
		if player:num_bag_black() >= 1 then
			if player:get_vcoin() >= e then
				if player:num_item(a,1) >= d then
					player:sub_vcoin(e,"chibang");
					player:remove_item(a,d);
					player:add_item_log(b,229,(e/10));
					player:alert(11,1,"恭喜您成功合成"..(e/10).."个["..b.."]");
				else
					player:alert(1,1,"您的["..a.."]不足"..d.."个,合成失败!");
				end
			else
			player:alert(11,1,"您的元宝不足["..e.."],无法合成灵羽!");
			end
		else
		player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
		end
		if c==1 then onTalklyhc(player); end
		if c==2 then onTalklyhc2(player); end
	end
end