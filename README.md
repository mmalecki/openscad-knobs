# openscad-knobs
Parameteric knobs, with various shapen, fastener/axle-agnostic.

## Installation
```sh
git submodule add https://github.com/mmalecki/openscad-knobs knobs
git submodule update --init
```

## Usage
This project can be used both as a library and a stand-alone knob generator.

### Knob generator
Open the file `knob.scad` in OpenSCAD. Use the customizer to generate a knob to your liking.

### Library

```openscad
use <knobs/knob.scad>;

// For a very basic, round knob:
knob(d = 20, h = 7.5, shape = "round");

translate([ d * 1.5, 0 ]) {
  // For a rounded star-like shape:
  knob(d = d, h = 7.5, shape = "star");
}

// You can add a round spacer to any of these:
translate([ d * 1.5, 0 ]) {
  knob(d = d, h = 7.5, spacer_d = d / 2, spacer_h = 4, shape = "star");
}
```

#### API

##### `knob (d, h, shape, chamfer = 0.5, spacer_d = 0, spacer_h = 0, star_points = 4)`
Draw a knob, face down.

Arguments:
  * `d` (number) - diameter of the base shape of the knob
  * `h` (number) - height of the base shape of the knob
  * `shape` (`"round"` or `"star"`) - shape of the knob (PRs happily accepted for more shapes!)
  * `chamfer` (number) - shape-dependent
  * `stem_d` (number) - stem diameter
  * `stem_h` (number) - stem height
  * `star_points` (number) - if using the `"star"` shape, how many rounded points should the star have
