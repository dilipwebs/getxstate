import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstate/example_three.dart';
import 'package:getstate/favorite_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FavoriteController favoriteController = Get.put(FavoriteController());

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
      body: ListView.builder(
        itemCount: favoriteController.fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                if (favoriteController.tempFruitList
                    .contains(favoriteController.fruitList[index].toString())) {
                  favoriteController.removeFromFavorite(favoriteController.fruitList[index].toString());
                } else {
                  favoriteController.addToFavorite(favoriteController.fruitList[index].toString());
                }
              },
              title: Text(favoriteController.fruitList[index].toString()),
              trailing: Obx(() => Icon(
                Icons.favorite,
                color: favoriteController.tempFruitList.contains(
                    favoriteController.fruitList[index].toString())
                    ? Colors.red
                    : Colors.grey,
              ),)
            ),
          );
        },
      ),
    );
  }
}
