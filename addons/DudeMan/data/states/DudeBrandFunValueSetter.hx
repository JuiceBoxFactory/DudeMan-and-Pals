import flixel.util.FlxTimer;
import flixel.util.FlxSave;
import flixel.text.FlxText;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import Sys;

var pick47 = false;
var fuckYouGhost = false;

function create() {

    FlxG.save.data.funValue = 0;

	popUpCamera = new FlxCamera(0, 0, 1280, 720);
	popUpCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(popUpCamera, false);

	cursorCam = new FlxCamera(0, 0, 1280, 720);
	cursorCam.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(cursorCam, false);

	coolBackdropPOP = new FlxBackdrop(Paths.image('ui/bg'));
	coolBackdropPOP.moves = true;
	coolBackdropPOP.scrollFactor.set(0, 0);
	coolBackdropPOP.velocity.x = 20;
	coolBackdropPOP.velocity.y = 20;
	coolBackdropPOP.active = true;
	coolBackdropPOP.cameras = [popUpCamera];
	coolBackdropPOP.alpha = 0;
	add(coolBackdropPOP);

    ghost47 = new FlxSprite(-1280, 0);
    ghost47.frames = Paths.getSparrowAtlas('funvalue/47/47ghost');
	ghost47.animation.addByPrefix('0', '0', 24, false);
	ghost47.animation.addByPrefix('1', '1', 24, false);
	ghost47.animation.addByPrefix('2', '2', 24, false);
	ghost47.animation.addByPrefix('wobble', 'wobble', 24, true);
	ghost47.animation.play('0');
	ghost47.antialiasing = false;
	ghost47.updateHitbox();
	ghost47.cameras = [cursorCam];
	FlxG.state.add(ghost47);

	popBorder = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/border'));
	popBorder.scrollFactor.set(0, 0);
	popBorder.cameras = [popUpCamera];
	popBorder.scale.set(1, 1);
	popBorder.alpha = 0;
	add(popBorder);

	warningTextPOP = new FlxText(40, 50, 480);
	warningTextPOP.text = "HELLO ! thanks for uhm. idk playing the mod\n\nbefore we begin, we must SET YOUR FUN VALUE!\nits like undertale, it'll cause some random occurances !\n\nyou can press the button below to randomize your value, or you can opt out of this fun value stuff by pressing [ESCAPE.] ( highly UNRECOMMENDED )";
	warningTextPOP.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	warningTextPOP.cameras = [popUpCamera];
	warningTextPOP.color = 0xFF130022;
	warningTextPOP.antialiasing = true;
	warningTextPOP.borderSize = 2.25;
	warningTextPOP.alpha = 0;
	add(warningTextPOP);

    funValuePreview = new FlxText(50, 300, 450);
	funValuePreview.text = "0";
	funValuePreview.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	funValuePreview.cameras = [popUpCamera];
	funValuePreview.color = 0xFF130022;
	funValuePreview.antialiasing = true;
	funValuePreview.borderSize = 2.25;
	funValuePreview.alpha = 0;
	add(funValuePreview);

	buttonPOP = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/button'));
	buttonPOP.scrollFactor.set(0, 0);
	buttonPOP.cameras = [popUpCamera];
	buttonPOP.scale.set(1, 1);
	buttonPOP.alpha = 0;
	buttonPOP.updateHitbox();
	add(buttonPOP);

	buttonTextPOP = new FlxText(100, 100, 450);
	buttonTextPOP.text = "lets spin!";
	buttonTextPOP.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	buttonTextPOP.cameras = [popUpCamera];
	buttonTextPOP.color = 0xFF130022;
	buttonTextPOP.antialiasing = true;
	buttonTextPOP.borderSize = 2.25;
	buttonTextPOP.alpha = 0;
	add(buttonTextPOP);

    popUpCamera.x = 350;
    popUpCamera.y = 50;
    popUpCamera.width = 550;
    popUpCamera.height = 600;
    popBorder.scale.set(5.55, 6.1);
    popBorder.x = 225;
    popBorder.y = 255;

    warningTextPOP.scale.set(0.001, 0.001);
    buttonPOP.scale.set(0.001, 0.001);
    buttonTextPOP.scale.set(0.001, 0.001);
    warningTextPOP.alpha = 1;
    buttonPOP.alpha = 1;
    buttonTextPOP.alpha = 1;
    buttonTextPOP.x = 55;
    buttonTextPOP.y = 510;
    buttonPOP.x = 635;
    buttonPOP.y = 485;
    buttonPOP.offset.set(350, 50);
    buttonPOP.x -= 145;
    buttonPOP.y += 50;

    FlxTween.tween(warningTextPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
    FlxTween.tween(buttonPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
    FlxTween.tween(buttonTextPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
    FlxTween.tween(coolBackdropPOP, {alpha: 1}, 1, {ease: FlxEase.quartOut});
    FlxTween.tween(popBorder, {alpha: 1}, 1, {ease: FlxEase.quartOut});

	cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);

}

function update() {

    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

    if (FlxG.mouse.justReleased && fuckYouGhost == false) {
		if (FlxG.mouse.overlaps(buttonPOP)) {
            fuckYouGhost = true;
            funValuePreview.scale.set(0.001, 0.001);
            FlxG.sound.play(Paths.sound("confirm"));
			FlxTween.tween(buttonPOP.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(buttonTextPOP.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
            FlxTween.tween(funValuePreview.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
            FlxTween.tween(funValuePreview, {alpha: 1}, 1, {ease: FlxEase.quartOut});
            FlxTween.tween(warningTextPOP, {y: 200}, 1, {ease: FlxEase.quartOut});
            warningTextPOP.text = "alright, here we go!";
            if (pick47 == false) {
                FlxG.save.data.funValue = FlxG.random.int(1, 100);
            }
            else {
                FlxG.save.data.funValue = 47;
            }
            trace(FlxG.save.data.funValue);
            rollProcess();
		}
	}

    if (controls.BACK && FlxG.save.data.funValue != 47) {
        FlxG.save.data.hasntReturned = false;
        FlxG.switchState(new ModState("BetaWarningState"));
    }

    if (FlxG.keys.justPressed.G) {
        pick47 = true;
    }

}

function rollProcess() {

    new FlxTimer().start(1, function(timer) {
        funValuePreview.text = FlxG.random.int(1, 100);
        FlxG.sound.play(Paths.sound("Voldown"), 0.2);
        new FlxTimer().start(0.5, function(timer) {
            funValuePreview.text = FlxG.random.int(1, 100);
            FlxG.sound.play(Paths.sound("Voldown"), 0.2);
            new FlxTimer().start(0.2, function(timer) {
                funValuePreview.text = FlxG.random.int(1, 100);
                FlxG.sound.play(Paths.sound("Voldown"), 0.2);
                new FlxTimer().start(0.1, function(timer) {
                    funValuePreview.text = FlxG.random.int(1, 100);
                    FlxG.sound.play(Paths.sound("Voldown"), 0.2);
                }, 20);
            });
        });
    });

    new FlxTimer().start(3.8, function(timer) {
        funValuePreview.text = FlxG.save.data.funValue;
        funValuePreview.scale.set(1.5, 1.5);
        FlxTween.tween(funValuePreview.scale, {x: 1, y: 1}, 1.2, {ease: FlxEase.quartOut});
        if (FlxG.save.data.funValue != 47) {
            FlxG.sound.play(Paths.sound("rollChosen"), 0.5);
        }   
        else {
            FlxG.sound.play(Paths.sound("rollChosen"), 0.5);
            FlxG.sound.play(Paths.sound("47"), 0.5);
            FlxTween.tween(ghost47, {x: 0}, 2, {ease: FlxEase.quartInOut});
            new FlxTimer().start(4, function(timer) {
                ghost47.animation.play('1');
            });
            new FlxTimer().start(5.2, function(timer) {
                ghost47.animation.play('2');
            });
            new FlxTimer().start(7, function(timer) {
                ghost47.animation.play('wobble');
            });
            new FlxTimer().start(7.4, function(timer) {
                Sys.exit();
            });
        }
        warningTextPOP.text = "awesome. cool. yeah. you can press [ESCAPE] to get back to the mod now";
    });

}