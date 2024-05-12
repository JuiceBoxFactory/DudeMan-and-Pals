import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

var progToBe = 0;
var icon1_baseX = 384.590909090909;
var iconToBe = icon1_baseX;
var hudScale = 1.5;
var energy = 0;
var note;
var curDoor = 0;
var canProgress = true;

function create() {

    progheader = new FlxSprite(0, 670).loadGraphic(Paths.image('fuckingMechanicUi/roomed/doorBar'));
    progheader.antialiasing = false;
    progheader.cameras = [camHUD];
    progheader.screenCenter(FlxAxes.X);
    progheader.scale.set(hudScale, hudScale);
    insert(2, progheader);

    energyheader = new FlxSprite(1185, 250).loadGraphic(Paths.image('fuckingMechanicUi/roomed/energyMeter'));
    energyheader.antialiasing = false;
    energyheader.cameras = [camHUD];
    energyheader.scale.set(hudScale, hudScale);
    insert(3, energyheader);

    icon2 = new FlxSprite(progheader.getGraphicMidpoint().x - (-100 / 1.8) + (progheader.width / 2), 650).loadGraphic(Paths.image('fuckingMechanicUi/roomed/doorIcon'));
    icon2.antialiasing = false;
    icon2.cameras = [camHUD];
    icon2.scale.set(hudScale, hudScale);
    insert(4, icon2);

    icon1 = new FlxSprite(progheader.getGraphicMidpoint().x - (200 / 2.2) - (progheader.width / 2), 635).loadGraphic(Paths.image('fuckingMechanicUi/roomed/daxIcon'));
    icon1.antialiasing = false;
    icon1.cameras = [camHUD];
    icon1.scale.set(hudScale, hudScale);
    insert(5, icon1);

    progBar = new FlxBar(progheader.x - 80, progheader.y, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(progheader.width * 1.45), Std.int(progheader.height * 1.25));
    progBar.scrollFactor.set();
    progBar.createFilledBar(0xFFB45B21,0xFFFFEB80);
    progBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    progBar.alpha = 1;
    progBar.cameras = [camHUD];
    insert(1, progBar);

    energyBar = new FlxBar(980, 440, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(energyheader.width * 6.7), Std.int(energyheader.height * 0.1));
    energyBar.scrollFactor.set();
    energyBar.createFilledBar(0xFFB45B21,0xFFFFEB80);
    energyBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    energyBar.alpha = 1;
    energyBar.angle = 270;
    energyBar.cameras = [camHUD];
    insert(1, energyBar);

    doorCount = new FlxText(100, 600);
    doorCount.setFormat(Paths.font("Bahnschrift.ttf"), 20, 0xFF2E2600, "center");
    doorCount.screenCenter(FlxAxes.X);
    doorCount.cameras = [camHUD];
    add(doorCount);

    if (FlxG.save.data.downscroll) {
        icon2.y -= 10;
        energyBar.y -= 100;
        progBar.y -= 32.5;
        progheader.y -= 30;
        energyheader.y -= 50;
    }

}

function onPlayerHit(noteHit) {

	note = noteHit.note;

    if (canProgress == true) {
        if (note.isSustainNote) {
            energy += 0.5;
        }
        else {
            energy += 1;
        }
    }
}

function onPlayerMiss(noteHit) {

	note = noteHit.note;

    if (canProgress == true) {
        if (note.isSustainNote) {
            energy -= 1;
        }
        else {
            energy -= 2;
        }
    }
}

function onUseEnergy() {
    energy = 0;
    progToBe += 5;
    iconToBe = iconToBe + 22.5;
    curDoor += 50;
}

function update(elapsed) {
    
    for (mechanicAssets in [progBar, icon1, icon2, doorCount, energyheader, progheader, energyBar]) {
        if (canProgress == false) {
            FlxTween.tween(mechanicAssets, {y: mechanicAssets.y + 1000}, 3, {ease: FlxEase.quartIn});
        }
    }

    if (FlxG.keys.justPressed.G) {
        curDoor = 1000;
    }

    progBar.setRange(0, Math.max(1, 999));

    energyBar.percent = energy * 2;

    doorCount.text = "DOOR: A-"+curDoor;

    if (energy >= 50) {
        onUseEnergy();
    }

    if (curDoor > 999) {
        curDoor = 999;
        canProgress = false;
    }

    if (progBar.percent < progToBe) {
        progBar.percent += 0.5;
    }

    if (icon1.x < iconToBe) {
        icon1.x += 2.5;
    }

    if (icon1.x > icon1_baseX + 22.5 * 20) {
        icon1.x = icon1_baseX + 22.5 * 20;
    }

//    icon1.x = icon1.x + progBar.percent / 25;

//    if (icon1.x > icon1.x + 100 / 25) {
//        icon1.x = 100 / 25;
//    }

}