import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class SubmitMobileNumber extends AuthEvent {
  final String mobileNumber;
  SubmitMobileNumber({required this.mobileNumber});

  @override
  String toString() => 'SubmitMobileNumber $mobileNumber';

  @override
  List<Object> get props => [mobileNumber];
}

class SubmitSmsCode extends AuthEvent {
  final String verificationId;
  final String smsCode;
  SubmitSmsCode({required this.smsCode, required this.verificationId});

  @override
  String toString() =>
      'SubmitSmsCode smsCode $smsCode verificationId $verificationId';

  @override
  List<Object> get props => [verificationId, smsCode];
}

class SmsCodeSend extends AuthEvent {
  final String mobileNumber;
  SmsCodeSend({required this.mobileNumber});

  @override
  String toString() => 'SubmitMobileNumber mobileNumber $mobileNumber';

  @override
  List<Object> get props => [mobileNumber];
}

class VerificationComplete extends AuthEvent {
  final String mobileNumber;
  VerificationComplete({required this.mobileNumber});

  @override
  String toString() => 'VerificationComplete mobileNumber $mobileNumber';

  @override
  List<Object> get props => [mobileNumber];
}

class TriggerError extends AuthEvent {
  final String error;
  TriggerError({required this.error});

  @override
  String toString() => 'TriggerError Error : $error';

  @override
  List<Object> get props => [error];
}

class ResendOtpAndVerify extends AuthEvent {
  final String mobileNumber;
  ResendOtpAndVerify({required this.mobileNumber});

  @override
  String toString() => 'ResendOtpAndVerify mobileNumber $mobileNumber';

  @override
  List<Object> get props => [mobileNumber];
}
