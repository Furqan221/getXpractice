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
      theme: ThemeData(primarySwatch: Colors.deepPurple),
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
        GetPage(name: '/STMExample04', page: () => STMExample04()),
        GetPage(name: '/ImagePickerExample', page: () => ImagePickerExample()),
        GetPage(name: '/LoginScreen', page: () => LoginScreen()),
        GetPage(name: '/PayPalScreen', page: () => PaymentScreen()),
        GetPage(name: '/ContainerCustom', page: () => ContainerCustom()),
        GetPage(name: '/CartPage', page: () => CartPage()),
        GetPage(name: '/StopwatchScreen', page: () => MyWidget()),
      ],
    );
  }
}

ThemeData lightTheme = ThemeData.light();
ThemeData darkTheme = ThemeData.dark();
