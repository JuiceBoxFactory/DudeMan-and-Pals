import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;
var deathCam = new FlxCamera();

function new() { 
    	   DiscordUtil.changePresence("girl, you died in fucking " + PlayState.SONG.meta.displayName, null);
}

function create() {

	cameras = [];

	FlxG.cameras.add(deathCam, false);

	deathQoutes = new FlxSprite(0, 0);
	deathQoutes.scrollFactor.set(0, 0);
	deathQoutes.loadGraphic(Paths.image('deathScreens/'+PlayState.SONG.meta.displayName));
	deathQoutes.cameras = [deathCam];
	add(deathQoutes);

	fuckyou = new FlxSprite(0, 0);
	fuckyou.scrollFactor.set(0, 0);
	fuckyou.loadGraphic(Paths.image('deathScreens/recovery'));
	fuckyou.cameras = [deathCam];
	fuckyou.alpha = 0;
	add(fuckyou);

}

function update() {


	if (controls.ACCEPT) {
		FlxTween.tween(fuckyou, {alpha: 1}, 2);
	}
	
	character.alpha = 0;

}
