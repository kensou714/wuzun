module(..., package.seeall)
local ACTIONSET_NAME="basalt";
local PANEL_ACTIONSET_NAME="panelbasalt";

function process_xuanjing_xq(player,actionset,panelid,actionid,data)
	if actionid == "xqhc" then
		process_xjhc(player,data);return;
	end
	if actionid == "xjxq" then
		process_xjxq(player,data);return;
	end
	if actionid == "xjzc" then
		process_xjzc(player,data);return;
	end
	if actionid == "xjallzc" then
		process_xjallzc(player,data);return;
	end
	if actionid == "btnxuanjing" then
		fresh_xq_rate(player);return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_xuanjing_xq);

-----------------------------------------镶嵌面板--------------------------------------
local xq_data={
	{pos=ckattr.ITEM_WEAPON_POSITION,name="武器",};
	{pos=ckattr.ITEM_CLOTH_POSITION,name="衣服",};
	{pos=ckattr.ITEM_HAT_POSITION,name="头盔",};
	{pos=ckattr.ITEM_RING1_POSITION,name="戒指",};
	{pos=ckattr.ITEM_RING2_POSITION,name="戒指",};
	{pos=ckattr.ITEM_GLOVE1_POSITION,name="手镯",};
	{pos=ckattr.ITEM_GLOVE2_POSITION,name="手镯",};
	{pos=ckattr.ITEM_NICKLACE_POSITION,name="项链",};
	{pos=ckattr.ITEM_BELT_POSITION,name="腰带",};
	{pos=ckattr.ITEM_BOOT_POSITION,name="靴子",};
	{pos=ckattr.ITEM_HUIZHANG_POSITION,name="徽章",};
	{pos=ckattr.ITEM_HUNQI_POSITION,name="魂器",};
	{pos=ckattr.ITEM_WING_POSITION,name="翅膀",};
	{pos=ckattr.ITEM_TEJIE_POSITION,name="特戒",};
	{pos=ckattr.ITEM_LINGPAI_POSITION,name="令牌",};
};
local xj_data={
	{typeid=10224,xjlv=1,xqtype=1,attr={{ckattr.SIAP_FIGHT,3}   ,{ckattr.SIAP_DCMAX_ADD,1}   ,{ckattr.SIAP_DC_ADD,0}   ,{ckattr.SIAP_SCMAX_ADD,1}   ,{ckattr.SIAP_SC_ADD,0}   ,{ckattr.SIAP_MCMAX_ADD,1}   ,{ckattr.SIAP_MC_ADD,0}   },money=1000};
	{typeid=10225,xjlv=2,xqtype=1,attr={{ckattr.SIAP_FIGHT,7}   ,{ckattr.SIAP_DCMAX_ADD,2}   ,{ckattr.SIAP_DC_ADD,1}   ,{ckattr.SIAP_SCMAX_ADD,2}   ,{ckattr.SIAP_SC_ADD,1}   ,{ckattr.SIAP_MCMAX_ADD,2}   ,{ckattr.SIAP_MC_ADD,1}   },money=3000};
	{typeid=10226,xjlv=3,xqtype=1,attr={{ckattr.SIAP_FIGHT,14}   ,{ckattr.SIAP_DCMAX_ADD,4}   ,{ckattr.SIAP_DC_ADD,2}   ,{ckattr.SIAP_SCMAX_ADD,4}   ,{ckattr.SIAP_SC_ADD,2}   ,{ckattr.SIAP_MCMAX_ADD,4}   ,{ckattr.SIAP_MC_ADD,2}   },money=9000};
	{typeid=10227,xjlv=4,xqtype=1,attr={{ckattr.SIAP_FIGHT,28}   ,{ckattr.SIAP_DCMAX_ADD,8}   ,{ckattr.SIAP_DC_ADD,4}   ,{ckattr.SIAP_SCMAX_ADD,8}   ,{ckattr.SIAP_SC_ADD,4}   ,{ckattr.SIAP_MCMAX_ADD,8}   ,{ckattr.SIAP_MC_ADD,4}   },money=27000};
	{typeid=10228,xjlv=5,xqtype=1,attr={{ckattr.SIAP_FIGHT,56}  ,{ckattr.SIAP_DCMAX_ADD,16}  ,{ckattr.SIAP_DC_ADD,8}   ,{ckattr.SIAP_SCMAX_ADD,16}  ,{ckattr.SIAP_SC_ADD,8}   ,{ckattr.SIAP_MCMAX_ADD,16}  ,{ckattr.SIAP_MC_ADD,8}   },money=81000};
	{typeid=10229,xjlv=6,xqtype=1,attr={{ckattr.SIAP_FIGHT,112}  ,{ckattr.SIAP_DCMAX_ADD,32}  ,{ckattr.SIAP_DC_ADD,16}  ,{ckattr.SIAP_SCMAX_ADD,32}  ,{ckattr.SIAP_SC_ADD,16}  ,{ckattr.SIAP_MCMAX_ADD,32}  ,{ckattr.SIAP_MC_ADD,16}  },money=243000};
	{typeid=10230,xjlv=7,xqtype=1,attr={{ckattr.SIAP_FIGHT,224}  ,{ckattr.SIAP_DCMAX_ADD,64}  ,{ckattr.SIAP_DC_ADD,32}  ,{ckattr.SIAP_SCMAX_ADD,64}  ,{ckattr.SIAP_SC_ADD,32}  ,{ckattr.SIAP_MCMAX_ADD,64}  ,{ckattr.SIAP_MC_ADD,32}  },money=729000};
	{typeid=10231,xjlv=8,xqtype=1,attr={{ckattr.SIAP_FIGHT,448} ,{ckattr.SIAP_DCMAX_ADD,128} ,{ckattr.SIAP_DC_ADD,64}  ,{ckattr.SIAP_SCMAX_ADD,128} ,{ckattr.SIAP_SC_ADD,64}  ,{ckattr.SIAP_MCMAX_ADD,128} ,{ckattr.SIAP_MC_ADD,64}  },money=2187000};
	{typeid=10232,xjlv=9,xqtype=1,attr={{ckattr.SIAP_FIGHT,896} ,{ckattr.SIAP_DCMAX_ADD,256} ,{ckattr.SIAP_DC_ADD,128} ,{ckattr.SIAP_SCMAX_ADD,256} ,{ckattr.SIAP_SC_ADD,128} ,{ckattr.SIAP_MCMAX_ADD,256} ,{ckattr.SIAP_MC_ADD,128} },money=2187000};
	{typeid=10233,xjlv=10,xqtype=1,attr={{ckattr.SIAP_FIGHT,1792} ,{ckattr.SIAP_DCMAX_ADD,512} ,{ckattr.SIAP_DC_ADD,256} ,{ckattr.SIAP_SCMAX_ADD,512} ,{ckattr.SIAP_SC_ADD,256} ,{ckattr.SIAP_MCMAX_ADD,512} ,{ckattr.SIAP_MC_ADD,256} },money=2187000};
	{typeid=10234,xjlv=11,xqtype=1,attr={{ckattr.SIAP_FIGHT,3584},{ckattr.SIAP_DCMAX_ADD,1024},{ckattr.SIAP_DC_ADD,512} ,{ckattr.SIAP_SCMAX_ADD,1024},{ckattr.SIAP_SC_ADD,512} ,{ckattr.SIAP_MCMAX_ADD,1024},{ckattr.SIAP_MC_ADD,512} },money=2187000};
	{typeid=10235,xjlv=12,xqtype=1,attr={{ckattr.SIAP_FIGHT,7168},{ckattr.SIAP_DCMAX_ADD,2048},{ckattr.SIAP_DC_ADD,1024},{ckattr.SIAP_SCMAX_ADD,2048},{ckattr.SIAP_SC_ADD,1024},{ckattr.SIAP_MCMAX_ADD,2048},{ckattr.SIAP_MC_ADD,1024}},money=2187000};
	{typeid=10236,xjlv=1,xqtype=2,attr={{ckattr.SIAP_FIGHT,3}   ,{ckattr.SIAP_ACMAX_ADD,1}   ,{ckattr.SIAP_AC_ADD,0}   },money=1000};
	{typeid=10237,xjlv=2,xqtype=2,attr={{ckattr.SIAP_FIGHT,7}   ,{ckattr.SIAP_ACMAX_ADD,2}   ,{ckattr.SIAP_AC_ADD,1}   },money=3000};
	{typeid=10238,xjlv=3,xqtype=2,attr={{ckattr.SIAP_FIGHT,14}   ,{ckattr.SIAP_ACMAX_ADD,3}   ,{ckattr.SIAP_AC_ADD,2}   },money=9000};
	{typeid=10239,xjlv=4,xqtype=2,attr={{ckattr.SIAP_FIGHT,28}   ,{ckattr.SIAP_ACMAX_ADD,4}   ,{ckattr.SIAP_AC_ADD,3}   },money=27000};
	{typeid=10240,xjlv=5,xqtype=2,attr={{ckattr.SIAP_FIGHT,56}   ,{ckattr.SIAP_ACMAX_ADD,6}   ,{ckattr.SIAP_AC_ADD,4}   },money=81000};
	{typeid=10241,xjlv=6,xqtype=2,attr={{ckattr.SIAP_FIGHT,112}  ,{ckattr.SIAP_ACMAX_ADD,12}  ,{ckattr.SIAP_AC_ADD,6}   },money=243000};
	{typeid=10242,xjlv=7,xqtype=2,attr={{ckattr.SIAP_FIGHT,224}  ,{ckattr.SIAP_ACMAX_ADD,25}  ,{ckattr.SIAP_AC_ADD,12}  },money=729000};
	{typeid=10243,xjlv=8,xqtype=2,attr={{ckattr.SIAP_FIGHT,448}  ,{ckattr.SIAP_ACMAX_ADD,51}  ,{ckattr.SIAP_AC_ADD,25}  },money=2187000};
	{typeid=10244,xjlv=9,xqtype=2,attr={{ckattr.SIAP_FIGHT,896} ,{ckattr.SIAP_ACMAX_ADD,102} ,{ckattr.SIAP_AC_ADD,51}  },money=2187000};
	{typeid=10245,xjlv=10,xqtype=2,attr={{ckattr.SIAP_FIGHT,1792} ,{ckattr.SIAP_ACMAX_ADD,204} ,{ckattr.SIAP_AC_ADD,102} },money=2187000};
	{typeid=10246,xjlv=11,xqtype=2,attr={{ckattr.SIAP_FIGHT,3584} ,{ckattr.SIAP_ACMAX_ADD,409} ,{ckattr.SIAP_AC_ADD,204} },money=2187000};
	{typeid=10247,xjlv=12,xqtype=2,attr={{ckattr.SIAP_FIGHT,7168} ,{ckattr.SIAP_ACMAX_ADD,819} ,{ckattr.SIAP_AC_ADD,409} },money=2187000};
	{typeid=10248,xjlv=1,xqtype=3,attr={{ckattr.SIAP_FIGHT,3}  ,{ckattr.SIAP_MACMAX_ADD,1}  ,{ckattr.SIAP_MAC_ADD,0}   },money=1000};
	{typeid=10249,xjlv=2,xqtype=3,attr={{ckattr.SIAP_FIGHT,7}  ,{ckattr.SIAP_MACMAX_ADD,2}  ,{ckattr.SIAP_MAC_ADD,1}   },money=3000};
	{typeid=10250,xjlv=3,xqtype=3,attr={{ckattr.SIAP_FIGHT,14}  ,{ckattr.SIAP_MACMAX_ADD,3}  ,{ckattr.SIAP_MAC_ADD,2}   },money=9000};
	{typeid=10251,xjlv=4,xqtype=3,attr={{ckattr.SIAP_FIGHT,28}  ,{ckattr.SIAP_MACMAX_ADD,4}  ,{ckattr.SIAP_MAC_ADD,3}   },money=27000};
	{typeid=10252,xjlv=5,xqtype=3,attr={{ckattr.SIAP_FIGHT,56}  ,{ckattr.SIAP_MACMAX_ADD,6}  ,{ckattr.SIAP_MAC_ADD,4}   },money=81000};
	{typeid=10253,xjlv=6,xqtype=3,attr={{ckattr.SIAP_FIGHT,112} ,{ckattr.SIAP_MACMAX_ADD,12} ,{ckattr.SIAP_MAC_ADD,6}   },money=243000};
	{typeid=10254,xjlv=7,xqtype=3,attr={{ckattr.SIAP_FIGHT,224} ,{ckattr.SIAP_MACMAX_ADD,25} ,{ckattr.SIAP_MAC_ADD,12}  },money=729000};
	{typeid=10255,xjlv=8,xqtype=3,attr={{ckattr.SIAP_FIGHT,448} ,{ckattr.SIAP_MACMAX_ADD,51} ,{ckattr.SIAP_MAC_ADD,25}  },money=2187000};
	{typeid=10256,xjlv=9,xqtype=3,attr={{ckattr.SIAP_FIGHT,896},{ckattr.SIAP_MACMAX_ADD,102},{ckattr.SIAP_MAC_ADD,51}  },money=2187000};
	{typeid=10257,xjlv=10,xqtype=3,attr={{ckattr.SIAP_FIGHT,1792},{ckattr.SIAP_MACMAX_ADD,204},{ckattr.SIAP_MAC_ADD,102} },money=2187000};
	{typeid=10258,xjlv=11,xqtype=3,attr={{ckattr.SIAP_FIGHT,3584},{ckattr.SIAP_MACMAX_ADD,409},{ckattr.SIAP_MAC_ADD,204} },money=2187000};
	{typeid=10259,xjlv=12,xqtype=3,attr={{ckattr.SIAP_FIGHT,7168},{ckattr.SIAP_MACMAX_ADD,819},{ckattr.SIAP_MAC_ADD,409} },money=2187000};
	{typeid=10260,xjlv=1,xqtype=4,attr={{ckattr.SIAP_FIGHT,3}  ,{ckattr.SIAP_MAXHP_ADD,10}  ,{ckattr.SIAP_MAXHP_MUL,10}  ,{ckattr.SIAP_MAXMP_MUL,10}  },money=1000};
	{typeid=10261,xjlv=2,xqtype=4,attr={{ckattr.SIAP_FIGHT,7}  ,{ckattr.SIAP_MAXHP_ADD,20}  ,{ckattr.SIAP_MAXHP_MUL,20}  ,{ckattr.SIAP_MAXMP_MUL,20}  },money=3000};
	{typeid=10262,xjlv=3,xqtype=4,attr={{ckattr.SIAP_FIGHT,14}  ,{ckattr.SIAP_MAXHP_ADD,40}  ,{ckattr.SIAP_MAXHP_MUL,40}  ,{ckattr.SIAP_MAXMP_MUL,40}  },money=9000};
	{typeid=10263,xjlv=4,xqtype=4,attr={{ckattr.SIAP_FIGHT,28}  ,{ckattr.SIAP_MAXHP_ADD,80}  ,{ckattr.SIAP_MAXHP_MUL,80}  ,{ckattr.SIAP_MAXMP_MUL,80}  },money=27000};
	{typeid=10264,xjlv=5,xqtype=4,attr={{ckattr.SIAP_FIGHT,56} ,{ckattr.SIAP_MAXHP_ADD,120} ,{ckattr.SIAP_MAXHP_MUL,120} ,{ckattr.SIAP_MAXMP_MUL,120} },money=81000};
	{typeid=10265,xjlv=6,xqtype=4,attr={{ckattr.SIAP_FIGHT,112} ,{ckattr.SIAP_MAXHP_ADD,200} ,{ckattr.SIAP_MAXHP_MUL,200} ,{ckattr.SIAP_MAXMP_MUL,200} },money=243000};
	{typeid=10266,xjlv=7,xqtype=4,attr={{ckattr.SIAP_FIGHT,224} ,{ckattr.SIAP_MAXHP_ADD,300} ,{ckattr.SIAP_MAXHP_MUL,300} ,{ckattr.SIAP_MAXMP_MUL,300} },money=729000};
	{typeid=10267,xjlv=8,xqtype=4,attr={{ckattr.SIAP_FIGHT,448} ,{ckattr.SIAP_MAXHP_ADD,420} ,{ckattr.SIAP_MAXHP_MUL,420} ,{ckattr.SIAP_MAXMP_MUL,420} },money=2187000};
	{typeid=10268,xjlv=9,xqtype=4,attr={{ckattr.SIAP_FIGHT,896} ,{ckattr.SIAP_MAXHP_ADD,600} ,{ckattr.SIAP_MAXHP_MUL,600} ,{ckattr.SIAP_MAXMP_MUL,600} },money=2187000};
	{typeid=10269,xjlv=10,xqtype=4,attr={{ckattr.SIAP_FIGHT,1792} ,{ckattr.SIAP_MAXHP_ADD,800} ,{ckattr.SIAP_MAXHP_MUL,800} ,{ckattr.SIAP_MAXMP_MUL,800} },money=2187000};
	{typeid=10270,xjlv=11,xqtype=4,attr={{ckattr.SIAP_FIGHT,3584},{ckattr.SIAP_MAXHP_ADD,1100},{ckattr.SIAP_MAXHP_MUL,1100},{ckattr.SIAP_MAXMP_MUL,1100}},money=2187000};
	{typeid=10271,xjlv=12,xqtype=4,attr={{ckattr.SIAP_FIGHT,7168},{ckattr.SIAP_MAXHP_ADD,1500},{ckattr.SIAP_MAXHP_MUL,1500},{ckattr.SIAP_MAXMP_MUL,1500}},money=2187000};
}
local bs_data_sort={};for i=1,#xj_data do bs_data_sort[xj_data[i].typeid]=xj_data[i];end;

function recalculate_xqattr(player)
	for i=1,#xq_data do
		local xd=xq_data[i];
		if xd and player:get_param(const.PP_XIANGQIAN_POS+i) == "" then
			player:set_param(const.PP_XIANGQIAN_POS+i,"00000_00000_00000_00000");
		end
	end
end
login.add_login_listener(recalculate_xqattr);

function get_xqitemid(player,slotpor)
	local materialBl= {};
	for i=1,#xq_data do
		local xd=xq_data[i];
		if xd.pos == slotpor then
			local strparam = player:get_param(const.PP_XIANGQIAN_POS+i);
			materialBl[1]=tonumber(string.sub(strparam, 1, 5));
			materialBl[2]=tonumber(string.sub(strparam, 7, 11));
			materialBl[3]=tonumber(string.sub(strparam, 13, 17));
			materialBl[4]= tonumber(string.sub(strparam, 19, 23));
			return materialBl;
		end
	end
end
--------------------------------复活节刷新玄晶镶嵌几率-------------------------------
function fresh_xq_rate(player)
	if activity.isXuanJingHeChengOpen() or newgui.jingcaihuodong.isOpenActivity(player,"xjhcsd") then
		player:set_panel_data("panelbasalt","txtAddRate","visible","true");
	else
		player:set_panel_data("panelbasalt","txtAddRate","visible","false");
	end
	player:push_ckpanel_data("basalt","panelbasalt");
end
login.add_login_listener(fresh_xq_rate);
--------------------------------刷新计算镶嵌等级之和-------------------------------
function calculate_xjlv(player)
	if activity.isBaifuSjieOpen() then
		local xjlv=0;
		for i=1,#xq_data do
			local xd=xq_data[i];
			--if xd.pos == pos then
				local thisdata = get_xqitemid(player,xd.pos);
				if thisdata then
					for j=1,#thisdata do
						local thisid = thisdata[j];
						if thisid > 0 then
							local bd = bs_data_sort[thisid];
							xjlv=xjlv + bd.xjlv;
						end
						--[[if thisid == 0 then
							xjlv=xjlv;
						end]]
						--print(xd.pos,xjlv);
					end
				end
			--end
		end
		--return xjlv;
		if xjlv >= util.ppn(player,const.PP_XUANJIN_MAXSUBLV) then
			player:set_param(const.PP_XUANJIN_MAXSUBLV,xjlv);
			newgui.minimap.levelxj_Recharge_process(player,xjlv);
		end
	end
end
--login.add_login_listener(calculate_xjlv);--不做login监听了，放到player.lua的entergame里面调用
------------------------------------------------------------------------------
--刷新计算属性
function fresh_siap_attr_xq(player,attr,pos)
	  for i=1,#xq_data do
		local xd=xq_data[i];
		if xd.pos == pos then
			local thisdata = get_xqitemid(player,pos);
			if thisdata then
				for j=1,#thisdata do
					local thisid = thisdata[j];
					if thisid > 0 then
						local bd = bs_data_sort[thisid];
						if bd and bd.attr then
							local bda = bd.attr;
							for x=1,#bda do
								attr[bda[x][1]] = (attr[bda[x][1]] or 0) + bda[x][2];
							end
						end
					end
				end
			end
		end
	end 
end
for i=1,#xq_data do
	local xd=xq_data[i];
	ckattr.add_siap_listener(xd.pos,fresh_siap_attr_xq);
	ckattr.add_siap_listener(xd.pos,calculate_xjlv)
end
--单个栅格进行镶嵌 双击上面的宝石
function process_xjxq(player,data)
	if data and #data == 3 then else return end;
	local slot_pos = tonumber(data[1]);
	local itempos = tonumber(data[2]);
	local itemtypeid = tonumber(data[3]);
	if slot_pos and itempos and itemtypeid then else return; end
	local xq_item = player:get_item(itempos,itemtypeid);
	if slot_pos >= 0 then return;end;
	local thisbd = bs_data_sort[itemtypeid];
	if not thisbd then player:alert(1,1,"该物品不可以镶嵌."); return;end;
	
	local thisdata = get_xqitemid(player,slot_pos);
	if not thisdata then return end;
	for i=1,#xq_data do
		local xd=xq_data[i];
		if xd.pos == slot_pos then
			local typenum = 0; local typeok= 0;
			for j=1,#thisdata do
				local thisid = thisdata[j];
				if thisid > 0 and bs_data_sort[thisid] then
					local bd = bs_data_sort[thisid];
					if bd and bd.xqtype == thisbd.xqtype then
						typeok = typeok + 1;break;
					end
				else
					if typenum <= 0  then typenum = j; end
				end
			end
			if typeok > 0 then
				player:alert(111,1,"已经镶嵌有同类型玄晶.");return;
			end
			if typenum == 0 then
				player:alert(111,1,"镶嵌位置已满,请先拆除玄晶.");return;
			end
			local a = player:get_item_data_by_pos(itempos);
			if a and a > 0 and itemtypeid==a then
				local ok = player:remove_item_by_type_pos(a,itempos);
				--local e = player:get_item_data_by_pos(itempos);
				if ok == 0 then
					local tarstr = "";
					for j=1,#thisdata do
						if typenum == j then
							thisdata[j] = itemtypeid;
						end
						local tid = thisdata[j];
						if tid > 0 then
							tarstr = tarstr..thisdata[j];
						else
							tarstr = tarstr.."00000";
						end
						if j >= 1 and j < 4 then
							tarstr = tarstr.."_";
						end
					end
					player:set_param(const.PP_XIANGQIAN_POS+i,tarstr);
					ckattr.fresh_siap_attr(player,xd.pos);
					ckattr.update_attr(player);
					player:alert(1,1,"镶嵌成功!");
				end
			else
				player:alert(111,1,"请放入合适的玄晶进行镶嵌.");return;
			end
		end
	end
end

--单个栅格进行拆除 双击下面的栅格
function process_xjzc(player,data)
	if data and #data == 3 then else return end;
	local slot_pos = tonumber(data[1]);
	local itemtypeid = tonumber(data[2]);
	if slot_pos >= 0 then return;end;
	local thisdata = get_xqitemid(player,slot_pos);
	if not thisdata then return end;
	for i=1,#xq_data do
		local xd=xq_data[i];
		if xd.pos == slot_pos then
			if player:num_xjbag_black() >= 1 then
				local tarstr = "";
				for j=1,#thisdata do
					local tid = thisdata[j];
					if tid == itemtypeid then
						player:add_item(tid,1);
						tarstr = tarstr.."00000";
					else
						if tid > 0 then
							tarstr = tarstr..thisdata[j];
						else
							tarstr = tarstr.."00000";
						end
					end
					if j >= 1 and j < 4 then
						tarstr = tarstr.."_";
					end	
				end
				player:set_param(const.PP_XIANGQIAN_POS+i,tarstr);
				ckattr.fresh_siap_attr(player,xd.pos);
				ckattr.update_attr(player);
				player:alert(1,1,"拆解成功!");
			else
				player:alert(1,1,"玄晶仓库已满!");
			end
		end
	end
end
function first_push_xqinfo(player)
	for j=1,#xj_data do
		if xj_data[j] and xj_data[j].typeid then
			player:push_item_info(xj_data[j].typeid);
		end
	end
end
login.add_login_listener(first_push_xqinfo);

function process_xjallzc(player,data)
	if data and #data == 3 then else return end;
	local slot_pos = tonumber(data[1]);
	local thisdata = get_xqitemid(player,slot_pos);
	if not thisdata then return end;
	if slot_pos >= 0 then return;end;
	for i=1,#xq_data do
		local xd=xq_data[i];
		if xd.pos == slot_pos then
			if player:num_xjbag_black() >= 4 then
				for j=1,#thisdata do
					local tid = thisdata[j];
					if tid > 0 then
						player:add_item(tid,1);
					end
				end
				player:set_param(const.PP_XIANGQIAN_POS+i,"00000_00000_00000_00000");
				ckattr.fresh_siap_attr(player,xd.pos);
				ckattr.update_attr(player);
				player:alert(1,1,"拆解成功!");
			else
				player:alert(1,1,"背包已满.");
			end
		end
	end
end
local hc_data={
	[10224]={name=  "一级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10225,target_name=  "二级攻击玄晶",prob=100,},
	[10225]={name=  "二级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10226,target_name=  "三级攻击玄晶",prob=100,},
	[10226]={name=  "三级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10227,target_name=  "四级攻击玄晶",prob=100,},
	[10227]={name=  "四级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10228,target_name=  "五级攻击玄晶",prob=90, },
	[10228]={name=  "五级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10229,target_name=  "六级攻击玄晶",prob=70, },
	[10229]={name=  "六级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10230,target_name=  "七级攻击玄晶",prob=50, },
	[10230]={name=  "七级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10231,target_name=  "八级攻击玄晶",prob=40, },
	[10231]={name=  "八级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10232,target_name=  "九级攻击玄晶",prob=30, },
	[10232]={name=  "九级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10233,target_name=  "十级攻击玄晶",prob=20, },
	[10233]={name=  "十级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10234,target_name="十一级攻击玄晶",prob=10, },
	[10234]={name="十一级攻击玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10235,target_name="十二级攻击玄晶",prob=5,  },
	[10236]={name=  "一级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10237,target_name=  "二级物防玄晶",prob=100,},
	[10237]={name=  "二级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10238,target_name=  "三级物防玄晶",prob=100,},
	[10238]={name=  "三级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10239,target_name=  "四级物防玄晶",prob=100,},
	[10239]={name=  "四级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10240,target_name=  "五级物防玄晶",prob=90, },
	[10240]={name=  "五级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10241,target_name=  "六级物防玄晶",prob=70, },
	[10241]={name=  "六级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10242,target_name=  "七级物防玄晶",prob=50, },
	[10242]={name=  "七级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10243,target_name=  "八级物防玄晶",prob=40, },
	[10243]={name=  "八级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10244,target_name=  "九级物防玄晶",prob=30, },
	[10244]={name=  "九级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10245,target_name=  "十级物防玄晶",prob=20, },
	[10245]={name=  "十级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10246,target_name="十一级物防玄晶",prob=10, },
	[10246]={name="十一级物防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10247,target_name="十二级物防玄晶",prob=5,  },
	[10248]={name=  "一级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10249,target_name=  "二级魔防玄晶",prob=100,},
	[10249]={name=  "二级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10250,target_name=  "三级魔防玄晶",prob=100,},
	[10250]={name=  "三级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10251,target_name=  "四级魔防玄晶",prob=100,},
	[10251]={name=  "四级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10252,target_name=  "五级魔防玄晶",prob=90, },
	[10252]={name=  "五级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10253,target_name=  "六级魔防玄晶",prob=70, },
	[10253]={name=  "六级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10254,target_name=  "七级魔防玄晶",prob=50, },
	[10254]={name=  "七级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10255,target_name=  "八级魔防玄晶",prob=40, },
	[10255]={name=  "八级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10256,target_name=  "九级魔防玄晶",prob=30, },
	[10256]={name=  "九级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10257,target_name=  "十级魔防玄晶",prob=20, },
	[10257]={name=  "十级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10258,target_name="十一级魔防玄晶",prob=10, },
	[10258]={name="十一级魔防玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10259,target_name="十二级魔防玄晶",prob=5,  },
	[10260]={name=  "一级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10261,target_name=  "二级生命玄晶",prob=100,},
	[10261]={name=  "二级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10262,target_name=  "三级生命玄晶",prob=100,},
	[10262]={name=  "三级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10263,target_name=  "四级生命玄晶",prob=100,},
	[10263]={name=  "四级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10264,target_name=  "五级生命玄晶",prob=90, },
	[10264]={name=  "五级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10265,target_name=  "六级生命玄晶",prob=70, },
	[10265]={name=  "六级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10266,target_name=  "七级生命玄晶",prob=50, },
	[10266]={name=  "七级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10267,target_name=  "八级生命玄晶",prob=40, },
	[10267]={name=  "八级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10268,target_name=  "九级生命玄晶",prob=30, },
	[10268]={name=  "九级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10269,target_name=  "十级生命玄晶",prob=20, },
	[10269]={name=  "十级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10270,target_name="十一级生命玄晶",prob=10, },
	[10270]={name="十一级生命玄晶",neednum=3,game_money=10000,game_money_bind=10000,target_id=10271,target_name="十二级生命玄晶",prob=5,  },
}
local hcfu_data={
	[10147]={name="幸运神符(5%)"  ,prob=5,  },
	[10148]={name="幸运神符(10%)" ,prob=10, },
	[10149]={name="幸运神符(15%)" ,prob=15, },
	[10150]={name="幸运神符(20%)" ,prob=20, },
	[10151]={name="幸运神符(25%)" ,prob=25, },
	[10152]={name="幸运神符(30%)" ,prob=30, },
	[10153]={name="幸运神符(35%)" ,prob=35, },
	[10154]={name="幸运神符(40%)" ,prob=40, },
	[10155]={name="幸运神符(50%)" ,prob=50, },
	[10156]={name="幸运神符(100%)",prob=100,},
}
--------------------------------------------------------------------------------合成
function process_xjhc(player,data)
	if data and #data == 6 then else return end;
	local xj_pos = tonumber(data[1]);
	local xj_id = tonumber(data[2]);
	local tar_num = tonumber(data[3]);
	local fu_pos = tonumber(data[4]);
	local fu_type = tonumber(data[5]);
	if player:num_xjbag_black() < 1 then player:alert(1,1,"玄晶仓库已满,无法继续合成!");return; end
	if xj_pos and xj_id and tar_num and tar_num>0 then else return; end
	local hc_item = player:get_item(xj_id,xj_pos);
	local tar_data = hc_data[xj_id];
	if hc_item and tar_data then
		local xj_num = hc_item:get_number();
		--local item_bind = hc_item:check_bind();
		local need_num = tar_data.neednum;
		local xj_prob=tar_data.prob;
		local fu_prob=0;
		local max_num = math.floor(xj_num/need_num);

		if max_num > 0 and  max_num >= tar_num and tar_num>0 and xj_num >= need_num*tar_num and need_num>0 then
			local retOk="";
			if fu_pos>=0 and fu_type then
				local fu_data=hcfu_data[fu_type];
				if fu_data then
					fu_prob=fu_data.prob;
					local fu_item = player:get_item(fu_type,fu_pos);
					if fu_item and fu_item:get_number()<tar_num  then
						tar_num=fu_item:get_number();
					end
					local result_fu = player:remove_item_by_type_pos(fu_type,fu_pos,tar_num);
					if result_fu == 0 then
						retOk="OK";
					end
				end
			else
				retOk="OK";
			end
			if retOk ~= "OK" then return ; end
			local result = player:remove_item_by_type_pos(xj_id,xj_pos,need_num*tar_num);
			if result == 0 then
				local succNum=0;

				local xjjprob = xj_prob;
				if activity.isXuanJingHeChengOpen() or newgui.jingcaihuodong.isOpenActivity(player,"xjhcsd") then
					xjjprob = xj_prob + 20;
					if xjjprob > 100 then xjjpron = 100; end
				end

				for i=1,tar_num do
					local ran = math.random(1,1000);
					if ran <= (xjjprob+fu_prob)*10 then
						succNum=succNum+1;
					end
				end
				if succNum > 0 then
					player:add_item(tar_data.target_name,succNum);
					player:alert(1,1,"合成成功,获得了"..succNum.."个"..tar_data.target_name);
					if xj_prob <= 30 then		
						server.info(110,1,player:get_name().."鸿运当头,成功合成"..tar_data.target_name);return;
					end
					if xj_prob <= 50 then		
						server.info(10,1,player:get_name().."鸿运当头,成功合成"..tar_data.target_name);return;
					end

				else
					player:alert(1,1,"合成失败!");
				end
			end
		else
			player:alert(1,1,"材料不足!");return; 
		end
	else
		player:alert(1,1,"该物品不可以合成!");
	end
end