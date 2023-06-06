import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // void Login(String email, password) async {
  //   try {
  //     http.Response response = await http.post(
  //         Uri.parse('https://reqres.in/api/login'),
  //         body: {'email': email, 'password': password});

  //     var data = jsonDecode(response.body.toString());
  //     //  user;

  //     if (response.statusCode == 200) {
  //       user = loginModal.fromJson(data);
  //       print(data);
  //       print(user!.token);
  //       // print("this is token :  ====== > ${user.token}");
  //       print('log in successful');
  //       Get.to(() => HomeAfterLogin());
  //     } else {
  //       print('log in failed');
  //       print(data);
  //       // print(user.token);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text(
                'Email is :',
                style: TextStyle(color: Colors.black),
              ),
              SelectableText(
                'eve.holt@reqres.in',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Row(
            children: [
              Text('Password is : ', style: TextStyle(color: Colors.black)),
              SelectableText(
                'pistol',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 100,
          ),
          LoginTextField(
              // hintText: 'Email',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: _loginController.emailController.value),
          SizedBox(
            height: 50,
          ),
          LoginTextField(
              // hintText: 'Password',
              labelText: 'Password',
              keyboardType: TextInputType.emailAddress,
              controller: _loginController.passwordController.value),
          SizedBox(
            height: 50,
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                _loginController.LoginApi();
              },
              child: Container(
                alignment: Alignment.center,
                width: 388,
                height: 58,
                margin: EdgeInsets.symmetric(vertical: 0.010),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(28)),
                child: _loginController.loading.value
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  String? hintText;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? labelText;
  final TextEditingController? controller;

  LoginTextField(
      {super.key,
      this.hintText,
      required this.controller,
      this.prefixIcon,
      this.keyboardType,
      this.labelText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              labelText!,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
            cursorColor: Colors.deepPurple,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
              prefixIconColor: Colors.deepPurple,
              suffixIconColor: Colors.deepPurple,
              filled: true,
              // fillColor: Color.fromARGB(136, 95, 82, 126),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(28),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(28),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
