import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstate/counter_controller.dart';
import 'package:getstate/example_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExampleTwoController exampleTwoController = Get.put(ExampleTwoController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX State Management Demo',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Container(
                width: 200,
                height: 200,
                color:
                    Colors.red.withOpacity(exampleTwoController.opacity.value),
              ),
            ),
            Obx(() => Slider(
                value: exampleTwoController.opacity.value,
                onChanged: (value) {
                  exampleTwoController.setOpacity(value);
                }))
          ],
        ),
      ),
    );
  }
}
