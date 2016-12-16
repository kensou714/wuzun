module(..., package.seeall)
--寻宝面板
local ACTIONSET_NAME="touzi";
local PANEL_ACTIONSET_NAME="paneltouzi";

local TZ_data={
	[1]={name="坐骑投资",need=6888,  LQflag=const.PP_TOUZI_LQ_FLAG_ZQ, jinxuID="280030", isTouZi=const.PP_TOUZI_IS1},	
	[2]={name="法宝投资",need=8888,  LQflag=const.PP_TOUZI_LQ_FLAG_FB, jinxuID="280018", isTouZi=const.PP_TOUZI_IS2},
	[3]={name="修为投资",need=10888, LQflag=const.PP_TOUZI_LQ_FLAG_XW, jinxuID="280026", isTouZi=const.PP_TOUZI_IS3},
	[4]={name="玄晶投资",need=12888, LQflag=const.PP_TOUZI_LQ_FLAG_XJ, jinxuID="280027", isTouZi=const.PP_TOUZI_IS4},
	[5]={name="经验投资",need=15888, LQflag=const.PP_TOUZI_LQ_FLAG_JY, jinxuID="280022", isTouZi=const.PP_TOUZI_IS5},
	[6]={name="神装投资",need=18888, LQflag=const.PP_TOUZI_LQ_FLAG_SZ, jinxuID="280023", isTouZi=const.PP_TOUZI_IS6},
};

local TZItem_data={
	[1]={
			[1]={name="坐骑经验丹(大)",num=10,id=15037},
			[2]={name="兽灵精华(1000)",num=1, id=15112},
			[3]={name="坐骑经验丹(大)",num=10,id=15037},
			[4]={name="兽灵精华(1000)",num=2, id=15112},
			[5]={name="坐骑经验丹(大)",num=10,id=15037},
			[6]={name="兽灵精华(1000)",num=3, id=15112},
			[7]={name="坐骑经验丹(大)",num=10,id=15037},
			[8]={name="兽灵精华(1000)",num=4, id=15112},
			[9]={name="坐骑经验丹(大)",num=10,id=15037},
			[10]={name="兽灵精华(1000)",num=5, id=15112},
		},
	[2]={
			[1]={name="进阶石",num=300,id=10209},
			[2]={name="灵气珠(1000)",num=3, id=15106},
			[3]={name="进阶石",num=300,id=10209},
			[4]={name="灵气珠(1000)",num=4, id=15106},
			[5]={name="进阶石",num=300,id=10209},
			[6]={name="灵气珠(1000)",num=5, id=15106},
			[7]={name="进阶石",num=300,id=10209},
			[8]={name="灵气珠(1000)",num=6, id=15106},
			[9]={name="进阶石",num=300,id=10209},
			[10]={name="灵气珠(1000)",num=7, id=15106},
		},
	[3]={
			[1]={name="修为令牌",num=8,id=15056},
			[2]={name="真气丹(1000)",num=4, id=15094},
			[3]={name="修为令牌",num=8,id=15056},
			[4]={name="真气丹(1000)",num=5, id=15094},
			[5]={name="修为令牌",num=8,id=15056},
			[6]={name="真气丹(1000)",num=6, id=15094},
			[7]={name="修为令牌",num=8,id=15056},
			[8]={name="真气丹(1000)",num=7, id=15094},
			[9]={name="修为令牌",num=8,id=15056},
			[10]={name="真气丹(1000)",num=8, id=15094},
		},
	[4]={
			[1]={name="六级攻击玄晶",num=1,id=10229},
			[2]={name="大型玄晶宝箱",num=1, id=15118},
			[3]={name="六级生命玄晶",num=1,id=10265},
			[4]={name="大型玄晶宝箱",num=1, id=15118},
			[5]={name="六级物防玄晶",num=1,id=10241},
			[6]={name="大型玄晶宝箱",num=1, id=15118},
			[7]={name="六级魔防玄晶",num=1,id=10253},
			[8]={name="大型玄晶宝箱",num=1, id=15118},
			[9]={name="中型玄晶宝箱",num=1,id=15117},
			[10]={name="大型玄晶宝箱",num=2,id=15118},
		},
	[5]={
			[1]={name="聚灵珠",num=5,id=15011},
			[2]={name="八倍宝典",num=2, id=15010},
			[3]={name="聚灵珠",num=6,id=15011},
			[4]={name="八倍宝典",num=2, id=15010},
			[5]={name="聚灵珠",num=6,id=15011},
			[6]={name="八倍宝典",num=3, id=15010},
			[7]={name="聚灵珠",num=7,id=15011},
			[8]={name="八倍宝典",num=3, id=15010},
			[9]={name="聚灵珠",num=7,id=15011},
			[10]={name="八倍宝典",num=4, id=15010},
		},
	[6]={
			[1]={name="天书精华",num=2,id=10324},
			[2]={name="装备灵魂石(1000)",num=1, id=15140},
			[3]={name="天书精华",num=2,id=10324},
			[4]={name="装备灵魂石(1000)",num=1, id=15140},
			[5]={name="天书精华",num=2,id=10324},
			[6]={name="装备灵魂石(1000)",num=2, id=15140},
			[7]={name="天书精华",num=2,id=10324},
			[8]={name="装备灵魂石(1000)",num=2, id=15140},
			[9]={name="超级灵魂石",num=1,id=15144},
			[10]={name="装备灵魂石(1000)",num=3,id=15140},
		},
};

function process_cannon(player,actionset,panelid,actionid)
	for i=1,6 do
		if actionid== "btnTouZi"..i then
			fresh_touzi(player,i);
		end
	end
	if actionid== "btnTouLJTZ" then
		touzi_LJ(player);
	end
	for i=1,5 do
		if actionid== "btnTouZiLQ"..i then
			LQtouziAward(player,i);
		end
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
ckpanel.add_listener(ACTIONSET_NAME,process_cannon);


function LQtouziAward(player,num)
	local type=util.ppn(player,const.PP_TOUZI_TYPE);
	local dayLimit={1,3,5,7,10};
	local dayNow=today();
	local dayOld=util.ppn(player,TZ_data[type].isTouZi);
	local day=dayNow-dayOld;

	if day==dayLimit[num]-1 then
		if util.ppn(player,TZ_data[type].LQflag)<dayLimit[num] then
			local bag_black_limit = 2;
			if type == 4 and num ==5 then
				bag_black_limit = 3;
			end

			if player:num_bag_black() >= bag_black_limit then
				player:set_param(TZ_data[type].LQflag,dayLimit[num]);
				player:add_item(TZItem_data[type][num*2-1].name,TZItem_data[type][num*2-1].num,1);
				player:add_item(TZItem_data[type][num*2].name,TZItem_data[type][num*2].num,1);
				player:alert(11,1,"恭喜您成功领取【"..TZ_data[type].name.."】第【"..dayLimit[num].."】返利！");
				if TZItem_data[type][num*2-1].name~="" then
					player:alert(11,1,"恭喜您获得物品"..TZItem_data[type][num*2-1].name.."*"..TZItem_data[type][num*2-1].num.."!");
				end
				if TZItem_data[type][num*2].name~="" then
					player:alert(11,1,"恭喜您获得物品"..TZItem_data[type][num*2].name.."*"..TZItem_data[type][num*2].num.."!");
				end
				fresh_touzi(player,type);
			else
				player:alert(1,1,"您的背包不足"..bag_black_limit.."格，请清理后再来领取!");
			end
		else
			player:alert(1,1,"您已经领取过该返利，无法再次领取!");
		end
	else
		player:alert(1,1,"当前不是您投资后的第"..dayLimit[num].."日，无法领取噢!");
	end
end

function fresh_touzi(player,type)
	player:set_param(const.PP_TOUZI_TYPE,type);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtJinXu","bgid",TZ_data[type].jinxuID);
	for i=1,6 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZi"..i,"selected","false");
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZi"..type,"selected","true");

	for i=1,10 do
		player:set_panel_data(PANEL_ACTIONSET_NAME,"TZitem"..i,"typeid",TZItem_data[type][i].id);
		player:set_panel_data(PANEL_ACTIONSET_NAME,"TZitem"..i,"num",TZItem_data[type][i].num);
	end
	JudgeLQbtn(player,type);
end

function touzi_LJ(player)
	local type=util.ppn(player,const.PP_TOUZI_TYPE);

	if activity.isTouZiJiHua() then
		if util.ppn(player,TZ_data[type].isTouZi)==0 then
			if player:get_vcoin() >= TZ_data[type].need then
				player:set_param(TZ_data[type].isTouZi,today());
				player:sub_vcoin(TZ_data[type].need,"touzijihua"..type);
				player:alert(1,1,"恭喜您成功消耗"..TZ_data[type].need.."元宝，进行"..TZ_data[type].name.."!");
				JudgeLQbtn(player,type);
			else
				player:alert(1,1,"您的元宝不足"..TZ_data[type].need..",无法投资噢!");
			end
		else
			player:alert(1,1,"您已经投资过该项目噢!");
		end
	else
		player:alert(1,1,"当前不在活动日期内!");
	end
end

function JudgeLQbtn(player,type)
	local type=util.ppn(player,const.PP_TOUZI_TYPE);
	local dayNow=today();
	local dayOld=util.ppn(player,TZ_data[type].isTouZi);
	local day=dayNow-dayOld;

	if util.ppn(player,TZ_data[type].isTouZi)>0 then
		if dayOld<=0 then
			for i=1,5 do
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ"..i,"picid","280001");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ"..i,"mouseEnabled","false");
			end
		else
			
			if day==0 then
				local lqFlag;
				lqFlag = util.ppn(player,TZ_data[type].LQflag);
				--print(lqFlag);
				if tonumber(lqFlag) > day then 
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ1","picid","280001");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ1","mouseEnabled","false");
					return;
				end;
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ1","picid","280002");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ1","mouseEnabled","true");
			elseif day==2 then
				local lqFlag;
				lqFlag = util.ppn(player,TZ_data[type].LQflag);
				if tonumber(lqFlag) > day then 
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ2","picid","280001");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ2","mouseEnabled","true");
					return; 
				end;
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ2","picid","280002");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ2","mouseEnabled","true");
			elseif day==4 then
				local lqFlag;
				lqFlag = util.ppn(player,TZ_data[type].LQflag);
				if tonumber(lqFlag) > day then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ3","picid","280001");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ3","mouseEnabled","true"); 
					return; 
				end;
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ3","picid","280002");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ3","mouseEnabled","true");
			elseif day==6 then
				local lqFlag;
				lqFlag = util.ppn(player,TZ_data[type].LQflag);
				if tonumber(lqFlag) > day then 
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ4","picid","280001");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ4","mouseEnabled","true");
					return; 
				end;
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ4","picid","280002");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ4","mouseEnabled","true");
			elseif day==9 then
				local lqFlag;
				lqFlag = util.ppn(player,TZ_data[type].LQflag);
				if tonumber(lqFlag) > day then 
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ5","picid","280001");
					player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ5","mouseEnabled","true");
					return; 
				end;
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ5","picid","280002");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ5","mouseEnabled","true");
			end
		end
	else
		for i=1,5 do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ"..i,"picid","280001");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnTouZiLQ"..i,"mouseEnabled","false");
		end
	end
end



