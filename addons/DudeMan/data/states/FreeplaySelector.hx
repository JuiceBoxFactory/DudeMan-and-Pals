import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.utils.DiscordUtil;
import flixel.FlxSubState;

public var sectionselected;
var Selected = 0;
var amountOfButtons = FlxG.save.data.selectorButtonsUnlocked;
var canDo = true;

var storyIconPosX;
var storyIconPosY;

var extrasIconPosX;
var extrasIconPosY;

var palsIconPosX;
var palsIconPosY;

var coversIconPosX;
var coversIconPosY;

var gamesIconPosX;
var gamesIconPosY;

var lockIconPosX;
var lockIconPosY;

var conceptIconPosX;
var conceptIconPosY;

var storymodeName = '';
var extrasName = '';
var palsName = '';
var coversName = '';
var gamesName = '';

var blurShit = new CustomShader("blur");

function create() {

	FlxG.save.data.songSelected = 0;

	DiscordUtil.changePresenceAdvanced({
		details: "IN: FreeplaySelector",
		state: "This goat in my freeplay selector <3",
		largeImageKey: "icon"
	});

	if (FlxG.save.data.selectorButtonsUnlocked == null) {
		FlxG.save.data.selectorButtonsUnlocked = 3;
	}

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	freeplaytitle = new FlxSprite(175, 10).loadGraphic(Paths.image('freeplay/name'));
	freeplaytitle.antialiasing = false;
	freeplaytitle.updateHitbox();
	add(freeplaytitle);

	freeplaysectionselectarrows = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/selectarrows'));
	freeplaysectionselectarrows.screenCenter();
	freeplaysectionselectarrows.antialiasing = false;
	freeplaysectionselectarrows.updateHitbox();
	freeplaysectionselectarrows.scale.set(1.2, 1.2);
	add(freeplaysectionselectarrows);

    sectionname = new FlxText(390, 450, 500, "you cant see this wtf", 0);
    sectionname.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    sectionname.borderColor = 0xFF06000C;
    sectionname.borderSize = 3;
    add(sectionname);

	storyIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/story'));
	storyIcon.screenCenter();
	storyIcon.scrollFactor.set(0, 0);
	storyIcon.scale.set(1.2, 1.2);
	add(storyIcon);

	extrasIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/extras'));
	extrasIcon.screenCenter();
	extrasIcon.scrollFactor.set(0, 0);
	extrasIcon.scale.set(1.2, 1.2);
	add(extrasIcon);

	palsIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/pals'));
	palsIcon.screenCenter();
	palsIcon.scrollFactor.set(0, 0);
	palsIcon.scale.set(1.2, 1.2);
	palsIcon.alpha = 0;
	add(palsIcon);

	coversIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/covers'));
	coversIcon.screenCenter();
	coversIcon.scrollFactor.set(0, 0);
	coversIcon.scale.set(1.2, 1.2);
	add(coversIcon);

	gamesIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/games'));
	gamesIcon.screenCenter();
	gamesIcon.scrollFactor.set(0, 0);
	gamesIcon.scale.set(1.2, 1.2);
	add(gamesIcon);

	lockIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/lock'));
	lockIcon.screenCenter();
	lockIcon.scrollFactor.set(0, 0);
	lockIcon.scale.set(1.2, 1.2);
	add(lockIcon);

	conceptIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/concept'));
	conceptIcon.screenCenter();
	conceptIcon.scale.set(1.2, 1.2);
	conceptIcon.alpha = 0;
	conceptIcon.scrollFactor.set(0, 0);
	add(conceptIcon);

    mailName = new FlxText(685, 640, 200, "DUDEMAIL", 0);
    mailName.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    mailName.borderColor = 0xFF06000C;
    mailName.borderSize = 2;
	mailName.scale.set(0.5, 0.5);
	mailName.antialiasing = false;
    add(mailName);

	chaliceName = new FlxText(395, 600, 200, "ACHIEVEMENTS", 0);
    chaliceName.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    chaliceName.borderColor = 0xFF06000C;
    chaliceName.borderSize = 2;
	chaliceName.scale.set(0.5, 0.5);
	chaliceName.antialiasing = false;
    add(chaliceName);

	p46Name = new FlxText(395, 640, 200, "PROJECT 46", 0);
    p46Name.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    p46Name.borderColor = 0xFF06000C;
    p46Name.borderSize = 2;
	p46Name.screenCenter(FlxAxes.X);
	p46Name.scale.set(0.5, 0.5);
	p46Name.antialiasing = false;
    add(p46Name);

	mail = new FlxSprite(705, 547);	
	mail.frames = Paths.getSparrowAtlas('freeplay/mail');
	mail.animation.addByPrefix('close', 'close', 6);
	mail.animation.addByPrefix('open', 'open', 6);
	mail.animation.play('close');
	mail.antialiasing = false;
	mail.scale.set(0.65, 0.65);
	mail.updateHitbox();
	add(mail);

	chalice = new FlxSprite(420, 550);	
	chalice.frames = Paths.getSparrowAtlas('freeplay/Chalice');
	chalice.animation.addByPrefix('unhover', 'unhover', 6);
	chalice.animation.addByPrefix('hover', 'hover', 6);
	chalice.animation.play('unhover');
	chalice.antialiasing = false;
	chalice.scale.set(0.6, 0.6);
	chalice.updateHitbox();
	add(chalice);

	door = new FlxSprite(0, 550);	
	door.frames = Paths.getSparrowAtlas('freeplay/46');
	door.animation.addByPrefix('close', 'close', 6);
	door.animation.addByPrefix('open', 'open', 6);
	door.animation.play('close');
	door.antialiasing = false;
	door.scale.set(0.6, 0.6);
	door.updateHitbox();
	door.screenCenter(FlxAxes.X);
	add(door);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    insert(99, cursor);

	checkAvalibilty();

	storymodeName = "StoryMode Songs";
	extrasName = "Extras";
	palsName = "For my Pals";
	coversName = "Covers//Remixes";
	gamesName = "DudeMan's Games";

//	if (FlxG.save.data.language == "spanish") {
//		storymodeName = "Canciones del Modo-Historia";
//		extrasName = "Extras";
//		palsName = "Para mis Amigos";
//		coversName = "Covers//Remezclas";
//		gamesName = "Juegos De DudeMan";
//	}

}

function checkAvalibilty() {
	if (amountOfButtons == 3) {
		lockIcon.alpha = 1;
	}
	if (amountOfButtons == 4) {
		lockIcon.alpha = 0;
	}
}

function update() {	

    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

	if (canDo == true) {

		FlxG.sound.music.volume = 1;

		if (FlxG.mouse.overlaps(mail)) {
			mail.animation.play("open");
			if (FlxG.mouse.justPressed) {
				FlxG.switchState(new ModState("DudeMail"));
			}
			if (mailName.y > 525) {
				mailName.y -= 10;
			}
			if (mailName.scale.x < 1) {
				mailName.scale.x += 0.1;
				mailName.scale.y += 0.1;
			}
		}
		else {
			mail.animation.play("close");
			if (mailName.y < 640) {
				mailName.y += 10;
			}
			if (mailName.scale.x > 0.5) {
				mailName.scale.x -= 0.1;
				mailName.scale.y -= 0.1;
			}
		}
	
		if (FlxG.mouse.overlaps(chalice)) {
			chalice.animation.play("hover");
			if (FlxG.mouse.justPressed) {
				openSubState(new ModSubState("AchievementsSubstate"));
				FlxG.camera.addShader(blurShit);
				cursor.alpha = 0;
				canDo = false;
			}
			if (chaliceName.y > 525) {
				chaliceName.y -= 10;
			}
			if (chaliceName.scale.x < 1) {
				chaliceName.scale.x += 0.1;
				chaliceName.scale.y += 0.1;
			}
		}
		else {
			chalice.animation.play("unhover");
			if (chaliceName.y < 600) {
				chaliceName.y += 10;
			}
			if (chaliceName.scale.x > 0.5) {
				chaliceName.scale.x -= 0.1;
				chaliceName.scale.y -= 0.1;
			}
		}
	
		if (FlxG.mouse.overlaps(door)) {
			door.animation.play("open");
			if (FlxG.mouse.justPressed) {
			}
			if (p46Name.y > 525) {
				p46Name.y -= 10;
			}
			if (p46Name.scale.x < 1) {
				p46Name.scale.x += 0.1;
				p46Name.scale.y += 0.1;
			}
		}
		else {
			door.animation.play("close");
			if (p46Name.y < 640) {
				p46Name.y += 10;
			}
			if (p46Name.scale.x > 0.5) {
				p46Name.scale.x -= 0.1;
				p46Name.scale.y -= 0.1;
			}
		}
	
		if (FlxG.keys.justPressed.SIX) {
			amountOfButtons = 4;
			FlxG.save.data.selectorButtonsUnlocked = 4;
			checkAvalibilty();
		}
	
		if (FlxG.keys.justPressed.EIGHT) {
			amountOfButtons = 3;
			FlxG.save.data.selectorButtonsUnlocked = 3;
			checkAvalibilty();
		}
	
		if (controls.LEFT_P) {
			FlxG.sound.play(Paths.sound('menu/scroll'));
			Selected -= 1;
		}
		if (controls.RIGHT_P) {
			FlxG.sound.play(Paths.sound('menu/scroll'));
			Selected += 1;
		}

		if (Selected == 0) {
			sectionname.text = storymodeName;
	
			remove(storyIcon);
			remove(extrasIcon);
			remove(coversIcon);
			remove(gamesIcon);
			remove(lockIcon);
			insert(5,storyIcon);
			insert(4,extrasIcon);
			insert(4,lockIcon);
			insert(4,gamesIcon);
			insert(3,coversIcon);

			storyIconPosX = 592;
			storyIconPosY = 325;
			
			extrasIconPosX = 648;
			extrasIconPosY = 305;

			coversIconPosX = 592;
			coversIconPosY = 285;

			gamesIconPosX = 530;
			gamesIconPosY = 305;

			lockIconPosX = 530;
			lockIconPosY = 305;
	
			if (storyIcon.alpha != 1) {
				storyIcon.alpha += 0.1;
			}
		}
		else {
	
			if (storyIcon.alpha > 0.6) {
				storyIcon.alpha -= 0.1;
			}
	
		}

		if (Selected == 1) {
			sectionname.text = extrasName;
	
			remove(extrasIcon);
			remove(coversIcon);
			remove(lockIcon);
			remove(gamesIcon);
			remove(storyIcon);
			insert(5,extrasIcon);
			insert(4,coversIcon);
			insert(3,lockIcon);
			insert(3,gamesIcon);
			insert(4,storyIcon);

			extrasIconPosX = 592;
			extrasIconPosY = 325;
			
			coversIconPosX = 648;
			coversIconPosY = 305;

			gamesIconPosX = 592;
			gamesIconPosY = 285;

			lockIconPosX = 592;
			lockIconPosY = 285;

			storyIconPosX = 530;
			storyIconPosY = 305;
	
			if (extrasIcon.alpha != 1) {
				extrasIcon.alpha += 0.1;
			}
		}
		else {
	
			if (extrasIcon.alpha > 0.6) {
				extrasIcon.alpha -= 0.1;
			}
	
		}

		if (Selected == 2) {
			sectionname.text = coversName;
	
			remove(extrasIcon);
			remove(coversIcon);
			remove(lockIcon);
			remove(gamesIcon);
			remove(storyIcon);
			insert(4,extrasIcon);
			insert(5,coversIcon);
			insert(4,lockIcon);
			insert(4,gamesIcon);
			insert(3,storyIcon);

			extrasIconPosX = 530;
			extrasIconPosY = 305;
			
			coversIconPosX = 592;
			coversIconPosY = 325;

			gamesIconPosX = 648;
			gamesIconPosY = 305;

			lockIconPosX = 648;
			lockIconPosY = 305;

			storyIconPosX = 592;
			storyIconPosY = 285;
	
			if (coversIcon.alpha != 1) {
				coversIcon.alpha += 0.1;
			}
		}
		else {
	
			if (coversIcon.alpha > 0.6) {
				coversIcon.alpha -= 0.1;
			}
	
		}

		if (Selected == 3) {
			if (amountOfButtons == 4) {
				sectionname.text = gamesName;
			}
			else {
				sectionname.text = "[LOCKED]";
			}
			
			remove(extrasIcon);
			remove(coversIcon);
			remove(lockIcon);
			remove(gamesIcon);
			remove(storyIcon);
			insert(3,extrasIcon);
			insert(4,coversIcon);
			insert(5,lockIcon);
			insert(5,gamesIcon);
			insert(4,storyIcon);

			extrasIconPosX = 592;
			extrasIconPosY = 285;
			
			coversIconPosX = 530;
			coversIconPosY = 305;

			gamesIconPosX = 592;
			gamesIconPosY = 325;

			lockIconPosX = 592;
			lockIconPosY = 325;

			storyIconPosX = 648;
			storyIconPosY = 305;
	
			if (amountOfButtons == 4) {
				if (gamesIcon.alpha != 1) {
					gamesIcon.alpha += 0.1;
				}
				lockIcon.alpha = 0;
			}
			else {
				if (gamesIcon.alpha != 0.8) {
					gamesIcon.alpha += 0.1;
				}
				if (lockIcon.alpha != 1) {
					lockIcon.alpha += 0.1;
				}
			}
		}
		else {
	
			if (amountOfButtons == 4) {
				if (gamesIcon.alpha > 0.6) {
					gamesIcon.alpha -= 0.1;
				}
				lockIcon.alpha = 0;
			}
			else {
				if (lockIcon.alpha > 0.8) {
					lockIcon.alpha -= 0.1;
				}
				if (gamesIcon.alpha > 0.6) {
					gamesIcon.alpha -= 0.1;
				}
			}
	
		}

		if (storyIcon.x > storyIconPosX) {
			storyIcon.x -= 3;
		}
		if (storyIcon.x < storyIconPosX) {
			storyIcon.x += 3;
		}

		if (storyIcon.y > storyIconPosY) {
			storyIcon.y -= 3;
		}
		if (storyIcon.y < storyIconPosY) {
			storyIcon.y += 3;
		}

		if (extrasIcon.x > extrasIconPosX) {
			extrasIcon.x -= 3;
		}
		if (extrasIcon.x < extrasIconPosX) {
			extrasIcon.x += 3;
		}

		if (extrasIcon.y > extrasIconPosY) {
			extrasIcon.y -= 3;
		}
		if (extrasIcon.y < extrasIconPosY) {
			extrasIcon.y += 3;
		}

		if (coversIcon.x > coversIconPosX) {
			coversIcon.x -= 3;
		}
		if (coversIcon.x < coversIconPosX) {
			coversIcon.x += 3;
		}

		if (coversIcon.y > coversIconPosY) {
			coversIcon.y -= 3;
		}
		if (coversIcon.y < coversIconPosY) {
			coversIcon.y += 3;
		}

		if (gamesIcon.x > gamesIconPosX) {
			gamesIcon.x -= 3;
		}
		if (gamesIcon.x < gamesIconPosX) {
			gamesIcon.x += 3;
		}

		if (gamesIcon.y > gamesIconPosY) {
			gamesIcon.y -= 3;
		}
		if (gamesIcon.y < gamesIconPosY) {
			gamesIcon.y += 3;
		}

		if (lockIcon.x > lockIconPosX) {
			lockIcon.x -= 3;
		}
		if (lockIcon.x < lockIconPosX) {
			lockIcon.x += 3;
		}

		if (lockIcon.y > lockIconPosY) {
			lockIcon.y -= 3;
		}
		if (lockIcon.y < lockIconPosY) {
			lockIcon.y += 3;
		}


		if (controls.ACCEPT && Selected < 3) {
			FlxG.save.data.sectionselected = Selected;
			FlxG.switchState(new FreeplayState());
		}
		if (controls.ACCEPT && Selected == 3 && amountOfButtons == 4) {
	//		FlxG.switchState(new ModState("GAMES/datingSimTitle"));
	//		FlxG.switchState(new ModState("GAMES/clicker"));
			FlxG.switchState(new ModState("GameSelector"));
		}
		if (controls.ACCEPT && Selected == 3 && amountOfButtons == 3) {
			FlxG.sound.play(Paths.sound("VolMAX"));
			FlxG.camera.shake(0.005, .1);
		}

		if (FlxG.keys.justPressed.SEVEN) {
			FlxG.save.data.sectionselected = 4;
			FlxG.switchState(new FreeplayState());
		}
		if (Selected > amountOfButtons) {
			Selected = 0;
		}
		if (Selected < 0) {
			Selected = amountOfButtons;
		}
		if (controls.BACK) {
		FlxG.sound.play(Paths.sound('cancel'));
		FlxG.switchState(new MainMenuState());
		}
	}

	if (canDo == false) {

		FlxG.sound.music.volume = 0.25;

		if (controls.BACK) {
			canDo = true;
			cursor.alpha = 1;
			FlxG.camera.removeShader(blurShit);
		}
	}

}