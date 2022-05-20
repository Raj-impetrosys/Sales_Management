import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/dropdown_bloc/dropdown_event.dart';
import 'package:saletrackhing/bloc/dropdown_bloc/dropdown_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc(initialState) : super(initialState) {
    on(eventHandler);
  }

  FutureOr<void> eventHandler(
      DropDownEvent event, Emitter<DropDownState> emit) {
    if (event is TotalSalesDateRangeChange) {
      emit(TotalSalesDateRangeChanged(event.dropDownValue));
    }
  }
}
