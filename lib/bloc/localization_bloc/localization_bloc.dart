import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_event.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc(initialState) : super(initialState) {
    on(handleLocalization);
  }

  LocalizationState get initialState => LanguageChanged('en');

  FutureOr<void> handleLocalization(
      LocalizationEvent event, Emitter<LocalizationState> emit) async {
    emit(Loading());
    if (event is ChangeLanguage) {
      await Future.delayed(const Duration(seconds: 1))
          .whenComplete(() => emit(LanguageChanged(event.languageCode)));
    }
  }
}
