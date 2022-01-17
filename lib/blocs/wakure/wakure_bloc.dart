import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/wakure.dart';

part 'wakure_event.dart';
part 'wakure_state.dart';

class WakureBloc extends Bloc<WakureEvent, WakureState> {
  WakureBloc() : super(WakureState()) {
    on<OnGetWakuresEvent>( _onGetWakuresEvent );

    
  }
  _onGetWakuresEvent(OnGetWakuresEvent event, Emitter<WakureState> emit) {
    print("evento " + event.wakures.toString());
      emit(state.copyWith(
        wakures: event.wakures,
      ));
    }
}
