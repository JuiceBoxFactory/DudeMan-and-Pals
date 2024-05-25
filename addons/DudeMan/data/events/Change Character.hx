import funkin.backend.assets.ModsFolder;
import sys.io.FileSystem;
import openfl.display.BitmapData;
import flixel.graphics.FlxGraphic;

class HealthIcon extends FlxSprite {
    public function new(icon:String, isPlayer:Bool) {
        super();
        loadGraphic(Paths.image('icons/' + icon));
    }

    public function changeGraphic(newGraphic:String):Void {
        loadGraphic(Paths.image('icons/' + newGraphic));
    }
}

var dataShit:Array<{name:String, xml:String}> = [];

function preload(imagePath:String) {
    var graphic = FlxG.bitmap.add(Paths.image(imagePath));
    graphic.useCount++;
    graphic.destroyOnNoUse = false;
    graphicCache.cachedGraphics.push(graphic);
    graphicCache.nonRenderedCachedGraphics.push(graphic);
}

function postCreate() {
    for (event in events)
        if (event.name == 'Change Character') {
            var data = {
                name: Assets.exists(Paths.xml('characters/' + event.params[2])) ? event.params[2] : 'bf',
                preloadData: {
                    sprite: '',
                    icon: ''
                },
                xml: ''
            };
            data.preloadData.sprite = data.preloadData.icon = data.name;
            data.xml = Assets.getText(Paths.xml('characters/' + data.name));
            
            var stupidShit = [];
            for (i in ['sprite="', 'icon="']) {
                if (!StringTools.contains(data.xml, i)) continue;
                var index1 = data.xml.indexOf(i);
                var index2 = data.xml.indexOf('"', index1 + i.length);
                stupidShit.push(StringTools.replace(data.xml.substring(index1, index2), i, ''));
            }

            data.preloadData.sprite = stupidShit[0];
            data.preloadData.icon = Assets.exists(Paths.image('icons/' + stupidShit[1])) ? stupidShit[1] : 'face';

            if (FileSystem.isDirectory('mods/' + ModsFolder.currentModFolder + '/images/characters/' + data.preloadData.sprite))
                for (i in Paths.getFolderContent('characters/' + data.preloadData.sprite))
                    preload('characters/' + data.preloadData.sprite + '/' + i);
            else
                preload('characters/' + data.preloadData.sprite);

            preload('icons/' + data.preloadData.icon);

            dataShit.push(data);
        }
}

function onEvent(_)
    if (_.event.name == 'Change Character') {
        {
        var data = dataShit.pop();
        var character:Character = strumLines.members[_.event.params[0]].characters[_.event.params[1]];
        var isPlayer:Bool = strumLines.members[_.event.params[0]].characters[0].isPlayer;
        
        strumLines.members[_.event.params[0]].characters.remove(character);
        remove(character);
        character = new Character(0, 0, data.name, isPlayer);
        stage.applyCharStuff(character, strumLines.members[_.event.params[0]].data.position, _.event.params[1]);
        strumLines.members[_.event.params[0]].characters.insert(_.event.params[1], character);

        if (_.event.params[1] == '0') {
            var icon:HealthIcon = isPlayer ? iconP1 : iconP2;
            if (icon.graphic.key != 'icons/' + data.preloadData.icon) { 
                icon.changeGraphic(data.preloadData.icon);
                icon.y = healthBar.y - (icon.height / 2);
            }

            var leftColor:Int = dad.iconColor != null && Options.colorHealthBar ? dad.iconColor : 0xFFFF0000;
            var rightColor:Int = boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : 0xFF66FF33;
            var colors = [leftColor, rightColor];
            healthBar.createFilledBar((PlayState.opponentMode ? colors[1] : colors[0]), (PlayState.opponentMode ? colors[0] : colors[1]));
            healthBar.updateBar();
        }
    }
}
