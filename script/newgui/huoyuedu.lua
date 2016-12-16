module(..., package.seeall)
local ACTIONSET_NAME="huoyue";
local PANEL_ACTIONSET_NAME="panelhuoyue";

local HYD_data={
	[1]={need=75,  LQflag=const.PP_HUOYUEDU_LQ_FLAG1, huihuaID="270001", ID="270002", Bgold=200000, Bcoin=0,  bag=2, award={{"双倍宝典",1,1},{"疗伤药(包)",3,1}}},
	[2]={need=100, LQflag=const.PP_HUOYUEDU_LQ_FLAG2, huihuaID="270004", ID="270005", Bgold=300000, Bcoin=200,bag=1, award={{"四倍宝典",1,1}}},
	[3]={need=150, LQflag=const.PP_HUOYUEDU_LQ_FLAG3, huihuaID="270007", ID="270008", Bgold=500000, Bcoin=300,bag=2, award={{"紫金镖令",1,1},{"聚灵珠",1,1}}},
	[4]={need=225, LQflag=const.PP_HUOYUEDU_LQ_FLAG4, huihuaID="270010", ID="270011", Bgold=1000000,Bcoin=500,bag=2, award={{"八倍宝典",1,1},{"聚灵珠",1,1}}},
};
local limit_data={5,5,5,2,2,2,1,5,2,2,2,2,1};

function huoyuedu_click( player,actionset,panelid,actionid )
	for i=1,4 do
		if actionid== "btnHY"..i then
			HYDaward(player,i);
		end
	end
end
ckpanel.add_listener(ACTIONSET_NAME,huoyuedu_click);

function HYDaward(player,num)
	local data=HYD_data[num];
	local Awarddata=HYD_data[num].award;
	local jifen=util.ppn(player,const.PP_HUOYUEDU_JIFEN);

	if jifen>=data.need then
		if util.ppn(player,data.LQflag)==0 then
			if player:num_bag_black() >= data.bag then
				player:set_param(data.LQflag,1);
				player:add_gamemoney_bind(data.Bgold);
				player:add_vcoin_bind(data.Bcoin);

				for i=1,#Awarddata do
					player:add_item(Awarddata[i][1],Awarddata[i][2],Awarddata[i][3]);
				end

				if num== 1 then 
					player:alert(11,1,"恭喜您成功领取【活跃度*75】奖励: <br>绑定金币       数量:200000; <br>双倍宝典       数量:1; <br>疗伤药(包)       数量:3");
				end
				if num== 2 then 
					player:alert(11,1,"恭喜您成功领取【活跃度*100】奖励: <br>绑定金币       数量:300000; <br>绑定元宝       数量:200; <br>四倍宝典       数量:1");
				end
				if num== 3 then 
					player:alert(11,1,"恭喜您成功领取【活跃度*150】奖励: <br>绑定金币       数量:500000; <br>绑定元宝       数量:300; <br>紫金镖令       数量:1<br>聚灵珠       数量:1");
				end
				if num== 4 then 
					player:alert(11,1,"恭喜您成功领取【活跃度*225】奖励: <br>绑定金币       数量:1000000; <br>绑定元宝       数量:500; <br>八倍宝典       数量:1<br>聚灵珠       数量:1");
				end
			else
				player:alert(1,1,"您的背包不足"..data.bag.."格，请清理后再来领取!");
			end
		else
			player:alert(1,1,"您已经领取过该活跃度奖励，今天无法再次领取噢!");
		end
	else
		player:alert(1,1,"您的活跃度不足，请再接再厉噢!");
	end
	fresh_huoyuedu_btn(player);
	player:push_ckpanel_data("huoyue","panelhuoyue");	
	JudgeRuKou(player);
end

function JudgeRuKou(player)
	if player:get_level() >= 55 then
		if util.ppn(player,const.PP_HUOYUEDU_LQ_FLAG1)==1 and  util.ppn(player,const.PP_HUOYUEDU_LQ_FLAG2)==1 and  util.ppn(player,const.PP_HUOYUEDU_LQ_FLAG3)==1 and  util.ppn(player,const.PP_HUOYUEDU_LQ_FLAG4)==1 then
			player:set_panel_data("panelminimapfun","btnHuoYue","visible","false");
		else
			player:set_panel_data("panelminimapfun","btnHuoYue","visible","true");
		end
	else
		player:set_panel_data("panelminimapfun","btnHuoYue","visible","false");
	end
	player:set_panel_data("panelminimapfun","btnHBox","visible","true");
	player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
end

function fresh_huoyuedu(player) 
	fresh_huoyuedu_btn(player);
	fresh_huoyuedu_num(player);
	local jifen=util.ppn(player,const.PP_HUOYUEDU_JIFEN);

	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtHYDjifen","text",jifen);
end

function fresh_huoyuedu_btn(player)
	local bgidHui=0;
	local bgid=0;
	local con=const.PP_HUOYUEDU_LQ_FLAG1-1;
	local jifen=util.ppn(player,const.PP_HUOYUEDU_JIFEN);
	for i=1,4 do
		local data=HYD_data[i];
		if util.ppn(player,data.LQflag)==1 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnHY"..i,"mouseEnabled","true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnHY"..i,"picid",data.huihuaID);
		else
			if jifen>=data.need then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnHY"..i,"mouseEnabled","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnHY"..i,"picid",data.ID);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnHY"..i,"mouseEnabled","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnHY"..i,"picid",data.huihuaID);
			end
		end
	end
end

function fresh_huoyuedu_num(player)
	local con=const.PP_HUOYUEDU_NUM1-1;
	if util.ppn(player,const.PP_HUOYUEDU_NUM5)==0 then
		if util.ppn(player,const.PP_JIEBIAO)>=2 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			player:set_param(const.PP_HUOYUEDU_NUM5,1);
		end
	end
	for i=1,13 do
		if i==5 then
			if util.ppn(player,const.PP_JIEBIAO)<limit_data[i] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtHY"..i,"text",util.ppn(player,const.PP_JIEBIAO).."/"..limit_data[i]);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtHY"..i,"text",limit_data[i].."/"..limit_data[i]);
			end
		else
			if util.ppn(player,con+i)<limit_data[i] then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtHY"..i,"text",util.ppn(player,con+i).."/"..limit_data[i]);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtHY"..i,"text",limit_data[i].."/"..limit_data[i]);
			end
		end
	end
end

function JudgeKingWar(player)
	local h = os.date("%H%M",os.time());
	if server.get_king_guild() == player:get_guild() and tonumber(h) >= 2130 then
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM13,util.ppn(player,const.PP_HUOYUEDU_NUM13)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM13)==1 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+50);
		end
	end
end