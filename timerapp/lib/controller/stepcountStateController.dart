import 'dart:async';

class StepCountStateController {
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void addState(int stepCount) {
    _controller.add(stepCount);
  }

  void dispose() {
    _controller.close();
  }
}
