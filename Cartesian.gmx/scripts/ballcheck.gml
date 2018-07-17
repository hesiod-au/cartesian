//ballcheck(region) - checks if a region (ds_list of tiles) contains any ball objects, returns true if so.



region = argument0;

for (p=0; p<ds_list_size(region); p+=1) {
    for (q=0; q<global.ball_number;q+=1) {
        ballx = (global.ball_arr[q]).x;
        bally = (global.ball_arr[q]).y;
        tile_ref = ds_list_find_value(region,p); 
        min_x = tile_ref[1] * global.obj_scale - global.obj_scale;
        max_x = min_x + 3 * global.obj_scale;
        min_y = tile_ref[0] * global.obj_scale - global.obj_scale;
        max_y = min_y + 3 * global.obj_scale;
        if (ballx > min_x) && (ballx <max_x) && (bally > min_y) && (bally < max_y) {
            return true;
        } 
    }
}
return false;
