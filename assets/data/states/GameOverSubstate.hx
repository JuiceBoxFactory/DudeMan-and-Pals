import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;
import hxvlc.openfl.Video;
import hxvlc.flixel.FlxVideo;
import flixel.util.FlxTimer;

var deathCam = new FlxCamera();
var curVideo = null;
var quitted = false;

var chance = 0;

function new() { 
    	   DiscordUtil.changePresence("girl, you died in fucking " +PlayState.SONG.meta.displayName, null);
}

function create() {

	cameras = [];

	FlxG.cameras.add(deathCam, false);
	
	if (chance < 50) {
	deathQoutes = new FlxSprite(0, 0);
	deathQoutes.scrollFactor.set(0, 0);
	deathQoutes.loadGraphic(Paths.image('deathScreens/'+PlayState.SONG.meta.name));
	deathQoutes.cameras = [deathCam];
	add(deathQoutes);

	fuckyou = new FlxSprite(0, 0);
	fuckyou.scrollFactor.set(0, 0);
	fuckyou.loadGraphic(Paths.image('deathScreens/recovery'));
	fuckyou.cameras = [deathCam];
	fuckyou.alpha = 0;
	add(fuckyou);
	}
	
	if (PlayState.SONG.meta.name == "lighthouse") {
	chance = FlxG.random.int(0,50);
	}

	if (chance == 50) {
	curVideo = new FlxVideo();
	curVideo.onEndReached.add(curVideo.dispose);
	var path = Paths.file("videos/lighthouseRoomforonemore.mp4");
	curVideo.load(Assets.getPath(path));

	var timer:FlxTimer = new FlxTimer();
	timer.start(1, curVideo.play(), 0);
	}
}

function update() {
	if (chance == 50) {	
	lossSFX.volume = 0;
	if (FlxG.sound.music != null) {
	FlxG.sound.music.stop();
		}
	}

	if (controls.ACCEPT) {
		FlxTween.tween(fuckyou, {alpha: 1}, 2);
	}
	
	character.alpha = 0;

}
