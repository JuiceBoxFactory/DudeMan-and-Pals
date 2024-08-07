import flixel.util.FlxTimer;
import flixel.util.FlxSave;

function postCreate() {

    FlxG.save.data.language = "english";
    
    FlxG.save.data.noTransition = true;

    FlxG.save.data.firstOnIntroClient = true;

	blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	add(blackScreen);

	funVal = new FlxText(810, 625, 450);
	funVal.text = "your Fun Value is "+FlxG.save.data.funValue+"\nyou can press [G] to reroll if needed";
	funVal.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	funVal.color = 0xFF555555;
	funVal.antialiasing = false;
	funVal.alpha = 0;
	add(funVal);

	dudeman = new FlxSprite(250, 300).loadGraphic(Paths.image('warningScreen/dudeman'));
	dudeman.antialiasing = false;
	dudeman.updateHitbox();
    dudeman.alpha = 0;
	add(dudeman);

	sign = new FlxSprite(475, 1050).loadGraphic(Paths.image('warningScreen/sign'));
	sign.antialiasing = false;
	sign.updateHitbox();
    sign.angle = 10;
	add(sign);
    
    new FlxTimer().start(1.2, function(timer) {
        FlxTween.tween(dudeman, {alpha: 1}, 2);
    });
    
    new FlxTimer().start(2, function(timer) {
        FlxTween.tween(sign, {y: 50}, 4, {ease: FlxEase.quartOut});
        FlxTween.tween(sign, {angle: 0}, 4, {ease: FlxEase.quartOut});
        FlxTween.tween(funVal, {alpha: 1}, 4, {ease: FlxEase.quartIn});
    });

    trace(FlxG.save.data.funValue);

}

function postUpdate() {

    if (FlxG.keys.justPressed.G) {
//        FlxG.save.data.language = null;
        FlxG.save.data.funValue = null;
    }

    if (FlxG.save.data.funValue == 47 || FlxG.save.data.hasntReturned == true) {
        FlxG.save.data.funValue = null;
    }

    if (FlxG.save.data.funValue == null) {
        FlxG.save.data.hasntReturned = true;
        FlxG.switchState(new ModState("DudeBrandFunValueSetter"));
    }

//    if (FlxG.save.data.language == null) {
//        FlxG.switchState(new ModState("DudeBrandLanguagePicker"));
//        trace('hey buddy');
//    }

    if (controls.ACCEPT) {
        FlxG.switchState(new ModState("JuiceBoxFactoryOpening"));
    }

}