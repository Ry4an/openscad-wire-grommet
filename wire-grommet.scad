$fa = 1;
$fs = 0.4;
wire_radius=2;
hole_radius=7.5;
length=39;
angle=22;
lip_width=3;
lip_thickness=3;
//cylinder(h=length, r=wire_diameter);
module solid_peg() {
    cylinder(h=length, r=hole_radius, center=true);
    translate([0,0,length/-2])
        rotate([0,angle,0])
        cylinder(h=lip_thickness, r=hole_radius+lip_width, center=true);
}
module hollow_peg() {
    rotate([90,0,0])
    difference() {
        solid_peg();
        cylinder(h=length+lip_thickness+2,r=    wire_radius, center=true);
    }
}
module two_hollow_pegs() {
    hollow_peg();
    translate([hole_radius*5,0,0])
        rotate([0, 180, 0])
        hollow_peg();
}
difference() {
    two_hollow_pegs();
    translate([-2*length, -2*length,-4*hole_radius])
        cube([length*4, length*4, hole_radius*4]);
}