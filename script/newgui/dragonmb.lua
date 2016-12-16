module(..., package.seeall)
--累计登陆奖励面板
local ACTIONSET_NAME="dragonmb";
local PANEL_ACTIONSET_NAME="paneldragonmb";
local MAXSTEP = 20;

local stepdata={
	[1]={	point=10,longhun=0,},
	[2]={	point=0,longhun=0,item={{name="兽灵精华(500)",num=1},},},
	[3]={	point=10,longhun=0,},
	[4]={	point=10,longhun=0,},
	[5]={	point=20,longhun=0,},
	[6]={	point=10,longhun=0,},
	[7]={	point=100,longhun=0,},
	[8]={	point=10,longhun=0,},
	[9]={	point=10,longhun=0,},
	[10]={	point=0,longhun=1,},
	[11]={	point=10,longhun=0,},
	[12]={	point=0,longhun=0,item= {{name="灵气珠(500)",num=1},},},
	[13]={	point=10,longhun=0,},
	[14]={	point=10,longhun=0,},
	[15]={	point=20,longhun=0,},
	[16]={	point=10,longhun=0,},
	[17]={	point=100,longhun=0,},
	[18]={	point=10,longhun=0,},
	[19]={	point=10,longhun=0,},
	[20]={	point=0,longhun=1,item= {{name="灵气珠(100)",num=1},{name="兽灵精华(100)",num=1},{name="真气丹(100)",num=1},{name="经验珠(500万)",num=1},},},
};
local itemjf_data = {
	[1]={name="装备灵魂石(100)",typeid="15138",price=100},
	[2]={name="转生石",typeid="10217",price=100},
	[3]={name="超级真气丹",typeid="15122",price=120},
	[4]={name="灵气珠(1000)",typeid="15106",price=120},
	[5]={name="兽灵精华(1000)",typeid="15112",price=120},
	[6]={name="守护资质丹",typeid="10305",price=30},
}
local itemlj_data = {
	[1]={name="装备灵魂石(1000)",typeid="15140",price=5},
	[2]={name="朱雀丹",typeid="15125",price=3},
	[3]={name="玄武丹",typeid="15126",price=3},
	[4]={name="白虎丹",typeid="15124",price=3},
	[5]={name="超级资质丹",typeid="10306",price=5},
}

function process_dragon(player,actionset,panelid,actionid)
	if activity.isLongChengMiBao() == false then
		player:alert(1,1,"不在活动时间范围内！");
		return;
	end
	if actionid == "btnBind" then
		if util.ppn(player,const.PP_DRAGON_LAYER)>=50 then
			player:alert(1,1,"每天只能游戏50层，明天再来吧！");
			return;
		end
		if player:get_vcoin_bind()>=200 then
			local bindtimes = util.ppn(player,const.PP_DRAGON_BINDVCOIN);
			if bindtimes>0 then
				local ss = util.ppn(player,const.PP_DRAGON_STAET_STEP);
				if ss <=13 then
					if player:num_bag_black()<1 then
						player:alert(1,1,"包裹不足一格，无法继续。");
						return;
					end
				else
					if player:num_bag_black()<4 then
						player:alert(1,1,"包裹不足四格，无法继续。");
						return;
					end
				end
				player:set_param(const.PP_DRAGON_BINDVCOIN,bindtimes-1);
				player:sub_vcoin_bind(200,"zougezibind");
				godarGonSetp(player);
			else
				player:alert(1,1,"绑定元宝每天只能游戏10次，明天再来吧！");
			end
		else
			player:alert(1,1,"200绑定元宝都没有，怎么玩！");
		end
		return;
	end
	if actionid == "btnVcoin" then
		if util.ppn(player,const.PP_DRAGON_LAYER)>=50 then
			player:alert(1,1,"每天只能游戏50层，明天再来吧！");
			return;
		end
		 if player:get_vcoin()>=200 then
			local ss = util.ppn(player,const.PP_DRAGON_STAET_STEP);
			if ss <=13 then
				if player:num_bag_black()<1 then
					player:alert(1,1,"包裹不足一格，无法继续。");
					return;
				end
			else
				if player:num_bag_black()<4 then
					player:alert(1,1,"包裹不足四格，无法继续。");
					return;
				end
			end
			player:sub_vcoin(200,"zougeizi");
			godarGonSetp(player);
		else
			player:alert(1,1,"200元宝都没有，怎么玩！");
		end
	end
	if string.sub(actionid,1,8) == "btnJFBuy" then
		local index = tonumber(string.sub(actionid,9));
		local buyitem =itemjf_data[index];
		local jf = util.ppn(player,const.PP_DRAGON_JI_FENG);
		if buyitem then
			if jf>=buyitem.price then
				if player:num_bag_black()>=1 then
					player:set_param(const.PP_DRAGON_JI_FENG,jf-buyitem.price);
					player:add_item(buyitem.typeid,1,1);
					freshDragonPanel(player);
					player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
				else
					player:alert(1,1,"包裹不足一格，无法购买");
				end
			else
				player:alert(1,1,"积分不足无法购买");
			end
		end
		return;
	end
	if string.sub(actionid,1,11) == "btnStoneBuy" then
		local index = tonumber(string.sub(actionid,12));
		local buyitem =itemlj_data[index];
		local lj = util.ppn(player,const.PP_DRAGON_LONG_JING);
		if buyitem then
			if lj>=buyitem.price then
				if player:num_bag_black()>=1 then
					player:set_param(const.PP_DRAGON_LONG_JING,lj-buyitem.price);
					player:add_item(buyitem.typeid,1,1);
					freshDragonPanel(player);
					player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
				else
					player:alert(1,1,"包裹不足一格，无法购买");
				end
			else
				player:alert(1,1,"龙晶不足无法购买");
			end
		end
		return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_dragon);

------------------------------------------------------------------------------------
function  godarGonSetp(player)
	local ss = util.ppn(player,const.PP_DRAGON_STAET_STEP);
	local rm =  math.random(1,6);
	local ly = util.ppn(player,const.PP_DRAGON_LAYER);
	local es = ss;
	--local es = util.ppn(player,const.PP_DRAGON_END_STEP);
	
	if ss+rm>MAXSTEP then
		es=MAXSTEP;
	else
		es=ss+rm;
	end
	local jl = stepdata[es];
	if jl then
		if jl.point>0 then 
			player:set_param(const.PP_DRAGON_JI_FENG,util.ppn(player,const.PP_DRAGON_JI_FENG)+jl.point);

			player:alert(1,1,"获得积分 "..jl.point.." 点");
		end
		if jl.longhun>0 then 
			player:set_param(const.PP_DRAGON_RED_LONG_JING,util.ppn(player,const.PP_DRAGON_RED_LONG_JING)+jl.longhun);
			player:alert(1,1,"获得红龙精华 "..jl.longhun.." 枚");
		end
		if jl.item then
			for i=1,#jl.item do
				player:add_item(jl.item[i].name,jl.item[i].num,1);
				player:alert(1,1,"获得 "..jl.item[i].name);
			end
		end
	end

	local isWarn = util.ppn(player,const.PP_DRAGON_WARN);
	if isWarn==1 then
		if (ly+1)%10==0 then
			server.info(10000,0,"勇士【"..player:get_name().."】到达了龙神秘宝第 "..(ly+1).." 层");
		end
		player:set_param(const.PP_DRAGON_WARN,0);
	end
	if es>=MAXSTEP then
		es=0;
		player:set_param(const.PP_DRAGON_LAYER,ly+1);
		player:set_param(const.PP_DRAGON_WARN,1);
	end
	
	local lhjh = util.ppn(player,const.PP_DRAGON_RED_LONG_JING);
	if	lhjh>=6 then
		lhjh=lhjh-6;
		player:set_param(const.PP_DRAGON_LONG_JING,util.ppn(player,const.PP_DRAGON_LONG_JING)+1);
		player:set_param(const.PP_DRAGON_RED_LONG_JING,lhjh);
	end
	player:set_param(const.PP_DRAGON_STAET_STEP,es);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"dragonmbgo","SetpTxt",ss.."_"..es);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"pointCen","point",ly+1);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"imgsaizi","bgid",210013+rm);
	freshDragonPanel(player);
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
function freshDragonPanel(player)
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtJF","text",util.ppn(player,const.PP_DRAGON_JI_FENG));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtStone","text",util.ppn(player,const.PP_DRAGON_LONG_JING));
	player:set_panel_data(PANEL_ACTIONSET_NAME,"txtcishu","text",util.ppn(player,const.PP_DRAGON_BINDVCOIN).."/10 次");
	
	if util.ppn(player,const.PP_DRAGON_BINDVCOIN)<=0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnBind","grayFilter","true");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnBind","mouseEnabled","false");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnBind","grayFilter","false");
		player:set_panel_data(PANEL_ACTIONSET_NAME,"btnBind","mouseEnabled","true");
	end
	--local p = util.ppn(player,const.PP_DRAGON_STAET_STEP);
	local lhjh =  util.ppn(player,const.PP_DRAGON_RED_LONG_JING);
	for i=1,6 do
		if lhjh>=i then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"imghljh"..i,"bgid","210008");
		else
			player:set_panel_data(PANEL_ACTIONSET_NAME,"imghljh"..i,"bgid","210009");
		end
	end
	--player:set_panel_data(PANEL_ACTIONSET_NAME,"dragonmbgo","SetpTxt",p.."_"..p);
	--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function pushlisttoclient(player)
	local typeidlist = "";
	local namelist = "";
	local pricelist = "";
	for i=1,#itemjf_data do
		typeidlist=typeidlist..itemjf_data[i].typeid;
		namelist=namelist..itemjf_data[i].name;
		pricelist=pricelist..itemjf_data[i].price;
		if i~=#itemjf_data then
			typeidlist=typeidlist..",";
			namelist=namelist..",";
			pricelist=pricelist..",";
		end
	end		
	player:set_panel_data(PANEL_ACTIONSET_NAME,"dragonmbgo","leftgoods",typeidlist.."_"..namelist.."_"..pricelist);

	typeidlist = "";
	namelist = "";
	pricelist = "";
	for i=1,#itemlj_data do
		typeidlist=typeidlist..itemlj_data[i].typeid;
		namelist=namelist..itemlj_data[i].name;
		pricelist=pricelist..itemlj_data[i].price;
		if i~=#itemlj_data then
			typeidlist=typeidlist..",";
			namelist=namelist..",";
			pricelist=pricelist..",";
		end
	end
	local p = util.ppn(player,const.PP_DRAGON_STAET_STEP);
	if p>0 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"dragonmbgo","SetpTxt",p.."_"..p);
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"dragonmbgo","SetpTxt",0);
	end
	player:set_panel_data(PANEL_ACTIONSET_NAME,"dragonmbgo","rightgoods",typeidlist.."_"..namelist.."_"..pricelist);
		--player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);

	player:set_panel_data(PANEL_ACTIONSET_NAME,"pointCen","point",util.ppn(player,const.PP_DRAGON_LAYER)+1);
end