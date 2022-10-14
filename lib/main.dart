import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.rootWidgetKey});

  final GlobalKey? rootWidgetKey;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: rootWidgetKey ?? GlobalKey(),
      child: MaterialApp(
        title: 'Counter App',
        home: MyHomePage(title: 'Counter App Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final List<String> myImages = [
    'assets/img1.png',
    'assets/img2.png',
    'assets/img3.png',
    'assets/img4.png'
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> imgs = [];

  void _increment() {
    setState(() {
      _counter++;
      imgs.add(widget.myImages[Random().nextInt(4)]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(
                    imgs.length,
                    (index) =>
                        Image.asset(imgs[index], width: 300, height: 300)),
              ),
            ),
            Center(
              child: Text(
                '$_counter',
                key: const Key('counter'),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment'),
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
