module(..., package.seeall)
-------------------------------------------------------------------------------task const
TASK_STATE_NUM          =10;TSN      =TASK_STATE_NUM          ;
TASK_STATE_NULL         =0; TSNULL   =TASK_STATE_NULL         ;
TASK_STATE_UNACCEPTABLE =1; TSUNAC   =TASK_STATE_UNACCEPTABLE ;
TASK_STATE_ACCEPTABLE   =2; TSACCE   =TASK_STATE_ACCEPTABLE   ;
TASK_STATE_ACCEPTED     =3; TSACED   =TASK_STATE_ACCEPTED     ;
TASK_STATE_COMPLATABLE  =4; TSCOMP   =TASK_STATE_COMPLATABLE  ;
TASK_STATE_NAME={[1]="(不可接)",[2]="<font color='#FF0000'>(可接)</font>",[3]="<font color='#EEC900'>(已接)</font>",[4]="<font color='#FFFF00'>(完成)</font>",}
TASK_STATE_TALK={[1]="继续任务",[2]="接受任务",[3]="继续任务",[4]="完成任务",}

RAIN_SEXP_MAX_NUM1=2;
RAIN_SEXP_MAX_NUM2=2;
RAIN_SEXP_MAX_NUM3=2;
RAIN_SEXP_MAX_NUM4=2;
RAIN_SEXP_MAX_NUM5=2;
RAIN_SEXP_MAX_NUM6=2;
RICHANG_MAX_NUM=10;
RICHANG2_MAX_NUM=6;
RICHANG3_MAX_NUM=10;
YXTIE_MAX_NUM=5;
YABIAO_MAX_NUM=3;
JIU_MAX_NUM=6;
ZMT_MAX_NUM=2;
MIJING_MAX_NUM=8*60;
JIEBIAO_MAX_NUM=2;
YMSY_MAX_NUM=120;
SHILIAN_MAX_NUM=1;
JIQING_MAX_NUM=2;
-------------------------------------------------------------------------------player param
PP_BLFW=100; --变量每日复位
PP_YABIAO_NUM=213;
PP_YABIAO_DAY=214;
PP_YABIAO_TYPE=314;
PP_JIEBIAO=215;

PP_MIJING_DAY=220;
PP_MIJING_NUM=221;

PP_RAIN_SEXP_NUM5=113;
PP_RAIN_SEXP_NUM6=114;
PP_RAIN_SEXP_NUM1=115;
PP_RAIN_SEXP_NUM2=116;
PP_RAIN_SEXP_NUM3=118;
PP_RAIN_SEXP_NUM4=119;
PP_RAIN_DAY=117;

PP_RICHANG_DAY=120;
PP_RICHANG_NUM=121;
PP_RICHANG2_DAY=122;
PP_RICHANG2_NUM=123;
PP_BOSSTZ=124;
PP_FUGUIHU=125;
PP_SLLINGZHU1=126;
PP_SLLINGZHU2=127;
PP_SLLINGZHU3=128;
PP_RICHANG_LV=129;
PP_HUIYUAN=132;
PP_BAIBAODAI=133;
PP_HUNSHI=134;
PP_YXTIE_DAY=130;
PP_YXTIE_NUM=131;
PP_YXTIE_LV=135;
PP_JIULI=138;
PP_JIUTYPE=139;
PP_JIU_NUM=140;
PP_JIU_DAY=141;
PP_ZMT_DAY=142;
PP_ZMT_NUM=143;
PP_ACHIEVE_POINT=144;
PP_ACHIEVE_ADDFRIEND=145;
PP_ACHIEVE_ADDFRIEND_LQ=146;
PP_ACHIEVE_JOINGUILD=147;
PP_ACHIEVE_JOINGUILD_LQ=148;
PP_ACHIEVE_LVTRAIN1=149;
PP_ACHIEVE_LVTRAIN1_LQ=150;
PP_ACHIEVE_ONLINE120=151;
PP_ACHIEVE_ONLINE120_LQ=152;
PP_ACHIEVE_FIGHTBOSS1=153;
PP_ACHIEVE_FIGHTBOSS1_LQ=154;
PP_ACHIEVE_XUANJIN8=155;
PP_ACHIEVE_XUANJIN8_LQ=156;
PP_ACHIEVE_LASTLOGIN60=157;
PP_ACHIEVE_LASTLOGIN60_LQ=158;
PP_ACHIEVE_TRAINXINFA5=159;
PP_ACHIEVE_TRAINXINFA5_LQ=160;
PP_ACHIEVE_ONLINE60=161;
PP_ACHIEVE_ONLINE60_LQ=162;
PP_ACHIEVE_UPGRADENUM=163;
PP_ACHIEVE_UPGRADE_LQ=164;
--
PP_ACHIEVE_GAINMONEY_LQ=165;

PP_ZMT_LV=166;
PP_ZMT3_LV=169;

PP_XYCM_TASKLV=167;
PP_SJLR_TASKLV=168;

PP_HELP_XINSHOULBLQ=170;--新手礼包
PP_HELP_HANGHUILBLQ=171;--行会礼包
PP_HELP_SHOUCHONGLBLQ=172;--首冲礼包
PP_HELP_FANLILBLQ=173;--充值返利
PP_HELP_FANLINUMBER=174;--返利总计
PP_HELP_CHONGZHIHL=175;--充值豪礼
PP_HELP_LEVELGIFT=176;--武尊升级奖励
PP_HELP_BIGGIFT=177;
PP_HELP_CZLIBAO1000=178;

PP_RICHANG2_LV=180;
PP_RICHANG3_LV=181;
PP_RICHANG3_DAY=182;
PP_RICHANG3_NUM=183;

PP_FUBEN_ALL_NUM=185;
PP_GUILD_FUBEN_ENTER_NUM=186;

PP_SUOYAOTA_PAI=187;--镇魔塔令牌
PP_SUOYAOTA_MAP=188;
PP_SUOYAOTA_AWARD=189;
PP_SUOYAOTA_PAI1NUM=190;
PP_SUOYAOTA_PAI2NUM=191;
PP_SUOYAOTA_PAI3NUM=192;

--PP_CZAWARD_LQ1=193;
--PP_CZAWARD_LQ2=194;
PP_CZAWARD_LQ100=195;
PP_CZAWARD_LQ500=196;
--PP_CZAWARD_TOTALYB=197;

PP_DAILY_GIFT=198;
PP_DAILY_CONGZI=199;
PP_CONGZI_DAY=200;

PP_SHENQI_JIELV=201
PP_SHENQI_XINGLV=202

-------------------------------------------------
-------------------------------------------------这里保留100个变量
PP_XIANGQIAN_POS=400;--这里保留100个变量
PP_XQ_ATTR_WEAPON=401;--(-2*2)--武器
PP_XQ_ATTR_CLOTH=402;--(-3*2)--衣服
PP_XQ_ATTR_HAT=403;--(-4*2)--头盔
PP_XQ_ATTR_RING1=404;--(-5*2)--戒指1
PP_XQ_ATTR_RING2=405;--(-5*2-1)--戒指2
PP_XQ_ATTR_GLOVE1=406;--(-6*2)--手镯1
PP_XQ_ATTR_GLOVE2=407;--(-6*2-1)--手镯2
PP_XQ_ATTR_NICKLACE=408;--(-7*2)--项链
PP_XQ_ATTR_BELT=409;--(-9*2)--腰带
PP_XQ_ATTR_BOOT=410;--(-10*2)--靴子
PP_XQ_ATTR_HUIZHUANG=411;--(-11*2)--徽章
PP_XQ_ATTR_HUNQI=412;--(-11*2)
PP_XQ_ATTR_WING=413;--(-16*2)
PP_XQ_ATTR_TEJIE=414;--(-17*2)
PP_XQ_ATTR_LINGPAI=415;--(-18*2)
PP_XIANGQIAN_POS_END=420;--400-500的变量不要用
PP_CHONGZHIJIFEN=450;--充值积分新的编号
-------------------------------------------------400-500变量不要用
-------------------------------------------------

PP_SMZCJISHI=300
PP_SMZCJIFEN=301
PP_SMZCKILL=302
PP_SMZCHOUR=303
PP_SMZCZHENY=304
PP_TIANMOD=305
PP_RONGYU=306
PP_YMSY=307
PP_YMSY_DAY=308
PP_ZHAOCAI=309
PP_SHENLANLZ=310
PP_DYCFUBEN=311
PP_ZAIXIANLB=312
PP_ZXLBSJ=313
--314押镖类型
PP_SQJF=315
PP_SHENLANLZ_BIND=316
PP_FUGUIHU=317
PP_EVERYDAY_CHECK=318
PP_GUANZHI=319
PP_FENGLU=320
PP_HUIYUAN_FULI=321
PP_SCLIBAO_JINTIAO=322
PP_SCLIBAO_XIANPO1=323
PP_SCLIBAO_XIANPO2=324
PP_SCLIBAO_YUANBAO=325
PP_SCCZLB=326
PP_XINQUCHONGZHI=327
PP_XQCZPMLQ=328
PP_CUR_ZUOQI_LEVEL=329
PP_ZUOQI_EXP=330
PP_SJJL30=331
PP_SJJL40=332
PP_SJJL50=333
PP_SJJL60=334
PP_SJJL70=335
PP_SJJL80=336
PP_XSKLB=337
PP_XQCZFL=338
PP_CZHZ_LV=339--红钻等级
PP_WLZBRY=340
PP_ZQJYD1=341
PP_ZQJYD5=342
PP_ZQJYD10=343
PP_CBXLB=344
PP_CHANGE_MOUNT_INCD=345--上马CD时间
PP_LOGIN_AWARD=346--登陆器奖励
PP_CHONGZHI_JINTIAO=347
PP_CHONGZHI_YUANBAO=348
PP_QILINGSHENGDIAN=349
PP_CESHIYUANBAO=350
PP_HUNSHIBIND=351
PP_RONGYUBIND=352
PP_MEITILIBAO1=353
PP_MEITILIBAO2=354
PP_MEITILIBAO3=355
PP_MEITILIBAO4=356
PP_MEITILIBAO5=357
PP_MEITILIBAO6=358
PP_MEITILIBAO7=359
PP_MEITILIBAO8=360
PP_MEITILIBAO9=361
PP_ZAIXIANJL30=362
PP_ZAIXIANJL60=363
PP_ZAIXIANJL120=364
PP_ZAIXIANJL240=365
PP_ZAIXIANJL360=366
PP_ZAIXIANJL480=367
PP_QIANDAO_DAY=368;--签到标记
PP_QIANDAO_DAY_NUM=369;--连续签到次数
PP_QIANDAO_QU1=370;--是否领取
PP_QIANDAO_QU2=371;--充值领取是否
PP_QIANDAO_CZ_TAG=372;--今日是否充值
PP_SHOUJIBDLB=373;--手机绑定礼包
PP_MEITILIBAO10=374;--265G媒体礼包
PP_YIJIBAOSHILB=375;--一级宝石包
PP_QINGRENJIELB=376;--情人节礼包
PP_SCLIBAO_XIANPO3=377

PP_CHONGZHIJIFEN_OLD=378;--充值积分

PP_ZHENMOTACISHU=379;--镇魔塔限次
PP_MEITILIBAOJIN=380;--媒体礼包金
PP_MEITILIBAOYIN=381;--媒体礼包银
PP_MEITILIBAOTONG=382;--媒体礼包铜
PP_CHAOJIVIPLIBAO=383;--超级VIP礼包
PP_VIPSHENGRLIBAO=384;--超级VIP生日礼包
PP_CHENGJIULINGPAI=385;--成就令牌
PP_CHENGJIULPBIND=386;--成就令牌(绑)

PP_SVRMEG_TAG=387;
PP_SVRMEG_LIBAO=388;
PP_SVRMEG_CONGZI=389;
PP_SVRMEG_CONGZI_FANHUAN=390;

PP_XINFA_LEVEL=391;
PP_XINFA_XIUWEI=392;
PP_XIUWEI_TODAY=393;
PP_WAKUANG=394;

PP_HHJYF=395--行会经验符
PP_XQCJJL50=396
PP_XQCJJL60=397
PP_XQCJJL65=398
PP_XQCJJL70=399
--这里注意,400-500的变量是保留的..预留给镶嵌了.
PP_XQCJJL75=501
PP_XQCJJL80=502

PP_MRCZPM_TAG=503
PP_MRCZPM_CONGZI=504
PP_BAIFUHAOHUALB=505
PP_TTZAIXIANMFLJ=506
PP_GWDAIYANRENLB=507
PP_BAIYINLB=508
PP_HUANGJINLB=509
PP_ZUANSHILB=510
PP_LEIJICZJL=511
PP_LEIJICZLB1=512
PP_LEIJICZLB2=513
PP_LEIJICZLB3=514
PP_LEIJICZLB4=515
PP_LEIJICZLB5=516
PP_LEIJICZLB6=517
PP_LEIJICZLB7=518
PP_LEIJICZLB8=519
--520用过
PP_LEIJI_LOGIN_CHECK=521
PP_DUANWULB=522
PP_MZCZPM_TAG=523
PP_MZCZPM_CONGZI=524
PP_MRCZLJ_TAG=525
PP_BFCZFL=526
PP_CHINAJOYLB=527
PP_LYLBYUANBAO=528
PP_LYLBLINGQU=529
--530用过
PP_XIAOFEIJL=531
PP_XIAOFEIYB=532
PP_BFXIAOFEIYB=533
PP_1307XIAOFEIYB=534
PP_360JFLB=535
PP_LEIJICZLB0=536
PP_WANGSHANGXIAN=537
PP_GONGXUN=538
PP_GONGXUNDH=539

--
PP_HF_CJ_NUM=540;
PP_HF_KINGWAR_LQ=541;
PP_HF_XIAOFEI_YB=542;
PP_HF_XIAOFEI_LQ=543;
PP_HF_CZYB_TEMP=544;
--PP_XQ_CJ_NUM=545;
PP_XQ_XIAOFEI_YB=546;
PP_360JFDLB=547
PP_360QXLB=548
PP_TEQUANLB=549
PP_1308XIAOFEIYB=550
PP_130802XIAOFEIYB=551
PP_0802XIAOFEITJ=552
PP_0802CHONGZHITJ=553
PP_0802CHONGZHILB=554
PP_XDQSLB=555
PP_JJSLB=556
PP_9991WANLB=557

PP_SVRMEG_SEED=558
PP_SVRMEG_LOGTIME=559
PP_BAIFULB=560
PP_TEJIECZTJ=561
PP_XSTEJIELQ=562
PP_TEJIECZTJ2=563
PP_QIANDAO7LB=564
PP_QIANDAO15LB=565
PP_QIANDAO40LB=566
PP_QIANDAO60LB=567
PP_1309BFXIAOFEIYB=568
PP_JINJIESHICUXIAO=569
PP_JINGYANZHUCUXIAO=570
PP_GUANZHIJINJIELB1=571
PP_GUANZHIJINJIELB2=572
PP_GUANZHIJINJIELB3=573
PP_GUANZHIJINJIELB4=574
PP_GUANZHIJINJIELB5=575
PP_GUANZHIJINJIELB6=576
PP_GUANZHIJINJIELB7=577
PP_TEJIECZTJYB=578
PP_BMDYSKLQ=579
PP_JJ2JTEJIE=580
PP_JJ3JTEJIE=581
PP_JJ4JTEJIE=582
PP_JJ5JTEJIE=583
PP_JJ6JTEJIE=584
PP_JJ7JTEJIE=585
PP_ZHONGQIULB=586
PP_YYGAMELB1=587
PP_YYGAMELB2=588
PP_YYGAMELB3=589
PP_0901CHONGZHITJ=590
PP_130902XIAOFEIYB=591
PP_DAYCZ_NO2=592
PP_DAYCZ_NO3=593
PP_DAYCZ_NO4=594
PP_130903XIAOFEIYB=595
PP_ZHONGQIUYBCS=596
PP_1309YUEMOCZTJ=597
PP_1309CHONGZHILB=598
PP_GUOQINGHGLB=599
PP_JSLBPIFULB=600

PP_GQQIANDAO_DAY=601
PP_GQQIANDAO_NUM=602
PP_GUOQINGQDLB=603

PP_YONGJIU_ATTR_NUM=604 --永久属性丹
PP_131001XIAOFEIYB=605
PP_131001CHONGZHITJ=606
PP_BAIFUYYLB=607
PP_SHOWLIBAO=608

PP_ZUOQIJINJIELB1=609
PP_ZUOQIJINJIELB2=610
PP_ZUOQIJINJIELB3=611
PP_ZUOQIJINJIELB4=612
PP_ZUOQIJINJIELB5=613
PP_131002CHONGZHITJ=614
PP_131002XIAOFEIYB=615
PP_XUNBAOJIFEN=616

PP_ZHUANSHENGLEVEL=617 --转生等级
PP_131003CHONGZHITJ=618
PP_131003XIAOFEIYB=619
PP_WANSHENGJIELIBAO=620
PP_131004CHONGZHITJ=621
PP_CHONGZHIHUIKUILB=622
PP_XYZHOUNIANQLB=623
PP_131101CHONGZHITJ=624
PP_131101XIAOFEIYB=625
PP_DIAOXIANBCLB=626
PP_131102CHONGZHITJ=627
PP_ZHUANSHENGJJLB1=628
PP_ZHUANSHENGJJLB2=629
PP_ZHUANSHENGJJLB3=630
PP_JINGYANDAN5000=631
PP_JINGYANDAN2000=632
PP_ZHUANSHENGTISHI=633
PP_131103CHONGZHITJ=634
PP_ZHUANSHENGSHILB=635
PP_131104CHONGZHITJ=636
PP_131102XIAOFEIYB=637
PP_WANGXINLIBAO=638
PP_ZHUANSHULIBAO=639
PP_ZHAOCAISHENFU=640
PP_SHENQILIBAO1=641
PP_SHENQILIBAO2=642
PP_SHENQILIBAO3=643
PP_SHENQILIBAO4=644
PP_SHENQILIBAO5=645
PP_SHENQILIBAO6=646
PP_SHENQILIBAO7=647
PP_131105CHONGZHITJ=648
PP_131103XIAOFEIYB=649
PP_DANYAO_1PNUM=650
PP_DANYAO_2PNUM=651
PP_DANYAO_3PNUM=652
PP_DANYAO_4PNUM=653
PP_DANYAO_5PNUM=654
PP_DANYAO_6PNUM=655
PP_DANYAO_7PNUM=656
PP_DANYAO_8PNUM=657
PP_DANYAO_9PNUM=658
PP_DANYAO_10PNUM=659
PP_FENGMOLING_EXP=660
PP_FENGMOLING_PAI=661
PP_FENGMO_MONKILL=662
PP_131106CHONGZHITJ=663
PP_131201CHONGZHITJ=664
PP_131201XIAOFEIYB=665
PP_CAIJIKUANGSHI=666
PP_QIFULPBIND=667;--成就令牌(绑)
PP_131202CHONGZHITJ=668
PP_131203CHONGZHITJ=669
PP_QIFU_NUMBER=670
PP_QIFU_SHENGWANG=671
PP_QIFU_STATUS1=672
PP_QIFU_STATUS2=673
PP_QIFU_STATUS3=674
PP_QIFU_STATUS4=675
PP_QIFU_STATUS5=676
PP_QIFU_RESULT=677
PP_QIFU_STATUS_DAY=678
PP_LINGPAILIBAO1=679
PP_LINGPAILIBAO2=680
PP_LINGPAILIBAO3=681
PP_LINGPAILIBAO4=682
PP_LINGPAILIBAO5=683
PP_LINGPAILIBAO6=684
PP_LINGPAILIBAO7=685
PP_JINSHANZNQLB=686
PP_CHONGZHIJIFEN_CHONGZHI=687;
PP_JINRUBHDAO=688
PP_131204CHONGZHITJ=689

--挂机
--PP_ASSIST_PICK_ITEM		= 706	--挂机拾取物品
PP_ASSIST_PICK_GOLD		= 690	--挂机拾取金币
PP_ASSIST_PICK_MED		= 691	--挂机拾取药品
PP_ASSIST_AUTO_FIGHT	= 692	--挂机自动反击
----保护
PP_PROTECT_NORMAL_HP	= 693	--保护 普通生命
PP_PROTECT_NORMAL_MP	= 694	--保护 普通魔法
PP_PROTECT_QUICK_HP		= 695	--保护 快速生命
PP_PROTECT_QUICK_MP		= 696	--保护 快速魔法
PP_PROTECT_RANDOM		= 697	--保护 随机保护
PP_PROTECT_GOHOME		= 698	--保护 回城保护
--
PP_ASSIST_DEFAULT		= 699	--挂机默认配置,未设置过就用默认配置..

PP_HIDE_PAY_ALERT		= 700	--金币不足时,是否提醒充值字段
PP_HIDE_PAY_DAY			= 701	--该字段隔天重置

PP_NEW_ZUOQI_EXP=702
PP_NEW_ZUOQI_JIE_LEVEL=703  --新坐骑阶级
PP_NEW_ZUOQI_XING_LEVEL=704  --新坐骑星级
PP_NEW_ZUOQI_RELOG=705  --是否重新计算过坐骑等级
PP_ASSIST_PICK_ITEM		= 706	--挂机拾取物品
PP_HUIDANGBUCHANG		= 707	--回档补偿
PP_YUANDANLIBAO		= 708	--元旦礼包
PP_131205CHONGZHITJ=709
PP_QIANGHUA7JI=710
PP_QIANGHUA8JI=711
PP_QIANGHUA9JI=712
PP_QIANGHUA10JI=713
PP_QIANGHUA11JI=714
PP_QIANGHUA12JI=715
PP_MEIRIXUNBAOCISHU=716
PP_XUNBAO50CILIBAO=717
PP_XUNBAO100CILIBAO=718
PP_XUNBAO200CILIBAO=719
PP_131205XIAOFEIYB=720
PP_140101CHONGZHITJ=721
PP_WANGZHELIBAO		= 722	--王者礼包
PP_ZHIZUNLIBAO		= 723	--至尊礼包
PP_BAZHELIBAO		= 724	--霸者礼包
PP_265GXINNIANLIBAO	= 725	--265g新年礼包
PP_140102CHONGZHITJ=726
PP_BSQIANGHUA7JI=727
PP_BSQIANGHUA8JI=728
PP_BSQIANGHUA9JI=729
PP_BSQIANGHUA10JI=730
PP_BSQIANGHUA11JI=731
PP_BSQIANGHUA12JI=732

PP_QIANFU_FANLI=733
PP_140123CHONGZHITJ=734

PP_XUANJING1J_NUM=735 --265g一级玄晶宝箱

PP_RELIVE_TICK=736

PP_XINNIANTBLB=737  --源浩新年特别礼包

PP_DAILY_XUANJ=738

PP_140130CHONGZHITJ=739--春节期间充值统计
PP_BAOSHI_LINGQU_CHONGZHI=740--宝石领取活动重置的选项

PP_BAIFUJISHABOSS1=741;
PP_BAIFUJISHABOSS2=742;
PP_BAIFUJISHABOSS3=743;
PP_BAIFUJISHABOSSBIAOZHI=744;
PP_XUNBAOCISHUCHONGZHI=745;

PP_XINCHUNQIFU=746;
PP_MEIRIQIFU=747;

PP_ACTIVITY_CZHI_LJ=748;
PP_ACTIVITY_CZHI_CZ=749; --重置

PP_TEMP_VIP_TIMER=750; --临时VIP计时
PP_BAIFUJISHABOSSCHONGZHI=751;--BOSS击杀重置

PP_CHENGZHANGJJLB=752; --998成长礼包

PP_YOUXIJIEKHLB=753; --37wan 3月7日游戏节狂欢礼包

PP_07073DUJIALIBAOA=754;   --07073 独家A
PP_07073DUJIALIBAOB=755;   --07073 独家B
PP_07073DUJIALIBAOC=756;   --07073 独家C

PP_37WANDUJIALIBAOA=757;   --37WAN 独家A
PP_37WANDUJIALIBAOB=758;   --37WAN 独家B
PP_37WANDUJIALIBAOC=759;   --37WAN 独家C                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

--------------------------------------------------------------------------------360特权活动
PP_360TQLB2=760;
PP_360TQLB6=761;
PP_360TQLB7=762;
PP_360TQLB8=763;
PP_360TQLB9=764;
PP_360TQLB15=765;
PP_360TEQUANCH=766;

PP_JINSHANBJLB=767;    --金山铂金礼包
PP_JINSHANHYLB=768;    --金山会员超级礼包
PP_CHONGZHI_FANLI1=769;	--充值返利第一档
PP_CHONGZHI_FANLI2=770;	--充值返利第二档
PP_CHONGZHI_FANLI3=771;	--充值返利第三档
PP_CHONGZHI_FANLI4=772;	--充值返利第四档
PP_CHONGZHI_FANLI5=773;	--充值返利第五档

PP_37WAN37HUODONG=774; --37活动

PP_SHENQI_SALE_1=775;
PP_SHENQI_SALE_2=776;
PP_SHENQI_SALE_3=777;

PP_JINRUYGFX=778 --进入远古废墟

PP_37YONGJIUGONGJI=779 -- 37永久属性

PP_YGFXBX=780 -- 远古废墟开宝箱次数

PP_TZJF=781--女娲神石兑换积分

--PP_ZUOQI_YBJJ_TIMES=782;
PP_ZUOQI_YJJJ_TIMES=783;
PP_BAIFU_FANLI=784;
PP_ACTIVITY_ZDQLLQ=785;

PP_YURENJIE=786;

PP_LIEBAOHLLB=787;--猎豹平台四档礼包
PP_LIEBAOBFLB=788;
PP_LIEBAOCZLB=789;
PP_LIEBAOMHLB=790;
PP_WWDZCH=791;
PP_GUANZHI_START=792;

PP_HAODONGZNLB=793;

PP_HONGZUAN_AWARD1=794;
PP_HONGZUAN_AWARD2=795;
PP_HONGZUAN_AWARD3=796;
PP_HONGZUAN_AWARD4=797;
PP_HONGZUAN_AWARD5=798;
PP_HONGZUAN_AWARD6=799;
PP_HONGZUAN_AWARD7=800;
PP_HONGZUAN_AWARD8=801;
PP_HONGZUAN_AWARD9=802;
PP_HONGZUAN_AWARD10=803;

PP_GAME_BUG_BUCHANG=804;

PP_KUAIWANZNLB=805;

PP_ZHOUNIANQINGLB=806;
PP_BAIFUJISHABOSS4=807;    --击杀150级boss 
PP_BUCHANGJISHABOSSBIAOZHI=808; --击杀150级boss 领取标志  

PP_HUNJING_NUMBER=809;  --魂晶数量
PP_HUNJING_BIND=810;    --绑定魂晶
PP_MWT_LV=811;--裁决之地层数
PP_SHILIAN_DAY=812;--裁决之地
PP_SHILIAN_NUM=813;--裁决之地

PP_JIFENHUANGJINLB=814;
PP_JIFENZUANSHILB=815;

PP_5399_BUCHANG=816;

PP_LIEBAO_VIPLB=817;	--猎豹VIP礼包

PP_DUANWU_HUANLELB=818;		--端午欢乐礼包
PP_DUANWU_HAOHUALB=819;		--端午豪华礼包
PP_DUANWU_XINGFULB=820;		--端午幸福礼包

PP_XIARI_HUANLELB=821;
PP_XIARI_HAOHUALB=822;
PP_XIARI_XINGFULB=823;

PP_SWORD_TYPE=824;
PP_SWORD_LEVEL=825;
PP_SWORD_SLEVEL=826;
PP_SWORD_LINGQI=827;
PP_SWORD_LINGQI_BIND=828;    --绑定灵气

PP_HUIGUILB_HZ1=829;		--回归礼包，红钻1~10
PP_HUIGUILB_HZ2=830;
PP_HUIGUILB_HZ3=831;
PP_HUIGUILB_HZ4=832;
PP_HUIGUILB_HZ5=833;
PP_HUIGUILB_HZ6=834;
PP_HUIGUILB_HZ7=835;
PP_HUIGUILB_HZ8=836;
PP_HUIGUILB_HZ9=837;
PP_HUIGUILB_HZ10=838;
PP_HUIGUILB_XIARI=839;		--夏日回归礼包
PP_LIBAO_PINGTAI37A=840;	--37平台A礼包
PP_LIBAO_PINGTAI37B=841;	--37平台B礼包
PP_JINSHANZHIZUN=842;           --金山至尊礼包
PP_YILEWAN1=843;
PP_YILEWAN2=844;
PP_CHENGZUAN_KAITONG=845;	--橙钻开通礼包
PP_CHENGZUAN_MR1=846;		--橙钻每日礼包1
PP_CHENGZUAN_MR2=847;		--橙钻每日礼包2
PP_CHENGZUAN_MR3=848;		--橙钻每日礼包3
PP_5399LB_VIP3=849;		--5399VIP3礼包
PP_WUZUNXY=850;                 --xy武尊乱世枭雄礼包
PP_2144LB_SVIP=851;             --2144武尊超级会员礼包
PP_2144LB_BIRTHDAY=852;         --2144武尊生日礼包
PP_SHUJIA37=853;                --37暑假礼包
PP_GUANJUNLB=854;               --37世界杯冠军礼包
PP_JINRUHCBZ=855;               --皇城宝藏提示
PP_5399LB_ZHOUNIAN=856;			--5399武尊周年庆礼包
PP_37LB_QIXIXIAO=857;			--37七夕小礼包
PP_37LB_QIXIDA=858;			--37七夕大礼包
PP_LB_LUNTAN=859;			--论坛礼包
PP_QIHUHL=860;
PP_QIHUCX=861;
PP_QIHUKX=862;
PP_QIHUHH=863;
PP_XYZNKH=864;    --xy周年狂欢礼包
PP_XYZNYG=865;    --xy周年阳光普照礼包
PP_LINGHUNSHILB=866;    --2323wan灵魂石礼包
PP_XINGSHILB=867;       --2323wan星石礼包
PP_XUANJINGLB=868;      --2323wan超级玄晶礼包

PP_YINGPAIHUIGUI=869;      --硬派回归礼包
PP_YINGPAIHUIKUI=870;      --硬派回馈礼包
PP_YINGPAICHOUJIANG=871;   --硬派抽奖礼包
PP_YINGPAICHANGXIANG=872;  --硬派畅想抽奖礼包
PP_YINGPAIHAOHUA=873;      --硬派豪华兑换礼包

PP_GANENXIAO=874;           --360感恩小礼包
PP_GANENDA=875;             --360感恩大礼包
PP_GANENHAOHUA=876;         --360感恩豪华包

PP_CHONGWEN=877;           --37重温经典
PP_HANCHANG=878;           --37酣畅淋漓
PP_ZUOYONG=879;            --37坐拥天下

PP_WZHUANLE=880;           --37欢乐礼包
PP_WZZHUANSHU=881;         --37专属礼包

-------------------------------------------------------------------------------achieve
PP_LAST_LOGINDAY=997;
PP_ACHIEVE_LOGINDAYS=998;
PP_MONKILL_NUMBER=999;
--出入江湖
PP_ACHIEVE_FIRSTMON=1001;
PP_ACHIEVE_FIRSTGROUP=1002;
PP_ACHIEVE_FIRSTFRIEND=1003;
--PP_ACHIEVE_FIRSTFUBEN=1004;
PP_ACHIEVE_FIRSTXUNBAO=1005;
PP_ACHIEVE_FIRSTZUOQI=1006;
PP_ACHIEVE_FIRSTGUANZHI=1007;
PP_ACHIEVE_FIRSTQHUA=1008;
PP_ACHIEVE_FIRSTJLIAN=1009;
PP_ACHIEVE_FIRSTQLING=1010;
PP_ACHIEVE_FIRSTGUILD=1011;
PP_ACHIEVE_FIRSTBOSS=1012;
--降妖除魔
PP_ACHIEVE_MON10=1013;
PP_ACHIEVE_MON1B=1014;
PP_ACHIEVE_MON1K=1015;
PP_ACHIEVE_MON1W=1016;
PP_ACHIEVE_MON10W=1017;
PP_ACHIEVE_MON1BW=1018;
PP_ACHIEVE_MON2BW=1019;
PP_ACHIEVE_MON5BW=1020;
PP_ACHIEVE_MON1KW=1021;
--击杀BOSS
PP_ACHIEVE_KILLNMJZ=1022;
PP_ACHIEVE_KILLNMJH=1023;
PP_ACHIEVE_KILLXEWG=1024;
PP_ACHIEVE_KILLXLS=1025;
PP_ACHIEVE_KILLMMJZ=1026;
PP_ACHIEVE_KILLMMJH=1027;
PP_ACHIEVE_KILLMHJZ=1028;
PP_ACHIEVE_KILLMNW=1029;
PP_ACHIEVE_KILLNMSJ=1030;

PP_ACHIEVE_KILLYYJG=1031;
PP_ACHIEVE_KILLYYXM=1032;
PP_ACHIEVE_KILLMYZS=1033;
PP_ACHIEVE_KILLJLTM=1034;
PP_ACHIEVE_KILLHDMJ=1035;
PP_ACHIEVE_KILLSRMS=1036;
PP_ACHIEVE_KILLDYYM=1037;
PP_ACHIEVE_KILLLREM=1038;
PP_ACHIEVE_KILLGGMW=1039;

--坐骑进阶
PP_ACHIEVE_ZUOQI1=1040;
PP_ACHIEVE_ZUOQI2=1041;
PP_ACHIEVE_ZUOQI3=1042;
PP_ACHIEVE_ZUOQI4=1043;
PP_ACHIEVE_ZUOQI5=1044;
PP_ACHIEVE_ZUOQI6=1045;
PP_ACHIEVE_ZUOQI7=1046;
PP_ACHIEVE_ZUOQI8=1047;
PP_ACHIEVE_ZUOQI9=1048;
PP_ACHIEVE_ZUOQI10=1049;
PP_ACHIEVE_ZUOQI11=1050;
PP_ACHIEVE_ZUOQI12=1051;
--官职
PP_ACHIEVE_GUANZHI1=1052;
PP_ACHIEVE_GUANZHI2=1053;
PP_ACHIEVE_GUANZHI3=1054;
PP_ACHIEVE_GUANZHI4=1055;
PP_ACHIEVE_GUANZHI5=1056;
PP_ACHIEVE_GUANZHI6=1057;
PP_ACHIEVE_GUANZHI7=1058;
PP_ACHIEVE_GUANZHI8=1059;
PP_ACHIEVE_GUANZHI9=1060;
PP_ACHIEVE_GUANZHI10=1061;
PP_ACHIEVE_GUANZHI11=1062;
PP_ACHIEVE_GUANZHI12=1063;
--心法
PP_ACHIEVE_XINFA1=1064;
PP_ACHIEVE_XINFA5=1065;
PP_ACHIEVE_XINFA10=1066;
PP_ACHIEVE_XINFA15=1083;
PP_ACHIEVE_XINFA20=1067;
PP_ACHIEVE_XINFA25=1084;
PP_ACHIEVE_XINFA30=1068;
PP_ACHIEVE_XINFA35=1069;
PP_ACHIEVE_XINFA40=1070;
PP_ACHIEVE_XINFA45=1071;
PP_ACHIEVE_XINFA50=1072;
--登陆累计
PP_ACHIEVE_LOGIN1=1073;
PP_ACHIEVE_LOGIN2=1074;
PP_ACHIEVE_LOGIN3=1075;
PP_ACHIEVE_LOGIN4=1076;
PP_ACHIEVE_LOGIN5=1077;
PP_ACHIEVE_LOGIN6=1078;
PP_ACHIEVE_LOGIN7=1079;
PP_ACHIEVE_LOGIN8=1080;
PP_ACHIEVE_LOGIN9=1081;
PP_ACHIEVE_LOGIN10=1082;

PP_SHENQI_JINJIE_TIMES =1088;--清明打折进阶次数限制
-------------------------------------------------------------------------------seven day activity
SEVEN_DAY_ACTIVITY_LB = 1100;
SEVEN_DAY_ACTIVITY_WQ = 1101;
SEVEN_DAY_ACTIVITY_ZSCH = 1102;
SEVEN_DAY_ACTIVITY_VIPCARD = 1103;
SEVEN_DAY_ACTIVITY_GJJNS = 1104;
SEVEN_DAY_ACTIVITY_MSGY = 1105;
SEVEN_DAY_ACTIVITY_FHLP = 1106;
PP_LEIJI_LOGINDAYS=1107;
PP_JUDGE_NEW_HEFU=1108;
PP_XUANJIN_MAXSUBLV=1109;
-------------------------------------------------------------------------------精彩活动
PP_LEIJIXF=1120;
PP_LEIJIXF_DATE=1121;

PP_JC_MRSC1=1124;
PP_JC_MRSC2=1125;
PP_JC_MRSC3=1126;
PP_JC_MRSC4=1127;

PP_JC_MRLJCZ1=1130;
PP_JC_MRLJCZ2=1131;
PP_JC_MRLJCZ3=1132;
PP_JC_MRLJCZ4=1133;
PP_JC_MRLJCZ5=1134;
PP_JC_MRLJCZ6=1135;
PP_JC_MRLJCZ7=1136;

PP_JC_MRLJXF1=1139;
PP_JC_MRLJXF2=1140;
PP_JC_MRLJXF3=1141;
PP_JC_MRLJXF4=1142;
PP_JC_MRLJXF5=1143;
PP_JC_MRLJXF6=1144;
PP_JC_MRLJXF7=1145;

PP_JC_ZQSJ_TIMES=1148;
PP_JC_ZQSJ1=1149;
PP_JC_ZQSJ2=1150;
PP_JC_ZQSJ3=1151;
PP_JC_ZQSJ4=1152;

PP_JC_CBSJ_TIMES=1155;
PP_JC_CBSJ1=1156;
PP_JC_CBSJ2=1157;
PP_JC_CBSJ3=1158;
PP_JC_CBSJ4=1159;

PP_JC_FBSJ_TIMES=1162;
PP_JC_FBSJ1=1163;
PP_JC_FBSJ2=1164;
PP_JC_FBSJ3=1165;
PP_JC_FBSJ4=1166;

PP_JC_GZSJ_TIMES=1169;
PP_JC_GZSJ1=1170;
PP_JC_GZSJ2=1171;
PP_JC_GZSJ3=1172;
PP_JC_GZSJ4=1173;

PP_JC_TJSJ_TIMES=1184;
PP_JC_TJSJ1=1185;
PP_JC_TJSJ2=1186;
PP_JC_TJSJ3=1187;
PP_JC_TJSJ4=1188;
PP_JC_TJSJ5=1189;
PP_JC_TJSJ6=1190;
PP_JC_TJSJ7=1191;
PP_JC_TJSJ8=1192;

PP_JC_CHSJ_TIMES=1195;
PP_JC_CHSJ1=1196;
PP_JC_CHSJ2=1197;
PP_JC_CHSJ3=1198;
PP_JC_CHSJ4=1199;

PP_JC_GYSJ_TIMES=1202;
PP_JC_GYSJ1=1203;
PP_JC_GYSJ2=1204;
PP_JC_GYSJ3=1205;
PP_JC_GYSJ4=1206;

PP_JC_LPSJ_TIMES=1209;
PP_JC_LPSJ1=1210;
PP_JC_LPSJ2=1211;
PP_JC_LPSJ3=1212;
PP_JC_LPSJ4=1213;

PP_JC_CZJSSW=1215;
PP_JC_CZJSSW_TIMES=1216;
PP_JC_CZJSSW1=1217;

PP_JC_CZJSSJ=1219;
PP_JC_CZJSSJ_TIMES=1220;
PP_JC_CZJSSJ1=1221;

PP_JC_CZJSSL=1223;
PP_JC_CZJSSL_TIMES=1224;
PP_JC_CZJSSL1=1225;

PP_JC_CZJSSK=1227;
PP_JC_CZJSSK_TIMES=1228;
PP_JC_CZJSSK1=1229;

PP_JC_ZBQHFS_TIMES=1232;
PP_JC_ZBQHFS1=1233;
PP_JC_ZBQHFS2=1234;
PP_JC_ZBQHFS3=1235;
PP_JC_ZBQHFS4=1236;
PP_JC_ZBQHFS5=1237;
PP_JC_ZBQHFS6=1238;

PP_JC_MRXBJL=1240;
PP_JC_MRXBJL_TIME=1241;
PP_JC_MRXBJL1=1242;
PP_JC_MRXBJL2=1243;
PP_JC_MRXBJL3=1244;

PP_JC_MRQLHL=1246;
PP_JC_MRQLHL_TIME=1247;
PP_JC_MRQLHL1=1248;
PP_JC_MRQLHL2=1249;
PP_JC_MRQLHL3=1250;

PP_JC_BOSSJSPM_TIME=1252;
PP_JC_BOSSJSPM_RECEIVE1=1253;
PP_JC_BOSSJSPM_RECEIVE2=1254;
PP_JC_BOSSJSPM_RECEIVE3=1255;

PP_JC_SCCX_DATE=1256;
PP_JC_SCCX_TIMES1=1257;
PP_JC_SCCX_TIMES2=1258;
PP_JC_SCCX_TIMES3=1259;
PP_JC_SCCX_TIMES4=1260;
PP_JC_SCCX_TIMES5=1261;
PP_JC_SCCX_TIMES6=1262;
PP_JC_SCCX_TIMES7=1263;
PP_JC_SCCX_TIMES8=1264;

PP_JC_SJQG_DATE=1265;
PP_JC_SJQG_TIMES1=1266;
PP_JC_SJQG_TIMES2=1267;

PP_JC_ZQZK_DATE=1268
PP_JC_ZQZK_TIMES=1269

PP_JC_FBZK_DATE=1270
PP_JC_FBZK_TIMES=1271

PP_JC_XFZK_DATE=1272
PP_JC_XFZK_TIMES=1273

PP_HEISHI_7GONGJI_NUM=1274--黑市商品
PP_HEISHI_7WUFANG_NUM=1275
PP_HEISHI_7MOFANG_NUM=1276
PP_HEISHI_7SHENGMING_NUM=1277
PP_HEISHI_8BAOSHI_NUM=1278
PP_HEISHI_9BAOSHI_NUM=1279
PP_HEISHIT_50XINGYUNFU_NUM=1280
PP_HEISHI_5KW_JINGYAN_NUM=1281
PP_HEISHI_TODAY=1282

PP_LIANHUN_LEVEL=1283
PP_LIANHUN_XING=1284
-------------------------------------------------------------------------------玫瑰情人节
PP_ROSEDAY_HUIKUILB = 1285		--玫瑰情人节回馈礼包标识位
PP_ROSEDAY_CZFL_BIAOZHI = 1286		--玫瑰情人节充值返利标识位
--------------------------------------------------------------------------------

PP_GUILD_BUY1_1 = 1287
PP_GUILD_BUY1_2 = 1288
PP_GUILD_BUY2_1 = 1289
PP_GUILD_BUY2_2 = 1290
PP_GUILD_BUY2_3 = 1291
PP_GUILD_BUY2_4 = 1292
PP_GUILD_BUY3_1 = 1293
PP_GUILD_BUY3_2 = 1294
PP_GUILD_BUY3_3 = 1295
PP_GUILD_BUY4_1 = 1296
PP_GUILD_BUY4_2 = 1297
PP_GUILD_BUY4_3 = 1298
PP_GUILD_BUY5_1 = 1299


PP_JF_XUYUANCHI=1300--许愿池
PPC_XUYUANCHI_jifen=1301
PPC_XUYUANCHI_8gongji=1302
PPC_XUYUANCHI_8wufang=1303
PPC_XUYUANCHI_8mofang=1304
PPC_XUYUANCHI_8shengming=1305
-- PPC_XUYUANCHI_8baoshi=1306
-- PPC_XUYUANCHI_7baoshi=1307
-- PPC_XUYUANCHI_5gongji=1308
-- PPC_XUYUANCHI_5wufang=1309
-- PPC_XUYUANCHI_5mofang=1310
-- PPC_XUYUANCHI_5shengming=1311
-- PPC_XUYUANCHI_6baoshi=1312
-- PPC_XUYUANCHI_5baoshi=1313
-- PPC_XUYUANCHI_jinjieshi=1314
-- PPC_XUYUANCHI_xiuwei1000=1315
-- PPC_XUYUANCHI_chengjiu200=1316
-- PPC_XUYUANCHI_zuoqijingyandanda=1317
-- PPC_XUYUANCHI_2gongji=1318
-- PPC_XUYUANCHI_2wufang=1319
-- PPC_XUYUANCHI_2momian=1320
-- PPC_XUYUANCHI_2shengming=1321
PPC_XUYUANCHI_10baoshi=1306
PPC_XUYUANCHI_chaojizizhidan=1307
PPC_XUYUANCHI_6gongji=1308
PPC_XUYUANCHI_6shengming=1309
PPC_XUYUANCHI_6wufang=1310
PPC_XUYUANCHI_6mofang=1311
PPC_XUYUANCHI_zhenqidan10000=1312
PPC_XUYUANCHI_lingqizhu10000=1313
PPC_XUYUANCHI_shoulingjinghua10000=1314
PPC_XUYUANCHI_chaojizuoqidan=1315
PPC_XUYUANCHI_chaojizhengqidan=1316
PPC_XUYUANCHI_chaojijinjieshibao=1317
PPC_XUYUANCHI_shouhuzizhidan=1318
PPC_XUYUANCHI_shouhujinhuadan=1319
PPC_XUYUANCHI_jingyanzhu500=1320
PPC_XUYUANCHI_jingyanzhu200=1321

PPC_XUYUANSHOP_qicaishi=1322
PPC_XUYUANSHOP_babeibaodian=1323
PPC_XUYUANSHOP_sibeibaodian=1324
-- PPC_XUYUANSHOP_qifulingpaida=1325
-- PPC_XUYUANSHOP_qifulingpaizhong=1326
-- PPC_XUYUANSHOP_qifulingpaixiao=1327
PPC_XUYUANSHOP_xingyunshenfu50=1325
PPC_XUYUANSHOP_xingyunshenfu40=1326
PPC_XUYUANSHOP_xingyunshenfu30=1327
PPC_XUYUANSHOP_julingzhu=1328
PPC_XUYUANSHOP_zhuanshengshi=1329

PPC_HEISHI_7GONGJI_NUM=1330
PPC_HEISHI_7WUFANG_NUM=1331
PPC_HEISHI_7MOFANG_NUM=1332
PPC_HEISHI_7SHENGMING_NUM=1333
PPC_HEISHI_8BAOSHI_NUM=1334
PPC_HEISHI_9BAOSHI_NUM=1335
PPC_HEISHIT_50XINGYUNFU_NUM=1336
PPC_HEISHI_5KW_JINGYAN_NUM=1337
PPC_ACTIVE_KARDDUIHUAN=1338
PP_GUILD_BUY5_2 = 1339
-------------------------------------------------------------------------------svip
PP_SVIP_STATUS = 1350
-------------------------------------------------------------------------------37百服活动
PP_37BAIFU_HUIKUILB = 1351     --百服回馈礼包
PP_37BAIFU_XUNBAODH = 1352     --寻宝积分兑换真气丹
PP_37BAIFU_XUNBAODATE = 1353   --寻宝积分兑换真气丹日期判断
PP_37BAIFU_CHONGZHIFL = 1354   --百服每日充值返利
PP_37BAIFU_MRXFLJ1 = 1355
PP_37BAIFU_MRXFLJ2 = 1356
PP_37BAIFU_MRXFLJ3 = 1357
PP_37BAIFU_MRXFLJ4 = 1358
PP_37BAIFU_MRXFLJ5 = 1359
PP_37BAIFU_MRXFLJ6 = 1360
PP_37BAIFU_MRXFLJ7 = 1361
-------------------------------------------------------------------------------夏日活动
PP_XIARI_HUIKUILB = 1362		--夏日超值回馈礼包
PP_XIARI_MRCZFLLB = 1363		--夏日每日充值返利  
PP_XIARI_ZBQHFS1 = 1364         --夏日装备强化放送
PP_XIARI_ZBQHFS2 = 1365
PP_XIARI_ZBQHFS3 = 1366
PP_XIARI_ZBQHFS4 = 1367
PP_XIARI_ZBQHFS5 = 1368
PP_XIARI_ZBQHFS6 = 1369
-------------------------------------------------------------------------------合服活动
PP_HF_HFHKDLB = 1370
-------------------------------------------------------------------------------亲吻情人节
PP_KISSDAY_HUIKUILB = 1371
PP_KISSDAY_MRCZFLLB = 1372
PP_KISSDAY_BV_1 = 1373
PP_KISSDAY_BV_2 = 1374
PP_KISSDAY_BV_3 = 1375
PP_KISSDAY_BV_4 = 1376
PP_KISSDAY_BV_5 = 1377
PP_KISSDAY_BV_6 = 1378
PP_KISSDAY_HZ_FLAG = 1379
PP_KISSDAY_HZ_1 = 1380
PP_KISSDAY_HZ_2 = 1381
PP_KISSDAY_HZ_3 = 1382
PP_KISSDAY_HZ_4 = 1383
PP_KISSDAY_HZ_5 = 1384
PP_KISSDAY_HZ_DATE = 1385
PP_KISSDAY_BV_DATE = 1386
-------------------------------------------------------------------------------夏至活动
PP_XIAZHI_HUIKUILB = 1387
PP_XIAZHI_MRCZFLLB = 1388
PP_JIANLING_LV3 = 1389	--剑灵升级回馈
PP_JIANLING_LV4 = 1390
PP_JIANLING_LV5 = 1391
PP_JIANLING_LV6 = 1392
PP_JIANLING_LV7 = 1393
PP_JIANLING_LV8 = 1394
PP_JIANLING_LV9 = 1395
PP_JIANLING_LV10 = 1396
-------------------------------------------------------------------------------超级XX道具
PP_BAOJI_ZUOQIDAN = 1397
PP_BAOJI_JINJIESHI = 1398
PP_BAOJI_HUNJING = 1399
-------------------------------------------------------------------------------名人堂
PP_37WAN_MR_TAG = 1400
PP_37WAN_MR_DQSJ = 1401
-------------------------------------------------------------------------------超级XX道具
PP_BAOJI_CHONGWUDAN = 1402;
-------------------------------------------------------------------------------脚本活动
PP_KISSDAY_BV_7 = 1403
PP_KISSDAY_BV_8 = 1404
PP_KISSDAY_BV_9 = 1405
-------------------------------------------------------------------------------精彩活动
PP_JC_ZQSJ5=1410;
PP_JC_ZQSJ6=1411;
PP_JC_ZQSJ7=1412;
PP_JC_ZQSJ8=1413;
PP_JC_ZQSJ9=1414;
PP_JC_ZQSJ10=1415;
PP_JC_ZQSJ11=1416;
PP_JC_ZQSJ12=1417;

PP_JC_CBSJ5=1418;
PP_JC_CBSJ6=1419;
PP_JC_CBSJ7=1420;
PP_JC_CBSJ8=1421;

PP_JC_FBSJ5=1422;
PP_JC_FBSJ6=1423
PP_JC_FBSJ7=1424;
PP_JC_FBSJ8=1425;

PP_JC_GZSJ5=1426;
PP_JC_GZSJ6=1427;
PP_JC_GZSJ7=1428;
PP_JC_GZSJ8=1429;

PP_JC_TJSJ9=1430;
PP_JC_TJSJ10=1431;
PP_JC_TJSJ11=1432;
PP_JC_TJSJ12=1433;

PP_JC_CHSJ5=1434;
PP_JC_CHSJ6=1435;
PP_JC_CHSJ7=1436;
PP_JC_CHSJ8=1437;

PP_JC_GYSJ5=1438;
PP_JC_GYSJ6=1439;
PP_JC_GYSJ7=1440;
PP_JC_GYSJ8=1441;

PP_JC_LPSJ5=1442;
PP_JC_LPSJ6=1443;
PP_JC_LPSJ7=1444;
PP_JC_LPSJ8=1445;
-------------------------------------------------------------------------------理财
PP_LICAI_CONGZHI=1500;
PP_LICAI_LB1=1501;
PP_LICAI_LB2=1502;
PP_LICAI_LB3=1503;
PP_LICAI_LB4=1504;
PP_LICAI_LB5=1505;
PP_LICAI_LB6=1506;
PP_LICAI_FANLI1=1507;
PP_LICAI_FANLI2=1508;
PP_LICAI_FANLI3=1509;
PP_LICAI_FANLI4=1510;
--------------------------------------------------------------------------------世界杯
PP_WCUP_XUNZHANG=1511;
PP_WCUP_A1=1512;
PP_WCUP_A2=1513;
PP_WCUP_A3=1514;
PP_WCUP_A4=1515;
PP_WCUP_B1=1516;
PP_WCUP_B2=1517;
PP_WCUP_B3=1518;
PP_WCUP_B4=1519;
PP_WCUP_C1=1520;
PP_WCUP_C2=1521;
PP_WCUP_C3=1522;
PP_WCUP_C4=1523;
PP_WCUP_D1=1524;
PP_WCUP_D2=1525;
PP_WCUP_D3=1526;
PP_WCUP_D4=1527;
PP_WCUP_E1=1528;
PP_WCUP_E2=1529;
PP_WCUP_E3=1530;
PP_WCUP_E4=1531;
PP_WCUP_F1=1532;
PP_WCUP_F2=1533;
PP_WCUP_F3=1534;
PP_WCUP_F4=1535;
PP_WCUP_G1=1536;
PP_WCUP_G2=1537;
PP_WCUP_G3=1538;
PP_WCUP_G4=1539;
PP_WCUP_H1=1540;
PP_WCUP_H2=1541;
PP_WCUP_H3=1542;
PP_WCUP_H4=1543;
PP_WCUP_CANYU=1544;
PP_WCUP_CANYUJIANGLI=1546;
-------------------------------------------------------------------------------老玩家回归
PP_HG_IS_RECEIVE=1550;
PP_NEW_SVRMEG_TAG=1551;
-------------------------------------------------------------------------------
PP_SHOULING_LEVEL=1552;--坐骑兽灵等级
PP_SHOULING_JINGHUA=1553;--兽灵精华数量
PP_SHOULING_JINGHUA_BIND=1554;--兽灵精华每日数量
-------------------------------------------------------------------------------player temp param
PP_PET_ACTIVE_POS=1555;
PP_PETJINJIE_TIMES=1556;	--宠物一键进阶折扣
PP_PETJINJIE_DATE=1557;	--宠物一键进阶折扣日期记录
---------------------------------------------------------------------------------暑假活动
PP_JIANLINGJINJIE_TIMES = 1558
PP_LIANHUN_LV5 = 1559
PP_LIANHUN_LV10 = 1560
PP_LIANHUN_LV15 = 1561
PP_LIANHUN_LV20 = 1562
PP_LIANHUN_LV25 = 1563
PP_SHUJIASALE_DATE = 1564
PP_SHUJIASALE_TIMES1 = 1565
PP_SHUJIASALE_TIMES2 = 1566
PP_SHUJIASALE_TIMES3 = 1567
PP_SHUJIASALE_TIMES4 = 1568
PP_SHUJIASALE_TIMES5 = 1569
PP_SHUJIASALE_TIMES6 = 1570
PP_SHUJIA_MRCZFLLB = 1571
PP_JIANLINGJINJIE_DATE = 1572
---------------------------------------------------------------------------------充点小钱
PP_CZAWARD_1 = 1573
PP_CZAWARD_2 = 1574
PP_CZAWARD_3 = 1575
PP_CZAWARD_4 = 1576
PP_CONGZHI_TJ = 1577
---------------------------------------------------------------------------------魔族宝库活动
PP_SHOULING_LV10 = 1578		--兽灵升级回馈10级奖励标记（成就类型奖励）
PP_SHOULING_LV20 = 1579
PP_SHOULING_LV30 = 1580
PP_SHOULING_LV35 = 1581
PP_SHOULING_LV40 = 1582
PP_SHOULING_LV45 = 1583
PP_SHOULING_LV50 = 1584
---------------------------------------------------------------------------------ChinaJoy
PP_SHOULINGJINJIE_DATE = 1585
PP_SHOULINGJINJIE_TIMES = 1586
PP_SHUJIASALE_TIMES7 = 1587
PP_SHUJIASALE_TIMES8 = 1588
PP_SHUJIASALE_TIMES9 = 1589
PP_SHUJIASALE_TIMES10 = 1590
PP_SHUJIASALE_TIMES11 = 1591
PP_SHUJIASALE_TIMES12 = 1592
PP_SHUJIASALE_TIMES14 = 1707
---------------------------------------------------------------------------------
PP_CWJHDB = 1593  --宠物进化丹包
PP_SHUJIASALE_TIMES13 = 1594
PP_CWJYD_DATE = 1595  --宠物经验丹打折
PP_CWJYD_TIMES1 = 1596
PP_CWJYD_TIMES2 = 1597
PP_ACTIVITY_CZFLAG = 1598--活动期间累计充值标识
PP_ACTIVITY_CHONGZHI = 1599--活动期间累计充值
PP_ACTIVITY_SHENKUI = 1600--活动期间累计充值奖励标识
----------------------------------------------------------------------------------

----封魔岭---
PP_FENGMOLING_I=1601;
PP_FENGMOLING_J=1602;
PTP_FENGMO_MON_NUMBER=1603;
PP_FMKILL_EXP=1604;
PP_FENGMO_KILL_NUM=1605;
PP_FMKILL_MON=1607;
PP_FMSHUA_PM=1608;
PP_FML_NUM=1609;
PP_FENGML_DAY=1610;
PP_FENGMOLING_GONGJIAN_NUM = 1611;
PP_FENGMOLING_YUSHINUM=1612;
PP_FENGMOLING_YUSHINUM_HIGHEST=1613;
PP_SHOUWEI_NUM=1614;
PP_FMKILL_EXP_HIGHEST=1615;

PP_PERSONAL_YUSHI=1616;--玉石原石

PP_PETJINJIE_DATE=1617;--宠物进阶打折变量重置标识
PP_PETJINJIE_TIMES=1618;--宠物进阶打折每日总次数

----龙城秘宝----
PP_DRAGON_LONG_JING=1619;
PP_DRAGON_RED_LONG_JING=1620;
PP_DRAGON_JI_FENG=1621;
PP_DRAGON_BINDVCOIN=1622;
PP_DRAGON_LAYER=1623;
PP_DRAGON_STAET_STEP=1624;
PP_DRAGON_WARN=1625;

PP_MOONCAKE_DATE=1626;
PP_MOONCAKE_TIMES=1627;

PP_YUPEIJJ_LV5=1628;
PP_YUPEIJJ_LV6=1629;
PP_YUPEIJJ_LV7=1630;
PP_YUPEIJJ_LV8=1631;
PP_YUPEIJJ_LV9=1632;
PP_YUPEIJJ_LV10=1633;
PP_YUPEIJJ_LV11=1634;
PP_YUPEIJJ_LV12=1635;

PP_PERSONAL_XINGCHEN=1636;--星尘数值

--夺宝奇兵
PP_DUOBAO_TEN=1637;
PP_DUOBAO_GET=1638;
PP_DUOBAO_FIRST=1639;
PP_DUOBAO_FLAG=1640;
PP_DUOBAO_TOTAL=1641;
PP_DUOBAO_PAIHANGLQ=1642;


PP_DUOBAO_AREA11=1643;
PP_DUOBAO_AREA12=1644;
PP_DUOBAO_AREA13=1645;
PP_DUOBAO_AREA14=1646;
PP_DUOBAO_AREA15=1647;
PP_DUOBAO_AREA16=1648;
PP_DUOBAO_AREA17=1649;
PP_DUOBAO_AREA18=1650;

PP_DUOBAO_AREA21=1651;
PP_DUOBAO_AREA22=1652;
PP_DUOBAO_AREA23=1653;
PP_DUOBAO_AREA24=1654;
PP_DUOBAO_AREA25=1655;
PP_DUOBAO_AREA26=1656;
PP_DUOBAO_AREA27=1657;
PP_DUOBAO_AREA28=1658;

PP_DUOBAO_AREA31=1659;
PP_DUOBAO_AREA32=1660;
PP_DUOBAO_AREA33=1661;
PP_DUOBAO_AREA34=1662;
PP_DUOBAO_AREA35=1663;
PP_DUOBAO_AREA36=1664;
PP_DUOBAO_AREA37=1665;
PP_DUOBAO_AREA38=1666;

PP_DUOBAO_AREA41=1667;
PP_DUOBAO_AREA42=1668;
PP_DUOBAO_AREA43=1669;
PP_DUOBAO_AREA44=1670;
PP_DUOBAO_AREA45=1671;
PP_DUOBAO_AREA46=1672;
PP_DUOBAO_AREA47=1673;
PP_DUOBAO_AREA48=1674;

PP_DUOBAO_AREA51=1675;
PP_DUOBAO_AREA52=1676;
PP_DUOBAO_AREA53=1677;
PP_DUOBAO_AREA54=1678;
PP_DUOBAO_AREA55=1679;
PP_DUOBAO_AREA56=1680;
PP_DUOBAO_AREA57=1681;
PP_DUOBAO_AREA58=1682;

PP_DUOBAO_AREA61=1683;
PP_DUOBAO_AREA62=1684;
PP_DUOBAO_AREA63=1685;
PP_DUOBAO_AREA64=1686;
PP_DUOBAO_AREA65=1687;
PP_DUOBAO_AREA66=1688;
PP_DUOBAO_AREA67=1689;
PP_DUOBAO_AREA68=1690;

PP_DUOBAO_AREA71=1691;
PP_DUOBAO_AREA72=1692;
PP_DUOBAO_AREA73=1693;
PP_DUOBAO_AREA74=1694;
PP_DUOBAO_AREA75=1695;
PP_DUOBAO_AREA76=1696;
PP_DUOBAO_AREA77=1697;
PP_DUOBAO_AREA78=1698;

PP_DUOBAO_AREA81=1699;
PP_DUOBAO_AREA82=1700;
PP_DUOBAO_AREA83=1701;
PP_DUOBAO_AREA84=1702;
PP_DUOBAO_AREA85=1703;
PP_DUOBAO_AREA86=1704;
PP_DUOBAO_AREA87=1705;
PP_DUOBAO_AREA88=1706;

PP_DUOBAO_KUANG=1708;
PP_DUOBAO_TOP1=1709;
PP_DUOBAO_TOP2=1710;
PP_DUOBAO_TOP3=1711;
PP_DUOBAO_TOP4=1712;
PP_DUOBAO_TOP5=1713;
PP_DUOBAO_TOP6=1714;

PP_DUOBAO_XULIE1=1715;
PP_DUOBAO_XULIE2=1716;
PP_DUOBAO_XULIE3=1717;
PP_DUOBAO_XULIE4=1718;
PP_DUOBAO_XULIE5=1719;
PP_DUOBAO_XULIE6=1720;
PP_DUOBAO_XULIE7=1721;
PP_DUOBAO_XULIE8=1722;
PP_DUOBAO_XULIE9=1723;
PP_DUOBAO_XULIE10=1724;
PP_DUOBAO_BAD=1725;
PP_DUOBAO_GOOD=1726;
PP_DUOBAO_ONTIME=1727;
PP_DUOBAO_YIJIAN=1728;

--自动弹窗
PP_AUTO_TANCHUANG=1729;

PP_DUOBAO_TOTAL_CHONGZHI=1730;

--装备灵魂石
PP_LINGHUNSHI_NUM=1731;
PP_LINGHUNHAOLI_FALG=1732;
PP_ZBLINGHUNSHI_BIND=1733;
PP_YUPEIJJ_LVFLAG=1734

PP_LINHUNJJ_LVFLAG=1740
PP_LINHUNJJ_LV20=1741
PP_LINHUNJJ_LV30=1742
PP_LINHUNJJ_LV40=1743
PP_LINHUNJJ_LV50=1744
PP_LINHUNJJ_LV60=1745
PP_LINHUNJJ_LV70=1746

PP_SHOULINGJJ_LVFLAG=1750

PP_PETHUIKUIRESET=1760
PP_PETHUIKUI1=1761
PP_PETHUIKUI2=1762
PP_PETHUIKUI3=1763
PP_PETHUIKUI4=1764
PP_PETHUIKUI5=1765

PP_PETZZHUIKUIRESET=1770
PP_PETZZHUIKUI1=1771
PP_PETZZHUIKUI2=1772
PP_PETZZHUIKUI3=1773
PP_PETZZHUIKUI4=1774
PP_PETZZHUIKUI5=1775
PP_PETZZHUIKUI6=1776

----------------------------------------------------------------------------------返利盛典
PP_FANLISHENGDIAN_LEIJI5000=1780;
PP_FANLISHENGDIAN_LEIJI10000=1781;
PP_FANLISHENGDIAN_LEIJI100000=1782;
PP_FANLISHENGDIAN_LEIJI300000=1783;
PP_FANLISHENGDIAN_LEIJI500000=1784;
PP_FANLISHENGDIAN_LEIJI1500000=1785;
PP_FANLISHENGDIAN_CZ=1786;
PP_FANLISHENGDIAN_TOTAL=1787;
PP_FANLISHENGDIAN_FLAG=1788;

--------------------------------------------------------------------------------------
PP_LIANHUNLB_LV5=1790
PP_LIANHUNLB_LV10=1791
PP_LIANHUNLB_LV15=1792
PP_LIANHUNLB_LV20=1793
PP_LIANHUNLB_LV25=1794

PP_BAOJI_LINHUNSHI=1800
PP_KUAFU_TIME=1900
PP_KUAFU_JL_TIME=1901

PP_PIFENGSJ_LV5=1910
PP_PIFENGSJ_LV6=1911
PP_PIFENGSJ_LV7=1912
PP_PIFENGSJ_LV8=1913
PP_PIFENGSJ_LV9=1914
PP_PIFENGSJ_LV10=1915
PP_PIFENGSJ_LV11=1916
PP_PIFENGSJ_LV12=1917

PP_HQXJBX_DATE=1920
PP_HQXJBX_T1=1921
PP_HQXJBX_T2=1922
PP_HQXJBX_T3=1923
PP_HQXJBX_T4=1924
PP_HQXJBX_T5=1925

PTP_ID_TIMER_GO=1;
PTP_ID_TIMER_GO_X=2;
PTP_ID_TIMER_GO_Y=3;
PTP_ID_TIMER_GO_MAP=6;
PTP_KAOHUO=10;
PTP_ZMT_AWARD=11;
PTP_ZMT3_AWARD=18;

PTP_ID_MOUNT_SELECTED=12;
PTP_ID_HC_POS=13;
PTP_ID_HC_ID=14;
PTP_ID_HC_NUM=15;
PTP_QANDA_QID=16;
PTP_QANDA_RET=17;

PTP_ACHIEVE_TITLE=21;
PTP_ACHIEVE_SELECTED=22;
PTP_XUYUANXHI_XIANSHI=23;--xuyuanchi
PTP_SHILIAN_AWARD=24;
PTP_PET_ACTIVE_POS=25;
-------------------------------------------------------------------------------player timer id
PT_GO=1;
PT_MAYA=2;
PT_MIJING=3;
PT_HUODUI=4;
PT_SMZC=5;
PT_SAIZI=7;
PT_YMSY=8;
PT_UMOUNT=10;
PT_FUYUAN=11;
PT_XUYUANCHI=15;
-------------------------------------------------------------------------------task id
TASK_ID_FUBEN_SEXP=2001;
TASK_ID_RICHANG=3002;
TASK_ID_RICHANG2=3003;
TASK_ID_RICHANG3=3004;
TASK_ID_FUBEN_I=3001;
TASK_ID_TIE=3010;
TASK_ID_ZMT=2002;
TASK_ID_FUBEN_GUILD=2003;
TASK_ID_ZMT3=2004;
TASK_ID_SHILIAN=2005;
TASK_ID_FUBEN_FENGML=2006;
-------------------------------------------------------------------------------
NUM2HAN={[0]="零","一","二","三","四","五","六","七","八","九","十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十",};

-------装备铸魂 10个装备位置 变量用来记录装备位置的炼魂阶数
ZHUHUN_WEAPHONE=4001;
ZHUHUN_CLOTH=4002;
ZHUHUN_HAT=4003;
ZHUHUN_RING1=4004;
ZHUHUN_RING2=4005;
ZHUHUN_GLOVE1=4006;
ZHUHUN_GLOVE2=4007;
ZHUHUN_NICKLACE=4008;--项链
ZHUHUN_BELT=4009;--腰带
ZHUHUN_BOOT=4010;--鞋子

PP_ZHUHHUN20=4011;
PP_ZHUHHUN40=4012;
PP_ZHUHHUN60=4013;
PP_ZHUHHUN80=4014;
PP_ZHUHHUN90=4015;
PP_ZHUHHUN100=4016;
PP_ZHUHHUN110=4017;
PP_ZHUHHUN120=4018;

--天晶战场
PP_ZHANCHANG_TIMER=4030;
PP_ZHANCHANG_CHETYPE=4031;
PP_ZHANCHANG_NIMING=4032;
PP_COUNT_SHENMOZHANCHANG=4033;

--人间大炮
PPC_CANNON_NUM1=4034;
PPC_CANNON_NUM2=4035;

--领地争夺
PP_GUILD_KBONUS_LIMIT=4040;
PP_GUILD_FIGHT_ENTER=4041;
PP_GUILD_FIGHT_BONUS1=4042;
PP_GUILD_FIGHT_BONUS2=4043;
PP_GUILD_FIGHT_BONUS3=4044;
PP_GUILD_FIGHT_BONUS4=4045;
PP_GUILD_FIGHT_BONUS5=4046;
PP_GUILD_ENTER_DAY=4047;
PP_HUODONG_REFRESH=4048;
PP_GUILD_WEEKDAY=4049;
PP_GUILD_BONUS_TODAY=4050;

---天书碎片
PP_TIANSHU_SUIPIAN=4060;

-------------活跃度相关----------------
PP_HUOYUEDU_JIFEN=4070;

PP_HUOYUEDU_LQ_FLAG1=4071;
PP_HUOYUEDU_LQ_FLAG2=4072;
PP_HUOYUEDU_LQ_FLAG3=4073;
PP_HUOYUEDU_LQ_FLAG4=4074;

PP_HUOYUEDU_NUM1=4075;
PP_HUOYUEDU_NUM2=4076;
PP_HUOYUEDU_NUM3=4077;
PP_HUOYUEDU_NUM4=4078;
PP_HUOYUEDU_NUM5=4079;
PP_HUOYUEDU_NUM6=4080;
PP_HUOYUEDU_NUM7=4081;
PP_HUOYUEDU_NUM8=4082;
PP_HUOYUEDU_NUM9=4083;
PP_HUOYUEDU_NUM10=4084;
PP_HUOYUEDU_NUM11=4085;
PP_HUOYUEDU_NUM12=4086;
PP_HUOYUEDU_NUM13=4087;

-------投资计划相关------------
PP_TOUZI_LQ_FLAG_ZQ=4100;
PP_TOUZI_LQ_FLAG_FB=4101;
PP_TOUZI_LQ_FLAG_XW=4102;
PP_TOUZI_LQ_FLAG_XJ=4103;
PP_TOUZI_LQ_FLAG_JY=4104;
PP_TOUZI_LQ_FLAG_SZ=4105;
PP_TOUZI_TYPE=4106;
PP_TOUZI_IS1=4107;
PP_TOUZI_IS2=4108;
PP_TOUZI_IS3=4109;
PP_TOUZI_IS4=4110;
PP_TOUZI_IS5=4111;
PP_TOUZI_IS6=4112;

--披风 天蚕---
PP_PERSONAL_TIANCAN=4120;

--春节钜惠
PP_CHUNJIEJUHUI_JULINGZHU_NUM=4130
PP_CHUNJIEJUHUI_4BEIBAODIAN_NUM=4131
PP_CHUNJIEJUHUI_8BEIBAODIAN_NUM=4132
PP_CHUNJIEJUHUI_YUSHIYUANSHI_NUM=4133
PP_CHUNJIEJUHUI_XINGSHI_NUM=4134
PP_CHUNJIEJUHUI_500ZHUANGBEILINGHUNSHI_NUM=4135
PP_CHUNJIEJUHUIT_TIANSHUJINGHUA_NUM=4136
PP_CHUNJIEJUHUI_TIANCANJINGHUA_NUM=4137
PP_CHUNJIEJUHUI_TODAY=4138

--福袋
PP_CHUZHI_LIMIT1=4140;
PP_CHUZHI_LIMIT2=4141;
PP_CHUZHI_LIMIT3=4142;
PP_CHUZHI_LIMIT4=4143;
PP_CHUZHI_LIMIT5=4144;
PP_CHUZHI_LIMIT6=4145;
PP_CHUZHI_LIMIT7=4146;
PP_CHUZHI_LIMIT8=4147;