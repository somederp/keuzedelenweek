--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

--add images

whaleSolved = false
platformUp = false
whaleOut = false
windmillSolved = false
fanSpeed = 0
ballSolved = false
doorLock = false

function story(aName)
	if(aName == "start") then
		CLS()
		createTextfield("Welcome to the VOID.")
		createButton("start2", "What?")
	elseif(aName == "start2") then
		CLS()
		createTextfield("Things explode when ya touch 'em.")
		createButton("start3", "Oh ok.")
	elseif(aName == "start3") then
		CLS()
		createTextfield("Aight go forward to leave.")
		createButton("eggRoom", "Go forward.")
	elseif(aName == "eggRoom") then	
		CLS()
		createTextfield("There's an egg in front of you. there are also three\nmore rooms.")
		createButton("westBallMazeEntrance", "Check the western room.")
		createButton("eastWindmillEntrance", "Check the eastern room.")
		createButton("northWhaleEntrance", "Check the northern room.")
		--add eggsplosion ending
		--add variable check
	elseif(aName == "northWhaleEntrance") then
		CLS()
		createTextfield("You look into the room and see a platform on your left\nand a fish tank with a whale on your right.")
		createButton("northwhale", "Go in.")
	elseif(aName == "northwhale") then
		CLS()
		doorLock = true
		--text go here
		--platform buttons go here
	end
end

