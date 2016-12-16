module(..., package.seeall)
local guanzhi={
	[1]={lv=1,attr={attmin=6,attmax=10,defmin=0,defmax=0,fight=36},},
	[2]={lv=2,attr={attmin=12,attmax=20,defmin=0,defmax=0,fight=72},},
	[3]={lv=3,attr={attmin=24,attmax=40,defmin=0,defmax=0,fight=144},},
	[4]={lv=4,attr={attmin=36,attmax=60,defmin=0,defmax=0,fight=216},},
	[5]={lv=5,attr={attmin=48,attmax=80,defmin=0,defmax=0,fight=288},},
	[6]={lv=6,attr={attmin=72,attmax=120,defmin=0,defmax=0,fight=432},},
	[7]={lv=7,attr={attmin=96,attmax=160,defmin=0,defmax=0,fight=576},},
	[8]={lv=8,attr={attmin=120,attmax=200,defmin=0,defmax=0,fight=721},},
	[9]={lv=9,attr={attmin=156,attmax=260,defmin=0,defmax=0,fight=936},},
	[10]={lv=10,attr={attmin=192,attmax=320,defmin=0,defmax=0,fight=1152},},
	[11]={lv=11,attr={attmin=240,attmax=400,defmin=0,defmax=0,fight=1440},},
	[12]={lv=12,attr={attmin=300,attmax=500,defmin=0,defmax=0,fight=1879},},
	[13]={lv=13,attr={attmin=420,attmax=700,defmin=0,defmax=0,fight=2630},},
	[14]={lv=14,attr={attmin=600,attmax=1000,defmin=0,defmax=0,fight=3757},},
	[15]={lv=15,attr={attmin=840,attmax=1400,defmin=0,defmax=0,fight=5260},},
	[16]={lv=16,attr={attmin=1200,attmax=2000,defmin=0,defmax=0,fight=7515},},
};
function first_set_guanzhi_attr(player)
	for i=1,#guanzhi do
		if guanzhi[i] then
			player:set_guanzhilv_data(guanzhi[i].lv,guanzhi[i].attr.attmin,guanzhi[i].attr.attmax,guanzhi[i].attr.fight,guanzhi[i].attr.defmin,guanzhi[i].attr.defmax);
		end
	end
end
login.add_login_listener(first_set_guanzhi_attr);