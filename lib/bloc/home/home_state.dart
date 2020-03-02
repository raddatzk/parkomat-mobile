part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  List<Object> get props => [];
}

class LoadingMainState extends HomeState {
  List<Object> get props => [];
}

class ShowStats extends HomeState {
  final FreeSpotStatistics stats;

  ShowStats(this.stats);

  List<Object> get props => [stats];
}

class CheckConnection extends HomeState {
  @override
  List<Object> get props => [];
}
