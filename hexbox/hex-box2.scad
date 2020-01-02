
BASE_THICKNESS = 4;
RADIUS = 40;
WALL_THICKNESS = 5;

linear_extrude(height = 40, twist = 60, slices = 30) {
   difference() {
     offset(r = WALL_THICKNESS+1) {
      circle(RADIUS, center = true, $fn=6);
     }
     offset(r = 1) {
       circle(RADIUS, center = true, $fn=6);
     }
   }
 }
 
 translate([0, 0, -BASE_THICKNESS+1])
 linear_extrude(height=BASE_THICKNESS) {
     offset(r=WALL_THICKNESS+1) { 
         circle(RADIUS, center=true, $fn=6);
     }
 }
 /*
 translate([0, 0, -BASE_THICKNESS/2]) linear_extrude(height=BASE_THICKNESS) {
    circle(r=RADIUS+WALL_THICKNESS+X, center=true, $fn=6);
 }*/