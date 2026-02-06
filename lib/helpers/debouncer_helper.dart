import 'dart:async';

class DebouncerHelper {
  int milliseconds = 300;
  Timer? timer;

  DebouncerHelper({required this.milliseconds});

  void run(void Function() action) {
    this.timer?.cancel();
    this.timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    this.timer?.cancel();
  }
}