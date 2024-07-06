import 'dart:async';


class StopwatchStateController {
 final StreamController<int> _controller = StreamController<int>();


 Stream<int> get stream => _controller.stream;
 //Adds the current state of the stopwatch, represented by the elapsed milliseconds,
 //to the stream for consumption by listeners.
 void addState(int milliseconds) {
   _controller.add(milliseconds);
 }


 void dispose() {
   _controller.close();
 }
}
