import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getstate/example_three.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> fruitList = ['orange','apple','mango','banana', 'grapes'];

  List<String> tempFruitList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(tempFruitList);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX State Management Demo',
        ),
      ),
      body: ListView.builder(
        itemCount: fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (){
                if(tempFruitList.contains(fruitList[index].toString())){
                  tempFruitList.remove(fruitList[index].toString());
                }else{
                  tempFruitList.add(fruitList[index].toString());
                }
                setState(() {
                });
              },
              title: Text(fruitList[index].toString()),
              trailing: Icon(Icons.favorite, color:
                  
                tempFruitList.contains(fruitList[index].toString()) ?
                Colors.red : Colors.grey,
              
              ),
            ),
          );
        },
      ),
    );
  }
}
