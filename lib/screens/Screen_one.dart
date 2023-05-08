import 'package:getx/export_all.dart';

class ScreenOne extends StatelessWidget {
  var Userdata;
  ScreenOne({super.key, this.Userdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // co
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hello ${Get.arguments[0]}'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        children: [
          Center(
              child: Text(
            'Your luck number is ${Get.arguments[1]}',
            style: TextStyle(fontSize: 25),
          )),
          SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Go Back',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
