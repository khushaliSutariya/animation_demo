import 'dart:math';

import 'package:animation_demo/screens/home/homeview_cubit.dart';
import 'package:animation_demo/screens/view/nextscreens.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animation_demo/screens/widgets/pagtransination.dart';
import '../extention.dart';
import '../sliver/viewscreens.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit()..confettiWidget(),
      child: BlocBuilder<HomeViewCubit, HomeViewState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Animation"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ConfettiWidget(
                    blastDirectionality: BlastDirectionality.explosive,
                    confettiController: state.controller!,
                    emissionFrequency: 0.04,
                    numberOfParticles: 100,
                    maxBlastForce: 20,
                    minBlastForce: 5,
                    blastDirection: pi,
                    gravity: 0.2,
                    shouldLoop: false,
                    displayTarget: false,
                    minimumSize: const Size(20, 10),
                    maximumSize: const Size(30, 15),
                    particleDrag: 0.05,
                    canvas: MediaQuery.of(context).size,
                    colors: const [
                      Colors.green,
                      Colors.red,
                      Colors.yellow,
                      Colors.blue,
                      Colors.pink,
                      Colors.deepPurple,
                      Colors.black,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<HomeViewCubit>().confetti();
                        },
                        child: const Text("success")),
                  ),
                  const SizedBox(height: 20),
                  AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: Container(
                      width: 180,
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/img/image1.jpeg"), fit: BoxFit.fill)),
                    ),
                    secondChild: Container(
                      width: 200,
                      height: 180,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/img/image2.jpeg"), fit: BoxFit.fill)),
                    ),
                    crossFadeState: state.isFirstWidgetVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeViewCubit>().imageAnimation();
                    },
                    child: const Text('Tap here'),
                  ),
                  AnimatedPhysicalModel(
                      borderRadius: BorderRadius.circular(!state.first ? 0 : 100),
                      shape: BoxShape.rectangle,
                      elevation: !state.first ? 20 : 40,
                      color: Colors.blue,
                      shadowColor: !state.first ? Colors.blue : Colors.red,
                      duration: const Duration(seconds: 1),
                      child: const SizedBox(
                        height: 80,
                        width: 80,
                      )),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeViewCubit>().animatedPhysical();
                    },
                    child: const Text('tap here'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: AnimatedContainer(
                      width: state.width,
                      height: state.height,
                      decoration: BoxDecoration(
                        color: state.color,
                        borderRadius: state.borderRadius,
                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<HomeViewCubit>().animationData();
                      },
                      child: const Text("Tapped")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context, PageTransition(type: PageTransitionType.bottomToTop, child: const ViewScreens()));
                      },
                      child: const Text("Home Screens")),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(context.read<HomeViewCubit>().createRoute());
                        // pushToScreen(context);
                        // print(NumberParsing('42').parseInt());
                        // Navigator.push(context, context.read<HomeViewCubit>().createRoute(const NextScreens()));
                        // const NextScreens().pushToScreen(context,routeName: "/NextScreens");
                        // const NextScreens().createRoute(const NextScreens());
                        // createRoute(const NextScreens());
                        Navigator.of(context).push(createRoute(const NextScreens()));
                        },
                      child: const Text("First Screens")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
