part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {}

class MainInitialState extends MainState {
  @override
  List<Object> get props => [];
}

class LoadedMainState extends MainState {
  final FreeSpotStatistics stats;
  final String baseUrl;

  LoadedMainState(this.stats, this.baseUrl);

  @override
  List<Object> get props => [stats];
}

class UnsetMainState extends MainState {
  @override
  List<Object> get props => [];
}

class OutdatedVersionMainState extends MainState {
  final String version;

  OutdatedVersionMainState(this.version);

  @override
  List<Object> get props => [version];
}

class Error404MainState extends MainState {
  @override
  List<Object> get props => [];
}
