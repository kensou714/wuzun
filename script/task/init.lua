module(..., package.seeall)
require "task.util"
require "task.task1000"
require "task.task1101"
require "task.task1102"
require "task.task1103"
require "task.task1104"
require "task.task1105"
require "task.task1106"
require "task.task2001"
require "task.task2002"
require "task.task2003"
require "task.task2004"
require "task.task3001"
require "task.task3002"
require "task.task3003"
require "task.task3004"
require "task.task3005"
require "task.task3006"
require "task.task3010"
require "task.task3100"
require "task.task2005"
require "task.task2006"

function on_login(player)
	player:set_task_state(const.TASK_ID_FUBEN_SEXP,0);
	player:push_task_data(const.TASK_ID_FUBEN_SEXP,0);
	player:set_task_state(const.TASK_ID_ZMT,0);
	player:push_task_data(const.TASK_ID_ZMT,0);
	player:set_task_state(const.TASK_ID_FUBEN_GUILD,0);
	player:push_task_data(const.TASK_ID_FUBEN_GUILD,0);
end
login.add_login_listener(on_login);
