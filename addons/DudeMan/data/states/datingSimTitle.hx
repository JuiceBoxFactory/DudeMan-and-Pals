import flixel.ui.FlxButton;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;

var canDoShitDude = false;

function create() {

	FlxG.sound.playMusic(Paths.music('datingSim/title'), 1, true);


    blankBg = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/titleScreen/blank'));
	blankBg.scrollFactor.set(0, 0);
	add(blankBg);

	bgOverflow = new FlxBackdrop(Paths.image('shh/DATINGSIM/titleScreen/checkmyboard')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	bgOverflow.moves = true;
	bgOverflow.scrollFactor.set(0, 0);
	bgOverflow.velocity.x = 50; // you can adjust the values to make the scrolling faster or lower
	bgOverflow.velocity.y = 50;
	bgOverflow.active = true;
	add(bgOverflow);

    bgOverlay = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/titleScreen/overlay'));
	bgOverlay.scrollFactor.set(0, 0);
	add(bgOverlay);

    text = new FlxText();
    text.text = 'This is the best dating simulator ever made\n10/10 - DudeMan';
    text.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    text.color = 0xFF130022;
    text.antialiasing = false;
    text.screenCenter();
    text.alpha = 0;
    text.borderColor = 0xFFFBF1FF;
    text.borderSize = 3;
    add(text);

    title = new FlxSprite(366, 836).loadGraphic(Paths.image('shh/DATINGSIM/titleScreen/logo'));
	title.scrollFactor.set(0, 0);
	add(title);

    fruity = new FlxSprite(-225, 1000).loadGraphic(Paths.image('shh/DATINGSIM/titleScreen/Fruity'));
	fruity.scrollFactor.set(0, 0);
	add(fruity);

    dudeman = new FlxSprite(-225, 1000).loadGraphic(Paths.image('shh/DATINGSIM/titleScreen/Dude'));
	dudeman.scrollFactor.set(0, 0);
	add(dudeman);

    zee = new FlxSprite(-225, 1000).loadGraphic(Paths.image('shh/DATINGSIM/titleScreen/Zee'));
	zee.scrollFactor.set(0, 0);
	add(zee);

    key = new FlxSprite(1025, 625).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/arrow'));           
    key.antialiasing = false;
    key.scale.set(0.6, 0.6);
    key.alpha = 0;
    add(key);

    new FlxTimer().start(0.35, function(timer) {
        FlxTween.tween(text, {alpha: 1}, 4, {ease:FlxEase.quartOut});

        new FlxTimer().start(6, function(timer) {
            FlxTween.tween(text, {alpha: 0}, 2, {ease:FlxEase.quartOut});

            new FlxTimer().start(1, function(timer) {
                FlxTween.tween(title, {y: 336}, 1.55, {ease:FlxEase.quartOut});

                new FlxTimer().start(1.56, function(timer) {
                    FlxG.camera.flash(0xFFFFFFFF, 2);
                    title.x = 15;
                    title.y = 15;
                    key.alpha = 1;
                    new FlxTimer().start(0.6, function(timer) {
                        FlxTween.tween(dudeman, {y: 0}, 1.55, {ease:FlxEase.quartOut});
                        FlxTween.tween(fruity, {y: 0}, 1.3, {ease:FlxEase.quartOut});
                        FlxTween.tween(zee, {y: 0}, 1.6, {ease:FlxEase.quartOut});
                    });

                });

            });

        });

    });

}

function update() {

	if (controls.ACCEPT) {
        key.scale.x = 0.2;
        FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);
        FlxTween.tween(key.scale, {x: 0.6}, 0.4, {ease:FlxEase.backOut});
        new FlxTimer().start(0.5, function(timer) {
            FlxG.switchState(new ModState("datingSim"));
        });
    }

	if (controls.BACK) {
		FlxG.switchState(new ModState("FreeplaySelector"));
	}

}