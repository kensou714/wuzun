module(..., package.seeall)
local fd={
	task_title       ={win=1003,text="点击此处继续任务",posx=141,posy=42},
	taks_continue    ={win=1003,text="点击此处继续任务",posx=141,posy=200},
	mini_task        ={win=1007,text="点击绿色文字自动找到任务人",posx=-144, posy=54},
};
function f(player,fn)
	local d = fd[fn];
	if d then
		if player:get_level() <= 40 then
			player:gui_high_focus(d.win,d.text,d.posx,d.posy);
		end
	end
end