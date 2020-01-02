
big_side_thickness = 3;
side_thickness = 1;
box_x=126; // back to 130
box_y=70;
box_z=22;
lid_z=2;

slot_size=24;

module Dip(n=1) {
    translate([side_thickness*n+slot_size*(n-1), big_side_thickness, 0])
    cube(size=[slot_size, box_y-big_side_thickness*2, box_z-side_thickness]);
}

module Lid() {
    difference() { 
        cube(size=[box_x-side_thickness/2, box_y-big_side_thickness, lid_z]);
        
        translate([10, 10, 1.5]) linear_extrude(height = 0.5) {
            text(text="VYE", font="Bitter", size = 12);
        }
    }
}

module Box() {
    difference() {
        cube(size=[box_x, box_y, box_z]);
        
        // shorten each shelf
        translate([side_thickness, big_side_thickness, 0]) 
        cube(size=[box_x-side_thickness, box_y-big_side_thickness*2, 3]);
        
        // create slide
        translate([side_thickness/2, big_side_thickness/2, side_thickness])
        cube(size=[box_x-side_thickness/2, box_y-big_side_thickness, lid_z]);
        
        Dip(1);
        Dip(2);
        Dip(3);
        Dip(4);
        Dip(5);
    }
}


sb_x = 26;

module SmallBox() {
    difference() {
        cube(size=[sb_x, box_y, box_z]);
        Dip(1);
        
        translate([side_thickness, big_side_thickness, 0]) 
        cube(size=[sb_x-side_thickness, box_y-big_side_thickness*2, 3]);
        
        translate([side_thickness/2, big_side_thickness/2, side_thickness])
        cube(size=[sb_x-side_thickness/2, box_y-big_side_thickness, lid_z]);
    }
}

module SmallLid() {
    difference() {
        cube(size=[sb_x-side_thickness, box_y-big_side_thickness-1, lid_z-1]);
    }
}

//SmallBox();
SmallLid();


//Box();
//Lid();
        


