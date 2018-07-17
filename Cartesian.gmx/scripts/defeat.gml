global.paused = true;
global.lives -=0;
room0_init();
room_restart();
if (global.lives < 0) game_end();

