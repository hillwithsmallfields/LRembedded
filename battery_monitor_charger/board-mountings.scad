module ethernet_hub_mounting() {
     /* hole and notch are 79mm apart, 19mm from back of board */
     translate([5, 20]) {
          circle(d=3);
          translate([79, 0]) circle(d=3);
     }
}

thickness = 3;

module PLA_holder_slots() {
     /* Power Line Adaptor board is 58mm x 45mm */
     translate([0, 20]) square([thickness, 20]);
     translate([12.5, 0]) square([20, thickness]);
     translate([45, 20]) square([thickness, 20]);
}

tab_width = 20;
tab_depth = thickness * 2;;

module holder_plate(width) {
     union() {
          translate([0, tab_depth]) square([width, 25]);
          translate([(width-tab_width)/2, 0]) square([tab_width, tab_depth]);
          }
}

module corner_holes(width, height, diameter, inset) {
     translate([inset, inset]) circle(d=diameter);
     translate([width-inset, inset]) circle(d=diameter);
     translate([inset, height-inset]) circle(d=diameter);
     translate([width-inset, height-inset]) circle(d=diameter);
}

module relays_board() {
     /* 76mm x 56mm with M3 holes 3mm from corners */
     corner_holes(76, 56, 3, 3);
}

module SSR_board() {
     /* Solid State Relays board is 58mm x 55m with M4 holes 3mm from corners */
     corner_holes(58, 55, 4, 3);
}

module board_mounting_plate() {
     difference() {
          square([240, 160]);
          translate([10, 0]) square([100, 10]); /* for LCD */
          translate([120, 0]) square([38, 25]); /* for panel meter */
          translate([120, 120]) circle(d=35);   /* for wires and heat to pass through */
          translate([180, 120]) circle(d=35);   /* for wires and heat to pass through */
          translate([150, 40]) ethernet_hub_mounting();
          translate([95, 40]) PLA_holder_slots();
          translate([15, 15]) relays_board();
          translate([15, 80]) SSR_board();
     }
}

module holder_plates() {
     translate([0, 165]) {
          holder_plate(58);
          translate([65,0]) holder_plate(45);
          translate([115, 0]) holder_plate(58);
     }
}

board_mounting_plate();
holder_plates();
