import 'package:equatable/equatable.dart';

class CheckInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnTap extends CheckInEvent {
  final bool isCheckin;
  OnTap(this.isCheckin);
  @override
  List<Object?> get props => [isCheckin];
}
