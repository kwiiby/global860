local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the great librarian."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am 486486 and NOT 'Blinky' as some people called me ... before they died."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's 1, not 'Tibia', silly."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard that elves moved in upstairs."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These fools and their superstitious life cult don't understand anything of importance."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Good tools to work with ... After their death, that is."})
keywordHandler:addKeyword({'orc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Noisy pests."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Their mages are so close to the truth. Closer then they know and closer then it's good for them."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They will mourn the day they abandoned us."})
keywordHandler:addKeyword({'death'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, yes, I will kill you soon enough, now let me continue my investigation on you."})
keywordHandler:addKeyword({'number'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Numbers are essential. They are the secret behind the scenes. If you are a master of mathematics you are a master over life and death."})
keywordHandler:addKeyword({'library'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a fine library, isn't it?"})
keywordHandler:addKeyword({'book'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our books are written in 469, of course you can't understand them."})
keywordHandler:addKeyword({'469'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The language of my kind. Superior to any other language and only to be spoken by entities with enough eyes to blink it."})
keywordHandler:addKeyword({'cyclops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uglyness incarnate. One eye! Imagine that! Horrible!"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only inferior species need weapons."})

npcHandler:addModule(FocusModule:new())