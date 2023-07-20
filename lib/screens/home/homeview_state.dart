part of 'homeview_cubit.dart';

class HomeViewState extends Equatable {
  double width;
  double height;
  Color color;
  BorderRadiusGeometry borderRadius;
  bool isFirstWidgetVisible;
  bool first;
  ConfettiController? controller;
  HomeViewState(
      {required this.width,
      required this.height,
      required this.color,
      required this.borderRadius,
      required this.isFirstWidgetVisible,required this.first,this.controller});
  @override
  List<Object?> get props => [color, width, height, borderRadius,isFirstWidgetVisible,first,controller];

  HomeViewState copyWith({
    double? width,
    double? height,
    Color? color,
    BorderRadiusGeometry? borderRadius,
    bool? isFirstWidgetVisible,
    bool? first,
    ConfettiController? controller,
  }) {
    return HomeViewState(
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      borderRadius: borderRadius ?? this.borderRadius,
      isFirstWidgetVisible: isFirstWidgetVisible ?? this.isFirstWidgetVisible,
      first: first ?? this.first,
      controller: controller ?? this.controller,
    );
  }
}
