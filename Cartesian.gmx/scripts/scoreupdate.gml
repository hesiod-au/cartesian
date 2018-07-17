total_empty=0.0;
total_conq=0.0;
for (score_rows = 0; score_rows < global.tilerows; score_rows += 1) {
    for (score_cols = 0; score_cols < global.tilecols; score_cols += 1) {
        if (object_get_name(global.tiles[score_rows,score_cols].object_index) == "obj_emptytile") {
            total_empty +=1;
        }
        else {
            total_conq +=1;
        }
    }
}
complete = total_conq / (total_empty + total_conq);

global.temp_score = round(global.level_score + (total_conq * (10 + global.ball_number) /100));

if (complete > 0.7) {
    global.score = global.temp_score + global.timer;
    victory();
}

