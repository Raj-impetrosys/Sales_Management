import 'package:flutter/material.dart';

customBtn(
        {EdgeInsetsGeometry? margin,
        required String text,
        double? width,
        required void Function()? onTap}) =>
    InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        padding: const EdgeInsets.all(10),
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff3B30B0),
                  const Color(0xff5355C8),
                  const Color(0xff307FE4).withOpacity(0.8),
                ])),
        child: Center(
            child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
