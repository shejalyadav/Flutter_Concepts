import 'package:flutter/material.dart';
import 'package:timerapp/screens/stopwatch.dart';
import 'package:timerapp/screens/stepcount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbedPage(),
    );
  }
}

class TabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fitness Tracker App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Stopwatch'),
              Tab(text: 'Step Count'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StopwatchPage(),
            StepCountPage(),
          ],
        ),
      ),
    );
  }
}
