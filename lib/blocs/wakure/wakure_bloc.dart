import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/wakure.dart';

part 'wakure_event.dart';
part 'wakure_state.dart';

class WakureBloc extends Bloc<WakureEvent, WakureState> {
  WakureBloc() : super(WakureState()) {
    on<OnGetWakuresEvent>((event, emit) {
      emit(state.copyWith(
          wakures: event.wakures,
          availableForBooking: state.availableForBooking));
    });

    _onGetWakuresEvent(OnGetWakuresEvent event, Emitter<WakureState> emit) {
      emit(state.copyWith(
          wakures: event.wakures,
          availableForBooking: state.availableForBooking));
    }
  }
}
