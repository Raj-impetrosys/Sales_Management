import 'package:flutter/widgets.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

showFlushBar({required String message, required BuildContext context}) =>
    Flushbar(
      message: message,
      flushbarPosition: FlushbarPosition.BOTTOM,
      isDismissible: true,
    )..show(context);
