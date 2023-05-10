import 'dart:convert';

import 'package:getx/export_all.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void LoginApi() async {
/* if api required data in raw form 
 var newData = {
          'email': emailController.value.text,
          'password': passwordController.value.text
        };

http.Response response = await http
            .post(Uri.parse('https://reqres.in/api/login'), body: jsonEncode(newData));

*/

    if (emailController.value.text.isNotEmpty ||
        passwordController.value.text.isNotEmpty) {
      try {
        loading.value = true;
        http.Response response = await http
            .post(Uri.parse('https://reqres.in/api/login'), body: {
          'email': emailController.value.text,
          'password': passwordController.value.text
        });

        var data = jsonDecode(response.body);
        //  user;

        if (response.statusCode == 200) {
          loading.value = false;
          print('log in successful');
          Get.snackbar("Login Success", "");
          Get.off(() => HomeScreen());
        } else {
          print('log in failed');
          loading.value = false;
          Get.snackbar("Login Failed", data['error'].toString());
          print(data);
          // print(user.token);
        }
      } catch (e) {
        loading.value = false;
        print(e.toString());
        Get.snackbar("Login Failed", e.toString());
      }
    } else {
      Get.snackbar("Login Failed", "Please fill all the fields");
    }
  }
}
