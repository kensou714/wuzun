module(..., package.seeall)

function gx(player)
	if util.ppn(player,const.PP_BLFW) ~= today()  then
		player:set_free_direct_fly(20);
		player:set_param(const.PP_BOSSTZ,3);
		player:set_param(const.PP_ZHENMOTACISHU,10);
		player:set_param(const.PP_SHENLANLZ,0);
		player:set_param(const.PP_SHENLANLZ_BIND,0);
		player:set_param(const.PP_ZQJYD1,0);
		player:set_param(const.PP_ZQJYD5,0);
		player:set_param(const.PP_ZQJYD10,0);
		player:set_param(const.PP_ZHAOCAI,0);
		player:set_param(const.PP_FUGUIHU,0);
		player:set_param(const.PP_BAIBAODAI,0);
		player:set_param(const.PP_HUNSHIBIND,0);
		player:set_param(const.PP_RONGYUBIND,0);
		player:set_param(const.PP_YIJIBAOSHILB,0);
		player:set_param(const.PP_QIANDAO_CZ_TAG,0);
		player:set_param(const.PP_SUOYAOTA_PAI1NUM,0);
		player:set_param(const.PP_SUOYAOTA_PAI2NUM,0);
		player:set_param(const.PP_SUOYAOTA_PAI3NUM,0);
		player:set_param(const.PP_CHENGJIULINGPAI,0);
		player:set_param(const.PP_CHENGJIULPBIND,0);
		player:set_param(const.PP_XIUWEI_TODAY,0);
		player:set_param(const.PP_ZHONGQIUYBCS,0);
		player:set_param(const.PP_JINGYANDAN5000,0);
		player:set_param(const.PP_JINGYANDAN2000,0);
		player:set_param(const.PP_ZHUANSHENGSHILB,0);
		player:set_param(const.PP_CAIJIKUANGSHI,0);
		player:set_param(const.PP_SHENQI_JINJIE_TIMES,0);

		--重置龙神秘宝绑元次数
		player:set_param(const.PP_DRAGON_BINDVCOIN,10);
		player:set_param(const.PP_DRAGON_LAYER,0);
		player:set_param(const.PP_DRAGON_STAET_STEP,0);

		player:set_param(const.PP_DUOBAO_TEN,0);

		player:set_param(const.PP_GUILD_FIGHT_ENTER,0);

		if tonumber(player:achieve_get_point()) >= 2021 then
			player:achieve_add_point(-math.floor(player:achieve_get_point()/100));
			player:alert(10,0,"消耗[1%成就值]开启[霸气护体]");
		end
		player:set_param(const.PP_BLFW,today());
		player:set_param(const.PP_QIFULPBIND,0);
		player:set_param(const.PP_QIFU_NUMBER,util.ppn(player,const.PP_QIFU_NUMBER)+1);
		player:set_param(const.PP_MEIRIQIFU,0);
		player:set_param(const.PP_QIFU_STATUS1,0);
		player:set_param(const.PP_QIFU_STATUS2,0);
		player:set_param(const.PP_QIFU_STATUS3,0);
		player:set_param(const.PP_QIFU_STATUS4,0);
		player:set_param(const.PP_QIFU_STATUS5,0);
		player:set_param(const.PP_MEIRIXUNBAOCISHU,0);
		player:set_param(const.PP_XUNBAO50CILIBAO,0);
		player:set_param(const.PP_XUNBAO100CILIBAO,0);
		player:set_param(const.PP_XUNBAO200CILIBAO,0);
		player:set_param(const.PP_RELIVE_TICK,1);--复活每日重置
		player:set_param(const.PP_XUANJING1J_NUM,0);
		player:set_param(const.PP_YGFXBX,0);
		player:set_param(const.PP_LEIJI_LOGINDAYS,util.ppn(player,const.PP_LEIJI_LOGINDAYS)+1);
		player:set_param(const.PP_GUILD_BUY1_1,0);
		player:set_param(const.PP_GUILD_BUY1_2,0);
		player:set_param(const.PP_GUILD_BUY2_1,0);
		player:set_param(const.PP_GUILD_BUY2_2,0);
		player:set_param(const.PP_GUILD_BUY2_3,0);
		player:set_param(const.PP_GUILD_BUY2_4,0);
		player:set_param(const.PP_GUILD_BUY3_1,0);
		player:set_param(const.PP_GUILD_BUY3_2,0);
		player:set_param(const.PP_GUILD_BUY3_3,0);
		player:set_param(const.PP_GUILD_BUY4_1,0);
		player:set_param(const.PP_GUILD_BUY4_2,0);
		player:set_param(const.PP_GUILD_BUY4_3,0);
		player:set_param(const.PP_GUILD_BUY5_1,0);
		player:set_param(const.PP_GUILD_BUY5_2,0);
		player:set_param(const.PP_GUILD_KBONUS_LIMIT,0);

		--活跃度
		player:set_param(const.PP_HUOYUEDU_JIFEN,0);
		player:set_param(const.PP_HUOYUEDU_LQ_FLAG1,0);
		player:set_param(const.PP_HUOYUEDU_LQ_FLAG2,0);
		player:set_param(const.PP_HUOYUEDU_LQ_FLAG3,0);
		player:set_param(const.PP_HUOYUEDU_LQ_FLAG4,0);
		player:set_param(const.PP_HUOYUEDU_NUM1,0);
		player:set_param(const.PP_HUOYUEDU_NUM2,0);
		player:set_param(const.PP_HUOYUEDU_NUM3,0);
		player:set_param(const.PP_HUOYUEDU_NUM4,0);
		player:set_param(const.PP_HUOYUEDU_NUM5,0);
		player:set_param(const.PP_HUOYUEDU_NUM6,0);
		player:set_param(const.PP_HUOYUEDU_NUM7,0);
		player:set_param(const.PP_HUOYUEDU_NUM8,0);
		player:set_param(const.PP_HUOYUEDU_NUM9,0);
		player:set_param(const.PP_HUOYUEDU_NUM10,0);
		player:set_param(const.PP_HUOYUEDU_NUM11,0);
		player:set_param(const.PP_HUOYUEDU_NUM12,0);
		player:set_param(const.PP_HUOYUEDU_NUM13,0);

		newgui.minimap.judgebutton(player);
		newgui.minimap.reset_player_zksc_info(player);
		newgui.minimap.reset_player_mrcwjyd_info(player);
		newgui.minimap.reset_player_jianlingjj_info(player);
		newgui.minimap.reset_player_shoulingjj_info(player)
		newgui.minimap.reset_player_jrdh_info(player)
	end
end