import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_event.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/globals.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';
import 'package:saletrackhing/views/otp.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  // final AuthBloc _authBloc = AuthBloc(LoginWithMobileFormInitial());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget btn() => SizedBox(
          height: 50,
          width: double.infinity,
          child: BlocConsumer(
              bloc: authBloc,
              listener: (context, state) {
                if (state is SMSCodeSent) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OtpScreen(
                            verificationId: state.verificationId,
                            mobileNumber: '+91' + _mobileController.text,
                          )));
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    authBloc.add(SubmitMobileNumber(
                        mobileNumber: '+91' + _mobileController.text));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Get OTP',
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
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff307FE4))),
                );
              }),
        );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hey,\nLogin Now',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Constants.fontColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Sign in to get code',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff374957)),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Mobile Number',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Constants.fontColor),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _mobileController,
                    decoration: InputDecoration(
                        hintText: "+91 7757878542",
                        hintStyle: const TextStyle(color: Color(0xffC4C4C4)),
                        prefixIcon: Image.asset(
                          'assets/images/twemoji_flag-india.png',
                          scale: 4,
                        ),
                        suffixIcon: Image.asset(
                          'assets/images/bi_phone-vibrate.png',
                          scale: 4,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xffE5E5E5),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  btn()
                ],
              ),
            ),
            if (authBloc.state is LoginLoading) loader()
          ],
        ),
      ),
    );
  }
}
