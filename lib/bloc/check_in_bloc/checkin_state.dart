import 'package:equatable/equatable.dart';

class CheckInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BtnTapped extends CheckInState {
  final bool isCheckin;
  BtnTapped(this.isCheckin);
  @override
  List<Object?> get props => [isCheckin];
}
