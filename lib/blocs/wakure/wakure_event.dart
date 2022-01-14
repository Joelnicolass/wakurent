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

class CheckAvailability extends WakureEvent {
  final bool availabilityForBooking;

  const CheckAvailability({required this.availabilityForBooking});

  @override
  List<Object> get props => [availabilityForBooking];
}
