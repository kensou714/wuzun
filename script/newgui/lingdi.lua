module(..., package.seeall)
local ACTIONSET_NAME="lingdi";
local PANEL_ACTIONSET_NAME="panellingdi";

local ld_data={
	[1]={
		name="荒漠",mapid="v007",x=12,y=12,qx=22,qy=37,week=1,stay="vctld1",cst=const.PP_GUILD_FIGHT_BONUS1,
		item={typeid=15036,number=2,slot=2},
	},
	[2]={
		name="恶人村",mapid="v004",x=34,y=59,qx=36,qy=39,week=2,stay="vctld2",cst=const.PP_GUILD_FIGHT_BONUS2,
		item={typeid=15110,number=2,slot=2},
	},
	[3]={
		name="奴玛森林",mapid="v006",x=21,y=28,qx=12,qy=59,week=3,stay="vctld3",cst=const.PP_GUILD_FIGHT_BONUS3,
		item={typeid=10207,number=2,slot=2},
	},
	[4]={
		name="猛犸森林",mapid="v008",x=40,y=78,qx=42,qy=16,week=4,stay="vctld4",cst=const.PP_GUILD_FIGHT_BONUS4,
		item={typeid=15092,number=2,slot=2},
	},
	[5]={
		name="伏魔谷",mapid="v009",x=19,y=21,qx=42,qy=73,week=5,stay="vctld5",cst=const.PP_GUILD_FIGHT_BONUS5,
		item={typeid=15104,number=2,slot=2},
	},
}

function process_lingdi(player,actionset,panelid,actionid)
	if actionid == "btnmanor_huangmo" then
		enterLingDiFight(player,1);
		return;
	end
	if actionid == "btnmanor_eren" then
		enterLingDiFight(player,2);
		return;
	end
	if actionid == "btnmanor_nuoma" then
		enterLingDiFight(player,3);
		return;
	end
	if actionid == "btnmanor_menma" then
		enterLingDiFight(player,4);
		return;
	end
	if actionid == "btnmanor_fumo" then
		enterLingDiFight(player,5);
		return;
	end
	if actionid == "itemHuangMo" then
		getItemAward(player,1);
		return;
	end
	if actionid == "itemEren" then
		getItemAward(player,2);
		return;
	end
	if actionid == "itemNuoMa" then
		getItemAward(player,3);
		return;
	end
	if actionid == "itemMenMa" then
		getItemAward(player,4);
		return;
	end
	if actionid == "itemFuMo" then
		getItemAward(player,5);
		return;
	end
	if actionid == "btnmanor_yijie" then
		player:alert(11,1,"对不起，亲爱的玩家，该功能暂时关闭，coder正在全力改进！");
		--enterCrossServerFight(player);
		return;
	end
	if actionid == "btnmanor_yjlq" then
		yijianItemAward(player);
		return;
	end
	if actionid == "btnmanor_rule" then
		player:script_exe_code("newgui.lingdi.onTalklingdiRule");
		return;
	end
	if actionid == "btnkuafusc" then
		player:set_panel_data("panellingdi","lingdicontrol","selected","1");
		player:set_panel_data("panellingdi","panellingdi","panel_visible","false");
		player:push_ckpanel_data("lingdi","panellingdi");
		player:script_exe_code("newgui.minimap.onTalkKuafuZssc");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lingdi);


--------------------------------------------------------------------------------------------------------
function yuanshipoint(player,mon,group)
	local wk = weekday();
	if wk >= 1 and wk <= 5 then
		local wkdata = ld_data[wk];
		if wkdata then
			local map = server.find_map(wkdata.mapid);
			if map then
				if player:get_guild() ~= "" then
					if player:get_guild_gx() >= 100 then
						server.set_var("curldowner",player:get_guild());
						server.set_var("ownertime",tostring(os.time()));

						map:mon_gen(wkdata.qx,wkdata.qy,"据点",1,0,300,1,"no_owner");
						player:sub_guild_gx(100);
						player:alert(1,1,"恭喜你成功占领据点!");
					else
						map:mon_gen(wkdata.qx,wkdata.qy,"原始据点",1,0,300,1,"no_owner");
						player:alert(1,1,"行会贡献不满100点,占领失败!");
					end
				else
					map:mon_gen(wkdata.qx,wkdata.qy,"原始据点",1,0,300,1,"no_owner");
					player:alert(1,1,"尚未拥有行会,没有占领资格!");	
				end
			end
		end
	end
	
end
ckmon.add_caiji_listener("原始据点",yuanshipoint);

function bingpoint(player,mon,group)
	if player:get_guild() ~= "" then
		if player:get_guild_gx() >= 100 then
			if player:get_guild() == server.get_var("curldowner") then			
				player:alert(1,1,"您行会已经占领据点,请守好据点!");
			else
				server.set_var("curldowner",player:get_guild());
				server.set_var("ownertime",tostring(os.time()));
				player:sub_guild_gx(100);
				player:alert(1,1,"恭喜你成功占领据点!");
			end
		else
			player:alert(1,1,"行会贡献不满100点,占领失败!");
		end
	else
		player:alert(1,1,"尚未拥有行会,没有占领资格!");
	end
	local wk = weekday();
	if wk >= 1 and wk <= 5 then
		local wkdata = ld_data[wk];
		if wkdata then
			local map = server.find_map(wkdata.mapid);
			if map then
				map:mon_gen(wkdata.qx,wkdata.qy,"据点",1,0,300,1,"no_owner");
			end
		end
	end
end
ckmon.add_caiji_listener("据点",bingpoint);


--------------------------------------------------------------------------------------------------------
function openLingDI()
	server.set_var("server_ld_timer",tostring(os.time()));
	server.set_var("ownertime","");
	server.set_temp_var("ldzdzopen","1");
	server.set_var("curldowner","");
	local wk = weekday();
	if wk >= 1 and wk <= 5 then
		if wk == 1 then reset_player_mrczlj_info(); end
		local wkdata = ld_data[wk];
		if wkdata then
			server.set_var(wkdata.stay,"");
			local map = server.find_map(wkdata.mapid);
			if map then
				map:clear_mon_byname("原始据点");
				map:clear_mon_byname("据点");
				map:mon_gen(wkdata.qx,wkdata.qy,"原始据点",1,0,300,1,"no_owner");
			end
		end
		server.info(10010,0,"万众期待的领地争夺战开启了,速到战场为自己的行会出一份力吧!");
	end

	--server.server_exe("newgui.actinfo.fresh_actinfo_show");
	
end
function closeLingDI()
	if server.get_temp_var("ldzdzopen") == "0" then return; end
	server.set_temp_var("ldzdzopen","0");
	server.set_var("ownertime","");
	local wk = weekday();
	if wk >= 1 and wk <= 5 then
		local wkdata = ld_data[wk];
		if wkdata then
			if server.get_var("curldowner") ~= "" then
				server.set_var(wkdata.stay,server.get_var("curldowner"));
				
				server.info(10010,0,"恭喜"..server.get_var(wkdata.stay).."行会不负众望,成功占领"..wkdata.name..",会内成员获得丰厚奖励!");
				local guild = server.find_guild(server.get_var("curldowner"));
				if guild then
					if wk == 1 then
						for i = 1,5 do
							local gn = server.get_var("lingdiranka"..i);
							if gn ~= "" then
								local gg = server.find_guild(gn);
								if gg then
									gg:set_guild_jf(0);
								end
							end
						end
						guild:set_guild_jf(1);
					else
						guild:set_guild_jf(guild:get_guild_jf()+1);
					end
					ldxx_Recharge_process(server.get_var("curldowner"),guild:get_guild_jf());
				end
				server.set_var("curldowner","");
			else
				server.info(10010,0,"领地争夺战已经结束,尚未有行会占据当前领地!");
				
			end
			local map = server.find_map(wkdata.mapid);
			if map then
				map:map_exe("newgui.lingdi.gameover");
				map:clear_mon_byname("据点");
				map:clear_mon_byname("原始据点");
			end
		end
		server.server_exe("newgui.lingdi.giveLingDIAward");
	end
	
end
function gameover(player)
	player:set_timer(6,500);
	player:set_timer(22,0);
	player:set_panel_data("panelldtime","panelldtime","panel_visible","false");
	player:push_ckpanel_data("ldtime","panelldtime");
end

function giveLingDIAward(player)
	local wwk = tonumber(weekday());
	local ldk = ld_data[wwk];
	if ldk then
		if util.ppn(player,const.PP_GUILD_FIGHT_ENTER) == 1 then
			if player:get_guild() == "" then return end
			if util.ppn(player,const.PP_GUILD_BONUS_TODAY) ~= today() then
				player:set_param(const.PP_GUILD_BONUS_TODAY,today());
				if server.get_var(ldk.stay) ~= "" and player:get_guild() == server.get_var(ldk.stay) then
					player:add_exp(10000000);
					player:add_guild_gx(50);
					player:alert(1,1,"恭喜获得战场胜利奖励: 经验:1000w 帮会贡献:50 !");
				else
					player:add_exp(5000000);
					player:add_guild_gx(25);
					player:alert(1,1,"恭喜获得战场失败奖励: 经验:500w 帮会贡献:25 !");
				end
				player:set_timer(22,0);
			end
		end
	end	
end


function getItemAward(player,id)
	if player:get_guild() == "" then player:alert(1,1,"不具备领取资格!"); return; end
	local ld = ld_data[id];
	if ld then
		if tonumber(weekday()) == ld.week then
			if player:num_bag_black() < ld.item.slot then player:alert(1,1,"背包空余不足"..ld.item.slot.."格!"); return; end
			if player:get_guild() == server.get_var(ld.stay) then
				if util.ppn(player,const.PP_GUILD_ENTER_DAY) < today() then
					if util.ppn(player,ld.cst) >= 1 then player:alert(1,1,"您已经领取过该奖励!"); return; end
					player:add_item(ld.item.typeid,ld.item.number,1);
					player:set_param(ld.cst,1);
					player:alert(1,1,"成功领取领地争夺战奖励!");
				else
					player:alert(1,1,"加入行会当天不具备领取资格!");
				end
			end
		else
			player:alert(1,1,"当前地图不在开放时间!");
		end
	end
end
function yijianItemAward(player)
	if player:get_guild() == "" then player:alert(1,1,"不具备领取资格!"); return; end
	if player:num_bag_black() < 5 then player:alert(1,1,"背包空余不足5格!"); return; end
	local ttt = 0;
	for i=1,5 do
		local ld = ld_data[i];
		if ld then
			if tonumber(weekday()) == ld.week then
				if player:get_guild() == server.get_var(ld.stay) then
					if util.ppn(player,const.PP_GUILD_ENTER_DAY) < today() then
						if util.ppn(player,ld.cst) <= 0 then
							player:add_item(ld.item.typeid,ld.item.number,1);
							player:set_param(ld.cst,1);
							ttt = ttt + 1;
						end
					end
				end
			end
		end
	end
	if ttt > 0 then
		player:alert(1,1,"成功领取领地争夺战奖励!");
	else
		player:alert(1,1,"不满足领取条件!");
	end
end
--------------------------------------------------------------------------------------------------------
function enterLingDiFight(player,id)
	if player:get_level() < 50 then player:alert(1,1,"等级需要达到50级,无法参与!");return; end
	if player:get_guild() == "" then player:alert(1,1,"您尚未拥有行会,无法参与!");return; end
	local ld = ld_data[id];
	if ld then
		if tonumber(weekday()) == ld.week then
			if server.get_temp_var("ldzdzopen") == "1" then
				if player:get_map() and player:get_map():get_id() == ld.mapid then player:alert(1,1,"已经在争夺地图传送失败!"); return; end
				local map = server.find_map(ld.mapid);
				if map then
					player:set_param(const.PP_GUILD_FIGHT_ENTER,1)
					player:enter_map(ld.mapid,ld.x,ld.y);return;
				end
			else
				player:alert(1,1,"领地争夺战尚未开启!");
			end
		else
			player:alert(1,1,"当前地图不在开放时间!");
		end
	end
end

function freshLingDiDate(player)
	local tmp = tonumber(weekday());
	for i=1,5 do
		local ld = ld_data[i];
		player:set_panel_data(PANEL_ACTIONSET_NAME,"manorState"..i,"htmlText","<font color='#19b9bb'>未开始</font>");
		if ld.week < tmp then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"manorState"..i,"htmlText","<font color='#a40000'>已结束</font>");
		elseif ld.week > tmp then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"manorState"..i,"htmlText","<font color='#19b9bb'>未开始</font>");
		elseif ld.week == tmp then
			local h = os.date("%H%M",os.time());
			if tonumber(h) < 2000 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"manorState"..i,"htmlText","<font color='#19b9bb'>未开始</font>");
			elseif tonumber(h) > 2100 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"manorState"..i,"htmlText","<font color='#a40000'>已结束</font>");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"manorState"..i,"htmlText","<font color='#31aa0c'>进行中</font>");
			end
		end
	end
	for i = 1,5 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"manorGuildName"..i,"text",server.get_var("lingdiranka"..i));
		player:set_panel_data(PANEL_ACTIONSET_NAME,"manorGuildPoint"..i,"text",server.get_var("lingdirankb"..i));
	end
end

function onTalkldzdz1(player) enterLingDiFight(player,1) end
function onTalkldzdz2(player) enterLingDiFight(player,2) end
function onTalkldzdz3(player) enterLingDiFight(player,3) end
function onTalkldzdz4(player) enterLingDiFight(player,4) end
function onTalkldzdz5(player) enterLingDiFight(player,5) end

---------------------------------------------------------------------------------

function player_mrczlj_congzi(player,add)
	reset_player_mrczlj_info(player);
	player:set_param(const.PP_LEIJICZJL,util.ppn(player,const.PP_LEIJICZJL)+add);
end



function reset_player_ldinfo(player)
	if util.ppn(player,const.PP_GUILD_WEEKDAY) ~= week() then
		player:set_param(const.PP_GUILD_WEEKDAY,week());
		for i = 1,5 do
			player:set_param(ld_data[i].cst,0);
		end
	end
end

function reset_player_mrczlj_info()
	server.delete_guild_jf_all();
	for i = 1,6 do
		server.set_var("lingdiranka"..i,"");
		server.set_var("lingdirankb"..i,0);
	end
end


function ldxx_Recharge_process(guildname,jf)
	if guildname then
		for i = 1,6 do
			if guildname == server.get_var("lingdiranka"..i) then
				server.set_var("lingdirankb"..i,jf);
				ldxx_Recharge_chuli();
				ldxx_Recharge_chuli();
				return;
			end
		end
		if jf > util.svn("lingdirankb6") then
			server.set_var("lingdiranka6",guildname);
			server.set_var("lingdirankb6",jf);
			ldxx_Recharge_chuli();
			ldxx_Recharge_chuli();
		end
	end
end
function ldxx_Recharge_chuli()
	local Recharge = {};
	for u = 1,6 do
		table.insert(Recharge,{
			name = server.get_var("lingdiranka"..u),
			num = util.svn("lingdirankb"..u),
		})
	end
	local c = function(q,w) return tonumber(w.num) < tonumber(q.num) end
	table.sort(Recharge,c);
	for idx,value in ipairs(Recharge) do
		server.set_var("lingdiranka"..idx,value.name);
		server.set_var("lingdirankb"..idx,value.num);
	end
end

function onTalklingdiRule(player)
        player:echo([[            <font color="#FFFF00">领地争夺战战斗规则</font>
---------------------------------------
    1.<font color="#FFFF00">参与条件</font>
    玩家等级达到50级,并且在行会中.
---------------------------------------
    2.<font color="#FFFF00">活动时间</font>
    每周一~周五20:00至21:00 
    所有有行会的玩家自动获得参与资格,玩家点击界面中的区域地图图标,即可前往参加领地争夺战.
---------------------------------------
    3.<font color="#FFFF00">占领条件</font>
    行会成员进入领地战场,点击旗帜，读条成功后,可占领领地;
    读旗需要消耗100行会贡献,当行会贡献不足时,无法夺旗;
    占领领地后守住30分,旗帜没有易主即可直接占领领地,活动结束;
    若没有坚守30分钟,则活动结束时占领旗帜的帮派获胜.
---------------------------------------]]);
end

----------------------------跨服战----------------------------------
function enterCrossServerFight(player)
	if not activity.isKuafuOpen() then
		player:alert(1,1,"尚未开启,敬请期待!");
		return;
	end
	if player:get_level() < 70 then player:alert(1,1,"等级需要达到70级,无法参与!");return; end
	if player:get_guild() == "" then player:alert(1,1,"您尚未拥有行会,无法参与!");return; end
	if player:get_guild() ~= server.get_var("lingdiranka1") then player:alert(1,1,"所属行会在本周的领地争夺战中积分排名第一才可进入跨服战!");return;end
	--local isOpen = false;
	--if tonumber(weekday()) == 7 then
	--	local daytime = os.date("%H%M",os.time());
	--	if tonumber(daytime) >=2000 and tonumber(daytime) <= 2100 then
	--		isOpen = true;
	--	end
	--end
	--if isOpen then
	if server.get_kuafu_state() > 0 then
		player:set_param(const.PP_KUAFU_TIME,tostring(os.time()));
		player:gs_kuafu("","","test");                             
		server.info(100,0,"伟大的玩家"..player:get_name().."进入了跨服战,期待他为大家带来好消息!")
	else
		player:alert(1,1,"跨服战开放时间是每周日20:00至21:00 !");
	end
end

function kuafubegin(player)
	player:kuafu_set_jl_state(0);
	npc.renwu.fenghao.youxifh(player);
end

function kuafustop(player)
	player:set_timer(23,0);
	player:kuafu_back_gs("");
end