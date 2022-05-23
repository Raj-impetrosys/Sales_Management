import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_event.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_state.dart';
import 'package:saletrackhing/globals/shared_preference.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(initialState) : super(initialState) {
    on(authHandler);
  }

  FutureOr<void> authHandler(AuthEvent event, Emitter<AuthState> emit) async {
    if (event is CheckAuthStatus) {
      await SharedPreference.getIsLogin().then((isLogin) {
        if (isLogin) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      });
    }
    if (event is SubmitMobileNumber) {
      emit(LoginLoading());
      await getOTP(event.mobileNumber, emit);
    }
    if (event is SubmitSmsCode) {
      emit(LoginLoading());
      await _signIn(
          otp: event.smsCode, verificationId: event.verificationId, emit: emit);
    }

    if (event is ResendOtpAndVerify) {
      await getOTP(event.mobileNumber, emit);
    }

    if (event is VerificationComplete) {
      emit(VerificationCompleteState(mobileNumber: event.mobileNumber));
    }
  }

  getOTP(mobileNumber, emit1) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          debugPrint("verification completed: ${phoneAuthCredential.smsCode}");
          emit(VerificationCompleteState(mobileNumber: mobileNumber));
          // _verificationId = phoneAuthCredential.verificationId;
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {
          debugPrint("error: ${firebaseAuthException.message}");
          emit(ErrorState(error: firebaseAuthException.message!));
        },
        codeSent: (verificationId, i) {
          debugPrint("codeSent: $verificationId $i");
          emit(SMSCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (s) {
          debugPrint("codeAutoRetrievalTimeout: $s");
          emit(ErrorState(error: s));
        });
  }

  Future _signIn(
      {required String otp, required String verificationId, emit}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      var user = FirebaseAuth.instance.currentUser;
      user!.delete().then((_) {
        add(VerificationComplete(mobileNumber: user.phoneNumber!));
        // SharedPreference.saveUserDetail(userId: user.uid, isLogin: true);
        SharedPreference.saveUser(user: user);
      });
    }).catchError((e) {
      // add(TriggerError(error: e));
      emit(ErrorState(error: 'Invalid verification code'));
      throw ('Invalid verification code');
    });
  }
}
