abstract class Breakpoint {
  int get columns;
  double? get margin;
}

extension BreakpointExtensions on Breakpoint {
  double getColumnSize(num width) {
    return width / columns;
  }
}
