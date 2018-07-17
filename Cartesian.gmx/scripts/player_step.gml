if (x < (global.obj_scale /2)) {
    x = (global.obj_scale /2);
    speed = 0;
    dir ="";
    }
if (x>room_width - (global.obj_scale /2)) {
    x = room_width - (global.obj_scale /2);
    speed = 0;
    dir="";
    }
if (y < (global.obj_scale /2)) {
    y = (global.obj_scale /2);
    speed = 0;
    dir ="";
    }
if (y>(room_height - (2 * global.obj_scale) -(global.obj_scale /2 ))) {
    y = room_height - (2 * global.obj_scale) - (global.obj_scale /2);
    speed = 0;
    dir="";
    }

