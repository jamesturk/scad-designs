
module Token(diameter=20, height=5, cut_in=1.5, wall_thickness=2) {
    difference() {
        linear_extrude(height = height) {
            circle(d=diameter, $fn=20);
        }
        linear_extrude(height=cut_in) {
            circle(d=diameter-wall_thickness, $fn=20);
        }
        translate([0,0,height-cut_in]) linear_extrude(height=cut_in) {
            circle(d=diameter-wall_thickness, $fn=fn);
        }
    }
}


module HalfOrb(diameter=6, cut_in=1.5, $fn=20) {
    translate([0, 0, diameter/2]) difference() {
        sphere(d=diameter, $fn=25);
        cylinder(d=diameter, h=3, $fn=25);
    }
}

module Dot(diameter=5, cut_in=1.5) {
    translate([0, 0, 0]) cylinder(d=diameter, h=cut_in, $fn=25);
}

module Coin(number=1, diameter=20, height=5, cut_in=1.5, wall_thickness=2) 
{
    union() {
        Token(diameter=diameter, height=height, cut_in=cut_in,
              wall_thickness=wall_thickness);
        
        if(number == 1 || number >= 4) { 
            //HalfOrb();
            Dot();
        } 
        if(number >= 2) {
            for (i = [0 : 360/(number>=4?(number-1):number) : 359]) {
                rotate([0,0,i]) translate([cut_in*3.5, 0, 0]) Dot();
            }
        }
        translate([0,0,height-cut_in]) linear_extrude(height = cut_in) {
           text(text=str(number), font="Bitter", size = 12, 
            valign="center", halign="center");
        }
    }
}


module TwoSided(side_one="A", side_two="B", diameter=20, height=4, cut_in=1, wall_thickness=2)
{
    union() {
        Token(diameter=diameter, height=height, cut_in=cut_in,
              wall_thickness=wall_thickness);
        translate([0, 0, height-cut_in]) linear_extrude(height=cut_in) {
            text(text=side_one, font="Arial", size=12, valign="center", halign="center");
        }
        mirror([1, 0 ,0]) linear_extrude(height=cut_in) {
            text(text=side_two, font="Arial", size=12, valign="center", halign="center");
        }
    }
}

TwoSided("♪", "♫");

//♪♫♬