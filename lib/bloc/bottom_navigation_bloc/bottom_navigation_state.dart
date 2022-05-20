import 'package:equatable/equatable.dart';

class BottomNavigationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnTapped extends BottomNavigationState {
  final int index;
  OnTapped(this.index);
  @override
  List<Object?> get props => [index];
}
