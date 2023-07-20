
import 'package:flutter/material.dart';
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late List dummyList;
  final ScrollController _scrollController = ScrollController();
  late  int _currentMax = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dummyList = List.generate(_currentMax, (index) {
      return "Item : ${index + 1}";
    });
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getMoreList();
      }
    });
  }

  _getMoreList(){
    for(int i = _currentMax;i<_currentMax+10;i++){
      if(_currentMax < 40){
        dummyList.add("Item: ${i +1}");
      }
    }
    _currentMax = _currentMax +10;
    print("_currentMax$_currentMax");
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: dummyList.length + 1,
        itemExtent: 60,
        itemBuilder: (context, index) {
          if(index == dummyList.length ) {
            if( dummyList.length < 40){
              return const Center(child: CircularProgressIndicator());
            }else{
              print("error");
              return const SizedBox();
            }
          }
            return ListTile(
          title: Text(dummyList[index]),
        );
      },),
    );
  }
}
