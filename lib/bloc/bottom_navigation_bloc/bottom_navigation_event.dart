import 'package:equatable/equatable.dart';

class BottomNavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnTap extends BottomNavigationEvent {
  final int index;
  OnTap(this.index);
  @override
  List<Object?> get props => [index];
}
