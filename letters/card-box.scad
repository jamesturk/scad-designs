
floor_height = 2;
side_thickness = 2;
card_width = 66;
shelf_size = 22;
shelf_z = 25;

// interior depth of top box is shelf_z, we need to make sure there is room for 36mm inside
lid_z = 36 - shelf_z;
box_x = card_width+side_thickness*2;
box_y = shelf_size*3 + side_thickness*4;

/*
difference() {
    cube(size = [
         box_x,
         box_y,
         shelf_z+floor_height
    ]);

    translate([side_thickness,side_thickness,floor_height]) 
    cube(size = [card_width, shelf_size, shelf_z]);
    
    translate([side_thickness,side_thickness*2+shelf_size,floor_height]) 
    cube(size = [card_width, shelf_size, shelf_z]);
    
    translate([side_thickness,side_thickness*3+shelf_size*2,floor_height]) 
    cube(size = [card_width, shelf_size, shelf_z]);
}

// lift lid just slightly off the top
translate([0, 0, shelf_z+floor_height+1])
*/

difference() {
    cube(size=[box_x, box_y, lid_z+side_thickness]);
    
    translate([side_thickness, side_thickness, 0])
    cube(size=[box_x-side_thickness*2, box_y-side_thickness*2, lid_z]);
    
    translate([10,10,lid_z])
    linear_extrude(2) {     text("letters"); }

}





