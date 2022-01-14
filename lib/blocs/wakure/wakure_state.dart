part of 'wakure_bloc.dart';

class WakureState extends Equatable {
  //arguments
  final List<Wakure> wakures;

  WakureState({Map<String, bool>? availableForBooking, List<Wakure>? wakures})
      : wakures = wakures ?? [];

  //create copywith
  WakureState copyWith({
    List<Wakure>? wakures,
  }) {
    return WakureState(
      wakures: wakures ?? this.wakures,
    );
  }

  @override
  List<Object> get props => [wakures];
}
