sheet_thickness = 3;

pi_width = 85;
pi_height = 56;

pi_hole_diameter = 3;
pi_hole_offset = 3.5;

pi_hole_spacing_horizontal = 58;
pi_hole_spacing_vertical = 49;

pi_offset_from_bottom = 15;
pi_offset_from_end = 15;

plate_width = 120;
plate_height = 80;

base_plate_offset = 7.5;

base_plate_width = 60;
base_plate_depth = plate_width;

base_plate_hole_diameter = 3;
base_plate_hole_offset = 6;

module pi_lug(corner) {
     difference() {
          union() {
               circle(r=pi_hole_offset);
               translate([-pi_hole_offset, -pi_hole_offset])
                    if (corner)
                         square([pi_hole_offset, pi_hole_offset*2]);
               translate([-pi_hole_offset, -pi_hole_offset])
                    square([pi_hole_offset*2, pi_hole_offset]);
          }
          circle(d=pi_hole_diameter);
     }
}

module pi_plate() {
     difference() {
          square([plate_width, plate_height]);
          translate([pi_offset_from_end, pi_offset_from_bottom])
               difference() {
               square([pi_width, pi_height]);
               translate([pi_hole_offset, pi_hole_offset])
                    pi_lug(true);
               translate([pi_hole_offset, pi_height - pi_hole_offset])
                    rotate([0,0,270]) pi_lug(true);
               translate([pi_hole_offset+pi_hole_spacing_horizontal, pi_hole_offset])
                    pi_lug(false);
               translate([pi_hole_offset+pi_hole_spacing_horizontal, pi_height - pi_hole_offset])
                    rotate([0,0,180]) pi_lug(false);
          }
          translate([0, base_plate_offset - sheet_thickness/2]) square([plate_width/4, sheet_thickness]);
          translate([plate_width*3/4, base_plate_offset - sheet_thickness/2]) square([plate_width/4, sheet_thickness]);
     }
}

module base_plate_half() {
     difference() {
          square([base_plate_width, base_plate_depth/2]);
          translate([base_plate_offset, base_plate_depth/4]) circle(d=base_plate_hole_diameter);
          translate([base_plate_width - base_plate_offset, base_plate_depth/4]) circle(d=base_plate_hole_diameter);
          boards = 3;
          translate([-sheet_thickness/2, 0])
               for (i=[1:boards])
                    translate([i * base_plate_width/(boards+1), 0]) square([sheet_thickness, plate_width/4]);
     }
}

sprue = 3;

pi_plate();
translate([base_plate_width, plate_height+sprue]) rotate([0, 0, 90]) base_plate_half();
translate([base_plate_width+sprue, plate_height+sprue]) rotate([0, 0, 90]) scale([1, -1]) base_plate_half();
