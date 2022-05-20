import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/widgets/notification_btn.dart';

AppBar appBar(
        {required String title,
        required BuildContext context,
        List<Widget>? actions}) =>
    AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: actions ?? [notificationBtn(context)],
    );
