import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/select_btn_bloc/select_btn_event.dart';
import 'package:saletrackhing/bloc/select_btn_bloc/select_btn_state.dart';

class SelectBtnBloc extends Bloc<SelectBtnEvent, SelectBtnState> {
  SelectBtnBloc(SelectBtnState initialState) : super(initialState) {
    on(eventHandler);
  }

  FutureOr<void> eventHandler(
      SelectBtnEvent event, Emitter<SelectBtnState> emit) {
    if (event is SelectBtn) {
      emit(BtnSelected(event.btnType));
    }
  }
}
