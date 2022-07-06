import 'package:flutter/material.dart';
import 'package:material_responsive_layout/material_responsive_layout.dart';
import 'package:material_responsive_layout_example/pages/columns.dart';

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold);

class BreakpointExplanationWidget extends StatelessWidget {
  final Breakpoint breakpoint;
  final VoidCallback switchMaterial;

  const BreakpointExplanationWidget(
    this.breakpoint, {
    Key? key,
    required this.switchMaterial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMaterial3 = breakpoint.m3 != null;
    final headingTextStyle = Theme.of(context).useMaterial3
        ? Theme.of(context).textTheme.titleLarge
        : Theme.of(context).textTheme.headline5;

    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'You are currently using the responsive layout from ',
          ),
          TextSpan(
            text: isMaterial3 ? 'Material Design 3' : 'Material Design 2',
            style: boldTextStyle,
          ),
          const TextSpan(text: '.\n\n'),
          TextSpan(text: 'Breakpoint values\n\n', style: headingTextStyle),
          _buildDataTextSpan(
            'Breakpoint',
            breakpoint.toString(),
          ),
          _buildDataTextSpan(
            'Margin size',
            breakpoint.margin?.toString() ?? 'Fluid',
          ),
          _buildDataTextSpan(
            'Body width',
            breakpoint.m2 == null
                ? 'N/A'
                : (breakpoint.m2!.bodyWidth?.toString() ?? 'Fluid'),
          ),
          _buildDataTextSpan('Columns', breakpoint.columns.toString()),
          const TextSpan(text: '\n\n'),
          TextSpan(text: 'About the example\n\n', style: headingTextStyle),
          const TextSpan(
            text: 'The yellow guides are margins. You can turn them off using '
                'the first button in the app bar.',
          ),
          const TextSpan(text: '\n\n'),
          TextSpan(text: 'More examples\n\n', style: headingTextStyle),
          WidgetSpan(
            child: TextButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ColumnsPage(switchMaterial: switchMaterial),
                ),
              ),
              icon: const Icon(Icons.view_column_outlined),
              label: const Text('Columns example'),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _buildDataTextSpan(String key, String value) {
    return TextSpan(
      children: [
        TextSpan(text: '$key: ', style: boldTextStyle),
        TextSpan(text: '$value\n'),
      ],
    );
  }
}

class MarginWidget extends StatelessWidget {
  final double margin;
  final bool invisible;

  const MarginWidget(
    this.margin, {
    Key? key,
    required this.invisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dense = margin <= 16;
    final textStyle = TextStyle(
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: const [
        'Consolas',
        'monospace',
      ],
      fontSize: dense ? 12 : null,
      letterSpacing: dense ? -1 : null,
    );

    return ColoredBox(
      color: invisible ? Colors.transparent : Colors.yellow.withOpacity(.55),
      child: SizedBox(
        width: margin,
        child: invisible
            ? null
            : Center(
                child: Text(
                  margin.toInt().toString(),
                  style: textStyle,
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}
