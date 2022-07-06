import 'package:material_responsive_layout/src/breakpoint.dart';

/// Breakpoints defined by Material 3.
///
/// See also: <https://m3.material.io/foundations/adaptive-design/large-screens/overview#7639d39b-e03a-4e3e-aba4-ef0a0b390082>
enum M3Breakpoint implements Breakpoint {
  compact(4, 8),
  medium(12, 12),
  expanded(12, 32);

  @override
  final int columns;

  @override
  final double margin;

  const M3Breakpoint(this.columns, this.margin);

  factory M3Breakpoint.fromWidth(num width) {
    if (width >= 840) return expanded;
    if (width >= 600) return medium;
    return compact;
  }
}

extension M3BreakpointExtensions on Breakpoint {
  M3Breakpoint? get m3 => this is M3Breakpoint ? this as M3Breakpoint : null;
}

extension M3BreakpointOperators on M3Breakpoint {
  /// Whether this [M3Breakpoint] is larger than [other].
  bool operator >(Breakpoint other) => index > (other as M3Breakpoint).index;

  /// Whether this [M3Breakpoint] is larger than or equal to [other].
  bool operator >=(Breakpoint other) => index >= (other as M3Breakpoint).index;

  /// Whether this [M3Breakpoint] is smaller than [other].
  bool operator <(Breakpoint other) => index < (other as M3Breakpoint).index;

  /// Whether this [M3Breakpoint] is smaller than or equal to [other].
  bool operator <=(Breakpoint other) => index <= (other as M3Breakpoint).index;
}
