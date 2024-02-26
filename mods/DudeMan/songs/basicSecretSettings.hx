//import lime.system.System;
var time = 0;
var flippingthisfaggot = false;
var baldBoyDirection = false;
var horseSpeed = 1;
var stylishSpeed = 4;
var noteRating = 200;
var valentinesNumber = 0;
var valentinesDir = false;

function postCreate() {

	valentinesNumber = FlxG.random.int(0,1);

	//valentines day
	if (FlxG.save.data.valentines) {
		kissing = new FlxSprite(0, 100).loadGraphic(Paths.image('secretsettings/valentines/'+valentinesNumber));
		kissing.scrollFactor.set(0, 0);
		kissing.scale.set(1, 1);
		kissing.cameras = [camHUD];
		insert(60, kissing);
	}

	//BALDI GANGAM ACROSS SCREEN SPRITE
	if (FlxG.save.data.baldiStyle) {
		baldi = new FlxSprite(0, 250);	
		baldi.antialiasing = false;
		baldi.scrollFactor.set(0, 0);
		baldi.frames = Paths.getSparrowAtlas('secretsettings/baldiStyle');
		baldi.animation.addByPrefix('ohyeahBaby', 'idle', 24);
		baldi.animation.play('ohyeahBaby');
		baldi.scale.set(2.5, 2.5);
		baldi.cameras = [camHUD];
		insert(60, baldi);
	}
	
	//HORSE SPRITE
	if (FlxG.save.data.horse) {
		horse = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/itsbeensolong'));
		horse.scrollFactor.set(0, 0);
		horse.scale.set(-0.9, 0.9);
		horse.cameras = [camHUD];
		insert(60, horse);

		horseBoom = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/mydadleftmeinnorthcarolinabrokenheartemoji'));
		horseBoom.scrollFactor.set(0, 0);
		horseBoom.alpha = 0;
		horseBoom.cameras = [camHUD];
		insert(61, horseBoom);
	}
	//XBOX SHIT
	if (FlxG.save.data.xbox) {
		Xbox = new FlxSprite();
		Xbox.makeGraphic(1920, 1080, FlxColor.GREEN);
		Xbox.alpha = 0.3;
		Xbox.cameras = [camHUD];
		insert(8, Xbox);

		tvOverlay= new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/xbox/tvoverlay'));
		tvOverlay.scrollFactor.set(0, 0);
		tvOverlay.scale.set(1, 1);
		tvOverlay.cameras = [camHUD];
		insert(9, tvOverlay);

		fuckingController= new FlxSprite(140, 300).loadGraphic(Paths.image('secretsettings/xbox/thatfuckingcontroller'));
		fuckingController.scrollFactor.set(0, 0);
		fuckingController.scale.set(0.6, 0.4);
		fuckingController.cameras = [camHUD];
		insert(80, fuckingController);
		
    		camGame.zoom -= 0.2;
    		camGame.y -= 50;
    		camHUD.zoom = 1;
		
		if (downscroll) {

		fuckingController.y += 50;		
		fuckingController.angle = 180;
		
		}
	}
	//gemontry
		if (FlxG.save.data.geomtery) {
			geomtery= new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/GeometryRatings/' + noteRating));
			geomtery.scrollFactor.set(0, 0);
			geomtery.scale.set(4, 4);
			geomtery.screenCenter();
			geomtery.cameras = [camHUD];
			insert(30, geomtery);
		}
	//im evil.
	if (FlxG.save.data.nightmare) {
		nightmare = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/evil'));
		nightmare.scrollFactor.set(0, 0);
		//nightmare.screenCenter();
		nightmare.alpha = 0;
		nightmare.cameras = [camHUD];
		insert(667, nightmare);
	}
}

function update(delta:Float) {
	time += delta;

if (FlxG.save.data.xbox) {
	insert(80, fuckingController);
}

if (FlxG.save.data.horse) {
	horse.y = horse.y + Math.cos(time * 6.3) * 1;
	horse.angle = horse.angle + Math.cos(time * 3.5) * 0.2;	

	if (flippingthisfaggot == false) {
		horse.x += horseSpeed;
	}
	if (flippingthisfaggot == true) {
		horse.x -= horseSpeed;
	}
	if (horse.x >= 736) {
		flippingthisfaggot = true;
		horse.scale.set(0.9, 0.9);
	}
	if (horse.x <= -128) {
		flippingthisfaggot = false;
		horse.scale.set(-0.9, 0.9);
	}
	
	if (horseBoom.alpha > 0) {
		horseBoom.alpha -= 0.005;
	}

}
	
	if (FlxG.save.data.baldiStyle) {
		baldi.y = baldi.y + Math.cos(time * 6.3) * -10;
		baldi.scale.x = baldi.scale.x + Math.cos(time * 5) * 0.020;

		if (baldBoyDirection == false) {
			baldi.x += stylishSpeed;
		}
		if (baldBoyDirection == true) {
			baldi.x -= stylishSpeed;
		}
		if (baldi.x >= 1400) {
			baldBoyDirection = true;
		}
		if (baldi.x <= -328) {
			baldBoyDirection = false;
		}
	}

	if (FlxG.save.data.geomtery) {	
		geomtery.loadGraphic(Paths.image('secretsettings/GeometryRatings/' +noteRating));

		if (geomtery.alpha > 0) {
		geomtery.alpha -= 0.05;
		}
	}
}
function postUpdate() {
if (FlxG.save.data.valentines) {
	if (valentinesDir == true) {
		if (kissing.x < 1300) {
			kissing.x += 1;
			}
		}
	if (valentinesDir == false) {
		if (kissing.x > -500) {
			kissing.x -= 1;
			}
		}
	if (kissing.x == 1300) {
		valentinesDir = false;
		}	
	if (kissing.x == -500) {
		valentinesDir = true;
		}	
	}
}

function onPlayerMiss() {
	if (FlxG.save.data.geomtery) {
     			noteRating = 0;
			geomtery.alpha = 1;
			}
	if (FlxG.save.data.horse) {
		horseBoom.alpha = 1;
		if (!FlxG.save.data.nightmare) {
		FlxG.sound.play(Paths.sound('cbt'));
		}
	}
	if (FlxG.save.data.nightmare) {
		nightmare.alpha = 1;
		FlxG.sound.play(Paths.sound('evil'));
		health = 0;
	}
}
function onPlayerHit(event) {
	if (FlxG.save.data.hitsounds) {
		FlxG.sound.play(Paths.sound('theGreatestHitsoundThatHasEverLived'));
	}
	if (FlxG.save.data.geomtery) {
     		if (!player.cpu) {
     			noteRating = event.accuracy;
			geomtery.alpha = 1;
			}
     		if (player.cpu) {
			geomtery.alpha = 1;
			}
	}
}