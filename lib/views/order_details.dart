import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listItem() => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: Constants.shadow,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/images/leather_bag.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Leather bag',
                        style: Constants.titleTextStyle,
                      ),
                      const Text(
                        'Size: S x5',
                        style: TextStyle(
                          color: Constants.fontColorLightGrey,
                        ),
                        // style: Constants.titleTextStyle,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Color:',
                            style: TextStyle(
                              color: Constants.fontColorLightGrey,
                            ),
                            // style: Constants.titleTextStyle,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: const Color(0xffA4042A),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("Qty: 05"),
                  Text(
                    '\$22',
                    style: Constants.titleTextStyle,
                  )
                ],
              )
            ],
          ),
        );

    return Scaffold(
      appBar: appBar(title: 'Order Details', context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderItem(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Items',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: ((context, index) => listItem())),
            )
          ],
        ),
      ),
    );
  }
}

orderItem() => Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
                      style: TextStyle(color: Constants.fontColorLightGrey),
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '10:10 AM',
                  style: TextStyle(
                      fontSize: 12, color: Constants.fontColorLightGrey),
                ),
                const Text(
                  '27 April 2022',
                  style: TextStyle(
                      fontSize: 12, color: Constants.fontColorLightGrey),
                ),
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
    );
