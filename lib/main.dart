import 'package:animation_demo/screens/home/homeview.dart';
import 'package:animation_demo/screens/map/mapscreens.dart';
import 'package:animation_demo/screens/pagination/homescreens.dart';
import 'package:animation_demo/screens/pagination/myhome.dart';
import 'package:animation_demo/screens/sliver/sliverscreens.dart';
import 'package:animation_demo/screens/sliver/viewscreens.dart';
import 'package:flutter/material.dart';

import 'screens/view/nextscreens.dart';
// extension MyString on String {
//   String addHello() {
//     print("hello========$this");
//     return 'Hello : $this';
//   }
// }
// extension NewExtension on double {
//   int  myMethod() {
//     return (1/this*10).toInt();
//   }
// }
// extension NumberParsing on String {
//   int parseInt() {
//     return int.parse(this);
//   }
// }
void main() {
  // print('42'.padLeft(10)); // Use a String method.
  // print('42'.parseInt()); // Use an extension method.
  // print(NumberParsing('42').parseInt());
  // var name = 5.0;
  // var nameWithHello = name.myMethod();
  // print(nameWithHello);
  // print(name.myMethod());

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  const MapScreens(),
        '/NextScreens': (context) => const NextScreens(),
      },
    );
  }
}


