part of 'wakure_bloc.dart';

class WakureState extends Equatable {
  //arguments
  final List<Wakure> wakures;
  final Map<String, bool> availableForBooking;

  WakureState({Map<String, bool>? availableForBooking, List<Wakure>? wakures})
      : wakures = wakures ?? [],
        availableForBooking = availableForBooking ?? {};

  //create copywith
  WakureState copyWith({
    List<Wakure>? wakures,
    Map<String, bool>? availableForBooking,
  }) {
    return WakureState(
      availableForBooking: availableForBooking ?? this.availableForBooking,
      wakures: wakures ?? this.wakures,
    );
  }

  @override
  List<Object> get props => [wakures, availableForBooking];
}
