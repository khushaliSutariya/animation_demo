part of 'sliver_cubit.dart';



class SliverState extends Equatable {
   TabController? tabController;
   SliverState({this.tabController});
  @override
  // TODO: implement props
  List<Object?> get props => [tabController];

   SliverState copyWith({
    TabController? tabController,
  }) {
    return SliverState(
      tabController: tabController ?? this.tabController,
    );
  }
}
