module(..., package.seeall)

local ACTIONSET_NAME="duobao";
local PANEL_ACTIONSET_NAME="panelduobao";

local area={
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
};

local areaID={
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
};
local namea={
[15125]={ming="朱雀丹"},
[15116]={ming="小型玄晶宝箱"},
[15121]={ming="超级坐骑丹"},
[10177]={ming="经验珠(2000万)"},
[10077]={ming="紫金镖令"},
[15111]={ming="兽灵精华(500)"},
[15126]={ming="玄武丹"},
[15088]={ming="小型宝石宝箱"},
[15122]={ming="超级真气丹"},
[10264]={ming="五级生命玄晶"},
[10081]={ming="女儿红(20年)"},
[15105]={ming="灵气珠(500)"},
[15124]={ming="白虎丹"},
[15017]={ming="祈灵玉"},
[15120]={ming="超级进阶石包"},
[10228]={ming="五级攻击玄晶"},
[15112]={ming="兽灵精华(1000)"},
[10303]={ming="守护进化丹"},
[15127]={ming="混沌丹"},
[15050]={ming="镇魔令大包"},
[15135]={ming="超级守护经验丹"},
[10240]={ming="五级物防玄晶"},
[15106]={ming="灵气珠(1000)"},
[10140]={ming="六级宝石"},
[15128]={ming="饕餮丹"},
[10178]={ming="经验珠(5000万)"},
[15011]={ming="聚灵珠"},
[10252]={ming="五级魔防玄晶"},
[10217]={ming="转生石"},
[15007]={ming="四倍宝典"},
};

local award={
	[1]={
		[1]={name="朱雀丹",id="15125",num="1",},
		[2]={name="小型玄晶宝箱",id="15116",num="1",},
		[3]={name="超级坐骑丹",id="15121",num="1",},
		[4]={name="经验珠(2000万)",id="10177",num="1",},
		[5]={name="紫金镖令",id="10077",num="1",},
		[6]={name="兽灵精华(500)",id="15111",num="1",},
		[7]={name="三级灵羽",id="10182",num="1",},
		[8]={name="二级灵羽",id="10181",num="1",},
		[9]={name="一级灵羽",id="10180",num="1",},
		[10]={name="魂石令牌(500)",id="15044",num="1",},
		[11]={name="招财神符",id="15028",num="1",},
		[12]={name="一级攻击玄晶",id="10224",num="1",},
		[13]={name="二级攻击玄晶",id="10225",num="1",},
		[14]={name="守护进化丹",id="10303",num="1",},
		[15]={name="双倍宝典",id="15004",num="1",},
		[16]={name="三级攻击玄晶",id="10226",num="1",},
		[17]={name="疗伤药(包)",id="15013",num="1",},
		[18]={name="经验珠(100万)",id="10212",num="1",},
		[19]={name="经验珠(50万)",id="10211",num="1",},
		[20]={name="守护资质丹",id="10305",num="1",},
		},
	[2]={
		[1]={name="玄武丹",id="15126",num="1",},
		[2]={name="小型宝石宝箱",id="15088",num="1",},
		[3]={name="超级真气丹",id="15122",num="1",},
		[4]={name="五级生命玄晶",id="10264",num="1",},
		[5]={name="女儿红(20年)",id="10081",num="1",},
		[6]={name="灵气珠(500)",id="15105",num="1",},
		[7]={name="三级灵羽",id="10182",num="1",},
		[8]={name="二级灵羽",id="10181",num="1",},
		[9]={name="一级灵羽",id="10180",num="1",},
		[10]={name="修为令牌",id="15056",num="1",},
		[11]={name="开心富贵虎",id="15034",num="1",},
		[12]={name="一级生命玄晶",id="10260",num="1",},
		[13]={name="二级生命玄晶",id="10261",num="1",},
		[14]={name="经验珠(500万)",id="10207",num="1",},
		[15]={name="灵气珠(100)",id="15104",num="1",},
		[16]={name="三级生命玄晶",id="10262",num="1",},
		[17]={name="疗伤药(包)",id="15013",num="1",},
		[18]={name="经验珠(100万)",id="10212",num="1",},
		[19]={name="经验珠(50万)",id="10211",num="1",},
		[20]={name="守护资质丹",id="10305",num="1",},
		},
	[3]={
		[1]={name="白虎丹",id="15124",num="1",},
		[2]={name="祈灵玉",id="15017",num="1",},
		[3]={name="超级进阶石包",id="15120",num="1",},
		[4]={name="五级攻击玄晶",id="10228",num="1",},
		[5]={name="兽灵精华(1000)",id="15112",num="1",},
		[6]={name="守护进化丹",id="10303",num="1",},
		[7]={name="三级灵羽",id="10182",num="1",},
		[8]={name="二级灵羽",id="10181",num="1",},
		[9]={name="一级灵羽",id="10180",num="1",},
		[10]={name="四级攻击玄晶",id="10227",num="1",},
		[11]={name="镇魔令包",id="15049",num="1",},
		[12]={name="一级物防玄晶",id="10236",num="1",},
		[13]={name="二级物防玄晶",id="10237",num="1",},
		[14]={name="荣誉令牌(1000)",id="15045",num="1",},
		[15]={name="真气丹(100)",id="15092",num="1",},
		[16]={name="三级物防玄晶",id="10238",num="1",},
		[17]={name="疗伤药(包)",id="15013",num="1",},
		[18]={name="经验珠(100万)",id="10212",num="1",},
		[19]={name="经验珠(50万)",id="10211",num="1",},
		[20]={name="守护资质丹",id="10305",num="1",},
		},
	[4]={
		[1]={name="混沌丹",id="15127",num="1",},
		[2]={name="镇魔令大包",id="15050",num="1",},
		[3]={name="超级守护经验丹",id="15135",num="1",},
		[4]={name="五级物防玄晶",id="10240",num="1",},
		[5]={name="灵气珠(1000)",id="15106",num="1",},
		[6]={name="六级宝石",id="10140",num="1",},
		[7]={name="三级灵羽",id="10182",num="1",},
		[8]={name="二级灵羽",id="10181",num="1",},
		[9]={name="一级灵羽",id="10180",num="1",},
		[10]={name="女儿红(10年)",id="10080",num="1",},
		[11]={name="进阶石",id="10209",num="10",},
		[12]={name="一级魔防玄晶",id="10248",num="1",},
		[13]={name="二级魔防玄晶",id="10249",num="1",},
		[14]={name="成就令牌",id="15054",num="1",},
		[15]={name="兽灵精华(100)",id="15110",num="1",},
		[16]={name="三级魔防玄晶",id="10250",num="1",},
		[17]={name="疗伤药(包)",id="15013",num="1",},
		[18]={name="经验珠(100万)",id="10212",num="1",},
		[19]={name="经验珠(50万)",id="10211",num="1",},
		[20]={name="守护资质丹",id="10305",num="1",},
		},
	[5]={
		[1]={name="饕餮丹",id="15128",num="1",},
		[2]={name="经验珠(5000万)",id="10178",num="1",},
		[3]={name="聚灵珠",id="15011",num="1",},
		[4]={name="五级魔防玄晶",id="10252",num="1",},
		[5]={name="转生石",id="10217",num="1",},
		[6]={name="四倍宝典",id="15007",num="1",},
		[7]={name="三级灵羽",id="10182",num="1",},
		[8]={name="二级灵羽",id="10181",num="1",},
		[9]={name="一级灵羽",id="10180",num="1",},
		[10]={name="蓝玉镖令",id="10076",num="1",},
		[11]={name="经验珠(500万)",id="10207",num="1",},
		[12]={name="四级生命玄晶",id="10263",num="1",},
		[13]={name="四级物防玄晶",id="10239",num="1",},
		[14]={name="坐骑经验丹(大)",id="15037",num="1",},
		[15]={name="坐骑经验丹(中)",id="15036",num="1",},
		[16]={name="四级魔防玄晶",id="10251",num="1",},
		[17]={name="疗伤药(包)",id="15013",num="1",},
		[18]={name="经验珠(100万)",id="10212",num="1",},
		[19]={name="经验珠(50万)",id="10211",num="1",},
		[20]={name="守护资质丹",id="10305",num="1",},
		},
};

function process_duobao(player,actionset,panelid,actionid,data)
	--每次夺宝奇兵上线，这段逻辑中PP_DUOBAO_TOTAL_CHONGZHI要修改+1
	if util.ppn(player,const.PP_DUOBAO_TOTAL_CHONGZHI) <= 4 then
		player:set_param(const.PP_DUOBAO_PAIHANGLQ,0);
		player:set_param(const.PP_DUOBAO_TOTAL,0);
		player:set_param(const.PP_DUOBAO_TOTAL_CHONGZHI,5);
	end
	if string.sub(actionid,1,9)== "duobaopic" then
		local jnum = player:get_empty_number_in_lotterydepot();
		if jnum < 1 then player:alert(11,1,"抽奖仓库空格不足1个!"); return; end
		local i = tonumber(string.sub(actionid,10,10));
		local j = tonumber(string.sub(actionid,11,11));
		clickbom(player,i,j);
	end
	if actionid == "btnduobaochongzhi" then
		if activity.isDuoBaoQiBing() then			
			if util.ppn(player,const.PP_DUOBAO_YIJIAN)==0 then
				player:set_param(const.PP_DUOBAO_KUANG,2);
				player:set_panel_data("panelduobaoqueren","textduobao","text","    确定要花费1000元宝重置本轮夺宝吗？");
				player:set_panel_data("panelduobaoqueren","panelduobaoqueren","panel_visible","true");
				player:push_ckpanel_data("duobaoqueren","panelduobaoqueren");
			else
				player:alert(1,1,"请耐心等待自动重置完毕");
			end
		else
			player:alert(1,1,"不在活动日期内！");
		end
		return;
	end
	if actionid == "btnduobaoyijian" then
		if activity.isDuoBaoQiBing() then
			player:set_param(const.PP_DUOBAO_KUANG,1);
			player:set_panel_data("panelduobaoqueren","textduobao","text","    确定要花费6000元宝完成本轮所有夺宝吗？");
			player:set_panel_data("panelduobaoqueren","panelduobaoqueren","panel_visible","true");
			player:push_ckpanel_data("duobaoqueren","panelduobaoqueren");
		else
			player:alert(1,1,"不在活动日期内！");
		end
		return;
	end
	if actionid == "btnduobaoOK" then
		player:set_panel_data("panelduobaoqueren","panelduobaoqueren","panel_visible","false");
		player:push_ckpanel_data("duobaoqueren","panelduobaoqueren");
		local jnum = player:get_empty_number_in_lotterydepot();
		if util.ppn(player,const.PP_DUOBAO_KUANG)==1 then
			if jnum >= 20 then
				yijian(player);
			else
				player:alert(11,1,"抽奖仓库空格不足20个!");
			end
		elseif util.ppn(player,const.PP_DUOBAO_KUANG)==2 then
			if player:get_vcoin()>=1000 then
				player:sub_vcoin(1000,"duobaoqibing");
				randombom(player);
			else
				player:alert(1,1,"您的元宝不足[<font color='#ff0000'>1000</font>] 无法重置本轮夺宝!");
			end
		end
	end
	if actionid == "btnduobaoCancel" then
		player:set_panel_data("panelduobaoqueren","panelduobaoqueren","panel_visible","false");
		player:push_ckpanel_data("duobaoqueren","panelduobaoqueren");
	end
	
	if actionid == "btnduobaocangku" then
		player:set_panel_data("panelxbdepot","panelxbdepot","panel_visible","true");
		player:push_ckpanel_data("xbdepot","panelxbdepot");
		return;
	end
	if actionid == "btnduobaopaihang" then
		Recharge_processdbqb3(player);
		 freshduobao(player);
		player:set_panel_data("panelduobaopaihang","panelduobaopaihang","panel_visible","true");
		player:push_ckpanel_data("duobaopaihang","panelduobaopaihang");
	end
	if string.sub(actionid,1,11)== "btnduobaopm" then
		local i = tonumber(string.sub(actionid,12,12));
		giveduobaopmAward(player,i)
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_duobao);

function clickbom(player,i,j)
	
	if activity.isDuoBaoQiBing() then
		if util.ppn(player,const.PP_DUOBAO_TEN) < 10 then
			if player:get_vcoin_bind() >= 100 then
				if player:num_bag_black()>=1 then
					player:set_param(const.PP_DUOBAO_TEN,util.ppn(player,const.PP_DUOBAO_TEN)+1);
					player:set_param(const.PP_DUOBAO_TOTAL,util.ppn(player,const.PP_DUOBAO_TOTAL)+1);
					player:sub_vcoin_bind(100);
					player:set_param(const.PP_DUOBAO_FLAG,1);
					fanzhuan(player,i,j);
				else
					player:alert(1,1,"您的背包不足一格");
				end
			elseif player:get_vcoin() >= 100 then
				if player:num_bag_black()>=1 then
					player:set_param(const.PP_DUOBAO_TOTAL,util.ppn(player,const.PP_DUOBAO_TOTAL)+1);
					player:sub_vcoin(100,"duobaoqibing");
					player:set_param(const.PP_DUOBAO_FLAG,0);
					fanzhuan(player,i,j);
				else
					player:alert(1,1,"您的背包不足一格");
				end
			else
				player:alert(1,1,"您的元宝不足100");
			end
		else
			if player:get_vcoin() >= 100 then
				if player:num_bag_black()>=1 then
					player:set_param(const.PP_DUOBAO_TOTAL,util.ppn(player,const.PP_DUOBAO_TOTAL)+1);
					player:sub_vcoin(100,"duobaoqibing");
					player:set_param(const.PP_DUOBAO_FLAG,0);
					fanzhuan(player,i,j);
				else
					player:alert(1,1,"您的背包不足一格");
				end
			else
				player:alert(1,1,"您的元宝不足100");
			end
		end
	else
		player:alert(1,1,"不在活动日期内！");
	end
end

function freshShenYu(player)
	num=22-util.ppn(player,const.PP_DUOBAO_BAD)-util.ppn(player,const.PP_DUOBAO_GOOD);
	player:set_panel_data("panelduobao","duobaoshengyu","point",num);
end

function fanzhuan(player,i,j)
	local tab1 = {1,2,3,4,5,6,7,8,9,10};
	local tab2 = {11,12,13,14,15,16,17,18,19,20};
	local RandomItem = 0;	
	local level = math.random(1,5);
	local wuping = award[level];
	local num=0;
	local tmp=const.PP_DUOBAO_TOP1;
	local tmpxulie=const.PP_DUOBAO_XULIE1-1;
	local tmpitem = const.PP_DUOBAO_AREA11+((i-1)*8)+(j-1);
	player:set_param(tmpitem,util.ppn(player,tmpitem)-500000);
	if util.ppn(player,tmpitem) ~= -1 then
		if util.ppn(player,tmpitem)~=0 then
			setConst(player,i,j,util.ppn(player,tmpitem));
		else
			setConst(player,i,j,-1);
		end
	else
		if util.ppn(player,const.PP_DUOBAO_FLAG) == 1 then
			if util.ppn(player,const.PP_DUOBAO_BAD) <= 10 then
				tmpxulie = tmpxulie+util.ppn(player,const.PP_DUOBAO_BAD);
				RandomItem =util.ppn(player,tmpxulie)+10;
				--if RandomItem==nil then
					--print("1 const.PP_DUOBAO_XULIE"..util.ppn(player,const.PP_DUOBAO_BAD).."=="..util.ppn(player,tmpxulie));
				--end
				player:set_param(const.PP_DUOBAO_BAD,util.ppn(player,const.PP_DUOBAO_BAD)+1);
				areaID[i][j] = RandomItem;
			else
				tmpxulie = tmpxulie+util.ppn(player,const.PP_DUOBAO_GOOD);
				RandomItem = util.ppn(player,tmpxulie);
				--if RandomItem==nil then
					--print("2 const.PP_DUOBAO_XULIE"..util.ppn(player,const.PP_DUOBAO_GOOD).."=="..util.ppn(player,tmpxulie));
				--end
				player:set_param(const.PP_DUOBAO_GOOD,util.ppn(player,const.PP_DUOBAO_GOOD)+1);
				areaID[i][j] = RandomItem;
			end
			num=22-util.ppn(player,const.PP_DUOBAO_BAD)-util.ppn(player,const.PP_DUOBAO_GOOD);
			if num<0 then
				num=0;
			end
			if RandomItem>0 and RandomItem<7 then
				tmp=tmp+RandomItem-1;
				setConst(player,i,j,util.ppn(player,tmp));
				if RandomItem==1 then
					player:add_item_lottery(util.ppn(player,tmp),1,1);	
				else
					player:add_item_lottery(util.ppn(player,tmp),1,1);	
				end
				player:set_param(tmp,util.ppn(player,tmp)+1000000);
			else
				setConst(player,i,j,wuping[RandomItem].id);
				player:add_item_lottery(wuping[RandomItem].name,wuping[RandomItem].num,1);	
			end
			player:set_panel_data("panelduobao","duobaoshengyu","point",num);
			if RandomItem<7 then
				local a=const.PP_DUOBAO_TOP1-1+RandomItem;
				if util.ppn(player,a)>1000000 then
					player:set_param(a,util.ppn(player,a)-1000000);
				end
				server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]玩家运气极佳，在夺宝奇兵中获得"..namea[util.ppn(player,a)].ming.."[<a href='event:push_local_panelduobao'><u><font color='#00FF00'>我要夺宝</font></u></a>]");
			end
		else
			local a = math.random(1,2);
			if a==1 then
				if util.ppn(player,const.PP_DUOBAO_BAD)<= 10 then
					tmpxulie = tmpxulie+util.ppn(player,const.PP_DUOBAO_BAD);
					RandomItem = util.ppn(player,tmpxulie)+10;
					--if RandomItem==nil then
						--print("3 const.PP_DUOBAO_XULIE"..util.ppn(player,const.PP_DUOBAO_BAD).."=="..util.ppn(player,tmpxulie));
					--end
					player:set_param(const.PP_DUOBAO_BAD,util.ppn(player,const.PP_DUOBAO_BAD)+1);
					areaID[i][j] = RandomItem;
				else
					tmpxulie = tmpxulie+util.ppn(player,const.PP_DUOBAO_GOOD);
					RandomItem = util.ppn(player,tmpxulie);
					--if RandomItem==nil then
						--print("4 const.PP_DUOBAO_XULIE"..util.ppn(player,const.PP_DUOBAO_GOOD).."=="..util.ppn(player,tmpxulie));
					--end
					player:set_param(const.PP_DUOBAO_GOOD,util.ppn(player,const.PP_DUOBAO_GOOD)+1);
					areaID[i][j] = RandomItem;
				end
			elseif a==2 then
				if util.ppn(player,const.PP_DUOBAO_GOOD) <= 10 then
					tmpxulie = tmpxulie+util.ppn(player,const.PP_DUOBAO_GOOD);
					RandomItem = util.ppn(player,tmpxulie);
				--	if RandomItem==nil then
						--print("5 const.PP_DUOBAO_XULIE"..util.ppn(player,const.PP_DUOBAO_GOOD).."=="..util.ppn(player,tmpxulie));
					--end
					player:set_param(const.PP_DUOBAO_GOOD,util.ppn(player,const.PP_DUOBAO_GOOD)+1);
					areaID[i][j] = RandomItem;
				else
					tmpxulie = tmpxulie+util.ppn(player,const.PP_DUOBAO_BAD);
					RandomItem = util.ppn(player,tmpxulie)+10;
					--if RandomItem==nil then
						--print("6 const.PP_DUOBAO_XULIE"..util.ppn(player,const.PP_DUOBAO_BAD).."=="..util.ppn(player,tmpxulie));
					--end
					player:set_param(const.PP_DUOBAO_BAD,util.ppn(player,const.PP_DUOBAO_BAD)+1);
					areaID[i][j] = RandomItem;
				end
			end
			num=22-util.ppn(player,const.PP_DUOBAO_BAD)-util.ppn(player,const.PP_DUOBAO_GOOD);	
			if num<0 then
				num=0;
			end
			if RandomItem>0 and RandomItem<7 then
				tmp=tmp+RandomItem-1;
				setConst(player,i,j,util.ppn(player,tmp));
				if RandomItem==1 then
					player:add_item_lottery(util.ppn(player,tmp),1,1);	
				else
					player:add_item_lottery(util.ppn(player,tmp),1,1);	
				end
				player:set_param(tmp,util.ppn(player,tmp)+1000000);
			elseif RandomItem>6 and RandomItem<21 then
				setConst(player,i,j,wuping[RandomItem].id);
				player:add_item_lottery(wuping[RandomItem].name,wuping[RandomItem].num,1);	
			end
			player:set_panel_data("panelduobao","duobaoshengyu","point",num);
			if RandomItem<7 then
				local a=const.PP_DUOBAO_TOP1-1+RandomItem;
				if util.ppn(player,a)>1000000 then
					player:set_param(a,util.ppn(player,a)-1000000);
				end
				server.info(10,0,"[<font color='#ff0000'>"..player:get_name().."</font>]玩家运气极佳，在夺宝奇兵中获得"..namea[util.ppn(player,a)].ming.."[<a href='event:push_local_panelduobao'><u><font color='#00FF00'>我要夺宝</font></u></a>]");
			end
			if num==0 then
				player:set_param(const.PP_DUOBAO_ONTIME,1);
				player:set_timer(19,3000);
				player:alert(11,1,"恭喜您夺取全部宝物，即将开启新一轮寻宝之旅!");
			end
		end
	end	
	freshALLitem(player);
	player:push_ckpanel_data("duobao","panelduobao");
end

function RandomIndex(tabNum,indexNum)
	local t={};
	local rt={};

	for i=1,indexNum do
		local ri = math.random(1,tabNum+1-i);
		local v = ri;
		for j=1,tabNum do
			if not t[j] then
				ri = ri-1;
				if ri==0 then
					table.insert(rt,j);
					t[j] = true;
				end
			end
		end
	end
	return rt;
end

function randombom(player)
	local limit=20;
	local tmp=0;
	local a = 0;
	local s = 0;
	local tmpxulie=const.PP_DUOBAO_XULIE1-1;
	cleanall(player);
	s = RandomIndex(10,10);
	for i=1,10 do
		tmpxulie=tmpxulie+1;
		player:set_param(tmpxulie,s[i]);
	end
	while tmp < 20 do
		local i = math.random(1,64);
		local zhen = math.floor(i/8);
		local yu = i%8;
		if yu == 0 then
			yu = 8;
		end
		
		if zhen == 8 then
			if area[8][8] ~= -1 then
				area[8][8] = -1;
				tmp = tmp+1;
			end
		elseif zhen < 8 then
			if area[zhen+1][yu] ~= -1 then
				area[zhen+1][yu] = -1;
				tmp = tmp+1;
			end
		elseif zhen>8 then
			return;
		end
	end
	getareabom(player);
	freshupitem(player);
	showupitem(player);
	player:set_param(const.PP_DUOBAO_YIJIAN,0);
	freshALLitem(player);
	player:set_panel_data("panelduobao","duobaoshengyu","point",20);
	player:push_ckpanel_data("duobao","panelduobao");
	for i=1,8 do
		for j=1,8 do
			setConst(player,i,j,area[i][j]+500000);
		end
	end
end

function ptintbom()
	print(area[1][1].." "..area[1][2].." "..area[1][3].." "..area[1][4].." "..area[1][5].." "..area[1][6].." "..area[1][7].." "..area[1][8]);
	print(area[2][1].." "..area[2][2].." "..area[2][3].." "..area[2][4].." "..area[2][5].." "..area[2][6].." "..area[2][7].." "..area[2][8]);
	print(area[3][1].." "..area[3][2].." "..area[3][3].." "..area[3][4].." "..area[3][5].." "..area[3][6].." "..area[3][7].." "..area[3][8]);
	print(area[4][1].." "..area[4][2].." "..area[4][3].." "..area[4][4].." "..area[4][5].." "..area[4][6].." "..area[4][7].." "..area[4][8]);
	print(area[5][1].." "..area[5][2].." "..area[5][3].." "..area[5][4].." "..area[5][5].." "..area[5][6].." "..area[5][7].." "..area[5][8]);
	print(area[6][1].." "..area[6][2].." "..area[6][3].." "..area[6][4].." "..area[6][5].." "..area[6][6].." "..area[6][7].." "..area[6][8]);
	print(area[7][1].." "..area[7][2].." "..area[7][3].." "..area[7][4].." "..area[7][5].." "..area[7][6].." "..area[7][7].." "..area[7][8]);
	print(area[8][1].." "..area[8][2].." "..area[8][3].." "..area[8][4].." "..area[8][5].." "..area[8][6].." "..area[8][7].." "..area[8][8]);
end

function getareabom(player)
	for i = 1,8 do
		for j = 1,8 do
			if area[i][j]==-1 then
				if i-1>0 and j-1>0 then
					if area[i-1][j-1]~=-1 then
						area[i-1][j-1] = area[i-1][j-1]+1;
					end
				end
				if i-1>0 then
					if area[i-1][j]~=-1 then
						area[i-1][j] = area[i-1][j]+1;
					end
				end
				if i-1>0 and j+1<9 then
					if area[i-1][j+1]~=-1 then
						area[i-1][j+1] = area[i-1][j+1]+1;
					end
				end
				if  j-1>0 then
					if area[i][j-1]~=-1 then
						area[i][j-1] = area[i][j-1]+1;
					end
				end
				if j+1<9 then
					if area[i][j+1]~=-1 then
						area[i][j+1] = area[i][j+1]+1;
					end
				end
				if i+1<9 and j-1>0 then
					if area[i+1][j-1]~=-1 then
						area[i+1][j-1] = area[i+1][j-1]+1;
					end
				end
				if i+1<9 then
					if area[i+1][j]~=-1 then
						area[i+1][j] = area[i+1][j]+1;
					end
				end
				if i+1<9 and j+1<9 then
					if area[i+1][j+1]~=-1 then
						area[i+1][j+1] = area[i+1][j+1]+1;
					end
				end
			end
		end
	end
end

function yijian(player)
	local RandomItem=0;
	local tmpbad = 1;
	local tmpgood = 1;
	level = math.random(1,5);
	local wuping = award[level];
	local total = 22-util.ppn(player,const.PP_DUOBAO_BAD)-util.ppn(player,const.PP_DUOBAO_GOOD);
	local tmptab1 = {1,2,3,4,5,6,7,8,9,10};
	local tmptab2 = {11,12,13,14,15,16,17,18,19,20};
	local tmpconst = const.PP_DUOBAO_TOP1-1;
	local tmpxulie = const.PP_DUOBAO_XULIE1-1;	
	
	if util.ppn(player,const.PP_DUOBAO_YIJIAN)==0 then
		if player:get_vcoin()>=6000 then
			player:sub_vcoin(6000,"duobaoqibing");
			player:set_param(const.PP_DUOBAO_TOTAL,util.ppn(player,const.PP_DUOBAO_TOTAL)+total);
			player:set_param(const.PP_DUOBAO_YIJIAN,1);
			
			for m=util.ppn(player,const.PP_DUOBAO_BAD),10 do	
				tmpxulie = tmpxulie+1;
				RandomItem = tmptab2[util.ppn(player,tmpxulie)];
				player:add_item_lottery(wuping[RandomItem].name,wuping[RandomItem].num,1);
			end
			for n=7,10 do
				tmpxulie = tmpxulie+1;
				RandomItem = tmptab1[util.ppn(player,tmpxulie)];
				player:add_item_lottery(wuping[n].name,wuping[n].num,1);
			end
			for i=1,6 do
				tmpconst=tmpconst+1;
				if util.ppn(player,tmpconst)<1000000 then
					if i==1 then
						player:add_item_lottery(util.ppn(player,tmpconst),1,1);
					else
						player:add_item_lottery(util.ppn(player,tmpconst),1,1);
					end
				end
			end
			for k=1,10 do
				for m=1,8 do
					for n=1,8 do
						tmpxulie = tmpxulie+1;
						if tmptab2[util.ppn(player,tmpxulie)]== areaID[m][n] then
							tmptab2[util.ppn(player,tmpxulie)] = 0;
						end
						if tmptab1[util.ppn(player,tmpxulie)]== areaID[m][n] then
							tmptab1[util.ppn(player,tmpxulie)] = 0;
						end
					end
				end
			end
			for i = 1,8 do
				for j = 1,8 do	
				
					local tmpitem = const.PP_DUOBAO_AREA11+((i-1)*8)+(j-1);
					player:set_param(tmpitem,util.ppn(player,tmpitem)-500000);
					if area[i][j]~= -1 then
						if util.ppn(player,tmpitem)~=0 then
							setConst(player,i,j,util.ppn(player,tmpitem));
						else
							setConst(player,i,j,-1);
						end
					else
						if areaID[i][j]==0 then
							if tmpbad < 11 then
								tmpxulie = const.PP_DUOBAO_XULIE1-1+tmpbad;
								if tmptab2[util.ppn(player,tmpxulie)]==0 then
									tmpbad = tmpbad+1;
								end
								if tmpbad>10 then
									tmpbad=10;
								end
								setConst(player,i,j,wuping[tmptab2[util.ppn(player,tmpxulie)]].id);
								tmpbad = tmpbad+1;
							elseif tmpgood<11 then
								tmpxulie = const.PP_DUOBAO_XULIE1-1+tmpgood;
								if tmptab1[util.ppn(player,tmpxulie)]==0 then
									tmpgood = tmpgood+1;
								end
								if tmpgood>10 then
									tmpgood=10;
								end
								if tmptab1[util.ppn(player,tmpxulie)]>0 and tmptab1[util.ppn(player,tmpxulie)]<7 then
									tmpconst = const.PP_DUOBAO_TOP1-1;
									tmpconst=tmpconst+tmptab1[util.ppn(player,tmpxulie)];
									if util.ppn(player,tmpconst)>1000000 then
										player:set_param(tmpconst,util.ppn(player,tmp)-1000000);
									end
									setConst(player,i,j,util.ppn(player,tmpconst));
								else
									setConst(player,i,j,wuping[tmptab1[util.ppn(player,tmpxulie)]].id);
								end
								tmpgood = tmpgood+1;
							end
						elseif areaID[i][j]>1 and areaID[i][j]<11 then
							tmpgood = tmpgood+1;
						elseif areaID[i][j]>10 and areaID[i][j]<21 then
							tmpbad = tmpbad+1;
						end
					end
				end
			end	
			player:set_panel_data("panelduobao","duobaoshengyu","point",0);
			freshALLitem(player);
			player:set_param(const.PP_DUOBAO_ONTIME,1);
			player:set_timer(19,5000);
			player:alert(11,1,"恭喜您夺取全部宝物，即将开启新一轮寻宝之旅!");
			player:push_ckpanel_data("duobao","panelduobao");
		else
			player:alert(1,1,"您的元宝不足[<font color='#ff0000'>6000</font>] 无法一键购买全部");
		end
	else
		player:alert(1,1,"请等开启新一轮寻宝之旅后再来点击喔!");
	end	
end

function Recharge_processdbqb3(player)
	local a = player:get_name();
	local b = util.ppn(player,const.PP_DUOBAO_TOTAL);
		if b >= 200 then
			for i = 1,61 do
				if server.get_var("dbqbpma"..i) == nil then
					server.set_var("dbqbpma"..i,0);
				end
				if server.get_var("dbqbpmb"..i) == nil then
					server.set_var("dbqbpmb"..i,0);
				end
				if server.get_var("dbqbpmc"..i) == nil then
					server.set_var("dbqbpmc"..i,0);
				end
			end
			for i = 1,61 do
				if a == server.get_var("dbqbpma"..i) then
					if b > tonumber(server.get_var("dbqbpmb"..i)) then
						server.set_var("dbqbpmb"..i,b);
						server.set_var("dbqbpmc"..i,os.time());
						Recharge_chulidbqb3();
					end
					return;
				end
			end
			if b > tonumber(util.svn("dbqbpmb61")) then
				server.set_var("dbqbpma61",a);
				server.set_var("dbqbpmb61",b);
				server.set_var("dbqbpmc61",os.time());
				Recharge_chulidbqb3();
			end
		end
end

function Recharge_chulidbqb3()
	local Recharge = {};
	for u = 1,61 do
		table.insert(Recharge,{
			name = server.get_var("dbqbpma"..u),
			num = server.get_var("dbqbpmb"..u),
			tim = server.get_var("dbqbpmc"..u),
		})
	end
	
	local c = function(q,w)
	if tonumber(w.num) == nil then	
		w.num = 0;
	end
	if  tonumber(q.num) == nil then
		q.num = 0;
	end
	if  tonumber(w.tim) == nil then
		w.tim = 0;
	end
	if  tonumber(q.tim) == nil then
		q.tim = 0;
	end
	if tonumber(w.num) == tonumber(q.num) then
		return tonumber(w.tim) > tonumber(q.tim);
	else
		return tonumber(w.num) < tonumber(q.num);
	end
	end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("dbqbpma"..idx,value.name);
		server.set_var("dbqbpmb"..idx,value.num);
		server.set_var("dbqbpma"..value.name,idx);
	end
end

function cleanall(player)
	player:set_param(const.PP_DUOBAO_BAD,1);
	player:set_param(const.PP_DUOBAO_GOOD,1);
	for i = 1,8 do
		for j = 1,8 do
			area[i][j]=0;
			areaID[i][j]=0;
			setConst(player,i,j,0);
		end
	end
end

function giveduobaopmAward(player,i)
	local a = player:get_name();
	if util.ppn(player,const.PP_DUOBAO_PAIHANGLQ) == 1 then
		player:alert(1,1,"您已领取过夺宝奇兵排行榜奖励!");
		return;
	end
	
	if activity.isDuoBaoQiBingPaiHang() then
		if i==1 then
			if tonumber(server.get_var("dbqbpma"..a)) == 1 then
				player:set_param(const.PP_DUOBAO_PAIHANGLQ,1);
				player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+2000);
				player:alert(11,1,"成功领取[<font color='#ee00ee'>星尘 *2000</font>]");
			else
				player:alert(1,1,"您不是第一名，无法领取第一名奖励");
			end
		elseif i==2 then
			if tonumber(server.get_var("dbqbpma"..a)) == 2 then
				player:set_param(const.PP_DUOBAO_PAIHANGLQ,1);
				player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+1000);
				player:alert(11,1,"成功领取[<font color='#ee00ee'>星尘 *1000</font>]");
			else
				player:alert(1,1,"您不是第二名，无法领取第二名奖励");
			end
		elseif i==3 then
			if tonumber(server.get_var("dbqbpma"..a)) == 3 then
				player:set_param(const.PP_DUOBAO_PAIHANGLQ,1);
				player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+500);
				player:alert(11,1,"成功领取[<font color='#ee00ee'>星尘 *500</font>]");
			else
				player:alert(1,1,"您不是第三名，无法领取第三名奖励");
			end
		elseif i==4 then
			if tonumber(util.svn("dbqbpma"..a)) >= 4 and  tonumber(util.svn("dbqbpma"..a)) <= 10  then
				player:set_param(const.PP_DUOBAO_PAIHANGLQ,1);
				player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+300);
				player:alert(11,1,"成功领取[<font color='#ee00ee'>星尘 *300</font>]");
			else
				player:alert(1,1,"您不在第四名至第十名内，无法领取该名次奖励");
			end
		elseif i==5 then
			if tonumber(util.svn("dbqbpma"..a)) > 10 and  tonumber(util.svn("dbqbpma"..a)) <= 60 then
				if util.ppn(player,const.PP_DUOBAO_TOTAL) >= 200 then
					player:set_param(const.PP_DUOBAO_PAIHANGLQ,1);
					player:set_param(const.PP_PERSONAL_XINGCHEN,util.ppn(player,const.PP_PERSONAL_XINGCHEN)+100);
					player:alert(11,1,"成功领取[<font color='#ee00ee'>星尘 *100</font>]");
				else
					player:alert(1,1,"您夺宝次数不足200次，无法领取该名次奖励");
				end
			end
		end
	else
		player:alert(1,1,"未到领取排名奖励时间!");
	end
end

function freshduobao(player)
	local a = player:get_name();
	if tonumber(server.get_var("dbqbpma1"))~=0 then
		player:set_panel_data("panelduobaopaihang","duobaopaiming1","text",server.get_var("dbqbpma1"));
	else
		player:set_panel_data("panelduobaopaihang","duobaopaiming1","text"," ");
	end
	if tonumber(server.get_var("dbqbpma2"))~=0 then
		player:set_panel_data("panelduobaopaihang","duobaopaiming2","text",server.get_var("dbqbpma2"));
	else
		player:set_panel_data("panelduobaopaihang","duobaopaiming2","text"," ");
	end
	if tonumber(server.get_var("dbqbpma3"))~=0 then
		player:set_panel_data("panelduobaopaihang","duobaopaiming3","text",server.get_var("dbqbpma3"));
	else
		player:set_panel_data("panelduobaopaihang","duobaopaiming3","text"," ");
	end
	if util.ppn(player,const.PP_DUOBAO_TOTAL) >= 200 then
		player:set_panel_data("panelduobaopaihang","dqduobaopm","text",server.get_var("dbqbpma"..a));
	end
	if util.ppn(player,const.PP_DUOBAO_TOTAL)>=0 then
		player:set_panel_data("panelduobaopaihang","duobaonum","text",util.ppn(player,const.PP_DUOBAO_TOTAL));
	else
		player:set_panel_data("panelduobaopaihang","duobaonum","text",0);
	end
end

function freshupitem(player)
	local tmp = const.PP_DUOBAO_TOP1-1;
	player:set_param(const.PP_DUOBAO_TOP1,0);
	player:set_param(const.PP_DUOBAO_TOP2,0);
	player:set_param(const.PP_DUOBAO_TOP3,0);
	player:set_param(const.PP_DUOBAO_TOP4,0);
	player:set_param(const.PP_DUOBAO_TOP5,0);
	player:set_param(const.PP_DUOBAO_TOP6,0);
	for i=1,6 do
		local level = math.random(1,5);
		local wuping = award[level];
		tmp = tmp+1;
		player:set_param(tmp,wuping[i].id);
	end
end
function showupitem(player)	
	player:set_panel_data("panelduobao","duobaoupitem1","typeid",util.ppn(player,const.PP_DUOBAO_TOP1));
	player:set_panel_data("panelduobao","duobaoupitem2","typeid",util.ppn(player,const.PP_DUOBAO_TOP2));
	player:set_panel_data("panelduobao","duobaoupitem3","typeid",util.ppn(player,const.PP_DUOBAO_TOP3));
	player:set_panel_data("panelduobao","duobaoupitem4","typeid",util.ppn(player,const.PP_DUOBAO_TOP4));
	player:set_panel_data("panelduobao","duobaoupitem5","typeid",util.ppn(player,const.PP_DUOBAO_TOP5));
	player:set_panel_data("panelduobao","duobaoupitem6","typeid",util.ppn(player,const.PP_DUOBAO_TOP6));
end

function setConst(player,i,j,num)
	local a = const.PP_DUOBAO_AREA11;
	local b = a+((i-1)*8)+(j-1);
	player:set_param(b,num);
end

function freshALLitem(player)
	local a = const.PP_DUOBAO_AREA11;
	for i = 1,8 do
		for j = 1,8 do
			local b = a+((i-1)*8)+(j-1);
			if i==1 and j==1 then				
			end;
			if util.ppn(player,b)==0 then
				player:set_panel_data("panelduobao","duobaoitem"..i..j,"visible","false");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"bgid","230009");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"visible","true");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"mouseEnabled","true");
			elseif util.ppn(player,b)==-1 then
				player:set_panel_data("panelduobao","duobaoitem"..i..j,"visible","false");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"visible","false");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"mouseEnabled","false");
			elseif util.ppn(player,b)>0 and util.ppn(player,b)<10 then
				player:set_panel_data("panelduobao","duobaoitem"..i..j,"visible","false");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"bgid","23000"..util.ppn(player,b));
				player:set_panel_data("panelduobao","duobaopic"..i..j,"visible","true");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"mouseEnabled","false");
			elseif util.ppn(player,b)>10 and util.ppn(player,b)<300000 then	
				player:set_panel_data("panelduobao","duobaopic"..i..j,"visible","false");
				player:set_panel_data("panelduobao","duobaoitem"..i..j,"visible","true");
				player:set_panel_data("panelduobao","duobaoitem"..i..j,"typeid",util.ppn(player,b));
			elseif util.ppn(player,b)>400000 and util.ppn(player,b)<1000000 then
				player:set_panel_data("panelduobao","duobaoitem"..i..j,"visible","false");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"bgid","230009");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"visible","true");
				player:set_panel_data("panelduobao","duobaopic"..i..j,"mouseEnabled","true");
			end
		end
	end
end

