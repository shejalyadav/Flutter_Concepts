import 'dart:async';


class StopwatchEventController {
 final StreamController<void> _controller = StreamController<void>();


 Stream<void> get stream => _controller.stream;
 //Sends an event indicating the start of the stopwatch.
 void start() {
   _controller.add(null);
 }
 //Sends an event indicating the stop of the stopwatch.
 void stop() {
   _controller.add(null);
 }
 //Sends an event indicating the reset of the stopwatch.
 void reset() {
   _controller.add(null);
 }
 // This function is called when the stateful widget is being removed from the widget tree permanently.
 void dispose() {
   _controller.close();
 }
}
