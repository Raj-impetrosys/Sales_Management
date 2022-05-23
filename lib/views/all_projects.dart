import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/menu_item.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: 60,
              height: 4,
              color: const Color(0xffC4C4C4),
            ),
            const Text(
              'All Projects',
              style: Constants.titleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Table(
              children: [
                TableRow(children: [
                  menuItem(
                      image: 'person_heart',
                      text: 'CLIENTS',
                      onTap: () {
                        Navigator.of(context).pushNamed('/client_list');
                      }),
                  menuItem(
                      image: 'shopping-cart',
                      text: 'INVENTORY',
                      onTap: () {
                        Navigator.of(context).pushNamed('/categories');
                      }),
                  menuItem(
                      image: 'orders',
                      text: 'ORDERS',
                      onTap: () {
                        Navigator.of(context).pushNamed('/orders');
                      }),
                ]),
                TableRow(children: [
                  menuItem(image: 'leads', text: 'LEADS', onTap: () {}),
                  menuItem(image: 'payment', text: 'PAYMENT', onTap: () {}),
                  menuItem(
                      image: 'follow-up',
                      text: 'FOLLOW UP',
                      onTap: () {
                        Navigator.of(context).pushNamed('/follow_up');
                      }),
                ]),
              ],
            ),
          ],
        ));
  }
}
