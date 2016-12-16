module(..., package.seeall)
--猎命
local ACTIONSET_NAME="lieming";
local PANEL_ACTIONSET_NAME="panellieming";

local data_result_warrior={
	{item="一品战灵①",price=50   ,},
	{item="二品战灵①",price=100  ,},
	{item="三品战灵①",price=300  ,},
	{item="四品战灵①",price=1200 ,},
	{item="五品战灵①",price=6000 ,},
	{item="六品战灵①",price=36000,},
};
local data_result_wizard={
	{item="一品法灵①",price=50   ,},
	{item="二品法灵①",price=100  ,},
	{item="三品法灵①",price=300  ,},
	{item="四品法灵①",price=1200 ,},
	{item="五品法灵①",price=6000 ,},
	{item="六品法灵①",price=36000,},
};
local data_result_taoist={
	{item="一品道灵①",price=50   ,},
	{item="二品道灵①",price=100  ,},
	{item="三品道灵①",price=300  ,},
	{item="四品道灵①",price=1200 ,},
	{item="五品道灵①",price=6000 ,},
	{item="六品道灵①",price=36000,},
};
--控件属性
local actionset_data={
	["lie1"] = {id=1,dark_bgid=4047,light_bgid=4048},--数字id,暗色背景,亮色背景
	["lie2"] = {id=2,dark_bgid=4045,light_bgid=4046},
	["lie3"] = {id=3,dark_bgid=4043,light_bgid=4044},
	["lie4"] = {id=4,dark_bgid=4049,light_bgid=4050},
	["lie5"] = {id=5,dark_bgid=4051,light_bgid=4052},
	["btnOpen"] = {text="元宝开启"},--元宝开启猎命控件
	["btnSell"] = {text="出售"},--出售灵器
	["btnPicup"] = {text="提取"},--提取灵器
	["btnHuishou"] = {text="一键回收"},--回收包裹内的所有灵器
	["iCaptureItem"] = {icon="",desp="##..item_name..##"},--回收提取处的框控件,图标与描述
	["txtDesp"] = {text="..."},
};
local lieming_data={
	[1]={
		price_gm=20000,
		price_vc=5,
		next_prob=80,
		results={100,0,0,0,0,0},
	},
	[2]={
		price_gm=40000,
		price_vc=10,
		next_prob=60,
		results={100,100,0,0,0,0},
	},
	[3]={
		price_gm=80000,
		price_vc=15,
		next_prob=10,
		results={110,100,90,0,0,0},
	},
	[4]={
		price_gm=160000,
		price_vc=20,
		next_prob=25,
		results={110,110,100,100,0,0},
	},
	[5]={
		price_gm=320000,
		price_vc=25,
		next_prob=0,
		results={120,110,100,90,35,10},
	},
};
function get_result_data(player)
	if player:get_job_name() == 'warrior' then
		return data_result_warrior;
	end
	if player:get_job_name() == 'wizard' then
		return data_result_wizard;
	end
	if player:get_job_name() == 'taoist' then
		return data_result_taoist;
	end
	return data_result_warrior;
end
function tiqu(player)
	if player:num_bag_black() >= 1 then
		local lmresult=util.ppn(player,const.PP_LIEMING_RESULT);
		local data_result = get_result_data(player);
		local r = data_result[lmresult];
		if r then
			player:add_item_log(r.item,205,1,1);
			player:alert(11,0,"灵器已放进包裹");
		end
		player:set_param(const.PP_LIEMING_RESULT,0);
		freshPanelData(player);
	else
		player:alert(1,0,"包裹已满");
	end
	return 100;
end
function chushou(player)
	local lmresult=util.ppn(player,const.PP_LIEMING_RESULT);
	local data_result = get_result_data(player);
	local r = data_result[lmresult];
	if r then
		player:set_param(const.PP_LIEMING_LINQI,util.ppn(player,const.PP_LIEMING_LINQI)+r.price);
		player:alert(10,0,"出售灵器获得灵气值:"..r.price.."点");
	end
	player:set_param(const.PP_LIEMING_RESULT,0);
	freshPanelData(player);
	return 100;
end
function lieling(player,actionset,panelid,actionid)
	if actionid == "btnSell" then
		chushou(player);
		return 100;
	end
	if actionid == "btnPicup" then
		tiqu(player);
		return 100;
	end
	if actionid == "btnHuishou" then
		onTalkhuishou2(npc,player);
		return 100;
	end
	if actionid == "btnOpen" then
		if player:get_vcoin() >= 900 then
			player:sub_vcoin(900);
			player:set_param(const.PP_LIEMING_OPEN3,1);
			freshPanelData(player);
		else
			player:alert(1,0,"元宝不足.");
		end
		return 100;
	end
	local lmresult=util.ppn(player,const.PP_LIEMING_RESULT);
	local data_result = get_result_data(player);
	local r = data_result[lmresult];
	if r then
		chushou(player);
	end
	local lmshifu = actionset_data[actionid].id;--控件名称获取id
	local d = lieming_data[lmshifu];
	if not d then return 100;end;
	if 1==player:sub_gamemoney_bind(d.price_gm) or 1==player:sub_gamemoney(d.price_gm) then
		if lmshifu > 1 then
			if util.ppn(player,const.PP_LIEMING_OPEN+lmshifu-1) ==1 then
				player:set_param(const.PP_LIEMING_OPEN+lmshifu-1,0);
			else
				freshPanelData(player);
				return 100;
			end
		end
	else
		player:alert(1,0,"金币不足");
		return 100;
	end
	--计算是否获得灵器
	local maxprob=0;
	for i=1,#d.results do maxprob=maxprob+d.results[i];end;
	local p=math.random(1,maxprob);
	local t=0;
	for i=1,#d.results do
		if t < p and t+d.results[i]>= p then
			player:set_param(const.PP_LIEMING_RESULT,i);
			break;
		end
		t=t+d.results[i];
	end;
	--计算是否打开下一级猎命入口
	if math.random(1,10000) < d.next_prob*100 then
		player:set_param(const.PP_LIEMING_OPEN+lmshifu,1);
	end
	freshPanelData(player);
	return 100;
end
ckpanel.add_listener(ACTIONSET_NAME,lieling);
function freshPanelData(player)
	local lmresult=util.ppn(player,const.PP_LIEMING_RESULT);
	local data_result = get_result_data(player);
	local r = data_result[lmresult];
	if r then
		player:push_item_info(r.item);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"iCaptureItem","DDdesp","##"..r.item.."##");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtDesp","htmlText","在这里你可以请各路神仙帮你猎取灵器,灵器可以大幅提升生命值,品级越高提升量越高,等级越高提升量越高.请低级神仙猎取灵器有几率遇见高级神仙.");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"iCaptureItem","DDdesp","");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtDesp","DDhtmlText","在这里你可以请各路神仙帮你猎取灵器,灵器可以大幅提升生命值,品级越高提升量越高,等级越高提升量越高.请低级神仙猎取灵器有几率遇见高级神仙.");
	end
	for i=1,5 do
		local str = "lie"..i;
		local d = actionset_data[str];
		if d then
			local NUMID = const.PP_LIEMING_OPEN+i-1;
			if util.ppn(player,NUMID) == 1 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,str,"mouseEnabled","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,str,"DDbgid",d.light_bgid);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,str,"mouseEnabled","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,str,"DDbgid",d.dark_bgid);
			end
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end