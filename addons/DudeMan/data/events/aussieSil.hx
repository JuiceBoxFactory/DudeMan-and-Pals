import openfl.geom.ColorTransform;

function onEvent(e) {
    if (e.event.name == "aussieSil"){
        if (e.event.params[0] == true || e.event.params[0] == null){
            boyfriend.colorTransform.color = e.event.params[1];
            dad.colorTransform.color = e.event.params[1];
            gf.colorTransform.color = e.event.params[1];
        } else if (e.event.params[0] == false){
            boyfriend.colorTransform = new ColorTransform();
            dad.colorTransform = new ColorTransform();
            gf.colorTransform = new ColorTransform();
        }
    }
}