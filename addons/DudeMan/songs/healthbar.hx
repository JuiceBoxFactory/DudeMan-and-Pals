import flixel.text.FlxTextBorderStyle;
import sys.io.FileSystem;

var myPpo = "";
var myOpp = "";

function postCreate() {

	if (PlayState.SONG.meta.name != "lo-fight") {
		remove(accuracyTxt);
		missesTxt.y += 10;
		scoreTxt.y += 10;
	}

	if (PlayState.SONG.meta.name != "lighthouse" | PlayState.SONG.meta.name != "lo-fight") {
		myOpp = dad.getIcon();
		myPpo = boyfriend.getIcon();

		for (dumbShits in [iconP1, iconP2, healthBarBG, missesTxt, scoreTxt]) {
			remove(dumbShits);
		}

		remove(healthBar);
		insert(2, healthBar);
		healthBar.y = 640;

		healthheader = new FlxSprite(0, 580).loadGraphic(Paths.image('game/healthBarPART2'));
		healthheader.antialiasing = false;
		healthheader.cameras = [camHUD];
		healthheader.screenCenter(FlxAxes.X);
		healthheader.updateHitbox();
		insert(3, healthheader);

		icon1 = new FlxSprite(605, 585).loadGraphic(Paths.image('icons/'+myPpo));
		icon1.antialiasing = false;
		icon1.flipX = true;
		icon1.cameras = [camHUD];
		icon1.updateHitbox();
		insert(4, icon1);

		icon2 = new FlxSprite(525, 585).loadGraphic(Paths.image('icons/'+myOpp));
		icon2.antialiasing = false;
		icon2.cameras = [camHUD];
		icon2.updateHitbox();
		insert(5, icon2);

		scoreText = new FlxText();
		scoreText.setFormat(Paths.font("COMIC.ttf"), 15, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreText.cameras = [camHUD];
		scoreText.borderSize = 1.25;
		scoreText.y = 680;
		scoreText.screenCenter(FlxAxes.X);
		scoreText.x -= 200; 
		scoreText.antialiasing = false;
		insert(6, scoreText);

		missesText = new FlxText();
		missesText.setFormat(Paths.font("COMIC.ttf"), 15, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		missesText.cameras = [camHUD];
		missesText.borderSize = 1.25;
		missesText.y = 680;
		missesText.screenCenter(FlxAxes.X);
		missesText.x += 75;
		missesText.antialiasing = false;
		insert(7, missesText);

		if (downscroll) {
			for (dumbShits in [healthBar, missesText, scoreText, icon1, icon2]) {
				dumbShits.y -= 15;
			}
		}
	}	

	if (PlayState.SONG.meta.name == "roomed") {
		for (healthBS in [missesText, scoreText, icon2, icon1, healthheader, healthBar]) {
			healthBS.alpha = 0;
		}
	}
}

function update() {
	if (PlayState.SONG.meta.name != "lighthouse" | PlayState.SONG.meta.name != "lo-fight") {
		myOpp = dad.getIcon();
		icon2.loadGraphic(Paths.image('icons/'+myOpp));
		myPpo = boyfriend.getIcon();
		icon1.loadGraphic(Paths.image('icons/'+myPpo));

		scoreText.text = "Coolness: "+songScore;
		missesText.text = "Bitches Fumbled: "+misses;
	}
}

function beatHit() {

	if (PlayState.SONG.meta.name != "lo-fight") {
		iconP1.scale.set(1, 1);
		iconP2.scale.set(1, 1);
	}


	if (PlayState.SONG.meta.name != "lighthouse" | PlayState.SONG.meta.name != "lo-fight") {
		for (obj in [icon1, icon2]) {
			obj.scale.set(1.1, 1.1);
			FlxTween.tween(obj.scale, {x: 1}, 0.25);
			FlxTween.tween(obj.scale, {y: 1}, 0.25);
		}
	}

}