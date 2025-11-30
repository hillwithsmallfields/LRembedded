/* Front panel of garage computer / trickle charger */

module LCD_cutout() {
     square([97, 38]);
}

module large_connector() {
     square([38, 17]);
}

module small_connector() {
     square([22, 17]);
}

module analog_meter() {
     diameter = 37.7;
     holes_h = 31;
     holes_v = 32;
     boltsize = 3;

     translate([diameter/2, diameter/2]) {
          circle(d=diameter);
          translate([-holes_h/2, -holes_v/2]) circle(d=boltsize);
          translate([holes_h/2, -holes_v/2]) circle(d=boltsize);
          translate([-holes_h/2, holes_v/2]) circle(d=boltsize);
          translate([holes_h/2, holes_v/2]) circle(d=boltsize);
     }
}

module front_panel() {
     width = 234;
     height = 97;
     corner_hole_inset = 4.5;
     corner_hole_diameter = 3;
     difference() {
          square([width, height]);
          translate([15, 40]) LCD_cutout();
          translate([177, 70]) large_connector();
          translate([170, 40]) small_connector();
          translate([200, 40]) small_connector();
          translate([120, 40]) analog_meter();
          translate([corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
          }
}

front_panel();
