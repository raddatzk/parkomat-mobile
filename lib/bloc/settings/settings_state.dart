part of 'settings_bloc.dart';

@immutable
abstract class SettingsState extends Equatable {}

class InitialSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}

class InvalidBaseUrlSettingsState extends SettingsState {
  final TextEditingController controller;

  InvalidBaseUrlSettingsState(this.controller);

  @override
  List<Object> get props => [controller];
}

class TryBaseUrlSettingsState extends SettingsState {
  @override
  List<Object> get props => [];
}

class LoadedSettingsState extends SettingsState {
  final TextEditingController controller;

  LoadedSettingsState(this.controller);

  @override
  List<Object> get props => [controller];
}
