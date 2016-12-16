module(..., package.seeall)

function onRelive(mon,player)
	if mon:get_map():get_id() == "wmsm4" and mon:get_name() == "奴玛教皇" then
		server.info(10,0,"[<font color='#ff0000'>奴玛教皇</font>]出现在[封印的奴玛后宫]");
	end
	if mon:get_map():get_id() == "wgd6" and mon:get_name() == "邪龙神" then
		server.info(10,0,"[<font color='#ff0000'>邪龙神</font>]出现在[封印的邪龙谷]");
	end
	if mon:get_map():get_id() == "zhudong5" and mon:get_name() == "变异蛇蝎王" then
		server.info(10,0,"[<font color='#ff0000'>变异蛇蝎王</font>]出现在[封印的猪妖魔窟]");
	end
	if mon:get_map():get_id() == "zuma6" and mon:get_name() == "猛犸教皇" then
		server.info(10,0,"[<font color='#ff0000'>猛犸教皇</font>]出现在[封印的猛犸后宫]");
	end
	if mon:get_map():get_id() == "fengmo4" and mon:get_name() == "猛犸教皇" then
		server.info(10,0,"[<font color='#ff0000'>猛犸教皇</font>]出现在[伏魔殿]");
	end
	if mon:get_map():get_id() == "niumo5" and mon:get_name() == "牛魔圣君" then
		server.info(10,0,"[<font color='#ff0000'>牛魔圣君</font>]出现在[封印的蛮牛圣殿]");
	end
	if mon:get_map():get_id() == "wwsd" and mon:get_name() == "武威战神" then
		server.info(10,0,"[<font color='#ff0000'>武威战神</font>]出现在猛犸森林[武威殿]");
	end
	if mon:get_map():get_id() == "lysd" and mon:get_name() == "烈焰法神" then
		server.info(10,0,"[<font color='#ff0000'>烈焰法神</font>]出现在恶人村[烈焰堂]");
	end
	if mon:get_map():get_id() == "wjsd" and mon:get_name() == "无极天尊" then
		server.info(10,0,"[<font color='#ff0000'>无极天尊</font>]出现在白云观[无极殿]");
	end
	if mon:get_map():get_id() == "maya3" and mon:get_name() == "玛雅之神" then
		server.info(10,0,"[<font color='#ff0000'>玛雅之神</font>]出现在[玛雅神殿]");
	end
	if mon:get_map():get_id() == "jlsk4" and mon:get_name() == "巨灵天魔" then
		server.info(10,0,"[<font color='#ff0000'>巨灵天魔</font>]出现在[巨灵魔窟]");
	end
	if mon:get_map():get_id() == "hund4" and mon:get_name() == "混沌魔君" then
		server.info(10,0,"[<font color='#ff0000'>混沌魔君</font>]出现在[混沌魔域]");
	end
	if mon:get_map():get_id() == "bfxy4" and mon:get_name() == "噬日魔兽" then
		server.info(10,0,"[<font color='#ff0000'>噬日魔兽</font>]出现在[冰封魔域]");
	end
	if mon:get_map():get_id() == "dyry4" and mon:get_name() == "地狱炎魔" then
		server.info(10,0,"[<font color='#ff0000'>地狱炎魔</font>]出现在[烈炎魔窟]");
	end
	if mon:get_map():get_id() == "ymsy1" and mon:get_name() == "幽冥圣君" then
		server.info(10,0,"[<font color='#ff0000'>幽冥圣君</font>]出现在[幽冥圣域]");
	end
	if mon:get_map():get_id() == "swxc4" and mon:get_name() == "落日恶魔" then
		server.info(10,0,"[<font color='#ff0000'>落日恶魔</font>]出现在[落日刑场]");
	end
	if mon:get_map():get_id() == "zzzd4" and mon:get_name() == "亘古魔王" then
		server.info(10,0,"[<font color='#ff0000'>亘古魔王</font>]出现在[神庙祭坛]");
	end
	if mon:get_map():get_id() == "qshl4" and mon:get_name() == "天威魔帝" then
		server.info(10,0,"[<font color='#ff0000'>天威魔帝</font>]出现在[天威圣殿]");
	end
	if mon:get_map():get_id() == "ygsy4" and mon:get_name() == "远古大帝" then
		server.info(10,0,"[<font color='#ff0000'>远古大帝</font>]出现在[远古深渊]");
	end
	if mon:get_map():get_id() == "lianyu9" and mon:get_name() == "神兵使者" then
		server.info(10,0,"[<font color='#ff0000'>神兵使者</font>]出现在[炼狱九层]");
	end
	if mon:get_map():get_id() == "v005" and mon:get_name() == "神兵使者" then
		server.info(10,0,"[<font color='#ff0000'>神兵使者</font>]出现在[王城]");
	end
	if mon:get_map():get_id() == "wnswd" and mon:get_name() == "蚀骨尸王" then
		server.info(10,0,"[<font color='#ff0000'>蚀骨尸王</font>]出现在[尸王殿]");
	end
end
