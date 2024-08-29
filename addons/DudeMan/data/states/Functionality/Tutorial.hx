import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.math.FlxRect;
import flixel.text.FlxTextBorderStyle;

function create() {

    darkCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(darkCam, false);
    darkCam.bgColor = 0x00000000;

    darkness = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    darkness.scrollFactor.set(0, 0);
    darkness.alpha = 0;
    darkness.cameras = [darkCam];
    add(darkness);

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

    FlxG.save.data.substateOpen = true;

    board = new FlxSprite(0, 0).loadGraphic(Paths.image("ui/infoTut/posterBoard/blank"));
    board.scrollFactor.set(0, 0);
    board.screenCenter();
    var boardY = board.y;
    board.y -= 900;
    board.cameras = [awesomeCam];
    add(board);

    clip = new FlxSprite(1052, -900).loadGraphic(Paths.image("ui/infoTut/posterBoard/blank"));
    clip.scrollFactor.set(0, 0);
    clip.cameras = [awesomeCam];
    add(clip);

    boardThing = new FlxSprite(0, 0).loadGraphic(Paths.image("ui/infoTut/posterBoard/"+FlxG.save.data.tutorialToShow));
    boardThing.scrollFactor.set(0, 0);
    boardThing.cameras = [awesomeCam];
    add(boardThing);

    dudeMan = new FlxSprite(0, 0);
    dudeMan.frames = Paths.getSparrowAtlas('ui/infoTut/dude');
	dudeMan.antialiasing = false;
    dudeMan.animation.addByPrefix('gone', 'pop0000', 12, false);
    dudeMan.animation.addByPrefix('pop', 'pop', 12, false);
    dudeMan.animation.addByPrefix('tap', 'tap', 12, false);
    dudeMan.animation.addByPrefix('Dpear', 'Dpear', 12, false);
    dudeMan.scrollFactor.set(0, 0);
    dudeMan.animation.play('gone');
    dudeMan.cameras = [awesomeCam];
    add(dudeMan);

    text = new FlxText(0, 0, 1052);
    text.text = "press enter when you're done reading!";
    text.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);            
    text.antialiasing = false;
    text.borderSize = 2.25;
    text.alpha = 0;
    text.cameras = [awesomeCam];
    text.screenCenter(FlxAxes.X);
    add(text);

    new FlxTimer().start(0.5, function(timer) {
        dudeMan.animation.play('pop');
        FlxTween.tween(board, {y: boardY}, 2.1, {ease:FlxEase.quartInOut});
    });
    new FlxTimer().start(2.5, function(timer) {
        dudeMan.animation.play('tap');
        FlxTween.tween(clip, {x: 0}, 2, {ease:FlxEase.quartInOut});
    });
    new FlxTimer().start(4.5, function(timer) {
        dudeMan.animation.play('Dpear');
    });
    new FlxTimer().start(7, function(timer) {
        FlxTween.tween(text, {alpha: 1}, 0.5, {ease:FlxEase.quartInOut});
    });

    FlxTween.tween(darkness, {alpha: 0.7}, 0.5, {ease:FlxEase.quartInOut});

}

function update() {

    boardThing.y = board.y;
    boardThing.x = board.x;
    text.y = board.y + 600;

    var clipShit = (clip.x * (-1));

    var clipy = new FlxRect(clipShit, 0, boardThing.frameWidth, boardThing.frameHeight);
    boardThing.clipRect = clipy;

    if (FlxG.keys.justPressed.ENTER) {
        var boardY = board.y;
        FlxG.sound.play(Paths.sound('confirm'), 1);
        FlxTween.tween(board, {y: boardY - 900}, 2.1, {ease:FlxEase.quartInOut});       
        FlxTween.tween(darkness, {alpha: 0}, 2.1, {ease:FlxEase.quartInOut});
        new FlxTimer().start(2.1, function(timer) {
            FlxG.save.data.substateOpen = false;
            FlxG.save.data.blehRemoveMyShadersFAGGGOOT = true;
            close();
        });
    }

}