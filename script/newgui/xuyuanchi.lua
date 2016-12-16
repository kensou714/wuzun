module(..., package.seeall)
local ACTIONSET_NAME="xuyuanchi";
local PANEL_ACTIONSET_NAME="panelxuyuanchi";

--神器积分 为节点出的物品
--frist 当出现物品的数量超过frist的时候 则才出该物品
--cooldown 该物品抽奖出现之后 必须再出cooldown个其他物品之后 才能再次出现该物品

--jl = math.random(1,5000);
local xuyuanchi_jiedian_list={
	[1]={name="女娲神石",num=1},
	[2]={name="女娲神石",num=2},
	[3]={name="女娲神石",num=3},
	[4]={name="女娲神石",num=4}
}

local xuyuanchi_item_list={
	[0]={name="女娲神石",	        icon=10296, logid=const.PPC_XUYUANCHI_jifen, 		        start=0,   end1=0,     	 id=0,  num=2,	total=1,    cooldown=0,   frist=0,    notice=1},
	[1]={name="十级宝石",		    icon=10144, logid=const.PPC_XUYUANCHI_10baoshi,  		    start=1,   end1=1,   	 id=1,  num=1,	total=1,    cooldown=0,   frist=1600, notice=1},
	[2]={name="八级攻击玄晶",	    icon=10231, logid=const.PPC_XUYUANCHI_8gongji,			    start=2,   end1=3,   	 id=2,  num=1,	total=2,    cooldown=600, frist=600,  notice=1},
	[3]={name="八级物防玄晶",		icon=10243, logid=const.PPC_XUYUANCHI_8wufang,			    start=4,   end1=5,   	 id=3,  num=1,	total=2,    cooldown=600, frist=600,  notice=1},
	[4]={name="八级魔防玄晶",		icon=10255, logid=const.PPC_XUYUANCHI_8mofang,   		    start=6,   end1=7,	     id=4,  num=1,	total=2,    cooldown=600, frist=600,  notice=1},
	[5]={name="八级生命玄晶",   	icon=10267, logid=const.PPC_XUYUANCHI_8shengming, 		    start=8,   end1=9,	     id=5,  num=1,	total=2,    cooldown=600, frist=600,  notice=1},	
	[6]={name="超级资质丹",		    icon=10306, logid=const.PPC_XUYUANCHI_chaojizizhidan,		start=10,  end1=14,	     id=6,  num=1,	total=5,    cooldown=200, frist=0,    notice=1},	
	[7]={name="六级攻击玄晶",		icon=10229, logid=const.PPC_XUYUANCHI_6gongji,   		    start=15,  end1=19,	     id=7,  num=1,	total=5,    cooldown=200, frist=0,    notice=1},
	[8]={name="六级生命玄晶",		icon=10265, logid=const.PPC_XUYUANCHI_6shengming,		    start=20,  end1=26,	     id=8,  num=1,	total=7,    cooldown=100, frist=0,    notice=1},
	[9]={name="六级物防玄晶",		icon=10241, logid=const.PPC_XUYUANCHI_6wufang,			    start=27,  end1=33,	     id=9,  num=1,	total=7,    cooldown=100, frist=0,    notice=1},
	[10]={name="六级魔防玄晶",		icon=10253, logid=const.PPC_XUYUANCHI_6mofang,  		    start=34,  end1=40,	     id=10, num=1,	total=7,    cooldown=100, frist=0,    notice=1},
	[11]={name="真气丹(10000)",	    icon=15096, logid=const.PPC_XUYUANCHI_zhenqidan10000,		start=41,  end1=50,	     id=11, num=1,	total=10,   cooldown=50,  frist=0,    notice=1},
	[12]={name="灵气珠(10000)",	    icon=15108, logid=const.PPC_XUYUANCHI_lingqizhu10000,		start=51,  end1=60,	     id=12, num=1,	total=10,   cooldown=50,  frist=0,    notice=1},
	[13]={name="兽灵精华(10000)",	icon=15114, logid=const.PPC_XUYUANCHI_shoulingjinghua10000,	start=61,  end1=70, 	 id=13, num=1,	total=10,   cooldown=50,  frist=0,    notice=0},
	[14]={name="超级坐骑丹",		icon=15038, logid=const.PPC_XUYUANCHI_chaojizuoqidan,		start=71,  end1=280,	 id=14, num=1,	total=210,  cooldown=0,   frist=0,    notice=0},
	[15]={name="超级真气丹",		icon=15097, logid=const.PPC_XUYUANCHI_chaojizhengqidan,     start=281, end1=490,	 id=15, num=1,	total=210,  cooldown=0,   frist=0,    notice=0},
	[16]={name="超级进阶石包",      icon=15058, logid=const.PPC_XUYUANCHI_chaojijinjieshibao,	start=491, end1=700,	 id=16, num=1,	total=210,  cooldown=0,   frist=0,    notice=0},
	[17]={name="守护资质丹",	    icon=10305, logid=const.PPC_XUYUANCHI_shouhuzizhidan,   	start=701, end1=1000,	 id=17, num=1,	total=300,  cooldown=0,   frist=0,    notice=0},	
	[18]={name="守护进化丹",	 	icon=10303, logid=const.PPC_XUYUANCHI_shouhujinhuadan,	    start=1001,end1=1300,	 id=18, num=1,	total=300,  cooldown=0,   frist=0,    notice=0},
	[19]={name="经验珠(500万)",	  	icon=15011, logid=const.PPC_XUYUANCHI_jingyanzhu500,        start=1301,end1=1600,	 id=19, num=1,	total=300,  cooldown=0,   frist=0,    notice=0},	
	[20]={name="经验珠(200万)",	    icon=15011, logid=const.PPC_XUYUANCHI_jingyanzhu200,        start=1601,end1=2000,	 id=20, num=1,	total=400,  cooldown=0,   frist=0,    notice=0},

}
-- 随机给一个物品
function random_item( player )
	local itemid=get_item_id(math.random(1,2000));
	give_item(player,itemid);
end
function give_item( player,id )
	get_item_num();
	local tempNow=tonumber(server.get_var("xuyuanchi_item_remainder_"..id));
	local total=xuyuanchi_item_list[id].total;
	local cooldown=xuyuanchi_item_list[id].cooldown;
	local frist=xuyuanchi_item_list[id].frist;
	local name = xuyuanchi_item_list[id].name;
	-- player:alert(11,1,"抽取到:"..xuyuanchi_item_list[id].name.."<br>该物品:<br>剩余:"..server.get_var("xuyuanchi_item_remainder_"..id).."<br>"..
	-- 	"CD:"..server.get_var("xuyuanchi_item_cd_"..id).."/"..cooldown.."<br>"..
	-- 	"该物品首次出现:"..frist.."<br>"..
	-- 	"当前物品产出数量:"..server.get_var("xuyuanchi_item_now")
	-- 	);
	if(tempNow>0 
		and tonumber(server.get_var("xuyuanchi_item_cd_"..id))<=0 
		and tonumber(server.get_var("xuyuanchi_item_now"))>=frist
		and tonumber(server.get_var("xuyuanchi_item_remainder_"..id))>0
		) then
		--server.set_var("xuyuanchi_"..id,xuyuanchi_item_list[id].total-1);
		--xuyuanchi_item_list[id].num=xuyuanchi_item_list[id].num-1;
		player:add_item(xuyuanchi_item_list[id].name,xuyuanchi_item_list[id].num);
		if(xuyuanchi_item_list[id].notice>0)then
			player:alert(1,1,"恭喜您从许愿池中获取物品 ["..xuyuanchi_item_list[id].name.."]");
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]在许愿池获得:<font color='#ff0000'>"..xuyuanchi_item_list[id].name.."</font>[<a href='event:push_local_xuyuan'><u><font color='#00FF00'>我要许愿</font></u></a>]");
			server.info(10000,0,"勇士["..player:get_name().."]在许愿池获得物品:"..xuyuanchi_item_list[id].name);
		else
			player:alert(1,1,"恭喜您从许愿池中获取物品 ["..xuyuanchi_item_list[id].name.."]");
		end
		server.set_var("xuyuanchi_item_remainder_"..id,tonumber(server.get_var("xuyuanchi_item_remainder_"..id))-1);
		server.set_var("xuyuanchi_item_now",tonumber(server.get_var("xuyuanchi_item_now"))+1);
		server.log_count(3,xuyuanchi_item_list[id].logid,1);
		-- 如果物品有冷却时间 则刷新冷却时间
		if(xuyuanchi_item_list[id].cooldown>0)then
			if(tonumber(server.get_var("xuyuanchi_item_cd_"..id))==0)then
				server.set_var("xuyuanchi_item_cd_"..id,xuyuanchi_item_list[id].cooldown)
			end
		end
		fresh_cd();
		send_gift(player);
		fresh_panel(player,xuyuanchi_item_list[id].icon,-1);
		newgui.xuyuanshop.fresh_xuyuanshop_panel(player);
	else
		must_give(player,20);
	end
end
function must_give(player,id)
	for i=id,1,-1 do
		if(tonumber(server.get_var("xuyuanchi_item_remainder_"..i))>0)then
			server.set_var("xuyuanchi_"..i,xuyuanchi_item_list[i].total-1);
			server.set_var("xuyuanchi_item_now",tonumber(server.get_var("xuyuanchi_item_now"))+1);
			server.set_var("xuyuanchi_item_remainder_"..i,tonumber(server.get_var("xuyuanchi_item_remainder_"..i))-1);
			player:add_item(xuyuanchi_item_list[i].name,xuyuanchi_item_list[id].num);
			if(xuyuanchi_item_list[i].notice>0)then
				player:alert(1,1,"恭喜您从许愿池中获取物品 ["..xuyuanchi_item_list[i].name.."]");
				server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]在许愿池获得:<font color='#ff0000'>"..xuyuanchi_item_list[i].name.."</font>[<a href='event:push_local_xuyuan'><u><font color='#00FF00'>我要许愿</font></u></a>]");
				server.info(10000,0,"勇士["..player:get_name().."]在许愿池获得物品:"..xuyuanchi_item_list[i].name);
			else
				player:alert(1,1,"恭喜您从许愿池中获取物品 ["..xuyuanchi_item_list[i].name.."]");
			end
			server.log_count(3,xuyuanchi_item_list[id].logid,1);
			fresh_cd();
			send_gift(player);
			fresh_panel(player,xuyuanchi_item_list[i].icon,-1);
			newgui.xuyuanshop.fresh_xuyuanshop_panel(player);
			break;
		end
	end
end
function get_item_id( id )
	for i=1,20 do
		if(id>=xuyuanchi_item_list[i].start and id<=xuyuanchi_item_list[i].end1)then
			return xuyuanchi_item_list[i].id;
		end
	end
end
function fresh_cd()
	for i=5,10 do
		if(tonumber(server.get_var("xuyuanchi_item_cd_"..i))>0)then
			server.set_var("xuyuanchi_item_cd_"..i,tonumber(server.get_var("xuyuanchi_item_cd_"..i))-1);
		end
	end
end
function fresh_panel( player,id,visible)
	if(tonumber(id)>0)then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xuyuanchi","actiontype","icon_"..id);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xuyuanchi","actiontype","icon_"..-1);
	end
	if(visible>0)then
		player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
	end

	player:set_panel_data(PANEL_ACTIONSET_NAME,"xuyuanchi","action","progress_"..server.get_var("xuyuanchi_item_total").."_"..server.get_var("xuyuanchi_item_now"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtitemtotal","text",tonumber(server.get_var("xuyuanchi_item_total"))-tonumber(server.get_var("xuyuanchi_item_now")).."/".. server.get_var("xuyuanchi_item_total"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyb","text",player:num_item("许愿金币"));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyjf","text",util.ppn(player,const.PP_JF_XUYUANCHI));
	for i=1,20 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txt"..i,"text",server.get_var("xuyuanchi_item_remainder_"..i));
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function send_gift(player)
	local now=tonumber(server.get_var("xuyuanchi_item_now"));
	local total=tonumber(server.get_var("xuyuanchi_item_total"));
	local tep =total/4;
	local send=now/tep;
	if(send==1 or send == 2 or send==3 or send==4)then
		player:add_item(xuyuanchi_jiedian_list[send].name,xuyuanchi_jiedian_list[send].num);
		player:alert(1,1,"恭喜玩家["..player:get_name().."]获取到了许愿池节点奖励");
		server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]在许愿池获得:<font color='#ff0000'>"..xuyuanchi_jiedian_list[send].name.."</font>[<a href='event:push_local_xuyuan'><u><font color='#00FF00'>我要许愿</font></u></a>]");
		server.info(10000,0,"勇士["..player:get_name().."]在许愿池获得节点奖励:"..xuyuanchi_jiedian_list[send].name);
	end
end
function give_jf( player )
	player:set_param(util.ppn(player,const.PP_JF_XUYUANCHI),tonumber(const.PP_JF_XUYUANCHI)+1);
end
function reset_xuyuanchi()
	server.set_var("xuyuanchi_item_total",2000);
	server.set_var("xuyuanchi_item_now",0);
	server.set_var("xuyuanchi_item_cd_1",0);
	server.set_var("xuyuanchi_item_cd_2",0);
	server.set_var("xuyuanchi_item_cd_3",0);
	server.set_var("xuyuanchi_item_cd_4",0);
	server.set_var("xuyuanchi_item_cd_5",0);
	server.set_var("xuyuanchi_item_cd_6",0);
	server.set_var("xuyuanchi_item_cd_7",0);
	server.set_var("xuyuanchi_item_cd_8",0);
	server.set_var("xuyuanchi_item_cd_9",0);
	server.set_var("xuyuanchi_item_cd_10",0);
	server.set_var("xuyuanchi_item_cd_11",0);
	server.set_var("xuyuanchi_item_cd_12",0);
	server.set_var("xuyuanchi_item_cd_13",0);
	server.set_var("xuyuanchi_item_cd_14",0);
	server.set_var("xuyuanchi_item_cd_15",0);
	server.set_var("xuyuanchi_item_cd_16",0);
	server.set_var("xuyuanchi_item_cd_17",0);
	server.set_var("xuyuanchi_item_cd_18",0);
	server.set_var("xuyuanchi_item_cd_19",0);
	server.set_var("xuyuanchi_item_cd_20",0);

	server.set_var("xuyuanchi_item_remainder_0", 4);
	server.set_var("xuyuanchi_item_remainder_1", 1);
	server.set_var("xuyuanchi_item_remainder_2", 2);
	server.set_var("xuyuanchi_item_remainder_3", 2);
	server.set_var("xuyuanchi_item_remainder_4", 2);
	server.set_var("xuyuanchi_item_remainder_5", 2);
	server.set_var("xuyuanchi_item_remainder_6", 5);
	server.set_var("xuyuanchi_item_remainder_7", 5);
	server.set_var("xuyuanchi_item_remainder_8", 7);
	server.set_var("xuyuanchi_item_remainder_9", 7);
	server.set_var("xuyuanchi_item_remainder_10",7);
	server.set_var("xuyuanchi_item_remainder_11",10);
	server.set_var("xuyuanchi_item_remainder_12",10);
	server.set_var("xuyuanchi_item_remainder_13",10);
	server.set_var("xuyuanchi_item_remainder_14",210);
	server.set_var("xuyuanchi_item_remainder_15",210);
	server.set_var("xuyuanchi_item_remainder_16",210);
	server.set_var("xuyuanchi_item_remainder_17",300);
	server.set_var("xuyuanchi_item_remainder_18",300);
	server.set_var("xuyuanchi_item_remainder_19",300);
	server.set_var("xuyuanchi_item_remainder_20",400);
end
function get_item_num()
	local isempty = 1;
	for i=1,20 do
		if(tonumber(server.get_var("xuyuanchi_item_remainder_"..i))>0)then
			isempty=99;
		end
	end
	if(isempty == 1)then
		reset_xuyuanchi();
	end
end
function xuyuanchi_click(player,actionset,panelid,actionid)
	-- body
	if activity.isxuyuanchi() then
		if server.get_var("resetxuyuanchi") ~= "4" then
			reset_xuyuanchi();
			server.set_var("resetxuyuanchi","4");
			server.info(10010,0,"新一轮的许愿池活动已经开启，奖池超百万，试试手气吧！");
		end
		if(actionid=="btnXy")then
			player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
			if(tonumber(server.get_var("xuyuanchi_item_total"))-tonumber(server.get_var("xuyuanchi_item_now"))<=0)then
				player:alert(10000,1,"许愿池中的物品已经被获取完了，并且刚刚重置了");
				fresh_panel(player,0,-1);
				reset_xuyuanchi();
			else
				if(player:num_bag_black()>=2)then
					if(player:num_item("许愿金币")>0)then
						player:remove_item("许愿金币",1);
						player:set_param(const.PP_JF_XUYUANCHI,util.ppn(player,const.PP_JF_XUYUANCHI)+1);
						random_item(player);
					else
						player:alert(1,1,"您的许愿币不足，快前往商城购买吧 [<font color='#00ff00'>Y键打开商城</font>]");
					end
				else
					player:alert(1,1,"您的背包空格少于两格子 请先行整理");
				end
			end
		end
		if(actionid=="btnAutoXy")then
			if(tonumber(server.get_var("xuyuanchi_item_total"))-tonumber(server.get_var("xuyuanchi_item_now"))<=0)then
				player:alert(11,1,"许愿池中已经木有东西了。");
				return;
			end
			local flag = false;
			if(player:num_bag_black()>=1)then
				if(player:num_item("许愿金币")>0)then
					flag=true;
					player:set_timer(const.PT_XUYUANCHI,500);
				else
					player:alert(1,1,"您的许愿币不足，快前往商城购买吧 [<font color='#00ff00'>Y键打开商城</font>]");
				end
			else
				player:alert(1,1,"您的背包空格少于一个 请先行整理");
			end
			if flag then
				if util.ptpn(player,const.PTP_XUYUANXHI_XIANSHI)<=0 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnAutoXy","label","停止许愿");
					player:set_temp_param(const.PTP_XUYUANXHI_XIANSHI,1);
				else
					player:set_timer(const.PT_XUYUANCHI,0);
					player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnAutoXy","label","自动许愿");
					player:set_temp_param(const.PTP_XUYUANXHI_XIANSHI,0);
				end
			else
					player:set_timer(const.PT_XUYUANCHI,0);
					player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnAutoXy","label","自动许愿");
					player:set_temp_param(const.PTP_XUYUANXHI_XIANSHI,0);
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	else
		player:alert(1,1,"非活动时间，谢谢参与！");
	end
	if(actionid=="btnJfShop")then
		newgui.xuyuanshop.fresh_xuyuanshop_panel(player);
	end
	if(actionid=="btnExit")then
		player:set_timer(const.PT_XUYUANCHI,0);
		fresh_panel(player,0,-1);
		player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnAutoXy","label","自动许愿");
		player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	end
	if actionid == "btnxuyuanchi" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"xuyuanchi","action","progress_"..server.get_var("xuyuanchi_item_total").."_"..server.get_var("xuyuanchi_item_now"));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyb","text",player:num_item("许愿金币"));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtxyjf","text",util.ppn(player,const.PP_JF_XUYUANCHI));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtitemtotal","text",tonumber(server.get_var("xuyuanchi_item_total"))-tonumber(server.get_var("xuyuanchi_item_now")).."/".. server.get_var("xuyuanchi_item_total"));
		player:push_ckpanel_data("xuyuanchi","panelxuyuanchi");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,xuyuanchi_click);