import 'package:getx/export_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // co
      appBar: AppBar(
        title: Text('Get X Tutorials'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        children: [
          ElevatedButton(
              onPressed: () {
                Get.snackbar('Hello World', 'How are you',
                    backgroundColor: Colors.white);
              },
              child: Text(
                'Show Snackbar',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 200,
                  color: Colors.amber,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          print('buttonTapped');
                          Get.changeTheme(ThemeData.light());
                        },
                        leading: Icon(Icons.sunny),
                        title: Text("Light Theme"),
                      ),
                      ListTile(
                        onTap: () {
                          print('buttonTapped');
                          Get.changeTheme(ThemeData.dark());
                        },
                        leading: Icon(Icons.dark_mode),
                        title: Text("Dark Theme"),
                      ),
                    ],
                  ),
                ));
              },
              child: Text(
                'Show Bottom Sheet',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/ScreenOne', arguments: [
                  'Furqan',
                  '22',
                ]);
              },
              child: Text(
                'Go to My Profile Screen',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/ChangeLanguage');
              },
              child: Text(
                'Language change',
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/STMExamples');
              },
              child: Text(
                'State Management',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
