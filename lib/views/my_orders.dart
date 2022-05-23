import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listItem() => InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/order_details');
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/person_default.png'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '#457485451',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Raunak Pathak',
                                style: Constants.titleTextStyle,
                              ),
                              Text(
                                'Number of Items  15',
                                style: TextStyle(
                                    color: Constants.fontColorLightGrey),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            '10:10 AM',
                            style: TextStyle(
                                fontSize: 12,
                                color: Constants.fontColorLightGrey),
                          ),
                          Text(
                            '27 April 2022',
                            style: TextStyle(
                                fontSize: 12,
                                color: Constants.fontColorLightGrey),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Request to Cancel',
                            style: TextStyle(color: Color(0xff363853)),
                          )),
                      Row(
                        children: const [
                          Text(
                            'Total ',
                            style: TextStyle(
                                color: Constants.fontColorLightGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$12',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffE80937),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      appBar: appBar(title: 'My Orders', context: context),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: ((context, index) => listItem()),
      ),
    );
  }
}
