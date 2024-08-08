function postUpdate() {

    darkness = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    darkness.scrollFactor.set(0, 0);
    darkness.alpha = 1;
    add(darkness);

    FlxG.switchState(new ModState("StoryState"));

}