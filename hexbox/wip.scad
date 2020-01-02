
module polygon3d(r=20, h=10, twist=0) {
    n = 6;
    points = [ for (d = [0 : 360/n : 360-1]) [ r*sin(d), r*cos(d) ] ];
    linear_extrude(height = h, center = true, convexity = 10, twist = twist)
    polygon(points=points);
}

module box3d(r=50, h=40, wall_thickness=10) {
    difference() {
        polygon3d(r, h, twist=20);
        translate([0, 0, wall_thickness/2]) polygon3d(r-wall_thickness, h, twist=20);
    }
        
    
}

module halfd20(side=10) {
    points = [ for (d = [0 : 360/n : 360-1]) [ r*sin(d), r*cos(d), 0 ] ];
}


RADIUS = 50;
HEIGHT = 30;

union() {
    difference() {
        box3d(r=RADIUS, h=HEIGHT);  
        for(i = [0:10]) {
             translate([0, 0, HEIGHT/2-i]) polygon3d(RADIUS-i, 1, twist=0);
         }
     }

    for(i = [0:10]) {
         *translate([0, 0, HEIGHT/2-10-i]) polygon3d(RADIUS+i, 1, twist=0);
    }
 }