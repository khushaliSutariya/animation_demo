import 'dart:math';

import 'package:animation_demo/screens/sliver/viewscreens.dart';
import 'package:bloc/bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'homeview_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit()
      : super(HomeViewState(
            width: 50.0,
            height: 50.0,
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            isFirstWidgetVisible: true,first: true));

  void animationData() {
    final random = Random();
    var width = random.nextInt(300).toDouble();
    var height = random.nextInt(300).toDouble();
    var color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    var borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    emit(state.copyWith(width: width, height: height, borderRadius: borderRadius, color: color));
  }

  void imageAnimation(){
    emit(state.copyWith(isFirstWidgetVisible: !state.isFirstWidgetVisible));
  }
  void animatedPhysical(){
    emit(state.copyWith(first:!state.first));
  }

  void confettiWidget(){
    state.controller = ConfettiController(
      duration: const Duration(seconds: 1),
    );
  }
  void confetti(){
    state.controller!.play();
  }
  PageRouteBuilder createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return (widget);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}
