/* Front panel of garage computer / trickle charger */

include <dimensions.scad>

module LCD_cutout() {
     square([lcd_width, lcd_height]);
     translate([lcd_hole_inset_x, -lcd_hole_outset_y]) circle(d=lcd_boltsize);
     translate([lcd_hole_inset_x, height+lcd_hole_outset_y]) circle(d=lcd_boltsize);
     translate([lcd_width-lcd_hole_inset_x, -lcd_hole_outset_y]) circle(d=lcd_boltsize);
     translate([lcd_width-lcd_hole_inset_x, height+lcd_hole_outset_y]) circle(d=lcd_boltsize);
}

module button(x, y) {
     translate([x, y]) circle(d=12);
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
          square([panel_width, panel_height]);
          translate([10, 40]) LCD_cutout();
          translate([75, 20]) button();
          translate([95, 20]) button();
          translate([177, 70]) large_connector();
          translate([172, 40]) small_connector();
          translate([202, 40]) small_connector();
          translate([120, 40]) analog_meter();
          translate([panel_corner_hole_inset, panel_corner_hole_inset]) circle(d=panel_corner_hole_diameter);
          translate([panel_width-panel_corner_hole_inset, panel_corner_hole_inset]) circle(d=panel_corner_hole_diameter);
          translate([panel_corner_hole_inset, panel_height-panel_corner_hole_inset]) circle(d=panel_corner_hole_diameter);
          translate([panel_width-panel_corner_hole_inset, panel_height-panel_corner_hole_inset]) circle(d=panel_corner_hole_diameter);
          }
}

front_panel();
