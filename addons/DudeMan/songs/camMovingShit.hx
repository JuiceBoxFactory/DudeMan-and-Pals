var cammove = 10; // how much the camera will move
var angleMoveSpeed = 0.10; // the speed of the camera rotating
var angleVar = 0.47; // how much it will rotate

function postCreate() {

	if (PlayState.SONG.meta.name == "die") {
		angleVar = 0.60;
		angleMoveSpeed = 0.2;
		cammove = 15;
	}
	if (FlxG.save.data.goodCamera) {
		angleVar = 420.80;
		angleMoveSpeed = 0.2;
	}
	if (FlxG.save.data.camMove == false) {
		angleVar = 0;
		angleMoveSpeed = 0;
		cammove = 0;		
	}
}

//function onPlayerHit(event) {
//		if (FlxG.save.data.goodCamera) {
//			angleVar * 1.1;
// 		}
//	}

function stepHit(curStep:Int) {
if (PlayState.SONG.meta.name == "orangejuice") {
    switch (curStep) {
	case 256:
		angleMoveSpeed = 0;
		angleVar = 0;
	case 320:
 		angleMoveSpeed = 0.10;
		angleVar = 0.47;
	}
    }
}

function postUpdate() {

	if (PlayState.SONG.meta.name == "obituary" && curStep > 881) {
	    switch(strumLines.members[0].characters[0].getAnimName()) {
	        case "singLEFT": 
	            camFollow.x -= cammove;
	            camGame.angle = (lerp(camGame.angle, -angleVar - 10, angleMoveSpeed));
	        case "singDOWN": 
	            camFollow.y += cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
			 camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
	        case "singUP": 
	            camFollow.y -= cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	            camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
	        case "singRIGHT": 
	            camFollow.x += cammove;
  	          camGame.angle = (lerp(camGame.angle, angleVar + 10, angleMoveSpeed));
	        case "idle", "hey":
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	    }
	}
	if (FlxG.save.data.goodCamera) {
	    switch(strumLines.members[0].characters[0].getAnimName()) {
	        case "singLEFT": 
	            camFollow.x -= cammove;
	            camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
 	           camHUD.angle = (lerp(camHUD.angle, -angleVar, angleMoveSpeed));
	        case "singDOWN": 
	            camFollow.y += cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
			 camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
	        case "singUP": 
	            camFollow.y -= cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	            camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
	        case "singRIGHT": 
	            camFollow.x += cammove;
  	          camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
  	          camHUD.angle = (lerp(camHUD.angle, angleVar, angleMoveSpeed));
	        case "idle", "hey":
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	    }
	    switch(strumLines.members[1].characters[0].getAnimName()) {
 	       case "singLEFT": 
 	           camFollow.x -= cammove;
 	           camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
 	           camHUD.angle = (lerp(camHUD.angle, -angleVar, angleMoveSpeed));
	        case "singDOWN": 
 	           camFollow.y += cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	            camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
 	       case "singUP": 
  	          camFollow.y -= cammove;
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	           camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
  	      case "singRIGHT": 
  	          camFollow.x += cammove;
 	           camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
  	           camHUD.angle = (lerp(camHUD.angle, angleVar, angleMoveSpeed));
 	       case "idle", "hey":
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	    }
 	   switch(strumLines.members[2].characters[0].getAnimName()) {
 	       case "singLEFT": 
 	           camFollow.x -= cammove;
 	           camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
 	           camHUD.angle = (lerp(camHUD.angle, -angleVar, angleMoveSpeed));
	        case "singDOWN": 
 	           camFollow.y += cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	            camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
 	       case "singUP": 
  	          camFollow.y -= cammove;
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	           camHUD.angle = (lerp(camHUD.angle, 0, angleMoveSpeed));
  	      case "singRIGHT": 
  	          camFollow.x += cammove;
 	           camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
  	           camHUD.angle = (lerp(camHUD.angle, angleVar, angleMoveSpeed));
 	       case "idle", "hey":
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
    	}
}
	if (PlayState.SONG.meta.name != "lighthouse" && !FlxG.save.data.goodCamera) {
	    switch(strumLines.members[0].characters[0].getAnimName()) {
	        case "singLEFT": 
	            camFollow.x -= cammove;
	            camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
	        case "singDOWN": 
	            camFollow.y += cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	        case "singUP": 
	            camFollow.y -= cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	        case "singRIGHT": 
	            camFollow.x += cammove;
  	          camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
	        case "idle", "hey":
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	    }
	    switch(strumLines.members[1].characters[0].getAnimName()) {
 	       case "singLEFT": 
 	           camFollow.x -= cammove;
 	           camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
	        case "singDOWN": 
 	           camFollow.y += cammove;
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	       case "singUP": 
  	          camFollow.y -= cammove;
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
  	      case "singRIGHT": 
  	          camFollow.x += cammove;
 	           camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
 	       case "idle", "hey":
 	           camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	    }
 	   switch(strumLines.members[2].characters[0].getAnimName()) {
 	       case "singLEFT": 
 	           camFollow.x -= cammove;
 	           camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
 	       case "singDOWN": 
			camFollow.y += cammove;
			camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
 	       case "singUP": 
			camFollow.y -= cammove;
			camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
	        case "singRIGHT": 
	            camFollow.x += cammove;
	            camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
	        case "idle", "hey":
	            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
    	}
   }
}