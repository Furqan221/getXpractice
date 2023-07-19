import 'dart:async';

import 'package:getx/export_all.dart';

class StopwatchController extends GetxController {
  Rx<DateTime> startTime = DateTime.now().obs;
  Rx<DateTime> currentTime = DateTime.now().obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  int reduceSecondsBy = 1;

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setCountDown();
    });
  }

  // Step 4
  void stopTimer() {
    countdownTimer!.cancel();
  }

  // Step 5
  void resetTimer() {
    stopTimer();

    myDuration = Duration(days: 5);
    reduceSecondsBy = 1;
  }

  void setCountDown() {
    final seconds = reduceSecondsBy;

    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
      reduceSecondsBy++;
    }
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  // void start() {
  //   startTime.value = DateTime.now();
  //   update(); // Notify GetX that the state has changed
  // }

  // void stop() {
  //   // Do any necessary calculations if needed
  //   update(); // Notify GetX that the state has changed
  // }

  // void reset() {
  //   startTime.value = DateTime.now();
  //   update(); // Notify GetX that the state has changed
  // }

  // void updateTime() {
  //   currentTime.value = DateTime.now();
  //   update(); // Notify GetX that the state has changed
  // }

  // Duration get elapsedTime => currentTime.value.difference(startTime.value);
}
