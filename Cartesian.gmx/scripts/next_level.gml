global.level +=1;
global.lives +=1;
global.ball_number +=1;
if (global.level == 11) {
    global.ball_speed = 12;
    global.ball_number = 1;
}
if (global.level == 21) {
    global.ball_number = 1;
    global.hunters = 2;
}
global.paused = true;
room0_init();
room_restart();

