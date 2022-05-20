import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:saletrackhing/bloc/bottom_navigation_bloc/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc(initialState) : super(initialState) {
    on(eventHandler);
  }

  FutureOr<void> eventHandler(
      BottomNavigationEvent event, Emitter<BottomNavigationState> emit) {
    if (event is OnTap) {
      emit(OnTapped(event.index));
    }
  }
}
