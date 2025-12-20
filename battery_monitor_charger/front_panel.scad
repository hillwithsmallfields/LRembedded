/* Front panel of garage computer / trickle charger */

module LCD_cutout() {
     width = 97;
     height = 40;

     hole_inset_x = 2;
     hole_outset_y = 7.5;
     boltsize = 3;

     square([width, height]);
     translate([hole_inset_x, -hole_outset_y]) circle(d=boltsize);
     translate([hole_inset_x, height+hole_outset_y]) circle(d=boltsize);
     translate([width-hole_inset_x, -hole_outset_y]) circle(d=boltsize);
     translate([width-hole_inset_x, height+hole_outset_y]) circle(d=boltsize);
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
          translate([10, 40]) LCD_cutout();
          translate([177, 70]) large_connector();
          translate([172, 40]) small_connector();
          translate([202, 40]) small_connector();
          translate([120, 40]) analog_meter();
          translate([corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
          translate([width-corner_hole_inset, height-corner_hole_inset]) circle(d=corner_hole_diameter);
          }
}

front_panel();
