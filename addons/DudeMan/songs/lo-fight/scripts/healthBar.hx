function postCreate() {

    for (healthSex2 in [accuracyTxt, scoreTxt, missesTxt]) {
        healthSex2.alpha = 0;
    }

    healthBGBetter = new FlxSprite(0, 650).loadGraphic(Paths.image('dudeMyBalls'));
    healthBGBetter.antialiasing = false;
    healthBGBetter.cameras = [camHUD];
    healthBGBetter.screenCenter(FlxAxes.X);
    healthBGBetter.updateHitbox();
    insert(15, healthBGBetter);

    goFuckUrself = new FlxText(0, 700, 999, "wtf why do u see this");
    goFuckUrself.setFormat(Paths.font("vcr.ttf"), 17, FlxColor.WHITE, "center");
    goFuckUrself.cameras = [camHUD];
    goFuckUrself.screenCenter(FlxAxes.X);
    goFuckUrself.antialiasing = false;
    insert(20, goFuckUrself);

    for (healthSex in [healthBar, healthBarBG]) {
        healthSex.setGraphicSize(Std.int(healthBarBG.width * 1.38));
        healthSex.setGraphicSize(Std.int(healthBarBG.height * 5));
        healthSex.scale.set(1.41, 0.4);
        healthSex.y -= 7;
    }

    healthBarBG.alpha = 0;

}

function update() {

    if (accuracy == -1) {
        accuracy = 0;
    }

    goFuckUrself.text = "Score: "+songScore+" | Misses: "+misses+" | accuracy:"+CoolUtil.quantize(accuracy * 100, 100)+"%";
    goFuckUrself.screenCenter(FlxAxes.X);

}