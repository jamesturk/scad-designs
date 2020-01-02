/*
 capsule size:
   height: 9mm without cap, 11mm with (+.1mm)
   diameter: 10.5mm
*/
CAP_EMPTY_HEIGHT = 9;
CAP_FULL_HEIGHT = 11;
CAP_DIAMETER = 10.5;

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
    radius = CAP_DIAMETER * 1.8;
    bottom_thickness = 2;
    capsules = 4;
    lip_height = 3;
    height = CAP_FULL_HEIGHT + bottom_thickness;
    
    difference() {
        cylinder_with_lip(r=radius, h=height, lip_h=lip_height, lip_r=1);
  
        for(deg = [0 : 360 / capsules : 360]) {
            rotate(deg, [0, 0, 1])
            translate([0, radius/2, bottom_thickness])
            capsule();
        }
    }
}

tray();
