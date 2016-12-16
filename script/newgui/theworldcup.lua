module(..., package.seeall)

local WORLDCUPSHOP_NAME="worldcupshop";
local PANEL_WORLDCUPSHOP="panelworldcupshop";

local worldcup_shop_items={
	[1]={name="转生石",		 price=5   },
	[2]={name="女娲神石",	 	 price=58  },
	[3]={name="中级融合符",	 	 price=24 },
	[4]={name="超级融合符",		 price=160  },
	[5]={name="八级攻击玄晶",		 price=390 },	
	[6]={name="八级物防玄晶",		 price=390 },	
	[7]={name="八级魔防玄晶",		 price=390 },
	[8]={name="八级生命玄晶",		 price=390 },
};
function process_worldcupshop_logic(player,actionset,panelid,actionid)
	for i=1,8 do		
		if(actionid== "btnworldcupshop"..i)then
			if(player:num_bag_black()>=1)then				
				if(player:num_item("世界杯勋章")>=worldcup_shop_items[i].price)then
					player:set_param(const.PP_WCUP_XUNZHANG,util.ppn(player,const.PP_WCUP_XUNZHANG) + worldcup_shop_items[i].price);
					player:remove_item("世界杯勋章",worldcup_shop_items[i].price);
					if i >=5 and i <=8 then
						player:add_item(worldcup_shop_items[i].name,1);
					else
						player:add_item(worldcup_shop_items[i].name,1,1);	
					end
					player:alert(1,1,"获得物品:[<b><font color='#00ff00'>"..worldcup_shop_items[i].name.."</font></b>]");					
				else
					player:alert(1,1,"世界杯勋章不足！");
				end				
			else
				player:alert(1,1,"您的背包不足一格 请先行整理");
			end
			setXunzhangshu(player);
			break;
		end
	end
end
ckpanel.add_listener(WORLDCUPSHOP_NAME,process_worldcupshop_logic);
function setXunzhangshu(player)
	player:set_panel_data(PANEL_WORLDCUPSHOP,"sjbxzs","text",player:num_item("世界杯勋章"));
	player:push_ckpanel_data(WORLDCUPSHOP_NAME,PANEL_WORLDCUPSHOP)
end
-------------------------------------------------------------------------------------------
local ACTIONSET_NAME="worldcup";
local PANEL_ACTIONSET_NAME="panelworldcup";
--local tjs = 0;
local wcup={
	[1]={name="A1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_A1},
	[2]={name="A2",ratio=1.10,iswin=true,pcon=const.PP_WCUP_A2},
	[3]={name="A3",ratio=1.15,iswin=false,pcon=const.PP_WCUP_A3},
	[4]={name="A4",ratio=1.20,iswin=false,pcon=const.PP_WCUP_A4},
	[5]={name="B1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_B1},
	[6]={name="B2",ratio=1.10,iswin=true,pcon=const.PP_WCUP_B2},
	[7]={name="B3",ratio=1.15,iswin=false,pcon=const.PP_WCUP_B3},
	[8]={name="B4",ratio=1.20,iswin=false,pcon=const.PP_WCUP_B4},
	[9]={name="C1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_C1},
	[10]={name="C2",ratio=1.10,iswin=false,pcon=const.PP_WCUP_C2},
	[11]={name="C3",ratio=1.15,iswin=false,pcon=const.PP_WCUP_C3},
	[12]={name="C4",ratio=1.20,iswin=true,pcon=const.PP_WCUP_C4},
	[13]={name="D1",ratio=1.05,iswin=false,pcon=const.PP_WCUP_D1},
	[14]={name="D2",ratio=1.10,iswin=true,pcon=const.PP_WCUP_D2},
	[15]={name="D3",ratio=1.15,iswin=true,pcon=const.PP_WCUP_D3},
	[16]={name="D4",ratio=1.20,iswin=false,pcon=const.PP_WCUP_D4},
	[17]={name="E1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_E1},
	[18]={name="E2",ratio=1.10,iswin=true,pcon=const.PP_WCUP_E2},
	[19]={name="E3",ratio=1.15,iswin=false,pcon=const.PP_WCUP_E3},
	[20]={name="E4",ratio=1.20,iswin=false,pcon=const.PP_WCUP_E4},
	[21]={name="F1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_F1},
	[22]={name="F2",ratio=1.10,iswin=true,pcon=const.PP_WCUP_F2},
	[23]={name="F3",ratio=1.15,iswin=false,pcon=const.PP_WCUP_F3},
	[24]={name="F4",ratio=1.20,iswin=false,pcon=const.PP_WCUP_F4},
	[25]={name="G1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_G1},
	[26]={name="G2",ratio=1.10,iswin=false,pcon=const.PP_WCUP_G2},
	[27]={name="G3",ratio=1.15,iswin=true,pcon=const.PP_WCUP_G3},
	[28]={name="G4",ratio=1.20,iswin=false,pcon=const.PP_WCUP_G4},
	[29]={name="H1",ratio=1.05,iswin=true,pcon=const.PP_WCUP_H1},
	[30]={name="H2",ratio=1.10,iswin=false,pcon=const.PP_WCUP_H2},
	[31]={name="H3",ratio=1.15,iswin=false,pcon=const.PP_WCUP_H3},
	[32]={name="H4",ratio=1.20,iswin=true,pcon=const.PP_WCUP_H4},
}

function process_worldcup_logic(player,actionset,panelid,actionid)
	if string.sub(actionid,1,7) == "btngmxz" then 
		Gmxz(player);
		return;
	end
	if string.sub(actionid,1,6) == "lqzcjl" then 
		Zcjl(player);
		return;
	end
	if string.sub(actionid,1,7) == "lqphjl" then 
		Phjl(player);
		return;
	end
	local number = 0;
	if string.sub(actionid,1,6) == "zhichi" then
		if string.len(actionid) == 7 then
			number = tonumber(string.sub(actionid,7));
		end
		if string.len(actionid) == 8 then
			number = tonumber(string.sub(actionid,7,8));
		end
		BetBegin(player,number);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_worldcup_logic);

function isLqzcjlsj()
	if ymd() >= 20140628  or server.get_temp_var("zcjl") == "1" then
		return true;
	end
	return false;
end

function isLqphjlsj()
	if ymd() >= 20140629 or server.get_temp_var("phjl") == "1" then
		return true;
	end
	return false;
end

function Gmxz(player)
	if player:get_vcoin() >= 1000 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin(1000,"WorldCup");
			player:add_item("世界杯勋章",10,1);
			player:alert(1,1,"恭喜您成功购买10个世界杯勋章!");
			refresh_worldcup_panel(player);
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法购买!");
		end
	else
		player:alert(1,1,"对不起,您的元宝不足[1000],无法购买!");
	end
end

function Zcjl(player)
	if isLqzcjlsj() then
		local m = 0;
		local n = 0;
		for i = 1,32 do
			n = util.ppn(player,wcup[i].pcon);
			if wcup[i].iswin then			
				m = m + math.floor(wcup[i].ratio * n);
			else
				m = m + n;
			end
		end
		if m == 0 then
			player:alert(1,1,"您现在没有要返还的勋章!");
			return;
		end
		if player:num_bag_black() >= 1 then
			for i = 1,32 do
				player:set_param(wcup[i].pcon,0);
			end
			player:add_item("世界杯勋章",m,1);
			player:alert(1,1,"恭喜您成功领取支持奖励!");
			refresh_worldcup_panel(player);
		else
			player:alert(1,1,"对不起,您的背包空格不足1格,无法领取!");
		end
	else
		player:alert(1,1,"对不起,不在活动时间内!");
	end
end

local xjdata = {"九级攻击玄晶","八级攻击玄晶","七级攻击玄晶","七级生命玄晶","六级攻击玄晶"};
function Phjl(player)
	if isLqphjlsj() then
		for i = 1,10 do
			if player:get_name() == server.get_var("SvrWCupName"..i) then
				if util.svn("SvrWCupGot"..i) == 0 then
					server.set_var("SvrWCupGot"..i,1);
					if i >= 1 and i <= 3 then
						player:add_item(xjdata[i],1);
						player:alert(11,1,"恭喜您成功领取排行奖励!");
					else
						if i >= 4 and i <=10 then
							player:add_item(xjdata[4],1);
							player:alert(11,1,"恭喜您成功领取排行奖励!");
						end
					end
				else
					player:alert(11,1,"对不起,您已经领取过该奖励了!");
				end
				return;
			end
		end
		if util.ppn(player,const.PP_WCUP_CANYU) >= 300 then
			if util.ppn(player,const.PP_WCUP_CANYUJIANGLI)~=0 then
				player:set_param(const.PP_WCUP_CANYUJIANGLI,1);
				player:add_item(xjdata[5],1);
				player:alert(11,1,"恭喜您成功领取排行参与奖!");
			else
				player:alert(11,1,"您已经领取过该奖励了!");
			end
		else
			player:alert(11,1,"您不符合领取参与奖励条件!");
		end
	else
		player:alert(1,1,"对不起,不在活动时间内!");
	end
end

function BetBegin(player,n)
	if activity.isWorldCupOpen() then
		local num = player:num_item("世界杯勋章",1);
		if  num >= 10 then
			player:set_param(wcup[n].pcon,util.ppn(player,wcup[n].pcon)+10);	
			player:remove_item("世界杯勋章",10);
			player:alert(1,1,"恭喜您支持成功!");
			refresh_worldcup_panel(player);
		else
			player:alert(1,1,"对不起,你当前背包中世界杯勋章的数量不足10个!");
		end
	else
		player:alert(1,1,"对不起,不在活动时间内!");
	end
end

function refresh_worldcup_panel(player)
	local n = allxznum(player);
	xznum_Recharge_process(player,n);
	
	if isLqphjlsj() then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"ljyysl","text",n.."(截止统计)");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"ljyysl","text",n);
	end 
	for i = 1,51 do
		if player:get_name() == server.get_var("SvrWCupName"..i) then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"dqpm","text","第"..i.."名");
			break;
		else
			if n < 300 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"dqpm","text","需300勋章");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"dqpm","text","50名之后");
			end
		end
	end
	if server.get_var("SvrWCupName1") ~= "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"wanjia1","text",server.get_var("SvrWCupName1"));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"shuliang1","text",server.get_var("SvrWCupNum1"));
	end
	if server.get_var("SvrWCupName2") ~= "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"wanjia2","text",server.get_var("SvrWCupName2"));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"shuliang2","text",server.get_var("SvrWCupNum2"));
	end
	if server.get_var("SvrWCupName3") ~= "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"wanjia3","text",server.get_var("SvrWCupName3"));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"shuliang3","text",server.get_var("SvrWCupNum3"));
	end 
	for i = 1,32 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"zhichishu"..i,"text",util.ppn(player,wcup[i].pcon));
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	setXunzhangshu(player);
	setChuxian(player);
end

function allxznum(player)
	if isLqphjlsj() then
		return util.ppn(player,const.PP_WCUP_CANYU);
	end 
	local n1 = player:num_item("世界杯勋章",1);
	local n2 = player:num_item("世界杯勋章",100);
	local n3 = util.ppn(player,const.PP_WCUP_XUNZHANG);
	local n4 = 0 ;
	for i = 1,32 do
		n4 = n4 + util.ppn(player,wcup[i].pcon);
	end
	if  server.get_temp_var("sxbd") == "" then 
		--if ymd() <= 20140628  then
		player:set_param(const.PP_WCUP_CANYU,n1 + n2 + n3 + n4);
		--end
	end
	return n1 + n2 + n3 + n4;
end

function xznum_Recharge_process(player,num)
	if  server.get_temp_var("sxbd") == "" then 
		if not isLqphjlsj() then
			if num >= 300 then
				local a = player:get_name();
				for i = 1,51 do
					if a == server.get_var("SvrWCupName"..i) then
						if num > tonumber(server.get_var("SvrWCupNum"..i)) then
							server.set_var("SvrWCupName"..i,a)
							server.set_var("SvrWCupNum"..i,num);
							server.set_var("SvrWCupTime"..i,os.time());
							--print(os.time());
							--xznum_Recharge_chuli();
							xznum_Recharge_chuli();
						end
						return;
					end
				end
				if num > util.svn("SvrWCupNum51") then
					server.set_var("SvrWCupName51",a);
					server.set_var("SvrWCupNum51",num);
					server.set_var("SvrWCupTime51",os.time());
					--xznum_Recharge_chuli();
					xznum_Recharge_chuli();
				end
			end
		end
	end
end

function xznum_Recharge_chuli()
	local xjlvdata = {};
	for u = 1,51 do
		table.insert(xjlvdata,{
			name = server.get_var("SvrWCupName"..u),
			num = util.svn("SvrWCupNum"..u),
			time = util.svn("SvrWCupTime"..u);
		})
	end
	function lvCompare(q,w) 
		if q and w then
			if tonumber(w.num) == tonumber(q.num) then
				return tonumber(w.time) > tonumber(q.time);
			else
				return tonumber(w.num) < tonumber(q.num);
			end
		end
		return false;
	end
	table.sort(xjlvdata,lvCompare);
	for idx,value in ipairs(xjlvdata) do
		server.set_var("SvrWCupName"..idx,value.name);
		server.set_var("SvrWCupNum"..idx,value.num);
		server.set_var("SvrWCupTime"..idx,value.time);
	end
end

ckitem.add_listener("世界杯勋章",refresh_worldcup_panel);

function ChangeIswin(player,n)
	wcup[n].iswin =  not wcup[n].iswin;
	player:set_panel_data(PANEL_ACTIONSET_NAME,"chuxian"..n,"visible",tostring(wcup[n].iswin));
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME)
end
function setChuxian(player)
	for i=1,32 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"chuxian"..i,"visible",tostring(wcup[i].iswin));
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME)
end