import 'package:equatable/equatable.dart';

class DropDownState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TotalSalesDateRangeChanged extends DropDownState {
  final String dropDownValue;
  TotalSalesDateRangeChanged(this.dropDownValue);
  @override
  List<Object?> get props => [dropDownValue];
}
