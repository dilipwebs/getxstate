import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    /*Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      setState(() {

      });
    }); default state management rebuild the whole scaffold everytime which cost to RAM*/
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX State Management Demo',
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.05,
            width: width * 0.5,
            color: Colors.cyan,
            child: const Center(
              child: Text('Container1'),
            ),
          ),
          Container(
            height: Get.height * 0.05,
            width: Get.width * 0.5,
            color: Colors.grey,
            child: const Center(
              child: Text('Container2'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ListTile(
              tileColor: Colors.cyanAccent,
              title: Text('message'.tr),
              subtitle: Text('name'.tr),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.updateLocale(Locale('en', 'US'));
                },
                child: Text('English'),
              ),
              OutlinedButton(
                onPressed: () {
                  Get.updateLocale(Locale('hi', 'IN'));
                },
                child: Text('Hindi'),
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenOne()),
                );*/
                Get.toNamed('/first-screen',
                    arguments: ['Dilip Hignwe', 'My name']);
              },
              child: const Text('Go to first screen'),
            ),
          ),
          Center(
            child: Text(count.toString()),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(index.toString()),
                    );
                  })),
        ],
      ),
    );
  }
}
