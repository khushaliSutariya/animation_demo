import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NextScreens extends StatelessWidget {
  const NextScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next screens")),
      body: CustomScrollView(slivers: [
        SliverPinnedHeader(
            child: Container(
                color: Colors.blue[100],
                height: 100,
                child: const Text(
                  "I am a Pinned Header",
                  style: TextStyle(fontSize: 30),
                ))),
        SliverAnimatedPaintExtent(
          duration: const Duration(milliseconds: 150),
          child: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.pink[100],
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "$index",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },

            ),
          ),
        ),
      ]),
    );
  }
}
