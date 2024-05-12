import flixel.addons.display.FlxBackdrop;

var time = 0;
var section2 = false;

function create() {

	
	macBg = new FlxSprite(0, 0);
	macBg.frames = Paths.getSparrowAtlas('visuals/slashgen/macBG');
	macBg.antialiasing = false;
	macBg.animation.addByPrefix('1', 'macBG anim', 6);
	macBg.animation.play('1');
	macBg.updateHitbox();
	macBg.screenCenter();
    macBg.alpha = 1;
    macBg.scale.set(1, 1);
    macBg.scrollFactor.set(0, 0);
	macBg.y += 800;
	macBg.updateHitbox();
	add(macBg);
	
	dudecereal = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/slashgen/cerealandmilk'));
	dudecereal.antialiasing = false;
	dudecereal.scrollFactor.set(0, 0);
	dudecereal.scale.set(1.5, 1.5);
	dudecereal.alpha = 1;
	dudecereal.screenCenter();
	dudecereal.updateHitbox();
	dudecereal.x += -2000;
	dudecereal.y += -90;
	add(dudecereal);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
	case 419:
            FlxTween.tween(macBg, {y: 0}, 2);
            FlxTween.tween(dudecereal, {x: 200}, 4);
	case 480:
		 macBg.alpha = 0;
		 dudecereal.alpha = 0;

	}
}