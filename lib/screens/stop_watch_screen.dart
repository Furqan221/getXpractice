import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getx/export_all.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    isTimerSatrted.value = true;
    buttonStart = true;
    startTimer();
    super.initState();
  }

  int reduceSecondsBy = 1;
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  bool buttonStart = false;
  bool buttonPause = false;
  bool buttonReset = false;
  RxBool isTimerSatrted = false.obs;

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setCountDown();
    });
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() {
      myDuration = Duration(days: 5);
      reduceSecondsBy = 1;
    });
  }

  // Step 6
  void setCountDown() {
    setState(() {
      final seconds = reduceSecondsBy;

      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
        reduceSecondsBy++;
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$days:$hours:$minutes:$seconds',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schyler',
                  color: Colors.black,
                  fontSize: 84,
                ),
              ),
              SizedBox(height: 30),
              // Step 9
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isTimerSatrted.value == false) {
                        setState(() {
                          buttonStart = true;
                          buttonPause = false;
                          buttonReset = false;
                        });
                        if (isTimerSatrted.value == false) {
                          startTimer();
                          isTimerSatrted.value = true;
                        }
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 125,
                      decoration: BoxDecoration(
                          color: Color(0xff3BAE6D),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: buttonStart == true
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 4)),
                      child: Center(
                        child: Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Step 10
                  GestureDetector(
                    onTap: () {
                      if (countdownTimer == null || countdownTimer!.isActive) {
                        setState(() {
                          buttonStart = false;
                          buttonPause = true;
                          buttonReset = false;
                          isTimerSatrted.value = false;
                        });
                        stopTimer();
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 125,
                      decoration: BoxDecoration(
                          color: Color(0xff55DC7F),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: buttonPause == true
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 4)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                            Text(
                              'Pause',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Step 11
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        backgroundColor: Colors.amber,
                        barrierDismissible: false,
                        title: 'Alert\n\nAre you sure you want to reset?',
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        titlePadding: EdgeInsets.only(top: 20),
                        middleText:
                            '\nNote: If you reset all of your workout tracking will be lost! ',
                        middleTextStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                            color: Colors.grey.shade100),
                        cancel: ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              "No",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber)),
                        confirm: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                buttonStart = false;
                                buttonPause = false;
                                buttonReset = true;
                                isTimerSatrted.value = false;
                              });
                              resetTimer();
                              Get.back();
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red)),
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 125,
                      decoration: BoxDecoration(
                          color: Color(0xffC93535),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: buttonReset == true
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 4)),
                      child: Center(
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





















// import 'package:getx/export_all.dart';

// class StopwatchScreen extends StatelessWidget {
//   final controller = Get.put(StopwatchController());

//   @override
//   Widget build(BuildContext context) {
//     final hours = strDigits(myDuration.inHours.remainder(24));
//     final minutes = strDigits(myDuration.inMinutes.remainder(60));
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stopwatch App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text(
//                   '${controller.elapsedTime.inHours}:${(controller.elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}',
//                   style: TextStyle(fontSize: 36),
//                 )),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => controller.startTimer(),
//                   child: Text('Start'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => controller.stopTimer(),
//                   child: Text('Stop'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => controller.resetTimer(),
//                   child: Text('Reset'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
