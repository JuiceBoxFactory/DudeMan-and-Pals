import flixel.text.FlxBitmapText;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
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
import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.utils.WindowUtils;
import flixel.FlxCamera;
import flixel.util.FlxTimer;

var rank = 'shit';
var targetNum = 0;
var playervar = "bee";
var opponentvar = "dudeman";
var sectionName = FlxG.save.data.songDisplay;
var data = [
    'total' => 1,
    'max' => 0,

    'sick' => 0,
    'good' => 0,
    'bad' => 0,
    'shit' => 1,
    'miss' => 69420,

    'score' => 4,
    'accuracy' => 0.08 // 8%
];

function getFromNum(real) {
    var rankID = 'lose';
    if (real >= 80) rankID = 'win';
    return rankID;
}

function create() {

    if (FlxG.save.data.playerResults != null) {
        playervar = FlxG.save.data.playerResults;
    }
    if (FlxG.save.data.opponentResults != null) {
        opponentvar = FlxG.save.data.opponentResults;
    }

    if (FlxG.save.data.resultsShit != null) {
        var fuck = FlxG.save.data.resultsShit;

        for (name => value in fuck) {
            data[name] = value;
        }
    }
    trace(data);
    rank = getFromNum(targetNum = Std.int(data['accuracy'] * 100));

}

function postCreate() {

    if (PlayState.isStoryMode && PlayState.storyWeek != null) {
        sectionName = PlayState.storyWeek.name;
    }
    
    FlxG.sound.play(Paths.inst(FlxG.save.data.song, 'Hard'), 0.1);

	office = new FlxSprite(0, 0).loadGraphic(Paths.image('result/office'));
    office.scrollFactor.set(0.1, 0.1);
    office.scale.set(1.5, 1.5);
	add(office);

    boardShadow = new FlxSprite(0, 0).loadGraphic(Paths.image('result/shadow'));
    boardShadow.scrollFactor.set(0.08, 0.08);
	add(boardShadow);

    whiteboard = new FlxSprite(0, 0).loadGraphic(Paths.image('result/whiteboard'));
    whiteboard.scrollFactor.set(0.1, 0.1);
	add(whiteboard);

    trace(playervar);
    player = new FlxSprite(690, 175).loadGraphic(Paths.image('result/notBadGuy/'+playervar+"/"+rank));
    player.scrollFactor.set(0.1, 0.1);
	add(player);

    trace(opponentvar);
    opponent = new FlxSprite(540, 315).loadGraphic(Paths.image('result/badGuy/'+opponentvar+"/"+rank));
    opponent.scrollFactor.set(0.1, 0.1);
	add(opponent);

    stupidSHIT = new FlxText(200, 225, 600);
    stupidSHIT.setFormat(Paths.font("SmoothMarker.ttf"), 30, FlxColor.BLACK, "left");
    stupidSHIT.text = sectionName+"\n\nSICK: "+data['sick']+"\nGOOD: "+data['good']+"\nBAD: "+data['bad']+"\nERM: "+data['shit']+"\nMISSES: "+data['miss']+"\nTOTAL: "+data['total']+"\n\nSCORE: "+data['score']+"\nACCURACY: "+Std.int(data['accuracy'] * 100)+"%";
    stupidSHIT.antialiasing = false;
    stupidSHIT.scrollFactor.set(0.1, 0.1);
    stupidSHIT.color = 0xFF333333;
    add(stupidSHIT);

    pressEnter = new FlxText(0, 510, 600);
    pressEnter.setFormat(Paths.font("SmoothMarker.ttf"), 35, FlxColor.BLACK, "center");
    pressEnter.text = "press ENTER or something";
    pressEnter.screenCenter(FlxAxes.X);
    pressEnter.antialiasing = false;
    pressEnter.scrollFactor.set(0.1, 0.1);
    pressEnter.color = 0xFF333333;
    add(pressEnter);

}

function update() {

    FlxG.camera.scroll.x = FlxG.mouse.screenX - 640;
    FlxG.camera.scroll.y = FlxG.mouse.screenY - 360;

    if (controls.BACK || controls.ACCEPT) {
        FlxG.sound.play(Paths.sound('confirm'));
        new FlxTimer().start(1, _ -> {
            FlxG.switchState(PlayState.isStoryMode ? new StoryMenuState() : new FreeplayState());
        });
    }

}