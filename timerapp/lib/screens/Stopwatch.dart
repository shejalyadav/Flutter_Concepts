import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timerapp/controller/eventcontroller.dart';
import 'package:timerapp/controller/statecontroller.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  StopwatchStateController _stateController = StopwatchStateController();
  StopwatchEventController _eventController = StopwatchEventController();
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer; // I have added a null safety check in timer
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _eventController.stream.listen((_) {
      if (_isRunning) {
        _stopwatch.stop();
      } else {
        _stopwatch.start();
      }
      setState(() {
        _isRunning = !_isRunning;
      });
    });

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      if (_stopwatch.isRunning) {
        _stateController.addState(_stopwatch.elapsedMilliseconds);
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _stopwatch.reset();
      _stateController.addState(0);
    });
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
                  final milliseconds = snapshot.data!;
                 // ~/ is for integer division
                 // It divides the left operand by the right operand and returns the integer result of the division, discarding any fractional part.
                 // we have added a ! mark because the value of miliseconds can be null
                  final hours = (milliseconds ~/ 3600000).toString().padLeft(2, '0');
                  final minutes = ((milliseconds ~/ 60000) % 60).toString().padLeft(2, '0');
                  final seconds = ((milliseconds ~/ 1000) % 60).toString().padLeft(2, '0');
                  final centiseconds = ((milliseconds ~/ 10) % 100).toString().padLeft(2, '0');
                  return Text(
                    '$hours:$minutes:$seconds:$centiseconds',
                    style: TextStyle(fontSize: 48.0),
                  );
                } else {
                  return Text(
                    '00:00:00:00',
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
                    _eventController.start();
                  },
                  child: _isRunning ? Text('Stop') : Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _resetTimer();
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
