//Pause all the moving objects in the game
global.end_level = 1;
with (global.player) {
    speed = 0;
    dir = "";
    }
with (global.hunter[0]) {
    speed = 0;
    }
if global.hunters == 2 {
    with (global.hunter[1]) {
    speed = 0;
    }
}
for (ball_count = 0; ball_count < global.ball_number; ball_count++) {
    with (global.ball_arr[ball_count]) {
        speed=0;
        }
}
