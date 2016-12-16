module(..., package.seeall)
local ACTIONSET_NAME="kard";
local PANEL_ACTIONSET_NAME="panelkard";
--18077	null	0	尊武战圣 50
--18078	null	0	烈焰法神 50
--18079	null	0	道法天尊 50
--18080	null	0	撼天罗刹 100
--18081	null	0	炎阳金仙 200
--18082	null	0	流云散人 500

local kard_list={
	[1]={name="超级坐骑丹",typeid="151210910",bind=1,material={
		[1]={mname="尊武战圣",price=50,num=8},
		[2]={mname="撼天罗刹",price=100,num=5},
		},
	},
	[2]={name="超级进阶石包",typeid="151200910",bind=1,material={
		[1]={mname="烈焰法神",price=50,num=7},
		[2]={mname="炎阳金仙",price=200,num=3},
		},
	},
	[3]={name="超级真气丹",typeid="151220910",bind=1,material={
		[1]={mname="道法天尊",price=50,num=9},
		[2]={mname="流云散人",price=500,num=1},
		},
	},
	[4]={name="小型玄晶宝箱",typeid="151160910",bind=1,material={
		[1]={mname="尊武战圣",price=50,num=8},
		[2]={mname="烈焰法神",price=50,num=8},
		[3]={mname="道法天尊",price=50,num=8},
		},
	},
	[5]={name="中型玄晶宝箱",typeid="151170910",bind=1,material={
		[1]={mname="撼天罗刹",price=100,num=10},
		[2]={mname="炎阳金仙",price=200,num=5},
		[3]={mname="流云散人",price=500,num=4},
		},
	},
	[6]={name="大型玄晶宝箱",typeid="151180910",bind=1,material={
		[1]={mname="尊武战圣",price=50,num=20},
		[2]={mname="烈焰法神",price=50,num=20},
		[3]={mname="道法天尊",price=50,num=20},
		[4]={mname="撼天罗刹",price=100,num=20},
		[5]={mname="炎阳金仙",price=200,num=15},
		[6]={mname="流云散人",price=500,num=10},
		},
	},
}

function process_kard_buy(player,actionset,panelid,actionid,data)
	if activity.iskard() then
		if string.sub(actionid,1,5) == "btnDH" then
			local l = tonumber(string.sub(actionid,6));
			process_kard_detail(player,l);
		end 
		if string.sub(actionid,1,6) == "btnBuy" then
			local l = tonumber(string.sub(actionid,7))
			tip_buy_detail_kard(player,l); 
			return;
		end
		if string.sub(actionid,1,7) == "kardbuy" then
			local l = tonumber(string.sub(actionid,8));
			confirm_buy_detail_kard(player,l);
			return;
		end
	else
		player:alert(11,1,"非活动时间无法兑换");return;
	end
end
ckpanel.add_listener(ACTIONSET_NAME,process_kard_buy);
function open_panelkard(player)
	--reset_param(player);
	player:set_panel_data(PANEL_ACTIONSET_NAME,"panelduihuan","actiontype","");
	player:set_panel_data(PANEL_ACTIONSET_NAME,"panelduihuan","action","");
	player:set_panel_data(PANEL_ACTIONSET_NAME,PANEL_ACTIONSET_NAME,"panel_visible","true");
	player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
end

function process_kard_detail(player,de)
	local ndata = kard_list[de];
	if ndata then
		if player:num_bag_black() < 1 then
			player:alert(11,1,"背包不足1格,兑换失败!");return;
		end
		for i=1,#ndata.material do
			if player:num_item(ndata.material[i].mname,1)<ndata.material[i].num then
				player:alert(11,1,"背包 "..ndata.material[i].mname.." 数量不足 "..ndata.material[i].num.." 个,兑换失败");return;
			end
		end
		for j=1,#ndata.material do
			player:remove_item(ndata.material[j].mname,ndata.material[j].num);
		end
		player:add_item_log(ndata.name,412,1,1);
		server.log_count(3,const.PPC_ACTIVE_KARDDUIHUAN,1);
		server.log_count(3,ndata.typeid,1);
		player:alert(1,1,"成功兑换 "..ndata.name);
	else
		print("have no item in kard_list");
	end

end
function tip_buy_detail_kard(player,id)
	local mbuyd = kard_list[id];
	local tipStr="缺少 ";
	local allVcoin = 0;
	local diffnum = 0;
	if mbuyd then
		if player:num_bag_black() < 1 then
			player:alert(11,1,"背包不足1格,无法购买!");return;
		end		
		for i=1,#mbuyd.material do
			diffnum=mbuyd.material[i].num - player:num_item(mbuyd.material[i].mname,1);
			if diffnum > 0 then
				tipStr=tipStr..mbuyd.material[i].mname .." "..diffnum.." 张,";
				allVcoin=allVcoin+diffnum*mbuyd.material[i].price;
			end
		end
		tipStr=tipStr.."将使用 "..allVcoin.." 元宝补齐";
		if allVcoin>0 then
			player:set_panel_data(PANEL_ACTIONSET_NAME,"panelduihuan","actiontype","kardbuy"..id);
			player:set_panel_data(PANEL_ACTIONSET_NAME,"panelduihuan","action",tipStr);
			player:push_ckpanel_data(ACTIONSET_NAME,PANEL_ACTIONSET_NAME);
		else
			process_kard_detail(player,id);
		end
	end
end
function confirm_buy_detail_kard(player,id)
	local mbuyd = kard_list[id];
	local allVcoin = 0;
	local diffnum = 0;
	local subTab = {};
	if mbuyd then
		if player:num_bag_black() < 1 then
			player:alert(11,1,"背包不足1格,无法购买!");return;
		end		
		for i=1,#mbuyd.material do
			diffnum=mbuyd.material[i].num - player:num_item(mbuyd.material[i].mname,1);
			if diffnum > 0 then
				allVcoin=allVcoin+diffnum*mbuyd.material[i].price;
				table.insert(subTab,{
					iname = mbuyd.material[i].mname,
					inum =  player:num_item(mbuyd.material[i].mname,1),
				});
			else
				table.insert(subTab,{
					iname = mbuyd.material[i].mname,
					inum =  mbuyd.material[i].num,
				});
			end
		end
		if	player:get_vcoin()>=allVcoin then
			for j=1,#subTab do
				if subTab[j].inum>0 then
					player:remove_item(subTab[j].iname,subTab[j].inum);
				end
			end

			player:sub_vcoin(allVcoin,"kardduihuan");
			player:add_item_log(mbuyd.name,413,1,1);
			server.log_count(3,const.PPC_ACTIVE_KARDDUIHUAN,1);
			server.log_count(3,mbuyd.typeid,1);
			player:alert(1,1,"成功购买 "..mbuyd.name);
		else
			player:alert(1,1,"元宝不足");
		end
	end
end