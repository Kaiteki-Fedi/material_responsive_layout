import 'package:flutter/material.dart';
import 'package:material_responsive_layout_example/pages/home.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool material3 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material_responsive_layout',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: material3,
      ),
      home: HomePage(
        onMaterialChange: () => setState(() => material3 = !material3),
      ),
      // Disabled in order to prevent covering the app bar actions.
      debugShowCheckedModeBanner: false,
    );
  }
}
