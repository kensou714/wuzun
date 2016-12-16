module(..., package.seeall)


function onTalk100(npc,player)
	npc:echo([[
神器使者:

   <font color="#ffff00">神器积分可兑换顶级神器!消灭[神器宝阁]里的上古魔兽[天魔兽]就能获得神器积分!</font>

   [天魔兽]在[<font color="#ff0000">17:30</font>][<font color="#ff0000">19:30</font>]出现
--------------------------------------
<font color="#ccbb77">请选择您想兑换的神器:</font>

神器兑换:    <a href="event:talk_dhwo">积分武器</a>     <a href="event:talk_dhyf">积分衣服</a>

特戒兑换:    <a href="event:talk_mbjz">麻痹戒指</a>     <a href="event:talk_hsjz">护身戒指</a>

神器升级:    <a href="event:talk_wqsj">武器升级</a>     <a href="event:talk_yfsja">衣服升级</a>

神器祈灵:    <a href="event:talk_jfqili">开始祈灵</a>

--------------------------------------
<a href="event:talk_dhjf2">盘古神石兑换积分</a> <font color="#ff0000">兑换(80-150)神器积分</font>
--------------------------------------
<a href="event:talk_dhjf">提取兑换神器积分</a>
--------------------------------------
<a href="event:talk_sqbg">点击进入神器宝阁</a>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------]]);
end

function getUpEquipProb(player)
	if activity.isShenqisjOpen(player) then
		return 30;
	end
	if server_start_day() <= 4 then
		return 20;
	else
		return 10;
	end
end

function onTalkmbjz(npc,player)
	npc:echo([[
         <b><font color="#ccbb77" size="14px">麻痹戒指兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
##麻痹戒指##          <a href="event:talk_dhmbjz1">点击此处兑换</a>
需要:神器积分[<font color="#ff0000">150</font>]点
--------------------------------------
##狂战麻痹戒指##      <a href="event:talk_dhmbjz2">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">300</font>]点
--------------------------------------
##战魂麻痹戒指##      <a href="event:talk_dhmbjz3">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">900</font>]点
--------------------------------------
##战神麻痹戒指##      <a href="event:talk_dhmbjz4">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">2700</font>]点
--------------------------------------
##王者麻痹戒指##      <a href="event:talk_dhmbjz5">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">8100</font>]点
--------------------------------------
##神威麻痹戒指##      <a href="event:talk_dhmbjz6">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">24300</font>]点
--------------------------------------
##至尊麻痹戒指##      <a href="event:talk_dhmbjz7">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">72900</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end


function onTalkhsjz(npc,player)
	npc:echo([[
         <b><font color="#ccbb77" size="14px">护身戒指兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
##护身戒指##          <a href="event:talk_dhhsjz1">点击此处兑换</a>
需要:神器积分[<font color="#ff0000">150</font>]点
--------------------------------------
##聚魔护身戒指##      <a href="event:talk_dhhsjz2">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">300</font>]点
--------------------------------------
##魔魂护身戒指##      <a href="event:talk_dhhsjz3">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">900</font>]点
--------------------------------------
##魔神护身戒指##      <a href="event:talk_dhhsjz4">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">2700</font>]点
--------------------------------------
##王者护身戒指##      <a href="event:talk_dhhsjz5">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">8100</font>]点
--------------------------------------
##神威护身戒指##      <a href="event:talk_dhhsjz6">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">24300</font>]点
--------------------------------------
##至尊护身戒指##      <a href="event:talk_dhhsjz7">点击升级[100%]</a>
需要:神器积分[<font color="#ff0000">72900</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end


function onTalkdhmbjz1(npc,player) tsjzdh(npc,player,150,"麻痹戒指",1) end
function onTalkdhhsjz1(npc,player) tsjzdh(npc,player,150,"护身戒指",2) end

function tsjzdh(npc,player,a,b,c)
	if a and b and c then
		if util.ppn(player,const.PP_SQJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-a);
				player:add_item(b,1,1);
				player:alert(11,1,"恭喜您成功兑换:<font color='#ff0000'>"..b.."</font>");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"对不起,您的神器积分不足"..a.."点,无法兑换!");
		end
	end
	if c==1 then onTalkmbjz(npc,player); end
	if c==2 then onTalkhsjz(npc,player); end
end

function onTalkdhmbjz2(npc,player) tsjzsj(npc,player,170000,300,"麻痹戒指","狂战麻痹戒指",170001,1,1) end
function onTalkdhmbjz3(npc,player) tsjzsj(npc,player,170001,900,"狂战麻痹戒指","战魂麻痹戒指",170002,1,1) end
function onTalkdhmbjz4(npc,player) tsjzsj(npc,player,170002,2700,"战魂麻痹戒指","战神麻痹戒指",170003,1,1) end
function onTalkdhmbjz5(npc,player) tsjzsj(npc,player,170003,8100,"战神麻痹戒指","王者麻痹戒指",170004,1,1) end
function onTalkdhmbjz6(npc,player) tsjzsj(npc,player,170004,24300,"王者麻痹戒指","神威麻痹戒指",170005,1,1) end
function onTalkdhmbjz7(npc,player) tsjzsj(npc,player,170005,72900,"神威麻痹戒指","至尊麻痹戒指",170006,1,1) end

function onTalkdhhsjz2(npc,player) tsjzsj(npc,player,170010,300,"护身戒指","聚魔护身戒指",170011,2,1) end
function onTalkdhhsjz3(npc,player) tsjzsj(npc,player,170011,900,"聚魔护身戒指","魔魂护身戒指",170012,2,1) end
function onTalkdhhsjz4(npc,player) tsjzsj(npc,player,170012,2700,"魔魂护身戒指","魔神护身戒指",170013,2,1) end
function onTalkdhhsjz5(npc,player) tsjzsj(npc,player,170013,8100,"魔神护身戒指","王者护身戒指",170014,2,1) end
function onTalkdhhsjz6(npc,player) tsjzsj(npc,player,170014,24300,"王者护身戒指","神威护身戒指",170015,2,1) end
function onTalkdhhsjz7(npc,player) tsjzsj(npc,player,170015,72900,"神威护身戒指","至尊护身戒指",170016,2,1) end



function tsjzsj(npc,player,a,b,c,d,e,f,g)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == a then
			if util.ppn(player,const.PP_SQJF) >= b then
				if player:num_item("七彩石",1) >= 1 then
					if player:num_item(c,1) >= 1 then
						local jl = math.random(1,100);
						if jl >= g and jl <= 100 then
							local result = player:remove_item_by_type_pos(ittype_id,0);
							if result == 0 then
							player:remove_item("七彩石",1);
							--player:remove_item(c,1);
							player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-b);
							player:add_item(d,1,1);
							player:set_item_data(e,0,1,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
							player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级["..d.."]!</font>");
							newgui.jingcaihuodong.setawardpcon(player,"tjsj",d);
							if b >= 900 then
							server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处将["..c.."]成功升级为["..d.."]");
							server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处将[<font color='#ff0000'>"..c.."</font>]成功升级为[<font color='#ff0000'>"..d.."</font>]");
							end
							end
						else
							player:remove_item("七彩石",1);
							player:alert(11,1,"<font color='#ff0000'>很遗憾,您升级["..d.."]失败了!</font>");
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"如果你没有[七彩石],恐怕我无法为你升级哦!");
				end
			else
				player:alert(1,1,"您的神器积分不足"..b.."点,升级失败!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
	else
		player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
	end
	if f==1 then onTalkmbjz(npc,player); end
	if f==2 then onTalkhsjz(npc,player); end
end




local jfql_data={
	[20418]={maxp=70,qlattr="dc",},--物理
	[20419]={maxp=70,qlattr="mc",},--魔法
	[20420]={maxp=70,qlattr="sc",},--道士
	[20421]={maxp=70,qlattr="dc",},
	[20422]={maxp=70,qlattr="mc",},
	[20423]={maxp=70,qlattr="sc",},
	[20424]={maxp=80,qlattr="dc",},
	[20425]={maxp=80,qlattr="mc",},
	[20426]={maxp=80,qlattr="sc",},
	[20442]={maxp=80,qlattr="dc",},
	[20443]={maxp=80,qlattr="mc",},
	[20444]={maxp=80,qlattr="sc",},
	[20445]={maxp=80,qlattr="dc",},
	[20446]={maxp=80,qlattr="mc",},
	[20447]={maxp=80,qlattr="sc",},
	[20460]={maxp=80,qlattr="dc",},
	[20461]={maxp=80,qlattr="mc",},
	[20462]={maxp=80,qlattr="sc",},
	[30031]={maxp=70,qlattr="dc",},
	[30032]={maxp=70,qlattr="mc",},
	[30033]={maxp=70,qlattr="sc",},
	[35031]={maxp=70,qlattr="dc",},
	[35032]={maxp=70,qlattr="mc",},
	[35033]={maxp=70,qlattr="sc",},
	[30034]={maxp=70,qlattr="dc",},
	[30035]={maxp=70,qlattr="mc",},
	[30036]={maxp=70,qlattr="sc",},
	[35034]={maxp=70,qlattr="dc",},
	[35035]={maxp=70,qlattr="mc",},
	[35036]={maxp=70,qlattr="sc",},
	[30037]={maxp=80,qlattr="dc",},
	[30038]={maxp=80,qlattr="mc",},
	[30039]={maxp=80,qlattr="sc",},
	[35037]={maxp=80,qlattr="dc",},
	[35038]={maxp=80,qlattr="mc",},
	[35039]={maxp=80,qlattr="sc",},
	[30052]={maxp=80,qlattr="dc",},
	[30053]={maxp=80,qlattr="mc",},
	[30054]={maxp=80,qlattr="sc",},
	[35052]={maxp=80,qlattr="dc",},
	[35053]={maxp=80,qlattr="mc",},
	[35054]={maxp=80,qlattr="sc",},
	[30055]={maxp=80,qlattr="dc",},
	[30056]={maxp=80,qlattr="mc",},
	[30057]={maxp=80,qlattr="sc",},
	[35055]={maxp=80,qlattr="dc",},
	[35056]={maxp=80,qlattr="mc",},
	[35057]={maxp=80,qlattr="sc",},
        [30067]={maxp=80,qlattr="dc",},
	[30068]={maxp=80,qlattr="mc",},
	[30069]={maxp=80,qlattr="sc",},
	[35067]={maxp=80,qlattr="dc",},
	[35068]={maxp=80,qlattr="mc",},
	[35069]={maxp=80,qlattr="sc",},
	[59006]={maxp=70,qlattr="dc",},
	[59007]={maxp=70,qlattr="mc",},
	[59008]={maxp=70,qlattr="sc",},
	[69006]={maxp=70,qlattr="dc",},
	[69007]={maxp=70,qlattr="mc",},
	[69008]={maxp=70,qlattr="sc",},
	[99004]={maxp=70,qlattr="dc",},
	[99005]={maxp=70,qlattr="mc",},
	[99006]={maxp=70,qlattr="sc",},
	[99007]={maxp=70,qlattr="dc",},
	[99008]={maxp=70,qlattr="mc",},
	[99009]={maxp=70,qlattr="sc",},
	[99010]={maxp=80,qlattr="dc",},
	[99011]={maxp=80,qlattr="mc",},
	[99012]={maxp=80,qlattr="sc",},
	[99013]={maxp=80,qlattr="dc",},
	[99014]={maxp=80,qlattr="mc",},
	[99015]={maxp=80,qlattr="sc",},
	[109004]={maxp=70,qlattr="dc",},
	[109005]={maxp=70,qlattr="mc",},
	[109006]={maxp=70,qlattr="sc",},
	[109007]={maxp=70,qlattr="dc",},
	[109008]={maxp=70,qlattr="mc",},
	[109009]={maxp=70,qlattr="sc",},
	[109010]={maxp=80,qlattr="dc",},
	[109011]={maxp=80,qlattr="mc",},
	[109012]={maxp=80,qlattr="sc",},
	[109013]={maxp=80,qlattr="dc",},
	[109014]={maxp=80,qlattr="mc",},
	[109015]={maxp=80,qlattr="sc",},
}

function onTalkjfqili(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">积分神器祈灵极品属性</font></b>
--------------------------------------
祈灵说明: 
          请将需要祈灵的积分装备放到您
          包裹内的第<span class='info'>1</span>个格子里!

          每次祈灵需要消耗<span class='info'>3</span>点神器积分!

          <font color="#ff0000">只有60级以上积分装备才可祈灵</font>

          <font color="#ed6655">祈灵需要装备极品属性达到60点</font>
--------------------------------------
<span class='s2'>您当前的神器积分为:</span> <span class='s4'>]]..util.ppn(player,const.PP_SQJF)..[[点</span>
--------------------------------------
点击此处: <a href="event:talk_star">开始祈灵</a>  <a href="event:talk_star10">祈灵10次</a>  <a href="event:talk_star20">祈灵20次</a>
--------------------------------------
多次祈灵为循环祈灵,扣除积分以实际为准!
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end

function onTalkstar20(npc,player)
	for i = 1,20 do
		doQilingstar(npc,player);
	end
	player:fresh_item_info_bypos(0);
	onTalkjfqili(npc,player);
end

function onTalkstar10(npc,player)
	for i = 1,10 do
		doQilingstar(npc,player);
	end
	player:fresh_item_info_bypos(0);
	onTalkjfqili(npc,player);
end

function onTalkstar(npc,player)
	doQilingstar(npc,player);
	player:fresh_item_info_bypos(0);
	onTalkjfqili(npc,player);
end

function CalculateJFAttr(player,data,item,attr)
	if data and item then
		if data.qlattr == "dc" then
			item:set_adddc(item:get_adddc()+attr);
		end
		if data.qlattr == "mc" then
			item:set_addmc(item:get_addmc()+attr);
		end
		if data.qlattr == "sc" then
			item:set_addsc(item:get_addsc()+attr);
		end
	end
end

function JFAddAttr(player,data,item)
	local attr = 0;
	if data and item then
		if data.qlattr == "dc" then
			attr = item:get_adddc();
		end
		if data.qlattr == "mc" then
			attr = item:get_addmc();
		end
		if data.qlattr == "sc" then
			attr = item:get_addsc();
		end
	end
	return attr;
end

function tryProbToSuc(attr)
	local r1 = math.random(1,1000);
	local result = 0;
	if attr < 70 then
		if r1 <= 140 then result = 1;end--20% 成功
		if r1 >= 800 then result = 2;end--20% 失败,降点
		return result;
	end
	if attr == 70 then
		if r1 <= 140 then result = 1;end
		if r1 >= 1000 then result = 2;end
		return result;
	end
	if attr < 80 then
		if r1 <= 140 then result = 1;end
		if r1 >= 800 then result = 2;end
		return result;
	end
	if attr == 80 then
		if r1 <= 140 then result = 1;end
		if r1 >= 1000 then result = 2;end
		return result;
	end
	if attr < 90 then
		if r1 <= 140 then result = 1;end
		if r1 >= 800 then result = 2;end
		return result;
	end
	if attr == 90 then
		if r1 <= 140 then result = 1;end
		if r1 >= 1000 then result = 2;end
		return result;
	end
end

function doQilingstar(npc,player)
	if player:get_item_data_by_pos(0) then
		if util.ppn(player,const.PP_SQJF) >= 3 then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			local eqitem = player:get_item_by_pos(0);
			local jf_d = jfql_data[ittype_id];
			if eqitem and jf_d then
				local jfr = JFAddAttr(player,jf_d,eqitem);
				if jfr < 60 then
					player:alert(1,1,"只有极品属性达到60点才可以使用神器积分进行祈灵!");return;
				end
				if jfr >= jf_d.maxp then
					player:alert(1,1,"当前装备最多只能祈灵到"..jf_d.maxp.."点!");return;
				end
				if jfr == 60 then
					CalculateJFAttr(player,jf_d,eqitem,1);
				else
					----------------------------------------------------------------------------------------
					--local r1 = math.random(1,1000);
					--local d1 = 1;
					--local rd_base = math.floor((jf_d.maxp - 60)*70/100)+60;
					--for i=61,jf_d.maxp do
					--	if jfr <= rd_base and jfr == (i - 1) then
					--		d1 = math.random(1,50);
					--	end
					--	if jfr >= rd_base+1 and jfr <= jf_d.maxp-2 then
					--		if sdata == i - 1 then d1 = math.random(1,10) ; end
					--	end
					--	if jfr >= jf_d.maxp-1 then
					--		if jfr == i - 1 then d1 = math.random(1,5) ; end
					--	end
					--end
					----------------------------------------------------------------------------------------
					local suc = tryProbToSuc(jfr);
					if  util.ppn(player,const.PP_JC_MRQLHL_TIME) ~= today() then
						player:set_param(const.PP_JC_MRQLHL_TIME,today());
						player:set_param(const.PP_JC_MRQLHL,1);
					else
						player:set_param(const.PP_JC_MRQLHL,util.ppn(player,const.PP_JC_MRQLHL)+1);
					end
					----------------------------------------------------------------------------------------
					if suc == 1  then
						player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-3);
						CalculateJFAttr(player,jf_d,eqitem,1);
						player:alert(1,1,"祈灵成功,对应极品点数+1<br>当前极品点数为"..(jfr+1).."点");
						player:alert(1000,1,"<font color='#ff0000'>祈灵成功,极品点数+1<br>当前极品点数为"..(jfr+1).."点</font>");
					else
						if suc == 2 and jfr >= 62 then
							CalculateJFAttr(player,jf_d,eqitem,-1);
							player:alert(1,1,"祈灵失败,对应极品点数-1<br>当前极品点数为"..(jfr-1).."点");
							player:alert(1000,1,"<font color='#ff0000'>祈灵失败,极品点数-1<br>当前极品点数为"..(jfr-1).."点</font>");
						else
							player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-3);
							player:alert(1,1,"祈灵失败<br>当前极品点数为"..(jfr).."点");
							player:alert(1000,1,"<font color='#ff0000'>祈灵失败<br>当前极品点数为"..(jfr).."点</font>");
						end
					end
					----------------------------------------------------------------------------------------
				end
			else
				player:alert(1,1,"请将需要祈灵的积分装备放在包裹第一个格子!!");
			end
		else
			player:alert(1,1,"您的BOSS积分不足3点,无法进行祈灵!");
		end
	else
		player:alert(1,1,"请将需要祈灵的积分装备放在包裹第一个格子!!");
	end
end

function onTalkdhjf2(npc,player)
	if player:num_item("盘古神石",1) >= 1 then
		player:remove_item("盘古神石",1);
		local i = math.random(1,100);
		if i >= 1 and i <= 80 then
			local jf = math.random(80,110);
			player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+jf);
			player:alert(11,1,"神器积分增加:"..jf.."分");
			player:alert(11,0,"当前神器积分:"..util.ppn(player,const.PP_SQJF).."分");
		onTalk100(npc,player)
		end
		if i >= 81 and i <= 100 then
			local jf = math.random(80,150);
			player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)+jf);
			player:alert(11,1,"神器积分增加:"..jf.."分");
			player:alert(11,0,"当前神器积分:"..util.ppn(player,const.PP_SQJF).."分");
		onTalk100(npc,player)
		end
	else
		player:alert(1,1,"您没有[盘古神石]无法兑换神器积分哦!<br><br>[盘古神石]可在商铺获得!");
		onTalk100(npc,player)
	end
end

function onTalkyfsja(npc,player)
	npc:echo([[--------------------------------------
          <b><font color="#ccbb77" size="14px">积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">请选择您想升级的积分衣服:</font>
--------------------------------------

        <font color="#ffaa00"><a href="event:talk_dh60yf"><font color="#ffff00">点击进入60级积分衣服升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh70yf"><font color="#ffff00">点击进入70级积分衣服升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh80yf"><font color="#ffff00">点击进入80级积分衣服升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh90yf"><font color="#ffff00">点击进入90级积分衣服升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh100yf"><font color="#ffff00">点击进入100级积分衣服升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh110yf"><font color="#ffff00">点击进入110级积分衣服升级</font></a></font>

--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end



function onTalkdh60yf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">60级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <font color="#ffaa00">升级60男衣服</font>   <a href="event:talk_dh60nvyf">升级60女衣服</a>
--------------------------------------
##九黎神甲·武威##  <font color="#ffaa00"><a href="event:talk_60jfyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇神甲·武威+2000神器积分

##九黎神甲·烈焰##  <font color="#ffaa00"><a href="event:talk_60jfyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇神甲·烈焰+2000神器积分

##九黎神甲·无极##  <font color="#ffaa00"><a href="event:talk_60jfyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇神甲·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh60nvyf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">60级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <a href="event:talk_dh60yf">升级60男衣服</a>   <font color="#ffaa00">升级60女衣服</font>
--------------------------------------
##九黎神衣·武威##  <font color="#ffaa00"><a href="event:talk_60jfnvyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇神衣·武威+2000神器积分

##九黎神衣·烈焰##  <font color="#ffaa00"><a href="event:talk_60jfnvyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇神衣·烈焰+2000神器积分

##九黎神衣·无极##  <font color="#ffaa00"><a href="event:talk_60jfnvyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇神衣·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end



function onTalkdh70yf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">70级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <font color="#ffaa00">升级70男衣服</font>   <a href="event:talk_dh70nvyf">升级70女衣服</a>
--------------------------------------
##惊世神甲·武威##  <font color="#ffaa00"><a href="event:talk_70jfyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎神甲·武威+2000神器积分

##惊世神甲·烈焰##  <font color="#ffaa00"><a href="event:talk_70jfyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎神甲·烈焰+2000神器积分

##惊世神甲·无极##  <font color="#ffaa00"><a href="event:talk_70jfyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎神甲·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh70nvyf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">70级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <a href="event:talk_dh70yf">升级70男衣服</a>   <font color="#ffaa00">升级70女衣服</font>
--------------------------------------
##惊世神衣·武威##  <font color="#ffaa00"><a href="event:talk_70jfnvyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎神衣·武威+2000神器积分

##惊世神衣·烈焰##  <font color="#ffaa00"><a href="event:talk_70jfnvyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎神衣·烈焰+2000神器积分

##惊世神衣·无极##  <font color="#ffaa00"><a href="event:talk_70jfnvyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎神衣·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end



function onTalkdh80yf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">80级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <font color="#ffaa00">升级80男衣服</font>   <a href="event:talk_dh80nvyf">升级80女衣服</a>
--------------------------------------
##破天神甲·武威##  <font color="#ffaa00"><a href="event:talk_80jfyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世神甲·武威+2000神器积分

##破天神甲·烈焰##  <font color="#ffaa00"><a href="event:talk_80jfyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世神甲·烈焰+2000神器积分

##破天神甲·无极##  <font color="#ffaa00"><a href="event:talk_80jfyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世神甲·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh80nvyf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">80级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <a href="event:talk_dh80yf">升级80男衣服</a>   <font color="#ffaa00">升级80女衣服</font>
--------------------------------------
##破天神衣·武威##  <font color="#ffaa00"><a href="event:talk_80jfnvyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世神衣·武威+2000神器积分

##破天神衣·烈焰##  <font color="#ffaa00"><a href="event:talk_80jfnvyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世神衣·烈焰+2000神器积分

##破天神衣·无极##  <font color="#ffaa00"><a href="event:talk_80jfnvyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世神衣·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh90yf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">90级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <font color="#ffaa00">升级90男衣服</font>   <a href="event:talk_dh90nvyf">升级90女衣服</a>
--------------------------------------
##九皇神甲·武威##  <font color="#ffaa00"><a href="event:talk_90jfyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天神甲·武威+2000神器积分

##九皇神甲·烈焰##  <font color="#ffaa00"><a href="event:talk_90jfyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天神甲·烈焰+2000神器积分

##九皇神甲·无极##  <font color="#ffaa00"><a href="event:talk_90jfyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天神甲·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh90nvyf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">90级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <a href="event:talk_dh90yf">升级90男衣服</a>   <font color="#ffaa00">升级90女衣服</font>
--------------------------------------
##九皇神衣·武威##  <font color="#ffaa00"><a href="event:talk_90jfnvyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天神衣·武威+2000神器积分

##九皇神衣·烈焰##  <font color="#ffaa00"><a href="event:talk_90jfnvyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天神衣·烈焰+2000神器积分

##九皇神衣·无极##  <font color="#ffaa00"><a href="event:talk_90jfnvyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天神衣·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh100yf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">100级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <font color="#ffaa00">升级100男衣服</font>   <a href="event:talk_dh100nvyf">升级100女衣服</a>
--------------------------------------
##太虚神甲·武威##  <font color="#ffaa00"><a href="event:talk_100jfyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇神甲·武威+2000神器积分

##太虚神甲·烈焰##  <font color="#ffaa00"><a href="event:talk_100jfyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇神甲·烈焰+2000神器积分

##太虚神甲·无极##  <font color="#ffaa00"><a href="event:talk_100jfyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇神甲·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh100nvyf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">100级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <a href="event:talk_dh100yf">升级100男衣服</a>   <font color="#ffaa00">升级100女衣服</font>
--------------------------------------
##太虚神衣·武威##  <font color="#ffaa00"><a href="event:talk_100jfnvyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇神衣·武威+2000神器积分

##太虚神衣·烈焰##  <font color="#ffaa00"><a href="event:talk_100jfnvyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇神衣·烈焰+2000神器积分

##太虚神衣·无极##  <font color="#ffaa00"><a href="event:talk_100jfnvyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇神衣·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh110yf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">110级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <font color="#ffaa00">升级110男衣服</font>   <a href="event:talk_dh110nvyf">升级110女衣服</a>
--------------------------------------
##神虚神甲·武威##  <font color="#ffaa00"><a href="event:talk_110jfyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚神甲·武威+2000神器积分

##神虚神甲·烈焰##  <font color="#ffaa00"><a href="event:talk_110jfyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚神甲·烈焰+2000神器积分

##神虚神甲·无极##  <font color="#ffaa00"><a href="event:talk_110jfyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚神甲·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh110nvyf(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">110级积分衣服升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级衣服成功与否,都将消耗七彩石!</font>
--------------------------------------
      <a href="event:talk_dh110yf">升级110男衣服</a>   <font color="#ffaa00">升级110女衣服</font>
--------------------------------------
##神虚神衣·武威##  <font color="#ffaa00"><a href="event:talk_110jfnvyf1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚神衣·武威+2000神器积分

##神虚神衣·烈焰##  <font color="#ffaa00"><a href="event:talk_110jfnvyf2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚神衣·烈焰+2000神器积分

##神虚神衣·无极##  <font color="#ffaa00"><a href="event:talk_110jfnvyf3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚神衣·无极+2000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_yfsja">返回上页</a>
--------------------------------------
]]);
end

function onTalkwqsj(npc,player)
	npc:echo([[--------------------------------------
          <b><font color="#ccbb77" size="14px">积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">请选择您想升级的积分武器:</font>
--------------------------------------

        <font color="#ffaa00"><a href="event:talk_dh60"><font color="#ffff00">点击进入60级积分武器升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh70"><font color="#ffff00">点击进入70级积分武器升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh80"><font color="#ffff00">点击进入80级积分武器升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh90"><font color="#ffff00">点击进入90级积分武器升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh100"><font color="#ffff00">点击进入100级积分武器升级</font></a></font>

        <font color="#ffaa00"><a href="event:talk_dh110"><font color="#ffff00">点击进入110级积分武器升级</font></a></font>

--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end

function onTalkdh60(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">60级积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级武器成功与否,都将消耗七彩石!</font>
--------------------------------------
##九黎诛仙剑·武威##  <font color="#ffaa00"><a href="event:talk_60jfwq1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇离火剑·武威+3000神器积分

##九黎诛仙剑·烈焰##  <font color="#ffaa00"><a href="event:talk_60jfwq2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇离火剑·烈焰+3000神器积分

##九黎诛仙剑·无极##  <font color="#ffaa00"><a href="event:talk_60jfwq3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:龙皇离火剑·无极+3000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_wqsj">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh70(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">70级积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级武器成功与否,都将消耗七彩石!</font>
--------------------------------------
##惊世龙渊剑·武威##  <font color="#ffaa00"><a href="event:talk_70jfwq1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎诛仙剑·武威+4000神器积分

##惊世龙渊剑·烈焰##  <font color="#ffaa00"><a href="event:talk_70jfwq2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎诛仙剑·烈焰+4000神器积分

##惊世龙渊剑·无极##  <font color="#ffaa00"><a href="event:talk_70jfwq3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九黎诛仙剑·无极+4000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_wqsj">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh80(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">80级积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级武器成功与否,都将消耗七彩石!</font>
--------------------------------------
##破天游龙刀·武威##  <font color="#ffaa00"><a href="event:talk_80jfwq1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世龙渊剑·武威+5000神器积分

##破天游龙刀·烈焰##  <font color="#ffaa00"><a href="event:talk_80jfwq2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世龙渊剑·烈焰+5000神器积分

##破天游龙刀·无极##  <font color="#ffaa00"><a href="event:talk_80jfwq3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:惊世龙渊剑·无极+5000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_wqsj">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh90(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">90级积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级武器成功与否,都将消耗七彩石!</font>
--------------------------------------
##九皇苍龙剑·武威##  <font color="#ffaa00"><a href="event:talk_90jfwq1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天游龙刀·武威+6000神器积分

##九皇苍龙剑·烈焰##  <font color="#ffaa00"><a href="event:talk_90jfwq2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天游龙刀·烈焰+6000神器积分

##九皇苍龙剑·无极##  <font color="#ffaa00"><a href="event:talk_90jfwq3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:破天游龙刀·无极+6000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_wqsj">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh100(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">100级积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级武器成功与否,都将消耗七彩石!</font>
--------------------------------------
##太虚纯阳剑·武威##  <font color="#ffaa00"><a href="event:talk_100jfwq1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇苍龙剑·武威+6000神器积分

##太虚惊雷杖·烈焰##  <font color="#ffaa00"><a href="event:talk_100jfwq2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇苍龙剑·烈焰+6000神器积分

##太虚摄魂刀·无极##  <font color="#ffaa00"><a href="event:talk_100jfwq3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:九皇苍龙剑·无极+6000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_wqsj">返回上页</a>
--------------------------------------
]]);
end

function onTalkdh110(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">110级积分武器升级列表</font></b>
--------------------------------------
<font color="#ff0000">注意:升级武器成功与否,都将消耗七彩石!</font>
--------------------------------------
##神虚倚天剑·武威##  <font color="#ffaa00"><a href="event:talk_110jfwq1"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚纯阳剑·武威+6000神器积分

##神虚倚天剑·烈焰##  <font color="#ffaa00"><a href="event:talk_110jfwq2"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚惊雷杖·烈焰+6000神器积分

##神虚倚天剑·无极##  <font color="#ffaa00"><a href="event:talk_110jfwq3"><font color="#ffff00">立刻升级(]]..getUpEquipProb(player)..[[%)</font></a></font>
需:太虚摄魂刀·无极+6000神器积分
--------------------------------------
<font color="#ccbb77">您当前的</font><font color="#ed6655">神器积分为: ]]..util.ppn(player,const.PP_SQJF)..[[点</font>
--------------------------------------
升级失败: <font color="#ff0000">七彩石消失,装备和积分不损失</font>

升级成功: <font color="#ffff00">装备的强化等级,极品属性保留</font>
--------------------------------------
                              <a href="event:talk_wqsj">返回上页</a>
--------------------------------------
]]);
end


function onTalk60jfwq1(npc,player) jfwqsj(npc,player,20415,3000,"龙皇离火剑·武威","九黎诛仙剑·武威",20418,1) end
function onTalk60jfwq2(npc,player) jfwqsj(npc,player,20416,3000,"龙皇离火剑·烈焰","九黎诛仙剑·烈焰",20419,1) end
function onTalk60jfwq3(npc,player) jfwqsj(npc,player,20417,3000,"龙皇离火剑·无极","九黎诛仙剑·无极",20420,1) end

function onTalk70jfwq1(npc,player) jfwqsj(npc,player,20418,4000,"九黎诛仙剑·武威","惊世龙渊剑·武威",20421,2) end
function onTalk70jfwq2(npc,player) jfwqsj(npc,player,20419,4000,"九黎诛仙剑·烈焰","惊世龙渊剑·烈焰",20422,2) end
function onTalk70jfwq3(npc,player) jfwqsj(npc,player,20420,4000,"九黎诛仙剑·无极","惊世龙渊剑·无极",20423,2) end

function onTalk80jfwq1(npc,player) jfwqsj(npc,player,20421,5000,"惊世龙渊剑·武威","破天游龙刀·武威",20424,3) end
function onTalk80jfwq2(npc,player) jfwqsj(npc,player,20422,5000,"惊世龙渊剑·烈焰","破天游龙刀·烈焰",20425,3) end
function onTalk80jfwq3(npc,player) jfwqsj(npc,player,20423,5000,"惊世龙渊剑·无极","破天游龙刀·无极",20426,3) end

function onTalk90jfwq1(npc,player) jfwqsj(npc,player,20424,6000,"破天游龙刀·武威","九皇苍龙剑·武威",20442,10) end
function onTalk90jfwq2(npc,player) jfwqsj(npc,player,20425,6000,"破天游龙刀·烈焰","九皇苍龙剑·烈焰",20443,10) end
function onTalk90jfwq3(npc,player) jfwqsj(npc,player,20426,6000,"破天游龙刀·无极","九皇苍龙剑·无极",20444,10) end

function onTalk100jfwq1(npc,player) jfwqsj(npc,player,20442,6000,"九皇苍龙剑·武威","太虚纯阳剑·武威",20445,13) end
function onTalk100jfwq2(npc,player) jfwqsj(npc,player,20443,6000,"九皇苍龙剑·烈焰","太虚惊雷杖·烈焰",20446,13) end
function onTalk100jfwq3(npc,player) jfwqsj(npc,player,20444,6000,"九皇苍龙剑·无极","太虚摄魂刀·无极",20447,13) end

function onTalk110jfwq1(npc,player) jfwqsj(npc,player,20445,6000,"太虚纯阳剑·武威","神虚倚天剑·武威",20460,16) end
function onTalk110jfwq2(npc,player) jfwqsj(npc,player,20446,6000,"太虚惊雷杖·烈焰","神虚倚天剑·烈焰",20461,16) end
function onTalk110jfwq3(npc,player) jfwqsj(npc,player,20447,6000,"太虚摄魂刀·无极","神虚倚天剑·无极",20462,16) end

function onTalk60jfyf1(npc,player) jfwqsj(npc,player,30028,2000,"龙皇神甲·武威","九黎神甲·武威",30031,4) end
function onTalk60jfyf2(npc,player) jfwqsj(npc,player,30029,2000,"龙皇神甲·烈焰","九黎神甲·烈焰",30032,4) end
function onTalk60jfyf3(npc,player) jfwqsj(npc,player,30030,2000,"龙皇神甲·无极","九黎神甲·无极",30033,4) end

function onTalk60jfnvyf1(npc,player) jfwqsj(npc,player,35028,2000,"龙皇神衣·武威","九黎神衣·武威",35031,5) end
function onTalk60jfnvyf2(npc,player) jfwqsj(npc,player,35029,2000,"龙皇神衣·烈焰","九黎神衣·烈焰",35032,5) end
function onTalk60jfnvyf3(npc,player) jfwqsj(npc,player,35030,2000,"龙皇神衣·无极","九黎神衣·无极",35033,5) end

function onTalk70jfyf1(npc,player) jfwqsj(npc,player,30031,2000,"九黎神甲·武威","惊世神甲·武威",30034,6) end
function onTalk70jfyf2(npc,player) jfwqsj(npc,player,30032,2000,"九黎神甲·烈焰","惊世神甲·烈焰",30035,6) end
function onTalk70jfyf3(npc,player) jfwqsj(npc,player,30033,2000,"九黎神甲·无极","惊世神甲·无极",30036,6) end

function onTalk70jfnvyf1(npc,player) jfwqsj(npc,player,35031,2000,"九黎神衣·武威","惊世神衣·武威",35034,7) end
function onTalk70jfnvyf2(npc,player) jfwqsj(npc,player,35032,2000,"九黎神衣·烈焰","惊世神衣·烈焰",35035,7) end
function onTalk70jfnvyf3(npc,player) jfwqsj(npc,player,35033,2000,"九黎神衣·无极","惊世神衣·无极",35036,7) end

function onTalk80jfyf1(npc,player) jfwqsj(npc,player,30034,2000,"惊世神甲·武威","破天神甲·武威",30037,8) end
function onTalk80jfyf2(npc,player) jfwqsj(npc,player,30035,2000,"惊世神甲·烈焰","破天神甲·烈焰",30038,8) end
function onTalk80jfyf3(npc,player) jfwqsj(npc,player,30036,2000,"惊世神甲·无极","破天神甲·无极",30039,8) end

function onTalk80jfnvyf1(npc,player) jfwqsj(npc,player,35034,2000,"惊世神衣·武威","破天神衣·武威",35037,9) end
function onTalk80jfnvyf2(npc,player) jfwqsj(npc,player,35035,2000,"惊世神衣·烈焰","破天神衣·烈焰",35038,9) end
function onTalk80jfnvyf3(npc,player) jfwqsj(npc,player,35036,2000,"惊世神衣·无极","破天神衣·无极",35039,9) end

function onTalk90jfyf1(npc,player) jfwqsj(npc,player,30037,2000,"破天神甲·武威","九皇神甲·武威",30052,11) end
function onTalk90jfyf2(npc,player) jfwqsj(npc,player,30038,2000,"破天神甲·烈焰","九皇神甲·烈焰",30053,11) end
function onTalk90jfyf3(npc,player) jfwqsj(npc,player,30039,2000,"破天神甲·无极","九皇神甲·无极",30054,11) end

function onTalk90jfnvyf1(npc,player) jfwqsj(npc,player,35037,2000,"破天神衣·武威","九皇神衣·武威",35052,12) end
function onTalk90jfnvyf2(npc,player) jfwqsj(npc,player,35038,2000,"破天神衣·烈焰","九皇神衣·烈焰",35053,12) end
function onTalk90jfnvyf3(npc,player) jfwqsj(npc,player,35039,2000,"破天神衣·无极","九皇神衣·无极",35054,12) end

function onTalk100jfyf1(npc,player) jfwqsj(npc,player,30052,2000,"九皇神甲·武威","太虚神甲·武威",30055,14) end
function onTalk100jfyf2(npc,player) jfwqsj(npc,player,30053,2000,"九皇神甲·烈焰","太虚神甲·烈焰",30056,14) end
function onTalk100jfyf3(npc,player) jfwqsj(npc,player,30054,2000,"九皇神甲·无极","太虚神甲·无极",30057,14) end

function onTalk100jfnvyf1(npc,player) jfwqsj(npc,player,35052,2000,"九皇神衣·武威","太虚神衣·武威",35055,15) end
function onTalk100jfnvyf2(npc,player) jfwqsj(npc,player,35053,2000,"九皇神衣·烈焰","太虚神衣·烈焰",35056,15) end
function onTalk100jfnvyf3(npc,player) jfwqsj(npc,player,35054,2000,"九皇神衣·无极","太虚神衣·无极",35057,15) end

function onTalk110jfyf1(npc,player) jfwqsj(npc,player,30055,2000,"太虚神甲·武威","神虚神甲·武威",30067,17) end
function onTalk110jfyf2(npc,player) jfwqsj(npc,player,30056,2000,"太虚神甲·烈焰","神虚神甲·烈焰",30068,17) end
function onTalk110jfyf3(npc,player) jfwqsj(npc,player,30057,2000,"太虚神甲·无极","神虚神甲·无极",30069,17) end

function onTalk110jfnvyf1(npc,player) jfwqsj(npc,player,35055,2000,"太虚神衣·武威","神虚神衣·武威",35067,18) end
function onTalk110jfnvyf2(npc,player) jfwqsj(npc,player,35056,2000,"太虚神衣·烈焰","神虚神衣·烈焰",35068,18) end
function onTalk110jfnvyf3(npc,player) jfwqsj(npc,player,35057,2000,"太虚神衣·无极","神虚神衣·无极",35069,18) end


function jfwqsj(npc,player,a,b,c,d,e,f)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == a then
			if util.ppn(player,const.PP_SQJF) >= b then
				if player:num_item("七彩石",1) >= 1 then
					if player:num_item(c,1) >= 1 then
						local jl = math.random(1,100);
						local basedi = 91;
						--------------开服前5天升级概率提升10%-----------
						if server_start_day() <= 4 then
							basedi = 81;
						end
						-------------------------------------------------
						if activity.isShenqisjOpen() then
							basedi = 71;
						end
						if jl >= basedi and jl <= 100 then
							local result = player:remove_item_by_type_pos(ittype_id,0);
							if result == 0 then
							player:remove_item("七彩石",1);
							--player:remove_item(c,1);
							player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-b);
							player:add_item(d,1);
							player:set_item_data(e,0,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
							player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级["..d.."]!</font>");
							server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处将["..c.."]成功升级为["..d.."]");
							server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处将[<font color='#ff0000'>"..c.."</font>]成功升级为[<font color='#ff0000'>"..d.."</font>]");
							end
						else
							player:remove_item("七彩石",1);
							player:alert(11,1,"<font color='#ff0000'>很遗憾,您升级["..d.."]失败了!</font>");
						end
					else
						player:alert(1,1,"你连["..c.."]都没有,我怎么给您升级呢?!");
					end
				else
					player:alert(1,1,"如果你没有[七彩石],恐怕我无法为你升级装备!");
				end
			else
				player:alert(1,1,"您的神器积分不足"..b.."点,升级失败!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
	else
		player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
	end
	if f==1 then onTalkdh60(npc,player); end
	if f==2 then onTalkdh70(npc,player); end
	if f==3 then onTalkdh80(npc,player); end
	if f==4 then onTalkdh60yf(npc,player); end
	if f==5 then onTalkdh60nvyf(npc,player); end
	if f==6 then onTalkdh70yf(npc,player); end
	if f==7 then onTalkdh70nvyf(npc,player); end
	if f==8 then onTalkdh80yf(npc,player); end
	if f==9 then onTalkdh80nvyf(npc,player); end
	if f==10 then onTalkdh90(npc,player); end
	if f==11 then onTalkdh90yf(npc,player); end
	if f==12 then onTalkdh90nvyf(npc,player); end
	if f==13 then onTalkdh100(npc,player); end
	if f==14 then onTalkdh100yf(npc,player); end
	if f==15 then onTalkdh100nvyf(npc,player); end
	if f==16 then onTalkdh110(npc,player); end
	if f==17 then onTalkdh110yf(npc,player); end
	if f==18 then onTalkdh110nvyf(npc,player); end
end




function onTalkdhyf(npc,player)
	npc:echo([[--------------------------------------
          <b><font color="#ccbb77" size="14px">积分衣服兑换列表</font></b>
--------------------------------------
      <font color="#ffaa00">兑换男士衣服</font>   <a href="event:talk_dhnvyf">兑换女士衣服</a>
--------------------------------------

##龙皇神甲·武威## 

      <a href="event:talk_jfyf1">积分兑换</a>   需要:1000点神器积分

##龙皇神甲·烈焰##

      <a href="event:talk_jfyf2">积分兑换</a>   需要:1000点神器积分

##龙皇神甲·无极##

      <a href="event:talk_jfyf3">积分兑换</a>   需要:1000点神器积分

--------------------------------------
<span class='s2'>您当前的神器积分为:</span> <span class='s4'>]]..util.ppn(player,const.PP_SQJF)..[[点</span>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end


function onTalkjfyf1(npc,player) jfdhyf(npc,player,1000,"龙皇神甲·武威") end
function onTalkjfyf2(npc,player) jfdhyf(npc,player,1000,"龙皇神甲·烈焰") end
function onTalkjfyf3(npc,player) jfdhyf(npc,player,1000,"龙皇神甲·无极") end

--function onTalkhsyf1(npc,player) hsdhyf(npc,player,120000,"龙皇神甲·武威") end
--function onTalkhsyf2(npc,player) hsdhyf(npc,player,120000,"龙皇神甲·烈焰") end
--function onTalkhsyf3(npc,player) hsdhyf(npc,player,120000,"龙皇神甲·无极") end

function hsdhyf(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_HUNSHI) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-a);
				player:add_item_log(b,244,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."个魂石成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."个魂石成功兑换[<font color='#ff0000'>"..b.."</font>]");
				onTalkdhyf(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhyf(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的魂石不足"..a.."个,无法兑换!");
			onTalkdhyf(npc,player);
		end
	end
end


function jfdhyf(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_SQJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-a);
				player:add_item_log(b,244,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."点神器积分成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."点神器积分成功兑换[<font color='#ff0000'>"..b.."</font>]");
				onTalkdhyf(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhyf(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的神器积分不足"..a.."点,无法兑换!");
			onTalkdhyf(npc,player);
		end
	end
end


function onTalkdhnvyf(npc,player)
	npc:echo([[--------------------------------------
          <b><font color="#ccbb77" size="14px">积分衣服兑换列表</font></b>
--------------------------------------
      <a href="event:talk_dhyf">兑换男士衣服</a>   <font color="#ffaa00">兑换女士衣服</font>
--------------------------------------

##龙皇神衣·武威## 

      <a href="event:talk_jfyf21">积分兑换</a>   需要:1000点神器积分

##龙皇神衣·烈焰##

      <a href="event:talk_jfyf22">积分兑换</a>   需要:1000点神器积分

##龙皇神衣·无极##

      <a href="event:talk_jfyf23">积分兑换</a>   需要:1000点神器积分

--------------------------------------
<span class='s2'>您当前的神器积分为:</span> <span class='s4'>]]..util.ppn(player,const.PP_SQJF)..[[点</span>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end


function onTalkjfyf21(npc,player) jfdhyf2(npc,player,1000,"龙皇神衣·武威") end
function onTalkjfyf22(npc,player) jfdhyf2(npc,player,1000,"龙皇神衣·烈焰") end
function onTalkjfyf23(npc,player) jfdhyf2(npc,player,1000,"龙皇神衣·无极") end

--function onTalkhsyf21(npc,player) hsdhyf2(npc,player,120000,"龙皇神衣·武威") end
--function onTalkhsyf22(npc,player) hsdhyf2(npc,player,120000,"龙皇神衣·烈焰") end
--function onTalkhsyf23(npc,player) hsdhyf2(npc,player,120000,"龙皇神衣·无极") end

function hsdhyf2(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_HUNSHI) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-a);
				player:add_item_log(b,244,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."个魂石成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."个魂石成功兑换[<font color='#ff0000'>"..b.."</font>]");
				onTalkdhnvyf(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhnvyf(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的魂石不足"..a.."个,无法兑换!");
			onTalkdhnvyf(npc,player);
		end
	end
end


function jfdhyf2(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_SQJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-a);
				player:add_item_log(b,244,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."点神器积分成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."点神器积分成功兑换[<font color='#ff0000'>"..b.."</font>]");
				onTalkdhnvyf(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhnvyf(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的神器积分不足"..a.."点,无法兑换!");
			onTalkdhnvyf(npc,player);
		end
	end
end


function onTalkdhwo(npc,player)
	npc:echo([[--------------------------------------
          <b><font color="#ccbb77" size="14px">积分武器兑换列表</font></b>
--------------------------------------
<font color="#ffff00">请选择您想兑换的神器:</font>
--------------------------------------

##龙皇离火剑·武威## 

      <a href="event:talk_jfdh1">积分兑换</a>   需要:1500点神器积分

##龙皇离火剑·烈焰##

      <a href="event:talk_jfdh2">积分兑换</a>   需要:1500点神器积分

##龙皇离火剑·无极##

      <a href="event:talk_jfdh3">积分兑换</a>   需要:1500点神器积分

--------------------------------------
<span class='s2'>您当前的神器积分为:</span> <span class='s4'>]]..util.ppn(player,const.PP_SQJF)..[[点</span>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end

function onTalkjfdh1(npc,player) jfdhsq(npc,player,1500,"龙皇离火剑·武威") end
function onTalkjfdh2(npc,player) jfdhsq(npc,player,1500,"龙皇离火剑·烈焰") end
function onTalkjfdh3(npc,player) jfdhsq(npc,player,1500,"龙皇离火剑·无极") end

--function onTalkhsdh1(npc,player) hsdhsq(npc,player,120000,"龙皇离火剑·武威") end
--function onTalkhsdh2(npc,player) hsdhsq(npc,player,120000,"龙皇离火剑·烈焰") end
--function onTalkhsdh3(npc,player) hsdhsq(npc,player,120000,"龙皇离火剑·无极") end


function hsdhsq(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_HUNSHI) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_HUNSHI,util.ppn(player,const.PP_HUNSHI)-a);
				player:add_item_log(b,244,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."个魂石成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."个魂石成功兑换[<font color='#ff0000'>"..b.."</font>]");
				onTalkdhwo(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhwo(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的魂石不足"..a.."个,无法兑换!");
			onTalkdhwo(npc,player);
		end
	end
end


function jfdhsq(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_SQJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-a);
				player:add_item_log(b,244,1);
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[神器使者]处消耗"..a.."点神器积分成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[神器使者]处消耗"..a.."点神器积分成功兑换[<font color='#ff0000'>"..b.."</font>]");
				onTalkdhwo(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhwo(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的神器积分不足"..a.."点,无法兑换!");
			onTalkdhwo(npc,player);
		end
	end
end



function onTalksqbg(npc,player)
	if player:get_level() >= 45 then
		local map = server.find_map("sqbg");
		local x,y;
		x,y=map:gen_rand_position();
		if( x and y )then
			player:enter_map("sqbg",x,y);
			go.givehuicheng(player);
		end
	else
		player:alert(1,1,"进入神器宝阁需要等级达到45级以上");
		onTalk100(npc,player);
	end
end


function onTalkdhjf(npc,player)
	npc:echo([[
--------------------------------------
<b><font color="#ccbb77" size="14px">提取兑换神器积分卷</font></b>
--------------------------------------
<span class='s2'>您当前的神器积分为:</span> <span class='s4'>]]..util.ppn(player,const.PP_SQJF)..[[点</span>
--------------------------------------
<a href="event:talk_dh1jf">神器积分卷[1分]</a>      <font color="#ffaa00">需要神器积分:1</font>
--------------------------------------
<a href="event:talk_dh5jf">神器积分卷[5分]</a>      <font color="#ffaa00">需要神器积分:5</font>
--------------------------------------
<a href="event:talk_dh10jf">神器积分卷[10分]</a>     <font color="#ffaa00">需要神器积分:10</font>
--------------------------------------
<a href="event:talk_dh20jf">神器积分卷[20分]</a>     <font color="#ffaa00">需要神器积分:20</font>
--------------------------------------
<a href="event:talk_dh50jf">神器积分卷[50分]</a>     <font color="#ffaa00">需要神器积分:50</font>
--------------------------------------
<a href="event:talk_dh100jf">神器积分卷[100分]</a>    <font color="#ffaa00">需要神器积分:100</font>
--------------------------------------
<a href="event:talk_dh1000jf">神器积分卷[1000分]</a>   <font color="#ffaa00">需要神器积分:1000</font>
--------------------------------------
                             <a href="event:talk_100">返回首页</a>
--------------------------------------
]]);
end

function onTalkdh1jf(npc,player) tqjf(npc,player,1,"神器积分[1分]") end
function onTalkdh5jf(npc,player) tqjf(npc,player,5,"神器积分[5分]") end
function onTalkdh10jf(npc,player) tqjf(npc,player,10,"神器积分[10分]") end
function onTalkdh20jf(npc,player) tqjf(npc,player,20,"神器积分[20分]") end
function onTalkdh50jf(npc,player) tqjf(npc,player,50,"神器积分[50分]") end
function onTalkdh100jf(npc,player) tqjf(npc,player,100,"神器积分[100分]") end
function onTalkdh1000jf(npc,player) tqjf(npc,player,1000,"神器积分[1000分]") end




function tqjf(npc,player,a,b)
	if a and b then
		if util.ppn(player,const.PP_SQJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-a);
				player:add_item_log(b,244,1);
				player:alert(11,1,"恭喜您成功兑换:<font color='#ff0000'>"..b.."</font>");
				onTalkdhjf(npc,player);
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
				onTalkdhjf(npc,player);
			end
		else
			player:alert(1,1,"对不起,您的神器积分不足"..a.."点,无法兑换!");
			onTalkdhjf(npc,player);
		end
	end
end