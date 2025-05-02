import 'package:flutter/material.dart';
import 'sunflower_demo.dart';
import 'strober_demo.dart';
import 'debugger_demo.dart';

void main() {
  runApp(DemoHubApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DebuggerDemo());
  }
}

class DemoHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hub',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  final demos = [
    {'title': 'Sunflower', 'widget': SunflowerDemo()},
    {'title': 'Strober', 'widget': StroberDemo()},
    {'title': 'Debugger UI', 'widget': DebuggerDemo()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Hub')),
      body: ListView.builder(
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final demo = demos[index];
          return ListTile(
            title: Text(demo['title'] as String),

            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => demo['widget'] as Widget),
              );
            },
          );
        },
      ),
    );
  }
}
