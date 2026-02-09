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

module multi_outlet(n) {
     for (i = [0:n-1]) {
          translate([i*50, 0]) mains_outlet();
     }
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

module multi_ethernet(n) {
     for (i = [0:n-1]) {
          translate([i*50, 0]) ethernet();
     }
}

module USB() {
     rect_hole_with_bolt_holes(15, 7, 29, 3.5, 3);
}

module multi_USB(n) {
     for (i = [0:n-1]) {
          translate([i*15, 0]) rotate([0, 0, 90]) USB();
     }
}

module HDMI() {
     rect_hole_with_bolt_holes(15, 5, 27.5, 2.5, 3);
}

module audio() {
     circle(d=6);
}

module rear_panel() {
     width = 234;
     height = 97;
     corner_hole_inset = 4.5;
     corner_hole_diameter = 3;
     difference() {
          square([width, height]);
          translate([0, 75]) {
               translate([200, 0]) mains_inlet();
               translate([35, 0]) multi_outlet(2);
               translate([125, 0]) multi_USB(3);
               }
          translate([0, 50]) {
               translate([25, 0]) multi_ethernet(3);
               translate([180, 0]) HDMI();
               translate([210, 0]) audio();
          }
          translate([corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
     }
}

rear_panel();
