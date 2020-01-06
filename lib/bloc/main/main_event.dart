part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class InitMainEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

class RefreshMainEvent extends MainEvent {
  final BuildContext context;

  RefreshMainEvent(this.context);

  @override
  List<Object> get props => [];
}

class SetBaseUrlMainEvent extends MainEvent {
  final BuildContext context;
  final bool replacement;

  SetBaseUrlMainEvent(this.context, this.replacement);

  @override
  List<Object> get props => [context, replacement];
}

class Error404MainEvent extends MainEvent {
  final BuildContext context;

  Error404MainEvent(this.context);

  @override
  List<Object> get props => [context];
}

class OutdatedVersionMainEvent extends MainEvent {
  final BuildContext context;
  final String version;

  OutdatedVersionMainEvent(this.context, this.version);

  @override
  List<Object> get props => [context];
}
