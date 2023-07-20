import 'dart:math';

import 'package:animation_demo/screens/sliver/sliverdelegate.dart';
import 'package:flutter/material.dart';

class SliverScreens extends StatefulWidget {
  const SliverScreens({Key? key}) : super(key: key);

  @override
  State<SliverScreens> createState() => _SliverScreensState();
}

class _SliverScreensState extends State<SliverScreens> {
  final ScrollController _controller = ScrollController();
  static const double _appBarBottomBtnPosition = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepOrangeAccent.shade100,
            iconTheme: const IconThemeData(color: Colors.white),
            leading: const Icon(Icons.arrow_back),
            floating: false,
            pinned: true,
            snap: false,
            stretch: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Transform.translate(
                offset: const Offset(130.0, _appBarBottomBtnPosition),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double size = min(constraints.constrainHeight(), 210.0);
                double myWidth = 190.0 - (_controller.hasClients ? _controller.offset * 0.4 : 0.0);
                print("myWidth========+++$myWidth");
                return FlexibleSpaceBar(
                  centerTitle: false,
                  collapseMode: CollapseMode.pin,
                  title: const Padding(
                    padding: EdgeInsetsDirectional.only(start: 20.0,bottom: 10.0),
                    child: Text("Sliver", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ),
                  background: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                              child: SizedBox(
                                height: 40.0,
                                width: 250.0,
                                child: TextField(
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    filled: true,
                                    prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'Search',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40.0,
                              width: 75.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(child: Text("Filters")),
                            )
                          ],
                        ),

                        Container(
                          width: max(100.0, myWidth),
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Image(
                              image: AssetImage("assets/img/image1.jpeg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      leading: CircleAvatar(
                        backgroundColor: Colors.primaries[index],
                        child: const Text("item"),
                      ),
                      title: const Text("item"),
                      trailing: const Icon(Icons.more_vert)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
