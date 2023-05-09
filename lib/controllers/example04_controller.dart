import 'package:getx/export_all.dart';

class ExampleFourController extends GetxController {
  RxList fruits = [
    "Mangoes",
    "Apples",
    "Bananas",
    "Strawberry",
  ].obs;
  RxList favfruit = [].obs;

  setFavourite(index) {
    if (favfruit.contains(fruits[index])) {
      favfruit.remove(fruits[index]);
    } else {
      favfruit.add(fruits[index]);
    }
  }
}
