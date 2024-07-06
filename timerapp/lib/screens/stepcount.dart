import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timerapp/controller/stepcountEventcontroller.dart';
import 'package:timerapp/controller/stepcountStatecontroller.dart';

enum StepCountEvent { start, stop, reset }

class StepCountPage extends StatefulWidget {
  @override
  _StepCountPageState createState() => _StepCountPageState();
}

class _StepCountPageState extends State<StepCountPage> {
  StepCountStateController _stateController = StepCountStateController();
  StepCountEventController _eventController = StepCountEventController();
  int _stepCount = 0;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _eventController.stream.listen((event) {
      if (event == StepCountEvent.start) {
        _startCounting();
      } else if (event == StepCountEvent.stop) {
        _stopCounting();
      } else if (event == StepCountEvent.reset) {
        _resetCount();
      }
    });
  }

  void _startCounting() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_isRunning) {
        setState(() {
          _stepCount++;
        });
        _stateController.addState(_stepCount);
      }
    });
  }

  void _stopCounting() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void _resetCount() {
    setState(() {
      _isRunning = false;
      _stepCount = 0;
    });
    _timer?.cancel();
    _stateController.addState(_stepCount);
  }

  @override
  void dispose() {
    _stateController.dispose();
    _eventController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 227, 240),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _stateController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final stepCount = snapshot.data;
                  return Text(
                    'Steps: $stepCount',
                    style: TextStyle(fontSize: 48.0),
                  );
                } else {
                  return Text(
                    'Steps: 0',
                    style: TextStyle(fontSize: 48.0),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_isRunning) {
                      _eventController.stop();
                    } else {
                      _eventController.start();
                    }
                  },
                  child: Text(_isRunning ? 'Stop' : 'Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _eventController.reset();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
