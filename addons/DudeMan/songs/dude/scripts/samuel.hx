import flixel.text.FlxTextBorderStyle;

 function create() {

	remove(dad);
	remove(boyfriend);

	vreenbg = new FlxSprite(500, 50).loadGraphic(Paths.image('vreenimage'));
	vreenbg.antialiasing = false;
	vreenbg.scale.x = 1;
	vreenbg.scale.y = 1;
	vreenbg.alpha = 0;
	vreenbg.updateHitbox();
	add(vreenbg);

	black = new FlxSprite(0, -300).loadGraphic(Paths.image('black'));
	black.antialiasing = false;
	black.scale.x = 9;
	black.scale.y = 9;
	black.alpha = 0;
	black.updateHitbox();
	add(black);
		
	add(dad);
	add(boyfriend);

	vreendude = new Character(110, 100, "dudevreen");
	vreendude.flipX = false; 
	vreendude.alpha = 0;
	add(vreendude);
	
}
             
function onDadHit(event) {
	vreendude.playSingAnim(event.direction);
}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 376:
     defaultCamZoom = 2.0;
        case 380:
     defaultCamZoom = 2.5;
        case 384:
     defaultCamZoom = 1.6;
        case 530:
     defaultCamZoom = 2.0;
        case 535:
     defaultCamZoom = 1.6;
        case 554:
     defaultCamZoom = 2.0;
        case 559:
     defaultCamZoom = 1.6;
        case 620:
     defaultCamZoom = 2.0;
        case 624:
     defaultCamZoom = 1.6;
        case 688:
	black.alpha = 1;
        case 768:
	black.alpha = 0;
        case 1049:
	remove(dad);
	vreendude.alpha = 1;
        case 1056:
	vreenbg.alpha = 1;
	}
}