use <catchnhole/catchnhole.scad>

$fn = 50;

/* [ Knob ] */
head_d = 32;
head_h = 10;

/* [ Knob shape ] */
shape = "star";  // ["star", "round"]
chamfer = 0.5;

/* [ Star shape ] */
star_points = 4;

/* [ Spacer ] */
stem_d = 15;
stem_h = 5;

/* [ Nut ] */
nut = "no";

total_h = head_h + stem_h;

module star_shape (d, h, points = 4, chamfer = 0.5) {
  point_d = d / 2;
  outset = point_d / 2;
  for (i = [0:points - 1]) {
    rotate([ 0, 0, i * (360 / points) ]) translate([ outset, 0, 0 ]) {
      cylinder(d2 = point_d, d1 = point_d - 2 * chamfer, h = chamfer);
      translate([ 0, 0, chamfer ]) cylinder(d = point_d, h = h - chamfer);
    }

    round_shape(3 * outset, h, chamfer);
  }
}

module round_shape (d, h, chamfer = 0.5) {
  cylinder(d2 = d, d1 = d - 2 * chamfer, h = chamfer);
  translate([ 0, 0, chamfer ]) cylinder(d = d, h = h - chamfer);
}

module knob (
  d,
  h,
  shape,
  chamfer = 0.5,
  stem_d = 0,
  stem_h = 0,
  star_points = 4,
  center = false
) {
  translate([ 0, 0, center ? -(h + stem_h) / 2 : 0 ]) {
    difference() {
      union() {
        if (shape == "star") {
          star_shape(d, h, points = star_points, chamfer = chamfer);
        } else if (shape == "round") {
          round_shape(d, h, chamfer = chamfer);
        }

        if (stem_h != 0) {
          translate([ 0, 0, h ]) {
            cylinder(d = stem_d, h = stem_h);
          }
        }
      }

      translate([ 0, 0, total_h ]) children();
    }
  }
}

knob(head_d, head_h, shape, chamfer, stem_d, stem_h, star_points) {
  if (nut != "no") {
    translate([ 0, 0, -nut_height(nut) ]) nutcatch_parallel(nut);
  }
}
