# `material_responsive_layout`

A library implementing the [Material Design guidelines for layout](https://material.io/design/layout/understanding-layout.html).

## Features

- Support for both Material 2 and 3 specifications of responsive layout grids
- 

## Usage

Simply use the `BreakpointBuilder` widget to get a `Breakpoint`. `Breakpoint` is an abstract class implemented by `M2Breakpoint` and `M3Breakpoint`. You can easily get a casted version using the `.m2` and `.m3` property extensions.

```dart
Widget build(BuildContext context) {
  return BreakpointBuilder(
    builder: (context, constraints, breakpoint) {
      return Center(
        child: Text(breakpoint.columns.toString()),
      );
    },
  );
}
```

Alternatively, you can directly get a `Breakpoint` from either `M2Breakpoint` or `M3Breakpoint` using the `.fromWidth` factory constructor.

## Additional information

This package is developed primarily for [Kaiteki](https://github.com/Kaiteki-Fedi/Kaiteki) but can be used in other projects, although no support is provided for that.

Issues and contributions are welcome.