import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_event.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/globals.dart';
import 'package:saletrackhing/views/bottom_navigation_bar.dart';
import 'package:saletrackhing/views/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3)).whenComplete(() =>
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: authBloc..add(CheckAuthStatus()),
        listener: (context, state) {
          if (state is Authenticated) {
            Future.delayed(const Duration(seconds: 3)).whenComplete(() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CustomBottomNavigationBar())));
          } else if (state is UnAuthenticated) {
            Future.delayed(const Duration(seconds: 3)).whenComplete(() =>
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen())));
          }
        },
        child: const Center(
            child: SizedBox(
          height: 102,
          width: 300,
          child: Text(
            Constants.projectName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Constants.fontColor),
          ),
        )),
      ),
    );
  }
}
