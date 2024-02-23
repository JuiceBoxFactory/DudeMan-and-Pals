function postCreate() {

	introbg = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/background'));
	introbg.antialiasing = false;
	introbg.alpha = 1;
	introbg.cameras = [camHUD];
	introbg.updateHitbox();
	add(introbg);

	context = new FlxSprite(-800, 0);
	context.frames = Paths.getSparrowAtlas('visuals/misconduct/contextconductintro');
	context.antialiasing = false;
	context.animation.addByPrefix('1', 'contextconductintro idle', 3);
	context.animation.play('1');
	context.updateHitbox();
    	context.alpha = 1;
	context.cameras = [camHUD];
    	context.scale.set(1, 1);
    	context.scrollFactor.set(0, 0);
	context.updateHitbox();
	add(context);

	lute = new FlxSprite(600, 0);
	lute.frames = Paths.getSparrowAtlas('visuals/misconduct/luteconductintro');
	lute.antialiasing = false;
	lute.animation.addByPrefix('1', 'luteconductintro idle', 3);
	lute.animation.play('1');
	lute.updateHitbox();
    	lute.alpha = 1;
	lute.cameras = [camHUD];
    	lute.scale.set(1, 1);
    	lute.scrollFactor.set(0, 0);
	lute.updateHitbox();
	add(lute);

	dialogue = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/contexttext'));
	dialogue.antialiasing = false;
	dialogue.alpha = 0;
	dialogue.cameras = [camHUD];
	dialogue.updateHitbox();
	add(dialogue);

	holdup = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/hold'));
	holdup.antialiasing = false;
	holdup.alpha = 0;
	holdup.cameras = [camHUD];
	holdup.updateHitbox();
	add(holdup);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
	case 0:
	FlxTween.tween(context, {x: 0}, 4, {ease:FlxEase.quartOut});
	FlxTween.tween(dialogue, {alpha: 1}, 2, {ease:FlxEase.quartOut});
	case 42:
	FlxTween.tween(context, {alpha: 0}, 1.2, {ease:FlxEase.quartOut});
	FlxTween.tween(dialogue, {alpha: 0}, 0.4, {ease:FlxEase.quartOut});
	case 49:
	dialogue.alpha = 1;
	dialogue.loadGraphic(Paths.image('visuals/misconduct/lutetext'));
	FlxTween.tween(lute, {x: 0}, 2, {ease:FlxEase.quartOut});
	case 61:
	holdup.alpha = 1;	
	case 63:
	holdup.loadGraphic(Paths.image('visuals/misconduct/holdup'));
	case 65:
	holdup.alpha = 0;
	introbg.alpha = 0;
	dialogue.alpha = 0;
	context.alpha = 0;
	lute.alpha = 0;
	}
}