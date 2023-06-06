import 'package:getx/export_all.dart';

class ExampleTwoController extends GetxController {
  RxDouble opacity = 0.4.obs;

  setOpacity(value) {
    opacity.value = value;
  }


  
}
