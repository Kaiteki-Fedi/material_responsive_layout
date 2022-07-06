import 'package:flutter/material.dart';
import 'package:material_responsive_layout/material_responsive_layout.dart';
import 'package:material_responsive_layout_example/material_switcher.dart';

class ColumnsPage extends StatelessWidget {
  final VoidCallback switchMaterial;

  const ColumnsPage({Key? key, required this.switchMaterial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Columns"),
        actions: [
          MaterialSwitcher(onTap: switchMaterial),
        ],
      ),
      body: BreakpointBuilder(
        builder: (context, _, breakpoint) {
          final columns = breakpoint.columns;
          const gutter = 8.0;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: breakpoint.margin?.toDouble() ?? 0,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                childAspectRatio: 1.0,
                mainAxisSpacing: gutter,
                crossAxisSpacing: gutter,
              ),
              itemBuilder: (_, i) => Card(
                margin: EdgeInsets.zero,
                child: Center(
                  child: Text(
                    '${(i % columns) + 1}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
