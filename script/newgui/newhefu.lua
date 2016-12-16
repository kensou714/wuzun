module(..., package.seeall)
local ACTIONSET_NAME="Newhefu";
local PANEL_ACTIONSET_NAME="panelNewhefu";

local lb_data = {
	[1]={
			title = "75级礼包",lbward={
				[1] ={attr = "四倍宝典", sl = 1},
				[2] ={attr = "镇魔令大包", sl = 1},
				[3] ={attr = "荣誉令牌(1000)", sl = 1},
			},bdyb = "2000",jb = "500000",needbags = 3,
	},
	[2]={
			title = "85级礼包",lbward={
				[1] ={attr = "四倍宝典", sl = 1},
				[2] ={attr = "聚灵珠", sl = 1},
				[3] ={attr = "祈灵玉", sl = 1},
			},bdyb = "3000",jb = "500000",needbags = 3,
	},
	[3]={
			title = "一转礼包",lbward={
				[1] ={attr = "八倍宝典", sl = 1},
				[2] ={attr = "镇魔令大包", sl = 1},
				[3] ={attr = "祈灵玉", sl = 1},
			},bdyb = "5000",jb = "1000000",needbags = 3,
	},
	[4]={
			title = "二转礼包",lbward={
				[1] ={attr = "八倍宝典", sl = 1},
				[2] ={attr = "灵羽宝箱", sl = 1},
				[3] ={attr = "聚灵珠", sl = 1},
			},bdyb = "5000",jb = "2000000",needbags = 3,
	},
};

function process_NewhefuActivity(player,actionset,panelid,actionid,data)
	if string.sub(actionid,1,9) == "btnhfhklb" then
		local lv = tonumber(string.sub(actionid,10));
		newhfHuiKuiLB(player,lv);return;
	end

	if string.sub(actionid,1,8) == "btnczphb" then
		local lv = tonumber(string.sub(actionid,9));
		newhfCZhiRankLB(player,lv);return;
	end

	if actionid == "btnczdfl" then
		newhfCZhiFanli(player);return;
	end

	if actionid == "btnnewhfphb" then
		fresh_newhfRank_info(player);return;
	end

	if actionid == "btnhczbs" then
		newhfHoldGuildLB(player);return;
	end

	if actionid == "btnOne" then
		newhfLuckyChjiang(player);return;
	end

	if string.sub(actionid,1,12) == "zcshangcheng" then
		local lv = tonumber(string.sub(actionid,13));
		hfzcshangcheng(player,lv);return;
	end

end
ckpanel.add_listener(ACTIONSET_NAME,process_NewhefuActivity);


function check_newhfbtn_show(player)
	--检测符合合服 显示界面按钮
	if  is_merge_server() then
		player:set_panel_data("panelminimapfun","btnNewhefu","visible","true");
	else
		player:set_panel_data("panelminimapfun","btnNewhefu","visible","false");
		
	end
	player:set_panel_data("panelminimapfun","btnHBox2","visible","true");
	player:push_ckpanel_data("minimapfun","panelminimapfun");
	reset_player_svrmeg_info(player);
end
login.add_login_listener(check_newhfbtn_show);

function reset_player_svrmeg_info(player)
--    如果要测试领取,刷第六天的时候把这个注释打开不清理充值累计信息.
	if player:get_param(const.PP_NEW_SVRMEG_TAG) ~= server.get_var("server_merge_time") then
		player:set_param(const.PP_NEW_SVRMEG_TAG,server.get_var("server_merge_time"));
		if player:get_level() >= 75  or util.ppn(player,const.PP_ZHUANSHENGLEVEL)  >= 1 then
			player:set_param(const.PP_HF_HFHKDLB,1);
		else
			player:set_param(const.PP_HF_HFHKDLB,0);
		end
		player:set_param(const.PP_SVRMEG_CONGZI,0);
		player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);
	end
	if reset_merge_seed() > 0 then	
		if util.ppn(player,const.PP_SVRMEG_LOGTIME) ~= util.svn("merge_log_time") then
			player:set_param(const.PP_SVRMEG_LOGTIME,util.svn("merge_log_time"));
			
			--player:set_param(const.PP_SVRMEG_CONGZI,0);
			--player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);

			player:set_param(const.PP_HF_XIAOFEI_LQ,0);
			player:set_param(const.PP_HF_XIAOFEI_YB,0);
			player:set_param(const.PP_HF_CZYB_TEMP,0);
		end
	end
end

function newhefubutton(player)
	--local tmp =  today()*24*60*60;
	--local timestart = tmp - server_merge_time();
	--local timeend1 = timestart + 4*60*60*24;
	--local timeend2 = timestart + 2*60*60*24;
	--if timestart >= 0 then
		--player:set_panel_data("panelNewhefu","hftime1","htmlText","活动时间: "..os.date("%Y年%m月%d日",timestart).." - "..os.date("%Y年%m月%d日",timeend1));
		--player:set_panel_data("panelNewhefu","hftime2","htmlText","活动时间: "..os.date("%Y年%m月%d日",timestart).." - "..os.date("%Y年%m月%d日",timeend1));
		--player:set_panel_data("panelNewhefu","hftime3","htmlText","活动时间: "..os.date("%Y年%m月%d日",timestart).." - "..os.date("%Y年%m月%d日",timeend1));
		--player:set_panel_data("panelNewhefu","hftime4","htmlText","活动时间: "..os.date("%Y年%m月%d日",timestart).." - "..os.date("%Y年%m月%d日",timeend1));
		--player:set_panel_data("panelNewhefu","hftime5","htmlText","活动时间: "..os.date("%Y年%m月%d日",timestart).." - "..os.date("%Y年%m月%d日",timeend1));
		--player:set_panel_data("panelNewhefu","hftime6","htmlText","活动时间: "..os.date("%Y年%m月%d日",timestart).." - "..os.date("%Y年%m月%d日",timeend2));
	--end

 
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hfhklable1","htmlText","<font color='#7eff00' size='15'>服务器当前合服第<font color='#FFFF00'> ["..(server_merge_day()+1).."] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hfhklable2","htmlText","<font color='#7eff00' size='15'>服务器当前合服第<font color='#FFFF00'> ["..(server_merge_day()+1).."] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hfhklable3","htmlText","<font color='#7eff00' size='15'>服务器当前合服第<font color='#FFFF00'> ["..(server_merge_day()+1).."] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hfhklable4","htmlText","<font color='#7eff00' size='15'>服务器当前合服第<font color='#FFFF00'> ["..(server_merge_day()+1).."] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hfhklable5","htmlText","<font color='#7eff00' size='15'>服务器当前合服第<font color='#FFFF00'> ["..(server_merge_day()+1).."] </font>天 </font>");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"hfhklable6","htmlText","<font color='#7eff00' size='15'>服务器当前合服第<font color='#FFFF00'> ["..(server_merge_day()+1).."] </font>天 </font>");


	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(newhefubutton);

function newhfHuiKuiLB(player,lv)
	if not is_merge_server() then 
		player:alert(1,1,"当前不在活动时间内");
		return; 
	end

	if server_merge_day() >= 6  then
		player:alert(1,1,"合服回馈大礼包活动已经结束!");
		return;
	end

	local data = lb_data[lv];

	if lv == 1 then
		if player:get_level() < 75 then
			player:alert(1,1,"等级不足75级不可领取该级别合区礼包!");
			return;
		end
	end
	if lv == 2 then
		if player:get_level() < 85 then
			player:alert(1,1,"等级不足85级不可领取该级别合区礼包!");
			return;
		end
	end
	if lv == 3 then
		if util.ppn(player,const.PP_ZHUANSHENGLEVEL) < 1 then
			player:alert(1,1,"转生等级不足1级不可领取该级别合区礼包!");
			return;
		end
	end
	if lv == 4 then
		if util.ppn(player,const.PP_ZHUANSHENGLEVEL) < 2 then
			player:alert(1,1,"转生等级不足2级不可领取该级别合区礼包!");
			return;
		end
	end

	if util.ppn(player,const.PP_HF_HFHKDLB) <= 1 then
		if player:num_bag_black() >= data.needbags then
			local award = data.lbward;
			local  info = "恭喜您成功领取";

			for i=1,#award do
				player:add_item(award[i].attr,award[i].sl,1);
				info=info.."<br>"..award[i].attr.."        数量:"..award[i].sl;
			end
			player:add_vcoin_bind(data.bdyb);
			info= info.."<br>绑定元宝("..data.bdyb..")  数量:1";
			player:add_gamemoney(data.jb);
			info=info.."<br>绑定金币("..data.jb..") 数量:1";
			player:set_param(const.PP_HF_HFHKDLB,2);
			player:alert(11,1,info);
		else
			player:alert(1,1,"背包空格不足3格,无法领取!");
		end
	else
		player:alert(1,1,"您已经领取过该礼包,无法再领取!");
	end
end


function fresh_newhfRank_info(player)
	--刷新充值排名
	if server.get_var("svrmegcza1") == nil or server.get_var("svrmegcza1") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hfczpm1","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hfczpm1","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza1").."</font><font color='#FF0000'>"..server.get_var("svrmegczc1").."</font>");
	end
	if server.get_var("svrmegcza2") == nil or server.get_var("svrmegcza2") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hfczpm2","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hfczpm2","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza2").."</font><font color='#FF0000'>"..server.get_var("svrmegczc2").."</font>");
	end
	if server.get_var("svrmegcza3") == nil or server.get_var("svrmegcza3") == "" then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hfczpm3","htmlText","<font color='#FFFF00'>暂无玩家上榜</font>");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hfczpm3","htmlText","<font color='#FFFF00'>"..server.get_var("svrmegcza3").."</font><font color='#FF0000'>"..server.get_var("svrmegczc3").."</font>");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtljczyb","text",util.ppn(player,const.PP_SVRMEG_CONGZI));
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function newhfCZhiRankLB(player,lv)
	if not is_merge_server() then  player:alert(1,1,"当前不在活动时间内");return; end
	if server_merge_day() <= 4 then
		player:alert(1,1,"请在合区5天后再来领取奖励吧!");
		return;
	end
	local a = player:get_name();
	if a == server.get_var("svrmegcza"..lv) then
		if server.get_var("svrmegczc"..lv) == "" then
			if lv == 1 then
				if player:num_bag_black() >= 2 then
					server.set_var("svrmegczc"..lv,"已领取");
					player:add_item("兵马大元帅盔",1);
					player:add_item("十级宝石",1);
					player:alert(11,1,"成功领取充值排名第一奖励!");
					player:alert(11,0,"兵马大元帅盔 数量:1");
					player:alert(11,0,"十级宝石     数量:1");
				else
					player:alert(1,1,"背包空格不足2格!无法领取!");
				end
			end
			if lv == 2 then
				if player:num_bag_black() >= 2 then
					server.set_var("svrmegczc"..lv,"已领取");
					player:add_item("镇国大将军链",1);
					player:add_item("七级攻击玄晶",1);
					player:alert(11,1,"成功领取充值排名第二奖励!");
					player:alert(11,0,"镇国大将军链 数量:1");
					player:alert(11,0,"七级攻击玄晶 数量:1");
				else
					player:alert(1,1,"背包空格不足2格!无法领取!");
				end
			end
			if lv == 3 then
				if player:num_bag_black() >= 2 then
					server.set_var("svrmegczc"..lv,"已领取");
					player:add_item("抚国大将军戒",1);
					player:add_item("六级攻击玄晶",1);
					player:alert(11,1,"成功领取充值排名第三奖励!");
					player:alert(11,0,"抚国大将军戒 数量:1");
					player:alert(11,0,"六级攻击玄晶 数量:1");
				else
					player:alert(1,1,"背包空格不足2格!无法领取!");
				end
			end
		else
			player:alert(1,1,"您已经领取过该奖励了!");
		end
	else
		player:alert(1,1,"由于您不在排名中,无法领取奖励!");
	end
end

function newhfCZhiFanli(player)
	--合服充值返利
	--player:alert(1,1,"正在处理合服充值返利!");
	if not is_merge_server() then player:alert(1,1,"当前不在活动时间内"); return; end

	if server_merge_day() >= 6  then
		player:alert(1,1,"合服充值返利活动已经结束!");
		return;
	end

	local b = util.ppn(player,const.PP_SVRMEG_CONGZI_FANHUAN);
	if b > 0 then
		--print(b);
		player:add_vcoin_best_enable(b);
		player:alert(11,1,"恭喜您成功领取[合区充值大返利]");
		player:alert(11,0,"获得元宝:<font color='#ff0000'>"..b.."</font>");
		player:set_param(const.PP_SVRMEG_CONGZI_FANHUAN,0);
	else
		player:alert(1,1,"对不起,您当前没有累计到任何充值返利,无法领取!!");
	end
end

function freshHfGuildInfo(player)
	if not is_merge_server() then return; end
	local lqcheck = "未领取";
	if server.get_var("lq_kgguild") == "" then else lqcheck = "已领取" end
	if server.get_var("king3name") == nil or server.get_var("king3name") == "" then
		local kguild = server.get_king_guild();
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hanghui","htmlText",kguild);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"shijian","htmlText",server.get_var("hold_guild").." 天");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"hanghui","htmlText",server.get_var("king3name").."["..lqcheck.."]");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"shijian","htmlText","3 天");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(freshHfGuildInfo);

function newhfHoldGuildLB(player)
	--连续三天守住王城
	--player:alert(1,1,"正在处理合服连续三天守住王城!");
	if not is_merge_server() then  player:alert(1,1,"当前不在活动时间内");return; end
	if server_merge_day() <= 1 then player:alert(1,1,"占领三天后才可以领取该奖励!");return; end
	if server.get_var("king3name") == nil or server.get_var("king3name") == "" then
		player:alert(1,1,"尚未有人连续三天占领皇城!");return;
	end
	if  player:get_guild() ~= "" and player:get_guild() == server.get_var("king3name")  and 1000==player:get_guild_title() then
		if server.get_var("lq_kgguild") == ""  then
			if player:num_bag_black() >= 1 then
				server.set_var("lq_kgguild","已领取");
				player:add_vcoin_best_enable(20000);
				player:add_item("镇国大将军链",1);
				player:alert(11,1,"恭喜您成功领取[20000元宝]");
				player:alert(11,1,"恭喜您成功领取[镇国大将军链*1]");
				freshHfGuildInfo(player);
			else
				player:alert(11,1,"背包空格不满一格!");
			end
		else
			player:alert(11,1,"王城奖励已被领取!");
		end
	else
		player:alert(1,1,"您不是会长,或尚未满足领取条件!");
	end
end

function xunbao(player)
	local z = math.random(1,1000);
	local a = {
		[1]={y=math.random(200,500)},
		[2]={y=math.random(8000,15000)},
		[3]={y=math.random(80000,150000)},
		};
	local eq={[1]="·武威",[2]="·烈焰",[3]="·无极"};
	local sui = math.random(1,3);
	local job = eq[sui];
        local b = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶"};
        local c = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶"};
        local d = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶"};
        local e = {"二级生命玄晶","二级攻击玄晶","二级物防玄晶","二级魔防玄晶","三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶"};
        local f = {"三级生命玄晶","三级攻击玄晶","三级物防玄晶","三级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶"};
        local g = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","四级生命玄晶","四级攻击玄晶","四级物防玄晶","四级魔防玄晶","完美的天威头盔"..job,"完美的天威项链"..job,"完美的天威护腕"..job,"完美的天威戒指"..job,"完美的天威腰带"..job,"完美的天威靴"..job,"天威炎阳甲"..job,"天威炎阳衣"..job,"天威炎阳剑"..job};
        local h = {"五级生命玄晶","五级攻击玄晶","五级物防玄晶","五级魔防玄晶","六级生命玄晶","六级攻击玄晶","六级物防玄晶","六级魔防玄晶","七级宝石","八级宝石","九级宝石","七级灵羽","八级灵羽","完美的神皇头盔"..job,"完美的神皇项链"..job,"完美的神皇护腕"..job,"完美的神皇戒指"..job,"完美的神皇腰带"..job,"完美的神皇靴"..job,"神皇震威甲"..job,"神皇震威衣"..job,"神皇震威剑"..job};
        local k = {"七级生命玄晶","七级攻击玄晶","七级物防玄晶","七级魔防玄晶","八级灵羽","八级宝石","九级宝石","十级宝石","抚国大将军戒","镇国大将军链","兵马大元帅盔","神器积分[1000分]","游龙裂天剑·武威","游龙裂天剑·烈焰","游龙裂天剑·无极"};
			if util.svn("xscjhj") >= 5000 then
			server.set_var("xscjhj",0);
			local i = k[math.random(#k)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运转盘功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运转盘功能获得:"..i);
			return;
		end
		if z >= 1 and z <= 380 then
		local x = a[math.random(1,3)];
			if x == a[1] then
				player:add_vcoin(a[1].y);
				player:alert(11,1,"通过幸运转盘获得[绑定元宝]:<font color='#ff0000'>"..a[1].y.."</font>");
			return;
			end
			if x == a[2] then
				local j = a[2].y*math.min(80,player:get_level())
				player:add_exp(j);
				player:alert(11,1,"通过幸运转盘获得[经验]:<font color='#ff0000'>"..j.."</font>");
			return;
			end
			if x == a[3] then
				player:add_gamemoney(a[3].y);
				player:alert(11,1,"通过幸运转盘获得[金币]:<font color='#ff0000'>"..a[3].y.."</font>");
			return;
			end
		end
		if z >= 381 and z <= 630 then
			local i = b[math.random(#b)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 631 and z <= 750 then
			local i = c[math.random(#c)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 751 and z <= 850 then
			local i = d[math.random(#d)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 851 and z <= 920 then
			local i = e[math.random(#e)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 921 and z <= 960 then
			local i = f[math.random(#f)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(11,1,"通过幸运转盘获得:<font color='#ff0000'>"..i.."</font>");
			return;
		end
		if z >= 961 and z <= 990 then
			local i = g[math.random(#g)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运转盘功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运转盘功能获得:"..i);
			return;
		end
		if z >= 991 and z <= 1000 then
			local i = h[math.random(#h)];
			player:add_item_log(i,202,1);
			local j = math.random(200000,500000);
			player:add_exp(j);
			player:alert(1,1,"通过幸运转盘获得:"..i);
			server.info(10,0,"勇士[<font color='#ff0000'>"..player:get_name().."</font>]通过幸运转盘功能获得:<font color='#ff0000'>"..i.."</font>");
			server.info(10000,0,"勇士["..player:get_name().."]通过幸运转盘功能获得:"..i);
			return;
		end
end

function newhfLuckyChjiang(player)
	--合服幸运抽奖
	--player:alert(1,1,"正在处理合服幸运抽奖!");
	if not is_merge_server() then  player:alert(1,1,"当前不在活动时间内");return; end

	if server_merge_day() >= 6  then
		player:alert(1,1,"合服玄晶转盘活动已经结束!");
		return;
	end
	if player:get_vcoin() > 288 then
		if player:num_bag_black() >= 1 then
			xunbao(player);
			player:sub_vcoin(288,"288choujiang");
		else
			player:alert(11,1,"背包空格不满一格!");
		end
	else
		player:alert(11,1,"您的元宝不足!");
	end
end

local shop_data={
		[1] = {	name = "超级祝福油",id = 15003,need = 8640, },
		[2] = {	name = "镇魔令大包",id = 15050,need = 800, },
		[3] = {	name = "七级宝石",id = 10141,need = 5888, },
		[4] = {	name = "八级宝石",id = 10142,need = 18888, },
		[5] = {	name = "幸运神符(40%)",id = 10154,need = 1902, },
		[6] = {	name = "幸运神符(50%)",id = 10155,need = 3840, },
		[7] = {	name = "超级融合符",id = 10160,need = 25920, },
		[8] = {	name = "七彩石",id = 10092,need = 3200, },
};

function hfzcshangcheng(player,lv)
	if not is_merge_server() then  player:alert(1,1,"当前不在活动时间内");return; end

	if server_merge_day() >= 4  then
		player:alert(1,1,"合服折扣商城活动已经结束!");
		return;
	end

	local data = shop_data[lv];

	if player:num_bag_black() >= 1 then
		if  player:get_vcoin() >= data.need then
			player:add_item(data.name,1);
			player:sub_vcoin(data.need,"hefushop"..lv);
			player:alert(11,1,"成功购买"..data.name.."!");
		else
			player:alert(11,1,"您的元宝不足,无法购买!");
		end
	else
		player:alert(11,1,"背包空格不满一格!!");
	end
end