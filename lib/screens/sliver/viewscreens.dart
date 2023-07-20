import 'package:flutter/material.dart';

class ViewScreens extends StatefulWidget {
  const ViewScreens({Key? key}) : super(key: key);

  @override
  State<ViewScreens> createState() => _ViewScreensState();
}

class _ViewScreensState extends State<ViewScreens> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            leading: const Icon(Icons.arrow_back),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Virat Kohli"),
              background: Image.asset("assets/img/image2.jpeg", fit: BoxFit.fill),
            ),
            actions: const [
              Icon(Icons.search),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.settings),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    leading: CircleAvatar(
                      backgroundColor: Colors.primaries[index],
                      child: Text("vfvc"),
                    ),);

              },
            ),
          )
        ],
      ),
    );
  }

}


