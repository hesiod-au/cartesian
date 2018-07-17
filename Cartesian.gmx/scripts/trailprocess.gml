//Only run if the player has finished entering a new tile.
if ((global.step_number % (global.control_steps)) != 0) {return 0};

//Setup a prototype empty array

proto_arr[1] = 0;
    
//Determine where the player is
var tilecol;
var tilerow;
tilecol = (x-8) / global.obj_scale;
tilerow = (y-8) / global.obj_scale;
    
//Lookup what kind of tile that is
    
the_tile = global.tiles[tilerow,tilecol];
switch(object_get_name(the_tile.object_index)) {
    case "obj_emptytile": 
        //If the player has stopped just as they start laying, start them going again.
        if speed == 0 {
            dir = orig_dir;
            if (dir == "left") {
            hspeed = global.move_speed * -1;
            vspeed = 0;
        }
        if (dir == "right") { 
            hspeed = global.move_speed;
            vspeed = 0;
        }   
        if (dir == "up"){ 
            vspeed = global.move_speed * -1;
            hspeed = 0;
        }
        if (dir == "down"){ 
            vspeed = global.move_speed;
            hspeed = 0;
        }
    }
        
        
        
        //The player has entered an empty square, must be laying trail. Set the laying global    
        global.laying = true;
        //Convert this tile to trail: first delete the empty tile
        with (the_tile) {
            instance_destroy();
            }
        //Now create a new trail tile in it's place
        create_tile(tilerow,tilecol,"trail");
        //Now save the tile to be converted later
        ds_queue_enqueue(global.trailtiles, global.tiles[tilerow,tilecol]);
        break;
    case "obj_trail_tile": 
        defeat();
        break;
    case "obj_tile_conq":
        if (global.laying && !(global.end_level == 1)) {
            //The player has returned to conquered ground. First cancel the laying toggle
            global.laying = false;
            //Next convert the trail tiles into conquered ground
            while !(ds_queue_empty(global.trailtiles)) {
                //Get the tile
                a_tile = ds_queue_dequeue(global.trailtiles);
                // Get the tile's x and y position, convert to columns and rows
                the_col = (a_tile.x / global.obj_scale);
                the_row = (a_tile.y / global.obj_scale);
                
                //destroy the trail tile
                with a_tile {
                    instance_destroy();
                    }
                //Create a conq tile in it's place
                create_tile(the_row,the_col,"conq");   
            }
            //Initialisations
            //Empty matrix of checked squares
            for (n=0; n < global.tilerows;n+=1) {
                for (m=0; m<global.tilecols;m+=1) {
                    global.checkedmatrix[n,m] = false;
                }
            }
            // Go through every tile on the board
            for (n = 0; n < global.tilerows; n+=1) {
                for (m = 0; m < global.tilecols; m+=1) {
                    //If a tile is empty
                    if (object_get_name(global.tiles[n,m].object_index)) == "obj_emptytile" {
                        //And it hasn't been checked by any region checks yet
                        if global.checkedmatrix[n,m] = false {
                            // Find the region it belongs to
                            region = findregion(n,m);
                            // check if the region doesn't contain a ball
                            if (!ballcheck(region)) {
                                //Then fill it in
                                fillregion(region);
                            }    
                        }
                    }
                }
            }        
            scoreupdate();
        break;
        }
    }
    
    
