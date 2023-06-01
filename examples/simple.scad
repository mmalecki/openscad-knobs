use <../knob.scad>;

$fn = 40;

d = 20;
// For a very basic, round knob:
knob(d = d, h = 7.5, shape = "round");

translate([ d * 1.5, 0 ]) {
  // For a rounded star-like shape:
  knob(d = d, h = 7.5, shape = "star");
}

// You can add a round spacer to any of these:
translate([ d * 1.5, 0 ]) {
  knob(d = d, h = 7.5, stem_d = d / 2, stem_h = 4, shape = "star");
}
