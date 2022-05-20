import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Chat', context: context),
    );
  }
}
