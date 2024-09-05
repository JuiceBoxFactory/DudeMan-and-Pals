import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.math.FlxRect;
import flixel.util.FlxSpriteUtil;

function create() {

    persistentUpdate = true;

    clipCAM = new FlxCamera(92, 48, 1096, 624);
    FlxG.cameras.add(clipCAM, false);
    clipCAM.bgColor = 0x00000000;

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

	bgOverflow = new FlxBackdrop(Paths.image('ui/bg'));
	bgOverflow.moves = true;
	bgOverflow.scrollFactor.set(0, 0);
	bgOverflow.velocity.x = 50;
	bgOverflow.velocity.y = 50;
	bgOverflow.active = true;
    bgOverflow.alpha = 1;
    bgOverflow.cameras = [clipCAM];
	add(bgOverflow);

    title = new FlxSprite(0, 75).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/Title'));
    title.cameras = [awesomeCam];
    title.screenCenter(FlxAxes.X);
	add(title);

    fileBox = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/box'));
    fileBox.cameras = [awesomeCam];
    fileBox.screenCenter();
	add(fileBox);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [awesomeCam];
    add(cursor);

}

function update() {

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

}