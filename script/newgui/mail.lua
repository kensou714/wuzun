module(..., package.seeall)
local ACTIONSET_NAME="mail";
local PANEL_ACTIONSET_NAME="panelmail";
local qbdata=
{
	[1]=
	{
		tag=true,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 1, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 1, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 1, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 1, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 1, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 1, typeid="10240",},
		},
	},
	[2]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 2, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 2, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 2, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 2, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 2, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 2, typeid="10240",},
		},
	},
	[3]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 3, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 3, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 3, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 3, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 3, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 3, typeid="10240",},
		},
	},
	[4]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 4, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 4, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 4, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 4, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 4, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 4, typeid="10240",},
		},
	},
	[5]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 5, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 5, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 5, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 5, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 5, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 5, typeid="10240",},
		},
	},
	[6]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 6, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 6, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 6, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 6, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 6, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 6, typeid="10240",},
		},
	},
};
local wddata=
{
	[1]=
	{
		tag=true,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 7, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 7, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 7, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 7, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 7, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 7, typeid="10240",},
		},
	},
	[2]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="abc",
		nr="abcdefg",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 8, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 8, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 8, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 8, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 8, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 8, typeid="10240",},
		},
	},
	[3]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="一二三",
		nr="一二三四五六",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 9, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 9, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 9, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 9, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 9, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 9, typeid="10240",},
		},
	},
	[4]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 10, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 10, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 10, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 10, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 10, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 10, typeid="10240",},
		},
	},
	[5]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 11, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 11, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 11, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 11, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 11, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 11, typeid="10240",},
		},
	},
	[6]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 12, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 12, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 12, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 12, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 12, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 12, typeid="10240",},
		},
	},
};
local yddata=
{
	[1]=
	{
		tag=true,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 13, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 13, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 13, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 13, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 13, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 13, typeid="10240",},
		},
	},
	[2]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 14, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 14, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 14, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 14, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 14, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 14, typeid="10240",},
		},
	},
	[3]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 15, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 15, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 15, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 15, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 15, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 15, typeid="10240",},
		},
	},
	[4]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 16, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 16, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 16, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 16, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 16, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 16, typeid="10240",},
		},
	},
	[5]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 17, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 17, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 17, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 17, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 17, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 17, typeid="10240",},
		},
	},
	[6]=
	{
		tag=false,
		selected=false,
		ydid="110006",
		zt="123",
		nr="123456",
		jssh="2014-05-21",
		sysj="30天",
		fj={
				[1] ={attr = "成长进阶礼包", sl = 18, typeid="18075",},
				[2] ={attr = "四倍宝典", sl = 18, typeid="15007",},
				[3] ={attr = "聚灵珠", sl = 18, typeid="15011",},
				[4] ={attr = "坐骑经验丹(大)", sl = 18, typeid="15037",},
				[5] ={attr = "五级攻击玄晶", sl = 18, typeid="10228",},
				[6] ={attr = "五级物防玄晶", sl = 18, typeid="10240",},
		},
	},
};
function process_mailActivity(player,actionset,panelid,actionid,data)
	--fresh_mail(player);
	if string.sub(actionid,1,5) == "btnsc" then
		local scindex = tonumber(string.sub(actionid,6));
		if scindex > 0 then
			doCancel(player,scindex);
		end
		return;
	end
	if string.sub(actionid,1,4) == "qbxz" then--qbxz1
		local index = tonumber(string.sub(actionid,5));
		if index > 0 then
			qbdata[index].selected = not qbdata[index].selected;
			loadData(player,"btnqb");
		end
		return;
	elseif string.sub(actionid,1,4) == "ydxz" then
		local index1 = tonumber(string.sub(actionid,5))
		if index1 > 0 then
			yddata[index1].selected = not yddata[index1].selected;
			loadData(player,"btnyd");
		end
		return;
	elseif string.sub(actionid,1,4) == "wdxz" then
		local index2 = tonumber(string.sub(actionid,5));
		if index2 > 0 then
			wddata[index2].selected = not wddata[index2].selected;	
			loadData(player,"btnwd");
		end
		return;
	end

	if string.sub(actionid,1,5) == "btnqx" then
		local indexqx = tonumber(string.sub(actionid,6));
		if indexqx > 0 then
			setQx(player,indexqx);
		end
	end

	for i=1,6 do 
		if actionid == "btnqb"..i then
			process_qb_detail(player,i);
			return;
		elseif actionid== "btnyd"..i then
			process_yd_detail(player,i);
			return;
		elseif actionid=="btnwd"..i then
			process_wd_detail(player,i);
			return;
		end
	end

	if actionid == "btnTest" then
		test_post_mail(player); return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_mailActivity);

function fresh_mail(player)
	loadData(player,"btnqb");
	loadData(player,"btnyd");
	loadData(player,"btnwd");
end

function process_qb_detail(player,i)
	qbdata[i].ydid="110007";
	for j=1,6 do
		if j == i then
			qbdata[j].tag = true;
		else
			qbdata[j].tag = false;
		end
	end
	loadData(player,"btnqb");
end
function process_yd_detail(player,i)
	yddata[i].ydid="110007";
	for j=1,6 do
		if j == i then
			yddata[j].tag = true;
		else
			yddata[j].tag = false;
		end
	end
	loadData(player,"btnyd");
end
function process_wd_detail(player,i)
	--print("wd"..i);
	wddata[i].ydid="110007";
	for j=1,6 do
		if j == i then
			wddata[j].tag = true;
		else
			wddata[j].tag = false;
		end
	end
	loadData(player,"btnwd");
end

function setQx(player,indexqx)
	if indexqx == 1 then
		for i=1,6 do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"qbxz"..i,"selected","true");
			qbdata[i].selected = true;
		end
	elseif indexqx == 2 then
		for j=1,6 do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"ydxz"..j,"selected","true");	
			yddata[j].selected = true;
		end
	elseif indexqx == 3 then
		for k=1,6 do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"wdxz"..k,"selected","true");	
			wddata[k].selected = true;
		end
	else
		return;
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function loadData(player,actionid)
	if actionid == "btnqb" then
		for i=1,6 do
			local t1 = "false";
			if qbdata[i].selected then
				t1="true";
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"qbxz"..i,"selected",t1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"qbsfyd"..i,"bgid",qbdata[i].ydid);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtqbzt"..i,"text",qbdata[i].zt);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtqbjssj"..i,"text",qbdata[i].jssh);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtqbsysj"..i,"text",qbdata[i].sysj);
			if qbdata[i].tag then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzt1","text",qbdata[i].zt);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnr1","text",qbdata[i].nr);
				local fjdata = qbdata[i].fj;
				for j=1,6 do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"qbfj"..j,"typeid",fjdata[j].typeid);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"qbfj"..j,"num",fjdata[j].sl);
				end
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	elseif actionid == "btnwd" then
		for m=1,6 do
			local t2 = "false";
			if wddata[m].selected then
				t2="true";
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"wdxz"..m,"selected",t2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"wdsfyd"..m,"bgid",wddata[m].ydid);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtwdzt"..m,"text",wddata[m].zt);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtwdjssj"..m,"text",wddata[m].jssh);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtwdsysj"..m,"text",wddata[m].sysj);
			if wddata[m].tag then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzt3","text",wddata[m].zt);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnr3","text",wddata[m].nr);
				local fjdata = wddata[m].fj;
				for n=1,6 do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"wdfj"..n,"typeid",fjdata[n].typeid);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"wdfj"..n,"num",fjdata[n].sl);
				end
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	elseif actionid == "btnyd" then
		for k=1,6 do
			local t3 = "false";
			if yddata[k].selected then
				t3="true";
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"ydxz"..k,"selected",t3);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"ydsfyd"..k,"bgid",yddata[k].ydid);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydzt"..k,"text",yddata[k].zt);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydjssj"..k,"text",yddata[k].jssh);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtydsysj"..k,"text",yddata[k].sysj);
			if yddata[k].tag then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtzt2","text",yddata[k].zt);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnr2","text",yddata[k].nr);
				local fjdata = yddata[k].fj;
				for v=1,6 do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"ydfj"..v,"typeid",fjdata[v].typeid);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"ydfj"..v,"num",fjdata[v].sl);
				end
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	else
		return;
	end
end
function doCancel(player,scindex)
	local scdata = " ";
	if scindex == 1 then
		for i=1,6 do
			if qbdata[i].selected then
				scdata = scdata.."-"..i;
			end
		end
	elseif scindex == 2 then
		for i=1,6 do
			if yddata[i].selected then
				scdata = scdata.."-"..i;
			end
		end
	elseif scindex == 3 then
		for i=1,6 do
			if wddata[i].selected then
				scdata = scdata.."-"..i;
			end
		end
	else
		return;
	end
	--print(scdata);
end
function test_post_mail( player )
	player:post_mail("邮件测试","好好测试，开心测试！",19009,10000,19007,100000,10140,5);
end