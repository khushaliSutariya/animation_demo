import 'package:flutter/material.dart';

class MapScreens extends StatefulWidget {
  const MapScreens({Key? key}) : super(key: key);

  @override
  State<MapScreens> createState() => _MapScreensState();
}

class _MapScreensState extends State<MapScreens> {
  //map.form
  final planets = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth', 4: 'Mars'};
  //map.fromEntries
  final moonCount = <String, int>{
    'Mercury': 0,
    'Venus': 0,
    'Earth': 1,
    'Mars': 2,
  };
  //Map.fromIterable
  final numbers = <int>[1, 2, 3];
  //Map.fromIterables
  final rings = <bool>[false, false, true, true];
  final ringsName = <String>{'Earth', 'Mars', 'Jupiter', 'Saturn'};
  //Map.of
  final of = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
  //Map.unmodifiable
  final unmodifiable = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
  //sub data
  final sub = <String, int>{
    'One': 10,
    'Two': 20,
    'Three': 30,
    'Four': 40,
  };
  Map<String,int> resultMap = {};
  @override
  Widget build(BuildContext context) {
    //map.form
    final mapFrom = Map<int, String>.from(planets);
    //map.fromEntries
    final mapFromEntries = Map.fromEntries(moonCount.entries);
    //Map.fromIterable
    final mapFromIterableFirst = Map.fromIterable(numbers);
    final mapFromIterableSecond = {for (var item in numbers) item.toString(): item * item};
    //Map.fromIterables
    final mapFromIterables = Map<String, bool>.fromIterables(ringsName, rings);
    //Map.of
    final mapOf = Map<num, String>.of(of);
    //Map.unmodifiable
    final unmodifiableMap = Map.unmodifiable(unmodifiable);
    // final addData = unmodifiableMap[4] = 'Mars';
    // print("add$addData");// Throws
    //Sub data
    var values = sub.values;
    print("val$values");
    var result = values.reduce((sum, element) => sum + element);
    print(result);

    return Scaffold(
      appBar: AppBar(title: const Text("Map")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("1.MapForm : $mapFrom"),
            const SizedBox(
              height: 10.0,
            ),
            Text("2.MapFromEntries : $mapFromEntries"),
            const SizedBox(
              height: 10.0,
            ),
            Text("3.MapFromIterableFirst : $mapFromIterableFirst"),
            const SizedBox(
              height: 10.0,
            ),
            Text("4.MapFromIterableSecond : $mapFromIterableSecond"),
            const SizedBox(
              height: 10.0,
            ),
            Text("5.MapFromIterables : $mapFromIterables"),
            const SizedBox(
              height: 10.0,
            ),
            Text("6.MapOf : $mapOf"),
            const SizedBox(
              height: 10.0,
            ),
            Text("7.MapUnmodifiable : $unmodifiableMap"),
            // Text("8.SubData : ${subData.toString()}"),
          ],
        ),
      ),
    );
  }
}
