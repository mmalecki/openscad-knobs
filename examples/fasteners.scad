use <../catchnhole/catchnhole.scad>;
use <../knob.scad>;

$fn = 40;

d = 20;
h = 7.5;

// This isn't built-in, because everyone has a different favorite bolt & nut library.

// For a very basic, round knob with a spot for either a M5 nut or head of
// an M5 hex bolt (they are the same size!):
difference() {
  knob(d = d, h, shape = "round");
  bolt("M5", length = h);
  nutcatch_parallel("M5");
}
