import flixel.text.FlxTextBorderStyle;
import sys.io.FileSystem;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.ui.FlxBar;
import flixel.FlxG;
import flixel.FlxCamera;

var tickleCam = new FlxCamera(0, 0, 1280, 720);
var initalizedTICKLES = false;
var timesClicked = 0;
var isTickleTime = false;
var timeToTICKLE;
var timeToBeAt;
var myOpp = "";

function create() {

    tickleCam.bgColor = 0x00000000;
    FlxG.cameras.add(tickleCam, false);

	myOpp = dad.getIcon();

    timeToTICKLE = FlxG.random.int(6000, 6000);
    trace(timeToTICKLE);

    icon = new FlxSprite(525, -500).loadGraphic(Paths.image('icons/'+myOpp));
    icon.antialiasing = false;
    icon.cameras = [tickleCam];
    icon.scale.set(1.5, 1.5);
    icon.updateHitbox();
    add(icon);

    timerBeforeDEATH = new FlxTimer();
    timerBeforeDEATH.time = 2;
    timerBeforeDEATH.active = false;
    add(timerBeforeDEATH);

    textTextText = new FlxText(0, -500, FlxG.width);
    textTextText.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    textTextText.cameras = [tickleCam];
    textTextText.text = "YOU NEED TO TICKLE THIS MAN OR YOU WILL DIE IN:\n"+timerBeforeDEATH.time+"\n"+timesClicked+"/50";
    textTextText.borderSize = 4.25;
    textTextText.antialiasing = false;
    insert(999, textTextText);


}

function postCreate() {

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [tickleCam];
    cursor.scrollFactor.set(0, 0);
    cursor.alpha = 1;
    add(cursor);

}

function update() {

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;
    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

    if (FlxG.overlap(cursor, icon) && FlxG.mouse.justPressed) {
        timesClicked += 1;
        FlxG.sound.play(Paths.sound('tickleSound'), 0.2);
        icon.scale.set(0.8, 0.7);
        icon.angle = FlxG.random.int(0, 10);
        icon.x = FlxG.random.int(300, 700);
        icon.y = FlxG.random.int(350, 380);
    }

    if (icon.scale.x != 1.5) {
        icon.scale.x += 0.1;
    }
    if (icon.scale.y != 1.5) {
        icon.scale.y += 0.1;
    }

    if (icon.scale.x > 1.5) {
        icon.scale.x = 1.5;
    }
    if (icon.scale.y > 1.5) {
        icon.scale.y = 1.5;
    }

    if (isTickleTime == true) {
        Conductor.songPosition = timeToBeAt;
        inst.time = timeToBeAt;
        vocals.time = timeToBeAt;
        inst.volume = 0;
        vocals.volume = 0;
    }

    textTextText.text = "YOU NEED TO TICKLE THIS MAN OR YOU WILL DIE IN:\n"+CoolUtil.quantize(timerBeforeDEATH.timeLeft * 1, 100)+" SECONDS\n"+timesClicked+"/25\n"+"(click the icon)";
    
    trace(Conductor.songPosition);

    if (initalizedTICKLES == false && Conductor.songPosition == timeToTICKLE) {
        tickles();
        initalizedTICKLES = true;
    }

}

function tickles() {

    FlxTween.tween(textTextText, {y: 200}, 0.25, {ease:FlxEase.quartInOut});
    FlxTween.tween(icon, {y: 350}, 0.35, {ease:FlxEase.quartInOut});
    timeToBeAt = Conductor.songPosition;
    isTickleTime = true;

    trace('HOLYSHITITSTICKLETIME');
    timerBeforeDEATH.start(10, function(timer) {
        if (timesClicked < 25) {
            health = 0;
        }
        if (timesClicked >= 25) {
            inst.volume = 1;
            vocals.volume = 1;
            isTickleTime = false;
            FlxTween.tween(textTextText, {y: -500}, 0.25, {ease:FlxEase.quartInOut});
            FlxTween.tween(icon, {y: -500, x: 525}, 0.35, {ease:FlxEase.quartInOut});
        }
    });

}