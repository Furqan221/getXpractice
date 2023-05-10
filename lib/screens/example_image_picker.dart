import 'dart:io';

import 'package:getx/export_all.dart';

class ImagePickerExample extends StatelessWidget {
 ImagePickerExample({super.key});

  final ExampleFourController controller = Get.put(ExampleFourController());
  @override
  ImagePickerController icontroller = Get.put(ImagePickerController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker Example")),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: icontroller.pickedImage.isNotEmpty
                      ? FileImage(
                          File(icontroller.pickedImage.value.toString()))
                      : null,
                  radius: 50,
                ),
                TextButton(
                    onPressed: () {
                      icontroller.getImage();
                    },
                    child: Text("Pick Image"))
              ],
            )),
      ),
    );
  }
}
