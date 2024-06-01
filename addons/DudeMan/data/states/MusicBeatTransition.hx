import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.util.FlxSave;

var coolerCamera = new FlxCamera();

function create() {

    remove(blackSpr);
    remove(transitionSprite);

    if (FlxG.save.data.noTransition == false) {

        FlxG.cameras.add(coolerCamera, false);

        coolerCamera.bgColor = 0;
        cameras = [transitionCamera, coolerCamera];

        trans = new FlxSprite();
	    trans.antialiasing = false;
	    trans.frames = Paths.getSparrowAtlas('stateSwitchTransition');
	    trans.animation.addByPrefix('close', 'close', 24, false);
	    trans.animation.addByPrefix('open', 'open', 24, false);
	    trans.updateHitbox();
        trans.cameras = [coolerCamera];
	    add(trans);

        coolerTransitionSprite = new FlxSprite().loadGraphic(Paths.image('stateSwitchidle'));
        coolerTransitionSprite.alpha = 1;
        coolerTransitionSprite.cameras = [coolerCamera];
        add(coolerTransitionSprite);


        if (newState != null) {
            coolerTransitionSprite.alpha = 0;
            trans.animation.play('close');
            new FlxTimer().start(0.5, function(timer) {
                coolerCamera.bgColor = 0xFF0C0014;
                finish();
            });
        }
        else {
            coolerTransitionSprite.alpha = 0;
            trans.animation.play('open');
        }
    } 
}