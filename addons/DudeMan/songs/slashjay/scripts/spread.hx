import openfl.display.BlendMode;
import hxvlc.openfl.Video;
import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;

var awful = false;
var awesome = false;

function create() {
    
    dark = new FlxSprite().makeGraphic(FlxG.width * 4, FlxG.height * 2, 0xFF0F001C);
    dark.blend = BlendMode.MULTIPLY;
    dark.alpha = 0;// 0.5
	add(dark);

    imSpottingAllOver = new FlxSprite(700, 60).loadGraphic(Paths.image('visuals/jay/spotlightAsset'));
	imSpottingAllOver.scale.set(0.8, 1);
    imSpottingAllOver.blend = BlendMode.ADD;
    imSpottingAllOver.alpha = 0;// 0.6
	add(imSpottingAllOver);

    explosion = new FlxSprite(450, -200);	
    explosion.antialiasing = false;
    explosion.frames = Paths.getSparrowAtlas('explosion');
    explosion.animation.addByPrefix('explode', 'explode', 12, false);
    explosion.animation.play('explode');
    explosion.updateHitbox();
    explosion.scale.set(0.8, 0.8);
    add(explosion);

    blackPeople = new FlxSprite().makeGraphic(FlxG.width * 4, FlxG.height * 2, 0xFF000000);
    blackPeople.alpha = 0;
	add(blackPeople);

    blackPeople2 = new FlxSprite().makeGraphic(FlxG.width * 4, FlxG.height * 2, 0xFF000000);
    blackPeople2.alpha = 0;
    blackPeople2.cameras = [camHUD];
	add(blackPeople2);

    curVideo = new FlxVideoSprite();
    var path = Paths.file("videos/dudeman.mp4");
    curVideo.load(Assets.getPath(path));
    curVideo.cameras = [camHUD];
    curVideo.scale.set(0.4, 0.4);
    curVideo.x += 100;
    curVideo.y -= 600;
    add(curVideo);
    curVideo.alpha = 0;

    violin = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/jay/dudelion'));
    violin.scrollFactor.set(0, 0);
    violin.screenCenter();
    violin.alpha = 0;
	add(violin);

}

function update() {

    if (awful == true) {
        defaultCamZoom = FlxG.camera.zoom;
    }

    if (awesome == true) {
        canPause = false;
    }
    else {
        canPause = true;
    }

    if (awesome == false) {
        curVideo.alpha = 0;
    }

}

function stepHit(curStep:Int) {

    switch(curStep) {

        case 0:
            defaultCamZoom = 1.5;

        case 604:
            FlxG.camera.flash(0xFFFFFFFF, 1);
            dark.alpha = 0.5;
            awful = true;
            FlxG.camera.zoom = 1.7;

        case 610:
            FlxG.camera.zoom = 1.9;
    
        case 616:
            FlxG.camera.flash(0xFFFFFFFF, 1);
            imSpottingAllOver.alpha = 0.6;
            FlxG.camera.zoom = 1.5;
            awful = false;

        case 989:
            FlxG.camera.flash(0xFFFFFFFF, 1);
            imSpottingAllOver.alpha = 0;
            dark.alpha = 0;

        case 1156:
            blackPeople2.alpha = 1;
            awesome = true;
            gf.alpha = 0;
            curVideo.play();
            curVideo.alpha = 1;

        case 1312:
            blackPeople2.alpha = 0;
            blackPeople.alpha = 1;
            awesome = false;

        case 1320:
            blackPeople.alpha = 0;

        case 1450:
            explosion.animation.play('explode');

        case 1453:
            dad.alpha = 0;

        case 1530:
            blackPeople.alpha = 1;

        case 1653:
            FlxTween.tween(violin, {alpha: 0.6}, 1.2);
        
        case 1665:
            violin.alpha = 0;

    }

}