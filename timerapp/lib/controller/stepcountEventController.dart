import 'dart:async';
import 'package:timerapp/screens/stepcount.dart'; 

class StepCountEventController {
  final StreamController<StepCountEvent> _controller = StreamController<StepCountEvent>();

  Stream<StepCountEvent> get stream => _controller.stream;

  void start() {
    _controller.add(StepCountEvent.start);
  }

  void stop() {
    _controller.add(StepCountEvent.stop);
  }

  void reset() {
    _controller.add(StepCountEvent.reset);
  }

  void dispose() {
    _controller.close();
  }
}
