import 'package:getx/export_all.dart';
import 'package:getx/languages.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Change Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('message'.tr),
              Text('name'.tr),
              SizedBox(height: 50),
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Get.updateLocale(Locale('en', 'US'));
                      },
                      child: Text('English')),
                  SizedBox(width: 20),
                  OutlinedButton(
                      onPressed: () {
                        Get.updateLocale(Locale('ur', 'PK'));
                      },
                      child: Text('Urdu')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
