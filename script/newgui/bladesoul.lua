module(..., package.seeall)
local ACTIONSET_NAME="bladesoul";
local PANEL_ACTIONSET_NAME="panelbladesoul";

function getSwordTips(player,skill,ty,number)
	if skill == 0 then return "无需技能","";end
	if skill == 100 then return "普通攻击","附加"..number.."点固定伤害";end
	if skill == 104 then return "雷霆莲月","额外目标伤害+"..(number/100.0).."%"; end
	if skill == 103 then return "刺杀剑气","破盾效果提高"..(number/100.0).."%"; end
	if skill == 109 then return "奔雷剑法","冷却时间降低"..(number/100.0).."秒"; end
	if skill == 401 then return "火焰之球","暴击率提高"..(number/100.0).."%"; end
	if skill == 405 then return "天雷之术","附加"..number.."点固定伤害";end
	if skill == 409 then return "烈焰火墙","附加"..number.."点固定伤害";end
	if skill == 411 then return "雷光风暴","附加"..number.."点固定伤害";end
	if skill == 417 then return "烈焰火雨","附加"..number.."点固定伤害";end
	if skill == 504 then return "天魂灵符","附加"..number.."点固定伤害"; end
	if skill == 503 and ty == 2 then return "天尊之毒","每跳伤害提高"..number.."点"; end
	if skill == 503 and ty == 4 then return "天尊之毒","额外降低"..(number/100.00).."%防御"; end
	if skill == 518 then return "炎龙召唤","炎龙伤害提高"..number.."点"; end
end

function process_sword_logic(player,actionset,panelid,actionid,data)
	-- if string.sub(actionid,1,5) == "start" then
	-- 	local title = tonumber(string.sub(actionid,6));
	-- 	if title >= 1 and title <= 5 then
	-- 		doSwordNewLogic(player,title);
	-- 	end
	-- 	return;
	-- end
	if actionid == "upsword" then
		local title = tonumber(data[2]);
		local flag = tonumber(data[1]);
		if title >= 1 and title <= 5 then
			doSwordNewLogic(player,title,flag);
		end
		return;
	end
	if string.sub(actionid,1,5) == "btnjl" then
		local number = tonumber(string.sub(actionid,6));
		receive(player,number);
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_sword_logic);

function receive(player,index)
	for i=1,5 do
		if i == index then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"dtjl"..i,"visible","true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnjl"..i,"visible","false");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"clickjl"..i,"visible","true");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"dtjl"..i,"visible","false");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnjl"..i,"visible","true");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"clickjl"..i,"visible","false");
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	freshSwordPanel(player,index);
end
function doSwordLoginLogic(player)
	local slv = util.ppn(player,const.PP_SWORD_SLEVEL);
	if slv > 0 then
		player:set_sword_level(slv);
		player:recal_attr();
		--player:hpmp_full_fresh();
	end
end
login.add_login_listener(doSwordLoginLogic);

function doSwordNewLogic(player,tar,usevcoin)
	--测试注灵
	--player:set_param(const.PP_SWORD_LINGQI,util.ppn(player,const.PP_SWORD_LINGQI)+100000);

	local slv = util.ppn(player,const.PP_SWORD_SLEVEL);
	local liq = util.ppn(player,const.PP_SWORD_LINGQI);
	if slv >= 50 then player:alert(11,1,"您的剑灵等级已达上限!"); return; end
	local nslv = slv+1;

	local jie = math.floor(nslv/5);
	local point = nslv - 5*jie;
	local npoint = point +1;
	if npoint > 5 then npoint=1;end
	local nsid,nskilltype,ntype,nlevel,nparam1,nparam2,nparam3,nbaoji,nsubbaoji,nbaojl,nhp,nmp,nex,nfight,need = player:get_sword_data(nslv);
	if need then
		if liq >= need then
			player:set_param(const.PP_SWORD_LINGQI,liq-need);
			player:set_param(const.PP_SWORD_SLEVEL,nslv);
			player:set_sword_level(nslv);
			player:recal_attr();
			--player:hpmp_full_fresh();
			receive(player,npoint);
			freshSwordPanel(player,npoint);
			player:alert(11,1,"恭喜您注灵成功!");
			return;
		end
		if usevcoin == 1 then
			local vcoinNeed = need - liq
			newgui.minimap.reset_player_jianlingjj_info(player)
			if util.ppn(player,const.PP_JIANLINGJINJIE_TIMES) > 0 then
				if slv < 10 then
					vcoinNeed = math.floor(vcoinNeed * 0.95);					
				elseif slv >= 10 and slv < 20 then
					vcoinNeed = math.floor(vcoinNeed * 0.88);					
				elseif slv >= 20 then
					vcoinNeed = math.floor(vcoinNeed * 0.8);
				end
				--vcoinNeed = math.floor(vcoinNeed * 0.8)
			end
			if player:get_vcoin() >= vcoinNeed then
				if util.ppn(player,const.PP_JIANLINGJINJIE_TIMES) > 0 then
					player:set_param(const.PP_JIANLINGJINJIE_TIMES,util.ppn(player,const.PP_JIANLINGJINJIE_TIMES)-1);
					player:alert(11,1,"剩余剑灵特惠进阶次数："..util.ppn(player,const.PP_JIANLINGJINJIE_TIMES));
				end
				player:sub_vcoin(vcoinNeed,"jianling");
				player:set_param(const.PP_SWORD_LINGQI,0);
				player:set_param(const.PP_SWORD_SLEVEL,nslv);
				player:set_sword_level(nslv);
				player:recal_attr();
				--player:hpmp_full_fresh();
				receive(player,npoint);
				freshSwordPanel(player,npoint);
				player:alert(11,1,"消耗"..vcoinNeed.."元宝，恭喜您注灵成功！");
				return;
			else
				player:alert(11,1,"元宝不足"..vcoinNeed..",注灵失败!");
			end
		else
			player:alert(11,1,"您当前的灵气值不足"..need);
		end
	end
end

function freshSwordPanel(player,stype)
	local slv = util.ppn(player,const.PP_SWORD_SLEVEL);
	local jie = math.floor(slv/5);
	local point = slv - 5*jie;
	local npoint = point +1;
	if npoint > 5 then npoint=1;end
	if slv < 50 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"swfflag","y",32 + 85 * (npoint - 1));
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"swfflag","visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnLQ","text","剑灵等级已达上限");
	end
	local show = 5*jie+stype;
	if stype > point then
		show = 5*(jie-1)+stype;
	end

	local r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,fp,r15 = player:get_sword_data(slv);
	if fp then player:set_panel_data(PANEL_ACTIONSET_NAME,"fightpoint","point",fp);end

	local lr1,lr2,lr3,lr4,lr5,lr6,lr7,lr8,lr9,lr10,lr11,l12,lr13,lfp,lr15 = player:get_sword_data(slv+1);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtcLQ","text",util.ppn(player,const.PP_SWORD_LINGQI));
	if slv >= 50 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtcLQ","text",util.ppn(player,const.PP_SWORD_LINGQI));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtVcoin","text"," ");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnLQ","text",(lr15 or ""));
		local vcoinNeed = lr15 - util.ppn(player,const.PP_SWORD_LINGQI);
		newgui.minimap.reset_player_jianlingjj_info(player);
		
		if util.ppn(player,const.PP_JIANLINGJINJIE_TIMES) > 0 then
			if slv < 10 then
				vcoinNeed = math.floor(vcoinNeed * 0.95);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul1","visible","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul2","visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul3","visible","false");
			elseif slv >= 10 and slv < 20 then
				vcoinNeed = math.floor(vcoinNeed * 0.88);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul1","visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul2","visible","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul3","visible","false");
			elseif slv >= 20 then
				vcoinNeed = math.floor(vcoinNeed * 0.8);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul1","visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul2","visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul3","visible","true");
			end
			--vcoinNeed = math.floor(vcoinNeed * 0.8)

		else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul1","visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul2","visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"discountbladesoul3","visible","false");
		end
		if vcoinNeed > 0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtVcoin","text","消耗"..vcoinNeed.."元宝");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtVcoin","text"," ");
		end
	end
	local csid,cskilltype,ctype,clevel,cparam1,cparam2,cparam3,cbaoji,csubji,cbjjl,chp,cmp,crx,cfight,cneed = player:get_sword_data(show);
	local nshow = show+5;
	local nsid,nskilltype,ntype,nlevel,nparam1,nparam2,nparam3,nbaoji,nsubji,nbjjl,nhp,nmp,nrx,nfight,nneed = player:get_sword_data(nshow);
	if slv < stype then
		local nsid,nskilltype,ntype,nlevel,nparam1,nparam2,nparam3,nbaoji,nsubji,nbjjl,nhp,nmp,nrx,nfight,nneed = player:get_sword_data(stype);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr2","text","技能效果尚未激活");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr3","text","属性效果尚未激活");
		local s2tr1,s2tr2 = getSwordTips(player,nskilltype,stype,nparam2);--技能，技能效果
		local s3tr1,s3tr2 = getSwordTips(player,nskilltype,stype,nparam3);
		if s2tr1 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr1","text","增强技能:"..s2tr1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr1","text","增强技能:"..s2tr1);
		end
		if nparam1 and nparam1 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果:附加"..nparam1.."点固定伤害"); end
		if nparam2 and nparam2 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果:"..s2tr2); end
		if nparam3 and nparam3 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果:"..s3tr2);end
		if nbaoji and nbaoji > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:暴击伤害+"..nbaoji); end
		if nsubji and nsubji > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:暴伤减免+"..nsubji); end
		if nhp and nhp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:生命上限+"..nhp); end
		if nmp and nmp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr4","text","属性效果:魔法上限+"..nmp); end
		if nrx and nrx > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:韧性提升+"..(nrx/100).."%"); end
		if nbjjl and nbjjl > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:暴击+"..(nbjjl/100).."%"); end
	else
		local s2tr1,s2tr2 = getSwordTips(player,cskilltype,stype,cparam2);
		local s3tr1,s3tr2 = getSwordTips(player,cskilltype,stype,cparam3);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr1","text","增强技能:"..s2tr1);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr1","text","增强技能:"..s2tr1);
		if cparam1 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr2","text","技能效果:附加"..cparam1.."点固定伤害"); end
		if cparam2 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr2","text","技能效果:"..s2tr2); end
		if cparam3 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr2","text","技能效果:"..s3tr2); end
		if cbaoji > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr3","text","属性效果:暴击伤害+"..cbaoji); end
		if csubji > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr3","text","属性效果:暴伤减免+"..csubji); end
		if chp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr3","text","属性效果:生命上限+"..chp); end
		if cmp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr4","text","属性效果:魔法上限+"..cmp); end
		if cbjjl > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr3","text","属性效果:暴击+"..(cbjjl/100).."%"); end
		if crx > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr3","text","属性效果:韧性提升+"..(crx/100).."%"); end
		if nshow > 50 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果已达上限");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果已达上限");
		else
			local ns2tr1,ns2tr2 = getSwordTips(player,nskilltype,stype,nparam2);
			local ns3tr1,ns3tr2 = getSwordTips(player,nskilltype,stype,nparam3);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"c"..stype.."attr1","text","增强技能:"..ns2tr1);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr1","text","增强技能:"..ns2tr1);

			if nparam1 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果:附加"..nparam1.."点固定伤害"); end
			if nparam2 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果:"..ns2tr2); end
			if nparam3 > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr2","text","技能效果:"..ns3tr2); end
			if nbaoji > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:暴击伤害+"..nbaoji); end
			if nsubji > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:暴伤减免+"..nsubji); end
			if nhp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:生命上限+"..nhp); end
			if nmp > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr4","text","属性效果:魔法上限+"..nmp); end
			if nrx > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:韧性提升+"..(nrx/100).."%"); end
			if nbjjl > 0 then player:set_panel_data(PANEL_ACTIONSET_NAME,"n"..stype.."attr3","text","属性效果:暴击+"..(nbjjl/100).."%"); end
		end
	end
	for i=1,5 do
		if i > point then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"swlv"..i,"point",jie);
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"swlv"..i,"point",1+jie);
		end
		if i == stype then
		 	player:set_panel_data(PANEL_ACTIONSET_NAME,"mcadd"..i,"visible","true");
		 	player:set_panel_data(PANEL_ACTIONSET_NAME,"swlv"..i,"visible","true");
		--else
		 --	player:set_panel_data(PANEL_ACTIONSET_NAME,"mcadd"..i,"visible","false");
		 --	player:set_panel_data(PANEL_ACTIONSET_NAME,"swlv"..i,"visible","false");
		end
		if i == npoint and jie ~= 10 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"start"..i,"visible","true");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"start"..i,"visible","false");
		end
	end
	if slv >= 50 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnVcoin","visible","false");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function open_sword_panel(player)
	local slv = util.ppn(player,const.PP_SWORD_SLEVEL);
	local liq = util.ppn(player,const.PP_SWORD_LINGQI);
	local jie = math.floor(slv/5);
	local point = slv - 5*jie;
	local npoint = point +1;
	if npoint > 5 then npoint=1;end
	player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
	receive(player,npoint);
end