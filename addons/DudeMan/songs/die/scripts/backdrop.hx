
var imLazy = "backdrop/die/";
var introPlaying = true;

function create() {

    memories = new FlxSprite(-100, 125);	
    memories.antialiasing = false;
    memories.frames = Paths.getSparrowAtlas(imLazy+'memories');
    memories.animation.addByPrefix('0', 'idle0000', 10, false);
    memories.animation.addByPrefix('1', 'idle0001', 10, false);
    memories.animation.addByPrefix('2', 'idle0002', 10, false);
    memories.animation.addByPrefix('3', 'idle0003', 10, false);
    memories.animation.play('0');
    memories.alpha = 0;
    memories.scale.set(1.5, 1);
    memories.updateHitbox();
    insert(5,memories);

    backdrop = new FlxSprite(55, 100).loadGraphic(Paths.image(imLazy+'wall'));
    insert(6,backdrop);

    floor = new FlxSprite(55, 100).loadGraphic(Paths.image(imLazy+'floor'));
    insert(7,floor);

	bear5Epic = new Character(100, 100, "bear5NEW-memories");
	bear5Epic.flipX = false; 
	bear5Epic.alpha = 0;
	insert(24, bear5Epic);

	picoManEpic = new Character(-630, 100, "picoManNEW-memories");
	picoManEpic.flipX = false;
	picoManEpic.alpha = 0;
	insert(20, picoManEpic);

    blue = new FlxSprite(55, 100).loadGraphic(Paths.image(imLazy+'blue'));
    insert(25,blue);

    spotlight = new FlxSprite(55, 100).loadGraphic(Paths.image(imLazy+'spotlight'));
    insert(30,spotlight);

    explosion = new FlxSprite(200, 125);	
    explosion.antialiasing = false;
    explosion.frames = Paths.getSparrowAtlas('explosion');
    explosion.animation.addByPrefix('explode', 'explode', 10, false);
    explosion.animation.play('explode');
    explosion.alpha = 0;
    explosion.updateHitbox();
    explosion.scale.set(0.6, 0.6);
    add(explosion);

    dark = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    dark.scrollFactor.set(0, 0);
    add(dark);

    red = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFFFF0000);
    red.scrollFactor.set(0, 0);
    red.alpha = 0;
    add(red);

    bar1 = new FlxSprite(0, -300).makeGraphic(1280, 300, 0xFF000000);
    bar1.scrollFactor.set(0, 0);
    add(bar1);
    
    bar2 = new FlxSprite(0, 725).makeGraphic(1280, 300, 0xFF000000);
    bar2.scrollFactor.set(0, 0);
    add(bar2);

    defaultCamZoom = 1.4;

    gf.alpha = 0;

}

function beatHit() {

    var memory = ""+FlxG.random.int(0,3);
    if (memory == memories.curAnim) {
        memory = ""+FlxG.random.int(0,3);
    }
    memories.animation.play(memory);

}

function update() {

    if (introPlaying == true) {
        camHUD.alpha = 0;
    }

}

function onPlayerHit(event) {
	picoManEpic.playSingAnim(event.direction);
}               
function onDadHit(event) {
	bear5Epic.playSingAnim(event.direction);
}

function stepHit(curStep:Int) {

    switch(curStep) {

        case 4:
            FlxTween.tween(red, {alpha: 1}, 0.25);
        case 8:
            FlxG.camera.shake(0.01, .2);
            dark.visible = false;
            introPlaying = false;
            FlxTween.tween(red, {alpha: 0}, 0.5);
            FlxTween.tween(camHUD, {alpha: 1}, 0.5);
            FlxTween.tween(bar1, {y: -100}, 1, {ease:FlxEase.quartOut});  
            FlxTween.tween(bar2, {y: 525}, 1, {ease:FlxEase.quartOut});  
        case 20:
            red.visible = false;
        case 258:
            defaultCamZoom = 1.8;
        case 260:
            defaultCamZoom = 1.4;
            dark.visible = true;
        case 264:
            FlxG.camera.shake(0.01, .2);
            dark.visible = false;
        case 744:
            FlxG.camera.followLerp = 0;
            FlxTween.tween(camGame.scroll, {x: 230}, 1, {ease:FlxEase.quartInOut});
        case 760:
            FlxTween.tween(camGame.scroll, {y: 250}, 2, {ease:FlxEase.quartInOut});  
            FlxTween.tween(camera, {zoom: 1.1}, 2, {ease:FlxEase.quartInOut});  
            FlxTween.tween(backdrop, {alpha: 0}, 2, {ease:FlxEase.quartInOut});  
            FlxTween.tween(bar1, {y: -500}, 2, {ease:FlxEase.quartInOut});  
            FlxTween.tween(bar2, {y: 925}, 2, {ease:FlxEase.quartInOut});  
        case 776:
            bear5Epic.alpha = 1;
            picoManEpic.alpha = 1;
            boyfriend.alpha = 0;
            FlxG.camera.shake(0.01, .2);
            floor.loadGraphic(Paths.image(imLazy+'floor-memories'));
            memories.alpha = 1;
            defaultCamZoom = 1.1;
            FlxG.camera.followLerp = 0.04;
        case 1032:
            FlxG.camera.shake(0.01, .2);
        case 1272:
            FlxG.camera.followLerp = 0;
            FlxTween.tween(camera, {zoom: 1.4}, 1, {ease:FlxEase.quartInOut});
            defaultCamZoom = 1.4;
        case 1280:
            FlxTween.tween(bar1, {y: -100}, 1, {ease:FlxEase.quartInOut});  
            FlxTween.tween(bar2, {y: 525}, 1, {ease:FlxEase.quartInOut});  
        case 1288:  
            FlxG.camera.followLerp = 0.04;
            FlxG.camera.shake(0.01, .2);
        case 1540:
            boyfriend.alpha = 1;
            FlxTween.tween(backdrop, {alpha: 1}, 2, {ease:FlxEase.quartInOut});  
            FlxTween.tween(bear5Epic, {alpha: 0}, 2, {ease:FlxEase.quartInOut});  
            FlxTween.tween(picoManEpic, {alpha: 0}, 2, {ease:FlxEase.quartInOut});  
        case 1672:
            explosion.alpha = 1;
            explosion.animation.play('explode');
        case 1676:
            dad.visible = false;

    }    

}