import 'package:equatable/equatable.dart';

class SelectBtnEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectBtn extends SelectBtnEvent {
  final String btnType;
  SelectBtn(this.btnType);
  @override
  List<Object?> get props => [btnType];
}
