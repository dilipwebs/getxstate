import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstate/example_three.dart';
import 'package:getstate/favorite_controller.dart';
import 'package:getstate/image_picker_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagePickerController imagePickerController = Get.put(ImagePickerController());

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
      body: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: imagePickerController.imagePath.isNotEmpty ? FileImage(
                  File(imagePickerController.imagePath.value)) : null
            ),
          ),
          TextButton(onPressed: (){
            imagePickerController.getImage();
          }, child: const Text('Get Image'))
        ],
      ))
    );
  }
}
