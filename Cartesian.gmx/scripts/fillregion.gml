//fillregion(region) - gets a region (ds_list of tile arrays [r,c]) and converts them to conq

for (o=0; o<ds_list_size(region); o+=1) {
    a_tile = ds_list_find_value(region,o);
    the_col = a_tile[1];
    the_row = a_tile[0];
    //get the tile_id
    tile_id = global.tiles[the_row,the_col]       
    //destroy the empty tile
    with tile_id {
        instance_destroy();
    }
    //Create a conq tile in it's place
    create_tile(the_row,the_col,"conq");   
}

