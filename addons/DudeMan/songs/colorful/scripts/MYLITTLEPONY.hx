import flixel.util.FlxSave;

var introPlaying = false;
var forceCamHudGone = true;
var floatySection = false;
var colorful = false;

var colorsForColorful = [
  
    0xFFFF8EAC,
    0xFFFFA68E,
    0xFFFFF78E,
    0xFF8FFF8E,
    0xFF8EFFDA,
    0xFF8EC3FF,
    0xFFC08EFF

];

function create() {

    dark = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    dark.scrollFactor.set(0, 0);
    dark.alpha = 0;
    insert(8,dark);

    bar1 = new FlxSprite(0, -500).makeGraphic(1280, 300, 0xFF4C0000);
    bar1.scrollFactor.set(0, 0);
    insert(10,bar1);
    
    bar2 = new FlxSprite(0, 925).makeGraphic(1280, 300, 0xFF4C0000);
    bar2.scrollFactor.set(0, 0);
    insert(11,bar2);

    defaultCamZoom = 1.1;

// replaces <sprite x="0" y="0" sprite="bed" name="bed" antialiasing="false"/> in the stage xml, just in case i want it to disapear at some point

    lights = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/fruityroom/lights'));
    lights.scrollFactor.set(1, 1);
    lights.color = 0xFFFF8EAC;
    lights.alpha = 0.7;
    insert(4,lights);

    bed = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/fruityroom/bed'));
    bed.scrollFactor.set(1, 1);
    insert(7,bed);

    white = new FlxSprite(0, 0).loadGraphic(Paths.image('white'));
    white.scrollFactor.set(0, 0);
    white.alpha = 0;
    white.blend = "add";
    white.color = 0xFFFF8EAC;
    insert(99,white);

    FlxG.save.data.scared = false;

}

function postCreate() {

    camGame.alpha = 0;

}

function beatHit() {

    if (colorful == true) {
        var colorVar = colorsForColorful[FlxG.random.int(0, 6)];
        white.color = colorVar;
        lights.color = colorVar;
    }

}

function update() {

    if (introPlaying == true) {
        defaultCamZoom = camera.zoom;
    }

    if (forceCamHudGone == true) {
        camHUD.alpha = 0;
    }

    if (floatySection == true) {

        for (i in 0...4)	{

            if (cpuStrums.members[i].y == 40) {
                FlxTween.tween(cpuStrums.members[i], {y: 60}, 1, {ease:FlxEase.quartOut}); 
            }
            if (cpuStrums.members[i].y == 60) {
                FlxTween.tween(cpuStrums.members[i], {y: 40}, 1, {ease:FlxEase.quartOut}); 
            }

        }
        for (i in 0...4)	{

            if (playerStrums.members[i].y == 40) {
                FlxTween.tween(playerStrums.members[i], {y: 60}, 1, {ease:FlxEase.quartOut}); 
            }
            if (playerStrums.members[i].y == 60) {
                FlxTween.tween(playerStrums.members[i], {y: 40}, 1, {ease:FlxEase.quartOut}); 
            }

        }

    }

}

function stepHit(curStep:Int) {

    switch (curStep) {

        case 0:
            FlxTween.tween(camHUD, {alpha: 1}, 1); 
            forceCamHudGone = false;
        case 6:
            introPlaying = true;
            FlxTween.tween(camGame, {alpha: 1}, 8); 
            FlxTween.tween(camera, {zoom: 1.4}, 17, {ease:FlxEase.quartOutOut}); 
        case 120:
            FlxTween.tween(bar1, {y: -100}, 0.7);  
            FlxTween.tween(bar2, {y: 525}, 0.7);  
        case 124:
            dark.alpha = 1;
            introPlaying = false;
            FlxG.camera.zoom = 2.4;
            defaultCamZoom = 2.1;
        case 128:
            FlxTween.tween(dark, {alpha: 0}, 0.5, {ease:FlxEase.quartOut});  
            FlxTween.tween(bar1, {y: -500}, 2, {ease:FlxEase.quartOut});  
            FlxTween.tween(bar2, {y: 925}, 2, {ease:FlxEase.quartOut});  
            defaultCamZoom = 1.5;
        case 256:
            defaultCamZoom = 1.7;
        case 508:
            FlxTween.tween(dark, {alpha: 1}, 0.25, {ease:FlxEase.quartOut}); 
            defaultCamZoom = 2.0;
        case 512:
            FlxTween.tween(dark, {alpha: 0}, 0.5, {ease:FlxEase.quartOut});  
            defaultCamZoom = 1.3;
            FlxTween.tween(white, {alpha: 0.4}, 1.5, {ease:FlxEase.quartOut});  
            FlxTween.tween(lights, {alpha: 1}, 1.5, {ease:FlxEase.quartOut});  
            colorful = true;
            floatySection = true;
            FlxG.save.data.scared = "trueBoth";
            FlxTween.tween(cpuStrums.members[0], {y: 60}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(cpuStrums.members[1], {y: 40}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(cpuStrums.members[2], {y: 60}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(cpuStrums.members[3], {y: 40}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(playerStrums.members[0], {y: 40}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(playerStrums.members[1], {y: 60}, 1, {ease:FlxEase.quartOut});        
            FlxTween.tween(playerStrums.members[2], {y: 40}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(playerStrums.members[3], {y: 60}, 1, {ease:FlxEase.quartOut});  
        case 640:
            introPlaying = true;
            FlxTween.tween(camera, {zoom: 2.4}, 19, {ease:FlxEase.quartOutOut}); 
        case 768:
            FlxG.save.data.scared = false;
            introPlaying = false;
            colorful = false;
            FlxTween.tween(white, {alpha: 0}, 1.5, {ease:FlxEase.quartOut});  
            FlxTween.tween(lights, {alpha: 0.7}, 1.5, {ease:FlxEase.quartOut});  
            lights.color = 0xFFFF8EAC;
            defaultCamZoom = 1.6;
            floatySection = false;
            FlxTween.tween(cpuStrums.members[0], {y: 50}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(cpuStrums.members[1], {y: 50}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(cpuStrums.members[2], {y: 50}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(cpuStrums.members[3], {y: 50}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(playerStrums.members[0], {y: 50}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(playerStrums.members[1], {y: 50}, 1, {ease:FlxEase.quartOut});        
            FlxTween.tween(playerStrums.members[2], {y: 50}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(playerStrums.members[3], {y: 50}, 1, {ease:FlxEase.quartOut});  
        case 832:
            introPlaying = false;
            FlxTween.tween(dark, {alpha: 1}, 6, {ease:FlxEase.quartOut});  
            FlxTween.tween(camera, {zoom: 2.6}, 10, {ease:FlxEase.quartOutOut}); 
        case 896:
            FlxTween.tween(boyfriend, {alpha: 0}, 7, {ease:FlxEase.quartOutOut}); 
            FlxTween.tween(camera, {zoom: 1}, 15, {ease:FlxEase.quartOutOut}); 

    }

}