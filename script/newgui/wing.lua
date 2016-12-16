module(..., package.seeall)
local ACTIONSET_NAME="wing";
local PANEL_ACTIONSET_NAME="panelwing";

-------------------------------------------翅膀----------光翼--------------------------------------------------
local gy_data = {
	[1]={"3727","3","30-50","","玄光翼(1级)","275"};--你一个字段已废，换做swf的显示
	[2]={"3728","7","30-50","10182","寒光翼(2级)","307"};
	[3]={"3729","12","30-50","10183","凛光翼(3级)","364"};
	[4]={"3730","18","30-50","10184","棱光翼(4级)","478"};
	[5]={"3731","25","30-50","10185","极光翼(5级)","706"};
	[6]={"3732","32","30-50","10186","奔雷之翼(6级)","1105"};
	[7]={"3733","40","30-50","10187","雷劫之翼(7级)","1789"};
	[8]={"3734","50","30-50","10188","雷神之翼(8级)","2872"};
	[9]={"3735","61","30-50","10189","遮天鹏翼(9级)","4468"};
	[10]={"3736","72","30-50","10190","霸天玄翼(10级)","6577"};
	[11]={"3683","85","30-50","10191","九阳炽翼(11级)","9769"};
	[12]={"3684","100","30-50","10216","至高天翼(12级)","14500"};
}
local gy_data2 = {
	[2]={"190001","三级灵羽","玄光翼(1级)","寒光翼(2级)","190002"};
	[3]={"190002","四级灵羽","寒光翼(2级)","凛光翼(3级)","190003"};
	[4]={"190003","五级灵羽","凛光翼(3级)","棱光翼(4级)","190004"};
	[5]={"190004","六级灵羽","棱光翼(4级)","极光翼(5级)","190005"};
	[6]={"190005","七级灵羽","极光翼(5级)","奔雷之翼(6级)","190006"};
	[7]={"190006","八级灵羽","奔雷之翼(6级)","雷劫之翼(7级)","190007"};
	[8]={"190007","九级灵羽","雷劫之翼(7级)","雷神之翼(8级)","190008"};
	[9]={"190008","十级灵羽","雷神之翼(8级)","遮天鹏翼(9级)","190009"};
	[10]={"190009","十一级灵羽","遮天鹏翼(9级)","霸天玄翼(10级)","190010"};
	[11]={"190010","十二级灵羽","霸天玄翼(10级)","九阳炽翼(11级)","190011"};
	[12]={"190011","十三级灵羽","九阳炽翼(11级)","至高天翼(12级)","190012"};
}
function showpanel(player)
	showOwnwing(player);
	showOwnaddwing(player);
	player:set_panel_data("panelwing","panelwing","panel_visible","true");
	player:push_ckpanel_data("wing","panelwing");
end
--当前的翅膀
function playshowpre(player,a,b,c,d,e,f,g,zhanli)--1
	player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcchibang1","bgid",""..a.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpWuli","text",""..b.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpMofa","text",""..c.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpWG","text",""..d.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpMG","text",""..e.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpDG","text",""..f.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtprewing","text",""..g.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"gcppzhanli","point",""..zhanli.."");
end
function onPshow0(player) playshowpre(player,"0","0-0","0-0","0-0","0-0","0-0","","0");end
function onPshow1(player) playshowpre(player,"190007","1-2","0-1","3-5","3-5","3-5","精灵羽(1级)","25");end    --1
function onPshow2(player) playshowpre(player,"190008","3-5","2-3","6-10","6-10","6-10","虹霓羽(2级)","57");end --2
function onPshow3(player) playshowpre(player,"190009","6-10","4-6","12-20","12-20","12-20","碧焰羽(3级)","114");end --3
function onPshow4(player) playshowpre(player,"190010","12-20","8-12","24-40","24-40","24-40","赤霞翼(4级)","228");end --4
function onPshow5(player) playshowpre(player,"190011","24-40","16-24","48-80","48-80","48-80","冥光翼(5级)","456");end--5
function onPshow6(player) playshowpre(player,"190012","45-75","30-45","90-150","90-150","90-150","苍龙翼(6级)","855");end--6
function onPshow7(player) playshowpre(player,"190013","81-135","54-81","162-270","162-270","162-270","金天圣羽(7级)","1539");end---7
function onPshow8(player) playshowpre(player,"190014","138-230","92-138","276-460","276-460","276-460","烈焰炽羽(8级)","2622");end--8
function onPshow9(player) playshowpre(player,"190015","222-370","148-222","444-740","444-740","444-740","帝霄仙羽(9级)","4218");end--9
function onPshow10(player) playshowpre(player,"190016","333-555","222-333","666-1110","666-1110","666-1110","天皇神翼(10级)","6327");end--10
function onPshow11(player) playshowpre(player,"190017","501-835","334-501","1002-1670","1002-1670","1002-1670","九天羽皇(11级)","9519");end--11
function onPshow12(player) playshowpre(player,"190018","750-1250","500-750","1500-2500","1500-2500","1500-2500","诛神凤翎(12级)","14250");end--12
function onPshow13(player) playshowpre(player,"190019","1000-1750","650-1000","2400-4000","2400-4000","2400-4000","炽天使之翼(13级)","23010");end--12

--下一级的翅膀
function playshownext(player,a,b,c,d,e,f,g,h,zhanli)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"gmcchibang2","bgid",""..a.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNWuli","text",""..b.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNMofa","text",""..c.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNWG","text",""..d.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNMG","text",""..e.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNDG","text",""..f.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ggtbt","typeid",""..g.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnextwing","text",""..h.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"gcpnzhanli","point",""..zhanli.."");
end
function onshow1(player) playshownext(player,"190007","1-2","0-1","3-5","3-5","3-5","10180","精灵羽(1级)","25");end--1
function onshow2(player) playshownext(player,"190008","3-5","2-3","6-10","6-10","6-10","10181","虹霓羽(2级)","57");end--2
function onshow3(player) playshownext(player,"190009","6-10","4-6","12-20","12-20","12-20","10182","碧焰羽(3级)","114");end--3
function onshow4(player) playshownext(player,"190010","12-20","8-12","24-40","24-40","24-40","10183","赤霞翼(4级)","228");end--4
function onshow5(player) playshownext(player,"190011","24-40","16-24","48-80","48-80","48-80","10184","冥光翼(5级)","456");end--5
function onshow6(player) playshownext(player,"190012","45-75","30-45","90-150","90-150","90-150","10185","苍龙翼(6级)","855");end--6
function onshow7(player) playshownext(player,"190013","81-135","54-81","162-270","162-270","162-270","10186","金天圣羽(7级)","1539");end--7
function onshow8(player) playshownext(player,"190014","138-230","92-138","276-460","276-460","276-460","10187","烈焰炽羽(8级)","2622");end--8
function onshow9(player) playshownext(player,"190015","222-370","148-222","444-740","444-740","444-740","10188","帝霄仙羽(9级)","4218");end--9
function onshow10(player) playshownext(player,"190016","333-555","222-333","666-1110","666-1110","666-1110","10189","天皇神翼(10级)","6327");end--10
function onshow11(player) playshownext(player,"190017","501-835","334-501","1002-1670","1002-1670","1002-1670","10190","九天羽皇(11级)","9519");end--11
function onshow12(player) playshownext(player,"190018","750-1250","500-750","1500-2500","1500-2500","1500-2500","10191","诛神凤翎(12级)","14250");end--12
function onshow13(player) playshownext(player,"190019","1000-1750","650-1000","2400-4000","2400-4000","2400-4000","10216","炽天使之翼(13级)","23010");end--13

function setGyTe(player,index,id)
	for i=1,12 do
		if i==index then
			player:set_panel_data(PANEL_ACTIONSET_NAME,id..i,"visible","true");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,id..i,"visible","false");
		end
	end
end
--当前光翼
function playshowaddpre(player,index)
	local a = gy_data[index]
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"swfplightwing","staticimgid","swf/lightwing"..index..".swf");
	setGyTe(player,index,"swfplightwing");
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpaddWuli","text",""..a[2].."");
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpaddMofa","text",""..a[3].."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpaddprob","text",a[2].."%");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpaddWG","text",a[3]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpaddMG","text",a[3]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpaddDG","text",a[3]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpreaddwing","text",a[5]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"gcppaddzhanli","point",a[6]);
end
--下一级光翼
function playshowaddnext(player,index)
	local b = gy_data[index];
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"swfpNlightwing","staticimgid","swf/lightwing"..index..".swf");
	setGyTe(player,index,"swfpNlightwing");
	
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNaddprob","text",b[2].."%");
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNaddWuli","text",""..b[2].."");
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNaddMofa","text",""..b[3].."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNaddWG","text",b[3]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNaddMG","text",b[3]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtpNaddDG","text",b[3]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"addggtbt","typeid",b[4]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtnextaddwing","text",b[5]);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"gcpnaddzhanli","point",b[6]);
end

function onClick(player,actionset,panelid,actionid)
if actionid == "tablist1" then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtlistname","text","光 翼 列 表");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"listaddwingpanel","visible","true");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"listwingpanel","visible","false");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);return;
end
if actionid == "tablist2" then
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtlistname","text","翅 膀 列 表");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"listwingpanel","visible","true");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"listaddwingpanel","visible","false");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);return;
end
if string.sub(actionid,1,7) == "addgmcB" then
	local index = tonumber(string.sub(actionid,8,9));
	if index == 1 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"addggtbt","bg","");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"addggtbt","bg","190020");
	end
	playshowaddnext(player,index);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);return;
end
if string.sub(actionid,1,13) == "btnaddduihuan" then
	local value = tonumber(string.sub(actionid,14,15));
	onTalklightwing(player,value)
	showOwnaddwing(player);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
if actionid == "opencdxiaoqian" then
	if util.ppn(player,const.PP_CZAWARD_1)==0 then
		player:set_panel_data("panelcqaward","panelcqaward","panel_visible","true");
		newgui.cqaward.check_czaward_panel(player);
	else
		player:alert(1,1,"对不起,该入口已关闭");
	end
	return;
end
if string.sub(actionid,1,4)=="gmcB" then
	if actionid=="gmcB1"then
		onshow1(player);
	end
	if actionid=="gmcB2"then
		onshow2(player);
	end
	if actionid=="gmcB3"then
		onshow3(player);
	end
	if actionid=="gmcB4"then
		onshow4(player);
	end
	if actionid=="gmcB5"then
		onshow5(player);
	end
	if actionid=="gmcB6"then
		onshow6(player);
	end
	if actionid=="gmcB7"then
		onshow7(player);
	end
	if actionid=="gmcB8"then
		onshow8(player);
	end
	if actionid=="gmcB9"then
		onshow9(player);
	end
	if actionid=="gmcB10"then
		onshow10(player);
	end
	if actionid=="gmcB11"then
		onshow11(player);
	end
	if actionid=="gmcB12"then
		onshow12(player);
	end
	if actionid=="gmcB13"then
		onshow13(player);
	end
	player:push_ckpanel_data("wing","panelwing");
end
if string.sub(actionid,1,10)=="btnduihuan"then
	local id = string.sub(actionid,12,13);
	if (id=="01") then
		onTalksj1jcb(player);
		showOwnwing(player);
	end
	if (id=="02")then
		onTalksj2jcb(player);
		showOwnwing(player);
	end
	if (id=="03") then
		onTalksj3jcb(player);
		showOwnwing(player);
	end
	if (id=="04") then
		onTalksj4jcb(player);
		showOwnwing(player);
	end
	if (id=="05") then
		onTalksj5jcb(player);
		showOwnwing(player);
	end
	if (id=="06") then
		onTalksj6jcb(player);
		showOwnwing(player);
	end
	if (id=="07") then
		onTalksj7jcb(player);
		showOwnwing(player);
	end
	if (id=="08")then
		onTalksj8jcb(player);
		showOwnwing(player);
	end
	if (id=="09") then
		onTalksj9jcb(player);
		showOwnwing(player);
	end
	if (id=="10") then
		onTalksj10jcb(player);
		showOwnwing(player);
	end
	if (id=="11") then
		onTalksj11jcb(player);
		showOwnwing(player);
	end
	if (id=="12") then
		onTalksj12jcb(player);
		showOwnwing(player);
	end
	if (id=="13") then
		onTalksj13jcb(player);
		showOwnwing(player);
	end
	--return 0;
	player:push_ckpanel_data("wing","panelwing");
end

	if actionid=="yuitem2" then
		onshowly1(player);
	end
	if actionid=="yuitem3" then
		onshowly2(player);
	end
	if actionid=="yuitem4" then
		onshowly3(player);
	end
	if actionid=="yuitem5" then
		onshowly4(player);
	end
	if actionid=="yuitem6" then
		onshowly5(player);
	end
	if actionid=="yuitem7" then
		onshowly6(player);
	end
	if actionid=="yuitem8" then
		onshowly7(player);
	end
	if actionid=="yuitem9" then
		onshowly8(player);
	end
	if actionid=="yuitem10" then
		onshowly9(player);
	end
	if actionid=="yuitem11" then
		onshowly10(player);
	end
	if actionid=="yuitem12" then
		onshowly11(player);
	end
	if actionid=="yuitem13" then
		onshowly12(player);
	end

local action_id=string.sub(actionid,1,7);
local ly=string.sub(actionid,9,10);
	if action_id=="btn01ci"then
		if (ly=="02") then onTalkhc2jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="02") then onTalkhc2jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="02") then onTalkhc2jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="03") then onTalkhc3jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="03") then onTalkhc3jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="03") then onTalkhc3jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="04") then onTalkhc4jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="04") then onTalkhc4jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="04") then onTalkhc4jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="05") then onTalkhc5jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="05") then onTalkhc5jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="05") then onTalkhc5jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="06") then onTalkhc6jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="06") then onTalkhc6jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="06") then onTalkhc6jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="07") then onTalkhc7jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="07") then onTalkhc7jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="07") then onTalkhc7jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="08") then onTalkhc8jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="08") then onTalkhc8jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="08") then onTalkhc8jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="09") then onTalkhc9jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="09") then onTalkhc9jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="09") then onTalkhc9jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="10") then onTalkhc10jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="10") then onTalkhc10jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="10") then onTalkhc10jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="11") then onTalkhc11jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="11") then onTalkhc11jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="11") then onTalkhc11jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="12") then onTalkhc12jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="12") then onTalkhc12jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="12") then onTalkhc12jly50(player); end
	end
	if action_id=="btn01ci"then
		if (ly=="13") then onTalkhc13jly(player); end
	end
	if action_id=="btn10ci"then
		if (ly=="13") then onTalkhc13jly10(player); end
	end
	if action_id=="btn50ci"then
		if (ly=="13") then onTalkhc13jly50(player); end
	end
	--player:push_ckpanel_data("wing","panelwing");
	if actionid=="btntest" then
		player:set_panel_data("panelshortcut","txtname","text","wingtexiao");
		player:set_panel_data("panelshortcut","txtname","text","wingtexiao");
		player:set_panel_data("panelshortcut","txtname","adsf","wingtexiao");
		player:push_ckpanel_data("short","panelshortcut");
	end

end
ckpanel.add_listener(ACTIONSET_NAME,onClick);
function  lingyuhechengtexiao(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,ACTIONSET_NAME,"action","wingtexiao");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function onTalklightwing(player,index)
	if index == 0 then player:alert(1,1,"请先从左侧列表选择要升级的光翼");return;end
	--[[if index == 1 then
		if  player:num_item("玄冰翼(1级)",1) >= 1 or  player:num_item("玄冰翼(1级)",10) >= 1 or player:num_item("玄冰翼(1级)",100) >= 1 then
			player:alert(1,1,"您已经有[玄冰翼],还是别兑换了!!");
		else
			if player:num_item("一级灵羽",1) >= 1 then
				if player:num_bag_black() >= 1 then
					player:remove_item("一级灵羽",1);
					player:add_item("玄冰翼(1级)",1,1);
					player:alert(11,1,"恭喜您成功兑换[玄冰翼(1级)]");
				else
					player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				end
			else
				player:alert(1,1,"您没有[一级灵羽],无法兑换!");
			end
		end
	end]]
	if index > 1 and index <= 12 then
		local temp = gy_data2[index];
		local a = tonumber(temp[1]);local b = temp[2];local c = temp[3];local d = temp[4];local e = tonumber(temp[5]);
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if player:num_item(b,1) >= 1 then
					if player:num_item(c,1) >= 1 then
						player:remove_item(b,1);
						player:remove_item(c,1);
						player:add_item(d,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功将光翼升级为["..d.."]!</font>");
						if a >= 160005 then
						server.info(10000,1,"["..player:get_name().."]在成功将光翼升级为["..d.."]");
						server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]成功将光翼升级为[<font color='#ff0000'>"..d.."</font>]");
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您没有["..b.."],升级失败!");
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
	end
end

function onTalksj1jcb(player)
	if  player:num_item("精灵羽(1级)",1) >= 1 or  player:num_item("精灵羽(1级)",10) >= 1 or player:num_item("精灵羽(1级)",100) >= 1 then
		player:alert(1,1,"您已经有[精灵羽],还是别兑换了!!")
	else
		if player:num_item("一级灵羽",1) >= 1 then
			if player:num_bag_black() >= 1 then
				player:remove_item("一级灵羽",1);
				player:add_item_log("精灵羽(1级)",243,1,1);
				player:alert(11,1,"恭喜您成功兑换[精灵羽(1级)]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"您没有[一级灵羽],无法兑换!")
		end
	end
end

function onTalksj2jcb(player) cbsjxt(player,160001,"二级灵羽","精灵羽(1级)","虹霓羽(2级)",160002,1) end
function onTalksj3jcb(player) cbsjxt(player,160002,"三级灵羽","虹霓羽(2级)","碧焰羽(3级)",160003,1) end
function onTalksj4jcb(player) cbsjxt(player,160003,"四级灵羽","碧焰羽(3级)","赤霞翼(4级)",160004,1) end
function onTalksj5jcb(player) cbsjxt(player,160004,"五级灵羽","赤霞翼(4级)","冥光翼(5级)",160005,1) end
function onTalksj6jcb(player) cbsjxt(player,160005,"六级灵羽","冥光翼(5级)","苍龙翼(6级)",160006,1) end
function onTalksj7jcb(player) cbsjxt(player,160006,"七级灵羽","苍龙翼(6级)","金天圣羽(7级)",160007,2) end
function onTalksj8jcb(player) cbsjxt(player,160007,"八级灵羽","金天圣羽(7级)","烈焰炽羽(8级)",160008,2) end
function onTalksj9jcb(player) cbsjxt(player,160008,"九级灵羽","烈焰炽羽(8级)","帝霄仙羽(9级)",160009,2) end
function onTalksj10jcb(player) cbsjxt(player,160009,"十级灵羽","帝霄仙羽(9级)","天皇神翼(10级)",160010,2) end
function onTalksj11jcb(player) cbsjxt(player,160010,"十一级灵羽","天皇神翼(10级)","九天羽皇(11级)",160011,2) end
function onTalksj12jcb(player) cbsjxt(player,160011,"十二级灵羽","九天羽皇(11级)","诛神凤翎(12级)",160012,2) end
function onTalksj13jcb(player) cbsjxt(player,160012,"十三级灵羽","诛神凤翎(12级)","炽天使之翼(13级)",160013,2) end

function cbsjxt(player,a,b,c,d,e,f)
	if a and b and c and d and e and f then
		if player:get_item_data_by_pos(0) then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			if ittype_id == a then
				if player:num_item(b,1) >= 1 then
					if player:num_item(c,1) >= 1 then
						local result = player:remove_item_by_type_pos(ittype_id,0);
						if result == 0 then
						player:remove_item(b,1);
						--player:remove_item(c,1);
						player:add_item_log(d,243,1,1);
						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
						newgui.jingcaihuodong.setawardpcon(player,"cbsj",e%100);
						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
						if a >= 160005 then
						server.info(10000,1,"["..player:get_name().."]在土城灵羽使者处成功将翅膀升级为["..d.."]");
						server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在土城灵羽使者处成功将翅膀升级为[<font color='#ff0000'>"..d.."</font>]");
						end
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"您没有["..b.."],升级失败!");
				end
			else
				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
	end
end
-- function cbsjxt(player,a,b,c,d,e,f)
-- 	if a and b and c and d and e and f then
-- 		if player:get_item_data_by_pos(0) then
-- 			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
-- 			if ittype_id == a then
-- 				if player:num_item(b,1) >= 1 then
-- 					if player:num_item(c,1) >= 1 then
-- 						if mini.actmini.isMiniUpLvWingOpen()  then
-- 							local mstep = util.svn("wingStep");
-- 							local tmp = tonumber(string.sub(e,5,6));
-- 							if tmp >= 6 and tmp <= mstep+8 then
-- 								player:set_param(const.PP_WIND_LV1+tmp-6,1);
-- 							end
-- 						end
-- 						player:remove_item(b,1);
-- 						player:remove_item(c,1);
-- 						player:add_item(d,1,1);
-- 						player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
-- 						player:alert(11,1,"<font color='#ff0000'>恭喜您成功升级为["..d.."]!</font>");
-- 						if a >= 160005 then
-- 						server.info(10000,1,"["..player:get_name().."]在土城灵羽使者处成功将翅膀升级为["..d.."]");
-- 						server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]在土城灵羽使者处成功将翅膀升级为[<font color='#ff0000'>"..d.."</font>][<a href='event:push_lua_gowing'><u><font color='#00FF00'>升级翅膀</font></u></a>]");
-- 						end
-- 					else
-- 						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
-- 					end
-- 				else
-- 					player:alert(1,1,"您没有["..b.."],升级失败!");
-- 				end
-- 			else
-- 				player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
-- 			end
-- 		else
-- 			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
-- 		end
-- 	end
-- end


function showOwnwing(player)
	if  player:num_item("精灵羽(1级)",1) >= 1 or  player:num_item("精灵羽(1级)",10) >= 1 or player:num_item("精灵羽(1级)",100) >= 1 then
		onPshow1(player);
		onshow2(player);
	end
	if  player:num_item("虹霓羽(2级)",1) >= 1 or  player:num_item("虹霓羽(2级)",10) >= 1 or player:num_item("虹霓羽(2级)",100) >= 1 then
		onPshow2(player);
		onshow3(player);
	end
	if  player:num_item("碧焰羽(3级)",1) >= 1 or  player:num_item("碧焰羽(3级)",10) >= 1 or player:num_item("碧焰羽(3级)",100) >= 1 then
		onPshow3(player);
		onshow4(player);
	end
	if  player:num_item("赤霞翼(4级)",1) >= 1 or  player:num_item("赤霞翼(4级)",10) >= 1 or player:num_item("赤霞翼(4级)",100) >= 1 then
		onPshow4(player);
		onshow5(player);
	end
	if  player:num_item("冥光翼(5级)",1) >= 1 or  player:num_item("冥光翼(5级)",10) >= 1 or player:num_item("冥光翼(5级)",100) >= 1 then
		onPshow5(player);
		onshow6(player);
	end
	if  player:num_item("苍龙翼(6级)",1) >= 1 or  player:num_item("苍龙翼(6级)",10) >= 1 or player:num_item("苍龙翼(6级)",100) >= 1 then
		onPshow6(player);
		onshow7(player);
	end
	if  player:num_item("金天圣羽(7级)",1) >= 1 or  player:num_item("金天圣羽(7级)",10) >= 1 or player:num_item("金天圣羽(7级)",100) >= 1 then
		onPshow7(player);
		onshow8(player);
	end
	if  player:num_item("烈焰炽羽(8级)",1) >= 1 or  player:num_item("烈焰炽羽(8级)",10) >= 1 or player:num_item("烈焰炽羽(8级)",100) >= 1 then
		onPshow8(player);
		onshow9(player);
	end
	if  player:num_item("帝霄仙羽(9级)",1) >= 1 or  player:num_item("帝霄仙羽(9级)",10) >= 1 or player:num_item("帝霄仙羽(9级)",100) >= 1 then
		onPshow9(player);
		onshow10(player);
	end
	if  player:num_item("天皇神翼(10级)",1) >= 1 or  player:num_item("天皇神翼(10级)",10) >= 1 or player:num_item("天皇神翼(10级)",100) >= 1 then
		onPshow10(player);
		onshow11(player);
	end
	if  player:num_item("九天羽皇(11级)",1) >= 1 or  player:num_item("九天羽皇(11级)",10) >= 1 or player:num_item("九天羽皇(11级)",100) >= 1 then
		onPshow11(player);
		onshow12(player);
	end
	if  player:num_item("诛神凤翎(12级)",1) >= 1 or  player:num_item("诛神凤翎(12级)",10) >= 1 or player:num_item("诛神凤翎(12级)",100) >= 1 then
		onPshow12(player);
		onshow13(player);
	end
	if  player:num_item("炽天使之翼(13级)",1) >= 1 or  player:num_item("炽天使之翼(13级)",10) >= 1 or player:num_item("炽天使之翼(13级)",100) >= 1 then
		onPshow13(player);
		onshow13(player);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnduihuan","visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"ggtbt","visible","false");
	end
end

function showOwnaddwing(player)
	if  player:num_item("玄光翼(1级)",1) >= 1 or  player:num_item("玄光翼(1级)",10) >= 1 or player:num_item("玄光翼(1级)",100) >= 1 then
		playshowaddpre(player,1);
		playshowaddnext(player,2);
	end
	if  player:num_item("寒光翼(2级)",1) >= 1 or  player:num_item("寒光翼(2级)",10) >= 1 or player:num_item("寒光翼(2级)",100) >= 1 then
		playshowaddpre(player,2);
		playshowaddnext(player,3);
	end
	if  player:num_item("凛光翼(3级)",1) >= 1 or  player:num_item("凛光翼(3级)",10) >= 1 or player:num_item("凛光翼(3级)",100) >= 1 then
		playshowaddpre(player,3);
		playshowaddnext(player,4);
	end
	if  player:num_item("棱光翼(4级)",1) >= 1 or  player:num_item("棱光翼(4级)",10) >= 1 or player:num_item("棱光翼(4级)",100) >= 1 then
		playshowaddpre(player,4);
		playshowaddnext(player,5);
	end
	if  player:num_item("极光翼(5级)",1) >= 1 or  player:num_item("极光翼(5级)",10) >= 1 or player:num_item("极光翼(5级)",100) >= 1 then
		playshowaddpre(player,5);
		playshowaddnext(player,6);
	end
	if  player:num_item("奔雷之翼(6级)",1) >= 1 or  player:num_item("奔雷之翼(6级)",10) >= 1 or player:num_item("奔雷之翼(6级)",100) >= 1 then
		playshowaddpre(player,6);
		playshowaddnext(player,7);
	end
	if  player:num_item("雷劫之翼(7级)",1) >= 1 or  player:num_item("雷劫之翼(7级)",10) >= 1 or player:num_item("雷劫之翼(7级)",100) >= 1 then
		playshowaddpre(player,7);
		playshowaddnext(player,8);
	end
	if  player:num_item("雷神之翼(8级)",1) >= 1 or  player:num_item("雷神之翼(8级)",10) >= 1 or player:num_item("雷神之翼(8级)",100) >= 1 then
		playshowaddpre(player,8);
		playshowaddnext(player,9);
	end
	if  player:num_item("遮天鹏翼(9级)",1) >= 1 or  player:num_item("遮天鹏翼(9级)",10) >= 1 or player:num_item("遮天鹏翼(9级)",100) >= 1 then
		playshowaddpre(player,9);
		playshowaddnext(player,10);
	end
	if  player:num_item("霸天玄翼(10级)",1) >= 1 or  player:num_item("霸天玄翼(10级)",10) >= 1 or player:num_item("霸天玄翼(10级)",100) >= 1 then
		playshowaddpre(player,10);
		playshowaddnext(player,11);
	end
	if  player:num_item("九阳炽翼(11级)",1) >= 1 or  player:num_item("九阳炽翼(11级)",10) >= 1 or player:num_item("九阳炽翼(11级)",100) >= 1 then
		playshowaddpre(player,11);
		playshowaddnext(player,12);
	end
	if  player:num_item("至高天翼(12级)",1) >= 1 or  player:num_item("至高天翼(12级)",10) >= 1 or player:num_item("至高天翼(12级)",100) >= 1 then
		playshowaddpre(player,12);
		playshowaddnext(player,12);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnaddduihuan","visible","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"addggtbt","visible","false");
	end
end

----------------------------------------------灵羽--------------------------------------------------------------
function  playshowly(player,a,b,c)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ggibtly1","typeid",""..a.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ggibtly2","typeid",""..a.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ggibtly3","typeid",""..a.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ggibtly4","typeid",""..b.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"ggibtly4","visible",""..c.."");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"wing","action","0");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function onshowly1(player) playshowly(player,"10180","10181","false")end --1
function onshowly2(player) playshowly(player,"10181","10182","false")end --2
function onshowly3(player) playshowly(player,"10182","10183","false")end --3
function onshowly4(player) playshowly(player,"10183","10184","false")end --4
function onshowly5(player) playshowly(player,"10184","10185","false")end --5
function onshowly6(player) playshowly(player,"10185","10186","false")end --6
function onshowly7(player) playshowly(player,"10186","10187","false")end --7
function onshowly8(player) playshowly(player,"10187","10188","false")end --8
function onshowly9(player) playshowly(player,"10188","10189","false")end --9
function onshowly10(player) playshowly(player,"10189","10190","false")end --10
function onshowly11(player) playshowly(player,"10190","10191","false")end --11
function onshowly12(player) playshowly(player,"10191","10216","false")end --12

function onTalkhc2jly(player) lyhcxt(player,"一级灵羽","二级灵羽",1,3,10) end
function onTalkhc2jly10(player) lyhcxt(player,"一级灵羽","二级灵羽",1,30,100) end
function onTalkhc2jly50(player) lyhcxt(player,"一级灵羽","二级灵羽",1,150,500) end

function onTalkhc3jly(player) lyhcxt(player,"二级灵羽","三级灵羽",1,3,10) end
function onTalkhc3jly10(player) lyhcxt(player,"二级灵羽","三级灵羽",1,30,100) end
function onTalkhc3jly50(player) lyhcxt(player,"二级灵羽","三级灵羽",1,150,500) end

function onTalkhc4jly(player) lyhcxt(player,"三级灵羽","四级灵羽",1,3,10) end
function onTalkhc4jly10(player) lyhcxt(player,"三级灵羽","四级灵羽",1,30,100) end
function onTalkhc4jly50(player) lyhcxt(player,"三级灵羽","四级灵羽",1,150,500) end

function onTalkhc5jly(player) lyhcxt(player,"四级灵羽","五级灵羽",1,3,10) end
function onTalkhc5jly10(player) lyhcxt(player,"四级灵羽","五级灵羽",1,30,100) end
function onTalkhc5jly50(player) lyhcxt(player,"四级灵羽","五级灵羽",1,150,500) end

function onTalkhc6jly(player) lyhcxt(player,"五级灵羽","六级灵羽",1,3,10) end
function onTalkhc6jly10(player) lyhcxt(player,"五级灵羽","六级灵羽",1,30,100) end
function onTalkhc6jly50(player) lyhcxt(player,"五级灵羽","六级灵羽",1,150,500) end

function onTalkhc7jly(player) lyhcxt(player,"六级灵羽","七级灵羽",1,3,10) end
function onTalkhc7jly10(player) lyhcxt(player,"六级灵羽","七级灵羽",1,30,100) end
function onTalkhc7jly50(player) lyhcxt(player,"六级灵羽","七级灵羽",1,150,500) end

function onTalkhc8jly(player) lyhcxt(player,"七级灵羽","八级灵羽",2,3,10) end
function onTalkhc8jly10(player) lyhcxt(player,"七级灵羽","八级灵羽",2,30,100) end
function onTalkhc8jly50(player) lyhcxt(player,"七级灵羽","八级灵羽",2,150,500) end

function onTalkhc9jly(player) lyhcxt(player,"八级灵羽","九级灵羽",2,3,10) end
function onTalkhc9jly10(player) lyhcxt(player,"八级灵羽","九级灵羽",2,30,100) end
function onTalkhc9jly50(player) lyhcxt(player,"八级灵羽","九级灵羽",2,150,500) end

function onTalkhc10jly(player) lyhcxt(player,"九级灵羽","十级灵羽",2,3,10) end
function onTalkhc10jly10(player) lyhcxt(player,"九级灵羽","十级灵羽",2,30,100) end
function onTalkhc10jly50(player) lyhcxt(player,"九级灵羽","十级灵羽",2,150,500) end

function onTalkhc11jly(player) lyhcxt(player,"十级灵羽","十一级灵羽",2,3,10) end
function onTalkhc11jly10(player) lyhcxt(player,"十级灵羽","十一级灵羽",2,30,100) end
function onTalkhc11jly50(player) lyhcxt(player,"十级灵羽","十一级灵羽",2,150,500) end

function onTalkhc12jly(player) lyhcxt(player,"十一级灵羽","十二级灵羽",2,3,10) end
function onTalkhc12jly10(player) lyhcxt(player,"十一级灵羽","十二级灵羽",2,30,100) end
function onTalkhc12jly50(player) lyhcxt(player,"十一级灵羽","十二级灵羽",2,150,500) end

function onTalkhc13jly(player) lyhcxt(player,"十二级灵羽","十三级灵羽",2,3,10) end
function onTalkhc13jly10(player) lyhcxt(player,"十二级灵羽","十三级灵羽",2,30,100) end
function onTalkhc13jly50(player) lyhcxt(player,"十二级灵羽","十三级灵羽",2,150,500) end

function lyhcxt(player,a,b,c,d,e)
	if a and b and c and d and e then
		if player:num_bag_black() >= 1 then
			if player:get_vcoin() >= e then
				if player:num_item(a,1) >= d then
					player:sub_vcoin(e,"chibang");
					--server.log_count(99,"兑换灵羽"..(d/3).."次",1);
					player:remove_item(a,d);
					player:add_item(b,(e/10));
					player:alert(11,1,"恭喜您成功合成"..(e/10).."个["..b.."]");
					lingyuhechengtexiao(player);
				else
					player:alert(1,1,"您的["..a.."]不足"..d.."个,合成失败!");
				end
			else
			player:alert(11,1,"您的元宝不足["..e.."],无法合成灵羽!");
			end
		else
		player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
		end
	end
end--