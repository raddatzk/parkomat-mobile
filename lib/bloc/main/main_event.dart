part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

abstract class UiMainEvent extends MainEvent {}

class InitMainEvent extends UiMainEvent {
  @override
  List<Object> get props => [];
}

class RefreshMainEvent extends UiMainEvent {
  @override
  List<Object> get props => [];
}

class UpdateApkMainEvent extends MainEvent {
  @override
  List<Object> get props => [];
}
