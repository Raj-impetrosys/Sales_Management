import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_bloc.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_event.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/flushbar.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';
import 'package:saletrackhing/views/bottom_navigation_bar.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final String mobileNumber;
  final OtpFieldController _otpController = OtpFieldController();
  final AuthBloc _authBloc = AuthBloc(LoginWithMobileFormInitial());

  OtpScreen(
      {Key? key, required this.verificationId, required this.mobileNumber})
      : super(key: key);
  String? smsCode;

  @override
  Widget build(BuildContext context) {
    Widget otpField() => OTPTextField(
          controller: _otpController,
          length: 6,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 50,
          style: const TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.box,
          onCompleted: (pin) {
            // _signIn(pin);
            smsCode = pin;
            _authBloc.add(
                SubmitSmsCode(smsCode: pin, verificationId: verificationId));
          },
          // otpFieldStyle: OtpFieldStyle(
          //   borderColor: Color.fromARGB(255, 217, 11, 11),
          // ),
        );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify Your Phone Number',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Constants.fontColor),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Enter OTP we just sent to your phone number',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff374957)),
              ),
              const SizedBox(
                height: 50,
              ),
              otpField(),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text('Didn’t you receive any code'),
                    TextButton(
                        onPressed: () {
                          _otpController.clear();
                          _authBloc.add(
                              ResendOtpAndVerify(mobileNumber: mobileNumber));
                        },
                        child: const Text(
                          'Resend',
                          style: TextStyle(
                            color: Color(0xff363853),
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              btn()
            ],
          ),
        ),
      ),
    );
  }

  Widget btn() => SizedBox(
        height: 50,
        width: double.infinity,
        child: BlocConsumer(
          bloc: _authBloc,
          listener: (context, state) {
            if (state is VerificationCompleteState) {
              showFlushBar(message: 'Login Successfully', context: context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const CustomBottomNavigationBar()));
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                _authBloc.add(SubmitSmsCode(
                    smsCode: smsCode!, verificationId: verificationId));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (state is LoginLoading)
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        loader(color: Colors.white)
                      ],
                    )
                ],
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff307FE4))),
            );
          },
        ),
      );
}
