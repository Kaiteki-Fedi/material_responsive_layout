import 'package:material_responsive_layout/src/breakpoint.dart';

/// Breakpoints defined by Material 2.
///
/// See also: <https://material.io/design/layout/responsive-layout-grid.html#breakpoints>
enum M2Breakpoint implements Breakpoint {
  /// Extra-small (phone)
  xsmall(margin: 16, bodyWidth: null, columns: 4),

  /// Small (tablet)
  small(margin: 32, bodyWidth: null, columns: 8),

  /// Small (tablet)
  small2(margin: null, bodyWidth: 840, columns: 12),

  /// Medium (laptop)
  medium(margin: 200, bodyWidth: null, columns: 12),

  /// Large (desktop)
  large(margin: null, bodyWidth: 1040, columns: 12);

  @override
  final int columns;

  @override
  final double? margin;

  /// The body width of this breakpoint. If null, the body fills the remaining
  /// space of the screen.
  final double? bodyWidth;

  const M2Breakpoint({
    required this.columns,
    required this.margin,
    required this.bodyWidth,
  });

  factory M2Breakpoint.fromWidth(num width) {
    if (width >= 1440) return large;
    if (width >= 1240) return medium;
    if (width >= 905) return small2;
    if (width >= 600) return small;
    return xsmall;
  }
}

extension M2BreakpointExtensions on Breakpoint {
  M2Breakpoint? get m2 => this is M2Breakpoint ? this as M2Breakpoint : null;
}

extension M2BreakpointOperators on M2Breakpoint {
  /// Whether this [M2Breakpoint] is larger than [other].
  bool operator >(Breakpoint other) => index > (other as M2Breakpoint).index;

  /// Whether this [M2Breakpoint] is larger than or equal to [other].
  bool operator >=(Breakpoint other) => index >= (other as M2Breakpoint).index;

  /// Whether this [M2Breakpoint] is smaller than [other].
  bool operator <(Breakpoint other) => index < (other as M2Breakpoint).index;

  /// Whether this [M2Breakpoint] is smaller than or equal to [other].
  bool operator <=(Breakpoint other) => index <= (other as M2Breakpoint).index;
}
