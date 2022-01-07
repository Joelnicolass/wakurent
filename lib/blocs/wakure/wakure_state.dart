part of 'wakure_bloc.dart';

class WakureState extends Equatable {
  //arguments
  final List<WakureElement> wakures;

  WakureState({List<WakureElement>? wakures}) : wakures = wakures ?? [];

  //create copywith
  WakureState copyWith({List<WakureElement>? wakures}) =>
      WakureState(wakures: wakures ?? this.wakures);

  @override
  List<Object> get props => [wakures];
}
