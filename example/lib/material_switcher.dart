import 'package:flutter/material.dart';

class MaterialSwitcher extends StatelessWidget {
  final VoidCallback onTap;

  const MaterialSwitcher({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final useMaterial3 = Theme.of(context).useMaterial3;
    return IconButton(
      onPressed: onTap,
      icon: useMaterial3
          ? const Icon(Icons.filter_3_outlined)
          : const Icon(Icons.filter_2),
      tooltip: useMaterial3 ? 'Switch to Material 2' : 'Switch to Material 3',
    );
  }
}
