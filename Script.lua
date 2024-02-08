--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--


whaleSolved = false
windmillSolved = false
ballSolved = false
doorLock = false

function story(aName)
	if(aName == "start") then
		CLS()
		setBackground("")
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
		setBackground("egg.jpg")
		if(whaleSolved == true and windmillSolved == true and ballSolved == true) then
			createTextfield("After the three rooms you realise what you must do.")
			createButton("goodEnd", "Blow on the egg.")
		else
			createTextfield("There's an egg in front of you. there are also three\nmore rooms.")
			createButton("eggsplosionEnd", "Touch the egg.")
			createButton("westBallMazeEntrance", "Check the western room.")
			createButton("eastWindmillEntrance", "Check the eastern room.")
			createButton("northWhaleEntrance", "Check the northern room.")
		end
	elseif(aName == "eggsplosionEnd") then
		CLS()
		setBackground("explosion.jpg")
		playSound("deltarune-explosion.wav")
		createTextfield("You poke the egg and it explodes.\nThey didn't lie...")
		createButton("start", "dang.")
	elseif(aName == "northWhaleEntrance") then
		CLS()
		setBackground("whale.jpg")
		createTextfield("You look into the room and see a platform on your left\nand a fish tank with a whale on your right.")
		createButton("eggRoom", "Turn back.")
		createButton("northwhale", "Go in.")
	elseif(aName == "northwhale") then
		CLS()
		if(whaleSolved == false) then
			doorLock = true
		end
		if(doorLock == true) then
			createTextfield("As you step into the room the door closes behind you.\nMight aswell check out the platform.")
			createButton("northwhalePlatform", "Do so.")
		else
			createTextfield("As you leave you feel like you should remember what\n you looked at.")
			createButton("eggRoom", "Back to egg.")
		end
		elseif(aName == "northwhalePlatform") then
			CLS()
			createTextfield("You step onto the platform and see 3 buttons in\nfront of you.")
			createButton("northwhalePlatformRaised", "Press the up/down arrow button.")
			createButton("whalesplosionEnd", "Press the whale button.")
			createButton("pointlessZoom", "Press the magnifying glass button.")
		elseif(aName == "pointlessZoom") then
			CLS()
			createTextfield("A magnifying glass comes down from the ceiling.\nBut it's too high to see through...")
			createButton("northwhalePlatform", "Press button again.")
		elseif(aName == "whalesplosionEnd") then
			CLS()
			setBackground("explosion.jpg")
			playSound("deltarune-explosion.wav")
			createTextfield("The fish tank pops out of the wall directly into\nyou! And promptly explodes.")
			createButton("start", "dang.")
		elseif(aName == "northwhalePlatformRaised") then
			CLS()
			createTextfield("The platform is now raised up.")
			createButton("northwhalePlatform", "Press the up/down arrow button.")
			createButton("whaleExtruded", "Press the whale button.")
			createButton("pointlessZoom2", "Press the magnifying glass button.")
		elseif(aName == "pointlessZoom2") then
			CLS()
			createTextfield("A magnifying glass comes down from the ceiling.\nBut there's nothing to look at...")
			createButton("northwhalePlatformRaised", "Press button again.")
		elseif(aName == "whaleExtruded") then
			CLS()
			createTextfield("The fish tank pops out of the wall. The whale\nis now below you.")
			createButton("", "The arrow button doesn't work.")
			createButton("northwhalePlatformRaised", "Press the whale button again.")
			createButton("whaleInspection", "Press the magnifying glass button.")
		elseif(aName == "whaleInspection") then
			CLS()
			createTextfield("Where do you want to look?")
			createButton("inspectTail", "The tail.")
			createButton("inspectFlippers", "The flippers.")
			createButton("inspectBlowhole", "The blowhole.")
		elseif(aName == "inspectBlowhole") then
			CLS()
			whaleSolved = true
			doorLock = false
			createTextfield("As you look at the blowhole, you hear the door\nopen up.")
			createButton("northwhale", "Sweet.")
		elseif(aName == "inspectFlippers") then
			CLS()
			createTextfield("You look at the flippers, but nothing happens.")
			createButton("inspectBlowhole", "Look at the blowhole instead.")
			createButton("inspectTail", "Look at the tail instead.")
		elseif(aName == "inspectTail") then
			CLS()
			createTextfield("You look at the tail, but nothing happens.")
			createButton("inspectBlowhole", "Look at the blowhole instead.")
			createButton("inspectFlippers", "Look at the flippers instead.")
		elseif(aName == "eastWindmillEntrance") then
			CLS()
			setBackground("windmill.jpg")
			createTextfield("You look into the room and see a windmill on\nyour right and a fan on your left.")
			createButton("eggRoom", "Turn back.")
			createButton("eastWindmill", "Go in.")
		elseif(aName == "eastWindmill") then
			CLS()
			if(windmillSolved == false) then
				doorLock = true
			end
			if(doorLock == true) then
			createTextfield("The door closes as you step into a small enclosed\narea with a dial in front of you.")
			createButton("wind3", "Turn the dial to 3")
			createButton("wind2", "Turn the dial to 2")
			createButton("wind1", "Turn the dial to 1")
			else
				createTextfield("As you turn around and leave, you feel you\nshould remember what you saw.")
				createButton("eggRoom", "back to egg.")
			end
		elseif(aName == "wind3") then
			CLS()
			setBackground("explosion.jpg")
			playSound("deltarune-explosion.wav")
			createTextfield("The windspeed is too much for the windmill, and\nit breaks apart; hitting you and exploding.")
			createButton("start", "dang.")
		elseif(aName == "wind1") then
			CLS()
			createTextfield("The fan makes a slight breeze, but it does nothing.")
			createButton("wind3", "Turn the dial to 3")
			createButton("wind2", "Turn the dial to 2")
		elseif(aName == "wind2") then
			CLS()
			windmillSolved = true
			doorLock = false
			createTextfield("With the windmill recieving the right input\nthe door opens up.")
			createButton("eastWindmill", "Cool.")
		elseif(aName == "westBallMazeEntrance") then
			CLS()
			setBackground("mazeFromEntrance.jpg")
			createTextfield("You look into the room and see a box with a ball in one corner.")
			createButton("eggRoom", "Turn back.")
			createButton("westBallMaze", "Go in.")
		elseif(aName == "westBallMaze") then
			CLS()
			setBackground("maze.jpg")
			if(ballSolved == false) then
				doorLock = true
			end
			if(doorLock == true) then
				createTextfield("The door closes behind as you approach the box, which says\n'MAZE' on it. There's a control lever in front. There's a map behind you.")
				createButton("mapView", "Look at map.")
				createButton("mazeStart", "Grab the lever.")
			else
				createTextfield("As you leave, you feel you should remember what just\nhappened.")
				createButton("eggRoom", "Back to egg.")
			end
			elseif(aName == "mapView") then
				CLS()
				setBackground("mazeMap.jpg")
				createButton("westBallMaze", "look at maze.")
			elseif(aName == "mazeStart") then
				CLS()
				setBackground("maze.jpg")
				createTextfield("The only way is up.")
				createButton("mazeStarted", "Go up.")
			elseif(aName == "mazeStarted") then
				CLS()
				setBackground("mazeStarted.jpg")
				createTextfield("You can go right or down.")
				createButton("maze1", "Go right.")
				createButton("mazeStart", "Go down.")
			elseif(aName == "maze1") then
				CLS()
				createTextfield("You can go left, down or right.")
				createButton("maze2", "Go right.")
				createButton("deadEnd1", "Go down.")
				createButton("mazeStarted", "Go left.")
			elseif(aName == "deadEnd1") then
				CLS()
				createTextfield("Dead end...")
				createButton("maze1", "Go back.")
			elseif(aName == "maze2") then
				CLS()
				createTextfield("You can go up, left or down.")
				createButton("maze3", "Go down.")
				createButton("maze1", "Go left.")
				createButton("wrongWay1", "Go up.")
			elseif(aName == "maze3") then
				CLS()
				createTextfield("You can go up or right.")
				createButton("maze4", "Go right.")
				createButton("maze2", "Go up.")
			elseif(aName == "maze4") then
				CLS()
				createTextfield("You can go up or left.")
				createButton("maze3", "Go left.")
				createButton("maze5", "Go up.")
			elseif(aName == "maze5") then
				CLS()
				createTextfield("You can go up, left or down.")
				createButton("maze4", "Go down.")
				createButton("maze6", "Go left.")
				createButton("deadEnd2", "Go up.")
			elseif(aName == "deadEnd2") then
				CLS()
				createTextfield("Dead end...")
				createButton("maze5", "Go back.")
			elseif(aName == "maze6") then
				CLS()
				createTextfield("You can go up, down or right.")
				createButton("maze5", "Go right.")
				createButton("deadEnd3", "Go down.")
				createButton("mazeGoal", "Go up.")
			elseif(aName == "mazeGoal") then
				CLS()
				ballSolved = true
				doorLock = false
				createTextfield("You hear the ball drop and activate a switch\nthat opens the door.")
				createButton("westBallMaze", "Neat.")
			elseif(aName == "deadEnd3") then
				CLS()
				createTextfield("Dead end...")
				createButton("maze6", "Turn back.")
			elseif(aName == "wrongWay1") then
				CLS()
				createTextfield("You can go left or down.")
				createButton("maze2", "Go down.")
				createButton("wrongWay2", "Go left.")
			elseif(aName == "wrongWay2") then
				CLS()
				createTextfield("You can go up, left or right.")
				createButton("wrongWay1", "Go right.")
				createButton("wrongWay3b", "Go left.")
				createButton("wrongWay3a", "Go up.")
			elseif(aName == "wrongWay3a") then
				CLS()
				createTextfield("You can go left, down or right.")
				createButton("deadEnd5", "Go right.")
				createButton("wrongWay2", "Go down.")
				createButton("deadEnd4", "Go left.")
			elseif(aName == "wrongWay3b") then
				CLS()
				createTextfield("You can go down or right.")
				createButton("wrongWay2", "Go right.")
				createButton("wrongWay4", "Go down.")
			elseif(aName == "wrongWay4") then
				CLS()
				createTextfield("You can go up or right.")
				createButton("deadEnd6", "Go right.")
				createButton("wrongWay3b", "Go up.")
			elseif(aName == "deadEnd4") then
				CLS()
				createTextfield("Dead end...")
				createButton("wrongWay3a", "Go back.")
			elseif(aName == "deadEnd5") then
				CLS()
				createTextfield("Dead end...")
				createButton("wrongWay3a", "Go back.")
			elseif(aName == "deadEnd6") then
				CLS()
				createTextfield("Dead end...")
				createButton("wrongWay4", "Go back.")
			elseif(aName == "goodEnd") then
				CLS()
				setBackground("alleyway.jpg")
				createTextfield("As the egg breaks on the floor, you wake up.\nThis weed strong yo.")
				createButton("goodEnd2", "Time to get going.")
			elseif(aName == "goodEnd2") then
				CLS()
				exitGame()
	end
end