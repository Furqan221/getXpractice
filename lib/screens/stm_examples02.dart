import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getx/controllers/example_two_controller.dart';
import 'package:getx/export_all.dart';

class STMExample02 extends StatelessWidget {
  STMExample02({super.key});

  final ExampleTwoController controller = Get.put(ExampleTwoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example no 2")),
      body: Column(
        children: [
          Center(
            child: Obx(
              () => Container(
                child: Center(
                    child: Text(
                  controller.opacity.toString()[2],
                  style: TextStyle(fontSize: 40),
                )),
                margin: EdgeInsets.all(30),
                height: 100,
                width: 100,
                color: Colors.black.withOpacity(controller.opacity.value),
              ),
            ),
          ),
          Obx(
            () => Slider(
                value: controller.opacity.value,
                onChanged: (v) {
                  controller.setOpacity(v);
                }),
          )
        ],
      ),
    );
  }
}
