import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';

class FollowUp extends StatelessWidget {
  const FollowUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listItem() => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: Constants.shadow),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person_default.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Raunak Pathak',
                    style: Constants.titleTextStyle,
                  ),
                  Text(
                    'Foodjunction',
                    style: TextStyle(color: Constants.fontColorLightGrey),
                  ),
                  Text(
                    '8 Feb 2022, 10:00 AM',
                    style: TextStyle(
                        color: Constants.fontColorLightGrey, fontSize: 12),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/phone_clock.png',
                    scale: 2,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded))
                ],
              )
            ],
          ),
        );
    return Scaffold(
      appBar: appBar(title: 'Follow Up', context: context),
      body: ListView.builder(
          itemCount: 5, itemBuilder: ((context, index) => listItem())),
    );
  }
}
