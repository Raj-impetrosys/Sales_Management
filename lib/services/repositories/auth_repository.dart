class AuthRepository {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // String message = '';

  // Future<String> phoneSignIn({required String phoneNumber}) async {
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: "9977783414",
  //       verificationCompleted: _onVerificationCompleted,
  //       verificationFailed: _onVerificationFailed,
  //       codeSent: _onCodeSent,
  //       codeAutoRetrievalTimeout: _onCodeTimeout);
  //   return message;
  // }

  // _onVerificationCompleted(PhoneAuthCredential authCredential) async {
  //   print("verification completed ${authCredential.smsCode}");
  //   message = 'verification completed';
  //   User? user = FirebaseAuth.instance.currentUser;
  //   // setState(() {
  //   // this.otpCode.text = authCredential.smsCode!;
  //   // });
  //   if (authCredential.smsCode != null) {
  //     try {
  //       UserCredential credential =
  //           await user!.linkWithCredential(authCredential);
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'provider-already-linked') {
  //         await _auth
  //             .signInWithCredential(authCredential)
  //             .then((UserCredential value) => message = value.user!.email!);
  //       }
  //     }
  //     // setState(() {
  //     //   isLoading = false;
  //     // });
  //     // Navigator.pushNamedAndRemoveUntil(
  //     //     context, Constants.homeNavigate, (route) => false);
  //   }
  // }

  // _onVerificationFailed(FirebaseAuthException exception) {
  //   if (exception.code == 'invalid-phone-number') {
  //     showMessage("The phone number entered is invalid!");
  //     message = 'The phone number entered is invalid!';
  //   }
  // }

  // _onCodeSent(String verificationId, int? forceResendingToken) {
  //   // this.verificationId = verificationId;
  //   print(forceResendingToken);
  //   print("code sent");
  //   message = 'code send';
  // }

  // _onCodeTimeout(String timeout) {
  //   message = 'timeout';
  //   return null;
  // }

  // void showMessage(String errorMessage) {
  //   // showDialog(
  //   //     context: context,
  //   //     builder: (BuildContext builderContext) {
  //   //       return AlertDialog(
  //   //         title: Text("Error"),
  //   //         content: Text(errorMessage),
  //   //         actions: [
  //   //           TextButton(
  //   //             child: Text("Ok"),
  //   //             onPressed: () async {
  //   //               Navigator.of(builderContext).pop();
  //   //             },
  //   //           )
  //   //         ],
  //   //       );
  //   //     }).then((value) {
  //   //   // setState(() {
  //   //   //   isLoading = false;
  //   //   // });
  //   // });
  // }
}
