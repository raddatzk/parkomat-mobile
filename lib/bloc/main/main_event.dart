part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {}

class InitializeAppEvent extends MainEvent {
  @override
  List<Object> get props => [];
}
