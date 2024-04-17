import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;

var freeRoam = false;
var camFollowing = true;
var botplay = false;
var instructionsGone = false;

function create() {

	if (FlxG.save.data.debug) {
	}
}

function postCreate() {

	if (FlxG.save.data.debug) {	
	
		if (FlxG.save.data.botplay == true) {
			botplay = true;
		}
		if (FlxG.save.data.botplay == false) {
			botplay = false;
		}

		welcometxt = new FlxText(275, 0, 1000, "Ur in Debug Mode !\nyou can press SPACE to toggle freeroam with the game camera\nwhile in freeroam mode, you can use IJKL to move the camera, and Q + E to zoom it !\nyou can press CTRL to toggle botplay yahoo\npress TAB to hide this text (you can press it again to bring it back)", 0);
     		welcometxt.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     		welcometxt.borderColor = 0xFF06000C;
     		welcometxt.cameras = [camHUD];
     		welcometxt.borderSize = 3;
     		add(welcometxt);

		infotxt = new FlxText(275, 520, 1000, ":Freeroam\n:Botplay", 0);
     		infotxt.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     		infotxt.borderColor = 0xFF06000C;
     		infotxt.cameras = [camHUD];
     		infotxt.borderSize = 3;
     		add(infotxt);

		Freeroamtxt = new FlxText(160, 520, 1000, ""+freeRoam, 0);
     		Freeroamtxt.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     		Freeroamtxt.borderColor = 0xFF06000C;
     		Freeroamtxt.cameras = [camHUD];
     		Freeroamtxt.borderSize = 3;
     		add(Freeroamtxt);

		Botplaytxt = new FlxText(185, 550, 1000, ""+botplay, 0);
     		Botplaytxt.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     		Botplaytxt.borderColor = 0xFF06000C;
     		Botplaytxt.cameras = [camHUD];
     		Botplaytxt.borderSize = 3;
     		add(Botplaytxt);

	}
}

function postUpdate() {

	if (FlxG.save.data.debug) {
		Botplaytxt.text = botplay;
		Freeroamtxt.text = freeRoam;

		if (FlxG.keys.pressed.TAB && instructionsGone == false) {
			new FlxTimer().start(0.10, function(timer) {
				instructionsGone = true;
				welcometxt.alpha = 0;
			});
		}
		if (botplay == true) {
			FlxG.save.data.botplay = true;
		}
		if (botplay == false) {
			FlxG.save.data.botplay = false;
		}
		if (FlxG.keys.justPressed.CONTROL && 	botplay == false) {
			new FlxTimer().start(0.10, function(timer) {
				botplay = true;			
			});
		}
		if (FlxG.keys.justPressed.CONTROL && 	botplay == true) {
			new FlxTimer().start(0.10, function(timer) {
				botplay = false;		
			});
		}
		if (FlxG.keys.pressed.TAB && instructionsGone == true) {
			new FlxTimer().start(0.10, function(timer) {
				instructionsGone = false;
				welcometxt.alpha = 1;
			});
		}
		if (FlxG.keys.pressed.I && freeRoam == true) {
			camGame.scroll.y -= 2;
		}
		if (FlxG.keys.pressed.K && freeRoam == true) {
			camGame.scroll.y += 2;
		}
		if (FlxG.keys.pressed.J && freeRoam == true) {
			camGame.scroll.x -= 2;
		}
		if (FlxG.keys.pressed.L && freeRoam == true) {
			camGame.scroll.x += 2;
		}
		if (FlxG.keys.pressed.Q && freeRoam == true) {
			defaultCamZoom -= 0.01;
		}
		if (FlxG.keys.pressed.E && freeRoam == true) {
			defaultCamZoom += 0.01;
		}
		if (camFollowing == false) {
			FlxG.camera.followLerp = 0;
		}
		if (camFollowing == true) {
			FlxG.camera.followLerp = 0.04;
		}
		if (FlxG.keys.justPressed.SPACE && freeRoam == false) {
			new FlxTimer().start(0.10, function(timer) {
				camZooming = false;
				camFollowing = false;
				freeRoam = true;
			});
		}
		if (FlxG.keys.justPressed.SPACE && freeRoam == true) {
			new FlxTimer().start(0.10, function(timer) {
				camZooming = true;
				camFollowing = true;
				freeRoam = false;
			});
		}	
	}
}