module(..., package.seeall)

local upd_table = {
	[1] = {upd_level=1,pay_money=10000,pay_vcoin=10,prob=90,attribute=10,rand_attribute=1},
	[2] = {upd_level=2,pay_money=20000,pay_vcoin=20,prob=80,attribute=20,rand_attribute=2},
	[3] = {upd_level=3,pay_money=30000,pay_vcoin=30,prob=70,attribute=30,rand_attribute=3},
	[4] = {upd_level=4,pay_money=40000,pay_vcoin=40,prob=60,attribute=40,rand_attribute=4},
	[5] = {upd_level=5,pay_money=50000,pay_vcoin=50,prob=50,attribute=50,rand_attribute=5},
	[6] = {upd_level=6,pay_money=60000,pay_vcoin=60,prob=40,attribute=60,rand_attribute=6},
	[7] = {upd_level=7,pay_money=70000,pay_vcoin=70,prob=30,attribute=70,rand_attribute=7},
	[8] = {upd_level=8,pay_money=80000,pay_vcoin=80,prob=20,attribute=80,rand_attribute=8},
	[9] = {upd_level=9,pay_money=90000,pay_vcoin=90,prob=10,attribute=90,rand_attribute=9},
	[10] = {upd_level=10,pay_money=100000,pay_vcoin=100,prob=5,attribute=100,rand_attribute=10},
};

function onUpgradeEquipD(player,pos_equip,append_flag)
	local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv,itupdcount,itupdac,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(pos_equip);
	if itupdlv<10 then
		if itupdcount<10 then
			local dc_temp=0;mc_temp=0;sc_temp=0;
			local rd_param=math.random(1,3);
			if rd_param==1 then
				dc_temp=upd_table[itupdlv+1].rand_attribute;
			end
			if rd_param==2 then
				mc_temp=upd_table[itupdlv+1].rand_attribute;
			end
			if rd_param==3 then
				sc_temp=upd_table[itupdlv+1].rand_attribute;
			end
			if append_flag == 1 then
				if upd_table[itupdlv+1].pay_vcoin<=player:get_vcoin() then
					if player:get_gamemoney_bind()+player:get_gamemoney()>upd_table[itupdlv+1].pay_money then
						local miss_money=upd_table[itupdlv+1].pay_money-player:get_gamemoney_bind();
						if miss_money>0 then
							player:sub_gamemoney_bind(upd_table[itupdlv+1].pay_money-miss_money);
							player:sub_gamemoney(miss_money);
						else
							player:sub_gamemoney_bind(upd_table[itupdlv+1].pay_money);
						end
						player:sub_vcoin(upd_table[itupdlv+1].pay_vcoin);
						if player:get_job_name()=="warrior" then
							dc_temp=dc_temp+upd_table[itupdlv+1].attribute;
						end
						if player:get_job_name()=="wizard" then
							mc_temp=mc_temp+upd_table[itupdlv+1].attribute;
						end
						if player:get_job_name()=="taoist" then
							sc_temp=sc_temp+upd_table[itupdlv+1].attribute;
						end
					player:set_item_data(ittype_id,pos_equip,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv+1,itupdcount+1,itupdac,itupdmac,itupddc+dc_temp,itupdmc+mc_temp,itupdsc+sc_temp,protect,addhp,addmp);
					player:log_item_change(132,2,pos_equip);
					player:alert(1,0,"强化成功");
					if itupdlv < 9 then
						player:upgrade_cost_d_res(upd_table[itupdlv+2].pay_money,upd_table[itupdlv+2].pay_vcoin,upd_table[itupdlv+2].prob,upd_table[itupdlv+2].attribute,upd_table[itupdlv+2].rand_attribute);
					end
					return 1;
					else
						player:alert(1,0,"金币不足");
						player:upgrade_cost_d_res(upd_table[itupdlv+1].pay_money,upd_table[itupdlv+1].pay_vcoin,upd_table[itupdlv+1].prob,upd_table[itupdlv+1].attribute,upd_table[itupdlv+1].rand_attribute);
						return 0;
					end
				else
					player:alert(1,0,"元宝不足");
					player:upgrade_cost_d_res(upd_table[itupdlv+1].pay_money,upd_table[itupdlv+1].pay_vcoin,upd_table[itupdlv+1].prob,upd_table[itupdlv+1].attribute,upd_table[itupdlv+1].rand_attribute);
					return 0;
				end
			else
				local rd_break=math.random(1,100);
				if rd_break<upd_table[itupdlv+1].prob then
					if player:get_gamemoney_bind()+player:get_gamemoney()>upd_table[itupdlv+1].pay_money then
						local miss_money=upd_table[itupdlv+1].pay_money-player:get_gamemoney_bind();
						if miss_money>0 then
							player:sub_gamemoney_bind(upd_table[itupdlv+1].pay_money-miss_money);
							player:sub_gamemoney(miss_money);
						else
							player:sub_gamemoney_bind(upd_table[itupdlv+1].pay_money);
						end
						player:sub_vcoin(upd_table[itupdlv+1].pay_vcoin);
						if player:get_job_name()=="warrior" then
							dc_temp=dc_temp+upd_table[itupdlv+1].attribute;
						end
						if player:get_job_name()=="wizard" then
							mc_temp=mc_temp+upd_table[itupdlv+1].attribute;
						end
						if player:get_job_name()=="taoist" then
							sc_temp=sc_temp+upd_table[itupdlv+1].attribute;
						end
					player:set_item_data(ittype_id,pos_equip,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv+1,itupdcount+1,itupdac,itupdmac,itupddc+dc_temp,itupdmc+mc_temp,itupdsc+sc_temp,protect,addhp,addmp);
					player:log_item_change(132,2,pos_equip);
					player:alert(1,0,"强化成功");
					if itupdlv < 9 then
						player:upgrade_cost_d_res(upd_table[itupdlv+2].pay_money,upd_table[itupdlv+2].pay_vcoin,upd_table[itupdlv+2].prob,upd_table[itupdlv+2].attribute,upd_table[itupdlv+2].rand_attribute);
					end
					return 1;
					else
						player:alert(1,0,"金币不足");
						player:upgrade_cost_d_res(upd_table[itupdlv+1].pay_money,upd_table[itupdlv+1].pay_vcoin,upd_table[itupdlv+1].prob,upd_table[itupdlv+1].attribute,upd_table[itupdlv+1].rand_attribute);
						return 0;
					end
				else
					player:set_item_data(ittype_id,pos_equip,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv,itupdcount+1,itupdac,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp);
					player:log_item_change(133,2,pos_equip);
					player:alert(1,0,"强化失败");
					player:upgrade_cost_d_res(upd_table[itupdlv+1].pay_money,upd_table[itupdlv+1].pay_vcoin,upd_table[itupdlv+1].prob,upd_table[itupdlv+1].attribute,upd_table[itupdlv+1].rand_attribute);
					return 0;
				end
			end
		else
			player:alert(1,0,"强化次数已用完");
			player:upgrade_cost_d_res(upd_table[itupdlv+1].pay_money,upd_table[itupdlv+1].pay_vcoin,upd_table[itupdlv+1].prob,upd_table[itupdlv+1].attribute,upd_table[itupdlv+1].rand_attribute);
			return 0;
		end
	else
		player:alert(1,0,"已经强化到顶级");
		player:upgrade_cost_d_res(0,0,0,0,0);
		return 0;
	end
	return 0;
end

function onUpgradeCostD(player,next_lv,param)
	if next_lv<10 then
		player:upgrade_cost_d_res(upd_table[next_lv].pay_money,upd_table[next_lv].pay_vcoin,upd_table[next_lv].prob,upd_table[next_lv].attribute,upd_table[next_lv].rand_attribute);
		return 1;
	end
	return 0;
end

function onUpgradeClearD(player,pos_equip,param)
	local ittype_id,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,itupdlv,itupdcount,itupdac,itupdmac,itupddc,itupdmc,itupdsc,protect,addhp,addmp,remaintime = player:get_item_data_by_pos(pos_equip);
	if(itupdlv>0) then
		player:set_item_data(ittype_id,pos_equip,itbind,ituse_bind,itjpin,itdura,itdurmax,itaddac,itaddmac,itadddc,itaddmc,itaddsc,itluck,0,0,itupdac,itupdmac,0,0,0,protect,addhp,addmp);
		player:log_item_change(134,3,pos_equip);
		player:alert(1,0,"清洗成功");
	end
	return 0;
end