if !(dir == "stop") {
    orig_dir = dir;
    }

if !(global.end_level == 1) {    
    if (keyboard_check(vk_left) || keyboard_check(ord('A')) || (gamepad_axis_value(0,gp_axislh) < -0.5)) dir = "left";
    if (keyboard_check(vk_right) || keyboard_check(ord('D')) || (gamepad_axis_value(0,gp_axislh) > 0.5)) dir = "right";
    if (keyboard_check(vk_up) || keyboard_check(ord('W')) || (gamepad_axis_value(0,gp_axislv) < - 0.5)) dir = "up";
    if (keyboard_check(vk_down) || keyboard_check(ord('S')) || (gamepad_axis_value(0,gp_axislv) > 0.5)) dir = "down";
    if (global.laying == false) {
        if (keyboard_check(vk_space) || gamepad_button_check(0,gp_face1)) dir = "stop";
        }
}    

curr_col = ((x - (global.obj_scale /2)) / global.obj_scale);
curr_row = ((y - (global.obj_scale /2)) / global.obj_scale);

curr_col = max(curr_col,1);
curr_col = min(curr_col,global.tilecols - 2);
curr_row = max(curr_row,1);
curr_row = min(curr_row,global.tilerows - 4);


if (global.laying == true) {
    if ((orig_dir == "left") && (dir =="right")) dir = "left"; 
    if ((orig_dir == "right") && (dir =="left")) dir = "right";
    if ((orig_dir == "up") && (dir =="down")) dir = "up";
    if ((orig_dir == "down") && (dir =="up")) dir = "down";
}


if ((global.step_number % global.control_steps) == 0) {
    if (dir == "left") {
        if !(object_get_name(global.tiles[curr_row, curr_col+1].object_index) == "obj_trail_tile") {
            hspeed = global.move_speed * -1;
            vspeed = 0;
        }
    }    
    if (dir == "right") { 
        if !(object_get_name(global.tiles[curr_row, curr_col-1].object_index) == "obj_trail_tile") {
            hspeed = global.move_speed;
            vspeed = 0;
        }
    }   
    if (dir == "up") {
        if !(object_get_name(global.tiles[curr_row -1, curr_col].object_index) == "obj_trail_tile") { 
            vspeed = global.move_speed * -1;
            hspeed = 0;
        }
    }
    if (dir == "down") { 
        if !(object_get_name(global.tiles[curr_row+1, curr_col].object_index) == "obj_trail_tile") {     
            vspeed = global.move_speed;
            hspeed = 0;
       }
    }
    if (dir == "stop" && global.laying == false){
        vspeed = 0;
        hspeed = 0;
    }
}
             
