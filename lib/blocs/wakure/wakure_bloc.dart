import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/wakure.dart';
import 'package:walkiler/services/wakure_service.dart';

part 'wakure_event.dart';
part 'wakure_state.dart';

class WakureBloc extends Bloc<WakureEvent, WakureState> {
  WakureBloc() : super(WakureState()) {
    on<OnGetWakuresEvent>(_onGetWakuresEvent);
    on<SaveNewWakureEvent>(_saveWakure);
    on<DeleteWakureEvent>(_deleteWakure);
  }
  _onGetWakuresEvent(OnGetWakuresEvent event, Emitter<WakureState> emit) {
    print("evento " + event.wakures.toString());
    emit(state.copyWith(
      wakures: event.wakures,
    ));
  }

// add new wakure
  Future<void> _saveWakure(
      SaveNewWakureEvent event, Emitter<WakureState> emit) async {
    final Response response = await WakureService.saveWakure(
      event.wakureName,
      event.wakureCode,
    );

    //print(response.data);
  }

// delete wakure

  Future<void> _deleteWakure(
      DeleteWakureEvent event, Emitter<WakureState> emit) async {
    final Response response = await WakureService.deleteWakure(
      event.id,
    );
}
}