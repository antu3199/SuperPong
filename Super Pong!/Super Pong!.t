%Super Pong!
%October 29, 2012
%Anthony Tu
%Play a modified version of the classic game Pong, Super Pong.
%In this game, you have skills and items to defeat your enemy with.
%REQUIRES PARALLEL PORT to work lives but is not necessary

%Variable Declarations
%Ball and Physics
var ballx, bally : int
var xdir, ydir : int
var mx, my, button : int
var player1x, player2y, player1x2, player2y2, player2x, player2x2 : int
var compspeed : int
var ranspeed : int

%Score
var player1score, player2score : int := 0
%Buttons


%Difficulty
var difficulty : int

%Character and movement
var chars : array char of boolean
var player1y, player1y2 : int

%LED
var num : int := 0

%Menu Options
var amountofplayers : int
var activate : int
var menu : int := 0
var font1, font2, scorefont, godfont, menufont : int
var vscomp : int := 0
var menutimer : int := 0

%Instructions
var instructionact : int := 0
var backpart : int := Pic.FileNew ("Backpart.JPG")
var instrpic1 : int := Pic.FileNew ("Game.JPG")
var instrpic2 : int := Pic.FileNew ("Bullet.JPG")
var instrpic3 : int := Pic.FileNew ("Eblast.JPG")
var instrpic4 : int := Pic.FileNew ("Ult.JPG")
var instrpic5 : int := Pic.FileNew ("Slow.JPG")

%Bullets
var bulletx, bullety, bulletact, bulletyset, bullettimer, bulletdelay : int
var bullet2x, bullet2y, bullet2act, bullet2yset, bullet2timer, bullet2delay : int
var player2stun, player1stun : boolean := false
var bulletreload, bullet2reload : int
var stuntimer1, stuntimer2 : int := 0

%Determines distance from paddle center
var distancetomiddle, distancetomiddle2 : int := 25

%Item Variables
var itemlocx, itemlocy, itemtyperan, item1timer, item1act, item1endtimer, item1player : int := 0
var item1pic : int := Pic.FileNew ("item1.JPG")
var item2pic : int := Pic.FileNew ("item2.JPG")
var item3pic : int := Pic.FileNew ("item3.JPG")
var item2locx, item2locy, item2timer, item2act, item2endtimer, item2player : int := 0
var item3locx, item3locy, item3timer, item3act, item3endtimer1, item3endtimer2, item3player : int := 0
var dupx, dupy, dupx2, dupy2, dup2x, dup2y, dup2x2, dup2y2, dup1act, dup2act : int := 0
var dup1hit, dup2hit : int

%Background
var background : int
var showback : boolean := true



%Shield
var shieldx, shieldy, shieldx2, shieldy2, shield2x, shield2y, shield2x2, shield2y2, shieldact, shield2act, shieldplayer : int
var shieldhit, shield2hit : boolean := false
var shieldasb, shieldasb2 : int := 0
var shieldasbact, shield2asbact : boolean := false
var shieldslowdown, shieldslowdown2 : boolean := false

%Beam
var beam1act, beam2act, beam1x, beam1y, beam2x, beam2y, beam1timer, beam2timer : int
var beam2x2 : int

%Freeeze time
var tempdirx, tempdiry : int := 0

%Ultimates
var specialblastx, specialblasty, specialblastx2, specialblasty2, specialblast2x, specialblast2y, specialblast2x2, specialblast2y2 : int := 0
var cspecialblastx, cspecialblasty, cspecialblastx2, cspecialblasty2, cspecialblast2x, cspecialblast2y, cspecialblast2x2, cspecialblast2y2 : int := 0

%Computer Skill variables
var skilluse : boolean := false
var ranctime1, ranctime2 : int
var ultskilluse1, ultskilluse2 : boolean := false
var yupordown : int := 0
var ezslowact, ezslowtimer, ezslowendtimer, slowtimer : int := 0
var ezexplosion, ezexplosiontimer, ezulttimer, ezexplosionact : int := 0
var explosionhit : boolean := false
%Normal computer
var norcompulttimer : int := 0
%Insane computer
var swordatktimer, swordatkact : int := 0
var sword1x, sword1y, sword2x, sword2y, swordamount : int := 0
var leswordpic : int := Pic.FileNew ("LeSword.JPG")
var leswordrotate, sword3x, sword3y, angle : int := 0
var incompulttimer, inultact : int := 0
var ultswordpic : int := Pic.FileNew ("swords.JPG")
var specialswordblast, waveamount, slashtimer : int := 0
%Godmode Computer
var godrapidfire, godrapidfireact : int := 0
var circleatktimer, circleatkact, circleatkx, circleatky, circleatkx2, circleatky2 : int := 0
var circleatkblastx, circleatkblasty, circleatkblastx2 : int := 0
var circleranspeed : int
var darknesstimer, darknessx, darknessact : int := 0
var godultrantime, godulttimer, godultact, godblastx, godblasty, godblasty2, godblastx2 : int := 0
var timeuntilstart : int := 0
var godexplosion, godexplosionpictimer : int := 0

%Win Screen
var rainbowstarcolour : int := 0

%Intros
var introtimer : int := 0
var turtleintrox : int := 0
var turtleintroscreenshow : boolean := true
var introdoppel1x, introdoppel1y, introdoppel2x, introdoppel2y, introdoppelact : int := 0
var godintroblast, godintrodarknessx, godspellcircle : int := 0
var power : boolean := false

%Set score to 0:0
player1score := 0
player2score := 0

%Variable initializations
%Stop Flickering
View.Set ("offscreenonly")
buttonchoose ("multibutton")

%Start game when activate = 1
activate := 0

%Player
player1y := 75
player1y2 := 115
player1x := 0
player1x2 := 25

%Player 2
player2y := 75
player2y2 := 115
player2x := 615
player2x2 := 640

%Randomize starting point
randint (ballx, 350, 400)
randint (bally, 50, 350)

%Randomize Speed
randint (xdir, -2, 2)
randint (ydir, -2, 2)

if xdir = 0 then
    randint (xdir, 1, 2)
end if

if ydir = 0 then
    randint (ydir, 1, 2)
end if

%Amount of players variable
amountofplayers := 0

%Make sure difficulty is 0 Difficulty
difficulty := 0

%Set Bullet variables
bulletact := 0
bullet2act := 0
bulletx := 26
bullety := player1y + distancetomiddle
bulletyset := 0

bullet2x := 615
bullet2y := player2y + distancetomiddle
bullet2yset := 0

bulletreload := 50
bullet2reload := 50

bullettimer := 0
bulletdelay := 0

bullet2timer := 0
bullet2delay := 0

%Font
font1 := Font.New ("Comicsans:35:bold,italic,underline")
font2 := Font.New ("Comicsans:10:bold,underline")
godfont := Font.New ("Comicsans:20:bold,underline")
scorefont := Font.New ("Comicsans:10:bold,")
menufont := Font.New ("CourierNew:10")

%Pictures
godexplosion := Pic.FileNew ("0-gex-gif.JPG")
godspellcircle := Pic.FileNew ("Spell Circle.JPG")
ezexplosion := Pic.FileNew ("30.JPG")

%Computer randomizer
randint (ranctime1, 300, 800)
randint (ranctime2, 450, 800)
randint (godultrantime, 200, 450)

%Shield
shieldx := 13
shieldy := 0
shieldx2 := 0
shieldy2 := 0

shield2x := 629
shield2y := 0
shield2x2 := 0
shield2y2 := 0

shieldact := 0
shield2act := 0


%Beam
beam1act := 0
beam2act := 0

beam1x := 26
beam1y := 0
beam2x := 614
beam2y := 0
beam2x2 := 26

beam1timer := 0
beam2timer := 0

%Items
randint (item1timer, 1, 100)
randint (item2timer, 1, 100)
randint (item3timer, 1, 100)

dup1hit := 0
dup2hit := 0

dup1act := 0
dup2act := 0

dupx := 65
dupx2 := 75
dupy := 0
dupy2 := 0

dup2x := 65
dup2x2 := 75
dup2y := 0
dup2y2 := 0

%Intro
introdoppel1x := 0
introdoppel1y := 200
introdoppel2x := 640
introdoppel2y := 200

%Music processes

process menumusic
    %Play the music
    Music.PlayFileLoop ("Menu.mp3")
end menumusic

process music
    %Play the music
    Music.PlayFileLoop ("music.mp3")
end music

process turtlemusic
    %Play the music
    Music.PlayFileLoop ("turtle.mp3")
end turtlemusic

process doppelmusic
    %Play the music
    Music.PlayFileLoop ("doppel.mp3")
end doppelmusic

process infernomusic
    %Play the music
    Music.PlayFileLoop ("inferno.mp3")
end infernomusic

process ultimatemusic
    %Play the music
    Music.PlayFileLoop ("ultimateweapon.mp3")
end ultimatemusic

%Sound effects

process ping
    %Play sound effects
    Music.PlayFile ("ping.wav")
end ping

process shoot
    %Play sound effects
    Music.PlayFile ("Shoot.wav")

end shoot

process blast
    %Play sound effects
    Music.PlayFile ("blast.wav")

end blast

process charge
    %Play sound effects
    Music.PlayFile ("charge.wav")
end charge

process cheer
    %Play sound effects
    Music.PlayFile ("cheer.wav")
end cheer

process lazer
    %Play sound effects
    Music.PlayFile ("lazers.wav")
end lazer

process slowdown
    %Play sound effects
    Music.PlayFile ("slowdown.wav")
end slowdown

process slowdown2
    %Play sound effects
    Music.PlayFile ("slowdown2.wav")
end slowdown2

process slash
    %Play sound effects
    Music.PlayFile ("slash.wav")
end slash

process poweroverwhelming
    %Play sound effects
    Music.PlayFile ("power.wav")
end poweroverwhelming

process obliterate
    %Play sound effects
    Music.PlayFile ("Obliterate.wav")
end obliterate

%Menu screens
procedure menuscreen
    %Draws the bottom background
    Pic.Draw (backpart, 1, 1, 2)
    %Super Pong title
    Font.Draw ("SUPER PONG!!!", 150, 320, font1, red)
    %Draws the paddles and balls in the bottom
    drawfillbox (0, 75, 25, 115, red)
    drawfillbox (615, 75, 640, 115, blue)

    drawfilloval (440, 120, 10, 10, brightblue)


    %Draws the line
    drawline (0, 180, 640, 180, black)
    %Draws the texts
    Font.Draw ("VS Computer", 75, 230, menufont, black)
    Font.Draw ("Instructions", 280, 230, menufont, black)

    Font.Draw ("Two Player", 480, 230, menufont, black)
    %Buttons
    drawbox (30, 220, 200, 260, black)
    drawbox (440, 220, 600, 260, black)
    drawbox (220, 220, 420, 260, black)

end menuscreen

procedure graphics
    %Alot (Not all) graphics and pictures are put in here to avoid overlapping issues.
    %Most of the actual programming and actions is done elsewhere

    %Keyboard

    %Draw Paddles
    %Paddles in Easy mode
    if difficulty = 1 and ultskilluse1 = false and ultskilluse2 = false then
	%Red Paddle (3 different colour boxes)
	drawfillbox (0, player1y, 25, player1y2, red)
	drawbox (0, player1y, 25, player1y2, white)
	drawbox (-1, player1y - 1, 26, player1y2 + 1, black)

	%Computer Paddle (Green, 3 different colour boxes)
	drawfillbox (615, player2y, 639, player2y2, green)
	drawbox (615, player2y, 639, player2y2, white)
	drawbox (614, player2y - 1, 640, player2y2 + 1, black)

	%Paddles in Insane mode
    elsif difficulty = 3 and ultskilluse1 = false and ultskilluse2 = false then

	%Red Paddle (3 different colour boxes)
	drawfillbox (0, player1y, 25, player1y2, red)
	drawbox (0, player1y, 25, player1y2, white)
	drawbox (-1, player1y - 1, 26, player1y2 + 1, black)

	%Computer Paddle (BrightRed, 3 different colour boxes)
	drawfillbox (615, player2y, 639, player2y2, brightred)
	drawbox (615, player2y, 639, player2y2, white)
	drawbox (614, player2y - 1, 640, player2y2 + 1, black)

	%Paddles in God Mode
    elsif difficulty = 4 and ultskilluse1 = false and ultskilluse2 = false then
	%Red Paddle (3 different colour boxes)
	drawfillbox (0, player1y, 25, player1y2, red)
	drawbox (0, player1y, 25, player1y2, white)
	drawbox (-1, player1y - 1, 26, player1y2 + 1, black)

	%Computer Paddle (Black, 3 different colour boxes)
	drawfillbox (615, player2y, 639, player2y2, black)
	drawbox (615, player2y, 639, player2y2, white)
	drawbox (614, player2y - 1, 640, player2y2 + 1, black)

	%Paddles in Normal and 2 Player Mode
    elsif ultskilluse1 = false and ultskilluse2 = false then
	%Red Paddle (3 different colour boxes)
	drawfillbox (0, player1y, 25, player1y2, red)
	drawbox (0, player1y, 25, player1y2, white)
	drawbox (-1, player1y - 1, 26, player1y2 + 1, black)

	%Computer/Player 2 Paddle (Blue, 3 difference colour boxes)
	drawfillbox (615, player2y, 639, player2y2, blue)
	drawbox (615, player2y, 639, player2y2, white)
	drawbox (614, player2y - 1, 640, player2y2 + 1, black)
    end if

    %Draws the ball
    %If player Ultimate is used, make the ball white
    if beam1act = 1 or beam1act = 2 or beam2act = 1 or beam2act = 2 then
	drawfilloval (ballx, bally, 10, 10, white)
	%If the ultimate is not used and is going right, make ball blue
    elsif xdir > 0 then
	drawfilloval (ballx, bally, 10, 10, brightblue)
	drawoval (ballx, bally, 10, 10, white)
	drawoval (ballx, bally, 11, 11, black)
	%If the ultimate is not used and is going left, make ball blue
    elsif xdir < 0 then
	drawfilloval (ballx, bally, 10, 10, brightred)
	drawoval (ballx, bally, 10, 10, white)
	drawoval (ballx, bally, 11, 11, black)
    end if

    %Draw Bullet player 1
    %If the speed upgrade item is recieved, then the bullet is black and goes faster
    if item2act = 2 and item2player = 1 and bulletact = 1 then
	bulletx += 15
	drawfilloval (bulletx, bulletyset, 15, 15, black)
	drawoval (bulletx, bulletyset, 15, 15, white)
	drawoval (bulletx, bulletyset, 16, 16, black)

	%If the speed is not recieved, the ball is white
    elsif bulletact = 1 then
	drawfilloval (bulletx, bulletyset, 15, 15, white)
	drawoval (bulletx, bulletyset, 15, 15, black)
	drawoval (bulletx, bulletyset, 16, 16, white)
    end if

    %Draw Bullet player 2
    %If the speed upgrade item is recieved, then the bullet is black and goes faster
    if item2act = 2 and item2player = 2 and bullet2act = 1 then

	bullet2x -= 15
	drawfilloval (bullet2x, bullet2yset, 15, 15, black)
	drawoval (bullet2x, bullet2yset, 15, 15, white)
	drawoval (bullet2x, bullet2yset, 16, 16, black)
	%If the speed is not recieved, the ball is white
    elsif bullet2act = 1 then
	drawfilloval (bullet2x, bullet2yset, 15, 15, white)
	drawoval (bullet2x, bullet2yset, 15, 15, black)
	drawoval (bullet2x, bullet2yset, 16, 16, white)
    end if

    %Shield bonus player 1
    %When Player 1's second skill is used, add an aura around the bullet shot
    if shieldasb < 350 and shieldact = 1 and bulletact = 1 then
	%Adds circles around bullet
	drawoval (bulletx, bulletyset, 20, 20, white)
	drawoval (bulletx, bulletyset, 30, 30, black)
	drawoval (bulletx, bulletyset, 40, 40, white)
    elsif shieldasb > 350 and shieldact = 1 and shieldasbact = true and bulletact = 1 then
	%Lowers back speed once the bonus is over
	bulletreload += 50
	%Stop the bonus
	shieldasbact := false
    end if



    %Shield bonus Player 2
    if shieldasb2 < 350 and shield2act = 1 and bullet2act = 1 then
	%Adds circles around bullet
	drawoval (bullet2x, bullet2yset, 20, 20, white)
	drawoval (bullet2x, bullet2yset, 30, 30, black)
	drawoval (bullet2x, bullet2yset, 40, 40, white)
    elsif shieldasb2 > 350 and shield2act = 1 and shield2asbact = true and bullet2act = 1 then
	%Lowers back speed once the bonus is over
	bullet2reload += 50
	%Stop the bonus
	shield2asbact := false
    end if

    %Shield draw
    if shieldact = 1 then %Variable that activates shield
	%Draws all the rings around the shield
	drawoval (shieldx, shieldy, shieldx2, shieldy2, red)
	drawoval (shieldx, shieldy, shieldx2 - 10, shieldy2 - 10, red)
	drawoval (shieldx, shieldy, shieldx2 - 20, shieldy2 - 20, red)
	drawoval (shieldx, shieldy, shieldx2 - 30, shieldy2 - 30, red)
	drawoval (shieldx, shieldy, shieldx2 - 40, shieldy2 - 40, red)
	drawoval (shieldx, shieldy, shieldx2 - 50, shieldy2 - 50, red)
	drawoval (shieldx, shieldy, shieldx2 - 60, shieldy2 - 60, red)
    end if
    %Shield Player 2 draw
    if shield2act = 1 then %Variable that activates shield
	%Draws all the rings around the shield
	drawoval (shield2x, shield2y, shield2x2, shield2y2, blue)
	drawoval (shield2x, shield2y, shield2x2 - 10, shield2y2 - 10, blue)
	drawoval (shield2x, shield2y, shield2x2 - 20, shield2y2 - 20, blue)
	drawoval (shield2x, shield2y, shield2x2 - 30, shield2y2 - 30, blue)
	drawoval (shield2x, shield2y, shield2x2 - 40, shield2y2 - 40, blue)
	drawoval (shield2x, shield2y, shield2x2 - 50, shield2y2 - 50, blue)
	drawoval (shield2x, shield2y, shield2x2 - 60, shield2y2 - 60, blue)
    end if
    %Beam 1 draw
    if beam1act = 2 then %Variable that activates beam
	%Make the background invert colours
	drawfillbox (0, 0, 640, 400, black)
	Pic.Draw (background, 1, 1, 1)

	%Redraws the paddles in white
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

	drawfilloval (beam1x, beam1y, beam1x - 25, 100, black)
	drawfilloval (beam1x, beam1y, beam1x - 25, 90, red)
	drawfilloval (beam1x, beam1y, beam1x - 25, 80, brightred)

	%In case one uses skill 2 while in ultimate:
	if shieldact = 1 then %Variable that activates shield
	    %Draws all the rings around the shield
	    drawoval (shieldx, shieldy, shieldx2, shieldy2, white)
	    drawoval (shieldx, shieldy, shieldx2 - 10, shieldy2 - 10, white)
	    drawoval (shieldx, shieldy, shieldx2 - 20, shieldy2 - 20, white)
	    drawoval (shieldx, shieldy, shieldx2 - 30, shieldy2 - 30, white)
	    drawoval (shieldx, shieldy, shieldx2 - 40, shieldy2 - 40, white)
	    drawoval (shieldx, shieldy, shieldx2 - 50, shieldy2 - 50, white)
	    drawoval (shieldx, shieldy, shieldx2 - 60, shieldy2 - 60, white)
	end if
    end if
    %Beam 2 draw
    if beam2act = 2 then %Variable that activates beam
	%Make the background invert colours
	drawfillbox (0, 0, 640, 400, black)
	Pic.Draw (background, 1, 1, 1)

	%Redraws the paddles in white
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

	drawfilloval (beam2x, beam2y, beam2x2 - 25, 100, black)
	drawfilloval (beam2x, beam2y, beam2x2 - 25, 90, blue)
	drawfilloval (beam2x, beam2y, beam2x2 - 25, 80, brightblue)

	%In case one uses skill 2 while in ultimate:
	if shield2act = 1 then
	    %Draws all the rings around the shield
	    drawoval (shield2x, shield2y, shield2x2, shield2y2, white)
	    drawoval (shield2x, shield2y, shield2x2 - 10, shield2y2 - 10, white)
	    drawoval (shield2x, shield2y, shield2x2 - 20, shield2y2 - 20, white)
	    drawoval (shield2x, shield2y, shield2x2 - 30, shield2y2 - 30, white)
	    drawoval (shield2x, shield2y, shield2x2 - 40, shield2y2 - 40, white)
	    drawoval (shield2x, shield2y, shield2x2 - 50, shield2y2 - 50, white)
	    drawoval (shield2x, shield2y, shield2x2 - 60, shield2y2 - 60, white)
	end if

    end if

    %When Blue Player is stunned by a bullet or skill, draw Black Xs
    if player2stun = true then
	%Draws Xs based on the Player's location
	drawline (player2x - 15, player2y - distancetomiddle2, player2x2 + 15, player2y2 + distancetomiddle2, black)
	drawline (player2x - 15, player2y2 + distancetomiddle2, player2x2 + 15, player2y - distancetomiddle2, black)
    end if
    %When Red Player is stunned by a bullet or skill, draw Black Xs
    if player1stun = true then
	%Draws Xs based on the Player's location
	drawline (player1x - 15, player1y - distancetomiddle, player1x2 + 15, player1y2 + distancetomiddle, black)
	drawline (player1x - 15, player1y2 + distancetomiddle, player1x2 + 15, player1y - distancetomiddle, black)
    end if

    %Items
    if dup1act = 1 then %Variable that activates item 3
	%Draws the item
	drawfillbox (dupx, dupy, dupx2, dupy2, black)
	drawbox (dupx, dupy, dupx2, dupy2, white)
    end if

    if dup2act = 1 then %Variable that activates item 3
	%Draws the item
	drawfillbox (dup2x, dup2y, dup2x2, dup2y2, black)
	drawbox (dup2x, dup2y, dup2x2, dup2y2, white)
    end if

    %EZCOMPULTIMATE DRAW
    if ezexplosionact = 1 then %Variable that activates Turtle's Ultimate Skill
	%Remove the background
	showback := false
	%Make the background completely black
	if showback = false then
	    drawfillbox (0, 0, 640, 400, black)
	else
	    drawfillbox (0, 0, 640, 400, white)
	end if
	%Makes an aura blast out of the player
	%Increases the size of the circle of the blast
	specialblast2x += 30
	specialblast2y += 30
	%Draws the blast
	drawoval (player2x, player2y + distancetomiddle2, specialblast2x, specialblast2y, white)
	%Draws more blasts
	if specialblast2x > 500 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 500, specialblast2y - 500, white)
	end if
	%Draws more blasts
	if specialblast2x - 500 > 300 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 800, specialblast2y - 800, white)
	end if
	%Redraw paddles and ball to white
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

    end if


    if ezexplosionact = 2 then %Variable that activates phase 2
	%Remove the background
	showback := false
	%Make the background completely black
	if showback = false then
	    drawfillbox (0, 0, 640, 400, black)
	else
	    drawfillbox (0, 0, 640, 400, white)
	end if

	%Draws text saying "Press to detonate"
	Font.Draw ("PRESS TO DETONATE!", 50, 50, font1, brightred)
	%Draws a button to press for explosion
	drawfilloval (320, 200, 10, 10, brightred)
	%When the ball goes to the center, the explosion activates
	if ballx = 320 and bally = 200 and ezexplosionact = 2 then
	    %The background is restored
	    drawfillbox (0, 0, 640, 400, white)
	    showback := true
	    %Variable  that shows that the explosion hit
	    explosionhit := true
	    %Draws the explosion
	    Pic.Draw (ezexplosion, 125, 80, 1)
	    %Makes the background of the explosion transparent
	    Pic.SetTransparentColour (ezexplosion, black)
	end if
	%When a timer is greater than a certain number, the explosion image changes
	if ezexplosiontimer > 2 then
	    %Ensures the background is restored
	    Pic.Draw (background, 1, 1, 1)
	    %Changes the explosion picture
	    ezexplosion := Pic.FileNew ("ezx1.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 3 then
	    ezexplosion := Pic.FileNew ("ezx2.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 4 then
	    ezexplosion := Pic.FileNew ("ezx3.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 5 then
	    ezexplosion := Pic.FileNew ("ezx4.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 6 then
	    ezexplosion := Pic.FileNew ("ezx5.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 7 then
	    ezexplosion := Pic.FileNew ("ezx6.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 8 then
	    ezexplosion := Pic.FileNew ("ezx7.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 9 then
	    ezexplosion := Pic.FileNew ("ezx8.JPG")
	end if
	if ezexplosiontimer > 10 then
	    %Changes the explosion picture
	    ezexplosion := Pic.FileNew ("ezx9.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 11 then
	    ezexplosion := Pic.FileNew ("ezx10.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 12 then
	    ezexplosion := Pic.FileNew ("ezx11.JPG")
	end if
	%Changes the explosion picture
	if ezexplosiontimer > 13 then
	    ezexplosion := Pic.FileNew ("ezx12.JPG")
	end if

	%Redraws paddles and ball
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

    end if


    %Graphics for the insane computer
    if swordatkact = 1 then %When the sword skill is activated
	%Draws two swords
	Pic.Draw (leswordpic, sword1x, sword1y, 1)
	Pic.Draw (leswordpic, sword2x, sword2y, 1)
	%Set background transparency
	Pic.SetTransparentColour (leswordpic, white)
	%A third sword is thrown if you have more than 2 score
	if player1score > 2 then
	    %Rotates the sword according to the angle
	    leswordrotate := Pic.Rotate (leswordpic, angle, 100, 100)
	    %Stops the angle from going past 360 and causing a glitch
	    if angle > 359 then
		angle := 0
	    end if
	    %Draws  the third sword
	    Pic.Draw (leswordrotate, sword3x, sword3y, 1)
	    %Gives transparency
	    Pic.SetTransparentColour (leswordrotate, white)
	    %Stops an error
	    Pic.Free (leswordrotate)
	end if

    end if

    %Sword ultimate
    if inultact = 1 then %When Sword ultimate is activated
	%Inverts the background
	drawfillbox (0, 0, 640, 400, black)
	Pic.Draw (background, 1, 1, 1)

	%Makes an aura blast out of the player
	%Increases the size of the circle of the blast
	specialblast2x += 30
	specialblast2y += 30
	%Draws the blast
	drawoval (player2x, player2y + distancetomiddle2, specialblast2x, specialblast2y, white)
	%Draws more blasts
	if specialblast2x > 500 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 500, specialblast2y - 500, white)
	end if
	%Draws more more blasts
	if specialblast2x - 500 > 300 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 800, specialblast2y - 800, white)
	end if
	%Redraw Paddles and ball
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

    end if

    if inultact = 2 then %Phase 2 of the Sword Ultimate
	%Makes sure that the background is inverted
	drawfillbox (0, 0, 640, 400, black)
	Pic.Draw (background, 1, 1, 1)

	%Redraws paddles
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

	%Draws an auro around the sword
	drawoval (320, 200, specialswordblast, specialswordblast, red)

	%Draws the ultimate sword
	Pic.Draw (ultswordpic, 270, 40, 1)

	%Makes the slash sounds at specific times
	if slashtimer = 51 or slashtimer = 71 or slashtimer = 81 or slashtimer = 91 or slashtimer = 101 or slashtimer = 111 or slashtimer = 116 or slashtimer = 131 or slashtimer = 151 then
	    fork slash
	end if

	if slashtimer > 50 then %Slashes at specific time
	    %Makes sure Player can't move
	    player1stun := true
	    stuntimer2 := 0
	    for counter : 1 .. 600
		%Draws slash
		Draw.ThickLine (-25, -25, counter, counter, 50, red)
	    end for
	end if
	if slashtimer > 70 then %Slashes at specific time
	    for counter : 1 .. 600
		%Draws slash
		Draw.ThickLine (-25, 300, -25 + counter, 300 - counter, 30, red)
	    end for
	end if
	if slashtimer > 80 then %Slashes at specific time
	    for counter : 1 .. 600
		%Draws slash
		Draw.ThickLine (200, 400, 200, 400 - counter, 50, red)
	    end for
	end if
	if slashtimer > 90 then %Slashes at specific time
	    for counter : 1 .. 600
		%Draws slash
		Draw.ThickLine (600, 500, 600 - counter, 500 - counter, 50, red)
	    end for
	end if
	if slashtimer > 100 then %Slashes at specific time
	    for counter : 1 .. 600
		%Draws slash
		Draw.ThickLine (450, -25, 470, counter, 100, red)
	    end for
	end if
	if slashtimer > 110 then %Slashes at specific time
	    for counter : 1 .. 600
		%Draws slash
		Draw.ThickLine (600, -25, 600 + counter, counter, 40, red)
	    end for
	end if
	if slashtimer > 115 then %Slashes at specific time
	    for counter : 1 .. 650
		%Draws slash
		Draw.ThickLine (0, 350, 0 + counter, 350, 40, red)
	    end for
	end if
	if slashtimer > 130 then %Slashes at specific time
	    for counter : 1 .. 650
		%Draws slash
		Draw.ThickLine (650, 200, 650 - counter, 200, 300, red)
	    end for
	end if

	if slashtimer > 150 then %Slashes at specific time
	    for counter : 1 .. 650
		%Draws slash
		Draw.ThickLine (650, 300, 650 - counter, 300, 300, red)
		Draw.ThickLine (650, 100, 650 - counter, 100, 300, red)
		%Writes K.O.
		Font.Draw ("K.O.", 250, 50, font1, white)
	    end for
	end if
    end if

    %God computer's skills
    %Darkness
    if darknessact = 1 or darknessact = 2 then %When the skill is activated
	%Draws the darkness
	drawfillbox (darknessx, 0, 650, 400, black)
	%Makes the paddles and the ball white only when the darkness passes through
	if darknessx < player2x then
	    drawfillbox (615, player2y, 639, player2y2, white)
	end if
	if darknessx < 25 then
	    drawdot (25, player1y + distancetomiddle, red)
	end if
	if darknessx < ballx + 20 then
	    drawfilloval (ballx, bally, 10, 10, white)
	end if
    end if

    %Draw God's Ult
    if godultact = 1 or godultact = 2 then %If the skill is enabled
	%Black background
	showback := false
	drawfillbox (0, 0, 640, 400, black)

	%Makes an aura blast out of the player
	%Increases the size of the circle of the blast
	specialblast2x += 30
	specialblast2y += 30
	%Draws the blast
	drawoval (player2x, player2y + distancetomiddle2, specialblast2x, specialblast2y, white)
	%Draws more blasts
	if specialblast2x > 500 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 500, specialblast2y - 500, white)
	end if
	%Draws more more blasts
	if specialblast2x - 500 > 300 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 800, specialblast2y - 800, white)
	end if

	%Redraws players, ball
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)
    end if

    if godultact = 2 then %Phase 2 of God Ultimate
	%Makes a special aura
	specialblast2x += 20
	specialblast2y += 20

	%If the aura is greater than 700 then restart
	if specialblast2x > 700 then
	    specialblast2x := 0
	    specialblast2y := 0
	end if

	%Draws 4 auras just for visuals
	drawoval (12, player2y + distancetomiddle2, specialblast2x, specialblast2y, white)
	drawoval (320, 0, specialblast2x, specialblast2y, white)
	drawoval (320, 400, specialblast2x, specialblast2y, white)
	drawoval (320, 200, specialblast2x, specialblast2y, white)

	%When the ball reaches the middle...
	if ballx = 320 and bally = 200 then
	    %Player can't move
	    player1stun := true
	    %Says OBLITERATE!!!
	    Font.Draw ("OBLITERATE!!!", 120, 50, font1, white)
	end if
    end if

    if godultact = 3 then %Phase 3 of God's Ult
	%Makes sure that the Player can't move
	player1stun := true
	%Makes sure the background is black
	showback := false
	drawfillbox (0, 0, 640, 400, black)
	%Makes epic aura
	specialblast2x += 20
	specialblast2y += 20
	%Still says Obliterate
	Font.Draw ("OBLITERATE!!!", 120, 50, font1, white)
	%Restarts the auras when they're greated than 700
	if specialblast2x > 700 then
	    specialblast2x := 0
	    specialblast2y := 0
	end if

	%Auras
	drawoval (12, player2y + distancetomiddle2, specialblast2x, specialblast2y, white)
	drawoval (320, 0, specialblast2x, specialblast2y, white)
	drawoval (320, 400, specialblast2x, specialblast2y, white)
	drawoval (320, 200, specialblast2x, specialblast2y, white)

	%Redraws the paddles
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

	%Draws the beam hotter than the sun
	drawfilloval (godblastx, godblasty, godblastx2, godblasty2, white)

	%When the blast reaches a certain point, it draws darkness
	if godblasty2 > 1000 then
	    drawfillbox (darknessx, 0, 640, 400, black)
	end if
    end if


end graphics

procedure keyboardcontrol
    %Enables Keypress
    Input.KeyDown (chars)


    %Player 1 bullet

    %Timers and delays for the bullet
    bullettimer += 1
    bulletdelay += 1

    %When 1 is pressed:
    if chars ('1') and bulletdelay > bulletreload and ultskilluse2 = false then
	%Sets the y coordinate of bullet
	bulletyset := bullety
	%Activates bullet
	bulletact := 1
	%Shoot sounds effect
	if bulletx = 26 then
	    fork shoot
	end if
    end if

    %Makes sure that the bullet y is set
    if bulletact = 0 then
	bullety := player1y + distancetomiddle
    end if

    %Player 1 hit player 2 collsion
    if bulletact = 1 then %When the bullet is shot
	%Bullet moves across the screen
	bulletx += 20
	%When it reaches 640 (end of screen) it restarts
	if bulletx > 640 then
	    %Restarts the bullet variables
	    bulletact := 0
	    bulletx := 26
	    bulletdelay := 0
	    bullety := player1y + distancetomiddle
	end if

	%When player 1's bullet hits player 2
	if bulletx + 15 > 614 and bulletyset + 15 > player2y and bulletyset - 15 < player2y2 then
	    %Reset variable
	    bullettimer := 0
	    %Stuns the player 1
	    player2stun := true
	    stuntimer1 := 0
	end if

    end if



    %Player 2's bullet

    %Timers and delays for the bullet
    bullet2timer += 1
    bullet2delay += 1

    %When , is pressed:
    if chars (',') and bullet2delay > bullet2reload and amountofplayers = 2 and ultskilluse1 = false then
	%Sets the y coordinate of bullet
	bullet2yset := bullet2y
	%Activates bullet
	bullet2act := 1
	%Shoot sounds effect
	if bullet2x = 615 then
	    fork shoot
	end if
    end if

    %Makes sure that the bullet y is set
    if bullet2act = 0 then
	bullet2y := player2y + distancetomiddle2
    end if
    %Player 2 bullet collision
    if bullet2act = 1 then  %When the bullet is shot
	%Bullet moves across the screen
	bullet2x -= 20

	%God comp's rapidfire
	if difficulty = 4 then
	    if godrapidfire > 6 then %On the seventh bullet
		%Bullet has a massive increase in speed
		bullet2x -= 80
		if godrapidfireact = 0 then
		    %Bullet reload decreases
		    bullet2reload -= 50
		    godrapidfireact := 1
		end if
		%When
		if godrapidfire > 9 then
		    bullet2reload += 50
		    godrapidfire := 0
		    godrapidfireact := 0
		end if
	    end if
	end if
	%When it reaches 0 (end of screen) it restarts
	if bullet2x < 0 then
	    %Counts the amount of bullets the sent to use God's Rapidfirce ability
	    if difficulty = 4 then
		%Adds one rapid fire
		godrapidfire += 1
	    end if
	    %Restarts the bullet variables
	    bullet2act := 0
	    bullet2x := 615
	    bullet2delay := 0
	    bullet2y := player2y + distancetomiddle2
	end if
	%When Player 2's bullet hits player 1
	if bullet2x - 15 < 26 and bullet2yset + 15 > player1y and bullet2yset - 15 < player1y2 then
	    %Reset variable
	    bullet2timer := 0
	    %Stuns Player
	    player1stun := true
	    stuntimer2 := 0
	end if
    end if

    %Player 1's shield
    %When 2 is pressed:
    if chars ('2') and shieldact = 0 and ultskilluse2 = false then
	%Makes the sound
	fork blast
	%Initializing variables

	shieldx := 13
	shieldy := 0
	shieldx2 := 0
	shieldy2 := 0
	shieldhit := false
	shieldact := 1
	shieldy := player1y + distancetomiddle

	%Increasing attack speed variables
	shieldasbact := true
	bulletreload -= 50
	shieldslowdown := true
    end if

    if shieldact = 1 then %When shield is used
	%Shield blast aura increases
	shieldx2 += 10
	shieldy2 += 10
	%Attack speed bonus timer starts
	shieldasb += 1
	%When the blast hits the ball
	if (ballx - 20 < shieldx + shieldx2 and bally + 20 > shieldy - shieldy2 and bally - 20 < shieldy + shieldy2) or (ballx < 100)
		then
	    %If the ball is going left
	    if xdir < 0 and shieldhit = false then
		%Reverse direction and add 4
		xdir *= -1
		xdir += 4
		%Makes sure that the ball cannot be hit multiple times
		shieldhit := true
		%Determines whether to go up or down
		if shieldy > bally then
		    %Moves ball up
		    ydir -= 3
		elsif shieldy < bally then
		    %Moves ball down
		    ydir += 3
		end if
		%If ball is going right
	    elsif xdir > 0 and shieldhit = false then
		%Add 6 to speed
		xdir += 6
		%Makes sure that the ball cannot be hit multiple times
		shieldhit := true
		%Determines whether to go up or down
		if shieldy > bally then
		    %Moves ball up
		    ydir -= 3
		elsif shieldy < bally then
		    %Moves ball down
		    ydir += 3
		end if
	    end if

	end if
    end if

    %Player 2's shield
    %When . is pressed
    if chars ('.') and amountofplayers = 2 and shield2act = 0 and ultskilluse1 = false then
	%Plays sound effect
	fork blast
	%Set shield initializations
	shield2x := 629
	shield2y := 0
	shield2x2 := 0
	shield2y2 := 0
	shield2hit := false
	%Set shield to next phase
	shield2act := 1
	%Set y location of shield
	shield2y := player2y + distancetomiddle2
	%Get attack speed bonus
	shield2asbact := true
	%Incress attack speed
	bullet2reload -= 50
	shieldslowdown2 := true
    end if

    if shield2act = 1 then %When shield is used
	%Shield aura increases
	shield2x2 += 10
	shield2y2 += 10
	shieldasb2 += 1
	%When shield hits the ball
	if (ballx + 20 > shield2x - shield2x2 and bally + 20 > shield2y - shield2y2 and bally - 20 < shield2y + shield2y2) or (ballx > 540)
		then
	    %If the ball is going left
	    if xdir < 0 and shield2hit = false then
		%Add 6 to speed
		xdir -= 6

		%Prevents from hitting shield multiple times
		shield2hit := true

		%Determines whether ball goes up or down
		if shield2y > bally then
		    %Ball goes down
		    ydir -= 3
		elsif shield2y < bally then
		    %Ball goes up
		    ydir += 3
		end if
		%If the ball is going right
	    elsif xdir > 0 and shield2hit = false then
		%Ball reverses and adds 4 to speed
		xdir *= -1
		xdir -= 4
		%Prevents from hitting shield multiple times
		shield2hit := true
		%Determines whether ball goes up or down
		if shield2y > bally then
		    %Ball goes down
		    ydir -= 3
		elsif shield2y < bally then
		    %Ball goes up
		    ydir += 3
		end if
	    end if
	end if
    end if

    %Beam of Destruction Player 1
    %When 3 is pressed
    if chars ('3') and beam1act = 0 and ultskilluse2 = false then
	%Advance phase
	beam1act := 1
	%Stop time
	tempdirx := xdir
	tempdiry := ydir
	xdir := 0
	ydir := 0
	%Set aura to 0
	specialblastx := 0
	specialblasty := 0
	%Variable to show ult is in use
	ultskilluse1 := true
	%Beam Sound effect
	fork charge
    end if

    if beam1act = 1 then %When beam is used
	%Invert background
	drawfillbox (0, 0, 640, 400, black)
	Pic.Draw (background, 1, 1, 1)

	%Redraw Paddles and ball
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)

	%Increas aura
	specialblastx += 30
	specialblasty += 30
	%Draws aura
	drawoval (player1x, player1y + distancetomiddle, specialblastx, specialblasty, white)
	%Draws more aura
	if specialblastx > 500 then
	    drawoval (player1x, player1y + distancetomiddle, specialblastx - 500, specialblasty - 500, white)
	end if
	%Draws more aura
	if specialblastx - 500 > 300 then
	    drawoval (player1x, player1y + distancetomiddle, specialblastx - 800, specialblasty - 800, white)
	end if
	%When aura is at a certain point, continue with next phase
	if specialblastx - 800 > 600 then
	    %Continue time
	    xdir := tempdirx
	    ydir := tempdiry
	    %Go on to next phase
	    beam1act := 2
	    %Sound effect
	    fork lazer
	end if

    end if
    if beam1act = 2 then %Phase 2 of Beam
	%Sets beam to middle of paddle
	beam1y := player1y + distancetomiddle
	%Stops when off the screen
	if beam1x < 1000 then
	    %Advances the beam towards the end of the screen
	    beam1x += 15
	end if
	%Timer for duration of beam
	beam1timer += 1
	%If the beam hits the ball
	if ballx - 20 < beam1x + beam1x - 25 and bally + 20 > beam1y - 100 and bally - 20 < beam1y + 100
		then
	    %Ball goes right
	    xdir += 2
	    %If it is still going left, add extra
	    if xdir < 0 then
		xdir += 3
	    end if
	    %If it is exactly in the middle, add a lot of speed
	    if bally = beam1y then
		xdir += 5
	    end if
	    %Up or down
	    if bally > beam1y then
		%Go up
		ydir += 3
	    elsif bally < beam1y then
		%Go down
		ydir -= 3
	    end if
	end if
	%If it hits a duplicate
	if beam1x + beam1x - 25 > dup2x and dup2y2 > beam1y - 100 and dup2y < beam1y + 100 and dup2act = 1
		then
	    %Breaks the duplication
	    dup2hit := 2
	end if

	%If beam hits the other paddle
	if player2x < beam1x + beam1x - 25 and player2y2 > beam1y - 100 and player2y < beam1y + 100
		then
	    %Stuns the pelayer
	    player2stun := true
	    stuntimer1 := 0
	    %Draws Xs when stunned
	    drawline (player2x - 15, player2y - distancetomiddle2, player2x2 + 15, player2y2 + distancetomiddle2, black)
	    drawline (player2x - 15, player2y2 + distancetomiddle2, player2x2 + 15, player2y - distancetomiddle2, black)
	end if
	%When the beam timer is after a certain point
	if beam1timer > 225 then
	    %Stop beam
	    beam1act := 3
	    ultskilluse1 := false
	end if
    end if



    %Beam of destruction Player 2
    %When / is pressed
    if chars ('/') and beam2act = 0 and amountofplayers = 2 and ultskilluse1 = false then
	%Start the  beam
	beam2act := 1
	%Stop time
	tempdirx := xdir
	tempdiry := ydir
	xdir := 0
	ydir := 0
	%Set aura to 0
	specialblast2x := 0
	specialblast2y := 0
	%Set ultimate use to true
	ultskilluse2 := true
	%Charge effect
	fork charge
    end if

    if beam2act = 1 then %Phase 2 of beam
	%Inverts background
	drawfillbox (0, 0, 640, 400, black)
	Pic.Draw (background, 1, 1, 1)
	%Redraws paddles
	drawfillbox (0, player1y, 25, player1y2, white)
	drawfillbox (615, player2y, 640, player2y2, white)
	drawfilloval (ballx, bally, 10, 10, white)
	%Increases aura
	specialblast2x += 30
	specialblast2y += 30
	%Draws aura
	drawoval (player2x, player2y + distancetomiddle2, specialblast2x, specialblast2y, white)
	%Draws more auras
	if specialblast2x > 500 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 500, specialblast2y - 500, white)
	end if
	%Draws more auras
	if specialblast2x - 500 > 300 then
	    drawoval (player2x, player2y + distancetomiddle2, specialblast2x - 800, specialblast2y - 800, white)
	end if
	%When aura is at a certain point, advance
	if specialblast2x - 800 > 600 then
	    %Time starts
	    xdir := tempdirx
	    ydir := tempdiry
	    %Phase 3 of beam
	    beam2act := 2
	    %Sound effect
	    fork lazer
	end if
    end if
    if beam2act = 2 then %Phase 3 of beam
	%Beam follows middle of character
	beam2y := player2y + distancetomiddle2
	%Stops beam if too far
	if beam2x2 < 1000 then
	    %Makes the beam larger and farther
	    beam2x -= 15
	    beam2x2 += 15
	end if
	%Beam timer to indicate end
	beam2timer += 1
	%If beam hits ball
	if ballx + 20 > beam2x - beam2x2 + 25 and bally + 20 > beam2y - 100 and bally - 20 < beam2y + 100
		then
	    %Ball goes to left
	    xdir -= 2
	    %If ball is still right, go more to left
	    if xdir > 0 then
		xdir -= 3
	    end if
	    %If direct hit, go more to left
	    if bally = beam2y then
		xdir -= 5
	    end if
	    %Up or down
	    if bally > beam2y then
		%Up
		ydir += 3
	    elsif bally < beam2y then
		%Down
		ydir -= 3
	    end if
	end if
	%If beam hits duplication
	if beam2x - beam2x2 + 25 < dupx and dupy2 > beam2y - 100 and dupy < beam2y + 100
		then
	    %Breaks the duplication
	    dup1hit := 2
	end if
	%If beam hits a player
	if player1x > beam2x - beam2x2 + 25 and player1y2 > beam2y - 100 and player1y < beam2y + 100
		then
	    %Player stuns
	    player1stun := true
	    stuntimer2 := 0
	    %Draws Xs
	    drawline (player1x - 15, player1y - distancetomiddle, player1x2 + 15, player1y2 + distancetomiddle, black)
	    drawline (player1x - 15, player1y2 + distancetomiddle, player1x2 + 15, player1y - distancetomiddle, black)
	end if
	%When beamtimer is at a certain point
	if beam2timer > 225 then
	    %Stop the beam
	    beam2act := 3
	    %Skill use variable is false
	    ultskilluse2 := false
	end if
    end if

    %Keyboard controls
    %Player 1
    %When W is pressed
    if chars ('w') and player1y2 < 400 and player1stun = false then
	%Go up
	player1y += 15
	player1y2 += 15
    end if
    %When S is pressed
    if chars ('s') and player1y > 0 and player1stun = false then
	%Go down
	player1y -= 15
	player1y2 -= 15
    end if
    %Player 2
    %When up is pressed
    if chars (KEY_UP_ARROW) then
	if amountofplayers = 2 and player2y2 < 400 and player2stun = false then
	    %Go up
	    player2y += 15
	    player2y2 += 15
	end if
    end if

    if chars (KEY_DOWN_ARROW) then
	if amountofplayers = 2 and player2y > 0 and player2stun = false then
	    %Go down
	    player2y -= 15
	    player2y2 -= 15
	end if
    end if

end keyboardcontrol

%Easy Turtle computer main code
procedure ezcomputer
    %Speed of which the computer goes
    if player1score < 5 then
	randint (compspeed, 3, 5)
    elsif player1score >= 5 then %Goes faster as time goes on
	randint (compspeed, 5, 7)
    end if
    %If stunned, cannot move
    if player2stun = true then
	compspeed := 0
    end if


    %Auto shoots bullet
    if bullet2delay > bullet2reload and skilluse = false and ultskilluse1 = false then
	%Set bullet to y
	bullet2yset := bullet2y
	%Shoot bullet
	bullet2act := 1
	%Sound effect
	if bullet2x = 615 then
	    fork shoot
	end if
    end if

    %Make bullet slower than usual
    if item2player not= 2 then
	bullet2reload := 200
    end if

    %If after a certain point, able to use the slow
    if player1score >= 1 and skilluse = false and ultskilluse1 = false then
	ezslowtimer += 1
    end if

    % Ez slow
    %If after a random time
    if ezslowtimer > ranctime1 and skilluse = false and ultskilluse1 = false then
	%Slow is activated
	ezslowact := 1
	%Blast is restarted
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
	%slow Sound effect
	fork slowdown
	%Indicate use of skill
	skilluse := true
    end if

    if ezslowact = 1 then %Phase 1 of slow
	%Timer to indicate end
	ezslowendtimer += 1
	%Enlarges the circle
	if cspecialblastx2 < 620 and ezslowendtimer < 100 then
	    cspecialblastx2 += 20
	    cspecialblasty2 += 20
	    %Lowers the circle
	elsif ezslowendtimer > 300 then
	    cspecialblastx2 -= 20
	    cspecialblasty2 -= 20
	end if

	%When W is pressed
	if chars ('w') and player1y2 < 400 and player1stun = false then
	    %Lower speed
	    player1y -= 12
	    player1y2 -= 12
	end if
	%When S is pressed
	if chars ('s') and player1y > 0 and player1stun = false then
	    %Lower speed
	    player1y += 12
	    player1y2 += 12
	end if
	%Slow text
	Font.Draw ("SLOW!", 200, 50, font1, black)
	%Draws the circles
	drawoval (cspecialblastx, cspecialblasty, cspecialblastx2, cspecialblasty2, black)
	%When the slow timer is up, revert
	if ezslowendtimer > 300 and cspecialblastx2 < 10 then
	    %Sound effect
	    fork slowdown2
	    %Not using skills
	    skilluse := false
	    %Reset all timers
	    ezslowtimer := 0
	    ezslowendtimer := 0
	    %Reset auras
	    cspecialblastx2 := 0
	    cspecialblasty2 := 0
	    cspecialblastx := player2x
	    cspecialblasty := player2y + distancetomiddle2
	    %Randomize next skill
	    randint (ranctime1, 300, 800)
	    %Phase 0
	    ezslowact := 0
	end if
    end if

    %Explosion Ultimate
    %After a certain point, ult timer goes up
    if player1score >= 5 or player2score = 6 and ezexplosionact = 0 and skilluse = false then
	ezulttimer += 1
    end if
    %When the ulttimer is more than a certain point, turtle ultimate is used
    if ezulttimer > ranctime2 and skilluse = false and ezexplosionact = 0 and ultskilluse1 = false then
	%Stop timer
	xdir := tempdirx
	ydir := tempdiry
	xdir := 0
	ydir := 0
	%Start explosion
	ezexplosionact := 1
	%Reset aura
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
	%Use skill
	skilluse := true
	%use Ult
	ultskilluse2 := true
	%Reset timer
	ezexplosiontimer := 0
	%Set image
	ezexplosion := Pic.FileNew ("ezx1.JPG")
    end if


    if ezexplosionact = 1 then %Phase 1
	%When aura is greater than a value, phase 2
	if specialblast2x - 800 > 600 then
	    ezexplosionact := 2
	end if

    end if

    if ezexplosionact = 2 then %phase 2

	%Set ball to go to middle
	if ballx > 320 then
	    ballx -= 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if
	if ballx < 320 then
	    ballx += 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if

	if bally > 200 then
	    bally -= 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if
	if bally < 200 then
	    bally += 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if

	%When ball is in middle
	if ballx = 320 and bally = 200 then
	    %Explosion timer starts
	    ezexplosiontimer += 1
	    %Background reappears
	    showback := true
	end if
	%After a certain point
	if ezexplosiontimer > 14 then
	    %Phase 3
	    ezexplosionact := 3
	end if
    end if

    if ezexplosionact = 3 then % when phase 3
	%Blast ball left
	xdir -= 20
	%Determine whether up or down
	randint (yupordown, 1, 2)
	%If up
	if yupordown = 1 then
	    %Ball goes up
	    ydir += 20
	    %If down
	elsif yupordown = 2 then
	    %Ball goes down
	    ydir -= 20
	end if
	%Phase 4
	ezexplosionact := 4
    end if
    %Phase 4
    if ezexplosionact = 4 and skilluse = true and explosionhit = true then
	%Reset variables
	%Auras reset
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
	%timers reset
	ezexplosiontimer := 0
	ezulttimer := 0
	%No SKill use
	skilluse := false
	ultskilluse2 := false
	%No hit
	explosionhit := false
	%Show background
	showback := true

    end if

end ezcomputer

procedure normalcomputer
    %Computer speed
    if player1score < 5 then
	randint (compspeed, 7, 10)
	%Speeds up after a point
    elsif player1score >= 5 then
	randint (compspeed, 10, 15)
    end if
    %Stun
    if player2stun = true then
	%Unable to move
	compspeed := 0
    end if
    %Bullet
    if bullet2delay > bullet2reload and skilluse = false and ultskilluse1 = false then
	%Set bullet y
	bullet2yset := bullet2y
	%Shoot bullet
	bullet2act := 1
	%Play sound effect
	if bullet2x = 615 then
	    fork shoot
	end if
    end if
    %Doppel Shield
    %When ball is nearing death
    if shield2act = 0 and ballx > 630 and beam1act not= 2 and skilluse = false and ultskilluse1 = false then
	%Play sound
	fork blast
	%Reset variables
	shield2x := 629
	shield2y := 0
	shield2x2 := 0
	shield2y2 := 0
	shield2hit := false
	shield2act := 1
	%shield Y
	shield2y := player2y + distancetomiddle2
	shield2asbact := true

	%Increases bullet speed
	bullet2reload -= 50
	shieldslowdown2 := true
    end if

    %If after a certain point, ult timer
    if player1score >= 5 or player2score = 6 and skilluse = false then
	%Timer goes up
	norcompulttimer += 1
    end if
    %When timer is over, use
    if norcompulttimer > ranctime1 and beam2act = 0 and ultskilluse1 = false then
	%Beam phase 1
	beam2act := 1
	%Stop time
	tempdirx := xdir
	tempdiry := ydir
	xdir := 0
	ydir := 0
	%Reset aura
	specialblast2x := 0
	specialblast2y := 0
	%Use skill
	ultskilluse2 := true
	fork charge
    end if
end normalcomputer

procedure incomputer
    %Computer Speed
    if player1score < 5 then
	randint (compspeed, 15, 25)
	%increase speed after time
    elsif player1score >= 5 then
	randint (compspeed, 20, 30)
    end if
    %Computer stun
    if player2stun = true then
	%Stops computer
	compspeed := 0
    end if
    %Shoots bullet
    if bullet2delay > bullet2reload and ultskilluse2 = false and ultskilluse1 = false then
	%Set bullet y
	bullet2yset := bullet2y
	%Shoot bullet
	bullet2act := 1
	%Play bullet sound
	if bullet2x = 615 then
	    fork shoot
	end if
    end if

    %Sword attack
    %After a certain point, able to use skill
    if player1score >= 1 and skilluse = false and ultskilluse1 = false then
	%Timer goes up
	swordatktimer += 1
    end if
    %After a certain point, use skill
    if swordatktimer > ranctime1 and skilluse = false then
	%Start sword attack
	swordatkact := 1
	%Aura restart
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
	%Skill use
	skilluse := true
	%Set sword location variables
	sword1x := 600
	sword1y := 250
	sword2x := 600
	sword2y := 150
	sword3x := 600
	sword3y := player2y + distancetomiddle2

    end if

    if swordatkact = 1 then %Sword attack phase 1
	%Aura increases
	cspecialblastx2 += 20
	cspecialblasty2 += 20
	%Draw aura
	drawoval (cspecialblastx, cspecialblasty, cspecialblastx2, cspecialblasty2, black)
	%Swords move towards player
	sword1x -= 15
	sword2x -= 15
	%If before a certain point, swords follow player
	if sword1x > 400 then
	    %Sword goes towards player
	    if sword1y > player1y + distancetomiddle then
		sword1y -= 5
	    end if
	    if sword1y < player1y + distancetomiddle then
		sword1y += 5
	    end if
	end if

	%If before a certain point, swords follow player
	if sword2x > 400 then
	    %Sword goes towards player
	    if sword2y > player1y + distancetomiddle then
		sword2y -= 5
	    end if

	    if sword2y < player1y + distancetomiddle then
		sword2y += 5
	    end if
	end if
	%After swords are off screen, reuse
	if sword1x < -750 then
	    %Swords are once again in the screen
	    sword1x := 600
	    sword1y := 250
	    %Sets amount of swords to end
	    swordamount += 1

	end if
	%After swords are off screen, reuse
	if sword2x < -750 then
	    sword2x := 600
	    sword2y := 150
	end if
	%Extra sword after a duration
	if player1score > 2 then
	    %Spins
	    angle += 20
	    %Goes slowly towards the player
	    sword3x -= 3
	    %Spins
	    if angle > 359 then
		angle := 0
	    end if
	    %If greater than point, swords follow player
	    if sword3x > 400 then
		if sword3y + 50 > player1y + distancetomiddle then
		    sword3y -= 2
		end if

		if sword3y + 50 < player1y + distancetomiddle then
		    sword3y += 2
		end if
	    end if
	end if
	%Sword 1 collision
	if sword1x < player1x2 and sword1x + 98 > player1x and sword1y < player1y2 and sword1y + 38 > player1y then
	    %Player Stun
	    player1stun := true
	    stuntimer2 := 0
	end if
	%Sword 2 collision
	if sword2x < player1x2 and sword2x + 98 > player1x and sword2y < player1y2 and sword2y + 38 > player1y then
	    %Player Stun
	    player1stun := true
	    stuntimer2 := 0
	end if
	%Sword 2 collision
	if sword3x < player1x2 and sword3x + 200 > player1x and sword3y < player1y2 and sword2y + 200 > player1y then
	    %Player Stun
	    player1stun := true
	    stuntimer2 := 0
	end if
	%After 5 swords are thrown
	if swordamount = 5 then
	    %Restart timer
	    randint (ranctime1, 300, 800)
	    %Restart variables
	    swordatkact := 0
	    swordatktimer := 0
	    swordamount := 0
	    %No skilluse
	    skilluse := false

	    %Restart sword locations
	    sword1x := 600
	    sword1y := 250
	    sword2x := 600
	    sword2y := 150
	    sword3x := 600
	    sword3y := player2y + distancetomiddle2
	end if
    end if

    %Sword Ultimate
    %Timer goes after points
    if player1score >= 5 or player2score = 6 and skilluse = false then
	%Timer goes up
	incompulttimer += 1
    end if
    %If timer is greater than random time
    if incompulttimer > ranctime2 and skilluse = false and inultact = 0 and ultskilluse1 = false then
	%Ult Phase 1
	inultact := 1
	%Skilluse variables
	skilluse := true
	ultskilluse2 := true
	%Stop time
	xdir := tempdirx
	ydir := tempdiry
	xdir := 0
	ydir := 0
	%Aura reset
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
	%Timer reset
	incompulttimer := 0
    end if

    if inultact = 1 then %Phase 1
	%If aura is greater than value
	if specialblast2x - 800 > 600 then
	    %Phase 2
	    inultact := 2
	end if

    end if

    if inultact = 2 then %Phase 2
	%Special sword blast aura
	specialswordblast += 20
	%If over certain pointm go back to 0
	if specialswordblast > 700 then
	    specialswordblast := 0
	    %Wave amount to proceed with ultimate
	    waveamount += 1
	end if
	%After wave amount is to a certain point, slash timer starts
	if waveamount > 2 then
	    slashtimer += 1
	end if
    end if

    %After the end of the slash timer
    if slashtimer > 155 then
	ballx := -25
    end if

end incomputer

procedure godcomputer
    %Computer speed
    if player1score < 5 then
	%Calculates computer speed with math
	if bally > player2y + distancetomiddle2 then
	    compspeed := (bally - (player2y + distancetomiddle2)) - 10
	end if
	if bally < player2y + distancetomiddle2 then
	    compspeed := (player2y + (distancetomiddle2 - bally)) - 10
	end if
	%Goes faster as game goes on
    elsif player1score >= 5 then
	%Calculates computer speed with math
	if bally > player2y + distancetomiddle2 then
	    compspeed := (bally - (player2y + distancetomiddle2))
	end if
	if bally < player2y + distancetomiddle2 then
	    compspeed := (player2y + (distancetomiddle2 - bally))
	end if
    end if
    %Can be stunned
    if player2stun = true then
	%Stop moving
	compspeed := 0
    end if

    %Bullet
    if bullet2delay > bullet2reload and skilluse = false and ultskilluse1 = false and ultskilluse2 = false or darknessact > 0 then
	%Bullet y set
	bullet2yset := bullet2y
	%Shoot bullet
	bullet2act := 1
	%Play Sound
	if bullet2x = 615 then
	    fork shoot
	end if
    end if
    %Circle attack timer
    circleatktimer += 1
    %If timer is greater than a random time
    if circleatktimer > ranctime1 and skilluse = false and ultskilluse1 = false and ultskilluse2 = false then
	% Circle attack phase 1
	circleatkact := 1
	%Skill use
	skilluse := true
	%Circle attack location reset
	circleatkx := 600
	circleatky := player2y + distancetomiddle2
	circleatkx2 := 10
	circleatky2 := 10
	%Aura set
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
    end if

    %Circle Attack!!!
    if circleatkact = 1 then %Circle attack phase 1
	%Aura
	cspecialblastx2 += 20
	cspecialblasty2 += 20
	%Draw aura
	drawoval (cspecialblastx, cspecialblasty, cspecialblastx2, cspecialblasty2, black)
	%Draw circle attack
	drawfilloval (circleatkx, circleatky, circleatkx2, circleatky2, black)
	drawoval (circleatkx, circleatky, circleatkx2, circleatky2, white)
	drawoval (circleatkx, circleatky, circleatkx2 + 5, circleatky2 + 5, black)
	drawoval (circleatkx, circleatky, circleatkx2 + 10, circleatky2 + 10, black)
	drawoval (circleatkx, circleatky, circleatkx2 + 10, circleatky2 + 15, white)
	%Circle randomized speed
	randint (circleranspeed, 1, 10)
	%Go towards the middle in a randomized speed x
	if circleatkx > 500 then
	    circleatkx -= circleranspeed
	end if
	if circleatkx < 500 then
	    circleatkx += circleranspeed
	end if

	%Move to center y

	if circleatky > 200 then
	    circleatky -= circleranspeed
	end if
	if circleatky < 200 then
	    circleatky += circleranspeed
	end if

    end if

    %When circle is in center
    if circleatkx = 500 and circleatky = 200 then
	%Grow in size
	if circleatkx2 < 30 then
	    circleatkx2 += 2
	    circleatky2 += 2
	end if
	if circleatkx2 >= 30 then
	    %Phase 2
	    circleatkact := 2
	end if
    end if

    if circleatkact = 2 then %Phase 2

	%Go towards the ball
	if (xdir < 0 and ballx < 400 and ballx > 50) or (xdir > 0 and bally < 400) then
	    %Go towards the ball
	    if circleatkx > ballx then
		circleatkx -= 20
	    end if
	    if circleatkx < ballx then
		circleatkx += 20
	    end if
	    if circleatky < bally then
		circleatky += 20
	    end if
	    if circleatky > bally then
		circleatky -= 20
	    end if
	    %Draw the circle atttack
	    drawfilloval (circleatkx, circleatky, circleatkx2, circleatky2, black)
	    drawoval (circleatkx, circleatky, circleatkx2, circleatky2, white)
	    drawoval (circleatkx, circleatky, circleatkx2 + 5, circleatky2 + 5, black)
	    drawoval (circleatkx, circleatky, circleatkx2 + 10, circleatky2 + 10, black)
	    drawoval (circleatkx, circleatky, circleatkx2 + 10, circleatky2 + 15, white)
	end if
	%If hit the ball
	if circleatkx - ballx <= 20 and circleatky - bally <= 20 then
	    %Phase 3
	    circleatkact := 3
	    %Blast location
	    circleatkblastx := circleatkx
	    circleatkblasty := circleatky
	    circleatkblastx2 := 0
	end if

    end if

    if circleatkact = 3 then %Phase 3
	%If going left
	if xdir < 0 then
	    %Speed 5
	    xdir -= 5
	else
	    %If going right
	    %Reverse speed + 3
	    xdir *= -1
	    xdir -= 3
	end if
	%Decide whether to go up or down
	randint (yupordown, 1, 2)
	%Up
	if yupordown = 1 then
	    ydir += 5
	    %Down
	elsif yupordown = 2 then
	    ydir -= 5
	end if
	%Circle attack phase 4
	circleatkact := 4
    end if


    if circleatkact = 4 then %Phase 4
	%Draw circles
	drawoval (circleatkblastx, circleatkblasty, circleatkblastx2, circleatkblastx2, black)
	drawoval (circleatkblastx, circleatkblasty, circleatkblastx2 - 25, circleatkblastx2 - 25, white)
	drawoval (circleatkblastx, circleatkblasty, circleatkblastx2 - 50, circleatkblastx2 - 50, black)
	drawoval (circleatkblastx, circleatkblasty, circleatkblastx2 - 75, circleatkblastx2 - 75, white)
	%Blast radius increase
	circleatkblastx2 += 20
	%Timer restart
	circleatktimer := 0
	%Skill use
	skilluse := false
	%circle Location reset
	circleatkx := 600
	circleatky := player2y + distancetomiddle2
	circleatkx2 := 10
	circleatky2 := 10
	%Aura rest
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
	%Randomize timer
	randint (ranctime1, 300, 800)
	%if radius is greater than a value
	if circleatkblastx2 > 650 then
	    %Phase = 0
	    circleatkact := 0
	    circleatktimer := 0
	end if
    end if

    %DARKNESSSS
    %After a time, darkness timer goes up
    if player1score > 2 or player2score > 3 and skilluse = false then
	darknesstimer += 1
    end if
    %If timer is greater than value then use
    if darknesstimer > ranctime2 and skilluse = false and ultskilluse1 = false and ultskilluse2 = false then
	%Skill use
	skilluse := true
	%Darkness phase
	darknessact := 1
	%Darkness block
	darknessx := 650
	%Aura
	cspecialblastx2 := 0
	cspecialblasty2 := 0
	cspecialblastx := player2x
	cspecialblasty := player2y + distancetomiddle2
    end if

    if darknessact = 1 then %Darkness phase 1
	%Aura
	cspecialblastx2 += 20
	cspecialblasty2 += 20
	%Draw aura
	drawoval (cspecialblastx, cspecialblasty, cspecialblastx2, cspecialblasty2, black)
	%Darkness envelops
	darknessx -= 20
	%draws the darkness
	drawfillbox (darknessx, 0, 650, 400, black)
	%After it reaches point, reverse
	if darknessx < -1750 then
	    %PHase 2
	    darknessact := 2
	end if

    end if

    if darknessact = 2 then %Phase 2
	%Darknes rewinds
	darknessx += 20
	%Draw darkness
	drawfillbox (darknessx, 0, 650, 400, black)
	%Darkness rewind
	if darknessx > 650 then
	    %Phase 3
	    darknessact := 3
	end if
    end if

    if darknessact = 3 then %Phase 3
	%Shows the background again
	showback := true
	%Skill use
	skilluse := false
	%Darkness reset
	darknessx := 650
	darknessact := 0
	darknesstimer := 0
	%Reset random timer
	randint (ranctime2, 450, 800)
    end if

    %God`s Ultimate
    %If after a certain score
    if player1score >= 5 or player2score = 6 then
	godulttimer += 1
    end if
    %If timer is greater than value
    if godulttimer > godultrantime and skilluse = false and ultskilluse1 = false and godultact = 0 then
	%Phase 1
	godultact := 1
	%Skill use
	skilluse := true
	ultskilluse2 := true
	%Stop timer
	xdir := 0
	ydir := 0
	%Special blast aura reset
	specialblast2x := 0
	specialblast2y := 0
	%Time until start reset
	timeuntilstart := 0
	%Blast reset
	godblastx := 615
	godblasty2 := 0
	godblastx2 := 0
	godblasty := player2y + distancetomiddle2
	%Darkness reset
	darknessx := 650
	%Timer reset
	godulttimer := 0
    end if

    if godultact = 1 then %Phase 1
	%Stop time
	xdir := 0
	ydir := 0
	%Make sure ultskilluse is true
	ultskilluse2 := true
	%After aura then phase 2
	if specialblast2x - 800 > 600 then
	    %Phase 2
	    godultact := 2
	end if
    end if

    if godultact = 2 then %Phase 2
	%Stop time
	xdir := 0
	ydir := 0
	%Ball goes to middle
	if ballx > 320 then
	    ballx -= 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if
	if ballx < 320 then
	    ballx += 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if

	if bally > 200 then
	    bally -= 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if
	if bally < 200 then
	    bally += 1
	    drawfilloval (ballx, bally, 10, 10, white)
	end if

	%When ball is in middle
	if ballx = 320 and bally = 200 then
	    %Player 1 stun
	    player1stun := true
	    %Time until start
	    timeuntilstart += 1
	end if
	%Sound effect
	if timeuntilstart = 1 then
	    fork obliterate
	end if
	%If after 100, phase 3
	if timeuntilstart > 100 then
	    %Phase 3
	    godultact := 3
	    %Make sure is stunned
	    player1stun := true
	end if
    end if

    if godultact = 3 then %Phase 3
	%Stop time
	xdir := 0
	ydir := 0
	%Make sure player is stunned
	player1stun := true
	%Godblast y
	godblasty := player2y + distancetomiddle2
	%Godblast x
	godblastx -= 20
	godblastx2 += 20
	%Godblast y get bigger
	godblasty2 += 1
	%Increase y faster
	if godblasty2 > 200 then
	    godblasty2 += 5
	end if
	%Increase y faster
	if godblasty2 > 300 then
	    godblasty2 += 10
	end if
	%Darkness comes
	if godblasty2 > 3500 then %4000
	    darknessx -= 20
	    drawfillbox (darknessx, 0, 640, 400, black)
	end if
	%After darkness is a certain value
	if darknessx < -1000 then
	    %Phase 4
	    godultact := 4
	end if

    end if

    if godultact = 4 then %Phase 4
	%Ensure skill use
	skilluse := true
	ultskilluse2 := true
	%Explosion timer
	godexplosionpictimer += 1
	%Draw explosion
	Pic.Draw (godexplosion, 1, 1, 1)
	%If timer after value, draw new picture
	if godexplosionpictimer > 60 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("0-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 61 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("1-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 62 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("2-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 63 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("3-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 64 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("4-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 65 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("5-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 66 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("6-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 67 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("7-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 68 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("8-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 69 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("9-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 70 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("10-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 71 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("11-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 72 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("12-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 73 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("13-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 74 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("14-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 75 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("15-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 76 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("16-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 77 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("17-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 78 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("18-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 79 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("19-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 80 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("20-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 81 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("21-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 82 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("22-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 83 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("23-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 84 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("24-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 85 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("25-gex-gif.JPG")
	    %Put you have just been destroyed
	    Font.Draw ("YOU HAVE JUST BEEN DESTROYED!", 60, 50, godfont, white)
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 86 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("26-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 87 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("27-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 88 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("28-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 89 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("29-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 90 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("30-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 91 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("31-gex-gif.JPG")
	end if
	%If timer after value, draw new picture
	if godexplosionpictimer > 92 then
	    Pic.Free (godexplosion)
	    godexplosion := Pic.FileNew ("32-gex-gif.JPG")
	end if
	%Darkness rewind
	if darknessx < 650 then
	    darknessx += 20
	    %Draw darkness
	    drawfillbox (darknessx, 0, 640, 400, black)
	end if
	%After a point
	if godexplosionpictimer > 92 then
	    %Give player 2 a point
	    ballx := -25
	    %No longer usable
	    godultact := 5
	    %Draw final picture
	    drawfillbox (0, 0, 640, 400, black)
	    Pic.Draw (godexplosion, 1, 1, 1)
	    godexplosion := Pic.FileNew ("32-gex-gif.JPG")
	    Font.Draw ("YOU HAVE JUST BEEN DESTROYED!", 60, 50, godfont, white)
	end if
    end if

end godcomputer

%Intros
procedure turtleintro
    cls
    delay (100)
    %Intro timer to set pace
    introtimer += 1
    %Walk towards middle
    if turtleintrox < 305 then
	%Walk towards middle
	turtleintrox += 1
	locatexy (250, 350)
	put "Average walking speed..."
    end if
    %Draw turtle
    drawfillbox (turtleintrox, 200, turtleintrox + 25, 250, green)
    drawbox (turtleintrox, 200, turtleintrox + 25, 250, white)
    drawbox (turtleintrox - 1, 199, turtleintrox + 26, 251, black)
    %Ground
    drawline (0, 200, 640, 200, black)
    %Put a few hours later
    if introtimer > 50 and turtleintroscreenshow = true then
	cls
	locatexy (220, 200)
	put "A few hours later..."
	%Go back to turtle
	if introtimer > 70 then
	    turtleintroscreenshow := false
	    turtleintrox := 280
	end if
    end if
    %Once turtle reaches middle
    if turtleintrox >= 305 then
	%Draw a star and name
	drawfillstar (220, 130, 420, 330, yellow)
	drawline (0, 200, 640, 200, black)
	drawfillbox (turtleintrox, 200, turtleintrox + 25, 250, green)
	drawbox (turtleintrox, 200, turtleintrox + 25, 250, white)
	drawbox (turtleintrox - 1, 199, turtleintrox + 26, 251, black)
	Font.Draw ("TURTLE!", 215, 50, font1, black)
    end if

end turtleintro

procedure doppelintro %qwe
    cls
    delay (30)
    %Introtimer sets pace
    introtimer += 1
    %Ground
    drawline (0, 200, 640, 200, black)

    %Move towards each other
    if introdoppel1x > 230 and introdoppel2x < 400 and introdoppelact not= 5 then
	if introdoppelact not= 6 then
	    %Draw question mark
	    Font.Draw ("?", introdoppel1x + 12, introdoppel2y + 75, scorefont, black)
	end if
    else
	introdoppel1x += 5
	introdoppel2x -= 5
    end if
    %Act phase 1
    if introdoppelact = 0 and introtimer > 75 then
	introdoppelact := 1
    end if

    %Start jump up
    if introdoppelact = 1 then
	introdoppel1y += 10
	introdoppel2y += 10

    end if
    %Act phase 2
    if introdoppel1y > 300 and introdoppelact = 1 then
	introdoppelact := 2
    end if
    %Act phase 3
    if introdoppelact = 2 and introtimer > 100 then
	introdoppelact := 3
    end if
    %Start jump down
    if introdoppelact = 3 then %Phase 3
	introdoppel1y -= 10
	introdoppel2y -= 10
    end if
    %Act phase 4
    if introdoppelact = 3 and introdoppel1y <= 200 then
	introdoppelact := 4
    end if
    %Act phase 5
    if introtimer > 120 then
	introdoppelact := 5
    end if

    if introdoppelact = 5 then %Phase 5
	%Draw !!!
	Font.Draw ("!!!", introdoppel1x + 12, introdoppel2y + 75, scorefont, black)
    end if

    %Draw Player 1
    drawfillbox (introdoppel1x, introdoppel1y, introdoppel1x + 25, introdoppel1y + 50, red)
    drawbox (introdoppel1x, introdoppel1y, introdoppel1x + 25, introdoppel1y + 50, white)
    drawbox (introdoppel1x - 1, introdoppel1y - 1, introdoppel1x + 26, introdoppel1y + 51, black)

    %Draw dooppelganger
    drawfillbox (introdoppel2x, introdoppel2y, introdoppel2x + 25, introdoppel2y + 50, red)
    drawbox (introdoppel2x, introdoppel2y, introdoppel2x + 25, introdoppel2y + 50, white)
    drawbox (introdoppel2x - 1, introdoppel2y - 1, introdoppel2x + 26, introdoppel2y + 51, black)

    %Turn blue
    if introdoppelact = 5 and introdoppel1x > introdoppel2x then
	drawfillbox (introdoppel2x, introdoppel2y, introdoppel2x + 25, introdoppel2y + 50, blue)
	drawbox (introdoppel2x, introdoppel2y, introdoppel2x + 25, introdoppel2y + 50, white)
	drawbox (introdoppel2x - 1, introdoppel2y - 1, introdoppel2x + 26, introdoppel2y + 51, black)
    end if
    %Phase 6
    if introdoppel2x < 290 then
	introdoppelact := 6
    end if

    if introdoppelact = 6 then %Phase 6
	%Draw doppelganger
	Font.Draw ("DOPPELGANGER!!", 100, 50, font1, black)
	%Run away
	introdoppel1x += 10
    end if
end doppelintro
%qwee
procedure infernointro
    cls
    delay (30)

    %Sword aura
    specialswordblast += 40
    %Special sword blast reset
    if specialswordblast > 1000 then
	specialswordblast := 0
	%Wave amount to set pace
	waveamount += 1
    end if
    %Draw background
    drawfillbox (0, 0, 640, 400, black)
    %Draw Wave
    drawoval (320, 200, specialswordblast, specialswordblast, red)
    %Draw Inferno
    drawfillbox (295, 187, 345, 213, brightred)
    drawbox (295, 187, 345, 213, white)
    drawbox (294, 186, 346, 214, black)
    %Draw sword
    Pic.Draw (ultswordpic, 270, 40, 1)
    %After a time write inferno
    if waveamount > 2 then
	%Inferno
	Font.Draw ("INFERNO!!!", 210, 50, font1, white)
    end if

end infernointro

procedure godintro
    cls
    delay (30)
    %Intro timer to set pace
    introtimer += 1

    %After a delay, darkness rewinds
    if introtimer > 30 then
	godintrodarknessx += 10
    end if

    %After a time, say Power Overwhelming
    if introtimer > 80 then
	if power = false then
	    fork poweroverwhelming
	    power := true
	end if
    end if

    %After a time, have an aura blast
    if introtimer > 100 then
	godintroblast += 50
    end if

    %If aura is off screen, restart
    if godintroblast > 700 then
	godintroblast := 0
    end if
    %Draw spell circle
    Pic.Draw (godspellcircle, -20, -15, 1)

    %Draw Ultimate weapon
    drawfillbox (295, 187, 345, 213, black)
    drawbox (295, 187, 345, 213, white)
    drawbox (294, 186, 346, 214, black)

    %Text Ultimate weapon
    Font.Draw ("THE ULTIMATE WEAPON", 35, 50, font1, black)
    drawfillbox (godintrodarknessx, 0, 640, 400, black)
    %Introblast

    drawoval (320, 200, godintroblast, godintroblast, black)
end godintro

%GAME START CODE---Most of the basic Pong elements
procedure gamestart
    %Graphics
    graphics
    delay (15)

    View.Update
    cls
    %If ball is near wall, slow time
    if ballx < 25 or ballx > 615 then
	delay (33)
    end if

    %Makes ball go either forward or backwards / up and down
    ballx := ballx + xdir
    bally := bally + ydir

    %Make it not glitch when xdir = 0
    if xdir = 0 and beam1act not= 1 and beam2act not= 1 and ezexplosionact not= 1 and ezexplosionact not= 2 and inultact not= 1 and inultact not= 2 and circleatkact = 0 and godultact = 0 then
	randint (xdir, -1, 1)
    end if

    %Player 2's wall
    if ballx - 15 >= maxx then
	%Cheer
	fork cheer
	%Restart ALL variables!!!
	randint (ballx, 350, 400)
	randint (bally, 50, 350)
	%Randomize speed
	randint (xdir, -2, 2)
	randint (ydir, -2, 2)
	if xdir = 0 then
	    randint (xdir, 1, 2)
	end if

	if ydir = 0 then
	    randint (ydir, 1, 2)
	end if
	player1score += 1

	locatexy (325, 370)
	put player1score
	player2y := 200
	player2y2 := 250
	player1y := 200
	player1y2 := 250

	randint (itemlocx, 30, 580)
	randint (itemlocy, 25, 325)

	randint (item2locx, 30, 580)
	randint (item2locy, 25, 325)

	randint (item3locx, 30, 580)
	randint (item3locy, 25, 325)

	itemtyperan := 0
	item1endtimer := 0
	distancetomiddle := 25
	randint (item1timer, 1, 100)
	randint (item2timer, 1, 100)
	randint (item3timer, 1, 100)

	distancetomiddle2 := 25

	player1stun := false
	player2stun := false

	bulletreload := 50
	bullet2reload := 50

	stuntimer1 := 0
	stuntimer2 := 0

	item2act := 0
	item2player := 0
	item2endtimer := 0

	item3act := 0
	item3player := 0
	shieldhit := false

	shieldx := 13
	shieldy := 0
	shieldx2 := 0
	shieldy2 := 0

	shield2x := 629
	shield2y := 0
	shield2x2 := 0
	shield2y2 := 0
	shield2hit := false

	shieldact := 0
	shield2act := 0

	shieldasb := 0
	shieldasb2 := 0

	dup1act := 0
	dup2act := 0
	item3endtimer2 := 0
	item3endtimer1 := 0

	dup1hit := 0
	dup2hit := 0

	specialblastx2 := 0
	specialblasty2 := 0

	if beam1act = 1 or beam1act = 2 then
	    beam1act := 3
	end if
	if beam2act = 1 or beam2act = 2 then
	    beam2act := 3
	end if

	beam1x := 26
	beam1y := 0
	beam2x := 614
	beam2y := 0
	beam2x2 := 26

	beam1timer := 0
	beam2timer := 0

	shieldslowdown := false
	shieldslowdown2 := false

	norcompulttimer := 0

	%Skills
	if amountofplayers = 1 then
	    cspecialblastx2 := 0
	    cspecialblasty2 := 0
	    cspecialblastx := player2x
	    cspecialblasty := player2y + distancetomiddle2
	    randint (ranctime1, 300, 800)
	    randint (ranctime2, 450, 800)
	end if

	if difficulty = 1 then
	    ezslowtimer := 0
	    ezslowendtimer := 0
	    ezslowact := 0
	    ezexplosiontimer := 0
	    ezulttimer := 0
	end if

	skilluse := false
	showback := true

	ultskilluse1 := false
	ultskilluse2 := false

	if difficulty = 3 then
	    swordatkact := 0
	    swordatktimer := 0
	    swordamount := 0
	    angle := 0

	    sword1x := 600
	    sword1y := 250
	    sword2x := 600
	    sword2y := 150
	    sword3x := 600
	    sword3y := player2y + distancetomiddle2

	    if slashtimer > 140 then
		inultact := 3
		slashtimer := 0
		waveamount := 0
		skilluse := false
		ultskilluse2 := false
		cspecialblastx2 := 0
		cspecialblasty2 := 0
		cspecialblastx := player2x
		cspecialblasty := player2y + distancetomiddle2
	    end if
	end if

	if difficulty = 4 then
	    circleatkact := 0
	    circleatktimer := 0
	    darknesstimer := 0
	    darknessact := 0
	end if
	delay (2500)
    end if

    %Top wall collision
    if bally >= maxy then
	ydir := ydir * -1
    end if

    %Bottom wall collision
    if bally <= 0 then
	ydir := ydir * -1
    end if

    %Player 1's Wall
    if ballx + 15 <= 0 then
	%Cheer
	fork cheer
	%Restart ALL variables!!!
	randint (ballx, 350, 400)
	randint (bally, 50, 350)

	%Randomize speed
	randint (xdir, -2, 2)
	randint (ydir, -2, 2)
	if xdir = 0 then
	    randint (xdir, 1, 2)
	end if

	if ydir = 0 then
	    randint (ydir, 1, 2)
	end if

	player2score += 1

	locatexy (325, 370)
	put player2score

	player2y := 200

	player2y2 := 250

	player1y := 200
	player1y2 := 250

	randint (itemlocx, 30, 580)
	randint (itemlocy, 25, 325)
	randint (item2locx, 30, 580)
	randint (item2locy, 25, 325)
	randint (item3locx, 30, 580)
	randint (item3locy, 25, 325)

	itemtyperan := 0
	item1endtimer := 0
	distancetomiddle := 25
	randint (item1timer, 1, 100)
	randint (item2timer, 1, 100)
	randint (item3timer, 1, 100)

	distancetomiddle2 := 25

	player1stun := false
	player2stun := false

	bulletreload := 50
	bullet2reload := 50

	stuntimer1 := 0
	stuntimer2 := 0

	item2act := 0
	item2player := 0
	item2endtimer := 0

	item3act := 0
	item3player := 0
	shieldhit := false

	shieldx := 13
	shieldy := 0
	shieldx2 := 0
	shieldy2 := 0

	shield2x := 629
	shield2y := 0
	shield2x2 := 0
	shield2y2 := 0
	shield2hit := false

	shieldact := 0
	shield2act := 0

	shieldasb := 0
	shieldasb2 := 0

	dup1act := 0
	dup2act := 0
	item3endtimer2 := 0
	item3endtimer1 := 0

	dup1hit := 0
	dup2hit := 0

	specialblastx2 := 0
	specialblasty2 := 0

	if beam1act = 1 or beam1act = 2 then
	    beam1act := 3
	end if
	if beam2act = 1 or beam2act = 2 then
	    beam2act := 3
	end if

	beam1x := 26
	beam1y := 0
	beam2x := 614
	beam2y := 0
	beam2x2 := 26

	beam1timer := 0
	beam2timer := 0

	shieldslowdown := false
	shieldslowdown2 := false

	norcompulttimer := 0



	%Skills
	if amountofplayers = 1 then
	    cspecialblastx2 := 0
	    cspecialblasty2 := 0
	    cspecialblastx := player2x
	    cspecialblasty := player2y + distancetomiddle2
	    randint (ranctime1, 300, 800)
	    randint (ranctime2, 300, 800)
	end if

	if difficulty = 1 then
	    ezslowtimer := 0
	    ezslowendtimer := 0
	    ezslowact := 0
	    ezexplosiontimer := 0
	    ezulttimer := 0
	end if

	skilluse := false
	showback := true

	ultskilluse1 := false
	ultskilluse2 := false

	if difficulty = 3 then
	    swordatkact := 0
	    swordatktimer := 0
	    swordamount := 0
	    angle := 0

	    sword1x := 600
	    sword1y := 250
	    sword2x := 600
	    sword2y := 150
	    sword3x := 600
	    sword3y := player2y + distancetomiddle2
	    if slashtimer > 140 then
		inultact := 3
		slashtimer := 0
		waveamount := 0
		skilluse := false
		ultskilluse2 := false
		cspecialblastx2 := 0
		cspecialblasty2 := 0
		cspecialblastx := player2x
		cspecialblasty := player2y + distancetomiddle2
	    end if
	end if


	if difficulty = 4 then
	    circleatkact := 0
	    circleatktimer := 0
	    darknesstimer := 0
	    darknessact := 0
	end if

	delay (2500)
    end if

    %Ball to player 1 collision
    if ballx - 20 < player1x2 and ballx + 20 > player1x and bally + 20 > player1y and bally - 20 < player1y2
	    then
	%Sometimes gets stuck if not put
	if ballx - 20 < 25 then
	    ballx := 50
	end if

	%Direction Change
	xdir *= -1
	%Speed increase
	xdir += 1

	if shieldslowdown2 = true then
	    xdir -= 4
	    shieldslowdown2 := false
	end if
	%Pind sound
	fork ping

	%Slightly move up or down
	if ydir > 0 then
	    randint (ranspeed, 0, 2)
	    ydir += ranspeed
	else
	    randint (ranspeed, -2, 0)
	    ydir += ranspeed
	end if

    end if

    %Ball to player 2 collision

    if ballx + 20 > 614 and ballx - 20 < 640 and bally + 20 > player2y and bally - 20 < player2y2 then

	%Sometimes gets stuck if not put
	if ballx + 20 > 615 then
	    ballx := 590

	end if
	%Change direction
	xdir *= -1
	%Speed up
	xdir -= 1

	if shieldslowdown = true then
	    xdir += 4
	    shieldslowdown := false
	end if

	fork ping

	%Slightly change angle
	if ydir > 0 then
	    randint (ranspeed, 0, 2)
	    ydir += ranspeed
	else
	    randint (ranspeed, -2, 0)
	    ydir += ranspeed
	end if

    end if

    %Shows the background if true
    if showback = true then
	Pic.Draw (background, 1, 1, 1)
    end if
    %Score board
    %Draws in black font
    if difficulty = 1 or amountofplayers = 2 then
	Font.Draw (intstr (player1score), 310, 370, scorefont, black)
	Font.Draw (":", 320, 370, scorefont, black)
	Font.Draw (intstr (player2score), 330, 370, scorefont, black)
	%Draws in white font
    elsif difficulty = 2 or difficulty = 3 or difficulty = 4 then
	Font.Draw (intstr (player1score), 310, 370, scorefont, white)
	Font.Draw (":", 320, 370, scorefont, white)
	Font.Draw (intstr (player2score), 330, 370, scorefont, white)
    end if

    %Game point message
    if player1score = 6 then
	%Draws in black font
	if difficulty = 1 or amountofplayers = 2 then
	    Font.Draw ("GAMEPOINT!", 100, 370, scorefont, black)
	    %Draws in white foont
	elsif difficulty = 2 or difficulty = 3 or difficulty = 4 then
	    Font.Draw ("GAMEPOINT!", 100, 370, scorefont, white)
	end if
    end if
    %Game point message 2
    if player2score = 6 then
	%Draws in black font
	if difficulty = 1 or amountofplayers = 2 then
	    Font.Draw ("GAMEPOINT!", 440, 370, scorefont, black)
	    %Draws in white foont
	elsif difficulty = 2 or difficulty = 3 or difficulty = 4 then
	    Font.Draw ("GAMEPOINT!", 440, 370, scorefont, white)

	end if
    end if
    %Y Coordinate Glitch avoider
    if bally > 400 then
	bally := 400
    end if
    if bally < 0 then
	bally := 0
    end if


    %Determines whether or not each LED light (128,64,32) is 1 or 0
    if player2score = 0 then
	num := 254
    elsif player2score = 1 then
	num := 252
    elsif player2score = 2 then
	num := 248
    elsif player2score = 3 then
	num := 240
    elsif player2score = 4 then
	num := 224
    elsif player2score = 5 then
	num := 192
    elsif player2score = 6 then
	num := 128
    elsif player2score = 7 then
	num := 0
    end if
    %The last light is up when player 1 is able to use shield
    if shieldact = 0 and player2score not= 7 then
	num += 1
    end if

    %PC.ParallelPut (1, num)
    %Insane ult angle reset
    if angle > 359 then
	angle := 0
    end if

end gamestart

procedure items
    %IIItemsz----
    %Item timer
    item1timer += 1
    %When item timer is greater than a value
    if item1timer > 300 and ultskilluse1 = false and ultskilluse2 = false then
	%Draws the item
	randint (itemlocx, 30, 580)
	randint (itemlocy, 25, 325)
	%Item phase
	item1act := 1
	%Randomize next time
	randint (item1timer, 1, 100)
    end if
    %When in phase 1
    if item1act = 1 and ultskilluse1 = false and ultskilluse2 = false then
	%Draws the item
	drawbox (itemlocx, itemlocy, itemlocx + 30, itemlocy + 30, black)
	drawfillbox (itemlocx + 1, itemlocy + 1, itemlocx + 29, itemlocy + 29, white)
	Pic.Draw (item1pic, itemlocx + 5, itemlocy + 5, 2)
    end if
    %Player 1 recieves powerup
    if bulletx + 15 > itemlocx and bulletx - 15 < itemlocx + 30 and bulletyset + 15 > itemlocy and bulletyset - 15 < itemlocy + 30 and item1act = 1 then
	%itemtyperan := 1
	%Enlarge pong
	distancetomiddle += 20
	player1y -= 20
	player1y2 += 20

	%Reset phase
	item1act := 0
	%Reset timer
	randint (item1timer, 1, 100)
	%Indicate player
	item1player := 1
    end if
    %Player 2 recieve powerup
    if bullet2x + 15 > itemlocx and bullet2x - 15 < itemlocx + 30 and bullet2yset + 15 > itemlocy and bullet2yset - 15 < itemlocy + 30 and item1act = 1 then
	%itemtyperan := 1
	%Enlarge pong
	distancetomiddle2 += 20

	%Keyboard
	player2y -= 20
	player2y2 += 20

	item1act := 0
	%Reset timer
	randint (item1timer, 1, 100)
	%Indicate player
	item1player := 2
    end if

    %Speed Powerup
    %Item timer
    item2timer += 1
    %When larger than a value
    if item2timer > 500 and ultskilluse1 = false and ultskilluse2 = false then
	%Shows item picture
	randint (item2locx, 30, 580)
	randint (item2locy, 25, 325)
	%Item phase = 1
	item2act := 1
	%Item timer restart
	randint (item2timer, 1, 100)
    end if
    %Item phase = 1
    if item2act = 1 and ultskilluse1 = false and ultskilluse2 = false then
	%Shows item picture
	drawbox (item2locx, item2locy, item2locx + 30, item2locy + 30, white)
	drawfillbox (item2locx + 1, item2locy + 1, item2locx + 29, item2locy + 29, black)
	Pic.Draw (item2pic, item2locx + 5, item2locy + 5, 2)
    end if

    %Player 1 recieves powerup 2
    if bulletx + 15 > item2locx and bulletx - 15 < item2locx + 30 and bulletyset + 15 > item2locy and bulletyset - 15 < item2locy + 30 and item2act = 1 then
	%Attack speed higher
	bulletreload -= 30
	item2act := 2
	%Item restart
	randint (item2timer, 1, 100)
	%Player = 1
	item2player := 1
	%End timer restart
	item2endtimer := 0
    end if

    %Player 2 recieve powerup
    if bullet2x + 15 > item2locx and bullet2x - 15 < item2locx + 30 and bullet2yset + 15 > item2locy and bullet2yset - 15 < item2locy + 30 and item2act = 1 then
	%Attack speed increase
	bullet2reload -= 30
	%Item phase 2
	item2act := 2
	%Randomize timer
	randint (item2timer, 1, 100)
	%Player item 2
	item2player := 2
	%End timer
	item2endtimer := 0
    end if

    %Duration items
    if item2act = 2 then %Phase 2
	%Timer to end effect
	item2endtimer += 1
    end if
    if item2endtimer > 350 then %End effect
	%When Player 1 has effect
	if item2player = 1 then
	    %Debuff
	    bulletreload += 30
	end if
	%When Player 2 has effect
	if item2player = 2 then
	    %Debuff
	    bullet2reload += 30

	end if
	%Reset item variables
	item2act := 0
	item2player := 0
	item2endtimer := 0
    end if
    %Duplicate
    %Item 3 timer
    item3timer += 1
    %When timer is greater than value
    if item3timer > 450 and ultskilluse1 = false and ultskilluse2 = false then
	%Make random spot
	randint (item3locx, 30, 580)
	randint (item3locy, 25, 325)
	%Phase 1
	item3act := 1
	%Randomize timer again
	randint (item3timer, 1, 100)
    end if

    %Phase 1
    if item3act = 1 and ultskilluse1 = false and ultskilluse2 = false then
	%Draw item picture
	drawbox (item3locx, item3locy, item3locx + 30, item3locy + 30, black)
	drawfillbox (item3locx + 1, item3locy + 1, item3locx + 29, item3locy + 29, white)
	Pic.Draw (item3pic, item3locx + 5, item3locy + 5, 2)
    end if

    %Player 1 recieves powerup 3
    if bulletx + 15 > item3locx and bulletx - 15 < item3locx + 30 and bulletyset + 15 > item3locy and bulletyset - 15 < item3locy + 30 and item3act = 1 then
	%Duplication location is set
	dupx := 65
	dupx2 := 75
	dupy := bally - 15
	dupy2 := bally + 15
	%Duplication phase 1
	dup1act := 1
	%Duplication hit amount
	dup1hit := 0
	%Item 3 reset

	item3act := 0
	randint (item3timer, 1, 100)
	item3player := 1
	item3endtimer1 := 0
	item3endtimer2 := 0
    end if

    %Player 2 recieve powerup 3
    if bullet2x + 15 > item3locx and bullet2x - 15 < item3locx + 30 and bullet2yset + 15 > item3locy and bullet2yset - 15 < item3locy + 30 and item3act = 1 then
	%Duplication location is set
	dup2x := 565
	dup2x2 := 575
	dup2y := bally - 15
	dup2y2 := bally + 15
	%Duplication hit amount
	dup2hit := 0
	%Duplication phase 1
	dup2act := 1
	%Item 3 reset
	item3act := 0
	randint (item3timer, 1, 100)
	item3player := 2
	item3endtimer1 := 0
    end if
    %Player 1 item 3 code
    %If player 1 recieve
    if dup1act = 1 then

	%Goes towards the ball
	if dupy + 15 > bally then
	    %Duplication speed
	    dupy -= 7
	    dupy2 -= 7
	end if
	if dupy + 15 < bally then
	    %Duplication speed
	    dupy += 7
	    dupy2 += 7
	end if
	%When duplication gets the ball
	if ballx - 15 < dupx2 and ballx + 15 > dupx and bally + 15 > dupy and bally - 15 < dupy2 and xdir < 0
		then
	    %Sometimes gets stuck if not put
	    if ballx - 20 < 75 then
		ballx := 100
	    end if
	    %Direction Change
	    xdir *= -1
	    xdir += 1
	    %Stop the shield speed bonus
	    if shieldslowdown2 = true then
		xdir -= 4
		shieldslowdown2 := false
	    end if

	    fork ping
	    %Slightly move up or down
	    if ydir > 0 then
		randint (ranspeed, 0, 2)
		ydir += ranspeed
	    else
		randint (ranspeed, -2, 0)
		ydir += ranspeed
	    end if

	end if
	%Bullet Block
	if bullet2x - 15 < dupx2 and bullet2x + 15 > dupx and bullet2y + 15 > dupy and bullet2y - 15 < dupy2 then
	    %Blocks the bullet
	    bullet2act := 0
	    bullet2x := 615
	    bullet2delay := 0
	    %Duphit is increased
	    dup1hit += 1
	end if
	%End timer increases
	item3endtimer1 += 1
    end if

    %Player 2 item 3 code
    %Goes towards the ball
    if dup2act = 1 then
	%Follows ball
	if dup2y + 15 > bally then
	    dup2y -= 7
	    dup2y2 -= 7
	end if
	if dup2y + 15 < bally then
	    dup2y += 7
	    dup2y2 += 7
	end if
	%Duplication hit ball
	if ballx - 15 < dup2x2 and ballx + 15 > dup2x and bally + 15 > dup2y and bally - 15 < dup2y2 and xdir > 0
		then
	    %Sometimes gets stuck if not put
	    if ballx - 20 < 75 then
		ballx := 540
	    end if
	    %Direction Change
	    xdir *= -1
	    xdir -= 1

	    %Slows down shield speed
	    if shieldslowdown = true then
		xdir += 4
		shieldslowdown := false
	    end if

	    %Sound effect
	    fork ping

	    %Slightly move up or down
	    if ydir > 0 then
		randint (ranspeed, 0, 2)
		ydir += ranspeed
	    else
		randint (ranspeed, -2, 0)
		ydir += ranspeed
	    end if

	end if
	%Bullet Block
	if bulletx - 15 < dup2x2 and bulletx + 15 > dup2x and bullety + 15 > dup2y and bullety - 15 < dup2y2 then
	    %Blocks bullet
	    bulletact := 0
	    bulletx := 26
	    bulletdelay := 0
	    %Duphit is increase
	    dup2hit += 1
	end if
	item3endtimer2 += 1
    end if

    %Item 3 Ends
    %If time ends or duphit is 2 then end
    if item3endtimer1 > 750 or dup1hit = 2 then
	%End duplication
	dup1act := 0
	dup1hit := 0
    end if
    %If time ends or duphit is 2 then end
    if item3endtimer2 > 750 or dup2hit = 2 then
	%End duplication
	dup2act := 0
	dup2hit := 0
    end if
end items
%End GAMESTART-------
%Where the actual code begins to activate-
fork menumusic
menuscreen
loop
    %Timer to stop from clicking too many buttons of the same location
    menutimer += 1
    %Variable to be at menu
    menu := 0
    %Enables Mouse
    mousewhere (mx, my, button)
    %Helps update screen
    View.Update

    %VS Computer
    if button = 1 and instructionact = 0 and mx > 30 and mx < 200 and my > 220 and my < 260 and menutimer > 333 then
	%Variable to change screen
	vscomp := 1
	%Set amount of players
	amountofplayers := 1
	%Timer to stop from clicking too many buttons of the same location
	menutimer := 0
    end if
    %Select Difficulty in VS Computer
    if vscomp = 1 then
	cls
	%Labels
	locatexy (250, 280)
	put "Select your difficulty:"

	locatexy (95, 200)
	put "Turtle"
	locatexy (60, 150)
	put "Super Easy Mode"

	locatexy (275, 200)
	put "Doppelganger"
	locatexy (275, 150)
	put "Normal Mode"

	locatexy (490, 200)
	put "Inferno"
	locatexy (480, 150)
	put "Insane Mode"

	locatexy (240, 80)
	put "The ULTIMATE Weapon"
	locatexy (276, 30)
	put "God Mode"

	Font.Draw ("Back to Menu", 10, 45, menufont, black)


	%Buttons
	drawbox (30, 180, 200, 220, black)
	drawbox (240, 180, 400, 220, black)
	drawbox (440, 180, 600, 220, black)
	drawbox (240, 60, 400, 120, black)
	drawbox (5, 10, 95, 90, black)
	%Mousewhere
	mousewhere (mx, my, button)

	%Difficulty Buttons
	if button = 1 and mx > 30 and mx < 200 and my > 180 and my < 220 and menutimer > 333 then
	    %Difficulty = easy
	    difficulty := 1
	    %Timer to stop from clicking too many buttons of the same location
	    menutimer := 0

	    amountofplayers := 1
	    %Start game
	    activate := 1
	end if
	if button = 1 and mx > 240 and mx < 400 and my > 180 and my < 220 and menutimer > 333 then
	    %Difficulty = Normal
	    difficulty := 2
	    %Timer to stop from clicking too many buttons of the same location
	    menutimer := 0

	    amountofplayers := 1
	    %Start game
	    activate := 1
	end if
	if button = 1 and mx > 440 and mx < 600 and my > 180 and my < 220 and menutimer > 333 then
	    %Difficulty = Insane
	    difficulty := 3
	    %Timer to stop from clicking too many buttons of the same location
	    menutimer := 0

	    amountofplayers := 1
	    %Start game
	    activate := 1
	end if

	if button = 1 and mx > 240 and mx < 400 and my > 60 and my < 120 and menutimer > 333 then
	    %Difficulty = Godmode
	    difficulty := 4
	    %Timer to stop from clicking too many buttons of the same location
	    menutimer := 0

	    amountofplayers := 1
	    %Start game
	    activate := 1
	end if

	%Back button
	if button = 1 and menutimer > 333 and mx > 5 and mx < 95 and my > 1 and my < 90 then
	    %Resets
	    vscomp := 0
	    %Timer to stop from clicking too many buttons of the same location
	    menutimer := 0
	    cls
	    menuscreen
	end if


    end if

    % 2 Players
    if button = 1 and instructionact = 0 and mx > 440 and mx < 600 and my > 220 and my < 260 and difficulty = 0 and menutimer > 333 then
	%Two player mode
	amountofplayers := 2
	%Start game
	activate := 2
	%Timer to stop from clicking too many buttons of the same location
	menutimer := 0
	%Enable music
	fork music
	background := Pic.FileNew ("2Playerback.JPG")
    end if

    %Instructions

    if button = 1 and instructionact = 0 and mx > 220 and mx < 420 and my > 220 and my < 260 and menutimer > 333 then
	instructionact := 1
	%Timer to stop from clicking too many buttons of the same location
	menutimer := 0
    end if
    if instructionact = 1 then %Page 1
	%Labels
	cls
	locatexy (10, 380)
	put "This is a skill game that is similar to the classic game of Pong."

	locatexy (10, 360)
	put "Players must try to defend the ball from reaching their side for as long as"

	locatexy (10, 340)
	put "possible and get their opponent to miss the ball. First one to 7 points wins."

	%Fonts
	Font.Draw ("Player 1: W/S (Up/Down)", 150, 150, font2, black)
	Font.Draw ("Player 2: Up/Down", 350, 150, font2, black)
	%Button picture
	drawbox (5, 10, 95, 90, black)
	drawbox (545, 10, 635, 90, black)
	Font.Draw ("Back to Menu", 10, 45, menufont, black)
	Font.Draw ("Next Page", 560, 45, menufont, black)

	%Screenshot
	Pic.Draw (instrpic1, 100, 10, 1)

	%Button press
	if button = 1 and instructionact = 1 and menutimer > 333 and mx > 545 and mx < 635 and my > 10 and my < 90 then
	    instructionact := 2
	    menutimer := 0
	end if
	if button = 1 and instructionact = 1 and menutimer > 333 and mx > 5 and mx < 95 and my > 1 and my < 90 then
	    instructionact := 0
	    menutimer := 0
	    cls
	    menuscreen
	end if

    end if

    if instructionact = 2 then %Page 2
	cls
	%Labels
	locatexy (10, 380)
	put "Unlike in regular Pong, you can shoot bullets."

	locatexy (10, 360)
	put "These bullets can get powers, as well as stun the enemy paddle if hit."

	locatexy (10, 340)
	put "To constantly be shooting bullets in a game is the key to victory."
	%Button pictures
	drawbox (5, 10, 95, 90, black)
	drawbox (545, 10, 635, 90, black)
	%Fonts
	Font.Draw ("Back to Menu", 10, 45, menufont, black)
	Font.Draw ("Next Page", 560, 45, menufont, black)

	Font.Draw ("Player 1: 1 to shoot", 130, 130, font2, black)
	Font.Draw ("Player 2: ,(comma) to shoot", 330, 130, font2, black)

	%Screenshot
	Pic.Draw (instrpic2, 100, 10, 1)

	%Button press
	if button = 1 and instructionact = 2 and menutimer > 333 and mx > 545 and mx < 635 and my > 10 and my < 90 then
	    instructionact := 3
	    cls
	    menutimer := 0
	end if

	if button = 1 and instructionact = 2 and menutimer > 333 and mx > 5 and mx < 95 and my > 1 and my < 90 then
	    instructionact := 0
	    menutimer := 0
	    cls
	    menuscreen
	end if
    end if

    if instructionact = 3 then %PAge 3
	cls
	%Labels
	locatexy (10, 390)
	put "The player can also use a skill called Shield Blast."

	locatexy (10, 370)
	put "This skill makes a wave that repels the ball to the opposite direction.  "

	locatexy (10, 360)
	put "This skill can defend the ball and hit it to an unexpected location."

	locatexy (10, 350)
	put "However, you may only use it once per point."
	%Button pictures
	drawbox (5, 10, 95, 90, black)
	drawbox (545, 10, 635, 90, black)
	%Fonts
	Font.Draw ("Back to Menu", 10, 45, menufont, black)
	Font.Draw ("Next Page", 560, 45, menufont, black)

	Font.Draw ("Player 1: 2 to blast", 130, 130, font2, black)
	Font.Draw ("Player 2: .(period) to blast", 330, 130, font2, black)

	%Screenshot
	Pic.Draw (instrpic3, 100, 10, 1)

	%Button press
	if button = 1 and instructionact = 3 and menutimer > 333 and mx > 545 and mx < 635 and my > 10 and my < 90 then
	    instructionact := 4
	    menutimer := 0
	end if

	if button = 1 and instructionact = 3 and menutimer > 333 and mx > 5 and mx < 95 and my > 1 and my < 90 then
	    instructionact := 0
	    menutimer := 0
	    cls
	    menuscreen
	end if
    end if
    if instructionact = 4 then %Page 4
	cls
	%labels
	locatexy (10, 390)
	put "Lastly, the player can use their Ultimate skill."

	locatexy (10, 370)
	put "This skill fires a beam that destroys everything in its path."

	locatexy (10, 360)
	put "An Ultimate is so powerful, it usually gives a free point."

	locatexy (10, 350)
	put "However, you may only once per entire game."

	%Buttons picture
	drawbox (5, 10, 95, 90, black)
	drawbox (545, 10, 635, 90, black)
	%Fonts
	Font.Draw ("Back to Menu", 10, 45, menufont, black)
	Font.Draw ("Next Page", 560, 45, menufont, black)

	Font.Draw ("Player 1: 3 to beam", 130, 130, font2, white)
	Font.Draw ("Player 2: / to beam", 330, 130, font2, white)
	%Screenshot
	Pic.Draw (instrpic4, 100, 10, 1)


	%Button press
	if button = 1 and instructionact = 4 and menutimer > 333 and mx > 545 and mx < 635 and my > 10 and my < 90 then
	    instructionact := 5
	    menutimer := 0
	end if

	if button = 1 and instructionact = 4 and menutimer > 333 and mx > 5 and mx < 95 and my > 1 and my < 90 then
	    instructionact := 0
	    menutimer := 0
	    cls
	    menuscreen
	end if

    end if

    if instructionact = 5 then %Page 5
	cls
	%Labels
	locatexy (10, 390)
	put "Computers also have skills."

	locatexy (10, 370)
	put "These skills are different. So don't be surprised if a sword launches at you"

	locatexy (10, 360)
	put "or the whole screen turns black!"

	locatexy (10, 350)
	put "Everything will be explained in more detail in the User Manual Guide."
	%Button pictures
	drawbox (5, 10, 95, 90, black)
	%Fonts
	Font.Draw ("Back to Menu", 10, 45, menufont, black)
	%Screenshot
	Pic.Draw (instrpic5, 100, 10, 1)
	%Button press

	if button = 1 and instructionact = 5 and menutimer > 333 and mx > 5 and mx < 95 and my > 1 and my < 90 then
	    instructionact := 0
	    menutimer := 0
	    cls
	    menuscreen
	end if


    end if

    %Activation
    %Turtle activation
    if activate = 1 and difficulty = 1 then
	%Reset Turtle variables
	turtleintrox := 0
	introtimer := 0
	turtleintroscreenshow := true
	%Set background
	background := Pic.FileNew ("Bubble.JPG")
	%Music
	fork turtlemusic
	%Loop to activate intro
	loop
	    View.Update
	    turtleintro

	    if introtimer > 100 then

		delay (2000)
		%Start game
		activate := 2

		exit
	    end if
	end loop
    end if

    %Doppelganger activation
    if activate = 1 and difficulty = 2 then
	%Reset intro variables
	introdoppel1x := 0
	introdoppel1y := 200
	introdoppel2x := 640
	introdoppel2y := 200
	introtimer := 0
	introdoppelact := 0
	%Music
	fork doppelmusic
	%Set background
	background := Pic.FileNew ("Doppel.JPG")
	%Loop to activate intro
	loop


	    View.Update
	    doppelintro
	    if introtimer > 200 then
		delay (2000)
		%Start game
		activate := 2
		exit

	    end if


	end loop


    end if
    %Inferno activation
    if activate = 1 and difficulty = 3 then
	%Reset intro variables
	specialswordblast := 0
	waveamount := 0
	introtimer := 0
	%Set background
	background := Pic.FileNew ("Flames.JPG")
	%Music
	fork infernomusic
	%Loop to activate intro
	loop

	    View.Update
	    infernointro
	    if waveamount > 3 then
		delay (2000)
		%Start game
		activate := 2
		exit
	    end if
	end loop
    end if
    %The Ultimate Weapon activation
    if activate = 1 and difficulty = 4 then
	%Reset intro variables
	godintrodarknessx := 0
	godintroblast := 0
	introtimer := 0
	power := false
	%Set background
	background := Pic.FileNew ("Darkness4.JPG")
	%Music
	fork ultimatemusic

	%Loop to activate intro
	loop
	    View.Update

	    godintro

	    if introtimer > 200 then
		delay (2000)
		%Start the game
		activate := 2
		exit
	    end if

	end loop
    end if

    %The Game actually starts here------------------
    if activate = 2 then
	%Initializations
	%Player
	player1y := 200
	player1y2 := 250
	player1x := 0
	player1x2 := 25

	%Player 2
	player2y := 200
	player2y2 := 250
	player2x := 615
	player2x2 := 640

	%Randomize starting point
	randint (ballx, 350, 400)
	randint (bally, 50, 350)

	%Randomize Speed
	randint (xdir, -2, 2)
	randint (ydir, -2, 2)

	%Make sure xdir doesn`t glitch
	if xdir = 0 then
	    randint (xdir, 1, 2)
	end if
	%Make sure ydir doesn`t glitch
	if ydir = 0 then
	    randint (ydir, 1, 2)
	end if
	%Main Game loop
	loop
	    %Procedure calls
	    gamestart
	    items
	    keyboardcontrol

	    %Difficulty control computers
	    if difficulty = 1 then
		ezcomputer
	    end if

	    if difficulty = 2 then
		normalcomputer
	    end if

	    if difficulty = 3 then
		incomputer
	    end if

	    if difficulty = 4 then
		godcomputer
	    end if

	    %Computer movement
	    if amountofplayers = 1 then
		if player2y + distancetomiddle2 > bally then
		    player2y -= compspeed
		    player2y2 -= compspeed
		end if

		if player2y + distancetomiddle2 < bally then
		    player2y += compspeed
		    player2y2 += compspeed
		end if

	    end if

	    %When player 1 wins
	    if player1score = 7 then
		cls
		loop
		    %Timer that stops two buttons to be pressed at once
		    menutimer += 1
		    %Allow keypress
		    Input.KeyDown (chars)
		    %Allow Mouse
		    mousewhere (mx, my, button)

		    %Possible texts
		    if amountofplayers = 2 then
			locatexy (260, 370)
			put "Red Player wins!"
		    end if
		    %Easy mode text
		    if difficulty = 1 then
			locatexy (190, 370)
			put "You beat the easiest computer! NICE!!!"

			drawfillstar (280, 225, 380, 325, 186)

		    end if
		    %Normal mode text
		    if difficulty = 2 then
			locatexy (200, 370)
			put "You have defeated your evil clone!!!"


			drawfillstar (280, 225, 380, 325, 29)
		    end if
		    %Insane mode text
		    if difficulty = 3 then
			locatexy (120, 370)
			put "CONGRATULATIONS!! You are a skilled Pong player"
			locatexy (90, 350)
			put "Defeat the Ultimate Weapon for the ultimate challenge"
		    end if


		    %God mode text
		    if difficulty = 4 then
			delay (20)
			locatexy (180, 370)
			put "YOU ARE THE ULTIMATE MASTER OF PONG!!!"
			locatexy (100, 350)
			put "This is truly something to brag about to your friends!!!"
			drawfillstar (280, 225, 380, 325, yellow)

			rainbowstarcolour += 1
			if rainbowstarcolour > 255 then
			    rainbowstarcolour := 0
			end if
			drawfillstar (280, 225, 380, 325, rainbowstarcolour)

		    end if
		    %Press to return
		    locatexy (180, 200)
		    put "Press Enter or click to return to menu"
		    %Update
		    View.Update
		    %Press Enter or Click to restart
		    if chars (KEY_ENTER) or button = 1 and menutimer > 75 then
			%Reset values (mostly ultimates)
			activate := 0

			player1score := 0
			player2score := 0
			amountofplayers := 0
			vscomp := 0
			menu := 1
			beam1act := 0
			beam2act := 0

			beam1x := 26
			beam1y := 0
			beam2x := 614
			beam2y := 0
			beam2x2 := 26

			beam1timer := 0
			beam2timer := 0
			menutimer := 0

			instructionact := 0

			randint (ranctime1, 300, 800)
			randint (ranctime2, 450, 800)
			randint (godultrantime, 200, 450)


			if difficulty = 1 then
			    ezexplosionact := 0
			end if

			if difficulty = 3 then
			    inultact := 0
			end if
			if difficulty = 4 then
			    godultact := 0
			    godulttimer := 0
			end if


			difficulty := 0
			%Stop music
			Music.PlayFileStop
			%Replay menu music
			fork menumusic
			exit

		    end if
		end loop
	    end if

	    %when player 2 wins
	    if player2score = 7 then
		cls
		loop
		    %Timer that stops two buttons to be pressed at once
		    menutimer += 1

		    mousewhere (mx, my, button)
		    Input.KeyDown (chars)
		    %Different texts
		    if amountofplayers = 2 then
			locatexy (260, 370)
			put "Blue Player wins!"
		    end if
		    %Easy mode text
		    if difficulty = 1 then
			locatexy (210, 370)
			put "YOU LOST TO THE EASIEST COMPUTER!!!"
		    end if
		    %Normal mode text
		    if difficulty = 2 then
			locatexy (210, 370)
			put "You have lost to your evil clone..."
		    end if
		    %Insane mode text
		    if difficulty = 3 then
			locatexy (170, 370)
			put "And so, your paddle burns in flames..."
		    end if
		    %God mode text
		    if difficulty = 4 then
			locatexy (120, 370)
			put "Another player falls to the Almighty Ultimate Weapon..."
		    end if

		    %Press to return
		    locatexy (180, 200)
		    put "Press Enter or click to return to menu"
		    %Update
		    View.Update
		    %Press Enter or Click to restart
		    if chars (KEY_ENTER) or button = 1 and menutimer > 75 then
			%Reset values (mostly ultimates)
			activate := 0

			player1score := 0
			player2score := 0
			amountofplayers := 0
			vscomp := 0
			menu := 1
			beam1act := 0
			beam2act := 0

			beam1x := 26
			beam1y := 0
			beam2x := 614
			beam2y := 0
			beam2x2 := 26

			beam1timer := 0
			beam2timer := 0
			menutimer := 0

			instructionact := 0

			randint (ranctime1, 300, 800)
			randint (ranctime2, 450, 800)
			randint (godultrantime, 200, 450)


			if difficulty = 1 then
			    ezexplosionact := 0
			end if

			if difficulty = 3 then
			    inultact := 0
			end if
			if difficulty = 4 then
			    godultact := 0
			    godulttimer := 0
			end if



			difficulty := 0
			%Stop music
			Music.PlayFileStop
			%Replay menu music
			fork menumusic
			exit

		    end if
		end loop

	    end if

	    %Stun Timers
	    %When player 2 is stunned
	    if player2stun = true then
		%Timer for stun
		stuntimer1 += 1
		%No longer stunned
		if stuntimer1 > 29 then
		    player2stun := false
		    stuntimer1 := 0
		end if

	    end if
	    %When player 1 is stunned
	    if player1stun = true then
		%Timer for stun
		stuntimer2 += 1
		%No longer stunned
		if stuntimer2 > 29 then
		    player1stun := false
		    stuntimer2 := 0
		end if

	    end if

	    %Return to Main menu if menu = 1
	    if menu = 1 then
		cls
		menu := 0
		menuscreen
		exit
	    end if

	    %End of code
	end loop
    end if
end loop
