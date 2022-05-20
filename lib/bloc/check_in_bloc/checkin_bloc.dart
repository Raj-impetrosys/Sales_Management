import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/check_in_bloc/checkin_event.dart';
import 'package:saletrackhing/bloc/check_in_bloc/checkin_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  CheckInBloc(CheckInState initialState) : super(initialState) {
    on(eventHandler);
  }

  FutureOr<void> eventHandler(CheckInEvent event, Emitter<CheckInState> emit) {
    if (event is OnTap) {
      emit(BtnTapped(event.isCheckin));
    }
  }
}
