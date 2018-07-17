global.laying = false;
ds_queue_clear(global.trailtiles);
global.tilecols = room_width / global.obj_scale;
global.tilerows = (room_height / global.obj_scale) - 2;
global.tiles[global.tilerows -1,global.tilecols -1] = 0;


    

for (i = 0; i < global.tilerows; i+=1) {
    for (j = 0; j < global.tilecols; j+=1) {
        if ((i < 2) || (i > global.tilerows - 3)) {
            create_tile(i,j,"conq");
            }
        else if ((j<2) || (j > global.tilecols -3)) {
            create_tile(i,j,"conq");     
        }
        else {
            create_tile(i,j,"empty");
        }
    }
}

global.ball_arr[global.ball_number] = 0; 

for (i=0;i<global.ball_number;i+=1) { 
    spawn_x = irandom(room_width - 8 * global.obj_scale) + 4 * global.obj_scale;
    spawn_x = spawn_x - (spawn_x % global.obj_scale);
    spawn_y = irandom(room_height - 8* global.obj_scale) + 4 * global.obj_scale;
    spawn_y = spawn_y- (spawn_x % global.obj_scale);    
    global.ball_arr[i] = instance_create(spawn_x, spawn_y, obj_ball);
}

global.hunter[0] = instance_create((room_width - 2* global.obj_scale),(room_height - 2* global.obj_scale), obj_hunter);
if global.hunters = 2 {
    global.hunter[1] = instance_create((room_width - 4* global.obj_scale),(room_height - 2* global.obj_scale), obj_hunter);
    global.hunter[1].hspeed *= -1;
    global.hunter[1].vspeed *= -1;
}
global.player = instance_create((round((global.tilecols / 2))* global.obj_scale - (global.obj_scale/2)),0, obj_player);

global.paused = false;
global.timer = 20 + ((global.ball_number * global.ball_number)/2) * 5; 
global.level_score = global.score;
global.temp_score = round(global.score);
global.end_level = 0;
