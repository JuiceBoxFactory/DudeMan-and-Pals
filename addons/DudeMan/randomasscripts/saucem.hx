function create() {

	cpuStrums.forEach(function(strums) strums.alpha = 0.5);
	cpuStrums.notes.forEach(function(notes) notes.alpha = 0.5);

}

//function stepHit(){
//    switch(curStep){
//         case 1:
//	cpuStrums.x += 700;
//            FlxTween.tween(camGame, {alpha: 0}, 1);
//            FlxTween.tween(camHUD, {alpha: 0}, 1);
//    }
//}