
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
     iec(26, 18, 5, 40);
}

module mains_outlet() {
     iec(32, 23, 8, 40);
}

module ethernet() {
}

module USB() {
}

module HDMI() {
}

module rear_panel() {
     difference() {
          square([234, 97]);
          /* TODO: fill in locations */
          translate([]) mains_inlet();
          translate([]) mains_outlet();
          translate([]) mains_outlet();
          translate([]) ethernet();
          translate([]) USB();
          translate([]) USB();
          translate([]) HDMI();
          }
}

rear_panel();
