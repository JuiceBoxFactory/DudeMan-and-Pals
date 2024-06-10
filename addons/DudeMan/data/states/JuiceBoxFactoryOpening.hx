import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;
import lime.graphics.Image;
import funkin.backend.utils.NativeAPI;

function create() {

    JBFIcon = new FlxSprite(390, 0).loadGraphic(Paths.image('jbfIcon'));
	JBFIcon.antialiasing = false;
	JBFIcon.updateHitbox();
    JBFIcon.screenCenter(FlxAxes.Y);
    JBFIcon.scale.set(2, 2);
	add(JBFIcon);

    MODIcon = new FlxSprite(725, 0).loadGraphic(Paths.image('modIcon'));
	MODIcon.antialiasing = false;
	MODIcon.updateHitbox();
    MODIcon.screenCenter(FlxAxes.Y);
    MODIcon.scale.set(1.2, 1.2);
	add(MODIcon);

    MODIcon.y += 1000;
    JBFIcon.y += 1000;

	text = new FlxText(0, -800);
	text.text = "A JuiceBoxFactory..,., thing !";
	text.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	text.color = 0xFFFFFFFF;
	text.borderColor = 0xFF000000;
	text.antialiasing = false;
	text.borderSize = 3;
	text.screenCenter(FlxAxes.X);
	add(text);

    smallerText = new FlxText(0, 1000);
	smallerText.text = "wait.,., thats my mod !\n-dudeman";
	smallerText.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	smallerText.color = 0xFFFFFFFF;
	smallerText.borderColor = 0xFF000000;
	smallerText.antialiasing = false;
	smallerText.borderSize = 3;
	smallerText.screenCenter(FlxAxes.X);
    smallerText.x += 150;
	add(smallerText);

    theOpeningInQuestion();

}

function update() {

    if (controls.ACCEPT) {
		FlxG.save.data.noTransition = false;
        FlxG.switchState(new ModState("DudeTitleScreen"));
    }

}

function theOpeningInQuestion() {
    new FlxTimer().start(1, function(timer) {
		FlxTween.tween(MODIcon, {y: 272}, 2, {ease: FlxEase.quartOut});
        FlxTween.tween(JBFIcon, {y: 285}, 2, {ease: FlxEase.quartOut});
	});
    new FlxTimer().start(2, function(timer) {
		FlxTween.tween(text, {y: 200}, 2, {ease: FlxEase.quartOut});
	});
    new FlxTimer().start(4, function(timer) {
		FlxTween.tween(smallerText, {y: 475}, 2, {ease: FlxEase.quartOut});
	});
    new FlxTimer().start(7, function(timer) {
        for (shit in [JBFIcon, MODIcon, text, smallerText]) {
		    FlxTween.tween(shit, {alpha: 0}, 2, {ease: FlxEase.quartOut});
        }
	});
    new FlxTimer().start(10, function(timer) {
		FlxG.save.data.noTransition = false;
        FlxG.switchState(new ModState("DudeTitleScreen"));
	});
}