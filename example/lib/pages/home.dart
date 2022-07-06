import 'package:flutter/material.dart';
import 'package:material_responsive_layout/material_responsive_layout.dart';
import 'package:material_responsive_layout_example/informative_widgets.dart';
import 'package:material_responsive_layout_example/material_switcher.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onMaterialChange;

  const HomePage({Key? key, required this.onMaterialChange}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showGuides = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).useMaterial3
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        title: const Text('material_responsive_layout'),
        actions: [
          IconButton(
            onPressed: () => setState(() => showGuides = !showGuides),
            icon: Icon(
              showGuides ? Icons.width_normal : Icons.rectangle_rounded,
            ),
            tooltip: showGuides ? 'Hide layout guides' : 'Show layout guides',
          ),
          MaterialSwitcher(onTap: widget.onMaterialChange),
        ],
      ),
      body: BreakpointBuilder(
        // The [constraints] variable (the one whose name has been changed to
        // `_`) can be ignored and only serves as a pass-through from the
        // [LayoutBuilder] widget.
        builder: (context, _, breakpoint) {
          final margin = breakpoint.margin;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (margin != null)
                MarginWidget(margin.toDouble(), invisible: !showGuides),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: breakpoint.m2?.bodyWidth == null
                          ? CrossAxisAlignment.stretch
                          : CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: breakpoint.m2?.bodyWidth?.toDouble(),
                          child: Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: BreakpointExplanationWidget(
                                breakpoint,
                                switchMaterial: widget.onMaterialChange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (margin != null)
                MarginWidget(margin.toDouble(), invisible: !showGuides),
            ],
          );
        },
      ),
    );
  }
}
