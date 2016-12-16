module(..., package.seeall)
local ACTIONSET_NAME="hanghui";
local PANEL_ACTIONSET_NAME="panelhanghui";
local MAX_GUILD_LEVEL=5;

local hh_data={
	[1]={name="1级行会",nexp=10000,
		shop={
			{id=19002,name="还魂丹",need=5,limit=2,bind=1,cbl=const.PP_GUILD_BUY1_1},
			{id=15014,name="赎罪药水",need=10,limit=3,bind=1,cbl=const.PP_GUILD_BUY1_2},
		},
	},
	[2]={name="2级行会",nexp=25000,
		shop={
			{id=10224,name="一级攻击玄晶",need=10,limit=3,bind=0,cbl=const.PP_GUILD_BUY2_1},
			{id=10236,name="一级物防玄晶",need=10,limit=3,bind=0,cbl=const.PP_GUILD_BUY2_2},
			{id=10248,name="一级魔防玄晶",need=10,limit=3,bind=0,cbl=const.PP_GUILD_BUY2_3},
			{id=10260,name="一级生命玄晶",need=10,limit=3,bind=0,cbl=const.PP_GUILD_BUY2_4},
		},
	},
	[3]={name="3级行会",nexp=50000,
		shop={
			{id=10076,name="蓝玉镖令",need=15,limit=5,bind=1,cbl=const.PP_GUILD_BUY3_1},
			{id=10080,name="女儿红(10年)",need=15,limit=5,bind=1,cbl=const.PP_GUILD_BUY3_2},
			{id=10177,name="经验珠(2000万)",need=25,limit=2,bind=1,cbl=const.PP_GUILD_BUY3_3},
		},
	},
	[4]={name="4级行会",nexp=150000,
		shop={
			{id=15042,name="魂石令牌(100)",need=10,limit=3,bind=1,cbl=const.PP_GUILD_BUY4_1},
			{id=15045,name="荣誉令牌(1000)",need=10,limit=3,bind=1,cbl=const.PP_GUILD_BUY4_2},
			{id=15054,name="成就令牌",need=10,limit=3,bind=1,cbl=const.PP_GUILD_BUY4_3},
		},
	},
	[5]={name="5级行会",nexp=500000,
		shop={
			{id=15037,name="坐骑经验丹(大)",need=25,limit=2,bind=1,cbl=const.PP_GUILD_BUY5_1},
			{id=15056,name="修为令牌",need=25,limit=2,bind=1,cbl=const.PP_GUILD_BUY5_2},
		},
	},
}

function chongzhiBianLiang(player)
	for i=1,#hh_data do
		local gshop = hh_data[i].shop;
		for j=1,#gshop do
			player:set_param(gshop[j].cbl,0);
		end
	end
end

function onClick(player,actionset,panelid,actionid)
	--print("test",actionid)
	if actionid=="btnguildlook" then
 		fresh_hanghui_gongxian(player);
	end
	if actionid=="btnYuanBaolittle" then
 		GiveYuanbaolittle(player);
	end
	if actionid=="btnYuanBao" then
		GiveYuanbao(player);
	end
	if actionid=="chengyuanshenhe" then
		fresh_hanghui_gongxian(player);
	end
	if actionid=="guildlevel" then 
		fresh_hanghui_gongxian(player);
	end
	if actionid=="guildshop" then 
		fresh_hanghui_gongxian(player);
	end
	if string.sub(actionid,1,5) == "gsbtn" then
		local targuild = tonumber(string.sub(actionid,6,6));
		local itemid = tonumber(string.sub(actionid,8))
		--print("next",targuild,itemid)
		if hh_data[targuild] and hh_data[targuild].shop[itemid] then
			doGuildItemBuy(player,targuild,itemid);
		end
		return;
	end
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
ckpanel.add_listener(ACTIONSET_NAME,onClick);

--txtHanghuiName
--gsbtn1_1

function logguildjxinfo(player,a,b,c)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		local guild = server.find_guild(guildname);
		if guild then
			local noexist = true;	
			if noexist then
				for i=1,19 do
					player:set_guild_param("g"..i.."1",player:get_guild_param("gg"..i.."1"));
					player:set_guild_param("g"..i.."2",player:get_guild_param("gg"..i.."2"));
				end
				for i=1,19 do
					player:set_guild_param("gg"..(i+1).."1",player:get_guild_param("g"..i.."1"));
					player:set_guild_param("gg"..(i+1).."2",player:get_guild_param("g"..i.."2"));
				end
			end
			player:set_guild_param("gg11",a);
			player:set_guild_param("gg12",b);
		end
	end
end



function  GiveYuanbao(player)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		local guild = server.find_guild(guildname);
		if guild then
			local curexp = guild:get_guild_point();
			local glv = guild:get_guild_level();
			if glv >= MAX_GUILD_LEVEL then
				player:alert(1,1,"当前行会已达最高等级,不需要贡献!");return;
			end
			local gdata = hh_data[glv];
			if gdata then
				---------------------------------------------------------------------
				if player:get_vcoin() >= 5000 then
					player:sub_vcoin(5000,"gxguild");
					player:add_guild_gx(50);
					if curexp + 50 >= gdata.nexp then
						guild:set_guild_point(curexp + 50-gdata.nexp);
						guild:set_guild_level(guild:get_guild_level()+1);
						server.info(10000,0,"恭喜["..guildname.."]在全体成员的努力下发展壮大，提升至【"..guild:get_guild_level().."级】!");
					else
						guild:set_guild_point(curexp + 50);
					end
					logguildjxinfo(player,player:get_name(),5000,0);
					player:alert(1,1,"恭喜您捐献5000元宝,获得50点行会贡献");
				else
					player:alert(2,1,PANEL_ACTIONSET_NAME.."|".."btnYuanBao".."|您的元宝不足5000".."|0xFF0000");
				end
				---------------------------------------------------------------------
				fresh_hanghui_gongxian(player);
			end
		end
	end
end

function  GiveYuanbaolittle(player)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		local guild = server.find_guild(guildname);
		if guild then
			local curexp = guild:get_guild_point();
			local glv = guild:get_guild_level();
			if glv >= MAX_GUILD_LEVEL then
				player:alert(1,1,"当前行会已达最高等级,不需要贡献!");return;
			end
			local gdata = hh_data[glv];
			if gdata then
				---------------------------------------------------------------------
				if player:get_vcoin() >= 500 then
					player:sub_vcoin(500,"gxguild");
					player:add_guild_gx(5);
					if curexp + 5 >= gdata.nexp then
						guild:set_guild_point(curexp + 5-gdata.nexp);
						guild:set_guild_level(guild:get_guild_level()+1);
						server.info(10000,0,"恭喜["..guildname.."]在全体成员的努力下发展壮大，提升至【"..guild:get_guild_level().."级】!");
					else
						guild:set_guild_point(curexp + 5);
					end
					logguildjxinfo(player,player:get_name(),500,0);
					player:alert(1,1,"恭喜您捐献500元宝,获得5点行会贡献");
				else
					player:alert(2,1,PANEL_ACTIONSET_NAME.."|".."btnYuanBaolittle".."|您的元宝不足500".."|0xFF0000");
				end
				---------------------------------------------------------------------
				fresh_hanghui_gongxian(player);
			end
		end
	end
end

function AddGuildGongXian(player,add)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		player:add_guild_gx(add);
	end
end
function AddGuildExp(player,add)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		local guild = server.find_guild(guildname);
		if guild then
			guild:add_guild_exp(add);
		end
	end
end
function AddGuildExpGongxianSame(player,add)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		local guild = server.find_guild(guildname);
		if guild then
			local curexp = guild:get_guild_point();
			local glv = guild:get_guild_level();
			if glv >= MAX_GUILD_LEVEL then
				player:add_guild_gx(add);return;
			end
			local gdata = hh_data[glv];
			if gdata then
				player:add_guild_gx(add);
				if curexp + add >= gdata.nexp then
					guild:set_guild_point(curexp + add-gdata.nexp);
					guild:set_guild_level(guild:get_guild_level()+1);
					server.info(10000,0,"恭喜["..guildname.."]在全体成员的努力下发展壮大，提升至【"..guild:get_guild_level().."级】!");
				else
					guild:set_guild_point(curexp + add);
				end
				fresh_hanghui_gongxian(player);
			end
			--player:alert(1,1,"恭喜您获得"..add.."点行会贡献,获得"..add.."点行会经验");
		end
	end
end


function doGuildItemBuy(player,targuild,itemid)
	--print("doGuildItemBuy",targuild,itemid)
	local guildname = player:get_guild();
	if guildname and guild ~= "" then
		local guild = server.find_guild(guildname);
		if guild then
			if guild:get_guild_level() < targuild then player:alert(1,1,"当前行会商店等级尚未达到"..targuild.."级!"); return; end
			if player:num_bag_black() < 1 then player:alert(1,1,"背包不足1格,购买失败!");return; end
			if hh_data[targuild] then
				local shopid = hh_data[targuild].shop[itemid];
				if shopid then
					if util.ppn(player,shopid.cbl) >= shopid.limit then
						player:alert(1,1,"当前道具已达单日购买上限!");return;
					end
					if player:get_guild_gx() >= shopid.need then
						player:set_param(shopid.cbl,util.ppn(player,shopid.cbl)+1);
						player:sub_guild_gx(shopid.need);
						player:add_item(shopid.name,1,shopid.bind);
						player:alert(1,1,"消耗"..(shopid.need).."点贡献,成功购买"..(shopid.name));
						fresh_hanghui_gongxian(player);
					else
						player:alert(1,1,"您的剩余行会贡献不足"..shopid.need);return;
					end
				end
			end
		end
	end
end


function fresh_hanghui_gongxian(player)
	local guildname = player:get_guild();
	local guild = server.find_guild(guildname);
	if guildname and guild ~= "" then
		if guild then
			--print("fresh_hanghui_gongxian",player:get_guild_gx(),player:get_guild_zgx());
			
			player:set_panel_data(PANEL_ACTIONSET_NAME,"pregongxian","text",player:get_guild_gx());
			player:set_panel_data(PANEL_ACTIONSET_NAME,"subgongxian","text",player:get_guild_zgx());

			player:set_panel_data(PANEL_ACTIONSET_NAME,"pregongxian1","text",player:get_guild_gx());
			player:set_panel_data(PANEL_ACTIONSET_NAME,"subgongxian1","text",player:get_guild_zgx());

			for i=1,20 do
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtname"..(i-1),"htmlText",player:get_guild_param("gg"..i.."1"));
				player:set_panel_data(PANEL_ACTIONSET_NAME,"txtYuanBao"..(i-1),"htmlText",player:get_guild_param("gg"..i.."2"));
			end
			local glv = guild:get_guild_level();
			local shop = hh_data[glv].shop;
			player:set_panel_data(PANEL_ACTIONSET_NAME,"guipanelhanghui","guildexp",guild:get_guild_point());
			player:set_panel_data(PANEL_ACTIONSET_NAME,"guipanelhanghui","guildexpMax",hh_data[glv].nexp);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGlevel1","text","【"..glv.."】级");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtGlevel","text","【"..glv.."】级");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"btnCreate","visible","false");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"txtHanghuiName","htmlText",guildname);
			---------
			for i=1,#hh_data do
				local gshop = hh_data[i].shop;
				for j=1,#gshop do
					if glv >= i then
						player:set_panel_data(PANEL_ACTIONSET_NAME,"gsbtn"..i.."_"..j,"grayFilter","false");
						player:set_panel_data(PANEL_ACTIONSET_NAME,"gsbtn"..i.."_"..j,"mouseEnabled","true");
					else
						player:set_panel_data(PANEL_ACTIONSET_NAME,"gsbtn"..i.."_"..j,"grayFilter","true");
						player:set_panel_data(PANEL_ACTIONSET_NAME,"gsbtn"..i.."_"..j,"mouseEnabled","false");
					end
					player:set_panel_data(PANEL_ACTIONSET_NAME,"gsbuyTime"..i.."_"..j,"text",""..util.ppn(player,gshop[j].cbl).."/"..gshop[j].limit);
				end
			end
			---------
			
			if glv < MAX_GUILD_LEVEL then
				 local next_shop =  hh_data[glv+1].shop;
				 for i=1,#shop do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"upctxt"..i,"text",shop[i].name);
				 end
				 for i=1,#next_shop do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"upntxt"..i,"text",next_shop[i].name);
				 end
				 player:set_panel_data(PANEL_ACTIONSET_NAME,"upcslv","text","["..glv.."]级商店激活");
				 player:set_panel_data(PANEL_ACTIONSET_NAME,"upnslv","text","["..(glv+1).."]级商店激活");
			else
				for i=1,#shop do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"upctxt"..i,"text",shop[i].name);
				end
				for i=1,3 do
					player:set_panel_data(PANEL_ACTIONSET_NAME,"upntxt"..i,"text","");
				end
				player:set_panel_data(PANEL_ACTIONSET_NAME,"upcslv","text","["..glv.."]级商店激活");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"upnslv","text","已达最高等级");
			end
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		end
	end
end
login.add_login_listener(fresh_hanghui_gongxian);

--gsbuyTime1
--gsbtn7