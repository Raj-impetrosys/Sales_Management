import 'package:equatable/equatable.dart';

abstract class LocalizationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeLanguage extends LocalizationEvent {
  final String languageCode;
  ChangeLanguage(this.languageCode);
  @override
  List<Object?> get props => [languageCode];
}
