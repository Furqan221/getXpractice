import 'package:getx/export_all.dart';
import 'package:getx/languages.dart';

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
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      fallbackLocale: Locale('en', 'US'),
      translations: Languages(),
      locale: Locale('en', 'US'),
      initialRoute: '/HomeScreen',
      getPages: [
        GetPage(name: '/HomeScreen', page: () => HomeScreen()),
        GetPage(name: '/ScreenOne', page: () => ScreenOne()),
        GetPage(name: '/ScreenOne', page: () => ScreenOne()),
        GetPage(name: '/ChangeLanguage', page: () => ChangeLanguage()),
        GetPage(name: '/STMExamples', page: () => STMExamples()),
        GetPage(name: '/CounterExample', page: () => CounterExample()),
        GetPage(name: '/STMExample02', page: () => STMExample02()),
        GetPage(name: '/STMExample03', page: () => STMExample03()),
      ],
    );
  }
}

ThemeData lightTheme = ThemeData.light();
ThemeData darkTheme = ThemeData.dark();
