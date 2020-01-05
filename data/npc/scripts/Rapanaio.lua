local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
local storage = 100000
 
-- Storages:
-- 1 = Joining Inquisition
-- 2 = Start Mission 1
-- 3 = Finish Mission 1
-- 4 = Start Mission 2
-- 5 = Finish Mission 2
-- 6 = Start Mission 3
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid] = 0
	return true
end
 
function creatureSayCallback(cid, type, msg)
   local v = getPlayerStorageValue(cid, storage)
   if not npcHandler:isFocused(cid) then return false end
	if msgcontains(msg, 'no') and Topic[cid] >= 1 then
		npcHandler:say("Not then.",cid)
		Topic[cid] = 0
	end
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, storage) == -1 then
		npcHandler:say('Mission you say? Well MY mission is to fight evil with every power at my *disposal! Hm, perhaps you have it in you to join the {fight}.', cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if msgcontains(msg, 'fight') then
			npcHandler:say('It is my calling to root out {evil} in all its forms and uphold the vigilant *fight. It is a lonely fight, an unending fight, but someone has to do it! ...', cid)
			npcHandler:say("I scour ancient texts and collect rumours in taverns in order to track the machinations of {evil}. ...",cid, 4500)
			npcHandler:say("Often odd occurrences are overlooked by the public as strange coincidences or fate, but those who know what to look for see the foot prints ofevil in history.",cid, 8500)
			Topic[cid] = 2
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, 'evil') then
			npcHandler:say("Evil lurks everywhere. It only takes some ignorant or cowardly people to turn their heads away once too often for it to spread its ugly seeds. I, however, am constantly vigilant and always prepared. ...",cid)
			npcHandler:say("I {hunt} out the signs of evil everywhere. Even in the face of scorn and {ridicule}, I will not hide my head in the sand and I will be ready to fight!",cid, 4000)
			Topic[cid] = 3
		end
	elseif Topic[cid] == 3 then
		if msgcontains(msg, 'hunt') then
			npcHandler:say("It is my calling to root out evil in all its forms and uphold the vigilant fight. It is a lonely fight, an unending fight, but someone has to do it! ...",cid)
			npcHandler:say("I scour ancient texts and collect rumours in taverns in order to track the machinations of {evil}. ...",cid, 4000)
			npcHandler:say("Often odd occurrences are overlooked by the public as strange coincidences or fate, but those who know what to look for see the footprints of evil in history.",cid, 7000)
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 then
		if msgcontains(msg, 'ridicule') then
			npcHandler:say("Ignorance is evil's most potent ally. The servants of evil are plotting to keep us ignorant and poke {ridicule} at those who come too close to the {truth}.",cid)
			Topic[cid] = 5
		end
	elseif Topic[cid] == 5 then
		if msgcontains(msg, 'truth') then
			npcHandler:say("When I found that ancient text, warning of the {Isle of Evil}, I tried to tell the world about it. But the forces of {evil} discovered my plans! They made people assume it was just another tale for children. ...",cid)
			npcHandler:say("THEY distributed a book of children's bedtime stories with a copy of the text in it to undermine my message! Their despicable ruse worked and they made a laughing stock of me! Of course I knew it was a plot to discredit me. ...",cid, 3500)
			npcHandler:say("On the other hand, it was obvious that THEY now knew about me and the text I possessed. I went into hiding in fear of my life! THEY have tried to assassinate me! I must be constantly vigilant!",cid, 7300)
			Topic[cid] = 6
		end
	elseif Topic[cid] == 6 then
		if msgcontains(msg, 'isle of evil') then
			npcHandler:say("I KNOW it's out there! And I have proof! You see, I have constructed an evil-o-meter! It is an invention that locates places of great evil, such as the Ghostlands, the Plains of Havoc and the Edron Ruins. ...",cid)
			npcHandler:say("But then it registered another impulse. I tried my best to locate this impulse, believing it would probably point to another well known source of evil like the Hellgate. ...",cid, 4000)
			npcHandler:say("I was alarmed to realise that it was pointing to a remote isle that had been previously assumed to be uninhabited. I know that some horrendous evil lurks there. Some unspeakable horror, waiting to kill and devour unsuspecting travellers. ...",cid, 8000)
			npcHandler:say("I could not let that happen! So I did some research. Just as I was on the brink of giving up in desperation, I stumbled upon an ancient text that told of the {Isle of Evil}! ...",cid, 13000)
			npcHandler:say("Immediately, the nature of the threat I had discovered became alarmingly clear! All I needed was a hero and some transport. But would they listen?! NO! They laughed at me. Ignorance is Evil's helper! ...",cid, 16500)
			npcHandler:say("I still lack transport and a hero. Hmm .. seeing as I have no hero, you will have to do. What do you think? Are you willing to risk life and limb to save mankind? And womankind, of course?",cid, 21500)
			Topic[cid] = 7
		end
	elseif Topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("Although my instincts tell me to be wary of you, stranger, turning up so conveniently, I have no choice but to accept your help. ...",cid)
			npcHandler:say("Have a care! I have eyes like a hawk and am ever vigilant! If you even think about betraying me, I'll know! Well, I guess we had better talk about your first {mission}.",cid, 3000)
			setPlayerStorageValue(cid,storage, 1)
			setPlayerStorageValue(cid,100063, 1)
			setPlayerStorageValue(cid,100162, 1)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'mission') then
		local v = getPlayerStorageValue(cid, storage)
		if v == 1 then -- Start Mission 1 - The interrogation
		    npcHandler:say("They say there's a positive side to everything! And in this case it is perfectly true! In order for you to reach the Isle of Evil and slay its unspeakable horrors we will first finish my latest invention! ...",cid)
		    npcHandler:say("As you might have guessed I am a highly talented inventor. Still, even inventors sometimes need some kind of .. inspiration. I can't tell you too much about your next mission since our enemies might capture and torture you for information. ...",cid, 4000)
		    npcHandler:say("I optimized my invention by studying fish. Suffice it to say, I need one further specimen to study to put the finishing touches on my machine. ...",cid, 8000)
		    npcHandler:say("I am afraid I need a specific fish, of course, as an ordinary fish just won't do the trick. Actually it is not a real fish but a kind of machine with the likeness of a fish! ...",cid, 12000)
		    npcHandler:say("Imagine what I could learn from such a fish! And imagine what harm could be done if this fish were to fall into the wrong hands! We must retrieve that fish! ...",cid, 16000)
		    npcHandler:say("Apparently, the people in the city of Yalahar had a mechanical fish, fish which are essential for my research. ...",cid, 20000)
		    npcHandler:say("Now those Yalahari are quite elusive and even if we could get in contact with one of them, buying a fish from them would surely cost a fortune which we don't posses. ...",cid, 23000)
		    npcHandler:say("But my sources have informed me that some of these fish might have escaped into the local sewers! Based on my knowledge of the fish I have designed a mechanical fishing rod which you can use. ...",cid, 27000)
		    npcHandler:say("You won't catch any other fish with it but without it you haven't a chance of catching a mechanical fish. You will need to use nails as bait. ...",cid, 30000)
		    npcHandler:say("Well perhaps I should mention a minor, insignificant problem that might occur. ...",cid, 33000)
		    npcHandler:say("Due to the metallic nature of the fishing rod there is the very remote possibility that you might get into contact with one of the electric eels thatalso live in the sewers. ...",cid, 35000)
		    npcHandler:say("In which case you might feel a little tingle from a teency tiny electric shock. I can't tell what effect that might have on your health but you should probably be careful that you are not badly wounded while fishing. ...",cid, 39000)
		    npcHandler:say("Hm, thinking about it, perhaps those eels are part of the evil plan to thwart our efforts, who knows? So are you ready for that {mission}?",cid, 44000)
		    setPlayerStorageValue(cid, storage, 2)
		elseif v == 3 then
	       npcHandler:say("Have you caught the mechanical fish?",cid)
	       Topic[cid] = 9
  		elseif v == 4 then
	       npcHandler:say("The machines of the .. uhm my inventions need a potent fuel. I have run hundreds of tests and found that only the most potent rum makes the most powerful fuel ...",cid)
	       npcHandler:say("I did have enough rum to make the trip but .. well, you know .. the lads came over to celebrate my birthday and we ended up .. uhm testing the fuel.. Damn that tasty rum! Well its a risk of the job when the fuel tastes that good ...",cid, 3000)
	       npcHandler:say("However, we will need some new fuel. 10 vials of rum exactly. ...",cid, 7500)
	       npcHandler:say("Remember it has to be vials because after we got drunk one of the lads wandered of with my funnel thinking it was hat. Only vials will fit into my machine.",cid, 10000)  
	       setPlayerStorageValue(cid, storage, 5)
	       setPlayerStorageValue(cid,100063, 6)
		elseif v == 5 then
	       npcHandler:say("Do you have the rum .. erm the fuel with you?",cid)
	       Topic[cid] = 10
		elseif v == 6 then
	       npcHandler:say("Now that we have the rum, I still desperately need a {vial of fruit juice} to keep things going. Just get me one so we can proceed.",cid)
	       setPlayerStorageValue(cid, storage, 7)
		setPlayerStorageValue(cid,100063, 8)
		elseif v == 7 then
	       npcHandler:say("So you have brought me a {vial of fruit juice}?",cid)
	       Topic[cid] = 11
		elseif v == 8 then
	       npcHandler:say("My invention is only as good as the engine that powers it. I need a high quality steam machine from the technomancers guild. You should ask my old mate {Scutty} about one. ...",cid)
	       npcHandler:say("I have already sent him a request and some gold but chances are you will need to convince him somehow to lend us his precious machine.",cid, 4500)
	       setPlayerStorageValue(cid, storage, 9)
		setPlayerStorageValue(cid,100063, 10)
		elseif v == 9 then
	       npcHandler:say("Did you get the requested machine from {Scutty}?",cid)
	       Topic[cid] = 12
		elseif v == 10 then
	       npcHandler:say("The evil we are fighting has not chosen the Isle of Evil on a mere whim. Quite the contrary, it has shown strategic genius by selecting an isle surrounded by hidden reefs and treacherous waters. ...",cid)
	       npcHandler:say("This serves not only to conceal it from prying eyes, but it also poses a serious threat to anyone who wants to travel there. ...",cid, 4000)
	       npcHandler:say("The sea around that isle is as dangerous as the isle and its inhabitants themselves. ...",cid, 7000)
	       npcHandler:say("Without a proper map we are doomed! Doomed, I tell you! ...",cid, 9000)
	       npcHandler:say("I have found out that a ship from the Explorers' Society charted the sea around the isle some years ago, so they should have some decent maps of that area ...",cid, 11000)
	       npcHandler:say("According to my sources, the map is now being kept at one of their northern outposts. It is somewhere north east of Carlin, in a hamlet on the coast. Get that map and we'll soon be on our way to vanquish evil! ...",cid, 14000)
	       npcHandler:say("And be warned: if the servants of evil have learned about the map it means not only the map and the Explorers' Society are in grave danger but also you and your mission could be in peril. Trust no one. ...",cid, 18000)
	       npcHandler:say("Don't accept gifts from strangers and don't hitchhike in strangers' wagons. Don't sit with your back to the door in a tavern and what the heck would you be doing in a tavern while on an urgent mission anyway? ...",cid, 24000)
	       npcHandler:say("Rest assured in the unfortunate case of your death, you will be avenged. Well, only in the unlikely case that you die while on this mission, of course.",cid, 28000)
	       setPlayerStorageValue(cid, storage, 11)
	       setPlayerStorageValue(cid,100063, 15)
	       Topic[cid] = 0 
		elseif v == 11 then
	       npcHandler:say("So did you get that nautical map?",cid)
	       Topic[cid] = 13
		elseif v == 12 then
	       npcHandler:say("While you were getting the map I put the finishing touches on our vessel. The machine works fine and with the improvements I have made, it should enable us to brave the seas to reach our destination. ...",cid)
	       npcHandler:say("Meet me downstairs where you will learn more about our secret weapon.",cid, 4500)
	       setPlayerStorageValue(cid, storage, 13)
	       setPlayerStorageValue(cid, 100063, 19)
        end
	elseif v == 2 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if getPlayerStorageValue(cid, storage) == 2 then
			    npcHandler:say("Great. Here is your fishing rod. Happy fishing. Don't return without the mechanical fish. Make sure you are not followed!.",cid)
				setPlayerStorageValue(cid, storage, 3)
				doPlayerAddItem(cid, 10223, 1)
				setPlayerStorageValue(cid,100063, 3)
				setPlayerStorageValue(cid,100162, 2)
			else
				npcHandler:say("Go and continue with your mission.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 9 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if doPlayerTakeItem(cid, 10224, 1) then
			    npcHandler:say("Interesting, a most interesting construction. A marvel of science. While I try to figure out how it works you might as well continue with your next {mission}.",cid)
				setPlayerStorageValue(cid, storage, 4)
				setPlayerStorageValue(cid,100063, 5)
				setPlayerStorageValue(cid,100162, 3)
			else
				npcHandler:say("Come back when you caught the mechanical fish.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 10 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2006,10,27) then
			    npcHandler:say("You did it! Ye Gods, what a temptation! But I will not give in! I will put it into the machine as soon as possible. Oh and if you happen to see a dwarf wearing a funnel, please ask him to return it to me. ....",cid)
			    npcHandler:say("But now let's talk about your next {mission}.",cid, 4000)
				setPlayerStorageValue(cid, storage, 6)
				setPlayerStorageValue(cid,100063, 7)
				setPlayerStorageValue(cid,100162, 4)
			else
				npcHandler:say("Come back when you have the rum .. erm the fuel.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 11 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
        if doPlayerRemoveItem(cid, 2006, 1, 21) then
			    npcHandler:say("Ahhhh that juice was just what I needed. I haven't had any fruit juice for ages! You can't fight evil the whole day without allowing yourself a small treat! ...",cid)
			    npcHandler:say("Though I bet it would have tasted better in a glass with one of those amusing umbrellas on top! But I don't blame you. ...",cid, 4000)
			    npcHandler:say("I fear we hunters of evil must be content with the small pleasures life grants us. Now where were we? Oh, yes you are probably eager to learn about your next {mission} as part of our big plan!",cid, 8500)
				setPlayerStorageValue(cid, storage, 8)
			    setPlayerStorageValue(cid,100063, 9)
				setPlayerStorageValue(cid,100162,5)
			else
				npcHandler:say("Come back when you have the fruit juice.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		end
	elseif Topic[cid] == 12 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
        if getPlayerStorageValue(cid, 100003) == 8 then
			if doPlayerRemoveItem(cid, 10307,1) then
			    npcHandler:say("Ah, marvellous. That's the little beauty I was looking for. It will fit perfectly into my invention. Not much longer and we can start on our journey. However, I have another {mission} for you.",cid)
				setPlayerStorageValue(cid, storage, 10)
				setPlayerStorageValue(cid,100063, 14)
				setPlayerStorageValue(cid,100162, 6)
			else
				npcHandler:say("Come back when you have the crate.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		    end
		end
	elseif Topic[cid] == 13 then -- Finish mission 1 - The interrogation
		if msgcontains(msg, 'yes') then
        if getPlayerStorageValue(cid, 100004) >= 1 then
			if doPlayerRemoveItem(cid, 10225,1) then
			    npcHandler:say("Hmm, what fine maps those explorers draw. Wouldn't it be a cunning idea to tattoo it on your back where evil would least expect to find it! I guess with a nail from my workshop and a bucket of old ship paint I could improvise that. ...",cid)
			    npcHandler:say("On the other hand the forces of evil probably know all too well that I am cunning, so I have to surprise them with the unexpected! I'll just hide it in my beard! There we go. Now lets talk about our final {mission}.",cid, 4500)
			    setPlayerStorageValue(cid, storage, 12)
			    setPlayerStorageValue(cid, 100063, 18)
				setPlayerStorageValue(cid,100162, 7)
			else
				npcHandler:say("Come back when you have the map.", cid)
			end
		else
			npcHandler:say("You better don't return here until you've finished your {mission}.", cid)
		    end
		end
		Topic[cid] = 0
		end
	return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Psht! Not that loud! Evil lurks everywhere.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())