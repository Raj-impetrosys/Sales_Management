import 'package:equatable/equatable.dart';

class SelectBtnState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BtnSelected extends SelectBtnState {
  final String btnType;
  BtnSelected(this.btnType);
  @override
  List<Object?> get props => [btnType];
}
