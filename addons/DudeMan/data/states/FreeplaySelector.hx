import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

public var sectionselected;
var Selected = 0;
var amountOfButtons = FlxG.save.data.selectorButtonsUnlocked;

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

function create() {

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

	checkAvalibilty();

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
		sectionname.text = 'StoryMode Songs';

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
		sectionname.text = 'Extras';

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
		sectionname.text = 'For my Pals';

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
		sectionname.text = 'Cover/Remixes';
	
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
		sectionname.text = "DudeMan's Games";

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