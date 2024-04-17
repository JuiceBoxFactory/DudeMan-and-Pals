function create() {

	buildingbg = new FlxSprite(0, 1300).loadGraphic(Paths.image('backdrop/drawingBoardOJ/backgroundBuild'));
	buildingbg.antialiasing = false;
	buildingbg.alpha = 1;
	buildingbg.scrollFactor.set(0.75, 0.75);
	insert(3,buildingbg);

	building1 = new FlxSprite(0, 900).loadGraphic(Paths.image('backdrop/drawingBoardOJ/build1'));
	building1.antialiasing = false;
	building1.alpha = 1;
	building1.scrollFactor.set(0.9, 0.9);
	insert(4,building1);

	building2 = new FlxSprite(0, 1000).loadGraphic(Paths.image('backdrop/drawingBoardOJ/build2'));
	building2.antialiasing = false;
	building2.alpha = 1;
	building2.scrollFactor.set(0.9, 0.9);
	insert(5,building2);

	building3 = new FlxSprite(0, 1100).loadGraphic(Paths.image('backdrop/drawingBoardOJ/build3'));
	building3.antialiasing = false;
	building3.alpha = 1;
	building3.scrollFactor.set(0.9, 0.9);
	insert(6,building3);

	fog = new FlxSprite(0, 975);	
	fog.frames = Paths.getSparrowAtlas('backdrop/drawingBoardOJ/smoke');
	fog.animation.addByPrefix('thangInQuestion', 'doYoThang', 2);
	fog.animation.play('thangInQuestion');
	fog.antialiasing = false;
	fog.alpha = 1;
	fog.scrollFactor.set(1, 1);
	insert(8, fog);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 0: 
          defaultCamZoom = 1.5;
	case 118:
//	  FlxTween.tween(ntsc, {alpha: 1}, 2, {ease:FlxEase.quartInOut});
	case 128:
//	  ntsc.alpha = 0;
        case 248: 
          defaultCamZoom = 1.8;
	  FlxG.camera.shake(0.01, 0.6);
	  for (shit in [buildingbg, building1, building2, building3]) {
	  	FlxTween.tween(shit, {y: 0}, 2.5, {ease:FlxEase.quartOut});
	}
	  	FlxTween.tween(fog, {y: 75}, 1, {ease:FlxEase.quartOut});
        case 256: 
	  FlxG.camera.followLerp = 0;
	  FlxTween.tween(camGame.scroll, {y: 405}, 4, {ease:FlxEase.quartInOut});
	  FlxTween.tween(camHUD, {alpha: 0}, 2);			
          defaultCamZoom = 0.8;
        case 306: 
	  FlxTween.tween(camGame.scroll, {y: 745}, 1.5, {ease:FlxEase.quartInOut});
	  FlxTween.tween(camHUD, {alpha: 1}, 1.25);
//	  FlxTween.tween(camGame.scroll, {x: 510.821464616515}, 1.25, {ease:FlxEase.quartInOut});			
          defaultCamZoom = 1.2;
        case 320: 
	  FlxG.camera.followLerp = 0.04;
        }
}