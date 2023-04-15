import 'package:getx/export_all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.deepOrange,
      // ),
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      // home: HomeScreen()
      initialRoute: '/HomeScreen',
      getPages: [
        GetPage(name: '/HomeScreen', page: () => HomeScreen()),
        GetPage(name: '/ScreenOne', page: () => ScreenOne()),
      ],
    );
  }
}

ThemeData lightTheme = ThemeData.light();
ThemeData darkTheme = ThemeData.dark();
