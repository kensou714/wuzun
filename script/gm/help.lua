module(..., package.seeall)

function wyexp(player,param100)
	Show_tt(player,1);
end

local hd_data_bta = {
	[1] = {name="单人副本(经验)",funb = function(a,b) t_contenta(a,b); end},
	[2] = {name="降妖除魔(经验)",funb = function(a,b) t_contenta(a,b); end},
	[3] = {name="擒贼擒王(经验)",funb = function(a,b) t_contenta(a,b); end},
	[4] = {name="闯通天塔(经验)",funb = function(a,b) t_contenta(a,b); end},
	[5] = {name="押运镖车(经验)",funb = function(a,b) t_contenta(a,b); end},
	[6] = {name="喝酒烤火(经验)",funb = function(a,b) t_contenta(a,b); end},
	[7] = {name="勇闯魔塔(经验)",funb = function(a,b) t_contenta(a,b); end},
	[8] = {name="百花争艳(金币)",funb = function(a,b) t_contenta(a,b); end},
	[9] = {name="矿区采矿(金币)",funb = function(a,b) t_contenta(a,b); end},
}

function Show_tt(player,id)
	for i = 1,#hd_data_bta do
		if i == id then
			player:echo("--------------<br><font color='#ffaaee'>"..hd_data_bta[i].name .."</font><br>");
		else
			player:echo("--------------<br><a href='event:talk_tb"..i.."'>" .. hd_data_bta[i].name .."</a><br>");
		end
	end
		player:echo("--------------");
	player:listtalk_list(200);
	hd_data_bta[id].funb(player,id);
	player:listtalk_content(200);
	player:listtalk_title("",200);
end


function t_contenta(player,id)
	if id == 1 then help1(player,id); end
	if id == 2 then help2(player,id); end
	if id == 3 then help3(player,id); end
	if id == 4 then help4(player,id); end
	if id == 5 then help5(player,id); end
	if id == 6 then help6(player,id); end
	if id == 7 then help7(player,id); end
	if id == 8 then help8(player,id); end
	if id == 9 then help9(player,id); end
end


function onTalktb1(player) Show_tt(player,1); end
function onTalktb2(player) Show_tt(player,2); end
function onTalktb3(player) Show_tt(player,3); end
function onTalktb4(player) Show_tt(player,4); end
function onTalktb5(player) Show_tt(player,5); end
function onTalktb6(player) Show_tt(player,6); end
function onTalktb7(player) Show_tt(player,7); end
function onTalktb8(player) Show_tt(player,8); end
function onTalktb9(player) Show_tt(player,9); end

function help1(player,id)
	if id == 1 then
		player:echo([[----------------------------------------------------
副本名称: 奴玛神庙   剩余次数:今天还可挑战[<font color="#ff0000">]]..(const.RAIN_SEXP_MAX_NUM1 - util.ppn(player,const.PP_RAIN_SEXP_NUM1) )..[[</font>]次

需要等级: [<font color="#ff0000">45</font>]级     副本经验:<font color="#ff0000">]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*181)..[[</font>

主要掉落: <font color="#ffff00">材料,40级套装,天地系列</font>     <a href="event:local_goto_v003_99_122_副本使者">前往挑战副本</a>
----------------------------------------------------
副本名称: 猛犸神殿   剩余次数:今天还可挑战[<font color="#ff0000">]]..(const.RAIN_SEXP_MAX_NUM2 - util.ppn(player,const.PP_RAIN_SEXP_NUM2) )..[[</font>]次

需要等级: [<font color="#ff0000">50</font>]级     副本经验:<font color="#ff0000">]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*363)..[[</font>

主要掉落: <font color="#ffff00">材料,天地系列,凌云套装</font>     <a href="event:local_goto_v003_99_122_副本使者">前往挑战副本</a>
----------------------------------------------------
副本名称: 蛮牛大殿   剩余次数:今天还可挑战[<font color="#ff0000">]]..(const.RAIN_SEXP_MAX_NUM3 - util.ppn(player,const.PP_RAIN_SEXP_NUM3) )..[[</font>]次

需要等级: [<font color="#ff0000">55</font>]级     副本经验:<font color="#ff0000">]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*569)..[[</font>

主要掉落: <font color="#ffff00">材料,凌云套装,惊世套装</font>     <a href="event:local_goto_v003_99_122_副本使者">前往挑战副本</a>
----------------------------------------------------
副本名称: 妖月巢穴   剩余次数:今天还可挑战[<font color="#ff0000">]]..(const.RAIN_SEXP_MAX_NUM4 - util.ppn(player,const.PP_RAIN_SEXP_NUM4) )..[[</font>]次

需要等级: [<font color="#ff0000">60</font>]级     副本经验:<font color="#ff0000">]]..(math.min(80,player:get_level())*math.min(80,player:get_level())*735)..[[</font>

主要掉落: <font color="#ffff00">材料,凌云套装,惊世套装</font>     <a href="event:local_goto_v003_99_122_副本使者">前往挑战副本</a>
----------------------------------------------------]]);
	end
end



function help2(player,id)
	if id == 2 then
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>降妖除魔</b></font>

需要等级: [<font color="#ff0000">40</font>]级

剩余次数: 今天还可接受[<font color="#ff0000">]].. const.RICHANG_MAX_NUM - util.ppn(player,const.PP_RICHANG_NUM) .. [[</font>]次任务.

任务说明: 
          苍茫大地,妖魔四起,值此乱世之秋,希望你
          能尽自己的一份绵薄之力以造福苍生!你愿
          意帮助我降妖除魔吗?

接受任务: <a href="event:local_goto_v003_65_107_伏魔使者">点击前往土城找伏魔使者接受任务</a>
----------------------------------------------------
<p><font color="#ffcc00">任务奖励:</font></p>
<p>##荣誉## ]]..math.floor(math.min(80,player:get_level())*21.3)..[[</p>
<p><font color="#ffcc00">##经验## ]]..math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*102.17)..[[</p></font>
]]);
	end
end


function help3(player,id)
	if id == 3 then
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>擒贼擒王</b></font>

需要等级: [<font color="#ff0000">45</font>]级

剩余次数: 今天还可接受[<font color="#ff0000">]].. const.RICHANG2_MAX_NUM - util.ppn(player,const.PP_RICHANG2_NUM) .. [[</font>]次任务.

任务说明: 
          百年前的那场大战.伤及我百姓无数.此仇
          永世不共戴天!为了彻底摧毁它们的残余势
          力.现需要你去消灭它们的首领!少侠现在
          就上路吧!

接受任务: <a href="event:local_goto_v003_117_104_赏金猎人">点击前往土城找赏金猎人接受任务</a>
----------------------------------------------------
<p><font color="#ffcc00">任务奖励:</font></p>
<p><font color="#ffcc00">##经验## ]]..math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*101.97)..[[</p></font>
<p>##绑定元宝## 100</p>
]]);
	end
end


function help4(player,id)
	if id == 4 then
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>勇闯通天塔</b></font>

需要等级: [<font color="#ff0000">45</font>]级

剩余次数: 今天还可进入通天塔[<font color="#FF0000">]]..const.ZMT_MAX_NUM-util.ppn(player,const.PP_ZMT_NUM)..[[</font>]次

<font color="#FFff00">闯塔说明:

          1. 每三层通天塔都将会出现一个BOSS守关!

          2. 每通关三层通天塔都将获得大量的经验!

          3. 必须杀完每层所有怪物才可以进入下层!

          4. 每通关任何一层都将会获得经验的奖励!

          5. 全部通关12层通天塔将会获得特殊奖励!</font>

前往闯塔: <a href="event:local_goto_v003_108_113_通天塔使者">点击前往土城找通天塔使者闯塔</a>
----------------------------------------------------]]);
	end
end

function help5(player,id)
	if id == 5 then
	local qtbc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*4.079);
	local hjbc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*8.159);
	local lybc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*16.319);
	local zjbc = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*32.638);
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>运送物资</b></font>

需要等级: [<font color="#ff0000">45</font>]级

押镖次数: 您今天还可以押运镖车[<font color='#ff0000'>]].. (const.YABIAO_MAX_NUM - util.ppn(player,const.PP_YABIAO_NUM) ) ..[[</font>]次

押镖经验: <font color="#ffaa00">等级越高,经验越多</font>(<font color="#ee00ee">押镖令在副本和BOSS获得</font>)

          <font color='#00ff00'>青铜镖车</font> (<s='r'>经验:]]..qtbc..[[</s>) 需要:青铜镖令

          <font color='#FFff00'>黄金镖车</font> (<s='r'>经验:]]..hjbc..[[</s>) 需要:黄金镖令
	 
          <font color='#3300FF'>蓝玉镖车</font> (<s='r'>经验:]]..lybc..[[</s>) 需要:蓝玉镖令

          <font color='#EE00EE'>紫金镖车</font> (<s='r'>经验:]]..zjbc..[[</s>) 需要:紫金镖令

运镖提醒: <font color='#FFff00'>镖车被劫只可获得[60%]的经验</font>

                            <a href="event:local_goto_v003_47_107_夏镖头">立刻前往镇远镖局押镖</a>
----------------------------------------------------]]);
	end
end



function help6(player,id)
	local jiu= math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*80*0.0636*60);
	if id == 6 then
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>喝酒烤火</b></font>

需要等级: [<font color="#ff0000">45</font>]级

剩余次数: 您今天还可饮酒[<font color='#ff0000'>]]..const.JIU_MAX_NUM-util.ppn(player,const.PP_JIU_NUM)..[[</font>]瓶

饮酒经验: <font color="#ffaa00">等级越高,经验越多</font>(<font color="#ee00ee">女儿红在副本和BOSS获得</font>)

          <font color='#00ff00'>女儿红</font>        (<s='r'>经验:]]..jiu..[[</s>)

          <font color='#FFff00'>女儿红(5年)</font>   (<s='r'>经验:]]..(jiu*2)..[[</s>)

          <font color='#3300FF'>女儿红(10年)</font>  (<s='r'>经验:]]..(jiu*4)..[[</s>)

          <font color='#EE00EE'>女儿红(20年)</font>  (<s='r'>经验:]]..(jiu*8)..[[</s>)

饮酒提醒: <font color='#FFff00'>饮酒后需要在土城安全区才可获得经验</font>
----------------------------------------------------]]);
	end
end


function help7(player,id)
	if id == 7 then
		local llevel = math.ceil(player:get_level()/5);
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>勇闯魔塔</b></font>

当前拥有: ]]..util.ppn(player,const.PP_SUOYAOTA_PAI)..[[ 块镇魔令牌

<font color="#ff0000">闯塔需要: ]]..llevel..[[ 块(等级越高需越多)镇魔令</font>

          <a href="event:talk_enterzmt">进入1号镇魔塔</a>      <a href="event:talk_enterzmt">进入2号镇魔塔</a>
								         
          <a href="event:talk_enterzmt">进入3号镇魔塔</a>      <a href="event:talk_enterzmt">进入4号镇魔塔</a>

<font color="#ff00ff">今天还可进入镇魔塔</font>: ]]..util.ppn(player,const.PP_ZHENMOTACISHU)..[[次

魔塔说明:
          <font color="#87ba55">镇魔塔每层奖励:</font> 超大量经验
          <font color="#87ba55">镇魔塔终极奖励:</font> 四品玄铁 2块
          <font color="#87ba55">镇魔塔闯关规则:</font> 杀完怪物才可进下层
----------------------------------------------------
镇魔令牌: <font color="#ff0000">在绑定元宝商城和元宝商城可以购买</font>
----------------------------------------------------]]);
	end
end



function onTalkenterzmt(player)
	local llevel = math.ceil(player:get_level()/5);
	if util.ppn(player,const.PP_ZHENMOTACISHU) >= 1 then
		if llevel <= util.ppn(player,const.PP_SUOYAOTA_PAI) then
			local m = find_empty_zmt(player,1);
			if m then
				--player:set_param(const.PP_ZHENMOTACISHU,util.ppn(player,const.PP_ZHENMOTACISHU)-1);
				player:set_param(const.PP_SUOYAOTA_PAI,util.ppn(player,const.PP_SUOYAOTA_PAI)-llevel);
				player:set_param(const.PP_SUOYAOTA_AWARD,0);
				player:set_param(const.PP_ZMT3_LV,1);
				player:enter_map(m:get_id(),27,35);
				go.givehuicheng(player);
			else
				player:alert(1,1,"由于闯关人数过多,请稍后再试!") ;
			end
		else
			player:alert(1,1,"你的镇魔令不足"..llevel.."个(镇魔令可以在商铺购买)!") ;
		end
	else
		player:alert(1,1,"您今天进入镇魔塔的次数已经用完,无法再进入!") ;
	end
end
function find_empty_zmt(player,lv)
	local map=nil;
	for i=1,100 do
		--local id = math.fmod(lv,2)*50 + i;
		map = server.find_map("mtmt"..i);
		if map and map:num_player() < 1 then
			break;
		else
			map=nil;
		end
	end
	return map;
end



function help8(player,id)
	if id == 8 then
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>百花争艳</b></font>

需要等级: [<font color="#ff0000">45</font>]级

剩余次数: 今天还可以接受[<s='r'>]].. const.RICHANG3_MAX_NUM - util.ppn(player,const.PP_RICHANG3_NUM) .. [[</s>]次百花争艳任务

任务说明: 
          人们总说我人比花娇!少侠,此事你怎么看?
          好吧!看你也说不出个所以然.那你去帮我
          摘点花回来,我自有判断!

接受任务: <a href="event:local_goto_v002_53_131_百花仙子">前往云霄城找百花仙子接受百花争艳任务</a>
----------------------------------------------------
<p><font color="#ffcc00">任务奖励:</font></p>
<p>##绑定金币## 100000</p>
]]);
	end
end


function help9(player,id)
	if id == 9 then
		player:echo([[----------------------------------------------------
任务名称: <font color="#FFFF00"><b>矿区采矿</b></font>

需要等级: [<font color="#ff0000">40</font>]级

采矿说明: 
          采矿出售可以获得大量的金币,是本服务器
          主要金币来源之一!每种矿石的价格可都不
          一样哦!

矿石价格: 
          <font color="#ffff00">铁矿</font>    绑定金币:<font color="#ff0000">2070</font>
          <font color="#ffff00">铜矿</font>    绑定金币:<font color="#ff0000">4121</font>
          <font color="#ffff00">银矿</font>    绑定金币:<font color="#ff0000">6089</font>
          <font color="#ffff00">金矿</font>    绑定金币:<font color="#ff0000">8058</font>

          <font color="#ff00ff">挖取到的矿石根据种类将会自动重叠!</font>

前往采矿: <a href="event:talk_ckqy">点击此处立刻前往采矿区域</a>
----------------------------------------------------]]);
	end
end



function onTalkckqy(player)
	if  player:get_level()>= 40 then
		player:enter_map("jsd2",20,92);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去采矿??还是40级以后再说吧!");
		Show_tt(player,9);
	end
end
