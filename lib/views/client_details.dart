import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';
import 'package:saletrackhing/views/collect_payment.dart';

class ClientDetails extends StatelessWidget {
  const ClientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    clientDetail() => Container(
          height: 280,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/person_default.png'),
              ),
              Text('Owner'),
              Text(
                'Raunak Pathak',
                style: Constants.titleTextStyle,
              ),
              Text(
                'Fasion Zoon India',
                style: Constants.subtitleTextStyle,
              ),
              Text('451, Block C, Vaishnav Nagar AB Road Indore. 4520001',
                  textAlign: TextAlign.center),
              Text('+91 6565656565')
            ],
          ),
        );

    btn(
        {required String text,
        required Color color,
        required void Function()? onTap}) {
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Text(text, style: Constants.subtitleTextStyle),
        ),
      );
    }

    btnBar() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btn(
              onTap: () {},
              text: 'Call',
              color: const Color(0xff81D4FE).withOpacity(0.20),
            ),
            btn(
              onTap: () {},
              text: 'Follow up',
              color: const Color(0xffFF144D).withOpacity(0.16),
            ),
            btn(
              onTap: () {},
              text: 'New Order',
              color: const Color(0xff95B70D).withOpacity(0.32),
            ),
          ],
        );

    creditLimit() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Credit Limit',
                style: Constants.titleTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(141, 176, 1, 1),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10))),
                      height: 10,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      height: 10,
                      color: const Color(0xffE80937),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffE80937).withOpacity(0.17),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10))),
                      height: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    '\$56.00',
                    style: Constants.titleTextStyle,
                  )
                ],
              )
            ],
          ),
        );

    duePayment() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Due Payment',
                    style: Constants.titleTextStyle,
                  ),
                  Text(
                    '\$5000.00',
                    style: Constants.titleTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/txn_history.png',
                        scale: 2,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Transaction History',
                        // style: Constants.titleTextStyle,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => const CollectPayment());
                    },
                    child: const Text('Collect Payment'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff374957))),
                  )
                ],
              )
            ],
          ),
        );

    listItem() => Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: Constants.shadow,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/leather_bag.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '#487548754',
                      style: Constants.subtitleTextStyle,
                    ),
                    Text(
                      'Leather bag',
                      style: Constants.titleTextStyle,
                    ),
                    Text(
                      'The passage is attributed to an unknown typesetter',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '15 Feb 10.10 am',
                    style: TextStyle(fontSize: 10, color: Color(0xff81878C)),
                  ),
                  Text(
                    'Delevered',
                    style: TextStyle(fontSize: 10, color: Color(0xff8DB001)),
                  ),
                  Text(
                    '\$12.00',
                    style: Constants.titleTextStyle,
                  )
                ],
              )
            ],
          ),
        );

    myOrders() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'My Orders',
                    style: Constants.titleTextStyle,
                  ),
                  Text(
                    'View All',
                    style: Constants.subtitleTextStyle,
                  ),
                ],
              ),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => listItem())
            ],
          ),
        );

    return Scaffold(
      appBar: appBar(title: 'Clients Details', context: context),
      body: ListView(
        children: [
          clientDetail(),
          btnBar(),
          creditLimit(),
          duePayment(),
          myOrders(),
        ],
      ),
    );
  }
}
