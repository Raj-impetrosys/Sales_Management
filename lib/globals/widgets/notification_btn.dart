import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';

notificationBtn(context) => GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/notification');
      },
      // borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            boxShadow: Constants.shadow,
            shape: BoxShape.circle,
            color: Colors.white),
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/notification.png',
                scale: 4,
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
