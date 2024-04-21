import flixel.ui.FlxButton;

function create() {

    button1 = new FlxButton(850, 102, "Dating Sim", loadDating);
    button1.alpha = 1;
    add(button1);

    button2 = new FlxButton(850, 127, "Puncher", loadPuncher);
    button2.alpha = 1;
    add(button2);
    
    button3 = new FlxButton(850, 152, "Fnaf Fangame", loadFnaf);
    button3.alpha = 1;
    add(button3);

    button4 = new FlxButton(850, 177, "2D Platformer", loadPlatformer);
    button4.alpha = 1;
    add(button4);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    add(cursor);

}

function loadDating() {
    FlxG.switchState(new ModState("GAMES/datingSimTitle"));
}

function loadPuncher() {
    FlxG.switchState(new ModState("GAMES/clicker"));
}
function loadFnaf() {
    FlxG.switchState(new ModState("GAMES/FNAF/titleScreen"));
}
function loadPlatformer() {
    FlxG.switchState(new ModState("GAMES/FNAF/titleScreen")); //lol
}

function update() {
    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

    if (controls.BACK) {
        FlxG.switchState(new ModState("FreeplaySelector"));
    }

}