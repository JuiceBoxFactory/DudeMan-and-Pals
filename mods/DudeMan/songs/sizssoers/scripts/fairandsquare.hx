function create() {

	daxMoves = new FlxSprite(0, 0);	
	daxMoves.antialiasing = false;
	daxMoves.frames = Paths.getSparrowAtlas('visuals/rsvp/daxRSVPmoves');
	daxMoves.animation.addByPrefix('blank', 'moves blank', 12);
	daxMoves.animation.addByPrefix('rock', 'moves rock', 12);
	daxMoves.animation.addByPrefix('jesus', 'moves jesus', 12);
	daxMoves.animation.play('blank');
	daxMoves.alpha = 1;
	daxMoves.updateHitbox();
	add(daxMoves);

	ghostMoves = new FlxSprite(0, 0);	
	ghostMoves.antialiasing = false;
	ghostMoves.frames = Paths.getSparrowAtlas('visuals/rsvp/ghostRSVPmoves');
	ghostMoves.animation.addByPrefix('blank', 'moves blank', 12);
	ghostMoves.animation.addByPrefix('paper', 'moves paper', 12);
	ghostMoves.animation.addByPrefix('gun', 'moves gun', 12);
	ghostMoves.animation.play('blank');
	ghostMoves.alpha = 1;
	ghostMoves.updateHitbox();
	add(ghostMoves);

	middleScreen = new FlxSprite(0, 0);	
	middleScreen.antialiasing = false;
	middleScreen.frames = Paths.getSparrowAtlas('visuals/rsvp/middleScreen');
	middleScreen.animation.addByPrefix('blank', 'blank', 12);
	middleScreen.animation.addByPrefix('1', 'one0000', 12);
	middleScreen.animation.addByPrefix('2', 'second0000', 12);
	middleScreen.animation.addByPrefix('3', '30000', 12);
	middleScreen.animation.addByPrefix('4', '40000', 12);
	middleScreen.animation.addByPrefix('5', '50000', 12);
	middleScreen.animation.addByPrefix('6', '60000', 12);
	middleScreen.animation.addByPrefix('7', '70000', 12);
	middleScreen.animation.addByPrefix('8', '80000', 12);
	middleScreen.animation.addByPrefix('9', '90000', 12);
	middleScreen.animation.addByPrefix('10', 'ten0000', 12);
	middleScreen.animation.addByPrefix('11', 'eleven0000', 12);
	middleScreen.animation.addByPrefix('12', 'twelve0000', 12);
	middleScreen.animation.addByPrefix('13', 'thirteen0000', 12);
	middleScreen.animation.addByPrefix('14', '140000', 12);
	middleScreen.animation.addByPrefix('15', '150000', 12);
	middleScreen.animation.addByPrefix('16', '160000', 12);
	middleScreen.animation.addByPrefix('17', '170000', 12);
	middleScreen.animation.addByPrefix('18', '180000', 12);
	middleScreen.animation.addByPrefix('19', '190000', 12);
	middleScreen.animation.addByPrefix('20', '200000', 12);
	middleScreen.animation.addByPrefix('21', '210000', 12);
	middleScreen.animation.play('blank');
	middleScreen.alpha = 1;
	middleScreen.updateHitbox();
	add(middleScreen);

	beginning = new FlxSprite(0, 100).loadGraphic(Paths.image('visuals/rsvp/beginningmessage'));
	beginning.antialiasing = false;
	beginning.scrollFactor.set(1, 1);
	beginning.scale.x = 1;
	beginning.scale.y = 1;	
	beginning.alpha = 1;
	beginning.updateHitbox();
	add(beginning);

}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 4:
	middleScreen.animation.play('1');
        case 112:
	middleScreen.animation.play('2');
        case 128:
	middleScreen.animation.play('3');
        case 148:
	middleScreen.animation.play('4');
        case 178:
	middleScreen.animation.play('5');
        case 206:
	middleScreen.animation.play('6');
        case 236:
	middleScreen.animation.play('7');
        case 252:
	middleScreen.animation.play('8');
        case 256:
	middleScreen.animation.play('9');
        defaultCamZoom = 1.8;
        case 262:
	middleScreen.animation.play('10');
        defaultCamZoom = 2.2;
        case 268:
	middleScreen.animation.play('11');
        defaultCamZoom = 2.6;
        case 272:
        defaultCamZoom = 1.4;
	middleScreen.animation.play('12');
	ghostMoves.animation.play('paper');
	daxMoves.animation.play('rock');
        case 288:
	middleScreen.animation.play('13');
	ghostMoves.animation.play('blank');
	daxMoves.animation.play('blank');
        case 320:
	middleScreen.animation.play('14');
        case 368:
	middleScreen.animation.play('15');
        case 416:
	middleScreen.animation.play('16');
        case 496:
	middleScreen.animation.play('17');
        defaultCamZoom = 1.8;
        case 512:
	middleScreen.animation.play('18');
        defaultCamZoom = 2.2;
        case 520:
	middleScreen.animation.play('19');
        defaultCamZoom = 2.6;
        case 524:
        defaultCamZoom = 1;
	middleScreen.animation.play('20');
	ghostMoves.animation.play('gun');
	daxMoves.animation.play('rock');
        case 528:
        defaultCamZoom = 1.4;
        case 552:
	middleScreen.animation.play('blank');
	ghostMoves.animation.play('blank');
	daxMoves.animation.play('blank'); 
        case 784:
        defaultCamZoom = 1.8;	
        case 960:
	middleScreen.animation.play('21');
       case 16:
        FlxTween.tween(beginning, {alpha: 0}, 2, {ease:FlxEase.quartOut});
	}
}