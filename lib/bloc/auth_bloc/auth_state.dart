import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class SignedInWithPhone extends AuthState {
  final String message;
  SignedInWithPhone(this.message);

  @override
  String toString() => 'SignedInWithPhone: $message';
}

class LoginLoading extends AuthState {
  @override
  String toString() => 'LoginLoading';

  @override
  List<Object> get props => [];
}

class SMSCodeSent extends AuthState {
  final String verificationId;
  SMSCodeSent(this.verificationId);

  @override
  List<Object> get props => [verificationId];
}

class LoginWithMobileFormState extends AuthState {
  final String mobileNumber;
  final String errorMsg;

  LoginWithMobileFormState({required this.mobileNumber, required this.errorMsg})
      : super();

  @override
  String toString() =>
      'LoginWithMobileFormState mobileNumber : $mobileNumber errorMsg : $errorMsg';

  @override
  List<Object> get props => [mobileNumber, errorMsg];
}

class LoginWithMobileFormInitial extends AuthState {
  @override
  String toString() => 'LoginWithMobileFormInitial';

  @override
  List<Object> get props => [];
}

class LoadingState extends AuthState {
  @override
  String toString() => 'LoadingState';

  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  final String error;

  ErrorState({required this.error}) : super();

  @override
  String toString() => 'ErrorState { error: $error }';

  @override
  List<Object> get props => [error];
}

class VerificationCompleteState extends AuthState {
  final String mobileNumber;
  VerificationCompleteState({required this.mobileNumber}) : super();

  @override
  String toString() =>
      'VerificationCompleteState { mobileNumber: $mobileNumber }';

  @override
  List<Object> get props => [mobileNumber];
}

class VerificationErrorState extends AuthState {
  final String mobileNumber;
  final String error;
  VerificationErrorState({required this.mobileNumber, required this.error})
      : super();

  @override
  String toString() =>
      'VerificationCompleteState { mobileNumber: $mobileNumber Error: $error}';

  @override
  List<Object> get props => [mobileNumber, error];
}
