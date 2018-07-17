if (((global.step_number % global.control_steps) == 0)) {
    if ((x < 1) || (x>(room_width - global.obj_scale - 1))) {
        hspeed *= -1;
        if (x < 1) {x = 0;}
        else {x = (room_width - global.obj_scale);}
    }
    else if ((y < 1) || (y>(room_height - (3 *global.obj_scale) - 1))) {
        vspeed *= -1;
        if (y < 1) {y = 0;}
        else {y = (room_height - ( 3 * global.obj_scale));}
    }  
    else {
        tile_row = (y / global.obj_scale);
        tile_col = (x / global.obj_scale);
        proto_arr[1] = 0;
        var up = proto_arr;
        up[1] = 0;
        up[0] = -1;
        var down = proto_arr;
        down[1] = 0;
        down[0] = 1;
        var left = proto_arr;
        left[1] = -1;
        left[0] = 0;
        var right = proto_arr;
        right[1] = 1;
        right[0] = 0;
            
        udlr = ds_list_create();
        ds_list_add(udlr,up,down,left,right);
        for (hbc = 0; hbc <4; hbc+=1) {
            udlr_item = ds_list_find_value(udlr,hbc);
            newrow = tile_row + udlr_item[0];
            newcol = tile_col + udlr_item[1];
            if (newcol > -1 && newcol < global.tilecols && newrow > -1 && newrow <global.tilerows) {  
                if (object_get_name(global.tiles[newrow,newcol].object_index) == "obj_emptytile") {
                    if (hbc <2) {
                    vspeed *=-1;
                    }
                    else {
                    hspeed *=-1;
                    }
                }
            }    
        }
    }
    
    
}
