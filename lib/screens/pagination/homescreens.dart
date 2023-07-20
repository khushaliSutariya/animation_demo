import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final ScrollController _controller = ScrollController();

  late int _count = 40;
  final List<int> _data = [for (var i = 0; i < 40; i++) i];
  Future<List<int>> _fetch(int count) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => _data.where((element) => element < count).toList(),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pagination")),
      body: FutureBuilder(
        future: _fetch(_count),
        builder: (BuildContext context, AsyncSnapshot<List<int>?> snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final controller = ScrollController();
          controller.addListener(() {
            final position =
                controller.offset / controller.position.maxScrollExtent;
            if (data.length == _count && _count < _data.length) {
              setState(() {
                _count += 50;
              });
            }
          });
          return ScrollListener(
            threshold: 0.8,
            builder: (context, controller) {
              final listView = ListView.builder(
                controller: controller,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("Item number - ${data[index]}"));
                },
              );

              return Stack(
                children: [
                  listView,
                  Visibility(
                    visible: data.length != _count,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            },
            loadNext: () {
              if (data.length == _count && _count < _data.length) {
                setState(() {
                  _count += 10;
                });
              }
            },
          );
        },
      ),
    );
  }
}

class ScrollListener extends StatefulWidget {
  final Widget Function(BuildContext, ScrollController) builder;
  final VoidCallback loadNext;
  final double threshold;
  ScrollListener({super.key,
    required this.threshold,
    required this.builder,
    required this.loadNext,
  });

  @override
  _ScrollListener createState() => _ScrollListener();
}

class _ScrollListener extends State<ScrollListener> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final rate = _controller.offset / _controller.position.maxScrollExtent;
      if (widget.threshold <= rate) {
        widget.loadNext();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}