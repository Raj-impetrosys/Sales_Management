import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';

menuItem(
    {required String image,
    required String text,
    required void Function()? onTap}) {
  double menuFontSize = 14;
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: Constants.shadow),
            child: Image.asset(
              'assets/images/$image.png',
              color: const Color(0xff363853),
              scale: 3,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: const Color(0xff676767),
                fontSize: menuFontSize,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
