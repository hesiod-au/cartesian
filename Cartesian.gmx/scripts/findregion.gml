//findregion(row,column) returns region of empty tiles connected to initial tile.



//Load in the row and column that starts the region
startrow = argument0;
startcol = argument1;

// Empty prototype array
proto_arr[1] = 0;

//Create a ds_list of up, down, left and right cells

var up = proto_arr;
up[1] = 0;
up[0] = -1;
var down = proto_arr;
down[1] = 0;
down[0] = 1;
var left = proto_arr;
left[1] = -1;
left[0] = 0;
var right = proto_arr;
right[1] = 1;
right[0] = 0;

udlr = ds_list_create();
ds_list_add(udlr,up,down,left,right);


region = ds_list_create();
var item = proto_arr;
item[1] = startcol;
item[0] = startrow;
checkedmatrix[startrow,startcol] = true;
ds_list_add(region, item);
for (k=0; k < ds_list_size(region); k+=1) {
    //Get the item row and column
    item = ds_list_find_value(region,k);
    row = item[0];
    col = item[1];
    // Check each of the cells up down left and right 
    for (l = 0;l<4;l+=1) {
        udlr_item = ds_list_find_value(udlr,l);
        newrow = row + udlr_item[0];
        newcol = col + udlr_item[1];
        // first check it hasn't already been checked
        if (!(global.checkedmatrix[newrow,newcol]) == true) {
            // Then check whether it is empty 
            if (object_get_name(global.tiles[newrow,newcol].object_index) == "obj_emptytile") {
            // If the cell is empty, add it to the region
            newitem = proto_arr;
            newitem[1] = newcol;
            newitem[0] = newrow;
            ds_list_add(region, newitem);
            }
            global.checkedmatrix[newrow,newcol] = true;
        }
    }    
}

return region;
