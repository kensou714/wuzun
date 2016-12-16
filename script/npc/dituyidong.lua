module(..., package.seeall)
util.use_function(_M,task.task1000);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end

function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
	npc:echo([[您好,请选择您想前往的区域:
]]);
	npc:echo([[

城市区域:
  <a href="event:talk_aqq1">[边 界 村]</a>   <a href="event:talk_aqq2">[云 霄 城]</a>   <a href="event:talk_aqq3">[沙漠土城]</a>

  <a href="event:talk_aqq4">[孤 月 岛]</a>   <a href="event:talk_aqq5">[白 云 观]</a>   <a href="event:talk_aqq6">[荣耀王城]</a>

险恶区域:
  <a href="event:talk_xeqy1">[僵尸洞穴]</a>   <a href="event:talk_xeqy2">[奴玛寺庙]</a>   <a href="event:talk_xeqy3">[邪恶洞穴]</a>

  <a href="event:talk_xeqy4">[猪 妖 洞]</a>   <a href="event:talk_xeqy5">[猛犸寺庙]</a>   <a href="event:talk_xeqy6">[魔 魂 殿]</a>

　<a href="event:talk_xeqy7">[蛮 牛 洞]</a>   <a href="event:talk_xeqy8">[妖月峡谷]</a>   <a href="event:talk_lianyu1">[十八炼狱]</a>

恐怖区域:
  <a href="event:talk_kongbu1">[巨灵石窟]</a>   <a href="event:talk_kongbu2">[混沌之门]</a>   <a href="event:talk_kongbu3">[冰封雪域]</a>

  <a href="event:talk_kongbu4">[地狱熔岩]</a>   <a href="event:talk_kongbu5">[落日峡谷]</a>   <a href="event:talk_kongbu6">[神庙废墟]</a>

  <a href="event:talk_kongbu7">[天威魔狱]</a>   <a href="event:talk_kongbu8">[远古深渊]</a>   <a href="event:talk_kongbu9">[转生神殿]</a>

活动地图:
  <a href="event:talk_dtswjd">[死亡禁地]</a>   <a href="event:talk_qlsd">[麒麟圣殿]</a>   <a href="event:talk_bhdao">[冰 火 岛]</a>

  <a href="event:talk_entertjxx">[天晶战场]</a>   <a href="event:talk_guajilj">[挂机练级]</a>   <a href="event:talk_ygfx">[远古废墟]</a>

  <a href="event:talk_hcbz">[皇城宝藏]</a>

]]);
end





function onTalkbhdao(npc,player)
	npc:echo([[--------------------------------------
             <font color="#ff8000">冰火岛活动说明</font>
--------------------------------------
活动时间:
<font color="#FFff00">10:00-10:30  17:00-17:30  22:00-22:30</font>
--------------------------------------
进入需求: 
<font color="#FFff00">1. 进入需要玩家等级达到50级以上</font>
--------------------------------------
地图说明:
<font color="#FFff00">1. 冰火岛地图模式为允许自由PK模式
2. 人物死亡后有一定几率掉落身上装备</font>
--------------------------------------
活动说明:
<font color="#FFff00">1. 每人每天可以进入冰火岛采集20次矿石
2. 小型矿石可获得2-4个进阶石,少量经验
3. 大型矿石可获得6-12个进阶石,大量经验</font>
--------------------------------------
<font color="#FFaa00">您今天还可以采集: <font color="#FF0000">]]..(20-util.ppn(player,const.PP_CAIJIKUANGSHI))..[[次</font>矿石!</font>
--------------------------------------
点击进入: <a href="event:talk_jrbhdao">点击此处立刻进入冰火岛</a>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
  ]]);
end



function onTalkjrbhdao(npc,player)
	if server.get_temp_var("BHDAO") == "1" then
		if player:get_level() >= 50 then
			player:enter_map("binghuodao",13,141);

			--统计活跃度--
			player:set_param(const.PP_HUOYUEDU_NUM9,util.ppn(player,const.PP_HUOYUEDU_NUM9)+1);
			if util.ppn(player,const.PP_HUOYUEDU_NUM9)==2 then
				player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			end

			go.givehuicheng(player);
			if util.ppn(player,const.PP_JINRUBHDAO) ~= hour() then
				player:set_param(const.PP_JINRUBHDAO,hour());
				server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入了冰火岛!");
			end
		else
		player:alert(1,1,"想要进入冰火岛?你还是先到50级再说吧!!");
		onTalkbhdao(npc,player);
		end
	else
	player:alert(1,1,"对不起,冰火岛活动还没有开启,暂时无法进入!");
	onTalkbhdao(npc,player);
	end
end


function onTalkygfx(npc,player)
	npc:echo([[--------------------------------------
             <font color="#ff8000">远古废墟活动说明</font>
--------------------------------------
活动时间:
<font color="#FFff00">10:45-11:15  13:45-14:15  21:45-22:15</font>
--------------------------------------
进入需求: 
<font color="#FFff00">1. 进入需要玩家等级达到50级以上</font>
--------------------------------------
地图说明:
<font color="#FFff00">1. 远古废墟地图模式为允许自由PK模式
2. 人物死亡后有一定几率掉落身上装备</font>
--------------------------------------
活动说明:
<font color="#FFff00">1. 活动开启后，玩家可进入远古废墟，击杀怪物拾取宝物；
2. 强大的怪物有机会掉落更好的宝物；
3. 危险不仅来自怪物，也来自于你的对手</font>
--------------------------------------
点击进入: <a href="event:talk_jrygfx">点击此处立刻进入远古废墟</a>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
  ]]);
end



function onTalkjrygfx(npc,player)
	if server.get_temp_var("YGFX") == "1" then
		if player:get_level() >= 50 then
			player:enter_map("ygfx",61,163);

			--统计活跃度--
			player:set_param(const.PP_HUOYUEDU_NUM11,util.ppn(player,const.PP_HUOYUEDU_NUM11)+1);
			if util.ppn(player,const.PP_HUOYUEDU_NUM11)==2 then
				player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			end

			go.givehuicheng(player);
			if util.ppn(player,const.PP_JINRUYGFX) ~= hour() then
				player:set_param(const.PP_JINRUYGFX,hour());
				server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入了远古废墟!");
			end
		else
		player:alert(1,1,"想要进入远古废墟?你还是先到50级再说吧!!");
		onTalkygfx(npc,player);
		end
	else
		player:alert(1,1,"对不起,远古废墟活动还没有开启,暂时无法进入!");
		onTalkygfx(npc,player);
	end
end

function onTalkhcbz(npc,player)
	npc:echo([[--------------------------------------
             <font color="#ff8000">皇城宝藏活动说明</font>
--------------------------------------
活动时间:
<font color="#FFff00">每天 16:15-16:45</font>
--------------------------------------
进入需求:
<font color="#FFff00">1. 进入需要玩家等级达到50级以上</font>
--------------------------------------
地图说明:
<font color="#FFff00">1. 皇城宝藏地图模式为允许自由PK模式
2. 人物死亡后有一定几率掉落身上装备
3. 小心宝藏守卫，他们很强</font>
--------------------------------------
活动说明:
<font color="#FFff00"> 每人每天可以进入皇城宝藏击击杀摇钱树获得宝物
</font>
--------------------------------------
点击进入: <a href="event:talk_jrhcbz">点击此处立刻进入皇城宝藏</a>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------
  ]]);
end


function onTalkjrhcbz(npc,player)
	if server.get_temp_var("HCBZ") == "1" then
		if player:get_level() >= 50 then
			player:enter_map("hcbz",45,135);

			--统计活跃度--
			player:set_param(const.PP_HUOYUEDU_NUM10,util.ppn(player,const.PP_HUOYUEDU_NUM10)+1);
			if util.ppn(player,const.PP_HUOYUEDU_NUM10)==2 then
				player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
			end 
			
			go.givehuicheng(player);
			if util.ppn(player,const.PP_JINRUHCBZ) ~= hour() then
				player:set_param(const.PP_JINRUHCBZ,hour());
				server.info(10,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入了皇城宝藏!");
			end
		else
		player:alert(1,1,"想要进入皇城宝藏?你还是先到50级再说吧!!");
		onTalkhcbz(npc,player);
		end
	else
	player:alert(1,1,"对不起,皇城宝藏活动还没有开启,暂时无法进入!");
	onTalkhcbz(npc,player);
	end
end

function onTalkkongbu9(npc,player)
	if  player:get_level()>= 80 then
		player:enter_map("zssd1",64,88);
		if util.ppn(player,const.PP_ZHUANSHENGTISHI) ~= today() then
			player:set_param(const.PP_ZHUANSHENGTISHI,today())
			server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了转生神殿!");
			player:alert(11,1,"转生BOSS将在每天的[<font color='#FF0000'>16:45</font>]和[<font color='#FF0000'>21:30</font>]出现!!");
		end
		go.givehuicheng(player);
	else
		player:alert(1,1,"转生神殿极度凶险!还是80级以后再去吧!");
		onTalk100(npc,player);
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
function onTalkguajilj(npc,player)
	check_mijing_day(player);
	npc:echo([[--------------------------------------
地图名称: <font color="#FFFF00">练级场</font>(挂机地图)
--------------------------------------
地图说明: <font color="#FFaa00">禁止PK,死亡后不掉任何装备</font>
--------------------------------------
地图分配: <font color="#FFaa00">根据等级分配到对应的练级场</font>
--------------------------------------
需要等级: <font color="#FFaa00">进入练级场需要达到[<font color="#FF0000">40</font>]级</font>
--------------------------------------
剩余时间: <font color="#FFaa00">您今天的修炼时间还剩<font color="#FF0000">]]..(const.MIJING_MAX_NUM-util.ppn(player,const.PP_MIJING_NUM))..[[</font>分钟</font>
--------------------------------------
普通玩家: <font color="#FFaa00">每天系统赠送修炼时间480分钟</font>
--------------------------------------
会员玩家: <font color="#FFff00">每天可以[<font color="#FF0000">24小时</font>]无限制修炼!</font>
--------------------------------------
点击进入: <a href="event:talk_entermijing">进入练级场开始修炼</a>
--------------------------------------
                              <a href="event:talk_100">返回首页</a>
--------------------------------------]]);
end
function onTalkentermijing(npc,player)
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
			player:alert(1,1,"您今天的修炼时间不足,无法进入练级场!");
			onTalk100(npc,player);
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


function onTalkjrsmzcxx(npc,player)
if server.get_temp_var("smzc") == "1" then
	if player:get_level() >= 40 then
		local m=server.find_map("smzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 1 then
				if m:num_team_member(1)- m:num_team_member(2) >= 5 then
					player:alert(1,1,"对不起,神族阵营人数过多,请稍后再加入!");
					onTalksmzc(npc,player);
				else
					player:set_team_info(1,"神族阵营");
					player:enter_map("smzc",27,114);
					player:alert(1,1,"恭喜您成功加入神族阵营");
					player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00ff'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
			if util.ppn(player,const.PP_SMZCZHENY) == 2 then
				if m:num_team_member(2) - m:num_team_member(1) >= 5 then
					player:alert(1,1,"对不起,魔族阵营人数过多,请稍后再加入!");
					onTalksmzc(npc,player);
				else
					player:set_team_info(2,"魔族阵营");
					player:enter_map("smzc",109,30);
					player:alert(1,1,"恭喜您成功加入魔族阵营");
					player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
		else
		if m:num_team_member(2) >= m:num_team_member(1) then
			if m:num_team_member(2) == m:num_team_member(1) then
				local sj = math.random(1,2);
				if sj == 1 then
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,1);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_team_info(1,"神族阵营");
					player:enter_map("smzc",27,114);
					player:alert(1,1,"恭喜您成功加入神族阵营");
					player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				else
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,2);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_team_info(2,"魔族阵营");
					player:enter_map("smzc",109,30);
					player:alert(1,1,"恭喜您成功加入魔族阵营");
					player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,1);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_team_info(1,"神族阵营");
				player:enter_map("smzc",27,114);
				player:alert(1,1,"恭喜您成功加入神族阵营");
				player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
			end
		else
		player:set_param(const.PP_SMZCHOUR,hour());
		player:set_param(const.PP_SMZCZHENY,2);
		player:set_param(const.PP_SMZCKILL,0);
		player:set_param(const.PP_SMZCJIFEN,0);
		player:set_team_info(2,"魔族阵营");
		player:enter_map("smzc",109,30);
		player:alert(1,1,"恭喜您成功加入魔族阵营");
		player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
		end
	end
	else
	player:alert(1,1,"对不起,您的等级不足40级,无法进入!");
	onTalksmzc(npc,player);
	end
else
player:alert(1,1,"对不起,神魔战场没有开启,暂时无法进入!");
onTalksmzc(npc,player);
end
end


function onTalkjryzaaaxx(npc,player)
if server.get_temp_var("smzc") == "1" then
	if player:get_level() >= 40 then
		local m=server.find_map("smzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 1 then
				if m:num_team_member(1)-m:num_team_member(2) >= 5  then
					player:alert(1,1,"对不起,神族阵营人数过多,请稍后再加入!");
					onTalksmzc(npc,player);
				else
					player:set_team_info(1,"神族阵营");
					player:enter_map("smzc",27,114);
					player:alert(1,1,"恭喜您成功加入神族阵营");
					player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			else
				player:alert(1,1,"对不起,你已经加入魔族阵营!!");
				onTalksmzc(npc,player);
			end
		else
			if m:num_team_member(1)-m:num_team_member(2) >= 2  then
				player:alert(1,1,"对不起,神族阵营人数过多,请稍后再加入!");
				onTalksmzc(npc,player);
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,1);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_team_info(1,"神族阵营");
				player:enter_map("smzc",27,114);
				player:alert(1,1,"恭喜您成功加入神族阵营");
				player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
			end
		end
	else
	player:alert(1,1,"对不起,您的等级不足40级,无法进入!");
	onTalksmzc(npc,player);
	end
else
player:alert(1,1,"对不起,神魔战场尚未开启,暂时无法进入!");
onTalksmzc(npc,player);
end
end

function onTalkjrhzbbbxx(npc,player)
if server.get_temp_var("smzc") == "1" then
	if player:get_level() >= 40 then
		local m=server.find_map("smzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 2 then
				if m:num_team_member(2)-m:num_team_member(1) >= 2  then
					player:alert(1,1,"对不起,魔族阵营人数过多,请稍后再加入!");
					onTalksmzc(npc,player);
				else
					player:set_team_info(2,"魔族阵营");
					player:enter_map("smzc",109,30);
					player:alert(1,1,"恭喜您成功加入魔族阵营");
				player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			else
				player:alert(1,1,"对不起,你已经加入神族阵营!!");
				onTalksmzc(npc,player);
			end
		else
			if m:num_team_member(2)-m:num_team_member(1) >= 2  then
				player:alert(1,1,"对不起,魔族阵营人数过多,请稍后再加入!");
				onTalksmzc(npc,player);
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,2);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_team_info(2,"魔族阵营");
				player:enter_map("smzc",109,30);
				player:alert(1,1,"恭喜您成功加入魔族阵营");
				player:black_board(0,"","<br><b><font color='#FF7700'>神族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>魔族阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
			end
		end
	else
	player:alert(1,1,"对不起,您的等级不足40级,无法进入!");
	onTalksmzc(npc,player);
	end
else
player:alert(1,1,"对不起,神魔战场尚未开启,暂时无法进入!");
onTalksmzc(npc,player);
end
end

function onTalkentertjxx(npc,player)
	npc:echo([[<font color="#ff8000">天晶战场,邪神修罗王现世</font>

<font color="#ccbb77">战场时间</font>
<font color="#FFFF00">14:10-14:30   19:10-19:30</font>

<font color="#ccbb77">积分获取</font>
<font color="#FFaa00">击杀玩家,BOSS,完成运镖即可增加对应的积分</font>

<font color="#ccbb77">胜负判定</font>
<font color="#FFaa00">战场结束时根据各自阵营的积分判定胜负</font>

<font color="#ccbb77">BOSS刷新</font>
<font color="#FFaa00">战场开启后10分钟将出现上古BOSS[修罗王]</font>

<font color="#ccbb77">奖励说明</font>
<a href="event:talk_jlsm"><font color="#FFF280">点击查看战场奖励的方式和成就点数说明</font></a>

<font color="#ccbb77">进入战场</font>
<a href="event:talk_jretjzc">立刻进入天晶战场</a><font color="#FFaa00">(系统将随机分配阵营)</font>

<font color="#ccbb77">积分排名</font>
<font color="#FFaa00">本次战场积分第一:</font> [<font color="#FF00FF">]]..server.get_var("smzcpmc1")..[[</font>]
  
                         <font color="#ccbb77"><a href="event:talk_100">返回首页</a></font>]]);
end

function onTalkjlsm(npc,player)
	npc:echo([[              <font color="#ffff00">战场奖励说明</font>
<font color="#ccbb77">积分奖励:</font>
<font color="#FFaa00">战场结束时,将根据您的个人积分发放奖励</font>
<font color="#FFaa00">胜利方奖励是失败方的双倍,绑定元宝等等</font>

您的成就点数为: ]]..player:achieve_get_point()..[[ 点
<font color="#FFaae">开启霸气护体每天将消耗自身(1/100)成就</font>

<font color="#ccbb77">成就说明:</font>
<font color="#FFaa00">成就达到2000时     激活[<a href="event:talk_rzhj">人中豪杰</a>]称号</font>
<font color="#FFaa00">成就达到5000时     激活[<a href="event:talk_lsyx">乱世英雄</a>]称号</font>
<font color="#FFaa00">成就达到10000时    激活[<a href="event:talk_zszt">只手遮天</a>]称号</font>
<font color="#FFaa00">成就达到20000时    激活[<a href="event:talk_wzbf">威震八方</a>]称号</font>
<font color="#FFaa00">成就达到40000时    激活[<a href="event:talk_bsts">百胜天师</a>]称号</font>
<font color="#FFaa00">成就达到60000时    激活[<a href="event:talk_hsqj">横扫千军</a>]称号</font>
<font color="#FFaa00">成就达到100000时   激活[<a href="event:talk_wfmd">万夫莫敌</a>]称号</font>
<font color="#FFaa00">成就达到160000时   激活[<a href="event:talk_gsqx">盖世奇侠</a>]称号</font>
<font color="#FFaa00">成就达到220000时   激活[<a href="event:talk_slzs">杀戮之神</a>]称号</font>
<font color="#FFaa00">成就达到300000时   激活[<a href="event:talk_smbz">神魔霸主</a>]称号</font>

<font color="#FF0000">该称号将激活霸气护体,称号越高状态越强</font>

                         <font color="#ccbb77"><a href="event:talk_entertjxx">返回上一页</a></font>]]);
end


function onTalkrzhj(npc,player)
	player:alert(1,1,"获得[人中豪杰]称号将激活霸气护体,属性如下:<br>物理防御增加:3-5<br>魔法防御增加:2-3<br>物理攻击增加:6-10<br>魔法攻击增加:6-10<br>道术攻击增加:6-10");
	onTalkjlsm(npc,player);
end

function onTalklsyx(npc,player)
	player:alert(1,1,"获得[乱世英雄]称号将激活霸气护体,属性如下:<br>物理防御增加:6-10<br>魔法防御增加:4-6<br>物理攻击增加:12-20<br>魔法攻击增加:12-20<br>道术攻击增加:12-20");
	onTalkjlsm(npc,player);
end

function onTalkzszt(npc,player)
	player:alert(1,1,"获得[只手遮天]称号将激活霸气护体,属性如下:<br>物理防御增加:12-20<br>魔法防御增加:8-12<br>物理攻击增加:24-40<br>魔法攻击增加:24-40<br>道术攻击增加:24-40");
	onTalkjlsm(npc,player);
end

function onTalkwzbf(npc,player)
	player:alert(1,1,"获得[威震八方]称号将激活霸气护体,属性如下:<br>物理防御增加:18-30<br>魔法防御增加:12-18<br>物理攻击增加:36-60<br>魔法攻击增加:36-60<br>道术攻击增加:36-60");
	onTalkjlsm(npc,player);
end

function onTalkbsts(npc,player)
	player:alert(1,1,"获得[百胜天师]称号将激活霸气护体,属性如下:<br>物理防御增加:30-50<br>魔法防御增加:20-30<br>物理攻击增加:60-100<br>魔法攻击增加:60-100<br>道术攻击增加:60-100");
	onTalkjlsm(npc,player);
end

function onTalkhsqj(npc,player)
	player:alert(1,1,"获得[横扫千军]称号将激活霸气护体,属性如下:<br>物理防御增加:42-70<br>魔法防御增加:28-42<br>物理攻击增加:84-140<br>魔法攻击增加:84-140<br>道术攻击增加:84-140");
	onTalkjlsm(npc,player);
end

function onTalkwfmd(npc,player)
	player:alert(1,1,"获得[万夫莫敌]称号将激活霸气护体,属性如下:<br>物理防御增加:60-100<br>魔法防御增加:40-60<br>物理攻击增加:120-200<br>魔法攻击增加:120-200<br>道术攻击增加:120-200");
	onTalkjlsm(npc,player);
end

function onTalkgsqx(npc,player)
	player:alert(1,1,"获得[盖世奇侠]称号将激活霸气护体,属性如下:<br>物理防御增加:84-140<br>魔法防御增加:56-84<br>物理攻击增加:168-280<br>魔法攻击增加:168-280<br>道术攻击增加:168-280");
	onTalkjlsm(npc,player);
end

function onTalkslzs(npc,player)
	player:alert(1,1,"获得[杀戮之神]称号将激活霸气护体,属性如下:<br>物理防御增加:114-190<br>魔法防御增加:76-114<br>物理攻击增加:228-380<br>魔法攻击增加:228-380<br>道术攻击增加:228-380");
	onTalkjlsm(npc,player);
end

function onTalksmbz(npc,player)
	player:alert(1,1,"获得[神魔霸主]称号将激活霸气护体,属性如下:<br>物理防御增加:150-250<br>魔法防御增加:100-150<br>物理攻击增加:300-500<br>魔法攻击增加:300-500<br>道术攻击增加:300-500");
	onTalkjlsm(npc,player);
end

function setRandName(player,team)
	if team == 1 then
		local tx = util.svn("numberred")+1;
		server.set_var("numberred",tx);
		player:set_name_plus("红方"..tx);
		player:set_param(const.PP_ZHANCHANG_NIMING,"红方"..tx);
	end
	if team == 2 then
		local tx = util.svn("numberblue")+1;
		server.set_var("numberblue",tx);
		player:set_name_plus("蓝方"..tx);
		player:set_param(const.PP_ZHANCHANG_NIMING,"蓝方"..tx);
	end
end

function onjretjzc(player)
	if player:get_dart_task_flag() == 1 and util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then
		player:alert(1,1,"请先将现在这趟镖走完再进入战场吧!");return;
	end
	if server.get_temp_var("tjzc") == "1" then
	if player:get_level() >= 70 then
		local m=server.find_map("tjzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 1 then
				if m:num_team_member(1)- m:num_team_member(2) >= 5 then
					player:alert(1,1,"对不起,红方阵营人数过多,请稍后再加入!");
					--onTalksmzc(npc,player);
				else
					player:set_team_info(1,"红方阵营");
					player:enter_map("tjzc",107,29);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					player:alert(1,1,"恭喜您成功加入红方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00ff'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
			if util.ppn(player,const.PP_SMZCZHENY) == 2 then
				if m:num_team_member(2) - m:num_team_member(1) >= 5 then
					player:alert(1,1,"对不起,蓝方阵营人数过多,请稍后再加入!");
					--onTalksmzc(npc,player);
				else
					player:set_team_info(2,"蓝方阵营");
					player:enter_map("tjzc",17,150);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					player:alert(1,1,"恭喜您成功加入蓝方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
		else
		if m:num_team_member(2) >= m:num_team_member(1) then
			if m:num_team_member(2) == m:num_team_member(1) then
				local sj = math.random(1,2);
				if sj == 1 then
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,1);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(1,"红方阵营");
					player:enter_map("tjzc",107,29);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					setRandName(player,1);
					player:alert(1,1,"恭喜您成功加入红方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				else
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,2);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(2,"蓝方阵营");
					setRandName(player,2);
					player:enter_map("tjzc",17,150);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					player:alert(1,1,"恭喜您成功加入蓝方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,1);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
				player:set_team_info(1,"红方阵营");
				setRandName(player,1);
				player:enter_map("tjzc",107,29);
				--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
				player:alert(1,1,"恭喜您成功加入红方阵营");
				--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
			end
		else
		player:set_param(const.PP_SMZCHOUR,hour());
		player:set_param(const.PP_SMZCZHENY,2);
		player:set_param(const.PP_SMZCKILL,0);
		player:set_param(const.PP_SMZCJIFEN,0);
		player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
		player:set_team_info(2,"蓝方阵营");
		setRandName(player,2);
		player:enter_map("tjzc",17,150);
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
		end
		player:alert(1,1,"恭喜您成功加入蓝方阵营");
		--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
		end
	end
	else
		player:alert(1,1,"对不起,您的等级不足70级,无法进入!");
		--onTalk100(npc,player);
	end
	else
		player:alert(1,1,"对不起,天晶战场没有开启,暂时无法进入!");
	--onTalk100(npc,player);
	end
end

function onTalkjretjzc(npc,player)
	if player:get_dart_task_flag() == 1 and util.ppn(player,const.PP_ZHANCHANG_CHETYPE) <= 0 then
		player:alert(1,1,"请先将现在这趟镖走完再进入战场吧!");onTalk100(npc,player);return;
	end
	if server.get_temp_var("tjzc") == "1" then
	if player:get_level() >= 70 then
		local m=server.find_map("tjzc");
		if util.ppn(player,const.PP_SMZCHOUR) == hour() then
			if util.ppn(player,const.PP_SMZCZHENY) == 1 then
				if m:num_team_member(1)- m:num_team_member(2) >= 5 then
					player:alert(1,1,"对不起,红方阵营人数过多,请稍后再加入!");
					--onTalksmzc(npc,player);
				else
					player:set_team_info(1,"红方阵营");
					player:enter_map("tjzc",107,29);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					player:alert(1,1,"恭喜您成功加入红方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00ff'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
			if util.ppn(player,const.PP_SMZCZHENY) == 2 then
				if m:num_team_member(2) - m:num_team_member(1) >= 5 then
					player:alert(1,1,"对不起,蓝方阵营人数过多,请稍后再加入!");
					--onTalksmzc(npc,player);
				else
					player:set_team_info(2,"蓝方阵营");
					player:enter_map("tjzc",17,150);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					player:alert(1,1,"恭喜您成功加入蓝方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			end
		else
		if m:num_team_member(2) >= m:num_team_member(1) then
			if m:num_team_member(2) == m:num_team_member(1) then
				local sj = math.random(1,2);
				if sj == 1 then
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,1);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(1,"红方阵营");
					player:enter_map("tjzc",107,29);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					setRandName(player,1);
					player:alert(1,1,"恭喜您成功加入红方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				else
					player:set_param(const.PP_SMZCHOUR,hour());
					player:set_param(const.PP_SMZCZHENY,2);
					player:set_param(const.PP_SMZCKILL,0);
					player:set_param(const.PP_SMZCJIFEN,0);
					player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
					player:set_team_info(2,"蓝方阵营");
					setRandName(player,2);
					player:enter_map("tjzc",17,150);
					--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
					player:alert(1,1,"恭喜您成功加入蓝方阵营");
					--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
				end
			else
				player:set_param(const.PP_SMZCHOUR,hour());
				player:set_param(const.PP_SMZCZHENY,1);
				player:set_param(const.PP_SMZCKILL,0);
				player:set_param(const.PP_SMZCJIFEN,0);
				player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
				player:set_team_info(1,"红方阵营");
				setRandName(player,1);
				player:enter_map("tjzc",107,29);
				--统计活跃度--
					player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
					if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
						player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
					end
				player:alert(1,1,"恭喜您成功加入红方阵营");
				--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
			end
		else
		player:set_param(const.PP_SMZCHOUR,hour());
		player:set_param(const.PP_SMZCZHENY,2);
		player:set_param(const.PP_SMZCKILL,0);
		player:set_param(const.PP_SMZCJIFEN,0);
		player:set_param(const.PP_ZHANCHANG_CHETYPE,0);
		player:set_team_info(2,"蓝方阵营");
		setRandName(player,2);
		player:enter_map("tjzc",17,150);
		--统计活跃度--
		player:set_param(const.PP_HUOYUEDU_NUM12,util.ppn(player,const.PP_HUOYUEDU_NUM12)+1);
		if util.ppn(player,const.PP_HUOYUEDU_NUM12)==2 then
			player:set_param(const.PP_HUOYUEDU_JIFEN,util.ppn(player,const.PP_HUOYUEDU_JIFEN)+20);
		end
		player:alert(1,1,"恭喜您成功加入蓝方阵营");
		--player:black_board(0,"","<br><b><font color='#FF7700'>红方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("szzy").."分</font><br><font color='#FFaa00'>蓝方阵营积分</font>: <font color='#FFf00'>"..server.get_temp_var("mzzy").."分</font><br><font color='#FF00FF'>积分排名第一</font>: <font color='#FFf00'>"..server.get_var("smzcpma1").."</font><br><font color='#FFff00'>您的当前积分: "..util.ppn(player,const.PP_SMZCJIFEN).."分("..util.ppn(player,const.PP_SMZCKILL).."人)</font>");
		end
	end
	else
		player:alert(1,1,"对不起,您的等级不足70级,无法进入!");
		onTalk100(npc,player);
	end
	else
	player:alert(1,1,"对不起,天晶战场没有开启,暂时无法进入!");
	onTalk100(npc,player);
	end
end

function onTalkqlsd(npc,player)
	npc:echo([[               <font color="#ffff00">麒麟圣殿</font>

<font color="#ffaa00">活动说明</font>: 麒麟圣殿的[麒麟圣兽]又将出现
          人间!为了人类的安定,你是否愿
          意前往消灭他呢?

<font color="#ffaa00">活动时间</font>: <font color="#ffff00">12:45    18:45    20:45
          22:45</font>

<font color="#ffaa00">进入限制</font>: 需要等级达到45级以上

<font color="#ffaa00">BOSS说明</font>: 消灭[麒麟圣兽]将掉落大量坐骑
          经验丹!另外还有几率掉落高级
          套装[天龙套装]!快行动吧!
          <font color="#ff0000">麒麟圣兽死亡时,麒麟圣殿中的
          所有的勇士都将会获得坐骑经
          验[50000]点!</font>

<font color="#ffaa00">BOSS说明</font>: <font color="#ffff00">麒麟圣兽为死亡掉落自由捡取</font>

<font color="#ffaa00">点击此处</font>: <a href="event:talk_jrqlsd">点击此处进入[麒麟圣殿]</a>

--------------------------------------
系统时间:<font color="#ff8000"> ]]..os.date("%H点%M分",os.time())..[[</font> <a href="event:talk_qlsd">刷新</a>
]]);
end



function onTalkjrqlsd(npc,player)
	if server.get_temp_var("qlsd") == "1" then
		if player:get_level() >= 45 then
			local map = server.find_map("qlsd");
			local x,y;
			x,y=map:gen_rand_position();
			if( x and y )then
				server.info(100,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入[<font color='#FF0000'>麒麟圣殿</font>]");
				player:enter_map("qlsd",x,y);
				go.givehuicheng(player);
			end
		else
		player:alert(1,1,"由于麒麟圣殿过于凶险,您还是[45级]以后再进入吧!");
		onTalkqlsd(npc,player);
		end
	else
		player:alert(1,1,"对不起,目前[麒麟圣殿]入口尚未打开!");
		onTalkqlsd(npc,player);
	end
end


function onTalklianyu1(npc,player)
	npc:echo([[
<font color="#ffff00">十八层炼狱主要BOSS如下:

炼狱三层:   奴玛教主    <font color="#ffaa00">复活:15分钟</font>
炼狱四层:   嗜血毒虫    <font color="#ffaa00">复活:15分钟</font>
炼狱五层:   邪龙神      <font color="#ffaa00">复活:60分钟</font>
炼狱六层:   邪恶蛇蝎    <font color="#ffaa00">复活:15分钟</font>
炼狱七层:   变异蛇蝎王  <font color="#ffaa00">复活:60分钟</font>
炼狱八层:   重装使者    <font color="#ffaa00">复活:15分钟</font>
<font color="#ff0000">炼狱九层:   神兵使者</font>    <font color="#ffaa00">复活:120分钟</font>
炼狱十层:   幽灵教主    <font color="#ffaa00">复活:15分钟</font>
炼狱十一层: 猛犸教皇    <font color="#ffaa00">复活:60分钟</font>
<font color="#ff0000">炼狱十二层: 巨灵天魔</font>    <font color="#ffaa00">复活:120分钟</font>
炼狱十三层: 蛮牛王      <font color="#ffaa00">复活:15分钟</font>
炼狱十四层: 妖月血魔    <font color="#ffaa00">复活:15分钟</font>
炼狱十五层: 牛魔圣君    <font color="#ffaa00">复活:60分钟</font>
<font color="#ff0000">炼狱十六层: 混沌魔君</font>    <font color="#ffaa00">复活:120分钟</font>
<font color="#ff0000">炼狱十七层: 噬日魔兽</font>    <font color="#ffaa00">复活:120分钟</font>
<font color="#ff0000">炼狱十八层: 地狱炎魔</font>    <font color="#ffaa00">复活:120分钟</font></font>

<font color="#ff0000">请注意:十八层炼狱有去无回,请小心进入!</font>

                    <a href="event:talk_lianyu2">进入炼狱第一层</a>

                          <a href="event:talk_100">返回首页</a>

]]);
end

function check_ymsy_day(player)
	if util.ppn(player,const.PP_YMSY_DAY) ~= today() then
		player:set_param(const.PP_YMSY_DAY,today());
		player:set_param(const.PP_YMSY,0);
	end
end

function onTalkxeqy9(npc,player)
	check_ymsy_day(player);
	npc:echo([[--------------------------------------
               <font color="#ffff00">幽冥圣域</font>

<font color="#ffaa00">地图说明</font>: 恐怖的幽冥圣域再次重现人间,
          强大的幽冥军团又集合在一起!
          [幽冥圣君]妄图卷土从来!勇士
          们,捍卫人间正义的时刻到了!

<font color="#ffaa00">进入限制</font>: <font color="#ffff00">需要等级达到45级以上</font>

<font color="#ffaa00">时间限制</font>: <font color="#ffff00">你今天还可进入[<font color="#ff0000">]]..const.YMSY_MAX_NUM - util.ppn(player,const.PP_YMSY)..[[</font>]分钟</font>

<font color="#ffaa00">主要掉落</font>:
          <font color="#ffff00">天地系列,凌云套装,惊世套装
          混天套装,潜龙套装,无双套装
          至尊套装,高级武器,高级衣服</font>

          <font color="#ff0000">消灭圣君有机会获得神秘装备</font>

<font color="#ffaa00">点击进入</font>: <a href="event:talk_enterymsy">点击此处进入[幽冥圣域]</a>
--------------------------------------
]]);
end





function onTalkenterymsy(npc,player)
	check_ymsy_day(player);
	if const.YMSY_MAX_NUM > util.ppn(player,const.PP_YMSY) then
		player:enter_map("ymsy1",200,200);
		server.info(100,0,"[<font color='#ff0000'>"..player:get_name().."</font>]从[<font color='#ff0000'>传送员</font>]进入[<font color='#ff0000'>幽冥圣域</font>]!")
		go.givehuicheng(player);
	else
		player:alert(1,1,"您今天允许进入[幽冥圣域]的时间不足,无法进入幽冥圣域!");
		onTalkxeqy9(npc,player);
	end
	player:alert(1,1,"您今天允许进入幽冥圣域的时间还剩:"..const.YMSY_MAX_NUM - util.ppn(player,const.PP_YMSY)+1 .."分钟");
end






function onTalktmd(npc,player)
	npc:echo([[             <font color="#ffff00">勇闯天魔宝殿</font>

<font color="#ffaa00">活动说明</font>: 天魔殿里的[无相天魔]又有点蠢蠢欲动了!为了人类的安定,你是否愿意前往消灭他呢?

<font color="#ffaa00">活动时间</font>: <font color="#ffff00">02:10    06:10    10:10
          14:10    18:10    23:10</font>

<font color="#ffaa00">进入限制</font>: 需要等级达到45级以上

<font color="#ffaa00">地图说明</font>: 锁定行会模式  允许PK模式
          <font color="#ff0000">死亡后有几率掉落身上装备</font>

<font color="#ffaa00">主要掉落</font>: <font color="#ffff00">1-7级宝石,(50,55,60)级套装,
          顶级神兵(玄铁摄魂刀等),
          顶级衣服,2-8级元神装备!</font>

<font color="#ffaa00">进入选择</font>: <a href="event:talk_gos1">天魔殿[东]</a>    <a href="event:talk_gos2">天魔殿[西]</a>
--------------------------------------
系统时间:<font color="#ff8000"> ]]..os.date("%H点%M分",os.time())..[[</font> <a href="event:talk_tmd">刷新</a>
]]);
end

function onTalkgos1(npc,player)
	if server.get_temp_var("tmd") == "2" then
			player:alert(1,1,"勇闯天魔殿活动已经开始,入口已经关闭");
			onTalktmd(npc,player);
	else
		if server.get_temp_var("tmd") == "1" then
			if player:get_level() >= 45 then
				player:set_param(const.PP_TIANMOD,1);
				player:enter_map("tmda",34,66);
				go.givehuicheng(player);
				player:alert(11,1,"此地图死亡有几率掉落身上装备");
				server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了<font color='#ff0000'>天魔殿入口[东]</font>");
			else
			player:alert(1,1,"对不起,参与勇闯天魔殿活动需要达到45级!");
			onTalktmd(npc,player);
			end
		else
			player:alert(1,1,"天魔殿的入口还没有打开,暂时无法进入!");
			onTalktmd(npc,player);
		end
	end
end



function onTalkgos2(npc,player)
	if server.get_temp_var("tmd") == "2" then
			player:alert(1,1,"勇闯天魔殿活动已经开始,入口已经关闭");
			onTalktmd(npc,player);
	else
		if server.get_temp_var("tmd") == "1" then
			if player:get_level() >= 45 then
				player:set_param(const.PP_TIANMOD,2);
				player:enter_map("tmdb",34,66);
				go.givehuicheng(player);
				player:alert(11,1,"此地图死亡有几率掉落身上装备");
				server.info(10,1,"[<font color='#ff0000'>"..player:get_name().."</font>]进入了<font color='#ff0000'>天魔殿入口[西]</font>");
			else
			player:alert(1,1,"对不起,参与勇闯天魔殿活动需要达到45级!");
			onTalktmd(npc,player);
			end
		else
			player:alert(1,1,"天魔殿的入口还没有打开,暂时无法进入!");
			onTalktmd(npc,player);
		end
	end
end



function onTalkdtswjd(npc,player)
	if server.get_temp_var("swjd") == "1" then
		if player:get_level() >= 45 then
			player:enter_map("swjd1",217,226);
			server.info(100,1,"[<font color='#FF0000'>"..player:get_name().."</font>]从传送员进入[<font color='#FF0000'>死亡禁地</font>]");
			go.givehuicheng(player);
		else
		player:alert(1,1,"由于死亡禁地过于凶险,你还是[45级]以后再进入吧!");
		onTalk100(npc,player);
		end
	else
		player:alert(1,1,"对不起,目前[死亡禁地之门]尚未打开!<br>开启时间:11点15分,22点15分");
		onTalk100(npc,player);
	end
end

function onTalkkongbu8(npc,player)
	if  player:get_level()>= 70 then
		player:enter_map("ygsy1",46,102);
		player:alert(1,1,"远古战场的[远古深渊]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去远古深渊??还是70级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu7(npc,player)
	if  player:get_level()>= 65 then
		player:enter_map("qshl1",71,185);
		player:alert(1,1,"天威魔狱的[天威圣殿]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去天威魔狱??还是65级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu6(npc,player)
	if  player:get_level()>= 60 then
		player:enter_map("zzzd1",75,212);
		player:alert(1,1,"神庙废墟的[神庙祭坛]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去神庙废墟??还是60级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu5(npc,player)
	if  player:get_level()>= 55 then
		player:enter_map("swxc1",23,230);
		player:alert(1,1,"落日峡谷的[落日刑场]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去落日峡谷??还是55级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu4(npc,player)
	if  player:get_level()>= 50 then
		player:enter_map("dyry1",15,226);
		player:alert(1,1,"地狱熔岩的[烈炎魔窟]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去地狱熔岩??还是50级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu3(npc,player)
	if  player:get_level()>= 50 then
		player:enter_map("bfxy1",196,57);
		player:alert(1,1,"冰封雪域的[冰封魔域]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去冰封雪域??还是50级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu2(npc,player)
	if  player:get_level()>= 50 then
		player:enter_map("hund1",237,232);
		player:alert(1,1,"混沌之门的[混沌魔域]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去混沌之门??还是50级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkkongbu1(npc,player)
	if  player:get_level()>= 50 then
		player:enter_map("jlsk1",19,92);
		player:alert(1,1,"巨灵石窟的[巨灵魔窟]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去巨灵石窟??还是50级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalklianyu2(npc,player)
	if  player:get_level()>= 45 then
		player:enter_map("lianyu1",104,21);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去炼狱一层??还是45级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy8(npc,player)
	if  player:get_level()>= 40 then
		player:enter_map("chiyue1",214,41);
		player:alert(1,1,"妖月峡谷的[妖月巢穴]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去妖月峡谷??还是40级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy7(npc,player)
	if  player:get_level()>= 35 then
		player:enter_map("niumo1",40,150);
		player:alert(1,1,"蛮牛洞的[蛮牛大殿]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去蛮牛洞??还是35级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy6(npc,player)
	if  player:get_level()>= 30 then
		player:enter_map("fengmo1",179,173);
		player:alert(1,1,"魔魂殿的[伏魔殿]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去魔魂殿??还是30级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy5(npc,player)
	if  player:get_level()>= 30 then
		player:enter_map("zuma1",29,226);
		player:alert(1,1,"猛犸寺庙的[猛犸神殿]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猛犸寺庙??还是30级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy4(npc,player)
	if  player:get_level()>= 25 then
		player:enter_map("zhudong1",21,231);
		player:alert(1,1,"猪妖洞的[猪妖巢穴]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去猪妖洞??还是25级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy3(npc,player)
	if  player:get_level()>= 20 then
		player:enter_map("wgd1",374,373);
		player:alert(1,1,"邪恶洞穴的[邪恶之谷]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去邪恶洞穴??还是20级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy2(npc,player)
	if  player:get_level()>= 15 then
		player:enter_map("wmsm1",282,270);
		player:alert(1,1,"奴玛寺庙的[奴玛神殿]为双倍经验地图!");
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去奴玛寺庙??还是15级以后再去吧!");
		onTalk100(npc,player);
	end
end

function onTalkxeqy1(npc,player)
	if  player:get_level()>= 10 then
		player:enter_map("jsd1",25,228);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去僵尸洞穴??还是10级以后再去吧!");
		onTalk100(npc,player);
	end
end


function onTalkaqq6(npc,player)
	if player:get_level() >= 35 then
		player:enter_map("v005",57,103);
		go.givehuicheng(player);
	else
		player:alert(1,1,"想去王城??还是35级以后再去吧!");
		onTalk100(npc,player);
	end
end


function onTalkaqq5(npc,player)
	if player:get_level() >= 35 then
		player:enter_map("v011",34,43);
	else
		player:alert(1,1,"想去白云观??还是35级以后再去吧!");
		onTalk100(npc,player);
	end
end


function onTalkaqq4(npc,player)
	if player:get_level() >= 30 then
		player:enter_map("v010",34,36);
	else
		player:alert(1,1,"想去孤月岛??还是30级以后再去吧!");
		onTalk100(npc,player);
	end
end


function onTalkaqq3(npc,player)
	if player:get_level() >= 20 then
		player:enter_map("v003",97,110);
	else
		player:alert(1,1,"想去沙漠土城??还是20级以后再去吧!");
		onTalk100(npc,player);
	end
end


function onTalkaqq2(npc,player)
	if player:get_level() >= 10 then
		player:enter_map("v002",89,142);
	else
		player:alert(1,1,"想去云霄城??还是10级以后再去吧!");
		onTalk100(npc,player);
	end
end


function onTalkaqq1(npc,player)
	if player:get_level() >= 1 then
		player:enter_map("xinshou",75,120);
	else
		player:alert(1,1,"想去边界村??还是1级以后再去吧!");
		onTalk100(npc,player);
	end
end



function move_sqbg(player)
	if player:get_level() >= 45 then
	player:echo([[--------------------------------------
<font color="#ffff00">上古魔兽[天魔兽]已经出现在[神器宝阁]</font>
--------------------------------------
<font color="#ffff00">消灭[天魔兽]可以获得[神器积分],[神器积
分]可以兑换传说中的[上古神器]和[神甲]!</font>
--------------------------------------
<font color="#ffff00">勇士们,获取神器的机会到了!快快行动吧!</font>
--------------------------------------

点击此处: <a href="event:talk_xmtianmo">前往[神器宝阁]消灭[天魔兽]</a>

--------------------------------------
神器宝阁: <font color="#ff0000">允许PK,死亡后有几率掉落装备</font>
--------------------------------------
友情提醒: <font color="#ff0000">由于地图过于凶险,请慎重前往</font>
--------------------------------------
]]);
	end
end

function onTalkxmtianmo2(player)
	local map = server.find_map("sqbg");
	local x,y;
	x,y=map:gen_rand_position();
	if( x and y )then
		player:enter_map("sqbg",x,y);
		go.givehuicheng(player);
	end
end



function qlsdjl(player)
	if player and player:get_map() then
		if player:get_map():get_id() == "qlsd" then
			if util.ppn(player,const.PP_QILINGSHENGDIAN) ~= hour() then
				player:set_param(const.PP_QILINGSHENGDIAN,hour());
				local result = newgui.zuoqi.mountAddExp(player,50000);
				if result == 0 then
					player:alert(1,1,"坐骑已达到经验上限!");
				end
				player:alert(10,1,"<font color='#ff0000'>增加坐骑经验[50000]点</font>");
			end
		end
	end
end




function move_wlzb(player)
	if player:get_level() >= 40 then
	local jy = math.floor(math.min(80,player:get_level())*math.min(80,player:get_level())*312.69);
	local ry = math.floor(math.min(80,player:get_level())*62.33);
	player:echo([[--------------------------------------
<font color="#ffff00">武林争霸活动报名已经正式开始!</font>
--------------------------------------
<font color="#ffff00">参加武林争霸即可获得以下奖励:</font>
--------------------------------------
<font color="#ffaa00">荣誉值增加: <font color='#ff0000'>]]..ry..[[点</font> 
经验值增加:</font> <font color='#ff0000'>]]..jy..[[点</font>
--------------------------------------
<font color="#ffff00">成为武林盟主可获得以下特权:</font>
--------------------------------------
<font color="#C0FF3E">专用封号: <font color='#FF00FF'>★武林盟主★</font></font>
<font color="#C0FF3E">荣誉增加: <font color='#FF00ff'>10000点</font></font>
<font color="#C0FF3E">属性提升: <font color='#FF00ff'>攻击+300 魔法+300 道术+300</font></font>
<font color="#C0FF3E">多倍经验: <font color='#FF00ff'>杀怪经验1.5倍</font></font>
--------------------------------------
点击此处: <a href="event:talk_qwcjwlzb">立刻前往参加武林争霸活动</a>
--------------------------------------
<font color="#ffff00">争霸大厅: <font color="#ff0000">自由PK模式,死亡不掉装备</font></font>
--------------------------------------
]]);
	end
end



function onTalkqwcjwlzb2(player)
	if server.get_temp_var("wlzb") == "2" then
			player:alert(1,1,"武林争霸活动已经开始,入口已经关闭");
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
			end
		else
			player:alert(1,1,"现在不是报名时间,请到报名时间再来找我吧!");
		end
	end
end




function move_kingcity1(player)
	if player:get_level() >= 45 then
	player:echo([[--------------------------------------
<font color="#ffff00">上古魔兽[地魔兽]带领魔界大军入侵王城!</font>
--------------------------------------
<font color="#ffff00">消灭[地魔兽]将会100%掉落[骠骑将军护腕]
还有机会掉落各种高级装备哦!</font>
--------------------------------------
<font color="#ffff00">勇士们,获取神器的机会到了!快快行动吧!</font>
--------------------------------------

点击此处: <a href="event:talk_qwkingcity">立刻前往[王城]消灭[天魔兽]</a>

--------------------------------------
友情提醒: <font color="#ff0000">地魔兽非常强大,请组队前往</font>
--------------------------------------
]]);
	end
end

function move_kingcity2(player)
	if player:get_level() >= 45 then
	player:echo([[--------------------------------------
<font color="#ffff00">上古魔兽[炎魔兽]带领魔界大军入侵王城!</font>
--------------------------------------
<font color="#ffff00">消灭[炎魔兽]将会[100%]掉落[八级宝石],
还有机会掉落各种高级装备哦!</font>
--------------------------------------
<font color="#ffff00">勇士们,获取神装的机会到了!快快行动吧!</font>
--------------------------------------

点击此处: <a href="event:talk_qwkingcity">立刻前往[王城]消灭[炎魔兽]</a>

--------------------------------------
友情提醒: <font color="#ff0000">炎魔兽非常强大,请组队前往</font>
--------------------------------------
]]);
	end
end

function move_kingcity3(player)
	if player:get_level() >= 45 then
	player:echo([[--------------------------------------
<font color="#ffff00">上古魔兽[暗魔兽]带领魔界大军入侵王城!</font>
--------------------------------------
<font color="#ffff00">消灭[暗魔兽]将会[100%]掉落[九级宝石],
还有机会掉落各种高级装备哦!</font>
--------------------------------------
<font color="#ffff00">勇士们,获取神装的机会到了!快快行动吧!</font>
--------------------------------------

点击此处: <a href="event:talk_qwkingcity">立刻前往[王城]消灭[暗魔兽]</a>

--------------------------------------
友情提醒: <font color="#ff0000">暗魔兽非常强大,请组队前往</font>
--------------------------------------
]]);
	end
end



function move_kingcity4(player)
	if player:get_level() >= 45 then
	player:echo([[--------------------------------------
<font color="#ffff00">王城正在遭受大量魔族BOSS的入侵!</font>
--------------------------------------
<font color="#ffff00">现在消灭它们可是双倍爆率哦!</font>
--------------------------------------
<font color="#ffff00">勇士们,获取神装的机会到了!快快行动吧!</font>
--------------------------------------

点击此处: <a href="event:talk_qwkingcity">立刻前往[王城]消灭[魔族BOSS]</a>

--------------------------------------
友情提醒: <font color="#ff0000">魔族BOSS非常强大,请组队前往</font>
--------------------------------------
]]);
	end
end

function onTalkqwkingcity2(player)
	local map = server.find_map("vkingcity");
	player:enter_map("v005",55,101);
	go.givehuicheng(player);
end

function onTalkenterqlsd(player)
	if server.get_temp_var("qlsd") == "1" then
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
	else
		player:alert(1,1,"对不起,目前[麒麟圣殿]入口尚未打开!");
	end
end

function move_qilingdian(player)
	if player:get_level() >= 45 then
	player:echo([[--------------------------------------
<font color="#ffff00">麒麟圣殿的[麒麟圣兽]又出现了!为了人类的安定,你是否愿意前往消灭他呢?</font>
--------------------------------------
<font color="#ffaa00">进入限制</font>: 需要等级达到45级以上
--------------------------------------
<font color="#ffaa00">BOSS说明</font>: 消灭[麒麟圣兽]将掉落大量坐骑
          经验丹!另外还有几率掉落高级
          套装[天龙套装]!快行动吧!
          <font color="#ff0000">麒麟圣兽死亡时,麒麟圣殿中的
          所有的勇士都将会获得坐骑经
          验[50000]点!</font>
--------------------------------------
<font color="#ffaa00">点击此处</font>: <a href="event:talk_enterqlsd">点击此处进入[麒麟圣殿]</a>
--------------------------------------
]]);
	end
end

local forbidmap={"zssd"}

function checkForbidmap(mapid)
	for i=1,#forbidmap do
		if string.find(mapid,forbidmap[i]) then
			return true;
		end
	end
	return false;
end


function move_zssd(player)
	if checkForbidmap(player:get_map():get_id()) then
		player:go_home();
		player:alert(11,1,"转生神殿里的超级BOSS已经出现!");
		player:alert(11,0,"神殿里的玩家自动退出转生神殿!");
	end
end


local forbidmap2={"binghuodao"}

function checkForbidmap2(mapid)
	for i=1,#forbidmap2 do
		if string.find(mapid,forbidmap2[i]) then
			return true;
		end
	end
	return false;
end

function move_bhdao(player)
	if checkForbidmap2(player:get_map():get_id()) then
		player:go_home();
		player:alert(11,1,"冰火岛活动已经关闭,感谢您的参与!");
	end
end


local forbidmap3={"ygfx"}
function checkForbidmap3(mapid)
	for i=1,#forbidmap3 do
		if string.find(mapid,forbidmap3[i]) then
			return true;
		end
	end
	return false;
end
function move_ygfx(player)
	if checkForbidmap3(player:get_map():get_id()) then
		player:go_home();
		player:alert(11,1,"远古废墟活动已经关闭,感谢您的参与!");
	end
end