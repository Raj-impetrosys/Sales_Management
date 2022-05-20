import 'package:equatable/equatable.dart';

class DropDownEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TotalSalesDateRangeChange extends DropDownEvent {
  final String dropDownValue;
  TotalSalesDateRangeChange(this.dropDownValue);
  @override
  List<Object?> get props => [dropDownValue];
}
