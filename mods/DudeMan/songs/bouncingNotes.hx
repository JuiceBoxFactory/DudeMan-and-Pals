// real codes lmao
// also use direction to do it since noteData is broken, FUCK!
function onPlayerHit(e){
	trace("awesome");
	if (PlayState.SONG.meta.displayName != "lighthouse") {
   		if (e.isSustainNote) return;
       			playerStrums.members[e.direction].y -= 15;
        		FlxTween.tween(playerStrums.members[e.direction], {y: 50}, 0.35, {ease: FlxEase.quartIn});
	}
}
function onDadHit(e){
	trace("awesome");
	if (PlayState.SONG.meta.displayName != "lighthouse") {
    		if (e.isSustainNote) return;
        		cpuStrums.members[e.direction].y -= 15;
        		FlxTween.tween(cpuStrums.members[e.direction], {y: 50}, 0.35, {ease: FlxEase.quartIn});
	}
}