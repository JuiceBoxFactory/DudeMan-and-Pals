import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxText;
import flixel.util.FlxColor;

function postCreate() {

	introbg = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/background'));
	introbg.antialiasing = false;
	introbg.alpha = 1;
	introbg.cameras = [camHUD];
	introbg.updateHitbox();
	insert(19,introbg);

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
	insert(20,context);

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
	insert(21,lute);
 
	dialogue = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/contexttext'));
	dialogue.antialiasing = false;
	dialogue.alpha = 0;
	dialogue.cameras = [camHUD];
	dialogue.updateHitbox();
	insert(23,dialogue);

	info1 = new FlxText();
	info1.text = "at the CertainContext recording studio...";
	info1.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	info1.cameras = [camHUD];
	info1.color = 0xFFFFFFFF;
	info1.borderColor = 0xFF000000;
	info1.antialiasing = false;
	info1.borderSize = 2;
	info1.screenCenter();
	insert(20, info1);

	holdup = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/misconduct/hold'));
	holdup.antialiasing = false;
	holdup.alpha = 0;
	holdup.cameras = [camHUD];
	holdup.updateHitbox();
	insert(25, holdup);

	ccbg = new FlxSprite(0, 900).loadGraphic(Paths.image('visuals/misconduct/mygoat'));
	ccbg.antialiasing = false;
	ccbg.alpha = 1;
	ccbg.updateHitbox();
	add(ccbg);

	contextCC = new Character(0, 900, "contextCC");
	contextCC.flipX = false; 
	contextCC.alpha = 1;
	add(contextCC);
	
	luteCC = new Character(200, 900, "luteCC");
	luteCC.flipX = false;
	luteCC.alpha = 1;
	add(luteCC);

	ccoverlay = new FlxSprite(0, 1000).loadGraphic(Paths.image('visuals/misconduct/screenborder'));
	ccoverlay.antialiasing = false;
	ccoverlay.alpha = 1;
	ccoverlay.scale(1, 1.15);
	ccoverlay.scrollFactor.set(0, 0);
	ccoverlay.updateHitbox();
	ccoverlay.cameras = [camHUD];
	insert(1, ccoverlay);

	blackHUD = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	blackHUD.antialiasing = false;
	blackHUD.alpha = 0;
	blackHUD.screenCenter();
	blackHUD.cameras = [camHUD];
	blackHUD.scale.set(6,6);
	blackHUD.updateHitbox();
	insert(35,blackHUD);

}

function onPlayerHit(event) {
	luteCC.playSingAnim(event.direction);
}               
function onDadHit(event) {
	contextCC.playSingAnim(event.direction);
}

function stepHit(curStep:Int) { 
    switch (curStep) {
	case 0:
	FlxTween.tween(info1, {alpha: 0}, 1.2, {ease:FlxEase.quartOut});
	FlxTween.tween(context, {x: 0}, 4, {ease:FlxEase.quartOut});
	FlxTween.tween(dialogue, {alpha: 1}, 2, {ease:FlxEase.quartOut});
	case 42:
	FlxTween.tween(context, {alpha: 0}, 1.2, {ease:FlxEase.quartOut});
	case 48:
	dialogue.alpha = 1;
	dialogue.loadGraphic(Paths.image('visuals/misconduct/lutetext'));
	FlxTween.tween(lute, {x: 0}, 2, {ease:FlxEase.quartOut});
	case 60:
	holdup.alpha = 1;	
	case 62:
	holdup.loadGraphic(Paths.image('visuals/misconduct/holdup'));
	case 64:
	holdup.alpha = 0;
	introbg.alpha = 0;
	dialogue.alpha = 0;
	context.alpha = 0;
	lute.alpha = 0;
	case 320:	
	FlxTween.tween(luteCC, {y: 0}, 1, {ease:FlxEase.backOut});
	FlxTween.tween(contextCC, {y: 0}, 1, {ease:FlxEase.backOut});
	FlxTween.tween(ccbg, {y: 0}, 1, {ease:FlxEase.backOut});
		if (downscroll) {
			FlxTween.tween(ccoverlay, {y: -300}, 1, {ease:FlxEase.backOut});
		}
		else {
			FlxTween.tween(ccoverlay, {y: -421}, 1, {ease:FlxEase.backOut});
		}
	case 321:
	boyfriend.alpha = 0;	
	dad.alpha = 0;
	case 760:
	boyfriend.alpha = 1;	
	dad.alpha = 1;
	FlxTween.tween(luteCC, {y: 900}, 1, {ease:FlxEase.backIn});
	FlxTween.tween(contextCC, {y: 900}, 1, {ease:FlxEase.backIn});
	FlxTween.tween(ccbg, {y: 900}, 1, {ease:FlxEase.backIn});
	FlxTween.tween(ccoverlay, {y: 900}, 1, {ease:FlxEase.backIn});
	case 864:
	blackHUD.alpha = 1;
	}
}