import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    try {
      final response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
      }, headers: {});

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login successful', 'Congratulations',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        loading.value = false;
        Get.snackbar('Login failed', data['error'],
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.blueGrey.withOpacity(0.6));
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
