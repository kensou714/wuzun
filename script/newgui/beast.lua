module(..., package.seeall)
local ACTIONSET_NAME="beast";
local PANEL_ACTIONSET_NAME="panelbeast";
local MAX_SHOULING_LV=300;

local sl={
	[1]={name="坚韧兽灵",attr="物理防御"},
	[2]={name="无畏兽灵",attr="魔法防御"},
	[3]={name="生源兽灵",attr="生命上限"},
	[4]={name="震愤兽灵",attr="暴击几率"},
	[5]={name="杀伤兽灵",attr="暴击伤害"},
	[6]={name="蛮力兽灵",attr="攻击属性"},
}
local zqsl={5,10,15,20,25,30,35,40,45,50,55,60,70,85,100,}

function process_shouling_logic(player,actionset,panelid,actionid,data)
	if actionid == "btnxiulian" then
		--print(tonumber(data[1]));
		doShouLingLogic(player,tonumber(data[1]));
		return;
	end
	if actionid == "wanfashuoming" then
		player:set_panel_data("panelslwanfa","panelslwanfa","panel_visible","true");
		player:push_ckpanel_data("slwanfa","panelslwanfa");
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_shouling_logic);




function doShouLingLogic(player,usevcoin)
	local slv = util.ppn(player,const.PP_SHOULING_LEVEL);
	local liq = util.ppn(player,const.PP_SHOULING_JINGHUA);
	if slv >= MAX_SHOULING_LV then player:alert(11,1,"您的兽灵等级已达上限!"); return; end
	local nslv = slv+1;

	local jie = math.floor(nslv/6);
	local point = nslv - 6*jie;
	local npoint = point +1;
	if npoint > 6 then npoint=1;end
	local nsid,ntype,nlevel,ndc,ndc2,nmc,nmc2,nsc,nsc2,nac,nac2,nmac,nmac2,nhp,nmp,nbjjl,nbjsh,nfight,need = player:get_shouling_data(nslv);
	if need then
		if liq >= need then
			player:set_param(const.PP_SHOULING_JINGHUA,liq-need);
			player:set_param(const.PP_SHOULING_LEVEL,nslv);
			player:set_shouling_level(nslv);
			player:recal_attr();
			--player:hpmp_full_fresh();
			freshShouLingPanel(player);
			player:alert(11,1,"恭喜您兽灵修炼成功!");return;
		end
		if usevcoin and usevcoin == 1 then
			local nNeedVcoin = need - liq
			newgui.minimap.reset_player_shoulingjj_info(player)
			if activity.isShouLingDaZhe() and util.ppn(player,const.PP_SHOULINGJINJIE_TIMES) > 0 then
				if slv <= 10 * 6 then
					nNeedVcoin = math.floor(nNeedVcoin * 0.95)
				elseif slv > 10 * 6 and slv <= 30 * 6 then
					nNeedVcoin = math.floor(nNeedVcoin * 0.88)
				elseif slv > 30 * 6 then
					nNeedVcoin = math.floor(nNeedVcoin * 0.8)
				end
			end
			if player:get_vcoin() >= nNeedVcoin then
				if activity.isShouLingDaZhe() and util.ppn(player,const.PP_SHOULINGJINJIE_TIMES) > 0 then
					player:set_param(const.PP_SHOULINGJINJIE_TIMES,util.ppn(player,const.PP_SHOULINGJINJIE_TIMES)-1)
					player:alert(11,1,"今日特惠进阶次数剩余["..util.ppn(player,const.PP_SHOULINGJINJIE_TIMES).."]次！");
				end
				player:sub_vcoin(nNeedVcoin,"shouling");
				player:set_param(const.PP_SHOULING_JINGHUA,0);
				player:set_param(const.PP_SHOULING_LEVEL,nslv);
				player:set_shouling_level(nslv);
				player:recal_attr();
				--player:hpmp_full_fresh();
				freshShouLingPanel(player);
				player:alert(11,1,"恭喜您兽灵修炼成功!消耗"..nNeedVcoin.."元宝。");
				return;
			else
				player:alert(11,1,"元宝不足"..nNeedVcoin..",修炼失败!");
			end
		else
			player:alert(11,1,"您当前的兽灵精华不足"..need);
		end
	end
end

function freshShouLingPanel(player)
	local slv = util.ppn(player,const.PP_SHOULING_LEVEL);
	local jie = math.floor(slv/6);
	local point = slv - 6*jie;
	local npoint = point +1;
	local progress = point--进度条用到
	if point == 0 then progress = 6;end
	if npoint > 6 then npoint=1;end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"asshouling","action","progress_6_"..progress);
	local csid,ctype,clevel,cdc,cdc2,cmc,cmc2,csc,csc2,cac,cac2,cmac,cmac2,chp,cmp,cbjjl,cbjsh,cfight,cneed = player:get_shouling_data(slv);
	if cfight then player:set_panel_data(PANEL_ACTIONSET_NAME,"fightpoint","point",cfight);end
	
	local nslv = slv+1;
	if nslv <= MAX_SHOULING_LV then
		local nsid,ntype,nlevel,ndc,ndc2,nmc,nmc2,nsc,nsc2,nac,nac2,nmac,nmac2,nhp,nmp,nbjjl,nbjsh,nfight,nneed = player:get_shouling_data(nslv);
		if ntype and nlevel and sl[ntype] then 
			player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlname","text",sl[ntype].name.." LV"..nlevel); 
			setTexiao(player,ntype);
		end
		if nneed then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"sl_num","text",""..(util.ppn(player,const.PP_SHOULING_JINGHUA)).."/"..nneed); 
			local nNeedVcoin = nneed-util.ppn(player,const.PP_SHOULING_JINGHUA)
			newgui.minimap.reset_player_shoulingjj_info(player)
			if activity.isShouLingDaZhe() and util.ppn(player,const.PP_SHOULINGJINJIE_TIMES) > 0 then
				if slv <= 10 * 6 then
					nNeedVcoin = math.floor(nNeedVcoin * 0.95)
				elseif slv > 10 * 6 and slv <= 30 * 6 then
					nNeedVcoin = math.floor(nNeedVcoin * 0.88)
				elseif slv > 30 * 6 then
					nNeedVcoin = math.floor(nNeedVcoin * 0.8)
				end
			end 
			if util.ppn(player,const.PP_SHOULING_JINGHUA) >= nneed then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slneedyb","text","( 需 0 元宝 )"); 
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slneedyb","text","( 需 "..nNeedVcoin.." 元宝 )"); 
			end
		end
		if ndc2 and ndc2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..ndc.."-"..ndc2);end
		if nmc2 and nmc2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..nmc.."-"..nmc2);end
		if nsc2 and nsc2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..nsc.."-"..nsc2);end
		if nac2 and nac2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..nac.."-"..nac2);end
		if nmac and nmac>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..nmac.."-"..nmac2);end
		if nhp and nhp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..nhp);end
		if nbjjl and nbjjl>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..(nbjjl/100.0).."%");end
		if nbjsh and nbjsh>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text",sl[ntype].attr.." "..nbjsh);end
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"nxlattr","text","尚未开启");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"sl_num","text",""..(util.ppn(player,const.PP_SHOULING_JINGHUA)).."/0");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlname","text","修炼已满");
		setTexiao(player,0);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"slneedyb","text","( 需 0 元宝 )"); 
	end

	local pslv = nslv - 6;
	if pslv > 0 then
		local psid,ptype,plevel,pdc,pdc2,pmc,pmc2,psc,psc2,pac,pac2,pmac,pmac2,php,pmp,pbjjl,pbjsh,pfight,pneed = player:get_shouling_data(pslv);
		if pdc2 and pdc2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..pdc.."-"..pdc2);end
		if pmc2 and pmc2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..pmc.."-"..pmc2);end
		if psc2 and psc2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..psc.."-"..psc2);end
		if pac2 and pac2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..pac.."-"..pac2);end
		if pmac2 and pmac2>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..pmac.."-"..pmac2);end
		if php and php>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..php);end
		if pbjjl and pbjjl>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..(pbjjl/100.0).."%");end
		if pbjsh and pbjsh>0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text",sl[ptype].attr.." "..pbjsh);end
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"cxlattr","text","尚未激活");
	end
	
	local xxxx = newgui.zuoqi.get_shouling_plus(player);

	for i=1,6 do
		local jj = jie;
		local tt = i;
		if i > point then jj=jj-1;end
		--if i <= point then jj = jie + 1; end
		player:set_panel_data(PANEL_ACTIONSET_NAME,"slzq"..i,"text","(+"..xxxx.."%)");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"sl_tb"..i,"text",sl[i].name.."LV"..(jj+1));
		if i == 6 then
			if jie > 0 or point >= i then
				local id,typ,level,dc,dc2,mc,mc2,sc,sc2,ac,ac2,mac,mac2,hp,mp,bjjl,bjsh,fight,need = player:get_shouling_data(jj*6+i);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr1","text",""..dc.."-"..dc2);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr1","text","0");
			end
		end
		if i == 1 then
			if jie > 0 or point >= i then
				local id,typ,level,dc,dc2,mc,mc2,sc,sc2,ac,ac2,mac,mac2,hp,mp,bjjl,bjsh,fight,need = player:get_shouling_data(jj*6+i);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr2","text",""..ac.."-"..ac2);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr2","text","0");
			end
		end
		if i == 2 then
			if jie > 0 or point >= i then
				local id,typ,level,dc,dc2,mc,mc2,sc,sc2,ac,ac2,mac,mac2,hp,mp,bjjl,bjsh,fight,need = player:get_shouling_data(jj*6+i);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr3","text",""..mac.."-"..mac2);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr3","text","0");
			end
		end
		if i == 3 then
			if jie > 0 or point >= i then
				local id,typ,level,dc,dc2,mc,mc2,sc,sc2,ac,ac2,mac,mac2,hp,mp,bjjl,bjsh,fight,need = player:get_shouling_data(jj*6+i);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr4","text",""..hp);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr4","text","0");
			end
		end
		if i == 4 then
			if jie > 0 or point >= i then
				local id,typ,level,dc,dc2,mc,mc2,sc,sc2,ac,ac2,mac,mac2,hp,mp,bjjl,bjsh,fight,need = player:get_shouling_data(jj*6+i);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr5","text",""..(bjjl/100.0).."%");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr5","text","0");
			end
		end
		if i == 5 then
			if jie > 0 or point >= i then
				local id,typ,level,dc,dc2,mc,mc2,sc,sc2,ac,ac2,mac,mac2,hp,mp,bjjl,bjsh,fight,need = player:get_shouling_data(jj*6+i);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr6","text",bjsh);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"slattr6","text","0");
			end
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function open_sl_panel(player)
	if  util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL) >= 8 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
		freshShouLingPanel(player);
	else
		player:alert(11,1,"坐骑等级达到8阶开启兽灵系统!");
	end
end

function setTexiao(player,num)
	for i=1,6 do
		if i == num then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"xiulian"..i,"visible","true");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"xiulian"..i,"visible","false");
		end
	end
	--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function setZuoqi(player,id)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"mcpreviewvatar","resMounts",id);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end