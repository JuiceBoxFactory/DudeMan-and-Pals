var moveCam = 20;
function setCamMove(move) { // in other scripts, you can do: PlayState.scripts.executeFunc("setCamMove", [30]); to set da move cam to be more or less !!
    moveCam = move;
}
function moveCamera() {
    if (PlayState.section == null) return;
    var animName = "";
    if (PlayState.section.mustHitSection) animName = PlayState.boyfriend.animation.curAnim.name;
    else animName = PlayState.dad.animation.curAnim.name;
    if (PlayState.gf != null || PlayState.gf.curCharacter != "Friday Night Funkin':unknown" {
    if (PlayState.gf.animation.curAnim.name.split("dance")[1] == null) animName = PlayState.gf.animation.curAnim.name;
      }
    switch(animName) {
        case "singLEFT", "singLEFT-alt":
            PlayState.camFollow.x -= moveCam;
        case "singRIGHT", "singRIGHT-alt":
            PlayState.camFollow.x += moveCam;
        case "singUP", "singUP-alt":
            PlayState.camFollow.y -= moveCam;
        case "singDOWN", "singDOWN-alt":
            PlayState.camFollow.y += moveCam;
    }
}