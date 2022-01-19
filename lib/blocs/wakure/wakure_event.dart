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
  final String id;

  SaveNewWakureEvent(
      {required this.wakureName, required this.wakureCode, required this.id});

  @override
  List<Object> get props => [wakureName, wakureCode, id];
}

class DeleteWakureEvent extends WakureEvent {
  final id;
  final user_id;

  DeleteWakureEvent({required this.id, required this.user_id});

  @override
  List<Object> get props => [id, user_id];
}

// remove wakure from list

class RemoveWakureEvent extends WakureEvent {
  final id;

  RemoveWakureEvent({required this.id});

  @override
  List<Object> get props => [id];
}

// add wakure to list
