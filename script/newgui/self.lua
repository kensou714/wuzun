module(..., package.seeall)
local ACTIONSET_NAME="self";
local PANEL_ACTIONSET_NAME="panelself";
local temp_data;

function process_self(player,actionset,panelid,actionid,data)
	if actionid == "btnZQopen" then
		newgui.zuoqi.mountSHANGMA(player);return;
	end
	if actionid == "btnVipMRFL" then
		player:script_exe_code("newgui.self.processVipMRFL");
	end
	if actionid == "btnVipDTCS" then
		player:script_exe_code("newgui.self.processVipDTCS");
	end
	if actionid == "btnVipHYSD" then
		player:script_exe_code("newgui.self.processVipHYSD");
	end
	if actionid == "btnVipSSCK" then
		player:script_exe_code("newgui.self.processVipSSCK");
	end
	if actionid == "btnVipHHZT" then
		player:script_exe_code("newgui.self.processVipHHZT");
	end
	if actionid == "btnVipYJMC" then
		player:script_exe_code("newgui.self.processVipYJMC");
	end
	if actionid == "btnVipYJXL" then
		player:script_exe_code("newgui.self.processVipYJXL");
	end
	if actionid == "btnVipOthers" then
		player:script_exe_code("newgui.self.processVipOthers");
	end
	if actionid == "btnselfautoset" then
		newgui.ai.processDefaultSet(player);
		return
	end
	if actionid == "btnSt" then
		newgui.strong.process_strong(player);
		return
	end
	if actionid == "btnGz" then
		player:script_exe_code("newgui.newguanzhi.duigou");
		player:script_exe_code("newgui.newguanzhi.freshGzPanel");
		if  util.ppn(player,const.PP_GUANZHI)+1 < 5 then
			player:set_panel_data("panelshowpost","guanzhis","Xpage","0");
		else
			if util.ppn(player,const.PP_GUANZHI)+1 <= 11 then
				player:set_panel_data("panelshowpost","guanzhis","Xpage","1");
			else
				if  util.ppn(player,const.PP_GUANZHI)+1 <= 17 then
					player:set_panel_data("panelshowpost","guanzhis","Xpage","2");
				end
			end
		end
		player:set_panel_data("panelshowpost","showguanzhilist","selectedIndex",util.ppn(player,const.PP_GUANZHI)+1);
		player:push_ckpanel_data("showpost","panelshowpost");
		return
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"vipfunction","visible","false");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
ckpanel.add_listener(ACTIONSET_NAME,process_self);

function fresh_self_mountbtn(player)
	local zqlv = util.ppn(player,const.PP_NEW_ZUOQI_JIE_LEVEL);
	if zqlv >= 1 then
		local a,b,c=player:get_mount_info();
		if b <= 0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnZQopen","label","上马");
		else
			if player:get_mount_show() == 1 then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnZQopen","label","下马");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnZQopen","label","上马");
			end
		end
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnZQopen","lable","上马");
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
	
	if zqlv >= 1 then
		local a,b,c=player:get_mount_info();
		if b <= 0 then
			player:set_panel_data("panelzuoqi","btnSHANGMA","label","上马(X键)");
		else
			if player:get_mount_show() == 1 then
				player:set_panel_data("panelzuoqi","btnSHANGMA","label","下马(X键)");
			else
				player:set_panel_data("panelzuoqi","btnSHANGMA","label","上马(X键)");
			end
		end
	else
		player:set_panel_data("panelzuoqi","btnSHANGMA","lable","上马(X键)");
	end
	player:push_ckpanel_data("zuoqi","panelzuoqi");
end

function processVipMRFL(player)
	--每日福利: 每天可领取500绑定元宝 500000绑定金币
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		if util.ppn(player,const.PP_HUIYUAN_FULI) ~= today() then
			player:set_param(const.PP_HUIYUAN_FULI,today());
			player:add_vcoin_bind(500);
			player:add_gamemoney_bind(500000);
			player:alert(11,1,"恭喜您成功领取每日福利:");
			player:alert(11,0,"绑定元宝: 500");
			player:alert(11,0,"绑定金币: 500000");
		else
			player:alert(1,1,"会员福利每天只可以领取一次哦!")
		end
	else
	VIPSM(player);
	end
end
function processVipDTCS(player)
	--地图传送:便捷快速的传送到BOSS区域
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		vipcs(player);
	else
	VIPSM(player);
	end
end
function processVipHYSD(player)
	--会员神殿:会员可自由进入BOSS之家!
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:enter_map("huiyuan",230,192);
		go.givehuicheng(player);
		player:alert(1,1,"您成功进入会员神殿.");
	else
	VIPSM(player);
	end
end
--随身仓库: 随时随地使用仓库功能
function processVipSSCK(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:echo([[
您好,欢迎您使用<font color="#FFFF00">移动仓库</font>!
我将为您提供以下服务:
]]);
	player:echo([[
<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:local_depot">仓库服务</a> 
]]);
	else
	VIPSM(player);
	end
end
function processVipHHZT(player)
	--会员状态: 可获得一个会员附体状态!
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		if player:is_status(34) then
			player:alert(1,1,"您已经激活了vip状态.");
		else
			player:set_status(34,86400,1,1,1)
			player:alert(1,1,"成功激活了vip状态.");
		end
	else
	VIPSM(player);
	end
end
function processVipYJMC(player)
	--一键出售: 随时随地出售装备
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		ckpanel.open_yjchushou(player);
	else
	VIPSM(player);
	end
end
function processVipYJXL(player)
	--一键修理: 随时随地修理装备
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		local ret = tonumber(player:repair_all(0));
		local total = math.floor(ret/100);
		local real = ret - total*100;
		if ret <= 0 then
			player:alert(1,1,"没有需要修理的装备.");
		else
			if total == real then
				player:alert(1,1,"已修理全身所有装备!");
			else
				player:alert(1,1,"金币不足,一键修理未完成!");
			end
		end
	else
	VIPSM(player);
	end
end
function processVipOthers(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today()  or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
		player:alert(11,1,"VIP会员其他特权:");
		player:alert(11,0,"无限飞鞋: 无限使用传送功能!");
		player:alert(11,0,"打怪掉宝: 打怪掉宝提高[<font color='#FF0000'>1%</font>]!</font>");
		player:alert(11,0,"开启宝袋: 打开百宝袋[<font color='#FF0000'>30</font>]次!</font>");
		player:alert(11,0,"招财神符: 开招财神符[<font color='#FF0000'>40</font>]次!</font>");
		player:alert(11,0,"降妖除魔: 增加[<font color='#FF0000'>1</font>]次降妖除魔</font>");
		player:alert(11,0,"赏金猎人: 增加[<font color='#FF0000'>1</font>]次赏金猎人</font>");
		player:alert(11,0,"练级场地: 练级场地[<font color='#FF0000'>24</font>]小时!</font>");
		if  util.ppn(player,const.PP_HUIYUAN) >= today() then 
			player:alert(11,0,"会员时间: 将在[<font color='#FF0000'>"..(util.ppn(player,const.PP_HUIYUAN) - today()).."</font>]天后到期!");
		end
	else
	VIPSM(player);
	end
end

function VIPSM(player)
		player:echo([[--------------------------------------
<font color="#FF0000">对不起,您还没有成为VIP会员!</font>
--------------------------------------
<font color="#FFff00">成为VIP会员可以享受以下服务:</font>
--------------------------------------
1. 每日福利: <font color="#FFff00">绑定元宝[<font color="#FF0000">500</font>]
             绑定金币[<font color="#FF0000">500000</font>]</font>
2. 地图传送: <font color="#FFff00">快捷快速的到达BOSS地图!</font>
3. 会员神殿: <font color="#FFff00">大量BOSS的神殿,打宝圣地!</font>
4. 随身仓库: <font color="#FFff00">随时随地使用仓库!方便吧!</font>
5. 一键出售: <font color="#FFff00">随时一键出售装备!方便吧!</font>
6. 一键修理: <font color="#FFff00">随时一键修理装备!方便吧!</font>
7. <a href="event:talk_vipzt">会员状态</a>: <font color="#FFff00">获得VIP会员属性增益状态!</font>
8. 无限飞鞋: <font color="#FFff00">无限制使用任务传送功能!!</font>
9. 打怪掉宝: <font color="#FFff00">打怪掉宝几率提高[<font color="#FF0000">1%</font>]!</font>
10.开启宝袋: <font color="#FFff00">每天打开百宝袋[<font color="#FF0000">30</font>]次!</font>
11.招财神符: <font color="#FFff00">每天可打开招财神符[<font color="#FF0000">40</font>]次!</font>
12.降妖除魔: <font color="#FFff00">每天额外增加[<font color="#FF0000">1</font>]次降妖除魔</font>
13.赏金猎人: <font color="#FFff00">每天额外增加[<font color="#FF0000">1</font>]次赏金猎人</font>
14.练级场地: <font color="#FFff00">每天可在练级场地[<font color="#FF0000">24</font>]小时!</font>
--------------------------------------
##VIP会员(30天)## 需要:4500元宝
              <a href="event:talk_gmvip">购买VIP会员(30天)</a>
--------------------------------------]]);
end

function onTalkvipzt(player)
	player:alert(11,1,"VIP会员增益状态:");
	player:alert(11,0,"物理防御提升: 10-20");
	player:alert(11,0,"魔法防御提升: 10-20");
	player:alert(11,0,"物理攻击提升: 30-50");
	player:alert(11,0,"魔法攻击提升: 30-50");
	player:alert(11,0,"道术攻击提升: 30-50");
	VIPSM(player);
end

function onTalkgmvip(player)
	if player:get_vcoin() >= 4500 then
		if player:num_bag_black() >= 1 then
			player:sub_vcoin(4500,"huiyuan");
			player:add_item("VIP会员(30天)",1);
			player:alert(11,1,"成功购买[VIP会员(30天)]");
		else
			player:alert(1,1,"您的背包空格不足1格.无法购买!")
		end
	else
		player:alert(11,1,"您的元宝不足[4500],无法购买!");
	end
end

function vipcs(player)
	if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0 then
	player:echo([[--------------------------------------
<font color="#FFff00">欢迎您使用VIP会员传送功能!</font>
--------------------------------------
<font color="#FFaa00">请选择您想前往的险恶区域:</font>
--------------------------------------
  <a href="event:talk_xe1">[奴玛神殿]</a>  <a href="event:talk_xe2">[邪恶之谷]</a>  <a href="event:talk_xe3">[猪妖巢穴]</a>
--------------------------------------
  <a href="event:talk_xe4">[猛犸神殿]</a>  <a href="event:talk_xe5">[伏 魔 殿]</a>  <a href="event:talk_xe6">[蛮牛大殿]</a>
--------------------------------------
  <a href="event:talk_xe7">[妖月巢穴]</a>
--------------------------------------
<font color="#FFaa00">请选择您想前往的领主之家:</font>
--------------------------------------
  <a href="event:talk_lz1">[奴玛后宫]</a>  <a href="event:talk_lz2">[邪 龙 谷]</a>  <a href="event:talk_lz3">[猪妖魔窟]</a>
--------------------------------------
  <a href="event:talk_lz4">[猛犸后宫]</a>  <a href="event:talk_lz5">[蛮牛圣殿]</a>
--------------------------------------
<font color="#FFaa00">请选择您想前往的三大神殿:</font>
--------------------------------------
  <a href="event:talk_wwd">[武 威 殿]</a>  <a href="event:talk_lyt">[烈 焰 堂]</a>  <a href="event:talk_wjd">[无 极 殿]</a>
--------------------------------------
<font color="#FF0000">以上区域为BOSS出没区域,请您注意安全!</font>
--------------------------------------]]);
	end
end

function onTalkwwd(player) chuansong(player,"wwsd",10,40,"武威殿"); end
function onTalklyt(player) chuansong(player,"lysd",10,40,"烈焰堂"); end
function onTalkwjd(player) chuansong(player,"wjsd",10,40,"无极殿"); end

function onTalklz1(player) chuansong(player,"wmsm4",14,73,"奴玛后宫"); end
function onTalklz2(player) chuansong(player,"wgd6",16,17,"邪龙谷"); end
function onTalklz3(player) chuansong(player,"zhudong5",13,50,"猪妖魔窟"); end
function onTalklz4(player) chuansong(player,"zuma6",17,71,"猛犸后宫"); end
function onTalklz5(player) chuansong(player,"niumo5",20,20,"蛮牛圣殿"); end


function onTalkxe1(player) chuansong(player,"wmsm3",31,38,"奴玛神殿"); end
function onTalkxe2(player) chuansong(player,"wgd5",33,151,"邪恶之谷"); end
function onTalkxe3(player) chuansong(player,"zhudong4",33,161,"猪妖巢穴"); end
function onTalkxe4(player) chuansong(player,"zuma5",30,64,"猛犸神殿"); end
function onTalkxe5(player) chuansong(player,"fengmo4",166,166,"伏 魔 殿"); end
function onTalkxe6(player) chuansong(player,"niumo4",22,26,"蛮牛大殿"); end
function onTalkxe7(player) chuansong(player,"chiyue4",26,55,"妖月巢穴"); end

function chuansong(player,a,b,c,d)
	if a and b and c and d then
		if util.ppn(player,const.PP_HUIYUAN) >= today() or util.ppn(player,const.PP_TEMP_VIP_TIMER) > 0  then
			player:enter_map(a,b,c);
			player:alert(11,1,"使用会员传送进入["..d.."]")
		else
			player:alert(1,1,"由于您不是VIP会员,无法使用传送功能!");
		end
	end
end
