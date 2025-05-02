import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Flutter Debugger", home: DebuggerDemo()));
}

class DebuggerDemo extends StatefulWidget {
  @override
  _DebuggerDemoState createState() => _DebuggerDemoState();
}

class _DebuggerDemoState extends State<DebuggerDemo>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Debugger :)"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              createLoremIpsum(4),
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children:
                  [
                    'this',
                    'widgetCount',
                    'elements',
                  ].map((item) => ListTile(title: Text(item))).toList(),
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            child: Icon(Icons.expand_more),
            onPressed: () => print('step in'),
            mini: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FloatingActionButton(
              child: Icon(Icons.expand_less),
              onPressed: () => print('step out'),
              mini: true,
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.chevron_right),
            onPressed: () => print('step over'),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }

  Widget _buildDrawer() {
    List<Widget> items = <Widget>[DrawerHeader(child: Text('Isolate/0'))];

    for (String str in ['Foo.bar()', 'baz()', 'main()']) {
      items.add(
        ListTile(title: Text(str), selected: str == 'main()', onTap: () {}),
      );
    }

    return Drawer(child: ListView(children: items));
  }

  String createLoremIpsum(int paragraphs) {
    const String loremIpsum =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ";

    return List<String>.filled(paragraphs, loremIpsum).join('\n\n');
  }
}
