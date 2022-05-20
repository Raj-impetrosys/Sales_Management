import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';

searchBtn() => Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          boxShadow: Constants.shadow,
          shape: BoxShape.circle,
          color: Colors.white),
      child: Image.asset(
        'assets/images/search.png',
        scale: 2.5,
      ),
    );
