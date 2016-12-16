module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[<font color="#FFaa00">符之美,佑护君子之身.守身避邪,修神养性.</font>
--------------------------------------
<font color="#FFFF00">您可以在我这里拿到象征守护与至尊的护符</font>
--------------------------------------
        <a href="event:talk_hfqisha">兑换七杀</a>          <a href="event:talk_hfpojun">兑换破军</a>

        <a href="event:talk_hftanlang">兑换贪狼</a>          <a href="event:talk_hfziwei">兑换紫薇</a>
--------------------------------------
	<a href="event:talk_dhxingshii">星石兑换星尘</a>
--------------------------------------
		<font color="#FFff00">您当前的星尘数量为:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[</font>
--------------------------------------
]]);
	npc:echo([[<font color="#FFaa00">天书，传说天神下凡，品尽人间疾苦，离去前怜悯生灵而留下的一卷神册。得之者，得天下！</font>
--------------------------------------
<font color="#FFFF00">您可以在我这里拿到象征实力与荣耀的天书</font>
--------------------------------------
		<a href="event:talk_dhtianshu">兑换天书</a>
--------------------------------------
		<a href="event:talk_dhtianshusuip">天书精华兑换天书碎片</a>
--------------------------------------
		<font color="#FFff00">您当前的天书碎片数量为:]]..util.ppn(player,const.PP_TIANSHU_SUIPIAN)..[[</font>
--------------------------------------
<font color="#FFff00">如何获得天书精华</font>: <font color="#FFaa00">参加充值积分商城购买获得</font>
--------------------------------------
]]);
end

function onTalkdhtianshusuip(npc,player)
	if player:num_item("天书精华",1) >= 1 then
		player:remove_item("天书精华",1);
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
		player:set_param(const.PP_TIANSHU_SUIPIAN,util.ppn(player,const.PP_TIANSHU_SUIPIAN)+jf);
		player:alert(11,1,"天书碎片数量增加:"..jf);
		player:alert(11,0,"当前天书碎片数量:"..util.ppn(player,const.PP_TIANSHU_SUIPIAN));
		onTalk100(npc,player)
	else
		player:alert(1,1,"您没有[天书精华]无法兑换天书碎片哦!<br><br>[天书精华]可在积分商铺兑换获得!");
		onTalk100(npc,player)
	end
end

----天书精华-》天书碎片-》天书

function onTalkdhtianshu(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">天书升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的天书: </font><font color="#ff0000"> [当前天书碎片:]]..util.ppn(player,const.PP_TIANSHU_SUIPIAN)..[[]</font>
---------------------------------------
##无字天书(1级)##      <a href="event:talk_sj1yp">点击此处兑换</a>
兑换需要: <font color="#ffaa00">天书精华*3</font>
---------------------------------------
##三略(2级)##          <a href="event:talk_sj2yp">点击此处升级</a>
升级需要: <font color="#ffaa00">无字天书(1级)*1,天书碎片*500</font>
---------------------------------------
##六韬(3级)##          <a href="event:talk_sj3yp">点击此处升级</a>
升级需要: <font color="#ffaa00">三略(2级)*1,天书碎片*915</font>
---------------------------------------
##墨子(4级)##          <a href="event:talk_sj4yp">点击此处升级</a>
升级需要: <font color="#ffaa00">六韬(3级)*1,天书碎片*1674</font>
---------------------------------------
##道德经(5级)##        <a href="event:talk_sj5yp">点击此处升级</a>
升级需要: <font color="#ffaa00">墨子(4级)*1,天书碎片*3063</font>
---------------------------------------
##庄子(6级)##          <a href="event:talk_sj6yp">点击此处升级</a>
升级需要: <font color="#ffaa00">道德经(5级)*1,天书碎片*5605</font>
---------------------------------------
                   　　<a href="event:talk_dhtianshu2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end


function onTalksj1yp(npc,player)
	if  player:num_item("无字天书(1级)",1) >= 1 or  player:num_item("无字天书(1级)",10) >= 1 or player:num_item("无字天书(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[无字天书(1级)],还是别兑换了!!")
	else
		if player:num_item("天书精华",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("天书精华",3);
				player:add_item("无字天书(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[无字天书(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"兑换无字天书(1级)需要[天书精华]*3!")
		end
	end
	onTalkdhtianshu(npc,player);
end

function onTalkdhtianshu2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">天书升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的天书: </font><font color="#ff0000"> [当前天书碎片:]]..util.ppn(player,const.PP_TIANSHU_SUIPIAN)..[[]</font>
---------------------------------------
##易经(7级)##            <a href="event:talk_sj7yp">点击此处升级</a>
升级需要: <font color="#ffaa00">庄子(6级)*1,天书碎片*10257</font>
---------------------------------------
##太平清领道(8级)##      <a href="event:talk_sj8yp">点击此处升级</a>
升级需要: <font color="#ffaa00">易经(7级)*1,天书碎片*18770</font>
---------------------------------------
##山海经(9级)##          <a href="event:talk_sj9yp">点击此处升级</a>
升级需要: <font color="#ffaa00">太平清领道(8级)*1,天书碎片*34349</font>
---------------------------------------
##太平要术(10级)##       <a href="event:talk_sj10yp">点击此处升级</a>
升级需要: <font color="#ffaa00">山海经(9级)*1,天书碎片*62858</font>
---------------------------------------
##遁甲天书(11级)##       <a href="event:talk_sj11yp">点击此处升级</a>
升级需要: <font color="#ffaa00">太平要术(10级)*1,天书碎片*115030</font>
---------------------------------------
##孙子兵法(12级)##       <a href="event:talk_sj12yp">点击此处升级</a>
升级需要: <font color="#ffaa00">遁甲天书(11级)*1,天书碎片*210504</font>
---------------------------------------
                   　　<a href="event:talk_dhtianshu">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end
function onTalksj2yp(npc,player) cbsjxtts(npc,player,250001,"天书碎片",500,"无字天书(1级)","三略(2级)",250002,1) end
function onTalksj3yp(npc,player) cbsjxtts(npc,player,250002,"天书碎片",915,"三略(2级)","六韬(3级)",250003,1) end
function onTalksj4yp(npc,player) cbsjxtts(npc,player,250003,"天书碎片",1674,"六韬(3级)","墨子(4级)",250004,1) end
function onTalksj5yp(npc,player) cbsjxtts(npc,player,250004,"天书碎片",3063,"墨子(4级)","道德经(5级)",250005,1) end
function onTalksj6yp(npc,player) cbsjxtts(npc,player,250005,"天书碎片",5605,"道德经(5级)","庄子(6级)",250006,1) end
function onTalksj7yp(npc,player) cbsjxtts(npc,player,250006,"天书碎片",10257,"庄子(6级)","易经(7级)",250007,2) end
function onTalksj8yp(npc,player) cbsjxtts(npc,player,250007,"天书碎片",18770,"易经(7级)","太平清领道(8级)",250008,2) end
function onTalksj9yp(npc,player) cbsjxtts(npc,player,250008,"天书碎片",34349,"太平清领道(8级)","山海经(9级)",250009,2) end
function onTalksj10yp(npc,player) cbsjxtts(npc,player,250009,"天书碎片",62858,"山海经(9级)","太平要术(10级)",250010,2) end
function onTalksj11yp(npc,player) cbsjxtts(npc,player,250010,"天书碎片",115030,"太平要术(10级)","遁甲天书(11级)",250011,2) end
function onTalksj12yp(npc,player) cbsjxtts(npc,player,250011,"天书碎片",210504,"遁甲天书(11级)","孙子兵法(12级)",250012,2) end


function cbsjxtts(npc,player,a,b,num,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			--print("ittype_id",ittype_id,a)
			if ittype_id == a then
				if util.ppn(player,const.PP_TIANSHU_SUIPIAN) >= num then
					if player:num_item(c,1) >= 1 then
						player:set_param(const.PP_TIANSHU_SUIPIAN,util.ppn(player,const.PP_TIANSHU_SUIPIAN)-num);
						player:remove_item(c,1);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						if a >= 200005 then
							server.info(10000,1,"["..player:get_name().."]在凌霄城护符大师处成功将天书升级为["..d.."]");
							server.info(10 ,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在凌霄城护符大师处成功将天书升级为[<font color='#ff0000'>"..d.."</font>]");
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
		if f==1 then onTalkdhtianshu(npc,player); end
		if f==2 then onTalkdhtianshu2(npc,player); end
	end
end



function onTalkhfqisha(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符: </font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##七杀(1级)##          <a href="event:talk_sj1hfqs">点击此处兑换</a>
兑换需要: <font color="#ffaa00">星石*3</font>
---------------------------------------
##七杀(2级)##          <a href="event:talk_sj2hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(1级)*1,星尘*300</font>
---------------------------------------
##七杀(3级)##          <a href="event:talk_sj3hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(2级)*1,星尘*538</font>
---------------------------------------
##七杀(4级)##          <a href="event:talk_sj4hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(3级)*1,星尘*965</font>
---------------------------------------
##七杀(5级)##          <a href="event:talk_sj5hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(4级)*1,星尘*1732</font>
---------------------------------------
##七杀(6级)##          <a href="event:talk_sj6hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(5级)*1,星尘*3108</font>
---------------------------------------
                   　　<a href="event:talk_hfqisha2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj1hfqs(npc,player)
	if  player:num_item("七杀(1级)",1) >= 1 or  player:num_item("七杀(1级)",10) >= 1 or player:num_item("七杀(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[七杀(1级)],还是别兑换了!!")
	else
		if player:num_item("星石",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("星石",3);
				player:add_item("七杀(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[七杀(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"七杀(1级)需要[星石]*3!")
		end
	end
	onTalkhfqisha(npc,player);
end

function onTalkhfqisha2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符:</font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##七杀(7级)##        <a href="event:talk_sj7hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(6级)*1,星尘*5578</font>
---------------------------------------
##七杀(8级)##        <a href="event:talk_sj8hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(7级)*1,星尘*10012</font>
---------------------------------------
##七杀(9级)##        <a href="event:talk_sj9hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(8级)*1,星尘*17971</font>
---------------------------------------
##七杀(10级)##       <a href="event:talk_sj10hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(9级)*1,星尘*32257</font>
---------------------------------------
##七杀(11级)##       <a href="event:talk_sj11hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(10级)*1,星尘*57901</font>
---------------------------------------
##七杀(12级)##       <a href="event:talk_sj12hfqs">点击此处升级</a>
升级需要: <font color="#ffaa00">七杀(11级)*1,星尘*103932</font>
---------------------------------------
                   　　<a href="event:talk_hfqisha">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj2hfqs(npc,player) cbsjxtgg(npc,player,210001,"星尘",300,"七杀(1级)","七杀(2级)",210002,1) end
function onTalksj3hfqs(npc,player) cbsjxtgg(npc,player,210002,"星尘",538,"七杀(2级)","七杀(3级)",210003,1) end
function onTalksj4hfqs(npc,player) cbsjxtgg(npc,player,210003,"星尘",965,"七杀(3级)","七杀(4级)",210004,1) end
function onTalksj5hfqs(npc,player) cbsjxtgg(npc,player,210004,"星尘",1732,"七杀(4级)","七杀(5级)",210005,1) end
function onTalksj6hfqs(npc,player) cbsjxtgg(npc,player,210005,"星尘",3108,"七杀(5级)","七杀(6级)",210006,1) end
function onTalksj7hfqs(npc,player) cbsjxtgg(npc,player,210006,"星尘",5578,"七杀(6级)","七杀(7级)",210007,2) end
function onTalksj8hfqs(npc,player) cbsjxtgg(npc,player,210007,"星尘",10012,"七杀(7级)","七杀(8级)",210008,2) end
function onTalksj9hfqs(npc,player) cbsjxtgg(npc,player,210008,"星尘",17971,"七杀(8级)","七杀(9级)",210009,2) end
function onTalksj10hfqs(npc,player) cbsjxtgg(npc,player,210009,"星尘",32257,"七杀(9级)","七杀(10级)",210010,2) end
function onTalksj11hfqs(npc,player) cbsjxtgg(npc,player,210010,"星尘",57901,"七杀(10级)","七杀(11级)",210011,2) end
function onTalksj12hfqs(npc,player) cbsjxtgg(npc,player,210011,"星尘",103932,"七杀(11级)","七杀(12级)",210012,2) end

-------------------------------------------------

function onTalkhfpojun(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符: </font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##破军(1级)##          <a href="event:talk_sj1hfpj">点击此处兑换</a>
兑换需要: <font color="#ffaa00">星石*3</font>
---------------------------------------
##破军(2级)##          <a href="event:talk_sj2hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(1级)*1,星尘*300</font>
---------------------------------------
##破军(3级)##          <a href="event:talk_sj3hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(2级)*1,星尘*538</font>
---------------------------------------
##破军(4级)##          <a href="event:talk_sj4hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(3级)*1,星尘*965</font>
---------------------------------------
##破军(5级)##          <a href="event:talk_sj5hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(4级)*1,星尘*1732</font>
---------------------------------------
##破军(6级)##          <a href="event:talk_sj6hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(5级)*1,星尘*3108</font>
---------------------------------------
                   　　<a href="event:talk_hfpojun2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj1hfpj(npc,player)
	if  player:num_item("破军(1级)",1) >= 1 or  player:num_item("破军(1级)",10) >= 1 or player:num_item("破军(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[破军(1级)],还是别兑换了!!")
	else
		if player:num_item("星石",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("星石",3);
				player:add_item("破军(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[破军(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"兑换破军(1级)需要[星石]*3!")
		end
	end
	onTalkhfpojun(npc,player);
end

function onTalkhfpojun2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符:</font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##破军(7级)##        <a href="event:talk_sj7hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(6级)*1,星尘*5578</font>
---------------------------------------
##破军(8级)##        <a href="event:talk_sj8hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(7级)*1,星尘*10012</font>
---------------------------------------
##破军(9级)##        <a href="event:talk_sj9hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(8级)*1,星尘*17971</font>
---------------------------------------
##破军(10级)##       <a href="event:talk_sj10hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(9级)*1,星尘*32257</font>
---------------------------------------
##破军(11级)##       <a href="event:talk_sj11hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(10级)*1,星尘*57901</font>
---------------------------------------
##破军(12级)##       <a href="event:talk_sj12hfpj">点击此处升级</a>
升级需要: <font color="#ffaa00">破军(11级)*1,星尘*103932</font>
---------------------------------------
                   　　<a href="event:talk_hfpojun">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj2hfpj(npc,player) cbsjxtgg(npc,player,220001,"星尘",300,"破军(1级)","破军(2级)",220002,3) end
function onTalksj3hfpj(npc,player) cbsjxtgg(npc,player,220002,"星尘",538,"破军(2级)","破军(3级)",220003,3) end
function onTalksj4hfpj(npc,player) cbsjxtgg(npc,player,220003,"星尘",965,"破军(3级)","破军(4级)",220004,3) end
function onTalksj5hfpj(npc,player) cbsjxtgg(npc,player,220004,"星尘",1732,"破军(4级)","破军(5级)",220005,3) end
function onTalksj6hfpj(npc,player) cbsjxtgg(npc,player,220005,"星尘",3108,"破军(5级)","破军(6级)",220006,3) end
function onTalksj7hfpj(npc,player) cbsjxtgg(npc,player,220006,"星尘",5578,"破军(6级)","破军(7级)",220007,4) end
function onTalksj8hfpj(npc,player) cbsjxtgg(npc,player,220007,"星尘",10012,"破军(7级)","破军(8级)",220008,4) end
function onTalksj9hfpj(npc,player) cbsjxtgg(npc,player,220008,"星尘",17971,"破军(8级)","破军(9级)",220009,4) end
function onTalksj10hfpj(npc,player) cbsjxtgg(npc,player,220009,"星尘",32257,"破军(9级)","破军(10级)",220010,4) end
function onTalksj11hfpj(npc,player) cbsjxtgg(npc,player,220010,"星尘",57901,"破军(10级)","破军(11级)",220011,4) end
function onTalksj12hfpj(npc,player) cbsjxtgg(npc,player,220011,"星尘",103932,"破军(11级)","破军(12级)",220012,4) end

-------------------------------------------------

function onTalkhftanlang(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符: </font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##贪狼(1级)##          <a href="event:talk_sj1hftl">点击此处兑换</a>
兑换需要: <font color="#ffaa00">星石*3</font>
---------------------------------------
##贪狼(2级)##          <a href="event:talk_sj2hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(1级)*1,星尘*300</font>
---------------------------------------
##贪狼(3级)##          <a href="event:talk_sj3hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(2级)*1,星尘*538</font>
---------------------------------------
##贪狼(4级)##          <a href="event:talk_sj4hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(3级)*1,星尘*965</font>
---------------------------------------
##贪狼(5级)##          <a href="event:talk_sj5hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(4级)*1,星尘*1732</font>
---------------------------------------
##贪狼(6级)##          <a href="event:talk_sj6hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(5级)*1,星尘*3108</font>
---------------------------------------
                   　　<a href="event:talk_hftanlang2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj1hftl(npc,player)
	if  player:num_item("贪狼(1级)",1) >= 1 or  player:num_item("贪狼(1级)",10) >= 1 or player:num_item("贪狼(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[贪狼(1级)],还是别兑换了!!")
	else
		if player:num_item("星石",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("星石",3);
				player:add_item("贪狼(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[贪狼(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"兑换贪狼(1级)需要[星石]*3!")
		end
	end
	onTalkhftanlang(npc,player);
end

function onTalkhftanlang2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符:</font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##贪狼(7级)##        <a href="event:talk_sj7hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(6级)*1,星尘*5578</font>
---------------------------------------
##贪狼(8级)##        <a href="event:talk_sj8hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(7级)*1,星尘*10012</font>
---------------------------------------
##贪狼(9级)##        <a href="event:talk_sj9hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(8级)*1,星尘*17971</font>
---------------------------------------
##贪狼(10级)##       <a href="event:talk_sj10hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(9级)*1,星尘*32257</font>
---------------------------------------
##贪狼(11级)##       <a href="event:talk_sj11hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(10级)*1,星尘*57901</font>
---------------------------------------
##贪狼(12级)##       <a href="event:talk_sj12hftl">点击此处升级</a>
升级需要: <font color="#ffaa00">贪狼(11级)*1,星尘*103932</font>
---------------------------------------
                   　　<a href="event:talk_hftanlang">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj2hftl(npc,player) cbsjxtgg(npc,player,230001,"星尘",300,"贪狼(1级)","贪狼(2级)",230002,5) end
function onTalksj3hftl(npc,player) cbsjxtgg(npc,player,230002,"星尘",538,"贪狼(2级)","贪狼(3级)",230003,5) end
function onTalksj4hftl(npc,player) cbsjxtgg(npc,player,230003,"星尘",965,"贪狼(3级)","贪狼(4级)",230004,5) end
function onTalksj5hftl(npc,player) cbsjxtgg(npc,player,230004,"星尘",1732,"贪狼(4级)","贪狼(5级)",230005,5) end
function onTalksj6hftl(npc,player) cbsjxtgg(npc,player,230005,"星尘",3108,"贪狼(5级)","贪狼(6级)",230006,5) end
function onTalksj7hftl(npc,player) cbsjxtgg(npc,player,230006,"星尘",5578,"贪狼(6级)","贪狼(7级)",230007,6) end
function onTalksj8hftl(npc,player) cbsjxtgg(npc,player,230007,"星尘",10012,"贪狼(7级)","贪狼(8级)",230008,6) end
function onTalksj9hftl(npc,player) cbsjxtgg(npc,player,230008,"星尘",17971,"贪狼(8级)","贪狼(9级)",230009,6) end
function onTalksj10hftl(npc,player) cbsjxtgg(npc,player,230009,"星尘",32257,"贪狼(9级)","贪狼(10级)",230010,6) end
function onTalksj11hftl(npc,player) cbsjxtgg(npc,player,230010,"星尘",57901,"贪狼(10级)","贪狼(11级)",230011,6) end
function onTalksj12hftl(npc,player) cbsjxtgg(npc,player,230011,"星尘",103932,"贪狼(11级)","贪狼(12级)",230012,6) end

-------------------------------------------------

function onTalkhfziwei(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符: </font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##紫薇(1级)##          <a href="event:talk_sj1hfzw">点击此处兑换</a>
兑换需要: <font color="#ffaa00">星石*3</font>
---------------------------------------
##紫薇(2级)##          <a href="event:talk_sj2hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(1级)*1,星尘*300</font>
---------------------------------------
##紫薇(3级)##          <a href="event:talk_sj3hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(2级)*1,星尘*538</font>
---------------------------------------
##紫薇(4级)##          <a href="event:talk_sj4hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(3级)*1,星尘*965</font>
---------------------------------------
##紫薇(5级)##          <a href="event:talk_sj5hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(4级)*1,星尘*1732</font>
---------------------------------------
##紫薇(6级)##          <a href="event:talk_sj6hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(5级)*1,星尘*3108</font>
---------------------------------------
                   　　<a href="event:talk_hfziwei2">下一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj1hfzw(npc,player)
	if  player:num_item("紫薇(1级)",1) >= 1 or  player:num_item("紫薇(1级)",10) >= 1 or player:num_item("紫薇(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[紫薇(1级)],还是别兑换了!!")
	else
		if player:num_item("星石",1) >= 3 then
			if player:num_bag_black() >= 1 then
				player:remove_item("星石",3);
				player:add_item("紫薇(1级)",1,1);
				player:alert(11,1,"恭喜您成功兑换[紫薇(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"兑换紫薇(1级)需要[星石]*3!")
		end
	end
	onTalkhfziwei(npc,player);
end

function onTalkhfziwei2(npc,player)
	npc:echo([[           <b><font color="#ccbb77" size="14px">护符升级兑换列表</font></b>
<font color="#ffff00">请选择您想升级的护符:</font><font color="#ff0000"> [当前星尘:]]..util.ppn(player,const.PP_PERSONAL_XINGCHEN)..[[]</font>
---------------------------------------
##紫薇(7级)##        <a href="event:talk_sj7hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(6级)*1,星尘*5578</font>
---------------------------------------
##紫薇(8级)##        <a href="event:talk_sj8hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(7级)*1,星尘*10012</font>
---------------------------------------
##紫薇(9级)##        <a href="event:talk_sj9hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(8级)*1,星尘*17971</font>
---------------------------------------
##紫薇(10级)##       <a href="event:talk_sj10hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(9级)*1,星尘*32257</font>
---------------------------------------
##紫薇(11级)##       <a href="event:talk_sj11hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(10级)*1,星尘*57901</font>
---------------------------------------
##紫薇(12级)##       <a href="event:talk_sj12hfzw">点击此处升级</a>
升级需要: <font color="#ffaa00">紫薇(11级)*1,星尘*103932</font>
---------------------------------------
                   　　<a href="event:talk_hfziwei">上一页</a>  <a href="event:talk_100">返回主页</a>
]]);
end

function onTalksj2hfzw(npc,player) cbsjxtgg(npc,player,240001,"星尘",300,"紫薇(1级)","紫薇(2级)",240002,7) end
function onTalksj3hfzw(npc,player) cbsjxtgg(npc,player,240002,"星尘",538,"紫薇(2级)","紫薇(3级)",240003,7) end
function onTalksj4hfzw(npc,player) cbsjxtgg(npc,player,240003,"星尘",965,"紫薇(3级)","紫薇(4级)",240004,7) end
function onTalksj5hfzw(npc,player) cbsjxtgg(npc,player,240004,"星尘",1732,"紫薇(4级)","紫薇(5级)",240005,7) end
function onTalksj6hfzw(npc,player) cbsjxtgg(npc,player,240005,"星尘",3108,"紫薇(5级)","紫薇(6级)",240006,7) end
function onTalksj7hfzw(npc,player) cbsjxtgg(npc,player,240006,"星尘",5578,"紫薇(6级)","紫薇(7级)",240007,8) end
function onTalksj8hfzw(npc,player) cbsjxtgg(npc,player,240007,"星尘",10012,"紫薇(7级)","紫薇(8级)",240008,8) end
function onTalksj9hfzw(npc,player) cbsjxtgg(npc,player,240008,"星尘",17971,"紫薇(8级)","紫薇(9级)",240009,8) end
function onTalksj10hfzw(npc,player) cbsjxtgg(npc,player,240009,"星尘",32257,"紫薇(9级)","紫薇(10级)",240010,8) end
function onTalksj11hfzw(npc,player) cbsjxtgg(npc,player,240010,"星尘",57901,"紫薇(10级)","紫薇(11级)",240011,8) end
function onTalksj12hfzw(npc,player) cbsjxtgg(npc,player,240011,"星尘",103932,"紫薇(11级)","紫薇(12级)",240012,8) end

-------------------------------------------------
function cbsjxtgg(npc,player,a,b,num,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if util.ppn(player,const.PP_PERSONAL_XINGCHEN) >= num then
					if player:num_item(c,1) >= 1 then
						player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)-num);
						player:remove_item(c,1);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						if (a >= 210005 and a <= 210099) or (a >= 220005 and a <= 220099) then
							server.info(10000,1,"["..player:get_name().."]在凌霄城护符大师处成功将护符升级为["..d.."]");
							server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在凌霄城护符大师处成功将护符升级为[<font color='#ff0000'>"..d.."</font>]");
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
		if f==1 then onTalkhfqisha(npc,player); end
		if f==2 then onTalkhfqisha2(npc,player); end
		if f==3 then onTalkhfpojun(npc,player); end
		if f==4 then onTalkhfpojun2(npc,player); end
		if f==5 then onTalkhftanlang(npc,player); end
		if f==6 then onTalkhftanlang2(npc,player); end
		if f==7 then onTalkhfziwei(npc,player); end
		if f==8 then onTalkhfziwei2(npc,player); end
	end
end


function onTalkdhxingshii(npc,player)
	if player:num_item("星石",1) >= 1 then
		player:remove_item("星石",1);
		local i = math.random(1,1000);
		local jf = 500;
		if activity.isXingshiShengdian() then
			if i >= 1 and i <= 20 then
				jf = 5000;
			end
			if i >= 21 and i <= 120 then
				jf = 2500;
			end
			if i >= 121 and i <= 340 then
				jf = 1000;
			end
			if i >= 341 and i <= 1000 then
				jf = 500;
			end
		else
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
		end
		player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+jf);
		player:alert(11,1,"星尘数量增加:"..jf);
		player:alert(11,0,"当前星尘数量:"..util.ppn(player,const.PP_PERSONAL_XINGCHEN));
		onTalk100(npc,player)
	else
		player:alert(1,1,"您没有[星石]无法兑换星尘哦!<br>");
		onTalk100(npc,player)
	end
end

