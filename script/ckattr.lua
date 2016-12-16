module(..., package.seeall)
SAP_MAX_MP=1;
SAP_MAX_HP=2;
SAP_AC=3;
SAP_AC_MAX=4;
SAP_MAC=5;
SAP_MAC_MAX=6;
SAP_DC=7;
SAP_DC_MAX=8;
SAP_MC=9;
SAP_MC_MAX=10;
SAP_SC=11;
SAP_SC_MAX=12;
SAP_ACCURACY=13;
SAP_DODGE=14;
SAP_LUCK=15;
SAP_ANTIMAGIC=16;
SAP_ANTIPOISON=17;
SAP_HPRECOVER=18;
SAP_MPRECOVER=19;
SAP_POISONRECOVER=20;
SAP_MABI_PROB=21;
SAP_MABI_DURA=22;
SAP_DIXIAO_PRES=23;
SAP_FUYUAN_CD=24;
SAP_DROP_PROB=25;
SAP_DOUBLEATTPROB=26;
SAP_XISHOU_PROB=27;
SAP_XISHOU_PRES=28;
SAP_FANTAN_PROB=29;
SAP_FANTAN_PRES=30;
SAP_BAOJI_PROB=31;
SAP_BAOJI_PRES=32;
SAP_XIXUE_PROB=33;
SAP_XIXUE_PRES=34;
SAP_FUYUAN_PRES=35;
SAP_HP_PRES=36;
SAP_MP_PRES=37;
SAP_FIGHT=38;
SAPNUM=38;

local sap_data={};
function add_sap_listener(fun)
	sap_data[fun]=fun;
end
function fresh_sap_attr(player)
	local attr={};
	for i,v in pairs(sap_data) do
		v(player,attr);
	end
	for i=1,SAPNUM do
		if attr[i] then
			player:set_script_attr(i,attr[i]);
		else
			player:set_script_attr(i,0);
		end
	end
end
login.add_login_listener(fresh_sap_attr);
SIAP_MAXHP_MUL=1;
SIAP_MAXHP_ADD=2;
SIAP_MAXMP_MUL=3;
SIAP_MAXMP_ADD=4;
SIAP_AC_MUL=5;
SIAP_AC_ADD=6;
SIAP_ACMAX_MUL=7;
SIAP_ACMAX_ADD=8;
SIAP_MAC_MUL=9;
SIAP_MAC_ADD=10;
SIAP_MACMAX_MUL=11;
SIAP_MACMAX_ADD=12;
SIAP_DC_MUL=13;
SIAP_DC_ADD=14;
SIAP_DCMAX_MUL=15;
SIAP_DCMAX_ADD=16;
SIAP_MC_MUL=17;
SIAP_MC_ADD=18;
SIAP_MCMAX_MUL=19;
SIAP_MCMAX_ADD=20;
SIAP_SC_MUL=21;
SIAP_SC_ADD=22;
SIAP_SCMAX_MUL=23;
SIAP_SCMAX_ADD=24;
SIAP_FIGHT=25;
SIAPNUM=25;

ITEM_WEAPON_POSITION = (-2*2);
ITEM_CLOTH_POSITION = (-3*2);
ITEM_HAT_POSITION = (-4*2);
ITEM_RING1_POSITION = (-5*2);
ITEM_RING2_POSITION = (-5*2-1);
ITEM_GLOVE1_POSITION = (-6*2);
ITEM_GLOVE2_POSITION = (-6*2-1);
ITEM_NICKLACE_POSITION = (-7*2);
ITEM_HUIZHANG_POSITION = (-8*2);
ITEM_BELT_POSITION = (-9*2);
ITEM_BOOT_POSITION = (-10*2);
ITEM_HUNQI_POSITION = (-11*2);
ITEM_XUESHI_POSITION = (-12*2);
ITEM_ZUOJI_POSITION = (-13*2);
ITEM_FASHION_WEAPON_POSITION = (-14*2);
ITEM_FASHION_CLOTH_POSITION = (-15*2);
ITEM_WING_POSITION = (-16*2);
ITEM_TEJIE_POSITION = (-17*2);
ITEM_LINGPAI_POSITION = (-18*2);


local siap_data={};
function add_siap_listener(pos,fun)
	if not siap_data[pos] then
		siap_data[pos] = {};
	end
	local d = siap_data[pos];
	d[fun] = fun;
end
function fresh_siap_attr(player,pos)
	local d = siap_data[pos];
	if d then
		local attr={};for i=1,SIAPNUM do attr[i]=0;end;
		for i,v in pairs(d) do
			v(player,attr,pos);
		end
		player:set_script_item_attr(pos,unpack(attr));
	end
end


function update_attr(player)
	player:recal_attr();
end
function attr_all_in_one(player)
	fresh_siap_attr(player);
	fresh_siap_attr(player,ITEM_WEAPON_POSITION);
	fresh_siap_attr(player,ITEM_CLOTH_POSITION);
	fresh_siap_attr(player,ITEM_HAT_POSITION);
	fresh_siap_attr(player,ITEM_RING1_POSITION);
	fresh_siap_attr(player,ITEM_RING2_POSITION);
	fresh_siap_attr(player,ITEM_GLOVE1_POSITION);
	fresh_siap_attr(player,ITEM_GLOVE2_POSITION);
	fresh_siap_attr(player,ITEM_NICKLACE_POSITION);
	fresh_siap_attr(player,ITEM_HUIZHANG_POSITION);
	fresh_siap_attr(player,ITEM_BELT_POSITION);
	fresh_siap_attr(player,ITEM_BOOT_POSITION);
	fresh_siap_attr(player,ITEM_HUNQI_POSITION);
	fresh_siap_attr(player,ITEM_XUESHI_POSITION);
	fresh_siap_attr(player,ITEM_ZUOJI_POSITION);
	fresh_siap_attr(player,ITEM_FASHION_WEAPON_POSITION);
	fresh_siap_attr(player,ITEM_FASHION_CLOTH_POSITION);
	fresh_siap_attr(player,ITEM_WING_POSITION);
	fresh_siap_attr(player,ITEM_TEJIE_POSITION);
	fresh_siap_attr(player,ITEM_LINGPAI_POSITION);
	update_attr(player);
end
login.add_login_listener(attr_all_in_one);
