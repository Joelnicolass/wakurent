part of 'wakure_bloc.dart';

abstract class WakureEvent extends Equatable {
  const WakureEvent();

  @override
  List<Object> get props => [];
}

class OnGetWakuresEvent extends WakureEvent {
  final List<Wakure> wakures;

  const OnGetWakuresEvent({required this.wakures});

  @override
  List<Object> get props => [wakures];
}

class SaveNewWakureEvent extends WakureEvent {
  final String wakureName;
  final String wakureCode;

  SaveNewWakureEvent({required this.wakureName, required this.wakureCode});

  @override
  List<Object> get props => [wakureName, wakureCode];
}

class DeleteWakureEvent extends WakureEvent {
  final id;

  DeleteWakureEvent({required this.id});

  @override
  List<Object> get props => [id];
}
