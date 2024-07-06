import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstate/example_three.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExampleThreeController exampleThreeController =
      Get.put(ExampleThreeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX State Management Demo',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification'),
                Obx(() => Switch(
                    value: exampleThreeController.notification.value,
                    onChanged: (value) {
                      exampleThreeController.notification.value = value;
                    }))
              ],
            ),
            Obx(() => exampleThreeController.notification.value
                ? const Text('Dummy content')
                : const Text('No content')),
          ],
        ),
      ),
    );
  }
}
