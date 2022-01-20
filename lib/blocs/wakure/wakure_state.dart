part of 'wakure_bloc.dart';

class WakureState extends Equatable {
  //arguments
  final List<Wakure> wakures;
  final bool processRequest;

  WakureState(
      {bool? processRequest,
      Map<String, bool>? availableForBooking,
      List<Wakure>? wakures})
      : wakures = wakures ?? [],
        processRequest = processRequest ?? false;

  //create copywith
  WakureState copyWith({
    List<Wakure>? wakures,
    bool? processRequest,
  }) {
    return WakureState(
      wakures: wakures ?? this.wakures,
      processRequest: processRequest ?? this.processRequest,
    );
  }

  @override
  List<Object> get props => [wakures, processRequest];
}
