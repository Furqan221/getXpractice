import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getx/controllers/counter_controller.dart';
import 'package:getx/export_all.dart';

class CounterExample extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    // print(x.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => Text(
              controller.counter.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
                itemCount: controller.counter.toInt(),
                itemBuilder: (context, index) {
                  return Text(index.toString());
                }),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  controller.increamentCounter();
                },
                icon: Center(
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                )),
            IconButton(
                onPressed: () {
                  controller.decreamentCounter();
                },
                icon: Center(
                  child: Icon(
                    Icons.remove,
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
