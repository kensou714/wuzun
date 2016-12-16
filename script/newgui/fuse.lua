module(..., package.seeall)
local ACTIONSET_NAME="fuse";
local PANEL_ACTIONSET_NAME="panelfuse";

--材料合成面板
--表数据说明：[物品id]={物品名称,合成几率,消耗金币,消耗绑定金币,目标物品id,目标物品名称}
local hc_data={
--	[10060]={name="一级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10061,target_name="二级力量石",},
--	[10061]={name="二级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10062,target_name="三级力量石",},
--	[10062]={name="三级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10063,target_name="四级力量石",},
--	[10063]={name="四级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10064,target_name="五级力量石",},
--	[10064]={name="五级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10065,target_name="六级力量石",},
--	[10065]={name="六级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10066,target_name="七级力量石",},
--	[10066]={name="七级力量石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10067,target_name="八级力量石",},
--	[10105]={name="一级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10106,target_name="二级魔法石",},
--	[10106]={name="二级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10107,target_name="三级魔法石",},
--	[10107]={name="三级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10108,target_name="四级魔法石",},
--	[10108]={name="四级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10109,target_name="五级魔法石",},
--	[10109]={name="五级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10110,target_name="六级魔法石",},
--	[10110]={name="六级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10111,target_name="七级魔法石",},
--	[10111]={name="七级魔法石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10112,target_name="八级魔法石",},
--	[10113]={name="一级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10114,target_name="二级精神石",},
--	[10114]={name="二级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10115,target_name="三级精神石",},
--	[10115]={name="三级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10116,target_name="四级精神石",},
--	[10116]={name="四级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10117,target_name="五级精神石",},
--	[10117]={name="五级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10118,target_name="六级精神石",},
--	[10118]={name="六级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10119,target_name="七级精神石",},
--	[10119]={name="七级精神石",neednum=5,game_money=10000,game_money_bind=10000,target_id=10120,target_name="八级精神石",},
--	[10135]={name="一级宝石",neednum=3,game_money=1000,game_money_bind=1000,target_id=10136,target_name="二级宝石",},
--	[10136]={name="二级宝石",neednum=3,game_money=3000,game_money_bind=3000,target_id=10137,target_name="三级宝石",},
--	[10137]={name="三级宝石",neednum=3,game_money=9000,game_money_bind=9000,target_id=10138,target_name="四级宝石",},
--	[10138]={name="四级宝石",neednum=3,game_money=27000,game_money_bind=27000,target_id=10139,target_name="五级宝石",},
--	[10139]={name="五级宝石",neednum=3,game_money=81000,game_money_bind=81000,target_id=10140,target_name="六级宝石",},
--	[10140]={name="六级宝石",neednum=3,game_money=162000,game_money_bind=162000,target_id=10141,target_name="七级宝石",},
--	[10141]={name="七级宝石",neednum=3,game_money=324000,game_money_bind=324000,target_id=10142,target_name="八级宝石",},
--	[10142]={name="八级宝石",neednum=3,game_money=648000,game_money_bind=648000,target_id=10143,target_name="九级宝石",},
--	[10143]={name="九级宝石",neednum=3,game_money=1296000,game_money_bind=1296000,target_id=10144,target_name="十级宝石",},
--	[10144]={name="十级宝石",neednum=3,game_money=2592000,game_money_bind=2592000,target_id=10145,target_name="十一级宝石",},
--	[10145]={name="十一级宝石",neednum=3,game_money=5184000,game_money_bind=5184000,target_id=10146,target_name="十二级宝石",},
	[15004]={name="双倍宝典",neednum=5,game_money=20000,game_money_bind=20000,target_id=15007,target_name="四倍宝典",},
	[15005]={name="双倍宝典(3小时)",neednum=5,game_money=20000,game_money_bind=20000,target_id=15008,target_name="四倍宝典(3小时)",},
	[15006]={name="双倍宝典(8小时)",neednum=5,game_money=20000,game_money_bind=20000,target_id=15009,target_name="四倍宝典(8小时)",},
	[15007]={name="四倍宝典",neednum=5,game_money=20000,game_money_bind=20000,target_id=15010,target_name="八倍宝典",},
	[15008]={name="四倍宝典(3小时)",neednum=5,game_money=20000,game_money_bind=20000,target_id=15031,target_name="八倍宝典(3小时)",},
	[15009]={name="四倍宝典(8小时)",neednum=5,game_money=20000,game_money_bind=20000,target_id=15032,target_name="八倍宝典(8小时)",},
	[10074]={name="青铜镖令",neednum=5,game_money=20000,game_money_bind=20000,target_id=10075,target_name="黄金镖令",},
	[10075]={name="黄金镖令",neednum=5,game_money=20000,game_money_bind=20000,target_id=10076,target_name="蓝玉镖令",},
	[10076]={name="蓝玉镖令",neednum=5,game_money=20000,game_money_bind=20000,target_id=10077,target_name="紫金镖令",},
	[10078]={name="女儿红",neednum=5,game_money=20000,game_money_bind=20000,target_id=10079,target_name="女儿红(5年)",},
	[10079]={name="女儿红(5年)",neednum=5,game_money=20000,game_money_bind=20000,target_id=10080,target_name="女儿红(10年)",},
	[10080]={name="女儿红(10年)",neednum=5,game_money=20000,game_money_bind=20000,target_id=10081,target_name="女儿红(20年)",},
	[15024]={name="初级英雄帖",neednum=5,game_money=20000,game_money_bind=20000,target_id=15025,target_name="中级英雄帖",},
	[15025]={name="中级英雄帖",neednum=5,game_money=20000,game_money_bind=20000,target_id=15026,target_name="高级英雄帖",},
	[15026]={name="高级英雄帖",neednum=5,game_money=20000,game_money_bind=20000,target_id=15027,target_name="超级英雄帖",},
	[10192]={name="一级灵珠",neednum=5,game_money=0,game_money_bind=0,target_id=10193,target_name="二级灵珠",},
	[10193]={name="二级灵珠",neednum=5,game_money=0,game_money_bind=0,target_id=10194,target_name="三级灵珠",},
	[10194]={name="三级灵珠",neednum=5,game_money=0,game_money_bind=0,target_id=10195,target_name="四级灵珠",},
	[10195]={name="四级灵珠",neednum=5,game_money=0,game_money_bind=0,target_id=10196,target_name="五级灵珠",},
	[10196]={name="五级灵珠",neednum=5,game_money=0,game_money_bind=0,target_id=10197,target_name="六级灵珠",},
	[10197]={name="六级灵珠",neednum=5,game_money=0,game_money_bind=0,target_id=10198,target_name="七级灵珠",},
};

function process_fuse(player,actionset,panelid,actionid,data)
	---装备铸魂
	if actionid=="btnzhuhunlist" then
		fresh_zhuhun(player);
		player:push_ckpanel_data("fuse","panelfuse");
		return;
	end
	if actionid=="btnCH" then
		zhuangbeichouhun(player,data);
		return;
	end
	if actionid=="btnZHhuidiao" then
		fresh_zhuhun_jiexing(player,data);
		player:push_ckpanel_data("fuse","panelfuse");
		return;
	end
	if actionid == "btnGM" then
		process_hc(player,1);
		return;
	end
	if actionid == "btnBGM" then
		process_hc(player,2);
		return;
	end
	if actionid == "materia" then
		item.panel.hecheng(player);
		if data then
			--local number = #data;--这里data只是一组数据--pos--id--number
			local original_pos = tonumber(data[1]);if not original_pos then original_pos=0;end
			local original_id = tonumber(data[2]);if not original_id then original_id=0;end
			local original_number = tonumber(data[3]);if not original_number then original_number=0;end
			player:set_temp_param(const.PTP_ID_HC_POS,original_pos);
			player:set_temp_param(const.PTP_ID_HC_ID,original_id);
			player:set_temp_param(const.PTP_ID_HC_NUM,original_number);
			if original_id > 0 and original_number > 0 then
				local tar_data = hc_data[original_id];
				if tar_data then
					calculate_cost(player,original_id,original_number);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"itemMatLook","typeid",tar_data.target_id);
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatJL","text","100%");
					player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"itemMatLook","typeid","0");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatJL","text","0%");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatGM","text","0");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatBGM","text","0");
					player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
					player:alert(1,1,"该物品不可以合成!");
				end
			end
		end
		return;
	end
	if actionid == "huishou" then
		process_huishou(player,data);return;
	end
	if actionid == "pushHS" then
		item.panel.huishou(player);
		process_showinfo(player,data);return;
	end
	-------------------------------祈灵---------------------------
	if actionid == "qiling" then
		process_zt_qiling(player,data);return;
	end
	-------------------------------强化---------------------------
	if actionid == "qianghua" then
		process_qianghua(player,data);return;
	end
	--------------------------------------------------------------
	if actionid == "jinsheng" then
		--process_jinsheng(player,data);return;
	end
	if actionid == "js_equip" then
		item.panel.lingzhu(player)
		fresh_jinsheng_info(player,data);return;
	end
	-------------------------------精炼---------------------------
	if actionid == "jinglian" then
		process_jinglian(player,data);return;
	end
	--------------------------------------------------------------
end
ckpanel.add_listener(ACTIONSET_NAME,process_fuse);
--------------------------------------------------------------------------------精炼
function process_jinglian(player,data)
	if --[[activity.isBaifuSjieOpen() or]] newgui.jingcaihuodong.isOpenActivity(player,"bshcsd") then
 		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtJingLianAdd","text","+ 20%");
 	else
 		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtJingLianAdd","text","");
 	end
	item.panel.jinglian(player);
end 
--------------------------------------------------------------------------------强化
--[[function process_qianghua_info(player,data)
	if not data then return; end
	if #data == 6 or #data == 9 then
		local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		local cl_pos = tonumber(data[4]);local cl_id = tonumber(data[5]);local cl_num = tonumber(data[6]);
		local fu_pos,fu_id,fu_num=0;
		local qhprob,fuprob,qhmoney = 0;
		if #data == 9 then
			fu_pos = tonumber(data[7]);fu_id = tonumber(data[8]);fu_num = tonumber(data[9]);
			if fu_pos and fu_id and fu_num then
				local name2,ac2,acmax2,mac2,macmax2,dc2,dcmax2,mc2,mcmax2,sc2,scmax2=player:get_item_base_data(fu_id);
				if ac2 then fuprob = ac2; end
			end
		end
		if eq_pos and eq_id and eq_num and yu_pos and yu_id and yu_num then else return;end
		local name,ac,acmax,mac,macmax,dc,dcmax,mc,mcmax,sc,scmax=player:get_item_base_data(cl_id);
		if mac and macmax then
			qhprob = mac + fuprob;
			qhmoney = macmax;
		end
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtQHSucProb","text",qhprob.."%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"qhNeedJb","text",qhmoney);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtQHSucProb","text","0%");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"qhNeedJb","text",0);
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
]]--
function process_qianghua(player,data)
	if player:get_task_state(1102) == 1 then
		player:set_task_state(1102,2); player:push_task_data(1102,0);
		player:add_exp(100000);
		player:alert(10,1,"成功完成<font color='#ff0000'>装备强化任务!</font>")
		player:alert(10,0,"经验值增加: <font color='#ff0000'>100000</font>")
		if util.ppn(player,const.PP_XINFA_LEVEL) <= 0 then
			player:set_task_state(1103,1); player:push_task_data(1103,0);--心法
		else
			if util.ppn(player,const.PP_SHENQI_XINGLV) <= 0 then
				player:set_task_state(1105,1); player:push_task_data(1105,0);--神器
			else
				if player:achieve_get_param(1004) <= 0 then
					player:set_task_state(1106,1); player:push_task_data(1106,0);--行会
				end
			end
		end
	end
	--强化的逻辑已经直接从客户端做到服务器
	--[[if not data then return; end
	if #data == 6 or #data == 9 then
		local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		local cl_pos = tonumber(data[4]);local cl_id = tonumber(data[5]);local cl_num = tonumber(data[6]);
		local fu_pos,fu_id,fu_num=9999;
		if #data == 9 then
			fu_pos = tonumber(data[7]);fu_id = tonumber(data[8]);fu_num = tonumber(data[9]);
		end
		if eq_pos and eq_id and eq_num and cl_pos and cl_id and cl_num then else return;end
		----------------------
		player:equip_upgrade(eq_pos,cl_pos,fu_pos,100);
		----------------------
	else
		if #data == 3 then
			player:alert(1,1,"请放入强化石进行强化!");return;
		end
		if #data == 0 then
			player:alert(1,1,"请放入装备与强化石(合成符)进行强化!");return;
		end
	end
	]]
end
--------------------------------------------------------------------------------合成
function calculate_cost(player,id,number)
	local tar_data = hc_data[id];
	if tar_data then
		local need_number = tar_data.neednum;
		if number >= need_number then
			local need_number = tar_data.neednum;
			local max_num = math.floor(number/need_number);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatGM","text",tar_data.game_money*max_num);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatBGM","text",tar_data.game_money_bind*max_num);
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatGM","text",0);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatBGM","text",0);
		end
		--player:set_panel_data(PANEL_ACTIONSET_NAME,"hcBaseNum","text",""..need_number);
	end
end

function process_hc(player,flag)
	local original_pos = util.ptpn(player,const.PTP_ID_HC_POS);
	local original_id = util.ptpn(player,const.PTP_ID_HC_ID);
	local original_number = util.ptpn(player,const.PTP_ID_HC_NUM);
	--print(original_pos,original_id,original_number,flag)
	if original_pos and original_id and original_number then else return; end
	local hc_item = player:get_item(original_id,original_pos);if hc_item then else return; end;
	local tar_data = hc_data[original_id];
	if hc_item and tar_data then
		local need_number = tar_data.neednum;
		local item_bind = hc_item:check_bind();
		if player:num_bag_black() < 1 then player:alert(1,1,"背包不足1格,无法进行合成!");return; end
		local clmax_num = math.floor(original_number/need_number);
		if clmax_num > 0 and player:num_item(original_id,1,item_bind) >= need_number*clmax_num then
			local ok = false;
			local bind_flag = 0;
			if flag == 1 then
				if player:get_gamemoney() >= tar_data.game_money*clmax_num then
					player:sub_gamemoney(tar_data.game_money*clmax_num);ok = true;
				else
					local gm_num =  math.floor(player:get_gamemoney()/tar_data.game_money);
					if gm_num > 0 then
						clmax_num = gm_num;
						player:sub_gamemoney(tar_data.game_money*clmax_num);ok = true;
					else
						player:alert(1,1,"金币不足!");return;
					end
				end
			end
			if flag == 2 then
				if player:get_gamemoney_bind() >= tar_data.game_money_bind*clmax_num then
					player:sub_gamemoney_bind(tar_data.game_money_bind*clmax_num)ok = true;bind_flag = 1;
				else
					local gmb_num = math.floor(player:get_gamemoney_bind()/tar_data.game_money_bind);
					if gmb_num > 0 then
						clmax_num = gmb_num;
						player:sub_gamemoney_bind(tar_data.game_money_bind*clmax_num);ok = true;bind_flag = 1;
					else
						player:alert(1,1,"绑定金币不足!");return;
					end
				end
			end
			if ok then
				if item_bind == 1 then bind_flag = 1;end
				if player:remove_item(tar_data.name,need_number*clmax_num,item_bind) >= need_number*clmax_num then
					player:set_temp_param(const.PTP_ID_HC_NUM,original_number-need_number*clmax_num);
					player:add_item_log(tar_data.target_name,240,clmax_num,bind_flag);
					player:alert(1,1,"合成成功,获得了"..clmax_num.."个"..tar_data.target_name);
				end
				if player:num_item(original_id) <= 0 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"itemMatLook","typeid","0");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatJL","text","0%");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatGM","text","0");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtMatBGM","text","0");
					player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
				end
			end
		else
			player:alert(1,1,tar_data.name.."不足"..need_number.."个,无法合成.");
		end
	else
		player:alert(1,1,"该物品不可以合成!");
	end
end
---------------------------------------------------祈灵-----------------------------------------------
--表数据说明：[可以祈灵装备的id]={装备名称,最大祈灵属性点,几率,增加属性}
local ql_jv_data={
	[0]={up=50,down=0,},
	[1]={up=50,down=20,},
	[2]={up=50,down=30,},
	[3]={up=40,down=40,},
	[4]={up=40,down=50,},
	[5]={up=40,down=50,},
	[6]={up=40,down=50,},
	[7]={up=30,down=50,},
	[8]={up=25,down=50,},
	[9]={up=20,down=50,},
};
function check_item_type(id)
	if id < 20000 then return 0; end
	if id >= 20001 and id <= 109999 then
		if id >= 80001 and id <= 89999 then
			return 2;--xunzhang
		else
			return 1;
		end
	else
		if id >= 110001 and id <= 119999 then
			return 3;--hunqi
		else
			return 4;
		end
	end
end
function check_item_jp(player,item)
	if not item then return 0;end
	if player:get_job_name() == "warrior" then
		return item:get_adddc();
	end
	if player:get_job_name() == "wizard" then
		return item:get_addmc();
	end
	if player:get_job_name() == "taoist" then
		return item:get_addsc();
	end 
end
function process_zt_qiling(player,data)
	if data and #data == 6 then
		local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		local yu_pos = tonumber(data[4]);local yu_id = tonumber(data[5]);local yu_num = tonumber(data[6]);
		if eq_pos and eq_id and eq_num and yu_pos and yu_id and yu_num then else return;end
		local eq_item = player:get_item(eq_id,eq_pos);if eq_item then else player:alert(1,1,"请放入装备进行祈灵."); return; end;
		local yu_item = player:get_item(yu_id,yu_pos);if yu_item then else player:alert(1,1,"请放入祈灵玉."); return; end;
		if eq_item and yu_item then
			if yu_item:get_number() <= 0 or player:num_item("祈灵玉") <= 0 then return; end
			if check_item_type(eq_id) >= 1 and check_item_type(eq_id) <= 4 then
				-----------------------------------------------------------------------
				local result = player:equip_rerand(eq_pos,yu_pos);
				if result == 0 then
					if util.ppn(player,const.PP_ACHIEVE_FIRSTQLING) == 0 then
						player:set_param(const.PP_ACHIEVE_FIRSTQLING,10)
						player:alert(11,1,"恭喜您成功完成目标:第一次祈灵!");
						newgui.achieve.fresh_achieve_title(player,1);
					end
					if  util.ppn(player,const.PP_JC_MRQLHL_TIME) ~= today() then
						player:set_param(const.PP_JC_MRQLHL_TIME,today());
						player:set_param(const.PP_JC_MRQLHL,1);
					else
						player:set_param(const.PP_JC_MRQLHL,util.ppn(player,const.PP_JC_MRQLHL)+1);
					end
				end
				-----------------------------------------------------------------------
			else
				player:alert(1,1,"该物品不能祈灵.");return;
			end
		end
	else
		if #data == 3 then
			player:alert(1,1,"缺少祈灵玉,不能祈灵!");return;
		end
		if #data == 0 then
			player:alert(1,1,"请放入祈灵装备与祈灵玉!");return;
		end
	end
end
--
function process_qiling(player,data)
	if data and #data == 6 then
		local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		local yu_pos = tonumber(data[4]);local yu_id = tonumber(data[5]);local yu_num = tonumber(data[6]);
		if eq_pos and eq_id and eq_num and yu_pos and yu_id and yu_num then else return;end
		local eq_item = player:get_item(eq_id,eq_pos);if eq_item then else player:alert(1,1,"请放入装备进行祈灵."); return; end;
		local yu_item = player:get_item(yu_id,yu_pos);if yu_item then else player:alert(1,1,"请放入祈灵玉."); return; end;
		if eq_item and yu_item then
			if yu_item:get_number() <= 0 or player:num_item("祈灵玉") <= 0 then return; end
			if check_item_type(eq_id) == 1 then
				-----------------------------------------------------------------------
				local name,ac,acmax,mac,macmax,dc,dcmax,mc,mcmax,sc,scmax=player:get_item_base_data(eq_id);
				if dcmax <= 0 and mcmax <= 0 and scmax <= 0 then
					player:alert(1,1,"该物品不可祈灵.");return;
				end
				local cur_jp_lv = check_item_jp(player,eq_item);
				if cur_jp_lv >= 10 then
					player:alert(1,1,"物品的极品属性已经达到最大值,不需要继续祈灵!");return;
				end
				--处理祈灵的逻辑
				player:remove_item("祈灵玉",1);

				local ql_jl = ql_jv_data[cur_jp_lv]; if not ql_jl then return; end
				local r = math.random(1,100);
				if r <= ql_jl.up then
					eq_item:set_jipin(1);
					if dcmax > 0  then cur_jp=eq_item:get_adddc();eq_item:set_adddc(cur_jp+1);end
					if mcmax > 0 then cur_jp=eq_item:get_addmc();eq_item:set_addmc(cur_jp+1);end
					if scmax > 0 then cur_jp=eq_item:get_addsc();eq_item:set_addsc(cur_jp+1);end
					player:fresh_item_info(eq_pos,eq_id);
					player:alert(10,0,"祈灵成功,当前极品属性为[<font color='#ff0000'>"..(cur_jp+1).."</font>]点!");return;
				else
					local r2 = math.random(1,100);
					if r2 <= ql_jl.down then
						if dcmax > 0  then cur_jp=eq_item:get_adddc();if cur_jp > 1 then eq_item:set_adddc(cur_jp-1);end end
						if mcmax > 0 then cur_jp=eq_item:get_addmc();if cur_jp > 1 then eq_item:set_addmc(cur_jp-1);end end
						if scmax > 0 then cur_jp=eq_item:get_addsc();if cur_jp > 1 then eq_item:set_addsc(cur_jp-1);end end
						player:fresh_item_info(eq_pos,eq_id);
						player:alert(10,0,"祈灵失败,极品属性降低1点!");return;
					else
						player:alert(10,0,"祈灵无效!");return;
					end
				end
				if  util.ppn(player,const.PP_JC_MRQLHL_TIME) ~= today() then
					player:set_param(const.PP_JC_MRQLHL_TIME,today());
					player:set_param(const.PP_JC_MRQLHL,1);
				else
					player:set_param(const.PP_JC_MRQLHL,util.ppn(player,const.PP_JC_MRQLHL)+1);
				end
				
				--处理祈灵的逻辑
				-----------------------------------------------------------------------
			else
				player:alert(1,1,"该物品不能祈灵.");return;
			end
		end
	else
		if #data == 3 then
			player:alert(1,1,"缺少祈灵玉,不能祈灵!");return;
		end
		if #data == 0 then
			player:alert(1,1,"请放入祈灵装备与祈灵玉!");return;
		end
	end
end
---------------------------------------------------回收-----------------------------------------------
item_award = { 
	["20105"]={jy=10000,hunshi=5,gold=3000},
	["20106"]={jy=25000,hunshi=10,gold=4000},
	["20107"]={jy=50000,hunshi=20,gold=5000},
	["20204"]={jy=10000,hunshi=5,gold=3000},
	["20205"]={jy=25000,hunshi=10,gold=4000},
	["20206"]={jy=50000,hunshi=20,gold=5000},
	["20305"]={jy=25000,hunshi=10,gold=3000},
	["20306"]={jy=50000,hunshi=20,gold=5000},
	["20400"]={jy=100000,hunshi=40,gold=10000},
	["20401"]={jy=100000,hunshi=40,gold=10000},
	["20402"]={jy=100000,hunshi=40,gold=10000},
	["20403"]={jy=200000,hunshi=80,gold=20000},
	["20404"]={jy=200000,hunshi=80,gold=20000},
	["20405"]={jy=200000,hunshi=80,gold=20000},
	["20406"]={jy=400000,hunshi=160,gold=30000},
	["20407"]={jy=400000,hunshi=160,gold=30000},
	["20408"]={jy=400000,hunshi=160,gold=30000},
	["20409"]={jy=800000,hunshi=320,gold=40000},
	["20410"]={jy=800000,hunshi=320,gold=40000},
	["20411"]={jy=800000,hunshi=320,gold=40000},
	["20412"]={jy=1200000,hunshi=640,gold=50000},
	["20413"]={jy=1200000,hunshi=640,gold=50000},
	["20414"]={jy=1200000,hunshi=640,gold=50000},
	["20427"]={jy=1500000,hunshi=960,gold=60000},
	["20428"]={jy=1500000,hunshi=960,gold=60000},
	["20429"]={jy=1500000,hunshi=960,gold=60000},
	["21000"]={jy=75000,hunshi=30,gold=75000},
	["21001"]={jy=75000,hunshi=30,gold=75000},
	["21002"]={jy=75000,hunshi=30,gold=75000},
	["21403"]={jy=300000,hunshi=120,gold=32000},
	["21404"]={jy=300000,hunshi=120,gold=32000},
	["21405"]={jy=300000,hunshi=120,gold=32000},
	["30010"]={jy=30000,hunshi=10,gold=8000},
	["30011"]={jy=30000,hunshi=10,gold=8000},
	["30012"]={jy=30000,hunshi=10,gold=8000},
	["35010"]={jy=30000,hunshi=10,gold=8000},
	["35011"]={jy=30000,hunshi=10,gold=8000},
	["35012"]={jy=30000,hunshi=10,gold=8000},
	["30013"]={jy=75000,hunshi=30,gold=10000},
	["30014"]={jy=75000,hunshi=30,gold=10000},
	["30015"]={jy=75000,hunshi=30,gold=10000},
	["35013"]={jy=75000,hunshi=30,gold=10000},
	["35014"]={jy=75000,hunshi=30,gold=10000},
	["35015"]={jy=75000,hunshi=30,gold=10000},
	["30016"]={jy=150000,hunshi=60,gold=15000},
	["30017"]={jy=150000,hunshi=60,gold=15000},
	["30018"]={jy=150000,hunshi=60,gold=15000},
	["35016"]={jy=150000,hunshi=60,gold=15000},
	["35017"]={jy=150000,hunshi=60,gold=15000},
	["35018"]={jy=150000,hunshi=60,gold=15000},
	["30019"]={jy=300000,hunshi=120,gold=30000},
	["30020"]={jy=300000,hunshi=120,gold=30000},
	["30021"]={jy=300000,hunshi=120,gold=30000},
	["35019"]={jy=300000,hunshi=120,gold=30000},
	["35020"]={jy=300000,hunshi=120,gold=30000},
	["35021"]={jy=300000,hunshi=120,gold=30000},
	["30022"]={jy=600000,hunshi=240,gold=40000},
	["30023"]={jy=600000,hunshi=240,gold=40000},
	["30024"]={jy=600000,hunshi=240,gold=40000},
	["35022"]={jy=600000,hunshi=240,gold=40000},
	["35023"]={jy=600000,hunshi=240,gold=40000},
	["35024"]={jy=600000,hunshi=240,gold=40000},
	["30025"]={jy=900000,hunshi=480,gold=50000},
	["30026"]={jy=900000,hunshi=480,gold=50000},
	["30027"]={jy=900000,hunshi=480,gold=50000},
	["35025"]={jy=900000,hunshi=480,gold=50000},
	["35026"]={jy=900000,hunshi=480,gold=50000},
	["35027"]={jy=900000,hunshi=480,gold=50000},
	["30040"]={jy=1200000,hunshi=720,gold=60000},
	["30041"]={jy=1200000,hunshi=720,gold=60000},
	["30042"]={jy=1200000,hunshi=720,gold=60000},
	["35040"]={jy=1200000,hunshi=720,gold=60000},
	["35041"]={jy=1200000,hunshi=720,gold=60000},
	["35042"]={jy=1200000,hunshi=720,gold=60000},
	["31013"]={jy=100000,hunshi=45,gold=10000},
	["31014"]={jy=100000,hunshi=45,gold=10000},
	["31015"]={jy=100000,hunshi=45,gold=10000},
	["36013"]={jy=100000,hunshi=45,gold=10000},
	["36014"]={jy=100000,hunshi=45,gold=10000},
	["36015"]={jy=100000,hunshi=45,gold=10000},
	["40011"]={jy=10000,hunshi=10,gold=4000},
	["40012"]={jy=10000,hunshi=10,gold=4000},
	["40013"]={jy=10000,hunshi=10,gold=4000},
	["40014"]={jy=25000,hunshi=20,gold=5000},
	["40015"]={jy=25000,hunshi=20,gold=5000},
	["40016"]={jy=25000,hunshi=20,gold=5000},
	["40017"]={jy=50000,hunshi=40,gold=7000},
	["40018"]={jy=50000,hunshi=40,gold=7000},
	["40019"]={jy=50000,hunshi=40,gold=7000},
	["40020"]={jy=100000,hunshi=60,gold=8500},
	["40021"]={jy=100000,hunshi=60,gold=8500},
	["40022"]={jy=100000,hunshi=60,gold=8500},
	["40023"]={jy=200000,hunshi=120,gold=10000},
	["40024"]={jy=200000,hunshi=120,gold=10000},
	["40025"]={jy=200000,hunshi=120,gold=10000},
	["40026"]={jy=400000,hunshi=240,gold=12000},
	["40027"]={jy=400000,hunshi=240,gold=12000},
	["40028"]={jy=400000,hunshi=240,gold=12000},
	["40029"]={jy=600000,hunshi=360,gold=15000},
	["40030"]={jy=600000,hunshi=360,gold=15000},
	["40031"]={jy=600000,hunshi=360,gold=15000},
	["40032"]={jy=800000,hunshi=480,gold=18000},
	["40033"]={jy=800000,hunshi=480,gold=18000},
	["40034"]={jy=800000,hunshi=480,gold=18000},
	["40035"]={jy=1000000,hunshi=600,gold=21000},
	["40036"]={jy=1000000,hunshi=600,gold=21000},
	["40037"]={jy=1000000,hunshi=600,gold=21000},
	["40038"]={jy=1200000,hunshi=720,gold=24000},
	["40039"]={jy=1200000,hunshi=720,gold=24000},
	["40040"]={jy=1200000,hunshi=720,gold=24000},
	["41014"]={jy=40000,hunshi=30,gold=7500},
	["41015"]={jy=40000,hunshi=30,gold=7500},
	["41016"]={jy=40000,hunshi=30,gold=7500},
	["41020"]={jy=150000,hunshi=80,gold=10000},
	["41021"]={jy=150000,hunshi=80,gold=10000},
	["41022"]={jy=150000,hunshi=80,gold=10000},
	["41023"]={jy=300000,hunshi=160,gold=15000},
	["41024"]={jy=300000,hunshi=160,gold=15000},
	["41025"]={jy=300000,hunshi=160,gold=15000},
	["41026"]={jy=600000,hunshi=320,gold=18000},
	["41027"]={jy=600000,hunshi=320,gold=18000},
	["41028"]={jy=600000,hunshi=320,gold=18000},
	["41029"]={jy=900000,hunshi=480,gold=25000},
	["41030"]={jy=900000,hunshi=480,gold=25000},
	["41031"]={jy=900000,hunshi=480,gold=25000},
	["41032"]={jy=1200000,hunshi=640,gold=32000},
	["41033"]={jy=1200000,hunshi=640,gold=32000},
	["41034"]={jy=1200000,hunshi=640,gold=32000},
	["41035"]={jy=1500000,hunshi=800,gold=39000},
	["41036"]={jy=1500000,hunshi=800,gold=39000},
	["41037"]={jy=1500000,hunshi=800,gold=39000},
	["41038"]={jy=1800000,hunshi=960,gold=46000},
	["41039"]={jy=1800000,hunshi=960,gold=46000},
	["41040"]={jy=1800000,hunshi=960,gold=46000},
	["70021"]={jy=10000,hunshi=10,gold=4000},
	["70022"]={jy=10000,hunshi=10,gold=4000},
	["70023"]={jy=10000,hunshi=10,gold=4000},
	["70024"]={jy=25000,hunshi=20,gold=5000},
	["70025"]={jy=25000,hunshi=20,gold=5000},
	["70026"]={jy=25000,hunshi=20,gold=5000},
	["70027"]={jy=50000,hunshi=40,gold=7000},
	["70028"]={jy=50000,hunshi=40,gold=7000},
	["70029"]={jy=50000,hunshi=40,gold=7000},
	["70030"]={jy=100000,hunshi=60,gold=8500},
	["70031"]={jy=100000,hunshi=60,gold=8500},
	["70032"]={jy=100000,hunshi=60,gold=8500},
	["70033"]={jy=200000,hunshi=120,gold=10000},
	["70034"]={jy=200000,hunshi=120,gold=10000},
	["70035"]={jy=200000,hunshi=120,gold=10000},
	["70036"]={jy=400000,hunshi=240,gold=12000},
	["70037"]={jy=400000,hunshi=240,gold=12000},
	["70038"]={jy=400000,hunshi=240,gold=12000},
	["70039"]={jy=600000,hunshi=360,gold=15000},
	["70040"]={jy=600000,hunshi=360,gold=15000},
	["70041"]={jy=600000,hunshi=360,gold=15000},
	["70042"]={jy=800000,hunshi=480,gold=18000},
	["70043"]={jy=800000,hunshi=480,gold=18000},
	["70044"]={jy=800000,hunshi=480,gold=18000},
	["70045"]={jy=1000000,hunshi=600,gold=21000},
	["70046"]={jy=1000000,hunshi=600,gold=21000},
	["70047"]={jy=1000000,hunshi=600,gold=21000},
	["70048"]={jy=1200000,hunshi=720,gold=24000},
	["70049"]={jy=1200000,hunshi=720,gold=24000},
	["70050"]={jy=1200000,hunshi=720,gold=24000},
	["71024"]={jy=40000,hunshi=30,gold=7500},
	["71025"]={jy=40000,hunshi=30,gold=7500},
	["71026"]={jy=40000,hunshi=30,gold=7500},
	["71030"]={jy=150000,hunshi=80,gold=10000},
	["71031"]={jy=150000,hunshi=80,gold=10000},
	["71032"]={jy=150000,hunshi=80,gold=10000},
	["71033"]={jy=300000,hunshi=160,gold=15000},
	["71034"]={jy=300000,hunshi=160,gold=15000},
	["71035"]={jy=300000,hunshi=160,gold=15000},
	["71036"]={jy=600000,hunshi=320,gold=18000},
	["71037"]={jy=600000,hunshi=320,gold=18000},
	["71038"]={jy=600000,hunshi=320,gold=18000},
	["71039"]={jy=900000,hunshi=480,gold=25000},
	["71040"]={jy=900000,hunshi=480,gold=25000},
	["71041"]={jy=900000,hunshi=480,gold=25000},
	["71042"]={jy=1200000,hunshi=640,gold=32000},
	["71043"]={jy=1200000,hunshi=640,gold=32000},
	["71044"]={jy=1200000,hunshi=640,gold=32000},
	["71045"]={jy=1500000,hunshi=800,gold=39000},
	["71046"]={jy=1500000,hunshi=800,gold=39000},
	["71047"]={jy=1500000,hunshi=800,gold=39000},
	["71048"]={jy=1800000,hunshi=960,gold=46000},
	["71049"]={jy=1800000,hunshi=960,gold=46000},
	["71050"]={jy=1800000,hunshi=960,gold=46000},
	["60017"]={jy=10000,hunshi=10,gold=4000},
	["60018"]={jy=10000,hunshi=10,gold=4000},
	["60019"]={jy=10000,hunshi=10,gold=4000},
	["60020"]={jy=25000,hunshi=20,gold=5000},
	["60021"]={jy=25000,hunshi=20,gold=5000},
	["60022"]={jy=25000,hunshi=20,gold=5000},
	["60023"]={jy=50000,hunshi=40,gold=7000},
	["60024"]={jy=50000,hunshi=40,gold=7000},
	["60025"]={jy=50000,hunshi=40,gold=7000},
	["60026"]={jy=100000,hunshi=60,gold=8500},
	["60027"]={jy=100000,hunshi=60,gold=8500},
	["60028"]={jy=100000,hunshi=60,gold=8500},
	["60029"]={jy=200000,hunshi=120,gold=10000},
	["60030"]={jy=200000,hunshi=120,gold=10000},
	["60031"]={jy=200000,hunshi=120,gold=10000},
	["60032"]={jy=400000,hunshi=240,gold=12000},
	["60033"]={jy=400000,hunshi=240,gold=12000},
	["60034"]={jy=400000,hunshi=240,gold=12000},
	["60035"]={jy=600000,hunshi=360,gold=15000},
	["60036"]={jy=600000,hunshi=360,gold=15000},
	["60037"]={jy=600000,hunshi=360,gold=15000},
	["60038"]={jy=800000,hunshi=480,gold=18000},
	["60039"]={jy=800000,hunshi=480,gold=18000},
	["60040"]={jy=800000,hunshi=480,gold=18000},
	["60041"]={jy=1000000,hunshi=600,gold=21000},
	["60042"]={jy=1000000,hunshi=600,gold=21000},
	["60043"]={jy=1000000,hunshi=600,gold=21000},
	["60044"]={jy=1200000,hunshi=720,gold=24000},
	["60045"]={jy=1200000,hunshi=720,gold=24000},
	["60046"]={jy=1200000,hunshi=720,gold=24000},
	["61020"]={jy=40000,hunshi=30,gold=7500},
	["61021"]={jy=40000,hunshi=30,gold=7500},
	["61022"]={jy=40000,hunshi=30,gold=7500},
	["61026"]={jy=150000,hunshi=80,gold=10000}, 
	["61027"]={jy=150000,hunshi=80,gold=10000}, 
	["61028"]={jy=150000,hunshi=80,gold=10000}, 
	["61029"]={jy=300000,hunshi=160,gold=15000}, 
	["61030"]={jy=300000,hunshi=160,gold=15000}, 
	["61031"]={jy=300000,hunshi=160,gold=15000}, 
	["61032"]={jy=600000,hunshi=320,gold=18000},
	["61033"]={jy=600000,hunshi=320,gold=18000},
	["61034"]={jy=600000,hunshi=320,gold=18000},
	["61035"]={jy=900000,hunshi=480,gold=25000}, 
	["61036"]={jy=900000,hunshi=480,gold=25000}, 
	["61037"]={jy=900000,hunshi=480,gold=25000}, 
	["61038"]={jy=1200000,hunshi=640,gold=32000}, 
	["61039"]={jy=1200000,hunshi=640,gold=32000}, 
	["61040"]={jy=1200000,hunshi=640,gold=32000}, 
	["61041"]={jy=1500000,hunshi=800,gold=39000}, 
	["61042"]={jy=1500000,hunshi=800,gold=39000}, 
	["61043"]={jy=1500000,hunshi=800,gold=39000}, 
	["61044"]={jy=1800000,hunshi=960,gold=46000}, 
	["61045"]={jy=1800000,hunshi=960,gold=46000}, 
	["61046"]={jy=1800000,hunshi=960,gold=46000}, 
	["50023"]={jy=10000,hunshi=10,gold=4000},     
	["50024"]={jy=10000,hunshi=10,gold=4000},     
	["50025"]={jy=10000,hunshi=10,gold=4000},     
	["50026"]={jy=25000,hunshi=20,gold=5000},     
	["50027"]={jy=25000,hunshi=20,gold=5000},     
	["50028"]={jy=25000,hunshi=20,gold=5000},     
	["50029"]={jy=50000,hunshi=40,gold=7000},    
	["50030"]={jy=50000,hunshi=40,gold=7000},    
	["50031"]={jy=50000,hunshi=40,gold=7000},    
	["50032"]={jy=100000,hunshi=60,gold=8500},   
	["50033"]={jy=100000,hunshi=60,gold=8500},   
	["50034"]={jy=100000,hunshi=60,gold=8500},   
	["50035"]={jy=200000,hunshi=120,gold=10000},  
	["50036"]={jy=200000,hunshi=120,gold=10000},  
	["50037"]={jy=200000,hunshi=120,gold=10000},  
	["50038"]={jy=400000,hunshi=240,gold=12000},  
	["50039"]={jy=400000,hunshi=240,gold=12000},  
	["50040"]={jy=400000,hunshi=240,gold=12000},  
	["50041"]={jy=600000,hunshi=360,gold=15000}, 
	["50042"]={jy=600000,hunshi=360,gold=15000}, 
	["50043"]={jy=600000,hunshi=360,gold=15000}, 
	["50044"]={jy=800000,hunshi=480,gold=18000}, 
	["50045"]={jy=800000,hunshi=480,gold=18000}, 
	["50046"]={jy=800000,hunshi=480,gold=18000}, 
	["50047"]={jy=1000000,hunshi=600,gold=21000}, 
	["50048"]={jy=1000000,hunshi=600,gold=21000}, 
	["50049"]={jy=1000000,hunshi=600,gold=21000}, 
	["50050"]={jy=1200000,hunshi=720,gold=24000}, 
	["50051"]={jy=1200000,hunshi=720,gold=24000}, 
	["50052"]={jy=1200000,hunshi=720,gold=24000}, 
	["51026"]={jy=40000,hunshi=30,gold=7500},     
	["51027"]={jy=40000,hunshi=30,gold=7500},     
	["51028"]={jy=40000,hunshi=30,gold=7500},     
	["51032"]={jy=150000,hunshi=80,gold=10000},  
	["51033"]={jy=150000,hunshi=80,gold=10000},  
	["51034"]={jy=150000,hunshi=80,gold=10000},  
	["51035"]={jy=300000,hunshi=160,gold=15000},  
	["51036"]={jy=300000,hunshi=160,gold=15000},  
	["51037"]={jy=300000,hunshi=160,gold=15000},  
	["51038"]={jy=600000,hunshi=320,gold=18000}, 
	["51039"]={jy=600000,hunshi=320,gold=18000}, 
	["51040"]={jy=600000,hunshi=320,gold=18000}, 
	["51041"]={jy=900000,hunshi=480,gold=25000},
	["51042"]={jy=900000,hunshi=480,gold=25000},
	["51043"]={jy=900000,hunshi=480,gold=25000},
	["51044"]={jy=1200000,hunshi=640,gold=32000},
	["51045"]={jy=1200000,hunshi=640,gold=32000},
	["51046"]={jy=1200000,hunshi=640,gold=32000},
	["51047"]={jy=1500000,hunshi=800,gold=39000},
	["51048"]={jy=1500000,hunshi=800,gold=39000},
	["51049"]={jy=1500000,hunshi=800,gold=39000},
	["51050"]={jy=1800000,hunshi=960,gold=46000},
	["51051"]={jy=1800000,hunshi=960,gold=46000},
	["51052"]={jy=1800000,hunshi=960,gold=46000},
	["90001"]={jy=10000,hunshi=10,gold=4000},     
	["90002"]={jy=10000,hunshi=10,gold=4000},     
	["90003"]={jy=10000,hunshi=10,gold=4000},     
	["90004"]={jy=25000,hunshi=20,gold=5000},     
	["90005"]={jy=25000,hunshi=20,gold=5000},     
	["90006"]={jy=25000,hunshi=20,gold=5000},     
	["90007"]={jy=50000,hunshi=40,gold=7000},    
	["90008"]={jy=50000,hunshi=40,gold=7000},    
	["90009"]={jy=50000,hunshi=40,gold=7000},    
	["90010"]={jy=100000,hunshi=60,gold=8500},   
	["90011"]={jy=100000,hunshi=60,gold=8500},   
	["90012"]={jy=100000,hunshi=60,gold=8500},   
	["90013"]={jy=200000,hunshi=120,gold=10000},  
	["90014"]={jy=200000,hunshi=120,gold=10000},  
	["90015"]={jy=200000,hunshi=120,gold=10000},  
	["90016"]={jy=400000,hunshi=240,gold=12000},  
	["90017"]={jy=400000,hunshi=240,gold=12000},  
	["90018"]={jy=400000,hunshi=240,gold=12000},  
	["90019"]={jy=600000,hunshi=360,gold=15000}, 
	["90020"]={jy=600000,hunshi=360,gold=15000}, 
	["90021"]={jy=600000,hunshi=360,gold=15000}, 
	["90022"]={jy=800000,hunshi=480,gold=18000}, 
	["90023"]={jy=800000,hunshi=480,gold=18000}, 
	["90024"]={jy=800000,hunshi=480,gold=18000}, 
	["90025"]={jy=1000000,hunshi=600,gold=21000}, 
	["90026"]={jy=1000000,hunshi=600,gold=21000}, 
	["90027"]={jy=1000000,hunshi=600,gold=21000}, 
	["90028"]={jy=1200000,hunshi=720,gold=24000}, 
	["90029"]={jy=1200000,hunshi=720,gold=24000}, 
	["90030"]={jy=1200000,hunshi=720,gold=24000}, 
	["91004"]={jy=40000,hunshi=30,gold=7500},     
	["91005"]={jy=40000,hunshi=30,gold=7500},     
	["91006"]={jy=40000,hunshi=30,gold=7500},     
	["91010"]={jy=150000,hunshi=80,gold=10000},  
	["91011"]={jy=150000,hunshi=80,gold=10000},  
	["91012"]={jy=150000,hunshi=80,gold=10000},  
	["91013"]={jy=300000,hunshi=160,gold=15000},  
	["91014"]={jy=300000,hunshi=160,gold=15000},  
	["91015"]={jy=300000,hunshi=160,gold=15000},  
	["91016"]={jy=600000,hunshi=320,gold=18000}, 
	["91017"]={jy=600000,hunshi=320,gold=18000}, 
	["91018"]={jy=600000,hunshi=320,gold=18000}, 
	["91019"]={jy=900000,hunshi=480,gold=25000},
	["91020"]={jy=900000,hunshi=480,gold=25000},
	["91021"]={jy=900000,hunshi=480,gold=25000},
	["91022"]={jy=1200000,hunshi=640,gold=32000},
	["91023"]={jy=1200000,hunshi=640,gold=32000},
	["91024"]={jy=1200000,hunshi=640,gold=32000},
	["91025"]={jy=1500000,hunshi=800,gold=39000},
	["91026"]={jy=1500000,hunshi=800,gold=39000},
	["91027"]={jy=1500000,hunshi=800,gold=39000},
	["91028"]={jy=1800000,hunshi=960,gold=46000},
	["91029"]={jy=1800000,hunshi=960,gold=46000},
	["91030"]={jy=1800000,hunshi=960,gold=46000},
	["100001"]={jy=10000,hunshi=10,gold=4000},     
	["100002"]={jy=10000,hunshi=10,gold=4000},      
	["100003"]={jy=10000,hunshi=10,gold=4000},    
	["100004"]={jy=25000,hunshi=20,gold=5000},     
	["100005"]={jy=25000,hunshi=20,gold=5000},     
	["100006"]={jy=25000,hunshi=20,gold=5000},     
	["100007"]={jy=50000,hunshi=40,gold=7000},    
	["100008"]={jy=50000,hunshi=40,gold=7000},    
	["100009"]={jy=50000,hunshi=40,gold=7000},    
	["100010"]={jy=100000,hunshi=60,gold=8500},   
	["100011"]={jy=100000,hunshi=60,gold=8500},   
	["100012"]={jy=100000,hunshi=60,gold=8500},   
	["100013"]={jy=200000,hunshi=120,gold=10000},  
	["100014"]={jy=200000,hunshi=120,gold=10000},  
	["100015"]={jy=200000,hunshi=120,gold=10000},  
	["100016"]={jy=400000,hunshi=240,gold=12000},  
	["100017"]={jy=400000,hunshi=240,gold=12000},  
	["100018"]={jy=400000,hunshi=240,gold=12000},  
	["100019"]={jy=600000,hunshi=360,gold=15000}, 
	["100020"]={jy=600000,hunshi=360,gold=15000}, 
	["100021"]={jy=600000,hunshi=360,gold=15000}, 
	["100022"]={jy=800000,hunshi=480,gold=18000}, 
	["100023"]={jy=800000,hunshi=480,gold=18000}, 
	["100024"]={jy=800000,hunshi=480,gold=18000}, 
	["100025"]={jy=1000000,hunshi=600,gold=21000}, 
	["100026"]={jy=1000000,hunshi=600,gold=21000}, 
	["100027"]={jy=1000000,hunshi=600,gold=21000}, 
	["100028"]={jy=1200000,hunshi=720,gold=24000}, 
	["100029"]={jy=1200000,hunshi=720,gold=24000}, 
	["100030"]={jy=1200000,hunshi=720,gold=24000}, 
	["101004"]={jy=40000,hunshi=30,gold=7500},     
	["101005"]={jy=40000,hunshi=30,gold=7500},     
	["101006"]={jy=40000,hunshi=30,gold=7500},     
	["101010"]={jy=150000,hunshi=80,gold=10000},  
	["101011"]={jy=150000,hunshi=80,gold=10000},  
	["101012"]={jy=150000,hunshi=80,gold=10000},  
	["101013"]={jy=300000,hunshi=160,gold=15000},  
	["101014"]={jy=300000,hunshi=160,gold=15000},  
	["101015"]={jy=300000,hunshi=160,gold=15000},  
	["101016"]={jy=600000,hunshi=320,gold=18000}, 
	["101017"]={jy=600000,hunshi=320,gold=18000}, 
	["101018"]={jy=600000,hunshi=320,gold=18000}, 
	["101019"]={jy=900000,hunshi=480,gold=25000},
	["101020"]={jy=900000,hunshi=480,gold=25000},
	["101021"]={jy=900000,hunshi=480,gold=25000},
	["101022"]={jy=1200000,hunshi=640,gold=32000},
	["101023"]={jy=1200000,hunshi=640,gold=32000},
	["101024"]={jy=1200000,hunshi=640,gold=32000},
	["101025"]={jy=1500000,hunshi=800,gold=39000},
	["101026"]={jy=1500000,hunshi=800,gold=39000},
	["101027"]={jy=1500000,hunshi=800,gold=39000},
	["101028"]={jy=1800000,hunshi=960,gold=46000},
	["101029"]={jy=1800000,hunshi=960,gold=46000},
	["101030"]={jy=1800000,hunshi=960,gold=46000},
}
function process_showinfo(player,data)
	local exp_num = 0;
	local hunshi_num = 0;
	local money_num = 0;
	local hui_num = 0;
	if #data >= 1000 then print("script:process_showinfo data error");return; end
	if data and #data > 0 then
		local size = math.floor(#data/3);
		for i=1,size do
			local pos = data[3*i-2];
			local id = data[3*i-1];
			local num = data[3*i];
			--print(pos,id,num)
			if pos and id and num and item_award[id] then
				hui_num = hui_num + num;
				exp_num = exp_num + item_award[id].jy;
				hunshi_num = hunshi_num + item_award[id].hunshi;
				money_num = money_num + item_award[id].gold;
			end
		end
		if hui_num > 0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNum","htmlText","<font color='#0000FF'>可获得魂石</font>:<font color='#ff0000'>"..hunshi_num.."</font>");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGM","htmlText","<font color='#0000FF'>可获得金币</font>:<font color='#ff0000'>"..money_num.."</font>");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtJY","htmlText","<font color='#0000FF'>可获得经验</font>:<font color='#ff0000'>"..exp_num.."</font>");
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	end
end
function process_huishou(player,data)
	if player:get_task_state(1101) == 1 then
		player:set_task_state(1101,2); player:push_task_data(1101,0);
		player:set_task_state(1102,1); player:push_task_data(1102,0);
		player:add_exp(100000);
		player:alert(10,1,"成功完成<font color='#ff0000'>装备回收任务!</font>");
		player:alert(10,0,"经验值增加: <font color='#ff0000'>100000</font>");
	end
	local exp_num = 0;
	local hunshi_num = 0;
	local money_num = 0;
	local hui_num = 0;
	if #data >= 1000 then print("script:process_huishou data error");return; end
	if data and #data > 0  then
		local size = math.floor(#data/3);
		for i=1,size do
			local pos = data[3*i-2];
			local id = data[3*i-1];
			local num = tonumber(data[3*i]);
			if pos and id and num and item_award[id] then
				local item = player:get_item(id,pos);
				if item then
					player:remove_item_by_type_pos(id,pos)
					local item2 = player:get_item(id,pos);
					if not item2 then
						hui_num = hui_num + 1;
						exp_num = exp_num + item_award[id].jy;
						hunshi_num = hunshi_num + item_award[id].hunshi;
						money_num = money_num + item_award[id].gold;
					end
				end
			end
		end
		if hui_num > 0 then
			player:add_exp(exp_num);
			player:add_gamemoney(money_num);
			player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)+hunshi_num);
			player:alert(11,1,"本次共回收[<font color='#ff0000'>"..hui_num.."</font>]件物品!");
			player:alert(11,0,"获得经验[<font color='#ff0000'>"..exp_num.."</font>]点,金币[<font color='#ff0000'>"..money_num.."</font>],魂石[<font color='#ff0000'>"..hunshi_num.."</font>]个.");
			player:alert(11,0,"当前共有魂石: "..util.ppn(player,const.PP_HUNSHI).."个");
			return;
		end
	end
end
------------------------------------------------------------------------------------------------------

-----------------设置该面板的过滤列表
function pushFilterInfo(player)
	--材料合成
	player:set_panel_data(PANEL_ACTIONSET_NAME,"composeinfo","filterType","10060-10066,10105-10119,15004-15009,10074-10076,10078-10080,10192-10199,15024-15026");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"itemlist","filterType","20105-20107,20204-20206,20305,20306,20400-20414,20427-20429,21000-21002,30010-30027,30040-30042,35010-35027,35040-35042,31013-31015,36013-36015,40011-40040,41014-41040,70021-70050,71024-71050,60017-60046,61020-61046,50023-50052,51026-51052,90001-90030,91004-91030,100001-100030,101004-101030");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"jinsheng","filterType","40014-40034,70024-70044,60020-60040,50026-50046,90004-90024,100004-100024");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"jinsheng","action","10192-10201");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end


-------------------------------------晋升------------------------------------
local js_data={
	[40014]={name="凌云头盔·武威",tarid=40017,tarname="惊世头盔·武威",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[40015]={name="凌云头盔·烈焰",tarid=40018,tarname="惊世头盔·烈焰",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[40016]={name="凌云头盔·无极",tarid=40019,tarname="惊世头盔·无极",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[70024]={name="凌云项链·武威",tarid=70027,tarname="惊世项链·武威",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[70025]={name="凌云项链·烈焰",tarid=70028,tarname="惊世项链·烈焰",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[70026]={name="凌云项链·无极",tarid=70029,tarname="惊世项链·无极",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[60020]={name="凌云护腕·武威",tarid=60023,tarname="惊世护腕·武威",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[60021]={name="凌云护腕·烈焰",tarid=60024,tarname="惊世护腕·烈焰",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[60022]={name="凌云护腕·无极",tarid=60025,tarname="惊世护腕·无极",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[50026]={name="凌云戒指·武威",tarid=50029,tarname="惊世戒指·武威",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[50027]={name="凌云戒指·烈焰",tarid=50030,tarname="惊世戒指·烈焰",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[50028]={name="凌云戒指·无极",tarid=50031,tarname="惊世戒指·无极",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[90004]={name="凌云腰带·武威",tarid=90007,tarname="惊世腰带·武威",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[90005]={name="凌云腰带·烈焰",tarid=90008,tarname="惊世腰带·烈焰",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[90006]={name="凌云腰带·无极",tarid=90009,tarname="惊世腰带·无极",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[100004]={name="凌云靴·武威",tarid=100007,tarname="惊世靴·武威",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[100005]={name="凌云靴·烈焰",tarid=100008,tarname="惊世靴·烈焰",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[100006]={name="凌云靴·无极",tarid=100009,tarname="惊世靴·无极",needid=10192,needname="一级灵珠",neednum=1,cost=30},
	[40017]={name="惊世头盔·武威",tarid=40020,tarname="混天头盔·武威",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[40018]={name="惊世头盔·烈焰",tarid=40021,tarname="混天头盔·烈焰",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[40019]={name="惊世头盔·无极",tarid=40022,tarname="混天头盔·无极",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[70027]={name="惊世项链·武威",tarid=70030,tarname="混天项链·武威",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[70028]={name="惊世项链·烈焰",tarid=70031,tarname="混天项链·烈焰",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[70029]={name="惊世项链·无极",tarid=70032,tarname="混天项链·无极",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[60023]={name="惊世护腕·武威",tarid=60026,tarname="混天护腕·武威",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[60024]={name="惊世护腕·烈焰",tarid=60027,tarname="混天护腕·烈焰",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[60025]={name="惊世护腕·无极",tarid=60028,tarname="混天护腕·无极",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[50029]={name="惊世戒指·武威",tarid=50032,tarname="混天戒指·武威",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[50030]={name="惊世戒指·烈焰",tarid=50033,tarname="混天戒指·烈焰",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[50031]={name="惊世戒指·无极",tarid=50034,tarname="混天戒指·无极",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[90007]={name="惊世腰带·武威",tarid=90010,tarname="混天腰带·武威",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[90008]={name="惊世腰带·烈焰",tarid=90011,tarname="混天腰带·烈焰",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[90009]={name="惊世腰带·无极",tarid=90012,tarname="混天腰带·无极",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[100007]={name="惊世靴·武威",tarid=100010,tarname="混天靴·武威",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[100008]={name="惊世靴·烈焰",tarid=100011,tarname="混天靴·烈焰",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[100009]={name="惊世靴·无极",tarid=100012,tarname="混天靴·无极",needid=10193,needname="二级灵珠",neednum=1,cost=90},
	[40020]={name="混天头盔·武威",tarid=40023,tarname="潜龙头盔·武威",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[40021]={name="混天头盔·烈焰",tarid=40024,tarname="潜龙头盔·烈焰",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[40022]={name="混天头盔·无极",tarid=40025,tarname="潜龙头盔·无极",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[70030]={name="混天项链·武威",tarid=70033,tarname="潜龙项链·武威",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[70031]={name="混天项链·烈焰",tarid=70034,tarname="潜龙项链·烈焰",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[70032]={name="混天项链·无极",tarid=70035,tarname="潜龙项链·无极",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[60026]={name="混天护腕·武威",tarid=60029,tarname="潜龙护腕·武威",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[60027]={name="混天护腕·烈焰",tarid=60030,tarname="潜龙护腕·烈焰",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[60028]={name="混天护腕·无极",tarid=60031,tarname="潜龙护腕·无极",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[50032]={name="混天戒指·武威",tarid=50035,tarname="潜龙戒指·武威",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[50033]={name="混天戒指·烈焰",tarid=50036,tarname="潜龙戒指·烈焰",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[50034]={name="混天戒指·无极",tarid=50037,tarname="潜龙戒指·无极",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[90010]={name="混天腰带·武威",tarid=90013,tarname="潜龙腰带·武威",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[90011]={name="混天腰带·烈焰",tarid=90014,tarname="潜龙腰带·烈焰",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[90012]={name="混天腰带·无极",tarid=90015,tarname="潜龙腰带·无极",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[100010]={name="混天靴·武威",tarid=100013,tarname="潜龙靴·武威",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[100011]={name="混天靴·烈焰",tarid=100014,tarname="潜龙靴·烈焰",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[100012]={name="混天靴·无极",tarid=100015,tarname="潜龙靴·无极",needid=10194,needname="三级灵珠",neednum=1,cost=270},
	[40023]={name="潜龙头盔·武威",tarid=40026,tarname="无双头盔·武威",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[40024]={name="潜龙头盔·烈焰",tarid=40027,tarname="无双头盔·烈焰",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[40025]={name="潜龙头盔·无极",tarid=40028,tarname="无双头盔·无极",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[70033]={name="潜龙项链·武威",tarid=70036,tarname="无双项链·武威",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[70034]={name="潜龙项链·烈焰",tarid=70037,tarname="无双项链·烈焰",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[70035]={name="潜龙项链·无极",tarid=70038,tarname="无双项链·无极",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[60029]={name="潜龙护腕·武威",tarid=60032,tarname="无双护腕·武威",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[60030]={name="潜龙护腕·烈焰",tarid=60033,tarname="无双护腕·烈焰",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[60031]={name="潜龙护腕·无极",tarid=60034,tarname="无双护腕·无极",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[50035]={name="潜龙戒指·武威",tarid=50038,tarname="无双戒指·武威",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[50036]={name="潜龙戒指·烈焰",tarid=50039,tarname="无双戒指·烈焰",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[50037]={name="潜龙戒指·无极",tarid=50040,tarname="无双戒指·无极",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[90013]={name="潜龙腰带·武威",tarid=90016,tarname="无双腰带·武威",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[90014]={name="潜龙腰带·烈焰",tarid=90017,tarname="无双腰带·烈焰",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[90015]={name="潜龙腰带·无极",tarid=90018,tarname="无双腰带·无极",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[100013]={name="潜龙靴·武威",tarid=100016,tarname="无双靴·武威",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[100014]={name="潜龙靴·烈焰",tarid=100017,tarname="无双靴·烈焰",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[100015]={name="潜龙靴·无极",tarid=100018,tarname="无双靴·无极",needid=10195,needname="四级灵珠",neednum=1,cost=810},
	[40026]={name="无双头盔·武威",tarid=40029,tarname="至尊头盔·武威",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[40027]={name="无双头盔·烈焰",tarid=40030,tarname="至尊头盔·烈焰",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[40028]={name="无双头盔·无极",tarid=40031,tarname="至尊头盔·无极",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[70036]={name="无双项链·武威",tarid=70039,tarname="至尊项链·武威",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[70037]={name="无双项链·烈焰",tarid=70040,tarname="至尊项链·烈焰",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[70038]={name="无双项链·无极",tarid=70041,tarname="至尊项链·无极",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[60032]={name="无双护腕·武威",tarid=60035,tarname="至尊护腕·武威",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[60033]={name="无双护腕·烈焰",tarid=60036,tarname="至尊护腕·烈焰",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[60034]={name="无双护腕·无极",tarid=60037,tarname="至尊护腕·无极",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[50038]={name="无双戒指·武威",tarid=50041,tarname="至尊戒指·武威",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[50039]={name="无双戒指·烈焰",tarid=50042,tarname="至尊戒指·烈焰",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[50040]={name="无双戒指·无极",tarid=50043,tarname="至尊戒指·无极",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[90016]={name="无双腰带·武威",tarid=90019,tarname="至尊腰带·武威",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[90017]={name="无双腰带·烈焰",tarid=90020,tarname="至尊腰带·烈焰",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[90018]={name="无双腰带·无极",tarid=90021,tarname="至尊腰带·无极",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[100016]={name="无双靴·武威",tarid=100019,tarname="至尊靴·武威",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[100017]={name="无双靴·烈焰",tarid=100020,tarname="至尊靴·烈焰",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[100018]={name="无双靴·无极",tarid=100021,tarname="至尊靴·无极",needid=10196,needname="五级灵珠",neednum=1,cost=2430},
	[40029]={name="至尊头盔·武威",tarid=40032,tarname="天龙头盔·武威",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[40030]={name="至尊头盔·烈焰",tarid=40033,tarname="天龙头盔·烈焰",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[40031]={name="至尊头盔·无极",tarid=40034,tarname="天龙头盔·无极",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[70039]={name="至尊项链·武威",tarid=70042,tarname="天龙项链·武威",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[70040]={name="至尊项链·烈焰",tarid=70043,tarname="天龙项链·烈焰",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[70041]={name="至尊项链·无极",tarid=70044,tarname="天龙项链·无极",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[60035]={name="至尊护腕·武威",tarid=60038,tarname="天龙护腕·武威",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[60036]={name="至尊护腕·烈焰",tarid=60039,tarname="天龙护腕·烈焰",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[60037]={name="至尊护腕·无极",tarid=60040,tarname="天龙护腕·无极",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[50041]={name="至尊戒指·武威",tarid=50044,tarname="天龙戒指·武威",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[50042]={name="至尊戒指·烈焰",tarid=50045,tarname="天龙戒指·烈焰",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[50043]={name="至尊戒指·无极",tarid=50046,tarname="天龙戒指·无极",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[90019]={name="至尊腰带·武威",tarid=90022,tarname="天龙腰带·武威",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[90020]={name="至尊腰带·烈焰",tarid=90023,tarname="天龙腰带·烈焰",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[90021]={name="至尊腰带·无极",tarid=90024,tarname="天龙腰带·无极",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[100019]={name="至尊靴·武威",tarid=100022,tarname="天龙靴·武威",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[100020]={name="至尊靴·烈焰",tarid=100023,tarname="天龙靴·烈焰",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[100021]={name="至尊靴·无极",tarid=100024,tarname="天龙靴·无极",needid=10197,needname="六级灵珠",neednum=1,cost=7290},
	[40032]={name="天龙头盔·武威",tarid=40035,tarname="三皇头盔·武威",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[40033]={name="天龙头盔·烈焰",tarid=40036,tarname="三皇头盔·烈焰",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[40034]={name="天龙头盔·无极",tarid=40037,tarname="三皇头盔·无极",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[70042]={name="天龙项链·武威",tarid=70045,tarname="三皇项链·武威",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[70043]={name="天龙项链·烈焰",tarid=70046,tarname="三皇项链·烈焰",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[70044]={name="天龙项链·无极",tarid=70047,tarname="三皇项链·无极",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[60038]={name="天龙护腕·武威",tarid=60041,tarname="三皇护腕·武威",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[60039]={name="天龙护腕·烈焰",tarid=60042,tarname="三皇护腕·烈焰",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[60040]={name="天龙护腕·无极",tarid=60043,tarname="三皇护腕·无极",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[50044]={name="天龙戒指·武威",tarid=50047,tarname="三皇戒指·武威",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[50045]={name="天龙戒指·烈焰",tarid=50048,tarname="三皇戒指·烈焰",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[50046]={name="天龙戒指·无极",tarid=50049,tarname="三皇戒指·无极",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[90022]={name="天龙腰带·武威",tarid=90025,tarname="三皇腰带·武威",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[90023]={name="天龙腰带·烈焰",tarid=90026,tarname="三皇腰带·烈焰",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[90024]={name="天龙腰带·无极",tarid=90027,tarname="三皇腰带·无极",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[100022]={name="天龙靴·武威",tarid=100025,tarname="三皇靴·武威",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[100023]={name="天龙靴·烈焰",tarid=100026,tarname="三皇靴·烈焰",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
	[100024]={name="天龙靴·无极",tarid=100027,tarname="三皇靴·无极",needid=10198,needname="七级灵珠",neednum=1,cost=21870},
}

function fresh_jinsheng_info(player,data)
	if data and #data==3 then
		local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		if eq_pos and eq_id and eq_num then
			local tardata = js_data[eq_id];
			if tardata then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"itemJinLook","typeid",tardata.tarid);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"jinsheng","num",tardata.needid);
				local cc = tardata.cost * tardata.neednum;
				player:set_panel_data(PANEL_ACTIONSET_NAME,"autoBQ","label",cc.."元宝补足材料");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"itemJinLook","typeid",0);
				player:set_panel_data(PANEL_ACTIONSET_NAME,"autoBQ","label","元宝补足材料");
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	end
end

function process_jinsheng(player,data)
	if data and #data == 9 then
		local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		local yu_pos = tonumber(data[4]);local yu_id = tonumber(data[5]);local yu_num = tonumber(data[6]);
		local ybflag = tonumber(data[7]);
		if eq_id and eq_pos and eq_num and yu_pos and yu_id and yu_num and ybflag then else return; end
		local eq_item = player:get_item(eq_id,eq_pos);if eq_item then else player:alert(1,1,"请放入装备进行升级."); return; end;
		local yu_item = player:get_item(yu_id,yu_pos);
		local tar = js_data[eq_id];
		if tar then
			if player:num_item(tar.name) <= 0 then return; end
			local itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv,itupdcount,itupdac,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp = player:get_item_data(eq_id,eq_pos);
			if eq_item and yu_item then
				if player:num_item(tar.name) <= 0 then return; end
				if player:num_item(tar.needname) >= tar.neednum then
					player:remove_item(tar.name,1);
					player:remove_item(tar.needname,tar.neednum);
					player:add_item2(tar.tarname,1,"jipin,luck("..itluck.."),level("..itupdlv.."),adddc("..itadddc.."),addmc("..itaddmc.."),addsc("..itaddsc.."),addac("..itaddac.."),addmac("..itaddmac.."),upddc("..itupddc.."),updmc("..itupdmc.."),updsc("..itupdsc.."),updac("..itupdac.."),updmac("..itupdmac.."),addhp("..addhp.."),addmp("..addmp..")");
					player:alert(1,1,"恭喜您成功将"..tar.name.."升级为"..tar.tarname.."!");
				else
					if ybflag == 1 then
						local nt = player:num_item(tar.needname);
						local remain = tar.neednum - nt;
						if remain > 0 then
							local cost = remain*tar.cost;
							if player:get_vcoin() >= cost then
								player:sub_vcoin(cost,"equip_js");
								player:remove_item(tar.name,1);
								player:remove_item(tar.needname,nt);
								player:add_item2(tar.tarname,1,"jipin,luck("..itluck.."),level("..itupdlv.."),adddc("..itadddc.."),addmc("..itaddmc.."),addsc("..itaddsc.."),addac("..itaddac.."),addmac("..itaddmac.."),upddc("..itupddc.."),updmc("..itupdmc.."),updsc("..itupdsc.."),updac("..itupdac.."),updmac("..itupdmac.."),addhp("..addhp.."),addmp("..addmp..")");
								player:alert(1,1,"恭喜您成功将"..tar.name.."升级为"..tar.tarname.."!");
							else
								player:alert(1,1,"元宝不足"..tar.cost.."!");
							end
						end
					else
						player:alert(1,1,"升级当前装备需要"..tar.needname..tar.neednum.."颗!");
					end
					return;
				end
				return;
			end
			-------------------------------------------------------------
			if eq_item and ( not yu_item or player:num_item(tar.needname) <= 0 ) then
				if player:num_item(tar.name) <= 0 then return; end
				if ybflag == 1 then
					local cost = tar.neednum*tar.cost;
					if player:get_vcoin() >= cost then
						player:sub_vcoin(cost,"equip_js");
						player:remove_item(tar.name,1);
						player:add_item2(tar.tarname,1,"jipin,luck("..itluck.."),level("..itupdlv.."),adddc("..itadddc.."),addmc("..itaddmc.."),addsc("..itaddsc.."),addac("..itaddac.."),addmac("..itaddmac.."),upddc("..itupddc.."),updmc("..itupdmc.."),updsc("..itupdsc.."),updac("..itupdac.."),updmac("..itupdmac.."),addhp("..addhp.."),addmp("..addmp..")");
						player:alert(1,1,"恭喜您成功将"..tar.name.."升级为"..tar.tarname.."!");
					else
						player:alert(1,1,"元宝不足"..cost.."!");
					end
				else
					player:alert(1,1,"升级当前装备需要"..tar.needname..tar.neednum.."颗!");
				end
				return;
			end
		else
			player:alert(1,1,"当前装备不可以升级!");
		end
	end
end

----装备铸魂-----
local ch_data={	
[0]={per=0,needstone=0},	
[1]={per=100,needstone=1},	
[2]={per=150,needstone=2},	
[3]={per=200,needstone=3},	
[4]={per=250,needstone=4},	
[5]={per=300,needstone=5},	
[6]={per=350,needstone=6},	
[7]={per=400,needstone=7},	
[8]={per=450,needstone=8},	
[9]={per=500,needstone=9},	
[10]={per=550,needstone=10},	
[11]={per=600,needstone=11},	
[12]={per=650,needstone=12},	
[13]={per=700,needstone=13},	
[14]={per=750,needstone=14},	
[15]={per=800,needstone=15},	
[16]={per=850,needstone=16},	
[17]={per=900,needstone=17},	
[18]={per=950,needstone=18},	
[19]={per=1000,needstone=19},	
[20]={per=1050,needstone=21},	
[21]={per=1100,needstone=23},	
[22]={per=1150,needstone=25},	
[23]={per=1200,needstone=27},	
[24]={per=1250,needstone=29},	
[25]={per=1300,needstone=31},	
[26]={per=1350,needstone=33},	
[27]={per=1400,needstone=35},	
[28]={per=1450,needstone=37},	
[29]={per=1500,needstone=39},	
[30]={per=1550,needstone=42},	
[31]={per=1600,needstone=45},	
[32]={per=1650,needstone=48},	
[33]={per=1700,needstone=51},	
[34]={per=1750,needstone=54},	
[35]={per=1800,needstone=57},	
[36]={per=1850,needstone=60},	
[37]={per=1900,needstone=64},	
[38]={per=1950,needstone=68},	
[39]={per=2000,needstone=72},	
[40]={per=2050,needstone=76},	
[41]={per=2100,needstone=81},	
[42]={per=2150,needstone=86},	
[43]={per=2200,needstone=91},	
[44]={per=2250,needstone=96},	
[45]={per=2300,needstone=102},	
[46]={per=2350,needstone=108},	
[47]={per=2400,needstone=114},	
[48]={per=2450,needstone=121},	
[49]={per=2500,needstone=128},	
[50]={per=2550,needstone=135},	
[51]={per=2600,needstone=143},	
[52]={per=2650,needstone=151},	
[53]={per=2700,needstone=159},	
[54]={per=2750,needstone=168},	
[55]={per=2800,needstone=177},	
[56]={per=2850,needstone=187},	
[57]={per=2900,needstone=197},	
[58]={per=2950,needstone=208},	
[59]={per=3000,needstone=219},	
[60]={per=3050,needstone=231},	
[61]={per=3100,needstone=244},	
[62]={per=3150,needstone=257},	
[63]={per=3200,needstone=271},	
[64]={per=3250,needstone=286},	
[65]={per=3300,needstone=302},	
[66]={per=3350,needstone=318},	
[67]={per=3400,needstone=335},	
[68]={per=3450,needstone=353},	
[69]={per=3500,needstone=372},	
[70]={per=3550,needstone=392},	
[71]={per=3600,needstone=413},	
[72]={per=3650,needstone=435},	
[73]={per=3700,needstone=458},	
[74]={per=3750,needstone=483},	
[75]={per=3800,needstone=509},	
[76]={per=3850,needstone=536},	
[77]={per=3900,needstone=565},	
[78]={per=3950,needstone=595},	
[79]={per=4000,needstone=627},	
[80]={per=4050,needstone=661},	
[81]={per=4100,needstone=696},	
[82]={per=4150,needstone=733},	
[83]={per=4200,needstone=772},	
[84]={per=4250,needstone=813},	
[85]={per=4332,needstone=856},	
[86]={per=4526,needstone=902},	
[87]={per=4728,needstone=950},	
[88]={per=4939,needstone=1000},	
[89]={per=5160,needstone=1053},	
[90]={per=5391,needstone=1109},	
[91]={per=5632,needstone=1168},	
[92]={per=5884,needstone=1230},	
[93]={per=6147,needstone=1295},	
[94]={per=6422,needstone=1364},	
[95]={per=6709,needstone=1436},	
[96]={per=7009,needstone=1512},	
[97]={per=7322,needstone=1592},	
[98]={per=7649,needstone=1676},	
[99]={per=7991,needstone=1765},	
[100]={per=8348,needstone=1858},	
[101]={per=8721,needstone=1956},	
[102]={per=9110,needstone=2059},	
[103]={per=9517,needstone=2168},	
[104]={per=9942,needstone=2283},	
[105]={per=10386,needstone=2404},	
[106]={per=10850,needstone=2531},	
[107]={per=11335,needstone=2665},	
[108]={per=11841,needstone=2806},	
[109]={per=12370,needstone=2954},	
[110]={per=12922,needstone=3110},	
[111]={per=13499,needstone=3274},	
[112]={per=14102,needstone=3447},	
[113]={per=14732,needstone=3629},	
[114]={per=15390,needstone=3821},	
[115]={per=16077,needstone=4023},	
[116]={per=16795,needstone=4235},	
[117]={per=17545,needstone=4458},	
[118]={per=18328,needstone=4693},	
[119]={per=19146,needstone=4940},	
[120]={per=20000,needstone=5200},	
};	

local chpos_data={
	[4]={pos=ckattr.ITEM_WEAPON_POSITION,name="武器",con=const.ZHUHUN_WEAPHONE},
	[6]={pos=ckattr.ITEM_CLOTH_POSITION,name="衣服",con=const.ZHUHUN_CLOTH},
	[8]={pos=ckattr.ITEM_HAT_POSITION,name="头盔",con=const.ZHUHUN_HAT},
	[10]={pos=ckattr.ITEM_RING1_POSITION,name="戒指",con=const.ZHUHUN_RING1},
	[11]={pos=ckattr.ITEM_RING2_POSITION,name="戒指",con=const.ZHUHUN_RING2},
	[12]={pos=ckattr.ITEM_GLOVE1_POSITION,name="手镯",con=const.ZHUHUN_GLOVE1},
	[13]={pos=ckattr.ITEM_GLOVE2_POSITION,name="手镯",con=const.ZHUHUN_GLOVE2},
	[14]={pos=ckattr.ITEM_NICKLACE_POSITION,name="项链",con=const.ZHUHUN_NICKLACE},
	[18]={pos=ckattr.ITEM_BELT_POSITION,name="腰带",con=const.ZHUHUN_BELT},
	[20]={pos=ckattr.ITEM_BOOT_POSITION,name="靴子",con=const.ZHUHUN_BOOT},
};

function first_set_zhuhun_attr(player)
	for i=1,#ch_data do
		player:set_zhuhun_data(i,ch_data[i].per,ch_data[i].needstone);
	end
end

function zhuhunper(player)
	first_set_zhuhun_attr(player);
	player:set_zhuhunpos_info(-4,util.ppn(player,const.ZHUHUN_WEAPHONE));
	player:set_zhuhunpos_info(-6,util.ppn(player,const.ZHUHUN_CLOTH));
	player:set_zhuhunpos_info(-8,util.ppn(player,const.ZHUHUN_HAT));
	player:set_zhuhunpos_info(-10,util.ppn(player,const.ZHUHUN_RING1));
	player:set_zhuhunpos_info(-11,util.ppn(player,const.ZHUHUN_RING2));
	player:set_zhuhunpos_info(-12,util.ppn(player,const.ZHUHUN_GLOVE1));
	player:set_zhuhunpos_info(-13,util.ppn(player,const.ZHUHUN_GLOVE2));
	player:set_zhuhunpos_info(-14,util.ppn(player,const.ZHUHUN_NICKLACE));
	player:set_zhuhunpos_info(-18,util.ppn(player,const.ZHUHUN_BELT));
	player:set_zhuhunpos_info(-20,util.ppn(player,const.ZHUHUN_BOOT));
	sxaddtenacity(player);
	buff(player);
	fresh_zhuhun_totallinghun(player);
	fresh_zhuhun_texiao(player);
	
	local pw = util.ppn(player,chpos_data[4].con);
	local pc = util.ppn(player,chpos_data[6].con);
	local phat = util.ppn(player,chpos_data[8].con);
	local pring1 = util.ppn(player,chpos_data[10].con);
	local pring2 = util.ppn(player,chpos_data[11].con);
	local pglove1 = util.ppn(player,chpos_data[12].con);
	local pglove2 = util.ppn(player,chpos_data[13].con);
	local pneck = util.ppn(player,chpos_data[14].con);
	local pbelt = util.ppn(player,chpos_data[18].con);
	local pboot = util.ppn(player,chpos_data[20].con);
	player:set_panel_data("panelfuse","zhuhun","perWeapon",ch_data[pw].per);
	player:set_panel_data("panelfuse","zhuhun","perCloth",ch_data[pc].per);
	player:set_panel_data("panelfuse","zhuhun","perHat",ch_data[phat].per);
	player:set_panel_data("panelfuse","zhuhun","perRing1",ch_data[pring1].per);
	player:set_panel_data("panelfuse","zhuhun","perRing2",ch_data[pring2].per);
	player:set_panel_data("panelfuse","zhuhun","perGlove1",ch_data[pglove1].per);
	player:set_panel_data("panelfuse","zhuhun","perGlove2",ch_data[pglove2].per);
	player:set_panel_data("panelfuse","zhuhun","perNecklace",ch_data[pneck].per);
	player:set_panel_data("panelfuse","zhuhun","perBelt",ch_data[pbelt].per);
	player:set_panel_data("panelfuse","zhuhun","perBoot",ch_data[pboot].per);
	
	player:push_ckpanel_data("fuse","panelfuse");
end

function zhuangbeichouhun(player,data)
	if tonumber(data[1])== 0 then
		player:alert(1,1,"请放入装备再进行铸魂");
		return;
	end
	if  data and #data == 3 then
		local eq_pos =  tonumber(data[1]);
		local chouhunnum = checkchouhunnum(player,eq_pos);
		local type_id = player:get_item_data_by_pos(eq_pos);
		local name,ac,acmax,mac,macmax,dc,dcmax,mc,mcmax,sc,scmax,acc,dodge,needtype,needparam,fight,hp=player:get_item_base_data(type_id);
		if chouhunnum< 120 then
			local beishu = 1;
			if eq_pos == ckattr.ITEM_WEAPON_POSITION then beishu = 2; end
				if util.ppn(player,const.PP_LINGHUNSHI_NUM) >= ch_data[chouhunnum+1].needstone*beishu then
					player:set_param(const.PP_LINGHUNSHI_NUM,util.ppn(player,const.PP_LINGHUNSHI_NUM)-ch_data[chouhunnum+1].needstone*beishu);
					player:set_param(chpos_data[-eq_pos].con,util.ppn(player,chpos_data[-eq_pos].con)+1);
					player:set_zhuhunpos_info(eq_pos,util.ppn(player,chpos_data[-eq_pos].con));
					buff(player);
					addtenacity(player);
					ckattr.update_attr(player);
					player:alert(1,1,"升阶成功！！");
					fresh_zhuhun_jiexing(player,data);
					fresh_zhuhun(player);
					fresh_zhuhun_totallinghun(player);
					fresh_zhuhun_texiao(player);

				else
					player:alert(1,1,"灵魂石不足！");
				end
		else
			player:alert(1,1,"已经是最高等级！");
		end
	else
		player:alert(1,1,"未放入装备无法进行铸魂！");
	end
	local pw = util.ppn(player,chpos_data[4].con);
	local pc = util.ppn(player,chpos_data[6].con);
	local phat = util.ppn(player,chpos_data[8].con);
	local pring1 = util.ppn(player,chpos_data[10].con);
	local pring2 = util.ppn(player,chpos_data[11].con);
	local pglove1 = util.ppn(player,chpos_data[12].con);
	local pglove2 = util.ppn(player,chpos_data[13].con);
	local pneck = util.ppn(player,chpos_data[14].con);
	local pbelt = util.ppn(player,chpos_data[18].con);
	local pboot = util.ppn(player,chpos_data[20].con);
	player:set_panel_data("panelfuse","zhuhun","perWeapon",ch_data[pw].per);
	player:set_panel_data("panelfuse","zhuhun","perCloth",ch_data[pc].per);
	player:set_panel_data("panelfuse","zhuhun","perHat",ch_data[phat].per);
	player:set_panel_data("panelfuse","zhuhun","perRing1",ch_data[pring1].per);
	player:set_panel_data("panelfuse","zhuhun","perRing2",ch_data[pring2].per);
	player:set_panel_data("panelfuse","zhuhun","perGlove1",ch_data[pglove1].per);
	player:set_panel_data("panelfuse","zhuhun","perGlove2",ch_data[pglove2].per);
	player:set_panel_data("panelfuse","zhuhun","perNecklace",ch_data[pneck].per);
	player:set_panel_data("panelfuse","zhuhun","perBelt",ch_data[pbelt].per);
	player:set_panel_data("panelfuse","zhuhun","perBoot",ch_data[pboot].per);
	player:push_ckpanel_data("fuse","panelfuse");
end
local zhzonghe_data={
	[1]={pos=ckattr.ITEM_WEAPON_POSITION,con=const.ZHUHUN_WEAPHONE},
	[2]={pos=ckattr.ITEM_CLOTH_POSITION,con=const.ZHUHUN_CLOTH},
	[3]={pos=ckattr.ITEM_HAT_POSITION,con=const.ZHUHUN_HAT},
	[4]={pos=ckattr.ITEM_RING1_POSITION,con=const.ZHUHUN_RING1},
	[5]={pos=ckattr.ITEM_RING2_POSITION,con=const.ZHUHUN_RING2},
	[6]={pos=ckattr.ITEM_GLOVE1_POSITION,con=const.ZHUHUN_GLOVE1},
	[7]={pos=ckattr.ITEM_GLOVE2_POSITION,con=const.ZHUHUN_GLOVE2},
	[8]={pos=ckattr.ITEM_NICKLACE_POSITION,con=const.ZHUHUN_NICKLACE},
	[9]={pos=ckattr.ITEM_BELT_POSITION,con=const.ZHUHUN_BELT},
	[10]={pos=ckattr.ITEM_BOOT_POSITION,con=const.ZHUHUN_BOOT},
};
function checkchouhunnum(player,eq_pos)
	for  i=1,#zhzonghe_data do
		if  eq_pos == zhzonghe_data[i].pos then
			return util.ppn(player, zhzonghe_data[i].con);
		end
	end 
end
function  getTotalZbzhj( player )
	local zonghe=0;
	for  i=1,#zhzonghe_data do
		if player:get_item_data_by_pos(zhzonghe_data[i].pos) then
			zonghe=zonghe+math.floor(util.ppn(player,zhzonghe_data[i].con)/10);
		end
	end
	return zonghe;
end
function  buff(player)
	local zonghe=0;
	for  i=1,#zhzonghe_data do
		if player:get_item_data_by_pos(zhzonghe_data[i].pos) then
			zonghe=zonghe+math.floor(util.ppn(player,zhzonghe_data[i].con)/10);
		end
	end
	if  zonghe>= 120 then
		player:set_status(79,86400,5,1,1);
		return;
	end
	if  zonghe>= 100 then
		player:set_status(79,86400,3,1,1);
		return;
	end
	if  zonghe>=60 then
		player:set_status(79,86400,1,1,1);
		return;
	end
end
local tenacity_data={
[1]={zonghe=20,add=1,con=const.PP_ZHUHHUN20},
[2]={zonghe=40,add=2,con=const.PP_ZHUHHUN40},
[3]={zonghe=60,add=2,con=const.PP_ZHUHHUN60},
[4]={zonghe=80,add=3,con=const.PP_ZHUHHUN80},
[5]={zonghe=90,add=4,con=const.PP_ZHUHHUN90},
[6]={zonghe=100,add=4,con=const.PP_ZHUHHUN100},
[7]={zonghe=110,add=5,con=const.PP_ZHUHHUN110},
[8]={zonghe=120,add=5,con=const.PP_ZHUHHUN120},
}
function addtenacity(player)
	local zonghe=0;
	for  i=1,#zhzonghe_data do
		if player:get_item_data_by_pos(zhzonghe_data[i].pos) then
			zonghe=zonghe+math.floor(util.ppn(player,zhzonghe_data[i].con)/10);
		end
	end
	for  i=1,#tenacity_data do
		if  zonghe == tenacity_data[i].zonghe and util.ppn(player,tenacity_data[i].con)  == 0  then
			player:set_param(tenacity_data[i].con,1);
			player:set_tenacity(tenacity_data[i].add);
		end
	end
end
function sxaddtenacity(player)
	local zonghe=0;
	for  i=1,#zhzonghe_data do
		if player:get_item_data_by_pos(zhzonghe_data[i].pos) then
			zonghe=zonghe+math.floor(util.ppn(player,zhzonghe_data[i].con)/10);
		end
	end
	for  i=1,#tenacity_data do
		if  tenacity_data[9-i].zonghe >= zonghe  then
			player:set_tenacity(tenacity_data[9-i].add);
			return;
		end
	end
end

function fresh_zhuhun_jiexing(player,data)
	local pos=tonumber(data[1]);
	local jie=0;
	local xing=0;
	local level=util.ppn(player,chpos_data[-pos].con);
	local tmp=level%10;
	local type_id = player:get_item_data_by_pos(pos);
	local name,ac,acmax,mac,macmax,dc,dcmax,mc,mcmax,sc,scmax,acc,dodge,needtype,needparam,fight,hp=player:get_item_base_data(type_id);

	--if level>120 then return end
	if level==0 then
		for i=1,9 do
			player:set_panel_data("panelfuse","zhuhunstar"..i,"bgid","2335");
		end
		player:set_panel_data("panelfuse","zhuhun_jiexing","text","0阶0星");
	elseif tmp==0 then
		jie=math.floor(level/10);
		for i=1,9 do
			player:set_panel_data("panelfuse","zhuhunstar"..i,"bgid","2335");
		end
		player:set_panel_data("panelfuse","zhuhun_jiexing","text",jie.."阶0星");
	else
		jie=math.floor(level/10);
		xing=math.floor(level%10);
		for i=1,9 do
			player:set_panel_data("panelfuse","zhuhunstar"..i,"bgid","2335");
		end
		for i=1,xing do
			player:set_panel_data("panelfuse","zhuhunstar"..i,"bgid","2336");
		end
		player:set_panel_data("panelfuse","zhuhun_jiexing","text",jie.."阶"..xing.."星");
	end
	local beishu = 1; if pos == ckattr.ITEM_WEAPON_POSITION then beishu = 2;end
	if level<120 then
		player:set_panel_data("panelfuse","zhneedstone","text",ch_data[level+1].needstone*beishu);
		local tmpper1=ch_data[level].per/100;
		local tmpper2=ch_data[level+1].per/100;
		player:set_panel_data("panelfuse","zhtxtzl1","text",math.ceil(fight*tmpper1/100*0.83));
		player:set_panel_data("panelfuse","zhtxtzl2","text",math.ceil(fight*tmpper2/100*0.83));
		player:set_panel_data("panelfuse","zhtxtxs1","text",tmpper1.."%");
		player:set_panel_data("panelfuse","zhtxtxs2","text",tmpper2.."%");
	elseif level==120 then
		player:set_panel_data("panelfuse","zhtxtzl1","text",math.ceil(fight*2*0.83));
		player:set_panel_data("panelfuse","zhtxtzl2","text",math.ceil(fight*2*0.83));
		player:set_panel_data("panelfuse","zhneedstone","text","5200");
		player:set_panel_data("panelfuse","zhtxtxs1","text","200%");
		player:set_panel_data("panelfuse","zhtxtxs2","text","200%");
	end
	local pw = util.ppn(player,chpos_data[4].con);
	local pc = util.ppn(player,chpos_data[6].con);
	local phat = util.ppn(player,chpos_data[8].con);
	local pring1 = util.ppn(player,chpos_data[10].con);
	local pring2 = util.ppn(player,chpos_data[11].con);
	local pglove1 = util.ppn(player,chpos_data[12].con);
	local pglove2 = util.ppn(player,chpos_data[13].con);
	local pneck = util.ppn(player,chpos_data[14].con);
	local pbelt = util.ppn(player,chpos_data[18].con);
	local pboot = util.ppn(player,chpos_data[20].con);
	player:set_panel_data("panelfuse","zhuhun","perWeapon",ch_data[pw].per);
	player:set_panel_data("panelfuse","zhuhun","perCloth",ch_data[pc].per);
	player:set_panel_data("panelfuse","zhuhun","perHat",ch_data[phat].per);
	player:set_panel_data("panelfuse","zhuhun","perRing1",ch_data[pring1].per);
	player:set_panel_data("panelfuse","zhuhun","perRing2",ch_data[pring2].per);
	player:set_panel_data("panelfuse","zhuhun","perGlove1",ch_data[pglove1].per);
	player:set_panel_data("panelfuse","zhuhun","perGlove2",ch_data[pglove2].per);
	player:set_panel_data("panelfuse","zhuhun","perNecklace",ch_data[pneck].per);
	player:set_panel_data("panelfuse","zhuhun","perBelt",ch_data[pbelt].per);
	player:set_panel_data("panelfuse","zhuhun","perBoot",ch_data[pboot].per);
end


function fresh_zhuhun(player)
	player:set_panel_data("panelfuse","zhstonenow","text",util.ppn(player,const.PP_LINGHUNSHI_NUM));
end


function fresh_zhuhun_totallinghun(player)
	local zonghe=0;
	for  i=1,#zhzonghe_data do
		if player:get_item_data_by_pos(zhzonghe_data[i].pos) then
			zonghe=zonghe+math.floor(util.ppn(player,zhzonghe_data[i].con)/10);
		end
	end
	for i=1,8 do
		player:set_panel_data("panelfuse","ZHtotal"..i,"visible","true");
		player:set_panel_data("panelfuse","ZHtotalright"..i,"visible","true");
		player:set_panel_data("panelfuse","ZHtotal"..i..i,"visible","false");
		player:set_panel_data("panelfuse","ZHtotalright"..i..i,"visible","false");
	end
	if  zonghe>= 120 then
		player:set_panel_data("panelfuse","ZHtotal88","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright88","visible","true");
		player:set_panel_data("panelfuse","ZHtotal8","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright8","visible","false");
	end
	if  zonghe>= 110 then
		player:set_panel_data("panelfuse","ZHtotal77","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright77","visible","true");
		player:set_panel_data("panelfuse","ZHtotal7","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright7","visible","false");
	end
	if  zonghe>= 100 then
		player:set_panel_data("panelfuse","ZHtotal66","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright66","visible","true");
		player:set_panel_data("panelfuse","ZHtotal6","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright6","visible","false");
	end
	if  zonghe>=90 then
		player:set_panel_data("panelfuse","ZHtotal55","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright55","visible","true");
		player:set_panel_data("panelfuse","ZHtotal5","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright5","visible","false");
	end
	if  zonghe>= 80 then
		player:set_panel_data("panelfuse","ZHtotal44","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright44","visible","true");
		player:set_panel_data("panelfuse","ZHtotal4","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright4","visible","false");
	end
	if  zonghe>=60 then
		player:set_panel_data("panelfuse","ZHtotal33","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright33","visible","true");
		player:set_panel_data("panelfuse","ZHtotal3","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright3","visible","false");
	end
	if  zonghe>=40 then
		player:set_panel_data("panelfuse","ZHtotal22","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright22","visible","true");
		player:set_panel_data("panelfuse","ZHtotal2","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright2","visible","false");
	end
	if  zonghe>= 20 then
		player:set_panel_data("panelfuse","ZHtotal11","visible","true");
		player:set_panel_data("panelfuse","ZHtotalright11","visible","true");
		player:set_panel_data("panelfuse","ZHtotal1","visible","false");
		player:set_panel_data("panelfuse","ZHtotalright1","visible","false");
	end
end

function fresh_zhuhun_texiao(player)
	for i=1,10 do
		player:set_panel_data("panelfuse","zhuhuntexiao"..i,"visible","false");
	end

	for i=1,10 do
		if util.ppn(player,zhzonghe_data[i].con)==0 then
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"visible","false");
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"staticimgid","swf/item_lv.swf");
		elseif util.ppn(player,zhzonghe_data[i].con)>0 and util.ppn(player,zhzonghe_data[i].con)<=60 then
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelfuse","zhuhuntexiao1"..i,"staticimgid","swf/item_lv.swf");
		elseif  util.ppn(player,zhzonghe_data[i].con)>60 and util.ppn(player,zhzonghe_data[i].con)<=90 then
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"staticimgid","swf/item_lan.swf");
		elseif  util.ppn(player,zhzonghe_data[i].con)>90 and util.ppn(player,zhzonghe_data[i].con)<=110 then
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"staticimgid","swf/item_zi.swf");
		elseif  util.ppn(player,zhzonghe_data[i].con)>110 and util.ppn(player,zhzonghe_data[i].con)<=120 then
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"visible","true");
			player:set_panel_data("panelfuse","zhuhuntexiao"..i,"staticimgid","swf/item_huang.swf");
		end
	end
end