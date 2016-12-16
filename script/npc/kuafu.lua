module(..., package.seeall)

function onTalk100(npc,player)
	npc:echo([[
              异界传送员

   感谢您来到异界征战，欢迎下次再来！          
           
        
   <a href="event:talk_back">回到原界</a>


   ]]);
end

function onTalkback(npc,player)
	player:alert(1,1,"即将回到原界...");
	player:kuafu_back_gs("");
end