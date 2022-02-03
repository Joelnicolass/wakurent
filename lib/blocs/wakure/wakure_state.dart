part of 'wakure_bloc.dart';

class WakureState extends Equatable {
  //arguments
  final List<Wakure> wakures;
  final bool processRequest;
  final String error;
  final bool wakureCreated;

  WakureState({bool? processRequest, List<Wakure>? wakures, String? error, bool? wakureCreated})
      : wakures = wakures ?? [],
        processRequest = processRequest ?? false,
        error = error ?? '',
        wakureCreated = wakureCreated ?? false
        ;

  //create copywith
  WakureState copyWith({
    List<Wakure>? wakures,
    bool? processRequest,
    String? error,
    bool? wakureCreated,
  }) {
    return WakureState(
      wakures: wakures ?? this.wakures,
      processRequest: processRequest ?? this.processRequest,
      error: error ?? this.error,
      wakureCreated: wakureCreated ?? this.wakureCreated
    );
  }

  @override
  List<Object> get props => [wakures, processRequest, error, wakureCreated];
}
