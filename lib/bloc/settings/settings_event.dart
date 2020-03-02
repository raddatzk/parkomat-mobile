part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {}

class SetBaseUrlSettingsEvent extends SettingsEvent {
  final BuildContext context;

  SetBaseUrlSettingsEvent(this.context);

  @override
  List<Object> get props => [context];
}

class InitSettingsEvent extends SettingsEvent {
  @override
  List<Object> get props => [];
}
