function create() {

    imgoated = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/pwf/kosewetfart'));
    imgoated.updateHitbox();
    imgoated.alpha = 1;
    imgoated.antialiasing = false;
    imgoated.scale.set(2, 2);
    imgoated.scrollFactor.set(1, 1);
    imgoated.updateHitbox();
    insert(1, imgoated);

    black2 = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
    black2.updateHitbox();
    black2.alpha = 0;
    black2.antialiasing = false;
    black2.scale.set(3, 3);
    black2.scrollFactor.set(0, 0);
    black2.updateHitbox();
    insert(35,black2);

}

function update(elapsed) {
	stage.update(elapsed);
}
function beatHit(curBeat) {
	stage.onBeat();
}
function stepHit(curStep:Int) { 
    switch (curStep) {
    case 1280:
      black2.alpha = 1;
    case 1344:
      black2.alpha = 0;
    case 2624:
      black2.alpha = 1;
      }
}