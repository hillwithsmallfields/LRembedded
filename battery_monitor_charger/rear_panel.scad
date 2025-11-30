/* Rear panel of garage computer / trickle charger */

module iec(width, height, corner_depth, hole_spacing) {
     union([]) {
          translate([-width/2, -height/2])
               polygon(points=[[0, 0],
                               [0, height - corner_depth],
                               [corner_depth, height],
                               [width - corner_depth, height],
                               [width, height - corner_depth],
                               [width, 0],
                               [0, 0]]);
          translate([-hole_spacing/2, 0]) circle(d=4);
          translate([hole_spacing/2, 0]) circle(d=4);
     }
}

module mains_inlet() {
     iec(28, 19, 5, 40);
}

module mains_outlet() {
     iec(33, 25, 8, 40);
}

module rect_hole_with_bolt_holes(width, height, hole_spacing, hole_offset, hole_diameter) {
     translate([-width/2, -height/2]) square([width, height]);
     translate([0, -height/2 + hole_offset]) {
          translate([-hole_spacing/2, 0]) circle(d=hole_diameter);
          translate([hole_spacing/2, 0]) circle(d=hole_diameter);
     }
}

module ethernet() {
     rect_hole_with_bolt_holes(17, 14, 28, 6, 3);
}

module USB() {
     rect_hole_with_bolt_holes(15, 7, 29, 3.5, 3);
}

module HDMI() {
     rect_hole_with_bolt_holes(15, 5, 27.5, 2.5, 3);
}

module rear_panel() {
     width = 234;
     height = 97;
     corner_hole_inset = 4.5;
     corner_hole_diameter = 3;
     difference() {
          square([width, height]);
          translate([0, 75]) {
               translate([30, 0]) mains_inlet();
               translate([80, 0]) mains_outlet();
               translate([130, 0]) mains_outlet();
               translate([170, 0]) rotate([0, 0, 90]) ethernet();
               translate([190, 0]) rotate([0, 0, 90]) HDMI();
               translate([205, 0]) rotate([0, 0, 90]) USB();
               translate([220, 0]) rotate([0, 0, 90]) USB();
               }
          translate([corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
     }
}

rear_panel();
