import 'dart:async';

class DebouncerHelper {
  int milliseconds;
  Timer? timer;

  DebouncerHelper({this.milliseconds = 300});

  void run(void Function() action) {
    this.timer?.cancel();
    this.timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    this.timer?.cancel();
  }
}