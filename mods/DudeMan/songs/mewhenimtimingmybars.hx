import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

function create() {
    timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("COMIC.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF0F0014;
    timeTxt.color = 0xFFFBECFF;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.color = 0xFF0F0014;
    timeBarBG.loadGraphic(Paths.image("TimeBar"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF0F0014,0xFFFBECFF);
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;
    add(timeBarBG);
    add(timeBar);
    add(timeTxt);

    timeBarBG.x = timeBar.x - 4;
    timeBarBG.y = timeBar.y - 4;

    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];
}

function onSongStart() {
    if (timeBar != null) {
        FlxTween.tween(timeBar, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeBarBG != null) {
        FlxTween.tween(timeBarBG, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeTxt != null) {
    FlxTween.tween(timeTxt, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
}

function update(elapsed:Float) {
    if (inst != null && timeBar != null && timeBar.max != inst.length) {
        timeBar.setRange(0, Math.max(1, inst.length));
    }

    if (inst != null && timeTxt != null) {
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
        var minutes = Std.int(timeRemaining / 60);
        timeTxt.text = minutes + ":" + seconds;
    }
}