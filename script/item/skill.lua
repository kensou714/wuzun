module(..., package.seeall)
function checkJob(player,needJob)
	if( player:get_job_name() == needJob ) then
		return true;
	end
	player:alert(111,0,"您的职业不可以学习该技能");
	return false;
end

-----------------------------------------------------------
function skillpotian1(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(106) == 3 then
		player:set_skill_level(106,0);
		if player:skill_level(107) == 0 and player:skill_level(109) == 0 then
			player:set_skill_level(109,0);
			player:add_skill(107);
			player:alert(10,1,"恭喜您成功修炼[破天斩(1级)]");
		else
			player:alert(1,1,"您已经学习了该技能,无法再次学习")
		return 0;
		end
	else
		player:alert(1,1,"修炼[破天斩(1级)]需要达到烈火剑法(3级)");
		return 0;
	end
end

function skillpotian2(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(107) == 1 then
		player:set_skill_level(106,0);
		player:set_skill_level(109,0);
		player:set_skill_level(107,2);
		player:alert(10,1,"恭喜您成功修炼[破天斩(2级)]");
	else
		player:alert(1,1,"修炼[破天斩(2级)]需要达到破天斩(1级)");
		return 0;
	end
end

function skillpotian3(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(107) == 2 then
		player:set_skill_level(106,0);
		player:set_skill_level(109,0);
		player:set_skill_level(107,3);
		player:alert(10,1,"恭喜您成功修炼[破天斩(3级)]");
	else
		player:alert(1,1,"修炼[破天斩(3级)]需要达到破天斩(2级)");
		return 0;
	end
end

function skillbenlei1(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(107) == 3 then
		player:set_skill_level(107,0);
		if player:skill_level(109) == 0 then
			player:set_skill_level(106,0);
			player:add_skill(109);
			player:alert(10,1,"恭喜您成功修炼[奔雷剑法(1级)]");
		else
			player:alert(1,1,"您已经学习了该技能,无法再次学习")
		return 0;
		end
	else
		player:alert(1,1,"修炼[奔雷剑法(1级)]需要达到破天斩(3级)");
		return 0;
	end
end

function skillbenlei2(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(109) == 1 then
		player:set_skill_level(106,0);
		player:set_skill_level(107,0);
		player:set_skill_level(109,2);
		player:alert(10,1,"恭喜您成功修炼[奔雷剑法(2级)]");
	else
		player:alert(1,1,"修炼[奔雷剑法(2级)]需要达到奔雷剑法(1级)");
		return 0;
	end
end

function skillbenlei3(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(109) == 2 then
		player:set_skill_level(106,0);
		player:set_skill_level(107,0);
		player:set_skill_level(109,3);
		player:alert(10,1,"恭喜您成功修炼[奔雷剑法(3级)]");
	else
		player:alert(1,1,"修炼[奔雷剑法(3级)]需要达到奔雷剑法(2级)");
		return 0;
	end
end

function skillqiyan1(player)
	if( not checkJob(player,"wizard") ) then 
		return 0;
	end
	if player:skill_level(414) == 3 then
		player:set_skill_level(414,0);
		if player:skill_level(416) == 0 and player:skill_level(417) == 0  then
			player:add_skill(416);
			player:set_skill_level(417,0);
			player:alert(10,1,"恭喜您成功修炼[龙息气焰(1级)]");
		else
			player:alert(1,1,"您已经学习了该技能,无法再次学习")
		return 0;
		end
	else
		player:alert(1,1,"修炼[龙息气焰(1级)]需要达到冰咆哮(3级)");
		return 0;
	end
end

function skillqiyan2(player)
	if( not checkJob(player,"wizard") ) then 
		return 0;
	end
	if player:skill_level(416) == 1 then
		player:set_skill_level(414,0);
		player:set_skill_level(417,0);
		player:set_skill_level(416,2);
		player:alert(10,1,"恭喜您成功修炼[龙息气焰(2级)]");
	else
		player:alert(1,1,"修炼[龙息气焰(2级)]需要达到龙息气焰(1级)");
		return 0;
	end
end

function skillqiyan3(player)
	if( not checkJob(player,"wizard") ) then 
		return 0;
	end
	if player:skill_level(416) == 2 then
		player:set_skill_level(414,0);
		player:set_skill_level(417,0);
		player:set_skill_level(416,3);
		player:alert(10,1,"恭喜您成功修炼[龙息气焰(3级)]");
	else
		player:alert(1,1,"修炼[龙息气焰(3级)]需要达到龙息气焰(2级)");
		return 0;
	end
end

function skillhuoyu1(player)
	if( not checkJob(player,"wizard") ) then 
		return 0;
	end
	if player:skill_level(416) == 3 then
		player:set_skill_level(416,0);
		if player:skill_level(417) == 0  then
			player:add_skill(417);
			player:set_skill_level(414,0);
			player:alert(10,1,"恭喜您成功修炼[烈焰火雨(1级)]");
		else
			player:alert(1,1,"您已经学习了该技能,无法再次学习")
		return 0;
		end
	else
		player:alert(1,1,"修炼[烈焰火雨(1级)]需要达到龙息气焰(3级)");
		return 0;
	end
end

function skillhuoyu2(player)
	if( not checkJob(player,"wizard") ) then 
		return 0;
	end
	if player:skill_level(417) == 1 then
		player:set_skill_level(414,0);
		player:set_skill_level(416,0);
		player:set_skill_level(417,2);
		player:alert(10,1,"恭喜您成功修炼[烈焰火雨(2级)]");
	else
		player:alert(1,1,"修炼[烈焰火雨(2级)]需要达到烈焰火雨(1级)");
		return 0;
	end
end

function skillhuoyu3(player)
	if( not checkJob(player,"wizard") ) then 
		return 0;
	end
	if player:skill_level(417) == 2 then
		player:set_skill_level(414,0);
		player:set_skill_level(416,0);
		player:set_skill_level(417,3);
		player:alert(10,1,"恭喜您成功修炼[烈焰火雨(3级)]");
	else
		player:alert(1,1,"修炼[烈焰火雨(3级)]需要达到烈焰火雨(2级)");
		return 0;
	end
end

function skillqigbo1(player)
	if( not checkJob(player,"taoist") ) then 
		return 0;
	end
	if player:skill_level(514) == 0 then
		player:add_skill(514,1);
		player:alert(10,1,"恭喜您成功修炼[气功波(1级)]");
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end

function skillqigbo2(player)
	if( not checkJob(player,"taoist") ) then 
		return 0;
	end
	if player:skill_level(514) == 1 then
		player:set_skill_level(514,2);
		player:alert(10,1,"恭喜您成功修炼[气功波(2级)]");
	else
		player:alert(1,1,"修炼[气功波(2级)]需要达到气功波(1级)");
	return 0;
	end
end

function skillqigbo3(player)
	if( not checkJob(player,"taoist") ) then 
		return 0;
	end
	if player:skill_level(514) == 2 then
		player:set_skill_level(514,3);
		player:alert(10,1,"恭喜您成功修炼[气功波(3级)]");
	else
		player:alert(1,1,"修炼[气功波(3级)]需要达到气功波(2级)");
	return 0;
	end
end


function skillshenlg1(player)
	if( not checkJob(player,"taoist") ) then 
		return 0;
	end
	if player:skill_level(513) >= 1 then
		player:set_skill_level(513,0);
		if player:skill_level(518) == 0  then
			player:add_skill(518);
			player:alert(10,1,"恭喜您成功修炼[炎龙召唤(1级)]");
		else
			player:alert(1,1,"您已经学习了该技能,无法再次学习")
		return 0;
		end
	else
		player:alert(1,1,"修炼[炎龙召唤(1级)]需要达到无极召唤(1级)");
		return 0;
	end
end

function skillshenlg2(player)
	if( not checkJob(player,"taoist") ) then 
		return 0;
	end
	if player:skill_level(518) == 1 then
		player:set_skill_level(518,2);
		player:alert(10,1,"恭喜您成功修炼[炎龙召唤(2级)]");
	else
		player:alert(1,1,"修炼[炎龙召唤(2级)]需要达到炎龙召唤(1级)");
	return 0;
	end
end

function skillshenlg3(player)
	if( not checkJob(player,"taoist") ) then 
		return 0;
	end
	if player:skill_level(518) == 2 then
		player:set_skill_level(518,3);
		player:alert(10,1,"恭喜您成功修炼[炎龙召唤(3级)]");
	else
		player:alert(1,1,"修炼[炎龙召唤(3级)]需要达到炎龙召唤(2级)");
	return 0;
	end
end

-----------------------------------------------------------

function YiBanGongJi(player)
	player:add_skill(100);
end

function JiChuJianShu(player)
	if( not checkJob(player,"warrior") ) then 
		return 0;
	end
	if player:skill_level(101) == 0 then
		player:add_skill(101);
		player:alert(10,1,"恭喜您成功修炼[战士剑术]");
		if player:get_task_state(100) == 19 then
			player:set_task_state(100,20);
			player:push_task_data(100,1);
			player:refresh_npc_show_flags_inview();
		end
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
		
end
function GongShaJianShu(player)
	if( not checkJob(player,"warrior") ) then 
		return 0; 
	end
	if player:skill_level(102) == 0 then
		player:alert(10,1,"恭喜您成功修炼[强攻剑术]");
		player:add_skill(102);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function CiShaJianShu(player)
	if( not checkJob(player,"warrior") ) then 
		return 0; 
	end
	if player:skill_level(103) == 0 then
		player:alert(10,1,"恭喜您成功修炼[刺杀剑气]");
		player:add_skill(103);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function BanYueWanDao(player)
	if( not checkJob(player,"warrior") ) then 
		return 0; 
	end
	if player:skill_level(104) == 0 then
		player:alert(10,1,"恭喜您成功修炼[雷霆莲月]");
		player:add_skill(104);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function YeManChongZhuang(player)
	if( not checkJob(player,"warrior") ) then 
		return 0; 
	end
	if player:skill_level(105) == 0 then
		player:alert(10,1,"恭喜您成功修炼[战神冲撞]");
		player:add_skill(105);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function LieHuoJianFa(player)
	if( not checkJob(player,"warrior") ) then 
		return 0; 
	end
	if player:skill_level(106) == 0 and player:skill_level(107) == 0 and player:skill_level(109) == 0 then
		player:alert(10,1,"恭喜您成功修炼[战圣烈焰]");
		player:add_skill(106);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end

function HuoQiuShu(player)
	if( not checkJob(player,"wizard") ) then 
		return 0; 
	end
	if player:skill_level(401) == 0 then
		player:alert(10,1,"恭喜您成功修炼[火焰之球]");
		player:add_skill(401);
		if player:get_task_state(100) == 19 then
			player:set_task_state(100,20);
			player:push_task_data(100,1);
			player:refresh_npc_show_flags_inview();
		end
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function KangJuHuoHuan(player)
	if( not checkJob(player,"wizard") ) then 
		return 0; 
	end
	if player:skill_level(402) == 0 then
		player:alert(10,1,"恭喜您成功修炼[法师威严]");
		player:add_skill(402);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function YouHuoZhiGuang(player)
	if( not checkJob(player,"wizard") ) then 
		return 0; 
	end
	if player:skill_level(403) == 0 then
		player:add_skill(403);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function DiYuHuo(player)
	if( not checkJob(player,"wizard") ) then 
		return 0; 
	end
	if player:skill_level(404) == 0 then
		player:alert(10,1,"恭喜您成功修炼[黑狱之火]");
		player:add_skill(404);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function LeiDianShu(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(405) == 0 then
		player:alert(10,1,"恭喜您成功修炼[天雷之术]");
		player:add_skill(405);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function ShunJianYiDong(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(406) == 0 then
		player:alert(10,1,"恭喜您成功修炼[空间穿梭]");
		player:add_skill(406);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function DaHuoQiu(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(407) == 0 then
		player:alert(10,1,"恭喜您成功修炼[火焰飞轮]");
		player:add_skill(407);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function BaoLieHuoYan(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(408) == 0 then
		player:alert(10,1,"恭喜您成功修炼[爆焰火球]");
		player:add_skill(408);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function HuoQiang(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(409) == 0 then
		player:alert(10,1,"恭喜您成功修炼[烈焰火墙]");
		player:add_skill(409);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function JiGuangDianYing(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(410) == 0 then
		player:alert(10,1,"恭喜您成功修炼[黑狱雷电]");
		player:add_skill(410);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function DiYuLeiGuang(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(411) == 0 then
		player:alert(10,1,"恭喜您成功修炼[雷光风暴]");
		player:add_skill(411);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function MoFaDun(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(412) == 0 then
		player:alert(10,1,"恭喜您成功修炼[法神灵盾]");
		player:add_skill(412);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function ShengYanShu(player)
	if( not checkJob(player,"wizard") ) then
		player:alert(10,1,"恭喜您成功修炼[魔神指引]");
	return 0; 
	end
	if player:skill_level(413) == 0 then
		player:add_skill(413);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function BingPaoXiao(player)
	if( not checkJob(player,"wizard") ) then 
	return 0; 
	end
	if player:skill_level(414) == 0 and player:skill_level(416) == 0 and player:skill_level(417) == 0 then
		player:alert(10,1,"恭喜您成功修炼[冰雪咆哮]");
		player:add_skill(414);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end

function ZhiYuShu(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(501) == 0 then
		player:alert(10,1,"恭喜您成功修炼[回春之术]");
		player:add_skill(501);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function JinShenLiZhanFa(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(502) == 0 then
		player:alert(10,1,"恭喜您成功修炼[精神冥想]");
		player:add_skill(502);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function ShiDuShu(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(503) == 0 then
		player:alert(10,1,"恭喜您成功修炼[天尊之毒]");
		player:add_skill(503);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function LingHunHuoFu(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(504) == 0 then
		player:alert(10,1,"恭喜您成功修炼[天魂灵符]");
		player:add_skill(504);
		if player:get_task_state(100) == 19 then
			player:set_task_state(100,20);
			player:push_task_data(100,1);
			player:refresh_npc_show_flags_inview();
		end
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function ZhaoHuanKuLou(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(505) == 0 then
		player:alert(10,1,"恭喜您成功修炼[亡灵召唤]");
		player:add_skill(505);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function YinShenShu(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(506) == 0 then
		player:alert(10,1,"恭喜您成功修炼[隐身之术]");
		player:add_skill(506);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function JiTiYinShenShu(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(507) == 0 then
		player:alert(10,1,"恭喜您成功修炼[天尊隐身]");
		player:add_skill(507);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function YouLingDun(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(508) == 0 then
		player:alert(10,1,"恭喜您成功修炼[魔神庇护]");
		player:add_skill(508);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function ShenShengZhanJiaShu(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(509) == 0 then
		player:alert(10,1,"恭喜您成功修炼[斗神庇护]");
		player:add_skill(509);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function XinLingQiShi(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(510) == 0 then
		player:add_skill(510);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function KunMoZhou(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(511) == 0 then
		player:add_skill(511);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function QunTiZhiLiao(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(512) == 0 then
		player:alert(10,1,"恭喜您成功修炼[天尊灵疗]");
		player:add_skill(512);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
function ZhaoHuanShenShou(player)
	if( not checkJob(player,"taoist") ) then 
	return 0; 
	end
	if player:skill_level(513) == 0 and player:skill_level(518) == 0 then
		player:alert(10,1,"恭喜您成功修炼[无极召唤]");
		player:add_skill(513);
		player:use_skill(513);
	else
		player:alert(1,1,"您已经学习了该技能,无法再次学习")
	return 0;
	end
end
