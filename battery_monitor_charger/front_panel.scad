
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
     difference() {
          square([234, 97]);
          translate([15, 40]) LCD_cutout();
          translate([177, 70]) large_connector();
          translate([170, 40]) small_connector();
          translate([200, 40]) small_connector();
          translate([120, 40]) analog_meter();
          }
}

front_panel();
