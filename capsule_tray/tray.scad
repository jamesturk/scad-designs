/*
  capsule size:
    height: 9mm without cap, 11mm with (+.1mm)
    diameter: 10.5mm
  tray size:
    diameter: 55mm
*/
CAP_EMPTY_HEIGHT = 9;
CAP_FULL_HEIGHT = 11;
CAP_DIAMETER = 10.5;
RADIUS = 28;  // base on tray size / 2
LIP_RADIUS = 1;


module capsule() {
    tolerance = 0.5;
    cylinder(h=CAP_FULL_HEIGHT, r=CAP_DIAMETER/2+tolerance);
}

module cylinder_with_lip(h, r, lip_h, lip_r) {
    difference() {
        cylinder(h=h+lip_h, r=r+lip_r);
        translate([0, 0, h]) {
            cylinder(h=lip_h, r=r);
        }
    }
}

module tray() {
    bottom_thickness = 1;
    capsules = 4;
    lip_height = 3;
    height = CAP_FULL_HEIGHT + bottom_thickness;
    
    //union() {
    
    // tray 
    difference() {
        cylinder_with_lip(r=RADIUS, h=height, lip_h=lip_height, lip_r=LIP_RADIUS);
  
        for(deg = [0 : 360 / capsules : 360]) {
            rotate(deg, [0, 0, 1])
            translate([0, RADIUS/2, bottom_thickness])
            capsule();
        }
        
    }
    
    // bottom foot
    translate([0,0,-lip_height]) cylinder(h=lip_height-0.1, r=RADIUS-LIP_RADIUS);
    
    // label
    //translate([0, 0, height]) rotate([0,0,0]) linear_extrude(0.1) {
    //    text("I", halign="center", valign="center"); 
    //}
    //}
}



module lid() {
    lid_thickness = 1;
    lid_lip = 1;

    color("#00ff00") {
        union() {
            difference() {
               cylinder(h=4, r=RADIUS+LIP_RADIUS*2);
               cylinder(h=3, r=RADIUS+LIP_RADIUS);
            }
            translate([0, 0, 1]) cylinder(h=3, r=RADIUS-1);
        }
    }
}

/* do the rendering based on provided mode */
mode = 1;
if (mode == 1) {
  tray();
} else if (mode == 2) {
  lid();
} else {
  tray();
  translate([0, 0, 20]) {
    lid();
  }
}
