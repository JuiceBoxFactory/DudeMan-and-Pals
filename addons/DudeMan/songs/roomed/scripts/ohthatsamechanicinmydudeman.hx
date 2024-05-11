import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

var progToBe = 0;
var iconToBe = 0;

function create() {

    progheader = new FlxSprite(0, 670).loadGraphic(Paths.image('fuckingMechanicUi/roomed/doorBar'));
    progheader.antialiasing = false;
    progheader.cameras = [camHUD];
    progheader.screenCenter(FlxAxes.X);
    progheader.scale.set(1.5, 1.5);
    insert(3, progheader);

    icon1 = new FlxSprite(progheader.getGraphicMidpoint().x - (200 / 2.2) - (progheader.width / 2), 635).loadGraphic(Paths.image('fuckingMechanicUi/roomed/daxIcon'));
    icon1.antialiasing = false;
    icon1.cameras = [camHUD];
    icon1.scale.set(1.5, 1.5);
    insert(4, icon1);

    icon2 = new FlxSprite(progheader.getGraphicMidpoint().x - (-100 / 1.8) + (progheader.width / 2), 650).loadGraphic(Paths.image('fuckingMechanicUi/roomed/doorIcon'));
    icon2.antialiasing = false;
    icon2.cameras = [camHUD];
    icon2.scale.set(1.5, 1.5);
    insert(5, icon2);

    progBar = new FlxBar(progheader.x- 50, progheader.y, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(progheader.width * 1.35), Std.int(progheader.height * 1.25));
    progBar.scrollFactor.set();
    progBar.createFilledBar(0xFFB45B21,0xFFFFEB80);
    progBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    progBar.alpha = 1;
    progBar.cameras = [camHUD];
    insert(2, progBar);

}

function onPlayerHit() {
    progToBe += 5;
}

function update(elapsed) {
    progBar.setRange(0, Math.max(1, 999));

    if (progBar.percent < progToBe) {
        progBar.percent += 0.5;
    }

    icon1.x = icon1.x + progBar.percent / 25;

}