import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstate/example_three.dart';
import 'package:getstate/favorite_controller.dart';
import 'package:getstate/image_picker_controller.dart';
import 'package:getstate/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'GetX State Management Demo',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: loginController.passwordController.value,
                decoration: const InputDecoration(hintText: 'password'),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => InkWell(
                    onTap: () {
                      loginController.loginApi();
                    },
                    child: Container(
                      height: 45,
                      color: Colors.blueGrey,
                      child: Center(
                        child: loginController.loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
