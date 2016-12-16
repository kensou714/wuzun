module(..., package.seeall)
local ACTIONSET_NAME="zshecheng";
local PANEL_ACTIONSET_NAME="panelzshecheng";

local js_data={
	[40047]={name="四转洪荒盔·武威",tarid=40050,tarname="五转开天盔·武威",needid1=40048,needname1="四转洪荒盔·烈焰",neednum1=1,needid2=40049,needname2="四转洪荒盔·无极",neednum2=1},
        [40048]={name="四转洪荒盔·烈焰",tarid=40051,tarname="五转开天盔·烈焰",needid1=40047,needname1="四转洪荒盔·武威",neednum1=1,needid2=40049,needname2="四转洪荒盔·无极",neednum2=1},
        [40049]={name="四转洪荒盔·无极",tarid=40052,tarname="五转开天盔·无极",needid1=40047,needname1="四转洪荒盔·武威",neednum1=1,needid2=40048,needname2="四转洪荒盔·烈焰",neednum2=1},

	[70057]={name="四转洪荒链·武威",tarid=70060,tarname="五转开天链·武威",needid1=70058,needname1="四转洪荒链·烈焰",neednum1=1,needid2=70059,needname2="四转洪荒链·无极",neednum2=1},
        [70058]={name="四转洪荒链·烈焰",tarid=70061,tarname="五转开天链·烈焰",needid1=70057,needname1="四转洪荒链·武威",neednum1=1,needid2=70059,needname2="四转洪荒链·无极",neednum2=1},
        [70059]={name="四转洪荒链·无极",tarid=70062,tarname="五转开天链·无极",needid1=70057,needname1="四转洪荒链·武威",neednum1=1,needid2=70058,needname2="四转洪荒链·烈焰",neednum2=1},

	[60053]={name="四转洪荒镯·武威",tarid=60056,tarname="五转开天镯·武威",needid1=60054,needname1="四转洪荒镯·烈焰",neednum1=1,needid2=60055,needname2="四转洪荒镯·无极",neednum2=1},
        [60054]={name="四转洪荒镯·烈焰",tarid=60057,tarname="五转开天镯·烈焰",needid1=60053,needname1="四转洪荒镯·武威",neednum1=1,needid2=60055,needname2="四转洪荒镯·无极",neednum2=1},
        [60055]={name="四转洪荒镯·无极",tarid=60058,tarname="五转开天镯·无极",needid1=60053,needname1="四转洪荒镯·武威",neednum1=1,needid2=60054,needname2="四转洪荒镯·烈焰",neednum2=1},

	[50059]={name="四转洪荒戒·武威",tarid=50062,tarname="五转开天戒·武威",needid1=50060,needname1="四转洪荒戒·烈焰",neednum1=1,needid2=50061,needname2="四转洪荒戒·无极",neednum2=1},
        [50060]={name="四转洪荒戒·烈焰",tarid=50063,tarname="五转开天戒·烈焰",needid1=50059,needname1="四转洪荒戒·武威",neednum1=1,needid2=50061,needname2="四转洪荒戒·无极",neednum2=1},
        [50061]={name="四转洪荒戒·无极",tarid=50064,tarname="五转开天戒·无极",needid1=50059,needname1="四转洪荒戒·武威",neednum1=1,needid2=50060,needname2="四转洪荒戒·烈焰",neednum2=1},

	[90037]={name="四转洪荒腰带·武威",tarid=90040,tarname="五转开天腰带·武威",needid1=90038,needname1="四转洪荒腰带·烈焰",neednum1=1,needid2=90039,needname2="四转洪荒腰带·无极",neednum2=1},
        [90038]={name="四转洪荒腰带·烈焰",tarid=90041,tarname="五转开天腰带·烈焰",needid1=90037,needname1="四转洪荒腰带·武威",neednum1=1,needid2=90039,needname2="四转洪荒腰带·无极",neednum2=1},
        [90039]={name="四转洪荒腰带·无极",tarid=90042,tarname="五转开天腰带·无极",needid1=90037,needname1="四转洪荒腰带·武威",neednum1=1,needid2=90038,needname2="四转洪荒腰带·烈焰",neednum2=1},

	[100037]={name="四转洪荒靴·武威",tarid=100040,tarname="五转开天靴·武威",needid1=100038,needname1="四转洪荒靴·烈焰",neednum1=1,needid2=100039,needname2="四转洪荒靴·无极",neednum2=1},
        [100038]={name="四转洪荒靴·烈焰",tarid=100041,tarname="五转开天靴·烈焰",needid1=100037,needname1="四转洪荒靴·武威",neednum1=1,needid2=100039,needname2="四转洪荒靴·无极",neednum2=1},
        [100039]={name="四转洪荒靴·无极",tarid=100042,tarname="五转开天靴·无极",needid1=100037,needname1="四转洪荒靴·武威",neednum1=1,needid2=100038,needname2="四转洪荒靴·烈焰",neednum2=1},
}

function process_zhuansheng_hecheng(player,actionset,panelid,actionid,data)
	if actionid == "hecheng" then
		process_hecheng(player,data);return;
	end
	
end
ckpanel.add_listener(ACTIONSET_NAME,process_zhuansheng_hecheng);

function process_hecheng(player,data)
	--if data and #data ==12 then
		--[[local eq_pos = tonumber(data[1]);local eq_id = tonumber(data[2]);local eq_num = tonumber(data[3]);
		local yu1_pos = tonumber(data[4]);local yu1_id = tonumber(data[5]);local yu1_num = tonumber(data[6]);
		local yu2_pos = tonumber(data[7]);local yu2_id = tonumber(data[8]);local yu2_num = tonumber(data[9]);

		if eq_id and eq_pos and eq_num and yu1_pos and yu1_id and yu1_num and yu2_pos and yu2_id and yu2_num then else return; end
		local eq_item = player:get_item(eq_id,eq_pos);if eq_item then else player:alert(1,1,"请放入装备进行升级."); return; end;
		local yu1_item = player:get_item(yu1_id,yu1_pos);
		local yu2_item = player:get_item(yu2_id,yu2_pos);
		local tar = js_data[eq_id];--]]
		local tar = js_data[40047];
		if tar then
		--	if player:num_item(tar.name) <= 0 then return; end
		--	local itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv,itupdcount,itupdac,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp = player:get_item_data(eq_id,eq_pos);
		--	if eq_item and yu1_item and yu2_item then
		--		if player:num_item(tar.name) <= 0 then return; end
				if player:num_item(tar.needname1) >= tar.neednum1  then 
					if  player:num_item(tar.needname2) >= tar.neednum2 then 
						if util.ppn(player,const.PP_SQJF) >= 100 then
							player:set_param(const.PP_SQJF,util.ppn(player,const.PP_SQJF)-100);
							player:remove_item(tar.name,1);
							player:remove_item(tar.needname1,tar.neednum1);
							player:remove_item(tar.needname2,tar.neednum2);
							player:add_item(tar.tarname,1,1);
							player:alert(1,1,"恭喜您成功将"..tar.name.."升级为"..tar.tarname.."!");
						else
							player:alert(1,1,"神器积分不足100!");
						end
					else
						player:alert(1,1,"您缺少"..tar.needname2);
					end
				else
					player:alert(1,1,"您缺少"..tar.needname1);	
				end
		--	end
		else
			player:alert(1,1,"当前装备不可以升级!");
		end
	--end
end