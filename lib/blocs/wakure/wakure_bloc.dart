import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:walkiler/models/models.dart';
import 'package:walkiler/models/wakure.dart';
import 'package:walkiler/services/services.dart';
import 'package:walkiler/services/wakure_service.dart';

part 'wakure_event.dart';
part 'wakure_state.dart';

class WakureBloc extends Bloc<WakureEvent, WakureState> {
  WakureBloc() : super(WakureState()) {
    on<OnGetWakuresEvent>(_onGetWakuresEvent);
    on<SaveNewWakureEvent>(_saveWakure);
    on<DeleteWakureEvent>(_deleteWakure);
    on<EditWakureEvent>(_editWakure);
    on<ProcessRequestEvent>(_processRequestEvent);
  }
  _onGetWakuresEvent(OnGetWakuresEvent event, Emitter<WakureState> emit) {
    emit(state.copyWith(
      wakures: event.wakures,
      processRequest: false,
    ));
  }

// add new wakure
  Future<void> _saveWakure(
      SaveNewWakureEvent event, Emitter<WakureState> emit) async {
    final Response response = await WakureService.saveWakure(
      event.id,
      event.wakureName,
      event.wakureCode,
    );

    if (response.statusCode == 200) {
      emit(state.copyWith(
        wakures: state.wakures,
        processRequest: false,
      ));
    } else {
      emit(state.copyWith(
        wakures: state.wakures,
        processRequest: false,

        /* error: response.data['error'], */
      ));
    }
  }

// delete wakure

  Future<void> _deleteWakure(
      DeleteWakureEvent event, Emitter<WakureState> emit) async {
    final Response response =
        await WakureService.deleteWakure(event.id, event.user_id);

    if (response.statusCode == 200) {
      emit(state.copyWith(
        wakures:
            state.wakures.where((wakure) => wakure.id != event.id).toList(),
        processRequest: false,
      ));
    }
  }

  // edit wakure

  Future<void> _editWakure(
      EditWakureEvent event, Emitter<WakureState> emit) async {
    final Response response = await WakureService.editWakureName(
      event.wakureId,
      event.wakureName,
      event.userId,
    );
  }

  Future<void> _processRequestEvent(
      ProcessRequestEvent event, Emitter<WakureState> emit) async {
    emit(state.copyWith(
      processRequest: true,
      wakures: state.wakures,
    ));
  }
}
