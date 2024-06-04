import flixel.text.FlxTextBorderStyle;
import funkin.backend.utils.DiscordUtil;

var ascendSpeed = 0;

function postCreate() {

	window.title = "DudeMan and... PALS??? - Currently Playing: "+PlayState.SONG.meta.displayName;

	DiscordUtil.changePresenceAdvanced({
		details: "Playing hit song: "+PlayState.SONG.meta.displayName,
		state: '"'+PlayState.SONG.meta.tagline+'"',
		largeImageKey: "icon"
	});

	for (i in playerStrums.members) 
		i.x -= 21;     	
	for (i in cpuStrums.members) 
		i.x -= 21; 

	if (PlayState.SONG.meta.noteType == "BandW") {
		for (i in playerStrums.members) {
			i.y = -10; 
		}
	}

	if (FlxG.save.data.downscroll == true) {
		downscroll = true;
	}
	if (FlxG.save.data.downscroll == false) {
		downscroll = false;
	}	
	if (FlxG.save.data.ghosttap == true) {
		ghostTapping = true;
	}
	if (FlxG.save.data.ghosttap == false) {
		ghostTapping = false;
	}	

	if (FlxG.save.data.botplay == true) {
		player.cpu = true;
		
		BottomText = new FlxText();
		BottomText.text = "imagine needing botplay";
		BottomText.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
		BottomText.x = 530;
		BottomText.y = 100;
		BottomText.cameras = [camHUD];
		BottomText.color = 0xFFFFFFFF;
		BottomText.borderColor = 0xFF000000;
		BottomText.antialiasing = false;
		BottomText.borderSize = 3;
		add(BottomText);
	}
	
	if (FlxG.save.data.botplay == false) {
		player.cpu = false;
	}

	if (FlxG.save.data.middlescroll == true) {
		for (i in playerStrums.members) 
		FlxTween.tween(i, {x: i.x -323}, 0.001, {ease: FlxEase.smootherStepInOut});       	
		for (i in cpuStrums.members) 
		FlxTween.tween(i, {x: i.x -923}, 0.001, {ease: FlxEase.smootherStepInOut}); 
        }	
}

function update() {

	if (PlayState.SONG.meta.noteType == "BandW" && playerStrums.members.y != -10) {
		for (i in playerStrums.members) {
			i.y = -10; 
		}
	}

	if (FlxG.save.data.ascend ) {
		ascendSpeed += 0.000075;
		boyfriend.y -= ascendSpeed;
	}

}