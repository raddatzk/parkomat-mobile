part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {}

class InitialSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}

class Loading extends SettingsState {
  final bool loading;

  Loading(this.loading);

  @override
  List<Object> get props => [loading];
}

class CheckConnection extends SettingsState {
  @override
  List<Object> get props => [];
}

class CheckUrl extends SettingsState {
  @override
  List<Object> get props => [];
}
