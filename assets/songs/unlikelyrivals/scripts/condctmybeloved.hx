function postCreate() {

	introbg = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/background'));
	introbg.antialiasing = false;
	introbg.alpha = 1;
	introbg.cameras = [camHUD];
	introbg.updateHitbox();
	insert(1,introbg);

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
	insert(2,context);

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
	insert(2,lute);

	dialogue = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/0'));
	dialogue.antialiasing = false;
	dialogue.alpha = 0;
	dialogue.cameras = [camHUD];
	dialogue.updateHitbox();
	insert(3,dialogue);

	holdup = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/hold'));
	holdup.antialiasing = false;
	holdup.alpha = 0;
	holdup.cameras = [camHUD];
	holdup.updateHitbox();
	add(holdup);

	blackHUD = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackHUD.antialiasing = false;
	blackHUD.alpha = 0;
	blackHUD.screenCenter();
	blackHUD.cameras = [camHUD];
	blackHUD.scale.set(6,6);
	blackHUD.updateHitbox();
	add(blackHUD);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
	case 148:
	FlxTween.tween(dialogue, {alpha: 1}, 2, {ease:FlxEase.quartOut});
	case 196:
	dialogue.loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/1'));
	FlxTween.tween(context, {x: 0}, 2, {ease:FlxEase.quartOut});
	case 215:
	dialogue.loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/2'));
	case 228:
	dialogue.loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/3'));
	FlxTween.tween(lute, {x: 0}, 2, {ease:FlxEase.quartOut});
	case 250:
	dialogue.loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/4'));
	case 256:
	FlxTween.tween(dialogue, {alpha: 0}, 1.5, {ease:FlxEase.quartIn});
	FlxTween.tween(lute, {x: 600}, 1.5, {ease:FlxEase.quartIn});
	FlxTween.tween(context, {x: -800}, 1.5, {ease:FlxEase.quartIn});
	FlxTween.tween(introbg, {y: 1000}, 1.5, {ease:FlxEase.backIn});
	case 2576:
	FlxTween.tween(introbg, {y: 0}, 1, {ease:FlxEase.backOut});
	case 2672:
	FlxTween.tween(dialogue, {alpha: 1}, 2, {ease:FlxEase.quartOut});
	dialogue.loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/5'));	
	case 2684:
	dialogue.loadGraphic(Paths.image('visuals/misconduct/unlikelyrivalscover/6'));	
	case 2705:
	blackHUD.alpha = 1;
	}
}