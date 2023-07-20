import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sliver_state.dart';

class SliverCubit extends Cubit<SliverState> {
  SliverCubit() : super(SliverState());
}
