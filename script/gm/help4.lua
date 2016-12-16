module(..., package.seeall)

function mrhuodong(player,param100)
	Show_tt(player,1);
end

local hd_data_bte = {
	[1] = {name="『10:00-10:59』",funb = function(a,b) t_contente(a,b); end},
	[2] = {name="『11:00-12:59』",funb = function(a,b) t_contente(a,b); end},
	[3] = {name="『13:00-13:59』",funb = function(a,b) t_contente(a,b); end},
	[4] = {name="『14:00-14:59』",funb = function(a,b) t_contente(a,b); end},
	[5] = {name="『15:00-16:59』",funb = function(a,b) t_contente(a,b); end},
	[6] = {name="『17:00-17:59』",funb = function(a,b) t_contente(a,b); end},
	[7] = {name="『18:00-18:59』",funb = function(a,b) t_contente(a,b); end},
	[8] = {name="『19:00-19:59』",funb = function(a,b) t_contente(a,b); end},
	[9] = {name="『20:00-20:59』",funb = function(a,b) t_contente(a,b); end},
	[10] = {name="『22:00-23:59』",funb = function(a,b) t_contente(a,b); end},
	[11] = {name="『00:00-08:00』",funb = function(a,b) t_contente(a,b); end},
}

function Show_tt(player,id)
	for i = 1,#hd_data_bte do
		if i == id then
			player:echo("--------------<br><font color='#ffaaee'>"..hd_data_bte[i].name .."</font><br>");
		else
			player:echo("--------------<br><a href='event:talk_te"..i.."'>" .. hd_data_bte[i].name .."</a><br>");
		end
	end
		player:echo("--------------");
	player:listtalk_list(200);
	hd_data_bte[id].funb(player,id);
	player:listtalk_content(200);
	player:listtalk_title("",200);
end


function t_contente(player,id)
	if id == 1 then help41(player,id); end
	if id == 2 then help42(player,id); end
	if id == 3 then help43(player,id); end
	if id == 4 then help44(player,id); end
	if id == 5 then help45(player,id); end
	if id == 6 then help46(player,id); end
	if id == 7 then help47(player,id); end
	if id == 8 then help48(player,id); end
	if id == 9 then help49(player,id); end
	if id == 10 then help410(player,id); end
	if id == 11 then help411(player,id); end
end


function onTalkte1(player) Show_tt(player,1); end
function onTalkte2(player) Show_tt(player,2); end
function onTalkte3(player) Show_tt(player,3); end
function onTalkte4(player) Show_tt(player,4); end
function onTalkte5(player) Show_tt(player,5); end
function onTalkte6(player) Show_tt(player,6); end
function onTalkte7(player) Show_tt(player,7); end
function onTalkte8(player) Show_tt(player,8); end
function onTalkte9(player) Show_tt(player,9); end
function onTalkte10(player) Show_tt(player,10); end
function onTalkte11(player) Show_tt(player,11); end

function help41(player,id)
	if id == 1 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">冰火岛活动</font>       需要等级: [<font color="#FF0000">50</font>]级

活动时间: <font color="#ff0000">10:00-10:30</font>

活动说明: <font color="#FFff00">1. 每人每天可以进入冰火岛采集20次矿石
          2. 小型矿石可获得2-4个进阶石,少量经验
          3. 大型矿石可获得6-12个进阶石,大量经验</font>
地图说明:
          <font color="#FFff00">1. 冰火岛地图模式为允许自由PK模式
          2. 人物死亡后有一定几率掉落身上装备</font>
---------------------------------------------------
活动名称: <font color="#FFFF00">怪物攻城</font>         活动时间: <font color="#ff0000">10:30</font>

活动说明: <font color="#FFaa00">巨灵石窟的[巨灵天魔]带领魔界大军强袭
          王城,妄图统治全人类,勇士们是时候出击
          了!消灭恶魔,匡扶人间正道!</font>
          <font color="#FF0000">快去消灭BOSS,获取极品装备的时机到了!</font>

掉落物品: <font color="#FF0000">巨灵天魔有几率掉落本服务器所有套装</font>

                               <a href="event:talk_rywc">点击立刻前往王城</a>
---------------------------------------------------]]);
	end
end

function help42(player,id)
	if id == 2 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">死亡禁地</font>       需要等级: [<font color="#FF0000">45</font>]级

活动时间: <font color="#ff0000">开区一天后的[11:15-11:45]</font>

活动说明: <font color="#FFaa00">在死亡禁地有大量的BOSS,传说<font color="#FF0000">消灭死亡禁
          地的[禁地魔王]将会获得顶级天龙套装哦!</font>
          由于死亡禁地的BOSS过多,勇士们要小心!</font>

掉落物品: <font color="#FF0000">死亡禁地可以掉落本服务器的所有装备!</font>

                               <a href="event:talk_swjd">点击进入死亡禁地</a>
---------------------------------------------------
活动名称: <font color="#FFFF00">泡温泉</font>         活动时间: <font color="#ff0000">12:00-12:30</font>

活动说明: <font color="#FFaa00">活动开始后,您可以从云霄城[<a href="event:local_goto_v002_50_93_温泉老板娘">温泉老板娘</a>]
          进入温泉哦!<font color="#FF0000">泡温泉可以获得大量经验!</font>另
          外您还可以在温泉里抓鱼哦!同样也可以获
          得大量经验!</font>
	
其他说明: <font color="#FF0000">另外抓的鱼也可以卖给商店换取绑定金币</font>
---------------------------------------------------]]);
	end
end

function onTalkswjd(player)
	if server.get_temp_var("swjd") == "1" then
		if player:get_level() >= 45 then
			player:enter_map("swjd1",217,226);
			go.givehuicheng(player);
		else
		player:alert(1,1,"由于死亡禁地过于凶险,你还是[45级]以后再进入吧!");
		Show_tt(player,2);
		end
	else
		player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!<br>开启时间:11点15分,16点15分,22点15分");
		Show_tt(player,2);
	end
end

function help43(player,id)
	if id == 3 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">武林争霸</font>         需要等级: [<font color="#FF0000">45</font>]级

开启时间: <font color="#FF0000">开区一天后每天的[13:00]</font>

活动时间: <font color="#FFFF00">13:00-13:10</font>为报名时间(禁止PK)
          <font color="#FFFF00">13:10-14:00</font>为比赛时间(自由PK)

规则说明: <font color="#FFaa00">
          武林争霸大厅内自由PK,死亡不掉装备
          当争霸大厅只剩1人时则成为武林盟主</font>

活动奖励: <font color="#FF0000">活动开始,大厅所有人获得大量经验和荣誉</font>

盟主特权: <font color="#C0FF3E">专用封号: <font color='#FF00FF'>★武林盟主★</font>
          荣誉增加: <font color='#FF00ff'>10000点</font>
          属性提升: 攻击+300 魔法+300 道术+300
          多倍经验: 杀怪经验1.5倍</font>

点击进入: <a href="event:talk_wlzb">立刻进入武林争霸大厅</a>
---------------------------------------------------]]);
	end
end

function onTalkwlzb(player)
	if server.get_temp_var("wlzb") == "2" then
			player:alert(1,1,"武林争霸活动已经开始,入口已经关闭");
			Show_tt(player,3);
	else
		if player:get_map():get_id() == "wlzb" then
			player:alert(1,1,"你已经在武林争霸大厅咯!!");
		else
			if server.get_temp_var("wlzb") == "1" then
				if player:get_level() >= 40 then
				local map = server.find_map("wlzb");
					local x,y;
					x,y=map:gen_rand_position();
					if( x and y )then
						player:enter_map("wlzb",x,y);
					end
					player:alert(1,1,"武林争霸赛将于[13:10]正式开始!请做好准备!")
					server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了武林争霸大厅!");
				else
				player:alert(1,1,"对不起,参与武林争霸活动需要达到40级!");
				Show_tt(player,3);
				end
			else
				player:alert(1,1,"现在不是报名时间,请到报名时间再来找我吧!");
				Show_tt(player,3);
			end
		end
	end
end

function help44(player,id)
	if id == 4 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">送财童子</font>       活动时间: <font color="#ff0000">14:00</font>

活动说明: <font color="#FFaa00">在[云霄城]和[沙漠土城]会随机出现4个送
          财童子,可以获得大量的金币奖励哦!还有
          几率掉落金条哦!</font>

掉落物品: <font color="#FFaa00">每个送财童子将随机掉落[80-150]万金币</font>
          <font color="#FF0000">送财童子掉落的金币为自由捡取模式!</font>
---------------------------------------------------
活动名称: <font color="#FFFF00">天魔兽来袭</font>     活动时间: <font color="#FF0000">14:30</font>

需要等级: 进入神器宝阁需要[<font color="#FF0000">45</font>]级

活动说明: <font color="#FFaa00">在土城的[<a href="event:local_goto_v003_128_102_神器使者">神器使者</a>]可以进入[神器宝阁]
          <font color="#FF0000">[神器宝阁]里将会出现邪恶的上古魔兽[天
          魔兽]</font>,传说只有消灭天魔兽的勇士才可以
          获得神器积分,而神器积分可以兑换服务器
          顶级神器!</font>

掉落物品: <font color="#FFaa00">最高可掉落顶级至尊套装,大量神器积分!</font>
          <font color="#FF0000">天魔兽死亡掉落的物品为自由捡取模式!</font>
---------------------------------------------------]]);
	end
end

function help45(player,id)
	if id == 5 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">全服双倍经验</font>   活动时间: <font color="#ff0000">15:00-16:00</font>

友情提醒: <font color="#ee00ee">由于双倍经验特殊效果,开区一天后开启</font>

活动说明: <font color="#FFaa00">为了感谢广大玩家对我们的支持和厚爱!我
          们推出全服双倍活动,活动期间全服打怪经
          验增加1倍哦!</font>

其他说明: <font color="#FF0000">活动期间使用多倍宝典,打怪经验增加1倍!</font>
---------------------------------------------------
活动名称: <font color="#FFFF00">死亡禁地</font>       活动时间: <font color="#ff0000">16:15-16:45</font>

需要等级: 进入死亡禁地需要[<font color="#FF0000">45</font>]级

活动说明: <font color="#FFaa00">在死亡禁地有大量的BOSS,传说<font color="#FF0000">消灭死亡禁
          地的[禁地魔王]将会获得顶级天龙套装哦!</font>
          由于死亡禁地的BOSS过多,勇士们要小心!</font>

掉落物品: <font color="#FF0000">死亡禁地可以掉落本服务器的所有装备!</font>

                               <a href="event:talk_swjd5">点击进入死亡禁地</a>
---------------------------------------------------]]);
	end
end

function onTalkswjd5(player)
	if server.get_temp_var("swjd") == "1" then
		if player:get_level() >= 45 then
			player:enter_map("swjd1",217,226);
			go.givehuicheng(player);
		else
		player:alert(1,1,"由于死亡禁地过于凶险,你还是[45级]以后再进入吧!");
		Show_tt(player,5);
		end
	else
		player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!<br>开启时间:11点15分,16点15分,22点15分");
		Show_tt(player,5);
	end
end

function help46(player,id)
	if id == 6 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">冰火岛活动</font>       需要等级: [<font color="#FF0000">50</font>]级

活动时间: <font color="#ff0000">17:00-17:30</font>

活动说明: <font color="#FFff00">1. 每人每天可以进入冰火岛采集20次矿石
          2. 小型矿石可获得2-4个进阶石,少量经验
          3. 大型矿石可获得6-12个进阶石,大量经验</font>
地图说明:
          <font color="#FFff00">1. 冰火岛地图模式为允许自由PK模式
          2. 人物死亡后有一定几率掉落身上装备</font>
---------------------------------------------------
活动名称: <font color="#FFFF00">天魔兽来袭</font>     活动时间: <font color="#FF0000">17:30</font>

需要等级: 进入神器宝阁需要[<font color="#FF0000">45</font>]级

活动说明: <font color="#FFaa00">在土城的[<a href="event:local_goto_v003_128_102_神器使者">神器使者</a>]可以进入[神器宝阁]
          <font color="#FF0000">[神器宝阁]里将会出现邪恶的上古魔兽[天
          魔兽]</font>,传说只有消灭天魔兽的勇士才可以
          获得神器积分,而神器积分可以兑换服务器
          顶级神器!</font>

掉落物品: <font color="#FFaa00">最高可掉落顶级至尊套装,大量神器积分!</font>
          <font color="#FF0000">天魔兽死亡掉落的物品为自由捡取模式!</font>
---------------------------------------------------]]);
	end
end

function help47(player,id)
	if id == 7 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">泡温泉</font>         活动时间: <font color="#ff0000">18:00-18:30</font>

活动说明: <font color="#FFaa00">活动开始后,您可以从云霄城[<a href="event:local_goto_v002_50_93_温泉老板娘">温泉老板娘</a>]
          进入温泉哦!<font color="#FF0000">泡温泉可以获得大量经验!</font>另
          外您还可以在温泉里抓鱼哦!同样也可以获
          得大量经验!</font>
	
其他说明: <font color="#FF0000">另外抓的鱼也可以卖给商店换取绑定金币</font>
---------------------------------------------------
活动名称: <font color="#FFFF00">麒麟圣殿</font>       活动时间: <font color="#ff0000">18:45-18:50</font>

需要等级: 进入麒麟圣殿需要[<font color="#FF0000">45</font>]级

活动说明: <font color="#FFaa00">消灭麒麟圣兽将会掉落大量坐骑经验丹,还
          有几率掉落[天龙套装]!</font>
          <font color="#FF0000">麒麟死亡时,圣殿所有人[坐骑经验+50000]</font>

死亡掉落: <font color="#FFff00">麒麟圣兽为死亡自由捡取模式</font>

点击进入: <a href="event:talk_jrqlsd7">点击此处进入[麒麟圣域]</a>
---------------------------------------------------]]);
	end
end





function onTalkjrqlsd7(player)
	if server.get_temp_var("qlsd") == "1" then
		if player:get_map():get_id() == "qlsd" then
			player:alert(1,1,"你已经在麒麟圣殿咯!!");
		else
			if player:get_level() >= 45 then
				local map = server.find_map("qlsd");
				local x,y;
				x,y=map:gen_rand_position();
				if( x and y )then
					player:enter_map("qlsd",x,y);
					go.givehuicheng(player);
				end
			else
			player:alert(1,1,"由于麒麟圣殿过于凶险,您还是[45级]以后再进入吧!");
			end
		end
	else
		player:alert(1,1,"对不起,目前[麒麟圣殿]入口尚未打开!");
	end
end



function help48(player,id)
	if id == 8 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">天魔兽来袭</font>     活动时间: <font color="#FF0000">19:30</font>

需要等级: 进入神器宝阁需要[<font color="#FF0000">45</font>]级

活动说明: <font color="#FFaa00">在土城的[<a href="event:local_goto_v003_128_102_神器使者">神器使者</a>]可以进入[神器宝阁]
          <font color="#FF0000">[神器宝阁]里将会出现邪恶的上古魔兽[天
          魔兽]</font>,传说只有消灭天魔兽的勇士才可以
          获得神器积分,而神器积分可以兑换服务器
          顶级神器!</font>

掉落物品: <font color="#FFaa00">最高可掉落顶级至尊套装,大量神器积分!</font>
          <font color="#FF0000">天魔兽死亡掉落的物品为自由捡取模式!</font>
---------------------------------------------------]]);
	end
end


function help49(player,id)
	if id == 9 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">怪物攻城</font>         活动时间: <font color="#ff0000">20:30</font>

活动说明: <font color="#FFaa00">巨灵石窟的[巨灵天魔]带领魔界大军强袭
          王城,妄图统治全人类,勇士们是时候出击
          了!消灭恶魔,匡扶人间正道!</font>
          <font color="#FF0000">快去消灭BOSS,获取极品装备的时机到了!</font>

掉落物品: <font color="#FF0000">巨灵天魔有几率掉落本服务器所有套装</font>

                               <a href="event:talk_rywc">点击立刻前往王城</a>
---------------------------------------------------]]);
	end
end

function onTalkrywc(player)
	if player:get_level() >= 35 then
		player:enter_map("v005",57,103);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去王城??还是35级以后再去吧!");
		Show_tt(player,9);
	end
end

function help410(player,id)
	if id == 10 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">死亡禁地</font>       需要等级: [<font color="#FF0000">45</font>]级

活动时间: <font color="#ff0000">开区1天后的[22:15-22:45]</font>

活动说明: <font color="#FFaa00">在死亡禁地有大量的BOSS,传说<font color="#FF0000">消灭死亡禁
          地的[禁地魔王]将会获得顶级天龙套装哦!</font>
          由于死亡禁地的BOSS过多,勇士们要小心!</font>

掉落物品: <font color="#FF0000">死亡禁地可以掉落本服务器的所有装备!</font>

                               <a href="event:talk_swjd8">点击进入死亡禁地</a>
---------------------------------------------------
活动名称: <font color="#FFFF00">怪物攻城</font>         活动时间: <font color="#ff0000">23:00</font>

活动说明: <font color="#FFaa00">混沌魔域的[混沌魔君]带领魔界大军强袭
          王城,妄图统治全人类,勇士们是时候出击
          了!消灭恶魔,匡扶人间正道!</font>

掉落物品: <font color="#FF0000">混沌魔君有几率掉落本服务器所有套装</font>

                               <a href="event:talk_rywc8">点击立刻前往王城</a>
---------------------------------------------------]]);
	end
end

function onTalkswjd8(player)
	if server.get_temp_var("swjd") == "1" then
		if player:get_level() >= 45 then
			player:enter_map("swjd1",217,226);
			go.givehuicheng(player);
		else
		player:alert(1,1,"由于死亡禁地过于凶险,你还是[45级]以后再进入吧!");
		Show_tt(player,10);
		end
	else
		player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!<br>开启时间:11点15分,16点15分,22点15分");
		Show_tt(player,10);
	end
end


function onTalkrywc8(player)
	if player:get_level() >= 35 then
		player:enter_map("v005",57,103);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去王城??还是35级以后再去吧!");
		Show_tt(player,10);
	end
end



function help411(player,id)
	check_mijing_day(player);
	if id == 11 then
		player:echo([[---------------------------------------------------
活动名称: <font color="#FFFF00">苦练修行</font>       活动时间: <font color="#ff0000">00:00-08:00</font>

需要等级: 进入练级场需要[<font color="#FF0000">40</font>]级

地图说明: 练级场禁止PK,死亡不掉任何装备

剩余时间: 你今天的练级场修行时间还剩[<font color="#FF0000">]]..(const.MIJING_MAX_NUM-util.ppn(player,const.PP_MIJING_NUM))..[[</font>]分钟

          <font color="#FF0000">会员每天的练级场修炼时间为[24]小时</font>

活动说明: <font color="#FFaa00">在沙漠土城有一处练级场,适合40级以上的
          勇士进行修行!为了加快您的修行步伐,在
          每天[00:00-08:00]期间练级场打怪将获得
          [1.2倍]经验!</font>

其他说明: <font color="#FF0000">活动期间使用多倍宝典,效果可以叠加</font>

                                 <a href="event:talk_lianji">点击进入练级场</a>
---------------------------------------------------]]);
	end
end


local data={
	{need_lv=40,  map_name="mijing40";};
	{need_lv=50,  map_name="mijing50";};
	{need_lv=60,  map_name="mijing60";};
	{need_lv=70,  map_name="mijing70";};
	{need_lv=80,  map_name="mijing80";};
	{need_lv=90,  map_name="mijing90";};
	{need_lv=100, map_name="mijing100";};
};


function onTalklianji(player)
	local mn = "";
	for i=1,#data do
		if data[i].need_lv <= player:get_level() then
			mn= data[i].map_name;
		end
	end
	if mn ~= "" then
		if const.MIJING_MAX_NUM > util.ppn(player,const.PP_MIJING_NUM) then
			player:enter_map(mn,300,300);
		else
			player:alert(1,1,"您的练级场修炼时间不足,无法进入练级场!");
			Show_tt(player,11);
		end
	end
	player:alert(1,1,"您的修炼时间还剩:"..const.MIJING_MAX_NUM - util.ppn(player,const.PP_MIJING_NUM)+1 .."分钟");
end

function check_mijing_day(player)
	if util.ppn(player,const.PP_MIJING_DAY) ~= today() then
		player:set_param(const.PP_MIJING_DAY,today());
		player:set_param(const.PP_MIJING_NUM,0);
		if util.ppn(player,const.PP_HUIYUAN) >= today() then player:set_param(const.PP_MIJING_NUM,util.ppn(player,const.PP_MIJING_NUM)-960); end;
	end
end