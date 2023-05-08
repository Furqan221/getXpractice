import 'package:getx/export_all.dart';

class ExampleThreeController extends GetxController {
  RxBool notification = false.obs;

  turnSwitch(value) {
    notification.value = value;
  }
}
