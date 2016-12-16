module(..., package.seeall)


function onTalk100(npc,player)
	npc:echo([[
套装使者:

   <font color="#ffff00">套装积分可兑换顶级套装!套装积分可通过兑换女娲神石获得</font>
--------------------------------------
<font color="#ccbb77">请选择您想兑换的套装:</font>
--------------------------------------
套装腰带: <a href="event:talk_dhwoyd">战士腰带</a>  <a href="event:talk_dhfsyd">法师腰带</a>  <a href="event:talk_dhdsyd">道士腰带</a>
--------------------------------------
套装靴子: <a href="event:talk_dhwoxz">战士靴子</a>  <a href="event:talk_dhfsxz">法师靴子</a>  <a href="event:talk_dhdsxz">道士靴子</a>
--------------------------------------
<a href="event:talk_dhjf2">女娲神石兑换积分</a> <font color="#ff0000">兑换(80-150)套装积分</font>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------]]);
end

function GetRate()
	if activity.isJiFenTaoZhuangOpen() then
		return 100
	else
		return 10
	end
end

function onTalkdhwoyd(npc,player)
	local nRate = GetRate()
	npc:echo([[
         <b><font color="#ccbb77" size="14px">套装腰带兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------
##龙皇腰带·武威##    <a href="event:talk_dhwoyd1">点击此处兑换</a>
需要:套装积分[<font color="#ffff00">1000</font>]点
--------------------------------------
##诛仙腰带·武威##    <a href="event:talk_dhwoyd2">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##龙渊腰带·武威##    <a href="event:talk_dhwoyd3">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##破天腰带·武威##    <a href="event:talk_dhwoyd4">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##苍龙腰带·武威##    <a href="event:talk_dhwoyd5">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

function onTalkdhwoxz(npc,player)
	local nRate = GetRate()
	npc:echo([[
         <b><font color="#ccbb77" size="14px">套装靴子兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------
##龙皇靴·武威##      <a href="event:talk_dhwoxz1">点击此处兑换</a>
需要:套装积分[<font color="#ffff00">1000</font>]点
--------------------------------------
##诛仙靴·武威##      <a href="event:talk_dhwoxz2">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##龙渊靴·武威##      <a href="event:talk_dhwoxz3">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##破天靴·武威##      <a href="event:talk_dhwoxz4">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##苍龙靴·武威##      <a href="event:talk_dhwoxz5">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

function onTalkdhfsyd(npc,player)
	local nRate = GetRate()
	npc:echo([[
         <b><font color="#ccbb77" size="14px">套装腰带兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------
##龙皇腰带·烈焰##      <a href="event:talk_dhfsyd1">点击此处兑换</a>
需要:套装积分[<font color="#ffff00">1000</font>]点
--------------------------------------
##诛仙腰带·烈焰##      <a href="event:talk_dhfsyd2">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##龙渊腰带·烈焰##      <a href="event:talk_dhfsyd3">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##破天腰带·烈焰##      <a href="event:talk_dhfsyd4">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##苍龙腰带·烈焰##      <a href="event:talk_dhfsyd5">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

function onTalkdhfsxz(npc,player)
	local nRate = GetRate()
	npc:echo([[
         <b><font color="#ccbb77" size="14px">套装靴子兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------
##龙皇靴·烈焰##      <a href="event:talk_dhfsxz1">点击此处兑换</a>
需要:套装积分[<font color="#ffff00">1000</font>]点
--------------------------------------
##诛仙靴·烈焰##      <a href="event:talk_dhfsxz2">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##龙渊靴·烈焰##      <a href="event:talk_dhfsxz3">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##破天靴·烈焰##      <a href="event:talk_dhfsxz4">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##苍龙靴·烈焰##      <a href="event:talk_dhfsxz5">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

function onTalkdhdsyd(npc,player)
	local nRate = GetRate()
	npc:echo([[
         <b><font color="#ccbb77" size="14px">套装腰带兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------
##龙皇腰带·无极##      <a href="event:talk_dhdsyd1">点击此处兑换</a>
需要:套装积分[<font color="#ffff00">1000</font>]点
--------------------------------------
##诛仙腰带·无极##      <a href="event:talk_dhdsyd2">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##龙渊腰带·无极##      <a href="event:talk_dhdsyd3">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##破天腰带·无极##      <a href="event:talk_dhdsyd4">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##苍龙腰带·无极##      <a href="event:talk_dhdsyd5">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end

function onTalkdhdsxz(npc,player)
	local nRate = GetRate()
	npc:echo([[
         <b><font color="#ccbb77" size="14px">套装靴子兑换列表</font></b>
--------------------------------------
<font color="#ccbb77">您当前</font><font color="#ffff00">套装积分为: ]]..util.ppn(player,const.PP_TZJF)..[[点</font>
--------------------------------------
##龙皇靴·无极##      <a href="event:talk_dhdsxz1">点击此处兑换</a>
需要:套装积分[<font color="#ffff00">1000</font>]点
--------------------------------------
##诛仙靴·无极##      <a href="event:talk_dhdsxz2">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##龙渊靴·无极##      <a href="event:talk_dhdsxz3">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##破天靴·无极##      <a href="event:talk_dhdsxz4">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
##苍龙靴·无极##      <a href="event:talk_dhdsxz5">点击升级</a><font color="#FF0000">[]]..nRate..[[%]</font>
需要:套装积分[<font color="#ffff00">2000</font>]点
--------------------------------------
<font color="#ffaa00">每次升级需要消耗<font color="#ff0000">1块七彩石</font></font>     <a href="event:talk_100">返回主页</a>
--------------------------------------
]]);
end


function onTalkdhwoyd1(npc,player) tsjzdh(npc,player,1000,"龙皇腰带·武威",1) end
function onTalkdhfsyd1(npc,player) tsjzdh(npc,player,1000,"龙皇腰带·烈焰",2) end
function onTalkdhdsyd1(npc,player) tsjzdh(npc,player,1000,"龙皇腰带·无极",3) end
function onTalkdhwoxz1(npc,player) tsjzdh(npc,player,1000,"龙皇靴·武威",4) end
function onTalkdhfsxz1(npc,player) tsjzdh(npc,player,1000,"龙皇靴·烈焰",5) end
function onTalkdhdsxz1(npc,player) tsjzdh(npc,player,1000,"龙皇靴·无极",6) end

function tsjzdh(npc,player,a,b,c)
	if a and b and c then
		if util.ppn(player,const.PP_TZJF) >= a then
			if player:num_bag_black() >= 1 then
				player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)-a);
				player:add_item(b,1);
				player:alert(11,1,"恭喜您成功兑换:<font color='#ff0000'>"..b.."</font>");
				server.info(10000,0,"勇士【"..player:get_name().."】在土城[套装使者]处成功兑换["..b.."]");
				server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[套装使者]处成功兑换[<font color='#ff0000'>"..b.."</font>]");
			else
				player:alert(1,1,"对不起,您的背包空格不足1格,无法兑换!");
			end
		else
			player:alert(1,1,"对不起,您的套装积分不足"..a.."点,无法兑换!");
		end
	end
	if c==1 then onTalkdhwoyd(npc,player); end
	if c==2 then onTalkdhfsyd(npc,player); end
	if c==3 then onTalkdhdsyd(npc,player); end
	if c==4 then onTalkdhwoxz(npc,player); end
	if c==5 then onTalkdhfsxz(npc,player); end
	if c==6 then onTalkdhdsxz(npc,player); end
end

function onTalkdhwoyd2(npc,player) tsjzsj(npc,player,99001,2000,"龙皇腰带·武威","诛仙腰带·武威",99004,1,90) end
function onTalkdhwoyd3(npc,player) tsjzsj(npc,player,99004,2000,"诛仙腰带·武威","龙渊腰带·武威",99007,1,90) end
function onTalkdhwoyd4(npc,player) tsjzsj(npc,player,99007,2000,"龙渊腰带·武威","破天腰带·武威",99010,1,90) end
function onTalkdhwoyd5(npc,player) tsjzsj(npc,player,99010,2000,"破天腰带·武威","苍龙腰带·武威",99013,1,90) end

function onTalkdhfsyd2(npc,player) tsjzsj(npc,player,99002,2000,"龙皇腰带·烈焰","诛仙腰带·烈焰",99005,2,90) end
function onTalkdhfsyd3(npc,player) tsjzsj(npc,player,99005,2000,"诛仙腰带·烈焰","龙渊腰带·烈焰",99008,2,90) end
function onTalkdhfsyd4(npc,player) tsjzsj(npc,player,99008,2000,"龙渊腰带·烈焰","破天腰带·烈焰",99011,2,90) end
function onTalkdhfsyd5(npc,player) tsjzsj(npc,player,99011,2000,"破天腰带·烈焰","苍龙腰带·烈焰",99014,2,90) end

function onTalkdhdsyd2(npc,player) tsjzsj(npc,player,99003,2000,"龙皇腰带·无极","诛仙腰带·无极",99006,3,90) end
function onTalkdhdsyd3(npc,player) tsjzsj(npc,player,99006,2000,"诛仙腰带·无极","龙渊腰带·无极",99009,3,90) end
function onTalkdhdsyd4(npc,player) tsjzsj(npc,player,99009,2000,"龙渊腰带·无极","破天腰带·无极",99012,3,90) end
function onTalkdhdsyd5(npc,player) tsjzsj(npc,player,99012,2000,"破天腰带·无极","苍龙腰带·无极",99015,3,90) end

function onTalkdhwoxz2(npc,player) tsjzsj(npc,player,109001,2000,"龙皇靴·武威","诛仙靴·武威",109004,4,90) end
function onTalkdhwoxz3(npc,player) tsjzsj(npc,player,109004,2000,"诛仙靴·武威","龙渊靴·武威",109007,4,90) end
function onTalkdhwoxz4(npc,player) tsjzsj(npc,player,109007,2000,"龙渊靴·武威","破天靴·武威",109010,4,90) end
function onTalkdhwoxz5(npc,player) tsjzsj(npc,player,109010,2000,"破天靴·武威","苍龙靴·武威",109013,4,90) end

function onTalkdhfsxz2(npc,player) tsjzsj(npc,player,109002,2000,"龙皇靴·烈焰","诛仙靴·烈焰",109005,5,90) end
function onTalkdhfsxz3(npc,player) tsjzsj(npc,player,109005,2000,"诛仙靴·烈焰","龙渊靴·烈焰",109008,5,90) end
function onTalkdhfsxz4(npc,player) tsjzsj(npc,player,109008,2000,"龙渊靴·烈焰","破天靴·烈焰",109011,5,90) end
function onTalkdhfsxz5(npc,player) tsjzsj(npc,player,109011,2000,"破天靴·烈焰","苍龙靴·烈焰",109014,5,90) end

function onTalkdhdsxz2(npc,player) tsjzsj(npc,player,109003,2000,"龙皇靴·无极","诛仙靴·无极",109006,6,90) end
function onTalkdhdsxz3(npc,player) tsjzsj(npc,player,109006,2000,"诛仙靴·无极","龙渊靴·无极",109009,6,90) end
function onTalkdhdsxz4(npc,player) tsjzsj(npc,player,109009,2000,"龙渊靴·无极","破天靴·无极",109012,6,90) end
function onTalkdhdsxz5(npc,player) tsjzsj(npc,player,109012,2000,"破天靴·无极","苍龙靴·无极",109015,6,90) end

function tsjzsj(npc,player,a,b,c,d,e,f,g)
	if player:get_item_data_by_pos(0) then
		local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
		if ittype_id == a then
			if util.ppn(player,const.PP_TZJF) >= b then
				if player:num_item("七彩石",1) >= 1 then
					if player:num_item(c,1) >= 1 then
						local jl = math.random(1,100);
						if activity.isJiFenTaoZhuangOpen() then
							g = 0
						end
						if jl >= g and jl <= 100 then
							local result = player:remove_item_by_type_pos(ittype_id,0);
							if result == 0 then
								player:remove_item("七彩石",1);
								--player:remove_item(c,1);
								player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)-b);
								player:add_item(d,1);
								player:set_item_data(e,0,0,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
								player:alert(1,1,"<font color='#ff0000'>恭喜您,成功升级["..d.."]!</font>");
								if b >= 100 then
									server.info(10000,0,"勇士【"..player:get_name().."】在土城[套装使者]处将["..c.."]成功升级为["..d.."]");
									server.info(10,0,"勇士【<font color='#ff0000'>"..player:get_name().."</font>】在土城[套装使者]处将[<font color='#ff0000'>"..c.."</font>]成功升级为[<font color='#ff0000'>"..d.."</font>]");
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
				player:alert(1,1,"您的套装积分不足"..b.."点,升级失败!");
			end
		else
			player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
		end
	else
		player:alert(1,1,"请将要升级的["..c.."]放在您包裹里的第1个格子里!");
	end
	if f==1 then onTalkdhwoyd(npc,player); end
	if f==2 then onTalkdhfsyd(npc,player); end
	if f==3 then onTalkdhdsyd(npc,player); end
	if f==4 then onTalkdhwoxz(npc,player); end
	if f==5 then onTalkdhfsxz(npc,player); end
	if f==6 then onTalkdhdsxz(npc,player); end
end




local jfql_data={
	[20418]={maxp=70,qlattr="dc",},
	[20419]={maxp=70,qlattr="mc",},
	[20420]={maxp=70,qlattr="sc",},
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
}

function onTalkjfqili(npc,player)
	npc:echo([[--------------------------------------
       <b><font color="#ccbb77" size="14px">积分神器祈灵极品属性</font></b>
--------------------------------------
祈灵说明: 
          请将需要祈灵的积分装备放到您
          包裹内的第<span class='info'>1</span>个格子里!

          每次祈灵需要消耗<span class='info'>3</span>点套装积分!

          <font color="#ff0000">只有60级以上积分装备才可祈灵</font>

          <font color="#ed6655">祈灵需要装备极品属性达到60点</font>
--------------------------------------
<span class='s2'>您当前的套装积分为:</span> <span class='s4'>]]..util.ppn(player,const.PP_TZJF)..[[点</span>
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
		if util.ppn(player,const.PP_TZJF) >= 3 then
			local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,qianghualv,qianghuacount,itupdad,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(0);
			local eqitem = player:get_item_by_pos(0);
			local jf_d = jfql_data[ittype_id];
			if eqitem and jf_d then
				local jfr = JFAddAttr(player,jf_d,eqitem);
				if jfr < 60 then
					player:alert(1,1,"只有极品属性达到60点才可以使用套装积分进行祈灵!");return;
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
						player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)-3);
						CalculateJFAttr(player,jf_d,eqitem,1);
						player:alert(1,1,"祈灵成功,对应极品点数+1<br>当前极品点数为"..(jfr+1).."点");
						player:alert(1000,1,"<font color='#ff0000'>祈灵成功,极品点数+1<br>当前极品点数为"..(jfr+1).."点</font>");
					else
						if suc == 2 and jfr >= 62 then
							CalculateJFAttr(player,jf_d,eqitem,-1);
							player:alert(1,1,"祈灵失败,对应极品点数-1<br>当前极品点数为"..(jfr-1).."点");
							player:alert(1000,1,"<font color='#ff0000'>祈灵失败,极品点数-1<br>当前极品点数为"..(jfr-1).."点</font>");
						else
							player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)-3);
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
	if player:num_item("女娲神石",1) >= 1 then
		player:remove_item("女娲神石",1);
		local i = math.random(1,100);
		if i >= 1 and i <= 80 then
			local jf = math.random(80,110);
			player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)+jf);
			player:alert(11,1,"套装积分增加:"..jf.."分");
			player:alert(11,0,"当前套装积分:"..util.ppn(player,const.PP_TZJF).."分");
		onTalk100(npc,player)
		end
		if i >= 81 and i <= 100 then
			local jf = math.random(80,150);
			player:set_param(const.PP_TZJF,util.ppn(player,const.PP_TZJF)+jf);
			player:alert(11,1,"套装积分增加:"..jf.."分");
			player:alert(11,0,"当前套装积分:"..util.ppn(player,const.PP_TZJF).."分");
		onTalk100(npc,player)
		end
	else
		player:alert(1,1,"您没有[女娲神石]无法兑换套装积分哦!<br><br>[女娲神石]可在商铺获得!");
		onTalk100(npc,player)
	end
end
