import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

function create() {

    persistentUpdate = true;

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

    fileBox = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/box'));
	fileBox.scrollFactor.set(0, 0);
    fileBox.cameras = [awesomeCam];
	add(fileBox);

}