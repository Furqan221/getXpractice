import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx/export_all.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // startTimer();
    getCountHistory();
    super.initState();
  }

  int reduceSecondsBy = 1;
  Timer? countdownTimer;
  Duration myDuration = Duration();
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
  // void stopTimer() {
  //   BgServices.setStopTime(reduceSecondsBy);
  //   setState(() => countdownTimer!.cancel());
  // }

  // Step 5
  void resetTimer() {
    // stopTimer();
    BgServices.setReset();
    setState(() {
      myDuration = Duration();
      reduceSecondsBy = 1;
    });
  }

  // Step 6
  void setCountDown() {
    setState(() {
      final seconds = reduceSecondsBy;
      if (seconds == 1) {
        BgServices.setStartTime();
      }
      // if (seconds < 0) {
      //   countdownTimer!.cancel();
      // }
      // else {
      // log(seconds.toString());
      myDuration = Duration(seconds: seconds);
      reduceSecondsBy++;
      // log(reduceSecondsBy.toString());
      // }
    });
  }

  void getCountHistory() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString("TimerState").toString() == "Started") {
      final int lastCount = await BgServices().timeDifference();
      reduceSecondsBy = lastCount + 2;
    }
    startTimer();
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
                  // GestureDetector(
                  //   onTap: () {
                  //     if (countdownTimer == null || countdownTimer!.isActive) {
                  //       setState(() {
                  //         buttonStart = false;
                  //         buttonPause = true;
                  //         buttonReset = false;
                  //         isTimerSatrted.value = false;
                  //       });
                  //       stopTimer();
                  //     }
                  //   },
                  //   child: Container(
                  //     height: 45,
                  //     width: 125,
                  //     decoration: BoxDecoration(
                  //         color: Color(0xff55DC7F),
                  //         borderRadius: BorderRadius.circular(6),
                  //         border: Border.all(
                  //             color: buttonPause == true
                  //                 ? Colors.white
                  //                 : Colors.transparent,
                  //             width: 4)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 25.0),
                  //       child: Row(
                  //         children: [
                  //           Icon(
                  //             Icons.pause,
                  //             color: Colors.white,
                  //           ),
                  //           Text(
                  //             'Pause',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // // Step 11
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonStart = false;
                        buttonPause = false;
                        buttonReset = true;
                        isTimerSatrted.value = false;
                      });
                      resetTimer();
                      // Get.back();
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
                  ElevatedButton(
                      onPressed: () {
                        BgServices().timeDifference();
                      },
                      child: Text("See the Difference"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BgServices {
  static Future<void> setStartTime() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("StartTime", DateTime.now().toString());
    sp.setString("TimerState", "Started");
    log(sp.getString("StartTime").toString());
    log(sp.getString("TimerState").toString());
  }

  static Future<void> setReset() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("StartTime", '');
    sp.setString("StopTime", '');
    sp.setString("TimerState", "Stopped");
  }

  // static Future<void> setStopTime(int _) async {
  //   final SharedPreferences sp = await SharedPreferences.getInstance();

  //   sp.setString("StopTime", DateTime.now().toString());
  //   sp.setInt("LastStopTime", _);
  //   sp.setString("TimerState", "Stopped");
  //   log(sp.getString("StopTime").toString());
  //   log(sp.getString("TimerState").toString());
  // }

  Future<int> timeDifference({bool forRestart = true}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    String currentTime = DateTime.now().toString();
    String startedTime = sp.getString("StartTime").toString();
    // String stopTime = sp.getString("StopTime").toString();

    DateTime firstTimestamp = DateTime.parse(startedTime);
    DateTime secondTimestamp = DateTime.parse(currentTime);

    Duration difference = secondTimestamp.difference(firstTimestamp);
    int differenceInSeconds = difference.inSeconds;

    print("The difference in seconds is: $differenceInSeconds");
    return differenceInSeconds.toInt();

    // // DateTime dateTime1 = DateTime.parse(startedTime);
    // // DateTime dateTime2 = DateTime.parse(stopTime);

    // // Duration difference = dateTime2.difference(dateTime1);

    // // print('Time difference: ${difference.toString()}');
    // // Duration customDuration = Duration(
    // //   days: difference.inDays,
    // //   hours: difference.inHours % 24,
    // //   minutes: difference.inMinutes % 60,
    // //   milliseconds: difference.inMilliseconds % 1000,
    // //   microseconds: difference.inMicroseconds % 1000,
    // // );

    // // print('Custom Duration: ${customDuration.toString()}');

    // // return difference.toString();
    // DateTime dateTime2 = DateTime.parse(currentTime);
    // DateTime dateTime1 = DateTime.parse(startedTime);

    // Duration difference = dateTime2.difference(dateTime1);

    // String formattedDifference = formatDuration(difference);

    // print('Formatted Time Difference: $difference');
  }

//   String formatDuration(Duration duration) {
//     int days = duration.inDays;
//     int hours = duration.inHours % 24;
//     int minutes = duration.inMinutes % 60;
//     int seconds = duration.inSeconds % 60;
//     int microseconds = duration.inMicroseconds % 1000000;

//     return '${days.toString().padLeft(2, '0')}-'
//         '${hours.toString().padLeft(2, '0')}-'
//         '${minutes.toString().padLeft(2, '0')}-'
//         '${seconds.toString().padLeft(2, '0')}-'
//         '${microseconds.toString().padLeft(5, '0')}';
//   }
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
