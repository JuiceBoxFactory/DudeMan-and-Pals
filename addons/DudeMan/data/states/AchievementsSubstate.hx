// this took me AWHILE to figure out, so comment at the top hi im Melty Melanie Kelpy I CODED THIS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxOutlineEffect;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import funkin.backend.utils.DiscordUtil;

var canDo = false;
var page = 0;
var achievementsGot = 0;
var achievementsOnPage = 0;
var sectionOfBook = "Cover Page";
var selectedSticker = 0;
var angled = 0;

function create() {

    selectedSticker = null;

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

	DiscordUtil.changePresenceAdvanced({
		details: "IN: Achievements",
		state: "This goat looking at their Achievements",
		largeImageKey: "icon"
	});

    darkness = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    darkness.scrollFactor.set(0, 0);
    darkness.alpha = 0;
    add(darkness);

	book = new FlxSprite(0, 850).loadGraphic(Paths.image('achievements/stickerBook'));
	book.antialiasing = false;
	book.updateHitbox();
    book.cameras = [awesomeCam];
    book.screenCenter(FlxAxes.X);
	add(book);

	arrows = new FlxSprite(850, 1000);
    arrows.frames = Paths.getSparrowAtlas('achievements/arrows');
	arrows.animation.addByPrefix('up', 'up', 24, false);
	arrows.animation.addByPrefix('down', 'down', 24, false);
    arrows.animation.addByPrefix('default', 'default', 24, false);
	arrows.animation.play('default');
	arrows.antialiasing = false;
	arrows.updateHitbox();
    arrows.cameras = [awesomeCam];
	add(arrows);

	achievementName = new FlxText(0, 1410, 500);
    achievementName.screenCenter(FlxAxes.X);
	achievementName.setFormat(Paths.font("Bahnschrift.ttf"), 28, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    achievementName.text = "U GOTTA OPEN THE BOOK";
	achievementName.cameras = [awesomeCam];
	achievementName.color = 0xFFFFFFFF;
	achievementName.borderColor = 0xFF000000;
	achievementName.antialiasing = false;
	achievementName.borderSize = 2.25;
	add(achievementName);

    achievementDesc = new FlxText(0, 1450, 500);
    achievementDesc.screenCenter(FlxAxes.X);
	achievementDesc.setFormat(Paths.font("Bahnschrift.ttf"), 18, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    achievementDesc.text = "PLS";
	achievementDesc.cameras = [awesomeCam];
	achievementDesc.color = 0xFFFFFFFF;
	achievementDesc.borderColor = 0xFF000000;
	achievementDesc.antialiasing = false;
	achievementDesc.borderSize = 2.25;
	add(achievementDesc);

    achievements = new FlxText(120, 1225, 500);
	achievements.setFormat(Paths.font("Bahnschrift.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    achievements.text = sectionOfBook+"\n"+achievementsGot+"/"+achievementsOnPage;
	achievements.cameras = [awesomeCam];
	achievements.color = 0xFFFFFFFF;
	achievements.borderColor = 0xFF000000;
	achievements.antialiasing = false;
	achievements.borderSize = 2.25;
	add(achievements);

    addStickers();

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [awesomeCam];
    add(cursor);

    closeOpen("open");

}

function addStickers() {

	ach1STICKER = new FlxSprite(575, 175).loadGraphic(Paths.image('achievements/stickers/0'));
	ach1STICKER.antialiasing = false;
	ach1STICKER.updateHitbox();
    ach1STICKER.cameras = [awesomeCam];
	add(ach1STICKER);
    
	ach2STICKER = new FlxSprite(685, 200).loadGraphic(Paths.image('achievements/stickers/1'));
	ach2STICKER.antialiasing = false;
	ach2STICKER.updateHitbox();
    ach2STICKER.cameras = [awesomeCam];
	add(ach2STICKER);

    ach3STICKER = new FlxSprite(495, 220).loadGraphic(Paths.image('achievements/stickers/2'));
	ach3STICKER.antialiasing = false;
	ach3STICKER.updateHitbox();
    ach3STICKER.cameras = [awesomeCam];
	add(ach3STICKER);

    ach4STICKER = new FlxSprite(605, 280).loadGraphic(Paths.image('achievements/stickers/3'));
	ach4STICKER.antialiasing = false;
	ach4STICKER.updateHitbox();
    ach4STICKER.cameras = [awesomeCam];
	add(ach4STICKER);

}

function checkPages() {

    achievements.text = sectionOfBook+"\n"+achievementsGot+"/"+achievementsOnPage;
        
    if (selectedSticker != 0) {
        ach1STICKER.scale.set(1, 1);
        ach1STICKER.angle = 0;
    }   
    if (selectedSticker != 1) {
        ach2STICKER.scale.set(1, 1);
        ach2STICKER.angle = 0;
    }
    if (selectedSticker != 2) {
        ach3STICKER.scale.set(1, 1);
        ach3STICKER.angle = 0;
    }
    if (selectedSticker != 3) {
        ach4STICKER.scale.set(1, 1);
        ach4STICKER.angle = 0;
    }

    ach1STICKER.alpha = 0;
    ach2STICKER.alpha = 0;
    ach3STICKER.alpha = 0;
    ach4STICKER.alpha = 0;

    if (page < 0) {
        page = 0;
    }

    if (page == 0) {
        achievementsGot = 0;
        achievementsOnPage = 0;
        selectedSticker = null;
        sectionOfBook = "Cover Page";
        achievementName.text = "U GOTTA OPEN THE BOOK";
        achievementDesc.text = "PLS";
    }
    else {
        achievementName.text = "NO ACHIEVEMENT SELECTED";
        achievementDesc.text = "NO ACHIEVEMENT SELECTED";
    }
    if (page == 1) {
        achievementsGot = 0;
        achievementsOnPage = 4;
        sectionOfBook = "Weeks";
        ach1STICKER.alpha = 1;
        ach2STICKER.alpha = 1;
        ach3STICKER.alpha = 1;
        ach4STICKER.alpha = 1;
    }
    if (page == 2) {
        achievementsGot = 0;
        achievementsOnPage = 0;
        sectionOfBook = "Extras";
    }

    if (FlxG.mouse.overlaps(ach1STICKER) && ach1STICKER.alpha == 1) {
        if (FlxG.mouse.justPressed) {
            angled = FlxG.random.int(-10, 10);
            trace(angled);
            selectedSticker = 0;
        }
    }
    if (FlxG.mouse.overlaps(ach2STICKER) && ach2STICKER.alpha == 1) {
        if (FlxG.mouse.justPressed) {
            angled = FlxG.random.int(-10, 10);
            trace(angled);
            selectedSticker = 1;
        }
    }
    if (FlxG.mouse.overlaps(ach3STICKER) && ach3STICKER.alpha == 1) {
        if (FlxG.mouse.justPressed) {
            angled = FlxG.random.int(-10, 10);
            trace(angled);
            selectedSticker = 2;
        }
    }
    if (FlxG.mouse.overlaps(ach4STICKER) && ach4STICKER.alpha == 1) {
        if (FlxG.mouse.justPressed) {
            angled = FlxG.random.int(-10, 10);
            trace(angled);
            selectedSticker = 3;
        }
    }

    if (selectedSticker == 0) {
        if (ach1STICKER.scale.x < 1.2) {
            ach1STICKER.scale.x += 0.05;
            ach1STICKER.scale.y += 0.05;
        }
        ach1STICKER.angle = angled;

        achievementName.text = "DUDED YOUR MAN";
        achievementDesc.text = "Beat the DudeMan Week";
    }

    if (selectedSticker == 1) {
        if (ach2STICKER.scale.x < 1.2) {
            ach2STICKER.scale.x += 0.05;
            ach2STICKER.scale.y += 0.05;
        }
        ach2STICKER.angle = angled;
        
        achievementName.text = "FRIENDSHIP IS MAGIC";
        achievementDesc.text = "Beat the Fruity Week";
    }

    if (selectedSticker == 2) {
        if (ach3STICKER.scale.x < 1.2) {
            ach3STICKER.scale.x += 0.05;
            ach3STICKER.scale.y += 0.05;
        }
        ach3STICKER.angle = angled;

        achievementName.text = "LOOSELEAF";
        achievementDesc.text = "Beat the Zee Week";
    }

    if (selectedSticker == 3) {
        if (ach4STICKER.scale.x < 1.2) {
            ach4STICKER.scale.x += 0.05;
            ach4STICKER.scale.y += 0.05;
        }
        ach4STICKER.angle = angled;

        achievementName.text = "GUTIAR-HERO";
        achievementDesc.text = "Beat the Kathy Week";
    }

}

function closeOpen(type) {

    switch (type) {

        case "open":
            FlxTween.tween(book, {y: 125}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(arrows, {y: 275}, 2.75, {ease:FlxEase.quartOut});
            FlxTween.tween(achievementName, {y: 610}, 2.25, {ease:FlxEase.quartOut});
            FlxTween.tween(achievementDesc, {y: 650}, 2.25, {ease:FlxEase.quartOut});
            FlxTween.tween(achievements, {y: 325}, 2.5, {ease:FlxEase.quartOut});
            FlxTween.tween(darkness, {alpha: 0.7}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(achievements, {y: 325}, 2.5, {ease:FlxEase.quartOut});
            new FlxTimer().start(2, function(timer) {
                canDo = true;
            });

        case "close":
            FlxG.sound.play(Paths.sound("pageTurn"));
            page = 0;
            FlxTween.tween(book, {y: 850}, 2, {ease:FlxEase.quartIn});
            FlxTween.tween(arrows, {y: 1000}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(achievementName, {y: 1410}, 2.25, {ease:FlxEase.quartOut});
            FlxTween.tween(achievementDesc, {y: 1450}, 2.25, {ease:FlxEase.quartOut});
            FlxTween.tween(achievements, {y: 1225}, 2.5, {ease:FlxEase.quartOut});
            FlxTween.tween(darkness, {alpha: 0}, 2, {ease:FlxEase.quartOut});
            new FlxTimer().start(2, function(timer) {
                close();
            });

    }

}

function update() {

    checkPages();

    if (page == 0) {
        book.loadGraphic(Paths.image('achievements/stickerBookCover'));
    }
    else {
        book.loadGraphic(Paths.image('achievements/stickerBook'));
    }

    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

    if (controls.UP_P && canDo == true) {
        page -= 1;
        arrows.animation.play('up');
        FlxG.sound.play(Paths.sound("pageTurn"));
    }
    if (controls.DOWN_P && canDo == true) {
        page += 1;
        arrows.animation.play('down');
        FlxG.sound.play(Paths.sound("pageTurn"), 1);
    }

    if (controls.BACK) {
        closeOpen("close");
    }

}