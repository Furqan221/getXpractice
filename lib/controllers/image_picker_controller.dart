import 'package:getx/export_all.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString pickedImage = "".obs;

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImage.value = image.path.toString();
    }
  }
}
