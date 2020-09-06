module attachment_column() {
    difference() {
      translate([0, 0, 35]) cylinder(60, 6, 12, true);
      translate([0, 0, 50]) rotate([90,0,0]) cylinder(30, 7.5, 7.5, true);
    }
}

module perforation() {
  cylinder(30, r1 = 2, r2= 2, center=true);
}

module attachment_hole() {
  rotate([90,0,0]) cylinder(30, 3, 3, true);
}

union () {
  difference() {
    cube([190, 90, 25], true);
    translate([0,0,3]) cube([185, 85, 25], true); // Remove slightly smaller box

    // base perforations for water to drain
    for (i =[0:34]) {
      for (j =[0:14]) {
        translate([-85 + i*5, -35 + j*5,0]) perforation();
      }
    }

    //contingency attachment points in case it slants
    translate([61.5, 40, 5])  attachment_hole();
    translate([-61.5, 40, 5])  attachment_hole();

  }
  //Attachments
  translate([61.5,-40,0]) {
    attachment_column();
  }

  translate([-61.5,-40,0]) {
    attachment_column();
  }
}
