module(..., package.seeall)

local ACTIONSET_NAME="lianhun";
local PANEL_ACTIONSET_NAME="panellianhun";
local MAX_LIANHUN_LEVEL=25;
local MAX_LIANHUN_XING=12;


local lh_data={
	[1]={
		name="",desp="",
		info={
			[1]={ needlv=36, needhj=59 , active="物理防御       0-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,0}}},
			[2]={ needlv=36, needhj=59 , active="魔法防御       0-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,0}}},
			[3]={ needlv=36, needhj=59 , active="生命上限       0.05%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_HP_PRES,5}}},
			[4]={ needlv=36, needhj=59 , active="暴击几率       0.01%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PROB,1}}},
			[5]={ needlv=36, needhj=59 , active="暴击伤害       6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PRES,6}}},
			[6]={ needlv=36, needhj=59 , active="攻    击       3-6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,3},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,3},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,3}}},
			[7]={ needlv=37, needhj=83 , active="物理防御       1-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,1}}},
			[8]={ needlv=37, needhj=83 , active="魔法防御       1-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=37, needhj=83 , active="生命上限       0.05%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_HP_PRES,5}}},
			[10]={ needlv=37, needhj=83 , active="暴击几率       0.01%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PROB,1}}},
			[11]={ needlv=37, needhj=83 , active="暴击伤害       6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PRES,6}}},
			[12]={ needlv=37, needhj=83 , active="攻    击       4-6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,4},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,4},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,4}}},
		},
	},
	[2]={
		name="",desp="",
		info={
			[1]={ needlv=38, needhj=107 , active="物理防御       0-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,0}}},
			[2]={ needlv=38, needhj=107 , active="魔法防御       0-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,0}}},
			[3]={ needlv=38, needhj=107 , active="生命上限       0.05%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_HP_PRES,5}}},
			[4]={ needlv=38, needhj=107 , active="暴击几率       0.01%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PROB,1}}},
			[5]={ needlv=38, needhj=107 , active="暴击伤害       6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PRES,6}}},
			[6]={ needlv=38, needhj=107 , active="攻    击       3-6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,3},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,3},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,3}}},
			[7]={ needlv=39, needhj=131 , active="物理防御       1-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,1}}},
			[8]={ needlv=39, needhj=131 , active="魔法防御       1-1",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=39, needhj=131 , active="生命上限       0.05%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_HP_PRES,5}}},
			[10]={ needlv=39, needhj=131 , active="暴击几率       0.01%",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PROB,1}}},
			[11]={ needlv=39, needhj=131 , active="暴击伤害       6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_BAOJI_PRES,6}}},
			[12]={ needlv=39, needhj=131 , active="攻    击       4-6",    attr={{ckattr.SAP_FIGHT,6},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,4},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,4},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,4}}},
		},
	},
	[3]={
		name="",desp="",
		info={
			[1]={ needlv=40, needhj=155 , active="物理防御       1-2",    attr={{ckattr.SAP_FIGHT,7},{ckattr.SAP_AC_MAX,2},{ckattr.SAP_AC,1}}},
			[2]={ needlv=40, needhj=155 , active="魔法防御       1-2",    attr={{ckattr.SAP_FIGHT,7},{ckattr.SAP_MAC_MAX,2},{ckattr.SAP_MAC,1}}},
			[3]={ needlv=40, needhj=155 , active="生命上限       0.05%",    attr={{ckattr.SAP_FIGHT,7},{ckattr.SAP_HP_PRES,5}}},
			[4]={ needlv=40, needhj=155 , active="暴击几率       0.01%",    attr={{ckattr.SAP_FIGHT,7},{ckattr.SAP_BAOJI_PROB,1}}},
			[5]={ needlv=40, needhj=155 , active="暴击伤害       6",    attr={{ckattr.SAP_FIGHT,7},{ckattr.SAP_BAOJI_PRES,6}}},
			[6]={ needlv=40, needhj=155 , active="攻    击          4-6",    attr={{ckattr.SAP_FIGHT,7},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,4},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,4},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,4}}},
			[7]={ needlv=41, needhj=179 , active="物理防御        1-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,1}}},
			[8]={ needlv=41, needhj=179 , active="魔法防御        1-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=41, needhj=179 , active="生命上限        0.1%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_HP_PRES,10}}},
			[10]={ needlv=41, needhj=179 , active="暴击几率      0.02%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PROB,2}}},
			[11]={ needlv=41, needhj=179 , active="暴击伤害      12",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PRES,12}}},
			[12]={ needlv=41, needhj=179 , active="攻    击         3-6",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,3},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,3},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,3}}},
		},
	},
	[4]={
		name="",desp="",
		info={
			[1]={ needlv=42, needhj=203 , active="物理防御       0-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,0}}},
			[2]={ needlv=42, needhj=203 , active="魔法防御       0-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,0}}},
			[3]={ needlv=42, needhj=203 , active="生命上限      0.1%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_HP_PRES,10}}},
			[4]={ needlv=42, needhj=203 , active="暴击几率      0.02%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PROB,2}}},
			[5]={ needlv=42, needhj=203 , active="暴击伤害       12",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PRES,12}}},
			[6]={ needlv=42, needhj=203 , active="攻    击       4-6",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,4},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,4},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,4}}},
			[7]={ needlv=43, needhj=227 , active="物理防御       1-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,1}}},
			[8]={ needlv=43, needhj=227 , active="魔法防御       1-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=43, needhj=227 , active="生命上限       0.1%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_HP_PRES,10}}},
			[10]={ needlv=43, needhj=227 , active="暴击几率       0.02%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PROB,2}}},
			[11]={ needlv=43, needhj=227 , active="暴击伤害       12",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PRES,12}}},
			[12]={ needlv=43, needhj=227 , active="攻    击       3-6",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,3},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,3},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,3}}},
		},
	},
	[5]={
		name="",desp="",
		info={
			[1]={ needlv=44, needhj=251 , active="物理防御       1-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_AC_MAX,1},{ckattr.SAP_AC,1}}},
			[2]={ needlv=44, needhj=251 , active="魔法防御       1-1",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_MAC_MAX,1},{ckattr.SAP_MAC,1}}},
			[3]={ needlv=44, needhj=251 , active="生命上限       0.1%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_HP_PRES,10}}},
			[4]={ needlv=44, needhj=251 , active="暴击几率       0.02%",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PROB,2}}},
			[5]={ needlv=44, needhj=251 , active="暴击伤害       12",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_BAOJI_PRES,12}}},
			[6]={ needlv=44, needhj=251 , active="攻    击       4-6",    attr={{ckattr.SAP_FIGHT,8},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,4},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,4},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,4}}},
			[7]={ needlv=45, needhj=275 , active="物理防御       1-2",    attr={{ckattr.SAP_FIGHT,9},{ckattr.SAP_AC_MAX,2},{ckattr.SAP_AC,1}}},
			[8]={ needlv=45, needhj=275 , active="魔法防御       1-2",    attr={{ckattr.SAP_FIGHT,9},{ckattr.SAP_MAC_MAX,2},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=45, needhj=275 , active="生命上限       0.1%",    attr={{ckattr.SAP_FIGHT,9},{ckattr.SAP_HP_PRES,10}}},
			[10]={ needlv=45, needhj=275 , active="暴击几率       0.02%",    attr={{ckattr.SAP_FIGHT,9},{ckattr.SAP_BAOJI_PROB,2}}},
			[11]={ needlv=45, needhj=275 , active="暴击伤害       12",    attr={{ckattr.SAP_FIGHT,9},{ckattr.SAP_BAOJI_PRES,12}}},
			[12]={ needlv=45, needhj=275 , active="攻    击       4-6",    attr={{ckattr.SAP_FIGHT,9},{ckattr.SAP_DC_MAX,6},{ckattr.SAP_DC,4},{ckattr.SAP_MC_MAX,6},{ckattr.SAP_MC,4},{ckattr.SAP_SC_MAX,6},{ckattr.SAP_SC,4}}},
		},
	},
	[6]={
		name="",desp="",
		info={
			[1]={ needlv=46, needhj=479 , active="物理防御       1-2",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_AC_MAX,2},{ckattr.SAP_AC,1}}},
			[2]={ needlv=46, needhj=479 , active="魔法防御       1-2",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_MAC_MAX,2},{ckattr.SAP_MAC,1}}},
			[3]={ needlv=46, needhj=479 , active="生命上限       0.15%",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_HP_PRES,15}}},
			[4]={ needlv=46, needhj=479 , active="暴击几率       0.03%",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_BAOJI_PROB,3}}},
			[5]={ needlv=46, needhj=479 , active="暴击伤害       18",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_BAOJI_PRES,18}}},
			[6]={ needlv=46, needhj=479 , active="攻    击       7-12",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_DC_MAX,12},{ckattr.SAP_DC,7},{ckattr.SAP_MC_MAX,12},{ckattr.SAP_MC,7},{ckattr.SAP_SC_MAX,12},{ckattr.SAP_SC,7}}},
			[7]={ needlv=47, needhj=527 , active="物理防御       1-2",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_AC_MAX,2},{ckattr.SAP_AC,1}}},
			[8]={ needlv=47, needhj=527 , active="魔法防御       1-2",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_MAC_MAX,2},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=47, needhj=527 , active="生命上限       0.15%",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_HP_PRES,15}}},
			[10]={ needlv=47, needhj=527 , active="暴击几率       0.03%",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_BAOJI_PROB,3}}},
			[11]={ needlv=47, needhj=527 , active="暴击伤害       18",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_BAOJI_PRES,18}}},
			[12]={ needlv=47, needhj=527 , active="攻    击       7-12",    attr={{ckattr.SAP_FIGHT,14},{ckattr.SAP_DC_MAX,12},{ckattr.SAP_DC,7},{ckattr.SAP_MC_MAX,12},{ckattr.SAP_MC,7},{ckattr.SAP_SC_MAX,12},{ckattr.SAP_SC,7}}},
		},
	},
	[7]={
		name="",desp="",
		info={
			[1]={ needlv=48, needhj=576 , active="物理防御       2-3",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_AC_MAX,3},{ckattr.SAP_AC,2}}},
			[2]={ needlv=48, needhj=576 , active="魔法防御       2-3",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_MAC_MAX,3},{ckattr.SAP_MAC,2}}},
			[3]={ needlv=48, needhj=576 , active="生命上限       0.15%",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_HP_PRES,15}}},
			[4]={ needlv=48, needhj=576 , active="暴击几率       0.03%",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_BAOJI_PROB,3}}},
			[5]={ needlv=48, needhj=576 , active="暴击伤害       18",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_BAOJI_PRES,18}}},
			[6]={ needlv=48, needhj=576 , active="攻    击       7-12",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_DC_MAX,12},{ckattr.SAP_DC,7},{ckattr.SAP_MC_MAX,12},{ckattr.SAP_MC,7},{ckattr.SAP_SC_MAX,12},{ckattr.SAP_SC,7}}},
			[7]={ needlv=49, needhj=624 , active="物理防御       1-2",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_AC_MAX,2},{ckattr.SAP_AC,1}}},
			[8]={ needlv=49, needhj=624 , active="魔法防御       1-2",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_MAC_MAX,2},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=49, needhj=624 , active="生命上限       0.15%",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_HP_PRES,15}}},
			[10]={ needlv=49, needhj=624 , active="暴击几率       0.03%",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_BAOJI_PROB,3}}},
			[11]={ needlv=49, needhj=624 , active="暴击伤害       18",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_BAOJI_PRES,18}}},
			[12]={ needlv=49, needhj=624 , active="攻    击       7-12",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_DC_MAX,12},{ckattr.SAP_DC,7},{ckattr.SAP_MC_MAX,12},{ckattr.SAP_MC,7},{ckattr.SAP_SC_MAX,12},{ckattr.SAP_SC,7}}},
		},
	},
	[8]={
		name="",desp="",
		info={
			[1]={ needlv=50, needhj=672 , active="物理防御       2-3",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_AC_MAX,3},{ckattr.SAP_AC,2}}},
			[2]={ needlv=50, needhj=672 , active="魔法防御       2-3",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_MAC_MAX,3},{ckattr.SAP_MAC,2}}},
			[3]={ needlv=50, needhj=672 , active="生命上限       0.15%",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_HP_PRES,15}}},
			[4]={ needlv=50, needhj=672 , active="暴击几率       0.03%",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_BAOJI_PROB,3}}},
			[5]={ needlv=50, needhj=672 , active="暴击伤害       18",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_BAOJI_PRES,18}}},
			[6]={ needlv=50, needhj=672 , active="攻    击       8-12",    attr={{ckattr.SAP_FIGHT,15},{ckattr.SAP_DC_MAX,12},{ckattr.SAP_DC,8},{ckattr.SAP_MC_MAX,12},{ckattr.SAP_MC,8},{ckattr.SAP_SC_MAX,12},{ckattr.SAP_SC,8}}},
			[7]={ needlv=51, needhj=880 , active="物理防御       2-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_AC_MAX,3},{ckattr.SAP_AC,2}}},
			[8]={ needlv=51, needhj=880 , active="魔法防御       2-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_MAC_MAX,3},{ckattr.SAP_MAC,2}}},
			[9]={ needlv=51, needhj=880 , active="生命上限       0.2%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_HP_PRES,20}}},
			[10]={ needlv=51, needhj=880 , active="暴击几率       0.04%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PROB,4}}},
			[11]={ needlv=51, needhj=880 , active="暴击伤害       24",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PRES,24}}},
			[12]={ needlv=51, needhj=880 , active="攻    击       9-16",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_DC_MAX,16},{ckattr.SAP_DC,9},{ckattr.SAP_MC_MAX,16},{ckattr.SAP_MC,9},{ckattr.SAP_SC_MAX,16},{ckattr.SAP_SC,9}}},
		},
	},
	[9]={
		name="",desp="",
		info={
			[1]={ needlv=52, needhj=944 , active="物理防御       2-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_AC_MAX,3},{ckattr.SAP_AC,2}}},
			[2]={ needlv=52, needhj=944 , active="魔法防御       2-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_MAC_MAX,3},{ckattr.SAP_MAC,2}}},
			[3]={ needlv=52, needhj=944 , active="生命上限       0.2%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_HP_PRES,20}}},
			[4]={ needlv=52, needhj=944 , active="暴击几率       0.04%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PROB,4}}},
			[5]={ needlv=52, needhj=944 , active="暴击伤害       24",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PRES,24}}},
			[6]={ needlv=52, needhj=944 , active="攻    击       10-16",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_DC_MAX,16},{ckattr.SAP_DC,10},{ckattr.SAP_MC_MAX,16},{ckattr.SAP_MC,10},{ckattr.SAP_SC_MAX,16},{ckattr.SAP_SC,10}}},
			[7]={ needlv=53, needhj=1008 , active="物理防御       1-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_AC_MAX,3},{ckattr.SAP_AC,1}}},
			[8]={ needlv=53, needhj=1008 , active="魔法防御       1-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_MAC_MAX,3},{ckattr.SAP_MAC,1}}},
			[9]={ needlv=53, needhj=1008 , active="生命上限       0.2%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_HP_PRES,20}}},
			[10]={ needlv=53, needhj=1008 , active="暴击几率       0.04%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PROB,4}}},
			[11]={ needlv=53, needhj=1008 , active="暴击伤害       24",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PRES,24}}},
			[12]={ needlv=53, needhj=1008 , active="攻    击       9-16",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_DC_MAX,16},{ckattr.SAP_DC,9},{ckattr.SAP_MC_MAX,16},{ckattr.SAP_MC,9},{ckattr.SAP_SC_MAX,16},{ckattr.SAP_SC,9}}},
		},
	},
	[10]={
		name="",desp="",
		info={
			[1]={ needlv=54, needhj=1073 , active="物理防御       2-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_AC_MAX,3},{ckattr.SAP_AC,2}}},
			[2]={ needlv=54, needhj=1073 , active="魔法防御       2-3",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_MAC_MAX,3},{ckattr.SAP_MAC,2}}},
			[3]={ needlv=54, needhj=1073 , active="生命上限       0.2%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_HP_PRES,20}}},
			[4]={ needlv=54, needhj=1073 , active="暴击几率       0.04%",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PROB,4}}},
			[5]={ needlv=54, needhj=1073 , active="暴击伤害       24",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_BAOJI_PRES,24}}},
			[6]={ needlv=54, needhj=1073 , active="攻    击       10-16",    attr={{ckattr.SAP_FIGHT,19},{ckattr.SAP_DC_MAX,16},{ckattr.SAP_DC,10},{ckattr.SAP_MC_MAX,16},{ckattr.SAP_MC,10},{ckattr.SAP_SC_MAX,16},{ckattr.SAP_SC,10}}},
			[7]={ needlv=55, needhj=1137 , active="物理防御       3-4",    attr={{ckattr.SAP_FIGHT,20},{ckattr.SAP_AC_MAX,4},{ckattr.SAP_AC,3}}},
			[8]={ needlv=55, needhj=1137 , active="魔法防御       3-4",    attr={{ckattr.SAP_FIGHT,20},{ckattr.SAP_MAC_MAX,4},{ckattr.SAP_MAC,3}}},
			[9]={ needlv=55, needhj=1137 , active="生命上限       0.2%",    attr={{ckattr.SAP_FIGHT,20},{ckattr.SAP_HP_PRES,20}}},
			[10]={ needlv=55, needhj=1137 , active="暴击几率       0.04%",    attr={{ckattr.SAP_FIGHT,20},{ckattr.SAP_BAOJI_PROB,4}}},
			[11]={ needlv=55, needhj=1137 , active="暴击伤害       24",    attr={{ckattr.SAP_FIGHT,20},{ckattr.SAP_BAOJI_PRES,24}}},
			[12]={ needlv=55, needhj=1137 , active="攻    击       10-16",    attr={{ckattr.SAP_FIGHT,20},{ckattr.SAP_DC_MAX,16},{ckattr.SAP_DC,10},{ckattr.SAP_MC_MAX,16},{ckattr.SAP_MC,10},{ckattr.SAP_SC_MAX,16},{ckattr.SAP_SC,10}}},
		},
	},
	[11]={
		name="",desp="",
		info={
			[1]={ needlv=56, needhj=2402 , active="物理防御       4-8",    attr={{ckattr.SAP_FIGHT,41},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,4}}},
			[2]={ needlv=56, needhj=2402 , active="魔法防御       4-8",    attr={{ckattr.SAP_FIGHT,41},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,4}}},
			[3]={ needlv=56, needhj=2402 , active="生命上限       0.3%",    attr={{ckattr.SAP_FIGHT,41},{ckattr.SAP_HP_PRES,30}}},
			[4]={ needlv=56, needhj=2402 , active="暴击几率       0.06%",    attr={{ckattr.SAP_FIGHT,41},{ckattr.SAP_BAOJI_PROB,6}}},
			[5]={ needlv=56, needhj=2402 , active="暴击伤害       36",    attr={{ckattr.SAP_FIGHT,41},{ckattr.SAP_BAOJI_PRES,36}}},
			[6]={ needlv=56, needhj=2402 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,41},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
			[7]={ needlv=57, needhj=2562 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[8]={ needlv=57, needhj=2562 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[9]={ needlv=57, needhj=2562 , active="生命上限       0.3%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_HP_PRES,30}}},
			[10]={ needlv=57, needhj=2562 , active="暴击几率       0.06%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PROB,6}}},
			[11]={ needlv=57, needhj=2562 , active="暴击伤害       36",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PRES,36}}},
			[12]={ needlv=57, needhj=2562 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
		},
	},
	[12]={
		name="",desp="",
		info={
			[1]={ needlv=58, needhj=2723 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[2]={ needlv=58, needhj=2723 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[3]={ needlv=58, needhj=2723 , active="生命上限       0.3%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_HP_PRES,30}}},
			[4]={ needlv=58, needhj=2723 , active="暴击几率       0.06%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PROB,6}}},
			[5]={ needlv=58, needhj=2723 , active="暴击伤害       36",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PRES,36}}},
			[6]={ needlv=58, needhj=2723 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
			[7]={ needlv=59, needhj=2883 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[8]={ needlv=59, needhj=2883 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[9]={ needlv=59, needhj=2883 , active="生命上限       0.3%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_HP_PRES,30}}},
			[10]={ needlv=59, needhj=2883 , active="暴击几率       0.06%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PROB,6}}},
			[11]={ needlv=59, needhj=2883 , active="暴击伤害       36",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PRES,36}}},
			[12]={ needlv=59, needhj=2883 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
		},
	},
	[13]={
		name="",desp="",
		info={
			[1]={ needlv=60, needhj=3044 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[2]={ needlv=60, needhj=3044 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[3]={ needlv=60, needhj=3044 , active="生命上限       0.3%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_HP_PRES,30}}},
			[4]={ needlv=60, needhj=3044 , active="暴击几率       0.06%",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PROB,6}}},
			[5]={ needlv=60, needhj=3044 , active="暴击伤害       36",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_BAOJI_PRES,36}}},
			[6]={ needlv=60, needhj=3044 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,42},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
			[7]={ needlv=61, needhj=3205 , active="物理防御       4-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,4}}},
			[8]={ needlv=61, needhj=3205 , active="魔法防御       4-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,4}}},
			[9]={ needlv=61, needhj=3205 , active="生命上限       0.4%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_HP_PRES,40}}},
			[10]={ needlv=61, needhj=3205 , active="暴击几率       0.08%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PROB,8}}},
			[11]={ needlv=61, needhj=3205 , active="暴击伤害       48",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PRES,48}}},
			[12]={ needlv=61, needhj=3205 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
		},
	},
	[14]={
		name="",desp="",
		info={
			[1]={ needlv=62, needhj=3365 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[2]={ needlv=62, needhj=3365 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[3]={ needlv=62, needhj=3365 , active="生命上限       0.4%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_HP_PRES,40}}},
			[4]={ needlv=62, needhj=3365 , active="暴击几率       0.08%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PROB,8}}},
			[5]={ needlv=62, needhj=3365 , active="暴击伤害       48",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PRES,48}}},
			[6]={ needlv=62, needhj=3365 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
			[7]={ needlv=63, needhj=3526 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[8]={ needlv=63, needhj=3526 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[9]={ needlv=63, needhj=3526 , active="生命上限       0.4%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_HP_PRES,40}}},
			[10]={ needlv=63, needhj=3526 , active="暴击几率       0.08%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PROB,8}}},
			[11]={ needlv=63, needhj=3526 , active="暴击伤害       48",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PRES,48}}},
			[12]={ needlv=63, needhj=3526 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
		},
	},
	[15]={
		name="",desp="",
		info={
			[1]={ needlv=64, needhj=3687 , active="物理防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[2]={ needlv=64, needhj=3687 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[3]={ needlv=64, needhj=3687 , active="生命上限       0.4%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_HP_PRES,40}}},
			[4]={ needlv=64, needhj=3687 , active="暴击几率       0.08%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PROB,8}}},
			[5]={ needlv=64, needhj=3687 , active="暴击伤害       48",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PRES,48}}},
			[6]={ needlv=64, needhj=3687 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
			[7]={ needlv=65, needhj=3847 , active="物理防御      5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_AC_MAX,8},{ckattr.SAP_AC,5}}},
			[8]={ needlv=65, needhj=3847 , active="魔法防御       5-8",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_MAC_MAX,8},{ckattr.SAP_MAC,5}}},
			[9]={ needlv=65, needhj=3847 , active="生命上限       0.4%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_HP_PRES,40}}},
			[10]={ needlv=65, needhj=3847 , active="暴击几率       0.08%",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PROB,8}}},
			[11]={ needlv=65, needhj=3847 , active="暴击伤害       48",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_BAOJI_PRES,48}}},
			[12]={ needlv=65, needhj=3847 , active="攻    击       24-40",    attr={{ckattr.SAP_FIGHT,45},{ckattr.SAP_DC_MAX,40},{ckattr.SAP_DC,24},{ckattr.SAP_MC_MAX,40},{ckattr.SAP_MC,24},{ckattr.SAP_SC_MAX,40},{ckattr.SAP_SC,24}}},
		},
	},
	[16]={
		name="",desp="",
		info={
			[1]={ needlv=66, needhj=6812 , active="物理防御       9-16",    attr={{ckattr.SAP_FIGHT,83},{ckattr.SAP_AC_MAX,16},{ckattr.SAP_AC,9}}},
			[2]={ needlv=66, needhj=6812 , active="魔法防御       9-16",    attr={{ckattr.SAP_FIGHT,83},{ckattr.SAP_MAC_MAX,16},{ckattr.SAP_MAC,9}}},
			[3]={ needlv=66, needhj=6812 , active="生命上限       0.6%",    attr={{ckattr.SAP_FIGHT,83},{ckattr.SAP_HP_PRES,60}}},
			[4]={ needlv=66, needhj=6812 , active="暴击几率       0.12%",    attr={{ckattr.SAP_FIGHT,83},{ckattr.SAP_BAOJI_PROB,12}}},
			[5]={ needlv=66, needhj=6812 , active="暴击伤害       72",    attr={{ckattr.SAP_FIGHT,83},{ckattr.SAP_BAOJI_PRES,72}}},
			[6]={ needlv=66, needhj=6812 , active="攻    击       48-80",    attr={{ckattr.SAP_FIGHT,83},{ckattr.SAP_DC_MAX,80},{ckattr.SAP_DC,48},{ckattr.SAP_MC_MAX,80},{ckattr.SAP_MC,48},{ckattr.SAP_SC_MAX,80},{ckattr.SAP_SC,48}}},
			[7]={ needlv=67, needhj=7133 , active="物理防御       10-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_AC_MAX,16},{ckattr.SAP_AC,10}}},
			[8]={ needlv=67, needhj=7133 , active="魔法防御       10-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_MAC_MAX,16},{ckattr.SAP_MAC,10}}},
			[9]={ needlv=67, needhj=7133 , active="生命上限       0.6%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_HP_PRES,60}}},
			[10]={ needlv=67, needhj=7133 , active="暴击几率       0.12%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PROB,12}}},
			[11]={ needlv=67, needhj=7133 , active="暴击伤害       72",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PRES,72}}},
			[12]={ needlv=67, needhj=7133 , active="攻    击       48-80",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_DC_MAX,80},{ckattr.SAP_DC,48},{ckattr.SAP_MC_MAX,80},{ckattr.SAP_MC,48},{ckattr.SAP_SC_MAX,80},{ckattr.SAP_SC,48}}},
		},
	},
	[17]={
		name="",desp="",
		info={
			[1]={ needlv=68, needhj=7454 , active="物理防御       9-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_AC_MAX,16},{ckattr.SAP_AC,9}}},
			[2]={ needlv=68, needhj=7454 , active="魔法防御       9-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_MAC_MAX,16},{ckattr.SAP_MAC,9}}},
			[3]={ needlv=68, needhj=7454 , active="生命上限       0.6%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_HP_PRES,60}}},
			[4]={ needlv=68, needhj=7454 , active="暴击几率       0.12%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PROB,12}}},
			[5]={ needlv=68, needhj=7454 , active="暴击伤害       72",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PRES,72}}},
			[6]={ needlv=68, needhj=7454 , active="攻    击       48-80",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_DC_MAX,80},{ckattr.SAP_DC,48},{ckattr.SAP_MC_MAX,80},{ckattr.SAP_MC,48},{ckattr.SAP_SC_MAX,80},{ckattr.SAP_SC,48}}},
			[7]={ needlv=69, needhj=7776 , active="物理防御       10-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_AC_MAX,16},{ckattr.SAP_AC,10}}},
			[8]={ needlv=69, needhj=7776 , active="魔法防御       10-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_MAC_MAX,16},{ckattr.SAP_MAC,10}}},
			[9]={ needlv=69, needhj=7776 , active="生命上限       0.6%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_HP_PRES,60}}},
			[10]={ needlv=69, needhj=7776 , active="暴击几率       0.12%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PROB,12}}},
			[11]={ needlv=69, needhj=7776 , active="暴击伤害       72",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PRES,72}}},
			[12]={ needlv=69, needhj=7776 , active="攻    击       48-80",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_DC_MAX,80},{ckattr.SAP_DC,48},{ckattr.SAP_MC_MAX,80},{ckattr.SAP_MC,48},{ckattr.SAP_SC_MAX,80},{ckattr.SAP_SC,48}}},
		},
	},
	[18]={
		name="",desp="",
		info={
			[1]={ needlv=70, needhj=8097 , active="物理防御       10-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_AC_MAX,16},{ckattr.SAP_AC,10}}},
			[2]={ needlv=70, needhj=8097 , active="魔法防御       10-16",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_MAC_MAX,16},{ckattr.SAP_MAC,10}}},
			[3]={ needlv=70, needhj=8097 , active="生命上限       0.6%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_HP_PRES,60}}},
			[4]={ needlv=70, needhj=8097 , active="暴击几率       0.12%",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PROB,12}}},
			[5]={ needlv=70, needhj=8097 , active="暴击伤害       72",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_BAOJI_PRES,72}}},
			[6]={ needlv=70, needhj=8097 , active="攻    击       48-80",    attr={{ckattr.SAP_FIGHT,84},{ckattr.SAP_DC_MAX,80},{ckattr.SAP_DC,48},{ckattr.SAP_MC_MAX,80},{ckattr.SAP_MC,48},{ckattr.SAP_SC_MAX,80},{ckattr.SAP_SC,48}}},
			[7]={ needlv=71, needhj=10021 , active="物理防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_AC_MAX,20},{ckattr.SAP_AC,12}}},
			[8]={ needlv=71, needhj=10021 , active="魔法防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_MAC_MAX,20},{ckattr.SAP_MAC,12}}},
			[9]={ needlv=71, needhj=10021 , active="生命上限       0.8%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_HP_PRES,80}}},
			[10]={ needlv=71, needhj=10021 , active="暴击几率       0.16%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PROB,16}}},
			[11]={ needlv=71, needhj=10021 , active="暴击伤害       96",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PRES,96}}},
			[12]={ needlv=71, needhj=10021 , active="攻    击       60-100",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_DC_MAX,100},{ckattr.SAP_DC,60},{ckattr.SAP_MC_MAX,100},{ckattr.SAP_MC,60},{ckattr.SAP_SC_MAX,100},{ckattr.SAP_SC,60}}},
		},
	},
	[19]={
		name="",desp="",
		info={
			[1]={ needlv=72, needhj=10423 , active="物理防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_AC_MAX,20},{ckattr.SAP_AC,12}}},
			[2]={ needlv=72, needhj=10423 , active="魔法防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_MAC_MAX,20},{ckattr.SAP_MAC,12}}},
			[3]={ needlv=72, needhj=10423 , active="生命上限       0.8%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_HP_PRES,80}}},
			[4]={ needlv=72, needhj=10423 , active="暴击几率       0.16%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PROB,16}}},
			[5]={ needlv=72, needhj=10423 , active="暴击伤害       96",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PRES,96}}},
			[6]={ needlv=72, needhj=10423 , active="攻    击       60-100",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_DC_MAX,100},{ckattr.SAP_DC,60},{ckattr.SAP_MC_MAX,100},{ckattr.SAP_MC,60},{ckattr.SAP_SC_MAX,100},{ckattr.SAP_SC,60}}},
			[7]={ needlv=73, needhj=10824 , active="物理防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_AC_MAX,20},{ckattr.SAP_AC,12}}},
			[8]={ needlv=73, needhj=10824 , active="魔法防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_MAC_MAX,20},{ckattr.SAP_MAC,12}}},
			[9]={ needlv=73, needhj=10824 , active="生命上限       0.8%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_HP_PRES,80}}},
			[10]={ needlv=73, needhj=10824 , active="暴击几率       0.16%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PROB,16}}},
			[11]={ needlv=73, needhj=10824 , active="暴击伤害       96",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PRES,96}}},
			[12]={ needlv=73, needhj=10824 , active="攻    击       60-100",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_DC_MAX,100},{ckattr.SAP_DC,60},{ckattr.SAP_MC_MAX,100},{ckattr.SAP_MC,60},{ckattr.SAP_SC_MAX,100},{ckattr.SAP_SC,60}}},
		},
	},
	[20]={
		name="",desp="",
		info={
			[1]={ needlv=74, needhj=11226 , active="物理防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_AC_MAX,20},{ckattr.SAP_AC,12}}},
			[2]={ needlv=74, needhj=11226 , active="魔法防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_MAC_MAX,20},{ckattr.SAP_MAC,12}}},
			[3]={ needlv=74, needhj=11226 , active="生命上限       0.8%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_HP_PRES,80}}},
			[4]={ needlv=74, needhj=11226 , active="暴击几率       0.16%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PROB,16}}},
			[5]={ needlv=74, needhj=11226 , active="暴击伤害       96",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PRES,96}}},
			[6]={ needlv=74, needhj=11226 , active="攻    击       60-100",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_DC_MAX,100},{ckattr.SAP_DC,60},{ckattr.SAP_MC_MAX,100},{ckattr.SAP_MC,60},{ckattr.SAP_SC_MAX,100},{ckattr.SAP_SC,60}}},
			[7]={ needlv=75, needhj=11628 , active="物理防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_AC_MAX,20},{ckattr.SAP_AC,12}}},
			[8]={ needlv=75, needhj=11628 , active="魔法防御       12-20",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_MAC_MAX,20},{ckattr.SAP_MAC,12}}},
			[9]={ needlv=75, needhj=11628 , active="生命上限       0.8%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_HP_PRES,80}}},
			[10]={ needlv=75, needhj=11628 , active="暴击几率       0.16%",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PROB,16}}},
			[11]={ needlv=75, needhj=11628 , active="暴击伤害       96",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_BAOJI_PRES,96}}},
			[12]={ needlv=75, needhj=11628 , active="攻    击       60-100",    attr={{ckattr.SAP_FIGHT,106},{ckattr.SAP_DC_MAX,100},{ckattr.SAP_DC,60},{ckattr.SAP_MC_MAX,100},{ckattr.SAP_MC,60},{ckattr.SAP_SC_MAX,100},{ckattr.SAP_SC,60}}},
		},
	},
	[21]={
		name="",desp="",
		info={
			[1]={ needlv=76, needhj=13833 , active="物理防御       14-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_AC_MAX,24},{ckattr.SAP_AC,14}}},
			[2]={ needlv=76, needhj=13833 , active="魔法防御       14-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_MAC_MAX,24},{ckattr.SAP_MAC,14}}},
			[3]={ needlv=76, needhj=13833 , active="生命上限       1%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_HP_PRES,100}}},
			[4]={ needlv=76, needhj=13833 , active="暴击几率       0.2%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PROB,20}}},
			[5]={ needlv=76, needhj=13833 , active="暴击伤害       120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PRES,120}}},
			[6]={ needlv=76, needhj=13833 , active="攻    击       72-120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_DC_MAX,120},{ckattr.SAP_DC,72},{ckattr.SAP_MC_MAX,120},{ckattr.SAP_MC,72},{ckattr.SAP_SC_MAX,120},{ckattr.SAP_SC,72}}},
			[7]={ needlv=77, needhj=14315 , active="物理防御       14-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_AC_MAX,24},{ckattr.SAP_AC,14}}},
			[8]={ needlv=77, needhj=14315 , active="魔法防御       14-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_MAC_MAX,24},{ckattr.SAP_MAC,14}}},
			[9]={ needlv=77, needhj=14315 , active="生命上限       1%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_HP_PRES,100}}},
			[10]={ needlv=77, needhj=14315 , active="暴击几率       0.2%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PROB,20}}},
			[11]={ needlv=77, needhj=14315 , active="暴击伤害       120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PRES,120}}},
			[12]={ needlv=77, needhj=14315 , active="攻    击       72-120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_DC_MAX,120},{ckattr.SAP_DC,72},{ckattr.SAP_MC_MAX,120},{ckattr.SAP_MC,72},{ckattr.SAP_SC_MAX,120},{ckattr.SAP_SC,72}}},
		},
	},
	[22]={
		name="",desp="",
		info={
			[1]={ needlv=78, needhj=14797 , active="物理防御       15-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_AC_MAX,24},{ckattr.SAP_AC,15}}},
			[2]={ needlv=78, needhj=14797 , active="魔法防御       15-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_MAC_MAX,24},{ckattr.SAP_MAC,15}}},
			[3]={ needlv=78, needhj=14797 , active="生命上限       1%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_HP_PRES,100}}},
			[4]={ needlv=78, needhj=14797 , active="暴击几率       0.2%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PROB,20}}},
			[5]={ needlv=78, needhj=14797 , active="暴击伤害       120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PRES,120}}},
			[6]={ needlv=78, needhj=14797 , active="攻    击       72-120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_DC_MAX,120},{ckattr.SAP_DC,72},{ckattr.SAP_MC_MAX,120},{ckattr.SAP_MC,72},{ckattr.SAP_SC_MAX,120},{ckattr.SAP_SC,72}}},
			[7]={ needlv=79, needhj=15279 , active="物理防御       14-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_AC_MAX,24},{ckattr.SAP_AC,14}}},
			[8]={ needlv=79, needhj=15279 , active="魔法防御       14-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_MAC_MAX,24},{ckattr.SAP_MAC,14}}},
			[9]={ needlv=79, needhj=15279 , active="生命上限       1%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_HP_PRES,100}}},
			[10]={ needlv=79, needhj=15279 , active="暴击几率       0.2%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PROB,20}}},
			[11]={ needlv=79, needhj=15279 , active="暴击伤害       120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PRES,120}}},
			[12]={ needlv=79, needhj=15279 , active="攻    击       72-120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_DC_MAX,120},{ckattr.SAP_DC,72},{ckattr.SAP_MC_MAX,120},{ckattr.SAP_MC,72},{ckattr.SAP_SC_MAX,120},{ckattr.SAP_SC,72}}},
		},
	},
	[23]={
		name="",desp="",
		info={
			[1]={ needlv=80, needhj=15761 , active="物理防御       15-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_AC_MAX,24},{ckattr.SAP_AC,15}}},
			[2]={ needlv=80, needhj=15761 , active="魔法防御       15-24",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_MAC_MAX,24},{ckattr.SAP_MAC,15}}},
			[3]={ needlv=80, needhj=15761 , active="生命上限       1%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_HP_PRES,100}}},
			[4]={ needlv=80, needhj=15761 , active="暴击几率       0.2%",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PROB,20}}},
			[5]={ needlv=80, needhj=15761 , active="暴击伤害       120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_BAOJI_PRES,120}}},
			[6]={ needlv=80, needhj=15761 , active="攻    击       72-120",    attr={{ckattr.SAP_FIGHT,129},{ckattr.SAP_DC_MAX,120},{ckattr.SAP_DC,72},{ckattr.SAP_MC_MAX,120},{ckattr.SAP_MC,72},{ckattr.SAP_SC_MAX,120},{ckattr.SAP_SC,72}}},
			[7]={ needlv=81, needhj=22255 , active="物理防御       21-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_AC_MAX,36},{ckattr.SAP_AC,21}}},
			[8]={ needlv=81, needhj=22255 , active="魔法防御       21-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_MAC_MAX,36},{ckattr.SAP_MAC,21}}},
			[9]={ needlv=81, needhj=22255 , active="生命上限       1.4%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_HP_PRES,140}}},
			[10]={ needlv=81, needhj=22255 , active="暴击几率       0.28%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PROB,28}}},
			[11]={ needlv=81, needhj=22255 , active="暴击伤害       168",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PRES,168}}},
			[12]={ needlv=81, needhj=22255 , active="攻    击       108-180",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_DC_MAX,180},{ckattr.SAP_DC,108},{ckattr.SAP_MC_MAX,180},{ckattr.SAP_MC,108},{ckattr.SAP_SC_MAX,180},{ckattr.SAP_SC,108}}},
		},
	},
	[24]={
		name="",desp="",
		info={
			[1]={ needlv=82, needhj=22978 , active="物理防御       22-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_AC_MAX,36},{ckattr.SAP_AC,22}}},
			[2]={ needlv=82, needhj=22978 , active="魔法防御       22-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_MAC_MAX,36},{ckattr.SAP_MAC,22}}},
			[3]={ needlv=82, needhj=22978 , active="生命上限       1.4%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_HP_PRES,140}}},
			[4]={ needlv=82, needhj=22978 , active="暴击几率       0.28%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PROB,28}}},
			[5]={ needlv=82, needhj=22978 , active="暴击伤害       168",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PRES,168}}},
			[6]={ needlv=82, needhj=22978 , active="攻    击       108-180",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_DC_MAX,180},{ckattr.SAP_DC,108},{ckattr.SAP_MC_MAX,180},{ckattr.SAP_MC,108},{ckattr.SAP_SC_MAX,180},{ckattr.SAP_SC,108}}},
			[7]={ needlv=83, needhj=23702 , active="物理防御       21-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_AC_MAX,36},{ckattr.SAP_AC,21}}},
			[8]={ needlv=83, needhj=23702 , active="魔法防御       21-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_MAC_MAX,36},{ckattr.SAP_MAC,21}}},
			[9]={ needlv=83, needhj=23702 , active="生命上限       1.4%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_HP_PRES,140}}},
			[10]={ needlv=83, needhj=23702 , active="暴击几率       0.28%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PROB,28}}},
			[11]={ needlv=83, needhj=23702 , active="暴击伤害       168",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PRES,168}}},
			[12]={ needlv=83, needhj=23702 , active="攻    击       108-180",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_DC_MAX,180},{ckattr.SAP_DC,108},{ckattr.SAP_MC_MAX,180},{ckattr.SAP_MC,108},{ckattr.SAP_SC_MAX,180},{ckattr.SAP_SC,108}}},
		},
	},
	[25]={
		name="",desp="",
		info={
			[1]={ needlv=84, needhj=24424 , active="物理防御       22-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_AC_MAX,36},{ckattr.SAP_AC,22}}},
			[2]={ needlv=84, needhj=24424 , active="魔法防御       22-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_MAC_MAX,36},{ckattr.SAP_MAC,22}}},
			[3]={ needlv=84, needhj=24424 , active="生命上限       1.4%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_HP_PRES,140}}},
			[4]={ needlv=84, needhj=24424 , active="暴击几率       0.28%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PROB,28}}},
			[5]={ needlv=84, needhj=24424 , active="暴击伤害       168",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PRES,168}}},
			[6]={ needlv=84, needhj=24424 , active="攻    击       108-180",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_DC_MAX,180},{ckattr.SAP_DC,108},{ckattr.SAP_MC_MAX,180},{ckattr.SAP_MC,108},{ckattr.SAP_SC_MAX,180},{ckattr.SAP_SC,108}}},
			[7]={ needlv=85, needhj=25148 , active="物理防御       22-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_AC_MAX,36},{ckattr.SAP_AC,22}}},
			[8]={ needlv=85, needhj=25148 , active="魔法防御       22-36",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_MAC_MAX,36},{ckattr.SAP_MAC,22}}},
			[9]={ needlv=85, needhj=25148 , active="生命上限       1.4%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_HP_PRES,140}}},
			[10]={ needlv=85, needhj=25148 , active="暴击几率       0.28%",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PROB,28}}},
			[11]={ needlv=85, needhj=25148 , active="暴击伤害       168",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_BAOJI_PRES,168}}},
			[12]={ needlv=85, needhj=25148 , active="攻    击       108-180",    attr={{ckattr.SAP_FIGHT,190},{ckattr.SAP_DC_MAX,180},{ckattr.SAP_DC,108},{ckattr.SAP_MC_MAX,180},{ckattr.SAP_MC,108},{ckattr.SAP_SC_MAX,180},{ckattr.SAP_SC,108}}},
		},
	},
}

function fresh_sap_attr_lianhun(player,attr)
	local level = util.ppn(player,const.PP_LIANHUN_LEVEL);
	local xing = util.ppn(player,const.PP_LIANHUN_XING);
	if level > 0 and xing > 0 then
		for i=1,level do
			if lh_data[i] then
				local atrdb = lh_data[i].info;
				for j = 1,#atrdb do
					if i < level or j <= xing then
						local lhd = atrdb[j].attr;
						for k=1,#lhd do
							attr[lhd[k][1]] = (attr[lhd[k][1]] or 0) + lhd[k][2];
						end
					end
				end
			end
		end
	end
end
ckattr.add_sap_listener(fresh_sap_attr_lianhun);

function process_lianhun_start(player,actionset,panelid,actionid)
	if actionid == "btnLianhun" then
		startLianHun(player);
	end

	if actionid == "gotoXunbao" then
		player:set_panel_data("panellottery","panellottery","panel_visible","true");
		player:push_ckpanel_data("lottery","panellottery");
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_lianhun_start);

function startLianHun(player)
	local level = util.ppn(player,const.PP_LIANHUN_LEVEL);
	local xing = util.ppn(player,const.PP_LIANHUN_XING);
	--print(level,xing);
	if level >= MAX_LIANHUN_LEVEL and xing >= MAX_LIANHUN_XING then
		player:alert(1,1,"下一转天命尚未开放!");return;
	end
	local next_lv = level;local next_xg = xing+1;
	if level == 0 then
		next_lv = 1;next_xg = 1;
	end
	if xing == MAX_LIANHUN_XING then
		next_lv = level+1;next_xg = 1;
	end
	local nextlv_data = lh_data[next_lv];
	if nextlv_data then
		local nextxg_data = nextlv_data.info[next_xg];
		if nextxg_data then
			if player:get_level() < nextxg_data.needlv then
				player:alert(1,1,"进行下一阶段天命需要人物等级达到"..nextxg_data.needlv.."级!");return;
			end
			local neehjnow = nextxg_data.needhj;
			if activity.TianmingTHOpen() then
				neehjnow = math.floor(neehjnow*0.8);
			end
			if util.ppn(player,const.PP_HUNJING_NUMBER) >= neehjnow then
				player:set_param(const.PP_HUNJING_NUMBER,util.ppn(player,const.PP_HUNJING_NUMBER)-neehjnow);
				player:set_param(const.PP_LIANHUN_LEVEL,next_lv);
				player:set_param(const.PP_LIANHUN_XING,next_xg);
				ckattr.fresh_sap_attr(player);
				ckattr.update_attr(player);
				if next_lv >= 10 and next_lv == level+1 then
					player:set_panel_data(PANEL_ACTIONSET_NAME,"lianhun","action","rotate");
					server.info(10000,0,"恭喜玩家<font color='#ff0000'>"..player:get_name().."</font>达到了<font color='#FFCC00'>"..next_lv.."</font>级<font color='#FFCC00'>天命</font>,属性获得大幅提升!");
					server.info(10,0,"恭喜玩家<font color='#ff0000'>"..player:get_name().."</font>达到了<font color='#FFCC00'>"..next_lv.."</font>级<font color='#FFCC00'>天命</font>,属性获得大幅提升![<a href='event:push_local_panellianhun'><u><font color='#00FF00'>提升天命</font></u></a>]");
				else
					player:set_panel_data(PANEL_ACTIONSET_NAME,"lianhun","action","norotate");
				end
				fresh_lianhun_info(player);
				--if activity.islianhuntisheng() then
					--if xing == MAX_LIANHUN_XING then
						--炼魂 升级，，next_lv 当前等级
						--if next_lv == 5 then
							--player:set_param(const.PP_LIANHUN_DENGJI1,1);
						--elseif next_lv == 10 then
							--player:set_param(const.PP_LIANHUN_DENGJI2,1);
						--elseif next_lv == 15 then
							--player:set_param(const.PP_LIANHUN_DENGJI3,1);
						--elseif next_lv == 20 then
							--player:set_param(const.PP_LIANHUN_DENGJI4,1);
						--elseif next_lv == 25 then
							--player:set_param(const.PP_LIANHUN_DENGJI5,1);
						--end
					--end
				--end
				player:alert(1,1,"提升天命成功!");
			else
				fresh_lianhun_info(player);
				player:alert(1,1,"提升至下一天命等级需要真气"..neehjnow.."!");return;
			end
		end
	end
end

----note:
---- 魂晶 绑定每日限制

function fresh_lianhun_info(player)
	local level = util.ppn(player,const.PP_LIANHUN_LEVEL);
	local xing = util.ppn(player,const.PP_LIANHUN_XING);
	local totalattr = {};
	if level > 0 and xing > 0 then
		for i=1,level do
			if lh_data[i] then
				local atrdb = lh_data[i].info;
				for j = 1,#atrdb do
					if i < level or j <= xing then
						local lhd = atrdb[j].attr;
						for k=1,#lhd do
							totalattr[lhd[k][1]] = (totalattr[lhd[k][1]] or 0) + lhd[k][2];
						end
					end
				end
			end
		end
	end
	local tfight = (totalattr[ckattr.SAP_FIGHT] or 0);
	local thp = (totalattr[ckattr.SAP_HP_PRES] or 0);
	local tatt = (totalattr[ckattr.SAP_DC] or 0);
	local tatt2 = (totalattr[ckattr.SAP_DC_MAX] or 0);
	local tac = (totalattr[ckattr.SAP_AC] or 0);
	local tac2 = (totalattr[ckattr.SAP_AC_MAX] or 0);
	local tmac = (totalattr[ckattr.SAP_MAC] or 0);
	local tmac2 = (totalattr[ckattr.SAP_MAC_MAX] or 0);
	local tbjpb = (totalattr[ckattr.SAP_BAOJI_PROB] or 0);
	local tbjps = (totalattr[ckattr.SAP_BAOJI_PRES] or 0);

	player:set_panel_data(PANEL_ACTIONSET_NAME,"f_point","point",tfight);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_sm","text",""..(thp/100).."%");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_gj","text",""..tatt.."-"..tatt2);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_wf","text",""..tac.."-"..tac2);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_mf","text",""..tmac.."-"..tmac2);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_bj","text",""..(tbjpb/100).."%");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_bjsh","text",tbjps);

	if xing > 0 then
		for i=1,12 do
			if i <= xing then
				player:set_panel_data(PANEL_ACTIONSET_NAME,"img_"..i,"visible","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"eff_"..i,"visible","true");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"swf_"..i,"visible","true");
			else
				player:set_panel_data(PANEL_ACTIONSET_NAME,"img_"..i,"visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"eff_"..i,"visible","false");
				player:set_panel_data(PANEL_ACTIONSET_NAME,"swf_"..i,"visible","false");
			end
		end
	else
		for i=1,12 do
			player:set_panel_data(PANEL_ACTIONSET_NAME,"img_"..i,"visible","false");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"eff_"..i,"visible","false");
			player:set_panel_data(PANEL_ACTIONSET_NAME,"swf_"..i,"visible","false");
		end
	end

	local next_lv = level;local next_xg = xing+1;
	if level == 0 then
		next_lv = 1;next_xg = 1;
	end
	if xing == MAX_LIANHUN_XING then
		next_lv = level+1;next_xg = 1;
	end
	if level == MAX_LIANHUN_LEVEL and xing == MAX_LIANHUN_XING then
		next_lv = level;next_xg = xing;
	end
	local nextlv_data = lh_data[next_lv];
	if nextlv_data then
		local nextxg_data = nextlv_data.info[next_xg];
		local nexneedhj = nextxg_data.needhj;
		if activity.TianmingTHOpen() then
			nexneedhj = math.floor(nexneedhj * 0.8);
		end
		if nextxg_data then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"att_name","text",nextxg_data.active);

			player:set_panel_data(PANEL_ACTIONSET_NAME,"att_level","text",nextxg_data.needlv);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"att_hp","text",nexneedhj);
		end
	end

	player:set_panel_data(PANEL_ACTIONSET_NAME,"f_hunlv","point",level);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"att_hpnum","text",util.ppn(player,const.PP_HUNJING_NUMBER));
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end
login.add_login_listener(fresh_lianhun_info);

function uplianhunlevel(player)
	local level = util.ppn(player,const.PP_LIANHUN_LEVEL);
	local xing = util.ppn(player,const.PP_LIANHUN_XING);
	--print(level,xing);
	if level >= MAX_LIANHUN_LEVEL and xing >= MAX_LIANHUN_XING then
		player:alert(1,1,"下一转天命尚未开放!");return;
	end
	local next_lv = level;local next_xg = xing+1;
	if level == 0 then
		next_lv = 1;next_xg = 1;
	end
	if xing == MAX_LIANHUN_XING then
		next_lv = level+1;next_xg = 1;
	end
	player:set_param(const.PP_LIANHUN_LEVEL,next_lv);
	player:set_param(const.PP_LIANHUN_XING,next_xg);
	ckattr.fresh_sap_attr(player);
	ckattr.update_attr(player);
	if next_lv >= 10 and next_lv == level+1 then
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lianhun","action","rotate");
		server.info(10000,0,"恭喜玩家<font color='#ff0000'>"..player:get_name().."</font>达到了<font color='#FFCC00'>"..next_lv.."</font>级<font color='#FFCC00'>天命</font>,属性获得大幅提升!");
		server.info(10,0,"恭喜玩家<font color='#ff0000'>"..player:get_name().."</font>达到了<font color='#FFCC00'>"..next_lv.."</font>级<font color='#FFCC00'>天命</font>,属性获得大幅提升![<a href='event:push_local_panellianhun'><u><font color='#00FF00'>提升天命</font></u></a>]");
	else
		player:set_panel_data(PANEL_ACTIONSET_NAME,"lianhun","action","norotate");
	end
	fresh_lianhun_info(player);
	
end
