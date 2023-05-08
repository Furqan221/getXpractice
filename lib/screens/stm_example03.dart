import 'package:getx/controllers/example03_controller.dart';
import 'package:getx/export_all.dart';

class STMExample03 extends StatelessWidget {
  STMExample03({super.key});

  final ExampleThreeController abc = Get.put(ExampleThreeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Management Example 3")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue, width: 2)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                Obx(
                  () => Switch(
                      value: abc.notification.value,
                      onChanged: (v) {
                        // print(abc.notification.value.toString());
                        abc.turnSwitch(v);
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
