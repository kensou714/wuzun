module(..., package.seeall)
local ACTIONSET_NAME="shenqi";
local PANEL_ACTIONSET_NAME="panelshenqi";

function process_shenqi(player,actionset,panelid,actionid,data)
	if actionid == "shenQpre" then
		open_shenqi_prepanel(player);return;
	end
	if actionid == "upshqi" then
		upShenqiLevel(player,data);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_shenqi);

local sq_data={
	[1]={name="赤焰葫芦",resid=1101,detail={
		[1]={needstone=1},
		[2]={needstone=5},
		[3]={needstone=20},
		[4]={needstone=40},
		[5]={needstone=46},
		[6]={needstone=47},
		[7]={needstone=48},
		[8]={needstone=50},
		[9]={needstone=51},
		[10]={needstone=52},
		},
	},
	[2]={name="三阳葫芦",resid=1102,detail={
		[1]={needstone=106},
		[2]={needstone=109},
		[3]={needstone=111},
		[4]={needstone=114},
		[5]={needstone=116},
		[6]={needstone=118},
		[7]={needstone=121},
		[8]={needstone=123},
		[9]={needstone=126},
		[10]={needstone=128},
		},
	},
	[3]={name="神火葫芦",resid=1103,detail={
		[1]={needstone=196},
		[2]={needstone=199},
		[3]={needstone=203},
		[4]={needstone=206},
		[5]={needstone=210},
		[6]={needstone=214},
		[7]={needstone=217},
		[8]={needstone=221},
		[9]={needstone=224},
		[10]={needstone=228},
		},
	},
	[4]={name="紫晶玄珠",resid=1104,detail={
		[1]={needstone=309},
		[2]={needstone=314},
		[3]={needstone=318},
		[4]={needstone=323},
		[5]={needstone=328},
		[6]={needstone=333},
		[7]={needstone=338},
		[8]={needstone=342},
		[9]={needstone=347},
		[10]={needstone=352},
		},
	},
	[5]={name="阴雷玄珠",resid=1105,detail={
		[1]={needstone=446},
		[2]={needstone=452},
		[3]={needstone=458},
		[4]={needstone=464},
		[5]={needstone=470},
		[6]={needstone=476},
		[7]={needstone=482},
		[8]={needstone=488},
		[9]={needstone=494},
		[10]={needstone=500},
		},
	},
	[6]={name="九天玄珠",resid=1106,detail={
		[1]={needstone=759},
		[2]={needstone=768},
		[3]={needstone=777},
		[4]={needstone=786},
		[5]={needstone=795},
		[6]={needstone=804},
		[7]={needstone=813},
		[8]={needstone=822},
		[9]={needstone=831},
		[10]={needstone=840},
		},
	},
	[7]={name="昆仑阴阳镜",resid=1107,detail={
		[1]={needstone=1132},
		[2]={needstone=1144},
		[3]={needstone=1156},
		[4]={needstone=1168},
		[5]={needstone=1180},
		[6]={needstone=1192},
		[7]={needstone=1204},
		[8]={needstone=1216},
		[9]={needstone=1228},
		[10]={needstone=1240},
		},
	},
	[8]={name="法华金刚镜",resid=1108,detail={
		[1]={needstone=1878},
		[2]={needstone=1896},
		[3]={needstone=1914},
		[4]={needstone=1932},
		[5]={needstone=1950},
		[6]={needstone=1968},
		[7]={needstone=1986},
		[8]={needstone=2004},
		[9]={needstone=2022},
		[10]={needstone=2040},
		},
	},
	[9]={name="紫华炎火扇",resid=1109,detail={
		[1]={needstone=2744},
		[2]={needstone=2768},
		[3]={needstone=2792},
		[4]={needstone=2816},
		[5]={needstone=2840},
		[6]={needstone=2864},
		[7]={needstone=2888},
		[8]={needstone=2912},
		[9]={needstone=2936},
		[10]={needstone=2960},
		},
	},
	[10]={name="神罗大焰扇",resid=1110,detail={
		[1]={needstone=3730},
		[2]={needstone=3760},
		[3]={needstone=3790},
		[4]={needstone=3820},
		[5]={needstone=3850},
		[6]={needstone=3880},
		[7]={needstone=3910},
		[8]={needstone=3940},
		[9]={needstone=3970},
		[10]={needstone=4000},
		},
	},
	[11]={name="三宝琉璃塔",resid=1111,detail={
		[1]={needstone=5140},
		[2]={needstone=5180},
		[3]={needstone=5220},
		[4]={needstone=5260},
		[5]={needstone=5300},
		[6]={needstone=5340},
		[7]={needstone=5380},
		[8]={needstone=5420},
		[9]={needstone=5460},
		[10]={needstone=5500},
		},
	},
}

--打开预览
function open_shenqi_prepanel(player)
	fresh_shenqi_panel(player)
	player:set_panel_data("panelSqPre","panelSqPre","panel_visible","true");
	player:push_ckpanel_data("shenqiPre","panelSqPre");
end
local cost_perstone = 10;--缺少一个石头多少钱
function isOverMaxTimes(player,tag)
	local date = util.ppn(player,const.PP_JC_FBZK_DATE);
	if date == today() then
		local cs = util.ppn(player,const.PP_JC_FBZK_TIMES);
		if cs < 20 then 
			if tag then
				player:set_param(const.PP_JC_FBZK_TIMES,cs+1);
			end
			return false;
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"dazhepic","bgid","0");
			return true;
		end
	end
	return false;
end
function fresh_shenqi_panel(player)
	local jie = util.ppn(player,const.PP_SHENQI_JIELV);--阶
	local xing = util.ppn(player,const.PP_SHENQI_XINGLV);--星
	local nextj = jie;
	local nextx = xing+1;
	local c_jdata = sq_data[jie+1];--当前阶表
	if c_jdata then
		local c_xdata =  c_jdata.detail[xing];--当前星表
		local n_xdata = c_jdata.detail[xing+1];--下一星表
		local n_jdata = sq_data[jie+2];--下一阶表

		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCurSQlv","text",jie.."阶"..xing.."星");--当前阶星
		player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCurSQnm","text",c_jdata.name);--当前阶名称

		--十个星级亮点刷新
		for i=1,10 do
			if i <= xing then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcSQ"..i,"bgid",4012);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcSQ"..i,"bgid",4013);
			end
		end
		--右侧当前星级的属性
		if c_xdata then
			local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(40+jie,xing);
			if jie == 10 then
				shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(73,xing);
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCdc","text",""..sdc.." - "..sdc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCac","text",""..sac.." - "..sac2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCmc","text",""..smc.." - "..smc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCmac","text",""..smac.." - "..smac2);
			
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCsc","text",""..ssc.." - "..ssc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtChp","text",""..(shp/100.0).."%");  
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCmp","text",""..(smp/100.0).."%");  
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCbjp","text",""..(bjpb/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCbjc","text",""..bjes);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCzl","text",""..fight);
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCdc","text","0 - 0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCac","text","0 - 0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCmc","text","0 - 0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCmac","text","0 - 0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCsc","text","0 - 0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtChp","text","0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCmp","text","0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCbjp","text","0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCbjc","text","0");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtCzl","text","0");
		end

		if not n_xdata then
			if n_jdata then
				n_xdata = n_jdata.detail[1];
			end
			nextj = jie +1;
			nextx = 1;
		end
		if n_xdata then
			local stone = player:num_item("进阶石");
			local cost = (n_xdata.needstone - stone)*cost_perstone;
			if cost <= 0  then
				cost = 0;
			end
			if xing < 10 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNextSq","text",jie.."阶"..(xing+1).."星");--下一星阶
			else
				if jie < 10 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNextSq","text",(jie+1).."阶1星");
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNextSq","text","已达最高等级");
				end
			end

			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNeedSt","text",stone.." / "..n_xdata.needstone);--需求石头
			player:set_panel_data(PANEL_ACTIONSET_NAME,"dazhepic","bgid","0");
			---清明打折活动  or  精彩活动
			if activity.isshenqidazhe()  or newgui.jingcaihuodong.isOpenActivity(player,"fbzk") then
				if util.ppn(player,const.PP_SHENQI_JINJIE_TIMES) < 20 then
					if not isOverMaxTimes(player,false) then
						if util.ppn(player,const.PP_SHENQI_JIELV) >=0 and util.ppn(player,const.PP_SHENQI_JIELV)<= 3 then
							cost = math.floor(cost*0.95);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"dazhepic","bgid","3519");

						end
						if util.ppn(player,const.PP_SHENQI_JIELV) >=4 and util.ppn(player,const.PP_SHENQI_JIELV)<= 6 then
							cost = math.floor(cost*0.88);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"dazhepic","bgid","3518");

						end
						if util.ppn(player,const.PP_SHENQI_JIELV) >=7 and util.ppn(player,const.PP_SHENQI_JIELV)<= 10 then
							cost = math.floor(cost*0.8);
							player:set_panel_data(PANEL_ACTIONSET_NAME,"dazhepic","bgid","3517");

						end
					end
				end
			end
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNeedCost","text","消耗元宝:"..cost.."元宝");--消耗元宝补齐材料

			if jie < 10 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtTarSQj","text",(jie+1).."阶");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtTarSQn","text",n_jdata.name);
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtTarSQj","text","已达最高等级");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtTarSQn","text","");
			end
			local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(40+nextj,nextx);
			if nextj == 10 then
				shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(73,nextx);
			end
			--右侧下一星属性:
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNdc","text",""..sdc.." - "..sdc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNac","text",""..sac.." - "..sac2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNmc","text",""..smc.." - "..smc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNmac","text",""..smac.." - "..smac2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNsc","text",""..ssc.." - "..ssc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNhp","text",""..(shp/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNmp","text",""..(smp/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNbjp","text",""..(bjpb/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNbjc","text",""..bjes);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNzl","text",""..fight);
		else
			local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(73,10);

			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNextSq","text","最高等级");

			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNeedSt","text","0 / 0");--需求石头
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNeedCost","text"," ");--消耗元宝补齐材料

			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtTarSQj","text","已达最高等级");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtTarSQn","text"," ");

			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNdc","text",""..sdc.." - "..sdc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNac","text",""..sac.." - "..sac2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNmc","text",""..smc.." - "..smc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNmac","text",""..smac.." - "..smac2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNsc","text",""..ssc.." - "..ssc2);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNhp","text",""..(shp/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNmp","text",""..(smp/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNbjp","text",""..(bjpb/100.0).."%");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNbjc","text",""..bjes);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtNzl","text",""..fight);
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_shenqi_panel);

function upShenqiLevel(player,data)
	local jie = util.ppn(player,const.PP_SHENQI_JIELV);--阶
	local xing = util.ppn(player,const.PP_SHENQI_XINGLV);--星
	local c_jdata = sq_data[jie+1];--当前阶表
	local usevcoin = tonumber(data[1]);
	if c_jdata then
		local c_xdata =  c_jdata.detail[xing];--当前星表
		local n_xdata = c_jdata.detail[xing+1];--下一星表
		local n_jdata = sq_data[jie+2];--下一阶表
		if not n_xdata then
			if n_jdata then
				n_xdata = n_jdata.detail[1];
			end
		end
		if n_xdata then
			local stone = player:num_item("进阶石");
			if stone >= n_xdata.needstone then
				player:remove_item("进阶石",n_xdata.needstone);
				------------------------------------------------------
				local sucxing = xing + 1;
				local sucjie = jie;
				if sucxing > 10 then
					sucjie = jie + 1;
					sucxing = 1;
				end
				player:set_param(const.PP_SHENQI_XINGLV,sucxing);
				if sucjie == 0 and sucxing == 1 then
					player:change_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
				end
				if sucjie ~= jie then
					player:set_param(const.PP_SHENQI_JIELV,sucjie);
					newgui.jingcaihuodong.setawardpcon(player,"fbsj",sucjie);
					player:change_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
					player:clear_status(40+jie);
					server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将神器提升至[<font color='#ff0000'>"..n_jdata.name.."</font>]");
				end
				if util.ppn(player,const.PP_SHENQI_JIELV) >= 10 then
					player:set_status(73,86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
				else
					player:set_status(40+util.ppn(player,const.PP_SHENQI_JIELV),86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
				end
				player:alert(11,1,"恭喜您进阶成功!");

				if player:get_task_state(1105) == 1 then
					player:set_task_state(1105,2); player:push_task_data(1105,0);
					player:add_exp(100000);
					player:alert(10,1,"成功完成<font color='#ff0000'>神器进阶任务!</font>")
					player:alert(10,0,"经验值增加: <font color='#ff0000'>100000</font>")
					if player:achieve_get_param(1004) <= 0 then
						player:set_task_state(1106,1); player:push_task_data(1106,0);--行会
					end
				end
				------------------------------------------------------
			else
				if usevcoin == 1 then
					local cost = (n_xdata.needstone - stone)*cost_perstone;
					---清明打折活动 or 精彩活动
					if activity.isshenqidazhe() or newgui.jingcaihuodong.isOpenActivity(player,"fbzk") then
						if util.ppn(player,const.PP_SHENQI_JINJIE_TIMES) < 20 then
							if not isOverMaxTimes(player,false) then
								if util.ppn(player,const.PP_SHENQI_JIELV) >=0 and util.ppn(player,const.PP_SHENQI_JIELV)<= 3 then
									cost = math.floor(cost*0.95);
								end
								if util.ppn(player,const.PP_SHENQI_JIELV) >=4 and util.ppn(player,const.PP_SHENQI_JIELV)<= 6 then
									cost = math.floor(cost*0.88);
								end
								if util.ppn(player,const.PP_SHENQI_JIELV) >=7 and util.ppn(player,const.PP_SHENQI_JIELV)<= 10 then
									cost = math.floor(cost*0.8);
								end
							end
						end
					end
					if player:get_vcoin() >= cost then

						if newgui.jingcaihuodong.isOpenActivity(player,"fbzk") then
							--每天20次
							if cost < (n_xdata.needstone - stone)*cost_perstone then
								local date = util.ppn(player,const.PP_JC_FBZK_DATE);
								if date ~= today() then
									player:set_param(const.PP_JC_FBZK_DATE,today());
									player:set_param(const.PP_JC_FBZK_TIMES,1);
								else
									isOverMaxTimes(player,true);
								end
							end
						end

						if stone > 0 then player:remove_item("进阶石",stone);end
						player:sub_vcoin(cost,"jinjie");
						------------------------------------------------------
						local sucxing = xing + 1;
						local sucjie = jie;
						if sucxing > 10 then
							sucjie = jie + 1;
							sucxing = 1;
						end
						player:set_param(const.PP_SHENQI_XINGLV,sucxing);
						if sucjie == 0 and sucxing == 1 then
							player:change_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
						end
						if sucjie ~= jie then
							player:set_param(const.PP_SHENQI_JIELV,sucjie);
							newgui.jingcaihuodong.setawardpcon(player,"fbsj",sucjie);
							player:change_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
							player:clear_status(40+jie);
							server.info(100,1,"恭喜[<font color='#ff0000'>"..player:get_name().."</font>]成功将神器提升至[<font color='#ff0000'>"..n_jdata.name.."</font>]");
						end
						player:alert(11,1,"恭喜您进阶成功!");
						player:set_param(const.PP_SHENQI_JINJIE_TIMES,util.ppn(player,const.PP_SHENQI_JINJIE_TIMES)+1);
						if util.ppn(player,const.PP_SHENQI_JIELV) >= 10 then
							player:set_status(73,86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
						else
							player:set_status(40+util.ppn(player,const.PP_SHENQI_JIELV),86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
						end

						if player:get_task_state(1105) == 1 then
							player:set_task_state(1105,2); player:push_task_data(1105,0);
							player:add_exp(100000);
							player:alert(10,1,"成功完成<font color='#ff0000'>神器进阶任务!</font>")
							player:alert(10,0,"经验值增加: <font color='#ff0000'>100000</font>")
							if player:achieve_get_param(1004) <= 0 then
								player:set_task_state(1106,1); player:push_task_data(1106,0);--行会
							end
						end
						------------------------------------------------------
					else
						player:alert(11,1,"元宝不足"..cost..",进阶失败!");
					end
				else
					player:alert(11,1,"进阶石不足"..n_xdata.needstone.."个!");
				end
			end
		else
			player:alert(11,1,"您当前已达到最高神器等级!");
		end
	else
		player:alert(11,1,"您当前已达到最高神器等级!");
	end
	fresh_shenqi_panel(player);
end

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function process_sqpreview(player,actionset,panelid,actionid,data)
	if string.sub(actionid,1,3) == "btn" then
		local selected = tonumber(string.sub(actionid,4));
		fresh_preview_sqinfo(player,selected);return;
	end
end
ckpanel.add_listener("shenqiPre",process_sqpreview);

function fresh_preview_sqinfo(player,selected)
	local s_jdata = sq_data[selected];--选中阶表
	if s_jdata then
		local s_xdata = s_jdata.detail[10];
		if s_xdata then
			local shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(39+selected,10);
			if selected == 11 then
				shp,smp,sac,sac2,smac,smac2,sdc,sdc2,smc,smc2,ssc,ssc2,bjpb,bjes,nodef,fight = player:get_status_data(73,10);
			end
			player:set_panel_data("panelSqPre","txtPrej","text",(selected-1).."阶");
			player:set_panel_data("panelSqPre","txtPrex","text",s_jdata.name);

			player:set_panel_data("panelSqPre","txtPdc","text",""..sdc.." - "..sdc2);
			player:set_panel_data("panelSqPre","txtPac","text",""..sac.." - "..sac2);
			player:set_panel_data("panelSqPre","txtPmc","text",""..smc.." - "..smc2);
			player:set_panel_data("panelSqPre","txtPmac","text",""..smac.." - "..smac2);
			player:set_panel_data("panelSqPre","txtPsc","text",""..ssc.." - "..ssc2);
			player:set_panel_data("panelSqPre","txtPhp","text",""..(shp/100.0).."%");
			player:set_panel_data("panelSqPre","txtPmp","text",""..(smp/100.0).."%");
			player:set_panel_data("panelSqPre","txtPbjp","text",""..(bjpb/100.0).."%");
			player:set_panel_data("panelSqPre","txtPbjc","text",""..bjes);
			player:set_panel_data("panelSqPre","txtPzl","text",""..fight);
			player:push_ckpanel_data("shenqiPre","panelSqPre");
		end
	end	
end

function tishengyijifabao(player)
	local jie = util.ppn(player,const.PP_SHENQI_JIELV);--阶
	local xing = util.ppn(player,const.PP_SHENQI_XINGLV);--星
	local c_jdata = sq_data[jie+1];--当前阶表
	if c_jdata then
		local c_xdata =  c_jdata.detail[xing];--当前星表
		local n_xdata = c_jdata.detail[xing+1];--下一星表
		local n_jdata = sq_data[jie+2];--下一阶表
		if not n_xdata then
			if n_jdata then
				n_xdata = n_jdata.detail[1];
			end
		end
		if n_xdata then
				------------------------------------------------------
				local sucxing = xing + 1;
				local sucjie = jie;
				if sucxing > 10 then
					sucjie = jie + 1;
					sucxing = 1;
				end
				player:set_param(const.PP_SHENQI_XINGLV,sucxing);
				if sucjie == 0 and sucxing == 1 then
					player:change_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
				end
				if sucjie ~= jie then
					player:set_param(const.PP_SHENQI_JIELV,sucjie);
					player:change_fabao_res(1101+util.ppn(player,const.PP_SHENQI_JIELV));
					player:clear_status(40+jie);
				end
				player:set_status(40+util.ppn(player,const.PP_SHENQI_JIELV),86400,util.ppn(player,const.PP_SHENQI_XINGLV),1,1);
				--player:alert(11,1,"恭喜您进阶成功!");
				------------------------------------------------------
		else
			player:alert(11,1,"您当前已达到最高法宝等级!");
		end
	else
		player:alert(11,1,"您当前已达到最高法宝等级!");
	end
	fresh_shenqi_panel(player);
end