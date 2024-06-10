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

	conceptIcon = new FlxSprite(0, 325).loadGraphic(Paths.image('freeplay/selection/concept'));
	conceptIcon.screenCenter();
	conceptIcon.scale.set(1.2, 1.2);
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

	if (FlxG.save.data.language == "english") {
		storymodeName = "StoryMode Songs";
		extrasName = "Extras";
		palsName = "For my Pals";
		coversName = "Covers//Remixes";
		gamesName = "DudeMan's Games";
	}
	if (FlxG.save.data.language == "spanish") {
		storymodeName = "Canciones del Modo-Historia";
		extrasName = "Extras";
		palsName = "Para mis Amigos";
		coversName = "Covers//Remezclas";
		gamesName = "Juegos De DudeMan";
	}

}

function checkAvalibilty() {
	if (amountOfButtons == 3) {
		gamesIcon.alpha = 0;
		conceptIcon.alpha = 0;	
	}
	if (amountOfButtons == 4) {
		gamesIcon.alpha = 1;
		conceptIcon.alpha = 0;
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
			checkAvalibilty();
		}
	
		if (FlxG.keys.justPressed.NINE) {
			amountOfButtons = FlxG.save.data.selectorButtonsUnlocked;
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
	
			if (amountOfButtons == 3) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				insert(5,storyIcon);
				insert(4,extrasIcon);
				insert(4,coversIcon);
				insert(3,palsIcon);
	
				storyIconPosX = 592;
				storyIconPosY = 325;
				extrasIconPosX = 648;
				extrasIconPosY = 305;
				palsIconPosX = 592;
				palsIconPosY = 285;
				coversIconPosX = 530;
				coversIconPosY = 305;
			}
	
			if (amountOfButtons == 4 || amountOfButtons == 5) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				remove(gamesIcon);
				insert(5,storyIcon);
				insert(4,extrasIcon);
				insert(4,gamesIcon);
				insert(3,coversIcon);
				insert(3,palsIcon);
	
				storyIconPosX = 592;
				storyIconPosY = 325;
				extrasIconPosX = 648;
				extrasIconPosY = 305;
				palsIconPosX = 622;
				palsIconPosY = 285;
				coversIconPosX = 562;
				coversIconPosY = 285;
				gamesIconPosX = 530;
				gamesIconPosY = 305;
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
	
			if (storyIcon.alpha != 1) {
				storyIcon.alpha += 0.1;
			}
		}
		else {
	
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
	
			if (storyIcon.alpha > 0.6) {
				storyIcon.alpha -= 0.1;
			}
	
		}
	
		if (Selected == 1) {
			sectionname.text = extrasName;
	
			if (amountOfButtons == 3) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				insert(5,extrasIcon);
				insert(4,storyIcon);
				insert(4,palsIcon);
				insert(3,coversIcon);
	
				storyIconPosX = 530;
				storyIconPosY = 305;
				extrasIconPosX = 592;
				extrasIconPosY = 325;
				palsIconPosX = 648;
				palsIconPosY = 305;
				coversIconPosX = 592;
				coversIconPosY = 285;
			}
	
			if (amountOfButtons == 4 || amountOfButtons == 5) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				remove(gamesIcon);
				insert(5,extrasIcon);
				insert(4,storyIcon);
				insert(4,palsIcon);
				insert(3,gamesIcon);
				insert(3,coversIcon);
	
				storyIconPosX = 530;
				storyIconPosY = 305;
				extrasIconPosX = 592;
				extrasIconPosY = 325;
				palsIconPosX = 648;
				palsIconPosY = 305;
				coversIconPosX = 622;
				coversIconPosY = 285;
				gamesIconPosX = 562;
				gamesIconPosY = 285;
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
	
			if (extrasIcon.alpha != 1) {
				extrasIcon.alpha += 0.1;
			}
	
		}
		else {
	
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
	
			if (extrasIcon.alpha > 0.6) {
				extrasIcon.alpha -= 0.1;
			}
	
		}
	
		if (Selected == 2) {
			sectionname.text = palsName;
	
			if (amountOfButtons == 3) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				insert(5,palsIcon);
				insert(4,extrasIcon);
				insert(4,coversIcon);
				insert(3,storyIcon);
	
				storyIconPosX = 592;
				storyIconPosY = 285;
				extrasIconPosX = 530;
				extrasIconPosY = 305;
				palsIconPosX = 592;
				palsIconPosY = 325;
				coversIconPosX = 648;
				coversIconPosY = 305;
			}
	
			if (amountOfButtons == 4 || amountOfButtons == 5) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				remove(gamesIcon);
				insert(5,palsIcon);
				insert(4,extrasIcon);
				insert(4,coversIcon);
				insert(3,storyIcon);
				insert(3,gamesIcon);
	
	
				storyIconPosX = 562;
				storyIconPosY = 285;
				extrasIconPosX = 530;
				extrasIconPosY = 305;
				palsIconPosX = 592;
				palsIconPosY = 325;
				coversIconPosX = 648;
				coversIconPosY = 305;
				gamesIconPosX = 622;
				gamesIconPosY = 285;
			}	
	
			if (palsIcon.x > palsIconPosX) {
				palsIcon.x -= 3;
			}
			if (palsIcon.x < palsIconPosX) {
				palsIcon.x += 3;
			}
	
			if (palsIcon.y > palsIconPosY) {
				palsIcon.y -= 3;
			}
			if (palsIcon.y < palsIconPosY) {
				palsIcon.y += 3;
			}
	
			if (palsIcon.alpha != 1) {
				palsIcon.alpha += 0.1;
			}
		}
		else {
	
			if (palsIcon.x > palsIconPosX) {
				palsIcon.x -= 3;
			}
			if (palsIcon.x < palsIconPosX) {
				palsIcon.x += 3;
			}
	
			if (palsIcon.y > palsIconPosY) {
				palsIcon.y -= 3;
			}
			if (palsIcon.y < palsIconPosY) {
				palsIcon.y += 3;
			}
	
			if (palsIcon.alpha > 0.6) {
				palsIcon.alpha -= 0.1;
			}
	
		}
	
		if (Selected == 3) {
			sectionname.text = coversName;
		
			if (amountOfButtons == 3) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				insert(5,coversIcon);
				insert(4,storyIcon);
				insert(4,palsIcon);
				insert(3,extrasIcon);
	
				storyIconPosX = 648;
				storyIconPosY = 305;
				extrasIconPosX = 592;
				extrasIconPosY = 285;
				palsIconPosX = 530;
				palsIconPosY = 305;
				coversIconPosX = 592;
				coversIconPosY = 325;
	
			}
	
			if (amountOfButtons == 4 || amountOfButtons == 5) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				remove(gamesIcon);
				insert(5,coversIcon);
				insert(4,palsIcon);
				insert(4,gamesIcon);
				insert(3,extrasIcon);
				insert(3,storyIcon);
	
				storyIconPosX = 622;
				storyIconPosY = 285;
				extrasIconPosX = 562;
				extrasIconPosY = 285;
				palsIconPosX = 530;
				palsIconPosY = 305;
				coversIconPosX = 592;
				coversIconPosY = 325;
				gamesIconPosX = 648;
				gamesIconPosY = 305;
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
	
			if (coversIcon.alpha != 1) {
				coversIcon.alpha += 0.1;
			}
		}
		else {
	
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
	
			if (coversIcon.alpha > 0.6) {
				coversIcon.alpha -= 0.1;
			}
	
		}
	
		if (Selected == 4 && amountOfButtons > 3) {
			sectionname.text = gamesName;
	
			if (amountOfButtons == 4 || amountOfButtons == 5) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				remove(gamesIcon);
				insert(5,gamesIcon);
				insert(4,coversIcon);
				insert(4,storyIcon);
				insert(3,palsIcon);
				insert(3,extrasIcon);
	
	
				storyIconPosX = 648;
				storyIconPosY = 305;
				extrasIconPosX = 622;
				extrasIconPosY = 285;
				palsIconPosX = 562;
				palsIconPosY = 285;
				coversIconPosX = 530;
				coversIconPosY = 305;
				gamesIconPosX = 592;
				gamesIconPosY = 325;
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
	
			if (gamesIcon.alpha != 1) {
				gamesIcon.alpha += 0.1;
			}
	
		}
		else {
	
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
			
			if (gamesIcon.alpha > 0.6) {
				gamesIcon.alpha -= 0.1;
			}
	
		}
		if (Selected == 5 && amountOfButtons > 4) {
			FlxG.sound.pause();
	
			if (amountOfButtons == 5) {
				remove(storyIcon);
				remove(extrasIcon);
				remove(coversIcon);
				remove(palsIcon);
				remove(gamesIcon);
				insert(4,gamesIcon);
				insert(4,storyIcon);
				insert(3,coversIcon);
				insert(3,palsIcon);
				insert(3,extrasIcon);
	
	
				storyIconPosX = 648;
				storyIconPosY = 305;
				extrasIconPosX = 622;
				extrasIconPosY = 285;
				palsIconPosX = 592;
				palsIconPosY = 285;
				coversIconPosX = 562;
				coversIconPosY = 285;
				gamesIconPosX = 530;
				gamesIconPosY = 305;
				conceptIconPosX = 592;
				conceptIconPosY = 325;
			}
	
			sectionname.text = 'Project 46';
	
			if (conceptIcon.x > conceptIconPosX) {
				conceptIcon.x -= 3;
			}
			if (conceptIcon.x < conceptIconPosX) {
				conceptIcon.x += 3;
			}
	
			if (conceptIcon.y > conceptIconPosY) {
				conceptIcon.y -= 3;
			}
			if (conceptIcon.y < conceptIconPosY) {
				conceptIcon.y += 3;
			}
	
			if (conceptIcon.alpha != 1) {
				conceptIcon.alpha += 0.1;
			}
	
		}
		else {
	
			FlxG.sound.resume();
	
			if (conceptIcon.x > conceptIconPosX) {
				conceptIcon.x -= 3;
			}
			if (conceptIcon.x < conceptIconPosX) {
				conceptIcon.x += 3;
			}
	
			if (conceptIcon.y > conceptIconPosY) {
				conceptIcon.y -= 3;
			}
			if (conceptIcon.y < conceptIconPosY) {
				conceptIcon.y += 3;
			}
			
			if (conceptIcon.alpha > 0) {
				conceptIcon.alpha -= 0.1;
			}
	
		}
		if (controls.ACCEPT && Selected < 4) {
			FlxG.save.data.sectionselected = Selected;
			FlxG.switchState(new FreeplayState());
		}
		if (controls.ACCEPT && Selected == 4) {
	//		FlxG.switchState(new ModState("GAMES/datingSimTitle"));
	//		FlxG.switchState(new ModState("GAMES/clicker"));
			FlxG.switchState(new ModState("GameSelector"));
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