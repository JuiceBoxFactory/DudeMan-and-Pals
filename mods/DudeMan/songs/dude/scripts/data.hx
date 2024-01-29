import flixel.util.FlxSave;

function create() {

// who sings on the left side in this song
FlxG.save.data.leftSideSinger = "DudeManBF";

// who sings on the right side in this song
FlxG.save.data.rightSideSinger = "BF";

// cateogry for the song ( VS DUDEMAN, VS FRUITY, EXTRAS, COVERS, REMIXES, DAX SHAPED DUEL, etc, please use capitols ! )
FlxG.save.data.categoryName = "VS DUDEMAN";

// name of the song
FlxG.save.data.songName = "Dude";

// composer for the song
FlxG.save.data.composerName = "AussieDoesThings";

}