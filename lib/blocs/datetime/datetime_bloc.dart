import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'datetime_event.dart';
part 'datetime_state.dart';

class DatetimeBloc extends Bloc<DatetimeEvent, DatetimeState> {
  DatetimeBloc() : super(DatetimeInitial()) {
    on<DatetimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
