import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'My Account', context: context),
    );
  }
}
