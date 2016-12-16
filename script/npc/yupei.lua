module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[<font color="#FFaa00">玉之美,有如君子之德.君子无故,玉不去身.</font>
--------------------------------------
<font color="#FFFF00">您可以在我这里拿到象征美德与荣耀的玉佩</font>
--------------------------------------
		<a href="event:talk_dhyupei">玉石兑换玉佩</a>
--------------------------------------
		<a href="event:talk_dhyushi">玉石原石兑换玉石</a>
--------------------------------------
		<font color="#FFff00">您当前的玉石数量为:]]..util.ppn(player,const.PP_PERSONAL_YUSHI)..[[</font>
--------------------------------------
<font color="#FFff00">如何获得玉石原石</font>: <font color="#FFaa00">参加充值积分商城购买获得</font>
--------------------------------------
<font color="#FFFF00">您可以在我这里拿到象征身份与华贵的披风</font>
--------------------------------------
		<a href="event:talk_dhpifeng">天蚕精华兑换披风</a>
--------------------------------------
		<a href="event:talk_dhtiancan">天蚕精华兑换天蚕丝</a>
--------------------------------------
		<font color="#FFff00">您当前的天蚕丝数量为:]]..util.ppn(player,const.PP_PERSONAL_TIANCAN)..[[</font>
--------------------------------------
<font color="#FFff00">如何获得天蚕精华</font>: <font color="#FFaa00">参加充值积分商城购买获得</font>
--------------------------------------
]]);
end

function onTalkdhyupei(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">玉佩升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的玉佩: </font><font color="#ff0000"> [当前玉石:]]..util.ppn(player,const.PP_PERSONAL_YUSHI)..[[]</font>
---------------------------------------
##羊脂玉(1级)##          <a href="event:talk_sj1yp">点击此处兑换</a>
兑换需要: <font color="#ffaa00">玉石原石*3</font>
---------------------------------------
##冰芝玉(2级)##          <a href="event:talk_sj2yp">点击此处升级</a>
升级需要: <font color="#ffaa00">羊脂玉*1,玉石*500</font>
---------------------------------------
##翡翠玉(3级)##          <a href="event:talk_sj3yp">点击此处升级</a>
升级需要: <font color="#ffaa00">冰芝玉*1,玉石*915</font>
---------------------------------------
##龙纹佩(4级)##          <a href="event:talk_sj4yp">点击此处升级</a>
升级需要: <font color="#ffaa00">翡翠玉*1,玉石*1674</font>
---------------------------------------
##琅环玉佩(5级)##        <a href="event:talk_sj5yp">点击此处升级</a>
升级需要: <font color="#ffaa00">龙纹佩*1,玉石*3063</font>
---------------------------------------
##盘蛇玉佩(6级)##        <a href="event:talk_sj6yp">点击此处升级</a>
升级需要: <font color="#ffaa00">琅环玉佩*1,玉石*5605</font>
---------------------------------------
                   　　<a href="event:talk_dhyupei2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj1yp(npc,player)
	if  player:num_item("羊脂玉(1级)",1) >= 1 or  player:num_item("羊脂玉(1级)",10) >= 1 or player:num_item("羊脂玉(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[羊脂玉],还是别兑换了!!")
	else
		if player:num_item("玉石原石",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("玉石原石",3);
				player:add_item("羊脂玉(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[羊脂玉(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"兑换羊脂玉(1级)需要[玉石原石]*3!")
		end
	end
	onTalkdhyupei(npc,player);
end

function onTalkdhyupei2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">玉佩升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的玉佩:</font><font color="#ff0000"> [当前玉石:]]..util.ppn(player,const.PP_PERSONAL_YUSHI)..[[]</font>
---------------------------------------
##同心玉佩(7级)##        <a href="event:talk_sj7yp">点击此处升级</a>
升级需要: <font color="#ffaa00">盘蛇玉佩*1,玉石*10257</font>
---------------------------------------
##祥瑞玉佩(8级)##        <a href="event:talk_sj8yp">点击此处升级</a>
升级需要: <font color="#ffaa00">同心玉佩*1,玉石*18770</font>
---------------------------------------
##花晨月夕佩(9级)##      <a href="event:talk_sj9yp">点击此处升级</a>
升级需要: <font color="#ffaa00">祥瑞玉佩*1,玉石*34349</font>
---------------------------------------
##双鱼献珠佩(10级)##     <a href="event:talk_sj10yp">点击此处升级</a>
升级需要: <font color="#ffaa00">花晨月夕佩*1,玉石*62858</font>
---------------------------------------
##碧海青天佩(11级)##     <a href="event:talk_sj11yp">点击此处升级</a>
升级需要: <font color="#ffaa00">双鱼献珠佩*1,玉石*115030</font>
---------------------------------------
##龙凤呈祥佩(12级)##     <a href="event:talk_sj12yp">点击此处升级</a>
升级需要: <font color="#ffaa00">碧海青天佩*1,玉石*210504</font>
---------------------------------------
                   　　<a href="event:talk_dhyupei">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj2yp(npc,player) cbsjxt(npc,player,200000,"玉石",500,"羊脂玉(1级)","冰芝玉(2级)",200001,1) end
function onTalksj3yp(npc,player) cbsjxt(npc,player,200001,"玉石",915,"冰芝玉(2级)","翡翠玉(3级)",200002,1) end
function onTalksj4yp(npc,player) cbsjxt(npc,player,200002,"玉石",1674,"翡翠玉(3级)","龙纹佩(4级)",200003,1) end
function onTalksj5yp(npc,player) cbsjxt(npc,player,200003,"玉石",3063,"龙纹佩(4级)","琅环玉佩(5级)",200004,1) end
function onTalksj6yp(npc,player) cbsjxt(npc,player,200004,"玉石",5605,"琅环玉佩(5级)","盘蛇玉佩(6级)",200005,1) end
function onTalksj7yp(npc,player) cbsjxt(npc,player,200005,"玉石",10257,"盘蛇玉佩(6级)","同心玉佩(7级)",200006,2) end
function onTalksj8yp(npc,player) cbsjxt(npc,player,200006,"玉石",18770,"同心玉佩(7级)","祥瑞玉佩(8级)",200007,2) end
function onTalksj9yp(npc,player) cbsjxt(npc,player,200007,"玉石",34349,"祥瑞玉佩(8级)","花晨月夕佩(9级)",200008,2) end
function onTalksj10yp(npc,player) cbsjxt(npc,player,200008,"玉石",62858,"花晨月夕佩(9级)","双鱼献珠佩(10级)",200009,2) end
function onTalksj11yp(npc,player) cbsjxt(npc,player,200009,"玉石",115030,"双鱼献珠佩(10级)","碧海青天佩(11级)",200010,2) end
function onTalksj12yp(npc,player) cbsjxt(npc,player,200010,"玉石",210504,"碧海青天佩(11级)","龙凤呈祥佩(12级)",200011,2) end

function cbsjxt(npc,player,a,b,num,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if util.ppn(player,const.PP_PERSONAL_YUSHI) >= num then
					if player:num_item(c,1) >= 1 then
						player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)-num);
						player:remove_item(c,1);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						if a >= 200005 then
							server.info(10000,1,"["..player:get_name().."]在土城饰品大师处成功将玉佩升级为["..d.."]");
							server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在土城饰品大师处成功将玉佩升级为[<font color='#ff0000'>"..d.."</font>]");
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您的["..b.."]数量不足"..num..",升级失败!");
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
		if f==1 then onTalkdhyupei(npc,player); end
		if f==2 then onTalkdhyupei2(npc,player); end
	end
end


function onTalkdhyushi(npc,player)
	if player:num_item("玉石原石",1) >= 1 then
		player:remove_item("玉石原石",1);
		local i = math.random(1,1000);
		local jf = 500;
		if i >= 1 and i <= 10 then
			jf = 5000;
		end
		if i >= 11 and i <= 60 then
			jf = 2500;
		end
		if i >= 61 and i <= 170 then
			jf = 1000;
		end
		if i >= 171 and i <= 1000 then
			jf = 500;
		end
		player:set_param(const.PP_PERSONAL_YUSHI,util.ppn(player,const.PP_PERSONAL_YUSHI)+jf);
		player:alert(11,1,"玉石数量增加:"..jf);
		player:alert(11,0,"当前玉石数量:"..util.ppn(player,const.PP_PERSONAL_YUSHI));
		onTalk100(npc,player)
	else
		player:alert(1,1,"您没有[玉石原石]无法兑换玉石哦!<br><br>[玉石原石]可在积分商铺兑换获得!");
		onTalk100(npc,player)
	end
end

-------------披风--------------------
function onTalkdhpifeng(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">披风升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的披风: </font><font color="#ff0000"> [当前天蚕丝:]]..util.ppn(player,const.PP_PERSONAL_TIANCAN)..[[]</font>
---------------------------------------
##水蓝披风(1级)##        <a href="event:talk_sj1pf">点击此处兑换</a>
兑换需要: <font color="#ffaa00">天蚕精华*3</font>
---------------------------------------
##隐者披风(2级)##        <a href="event:talk_sj2pf">点击此处升级</a>
升级需要: <font color="#ffaa00">水蓝披风*1,天蚕丝*500</font>
---------------------------------------
##勇士披风(3级)##        <a href="event:talk_sj3pf">点击此处升级</a>
升级需要: <font color="#ffaa00">隐者披风*1,天蚕丝*915</font>
---------------------------------------
##霸者披风(4级)##        <a href="event:talk_sj4pf">点击此处升级</a>
升级需要: <font color="#ffaa00">勇士披风*1,天蚕丝*1674</font>
---------------------------------------
##统御披风(5级)##        <a href="event:talk_sj5pf">点击此处升级</a>
升级需要: <font color="#ffaa00">霸者披风*1,天蚕丝*3063</font>
---------------------------------------
##强袭披风(6级)##        <a href="event:talk_sj6pf">点击此处升级</a>
升级需要: <font color="#ffaa00">统御披风*1,天蚕丝*5605</font>
---------------------------------------
                   　　<a href="event:talk_dhpifeng2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end
function onTalkdhpifeng2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">披风升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的玉佩:</font><font color="#ff0000"> [当前天蚕丝:]]..util.ppn(player,const.PP_PERSONAL_TIANCAN)..[[]</font>
---------------------------------------
##惊世披风(7级)##        <a href="event:talk_sj7pf">点击此处升级</a>
升级需要: <font color="#ffaa00">强袭披风*1,天蚕丝*10257</font>
---------------------------------------
##不败披风(8级)##        <a href="event:talk_sj8pf">点击此处升级</a>
升级需要: <font color="#ffaa00">惊世披风*1,天蚕丝*18770</font>
---------------------------------------
##烈焰披风(9级)##        <a href="event:talk_sj9pf">点击此处升级</a>
升级需要: <font color="#ffaa00">不败披风*1,天蚕丝*34349</font>
---------------------------------------
##屠龙披风(10级)##       <a href="event:talk_sj10pf">点击此处升级</a>
升级需要: <font color="#ffaa00">烈焰披风*1,天蚕丝*62858</font>
---------------------------------------
##王者披风(11级)##       <a href="event:talk_sj11pf">点击此处升级</a>
升级需要: <font color="#ffaa00">屠龙披风*1,天蚕丝*115030</font>
---------------------------------------
##战神披风(12级)##       <a href="event:talk_sj12pf">点击此处升级</a>
升级需要: <font color="#ffaa00">王者披风*1,天蚕丝*210504</font>
---------------------------------------
                   　　<a href="event:talk_dhpifeng">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj1pf(npc,player)
	if  player:num_item("水蓝披风(1级)",1) >= 1 or  player:num_item("水蓝披风(1级)",10) >= 1 or player:num_item("水蓝披风(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[水蓝披风],还是别兑换了!!")
	else
		if player:num_item("天蚕精华",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("天蚕精华",3);
				player:add_item("水蓝披风(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[水蓝披风(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"水蓝披风(1级)需要[天蚕精华]*3!")
		end
	end
	onTalkdhpifeng(npc,player);
end
function onTalksj2pf(npc,player) uppifeng(npc,player,260001,"天蚕丝",500,"水蓝披风(1级)","隐者披风(2级)",260002,1) end
function onTalksj3pf(npc,player) uppifeng(npc,player,260002,"天蚕丝",915,"隐者披风(2级)","勇士披风(3级)",260003,1) end
function onTalksj4pf(npc,player) uppifeng(npc,player,260003,"天蚕丝",1674,"勇士披风(3级)","霸者披风(4级)",260004,1) end
function onTalksj5pf(npc,player) uppifeng(npc,player,260004,"天蚕丝",3063,"霸者披风(4级)","统御披风(5级)",260005,1) end
function onTalksj6pf(npc,player) uppifeng(npc,player,260005,"天蚕丝",5605,"统御披风(5级)","强袭披风(6级)",260006,1) end
function onTalksj7pf(npc,player) uppifeng(npc,player,260006,"天蚕丝",10257,"强袭披风(6级)","惊世披风(7级)",260007,2) end
function onTalksj8pf(npc,player) uppifeng(npc,player,260007,"天蚕丝",18770,"惊世披风(7级)","不败披风(8级)",260008,2) end
function onTalksj9pf(npc,player) uppifeng(npc,player,260008,"天蚕丝",34349,"不败披风(8级)","烈焰披风(9级)",260009,2) end
function onTalksj10pf(npc,player) uppifeng(npc,player,260009,"天蚕丝",62858,"烈焰披风(9级)","屠龙披风(10级)",260010,2) end
function onTalksj11pf(npc,player) uppifeng(npc,player,260010,"天蚕丝",115030,"屠龙披风(10级)","王者披风(11级)",260011,2) end
function onTalksj12pf(npc,player) uppifeng(npc,player,260011,"天蚕丝",210504,"王者披风(11级)","战神披风(12级)",260012,2) end

function uppifeng(npc,player,a,b,num,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if util.ppn(player,const.PP_PERSONAL_TIANCAN) >= num then
					if player:num_item(c,1) >= 1 then
						player:set_param(const.PP_PERSONAL_TIANCAN,util.ppn(player,const.PP_PERSONAL_TIANCAN)-num);
						player:remove_item(c,1);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						if a >= 260005 then
							server.info(10000,1,"["..player:get_name().."]在土城饰品大师处成功将披风升级为["..d.."]");
							server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在土城饰品大师处成功将披风升级为[<font color='#ff0000'>"..d.."</font>]");
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您的["..b.."]数量不足"..num..",升级失败!");
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
		if f==1 then onTalkdhpifeng(npc,player); end
		if f==2 then onTalkdhpifeng2(npc,player); end
	end
end
function onTalkdhtiancan(npc,player)
	if player:num_item("天蚕精华",1) >= 1 then
		player:remove_item("天蚕精华",1);
		local i = math.random(1,1000);
		local jf = 500;
		if i >= 1 and i <= 10 then
			jf = 5000;
		end
		if i >= 11 and i <= 60 then
			jf = 2500;
		end
		if i >= 61 and i <= 170 then
			jf = 1000;
		end
		if i >= 171 and i <= 1000 then
			jf = 500;
		end
		player:set_param(const.PP_PERSONAL_TIANCAN,util.ppn(player,const.PP_PERSONAL_TIANCAN)+jf);
		player:alert(11,1,"天蚕丝数量增加:"..jf);
		player:alert(11,0,"当前天蚕丝数量:"..util.ppn(player,const.PP_PERSONAL_TIANCAN));
		onTalk100(npc,player)
	else
		player:alert(1,1,"您没有[天蚕精华]无法兑换天蚕丝哦!<br><br>[天蚕精华]可在积分商铺兑换获得!");
		onTalk100(npc,player)
	end
end