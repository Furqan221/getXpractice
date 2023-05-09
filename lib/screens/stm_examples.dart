import 'package:getx/export_all.dart';

class STMExamples extends StatelessWidget {
  const STMExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // co
      appBar: AppBar(
        title: Text('Get X State Management'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/CounterExample');
              },
              child: Text(
                'Counter Example',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/STMExample02');
              },
              child: Text(
                'STM Example 02',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/STMExample03');
              },
              child: Text(
                'STM Example 03',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/STMExample04');
              },
              child: Text(
                'STM Example 04',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
