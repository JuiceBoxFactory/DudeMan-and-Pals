function postCreate() {
	if (PlayState.SONG.meta.name != "lo-fight") {	
		for (i in 0...4) {
			player.members[i].scale.set(2.2, 2.2);
			cpu.members[i].scale.set(2.2, 2.2);
			player.members[i].antialiasing = false;
			cpu.members[i].antialiasing = false;
		}
	}
}

function onPostNoteCreation(event) {

	if (PlayState.SONG.meta.name != "lo-fight") {	
		var note = event.note;
		
		if (FlxG.save.data.downscroll == true) {
			if (note.isSustainNote) {
				note.frameOffset.y -= note.frameHeight - 70;		
			}
		}
		else {
			if (note.isSustainNote) {
				note.frameOffset.y -= note.frameHeight / 3;		
			}
		}

		event.note.scale.set(2.2, 2.2);

		event.note.antialiasing = false;
	
	}

}

function onNoteHit(event) {
	if (event.showSplash) {
	  event.showSplash = false;
	  splashHandler.__grp = splashHandler.getSplashGroup(event.note.splash);
	  var splash = splashHandler.__grp.showOnStrum(event.note.__strum);
	  splashHandler.add(splash);
  
	  while (splashHandler.members.length > 8)
		splashHandler.remove(splashHandler.members[0], true);
	}
  }

function onPlayerHit(e){

	if (FlxG.save.data.notebounce == true && !player.cpu) {
		if (PlayState.SONG.meta.name != "lighthouse" && PlayState.SONG.meta.name != "lo-fight") {
   			if (e.isSustainNote) return;
			   	if (downscroll) {
					playerStrums.members[e.direction].y -= 7;
				}
				if (!downscroll) {
					playerStrums.members[e.direction].y -= 15;
				}
        		FlxTween.tween(playerStrums.members[e.direction], {y: 50}, 0.35, {ease: FlxEase.quartIn});
		}
	}
}
function onDadHit(e){
	if (FlxG.save.data.notebounce == true && !player.cpu) {
		if (PlayState.SONG.meta.name != "lighthouse" && PlayState.SONG.meta.name != "lo-fight") {
    		if (e.isSustainNote) return;
				if (downscroll) {
       	 			cpuStrums.members[e.direction].y -= 7;
				}
				if (!downscroll) {
					cpuStrums.members[e.direction].y -= 15;
				}
    		    FlxTween.tween(cpuStrums.members[e.direction], {y: 50}, 0.35, {ease: FlxEase.quartIn});
		}
	}
}