import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getstate/languages.dart';
import 'package:getstate/screen_one.dart';
import 'package:getstate/screen_two.dart';
import 'package:url_strategy/url_strategy.dart';

import 'home_screen.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('hi','IN'),
      fallbackLocale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      //home: const HomeScreen(),
      getPages: [

        GetPage(name: '/', page: ()=> const HomeScreen()),
        GetPage(name: '/first-screen', page: ()=> ScreenOne()),
        GetPage(name: '/second-screen', page: ()=>const ScreenTwo())
      ],
    );
  }
}
