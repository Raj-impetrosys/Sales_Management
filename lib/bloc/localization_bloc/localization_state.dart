import 'package:equatable/equatable.dart';

abstract class LocalizationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends LocalizationState {}

class LanguageChanged extends LocalizationState {
  final String languageCode;
  LanguageChanged(this.languageCode);
  @override
  List<Object?> get props => [languageCode];

  @override
  String toString() => 'LanguageChanged $languageCode';
}
