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
    on<RemoveWakureEvent>(_removeWakure);
    on<EditWakureEvent>(_editWakure);
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
      event.id,
      event.wakureName,
      event.wakureCode,
    );

    //print(response.data);
  }

// delete wakure

  Future<void> _deleteWakure(
      DeleteWakureEvent event, Emitter<WakureState> emit) async {
    final Response response =
        await WakureService.deleteWakure(event.id, event.user_id);
  }

  Future<void> _removeWakure(
      RemoveWakureEvent event, Emitter<WakureState> emit) async {
    emit(state.copyWith(
      wakures: state.wakures.where((wakure) => wakure.id != event.id).toList(),
    ));
  }

  // edit wakure

  Future<void> _editWakure(
      EditWakureEvent event, Emitter<WakureState> emit) async {
    final Response response = await WakureService.editWakureName(
      event.wakureId,
      event.wakureName,
      event.userId,
    );
    print('editWakure desde bloc');
    print(response);
  }
}
