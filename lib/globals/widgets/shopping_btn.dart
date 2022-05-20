import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';

shoppingBtn(context) => InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/cart');
      },
      child: Container(
        height: 40,
        width: 40,
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: Constants.shadow,
            shape: BoxShape.circle,
            color: Colors.white),
        child: Image.asset(
          'assets/images/shopping_bag.png',
          scale: 4,
        ),
      ),
    );
