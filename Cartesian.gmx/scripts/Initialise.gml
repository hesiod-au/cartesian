global.obj_scale = 16;
global.move_speed = 8;
global.control_steps= global.obj_scale / global.move_speed;
global.step_number =0;
global.ball_number = 1;
global.tiles = 0;
global.trailtiles = ds_queue_create();
global.laying = false;
global.lives = 2;
global.paused = false;
global.score = 0.0;
global.level = 1;
global.ball_speed = 8;
global.end_level = 0;
global.hunters = 1;

