import 'package:flutter/material.dart';
import 'package:material_responsive_layout/src/breakpoint.dart';
import 'package:material_responsive_layout/src/breakpoint_m2.dart';
import 'package:material_responsive_layout/src/breakpoint_m3.dart';

typedef BreakpointWidgetBuilder = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
  Breakpoint breakpoint,
);

class BreakpointBuilder extends StatelessWidget {
  final BreakpointWidgetBuilder builder;
  final bool? useMaterial3Breakpoints;

  const BreakpointBuilder({
    super.key,
    required this.builder,
    this.useMaterial3Breakpoints,
  });

  @override
  Widget build(BuildContext context) {
    final useMaterial3 =
        useMaterial3Breakpoints ?? Theme.of(context).useMaterial3;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final breakpoint = useMaterial3 //
            ? M3Breakpoint.fromWidth(width)
            : M2Breakpoint.fromWidth(width);

        return builder(context, constraints, breakpoint as Breakpoint);
      },
    );
  }
}
