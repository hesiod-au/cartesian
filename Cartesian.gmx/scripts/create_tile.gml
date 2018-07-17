var inst;

create_row = argument0;
create_col = argument1;
if argument2 == "conq" {
    inst = instance_create((create_col*global.obj_scale),(create_row*global.obj_scale),obj_tile_conq);
    global.tiles[create_row,create_col] = inst;
    }
if argument2 == "empty" {
    inst = instance_create((create_col*global.obj_scale),(create_row*global.obj_scale),obj_emptytile);
    global.tiles[create_row,create_col] = inst;
    }
if argument2 == "trail" {
    inst = instance_create((create_col*global.obj_scale),(create_row*global.obj_scale),obj_trail_tile);
    global.tiles[create_row,create_col] = inst;
}
    
