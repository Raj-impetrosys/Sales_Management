import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';

class ClientsQueryScreen extends StatelessWidget {
  const ClientsQueryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listItem() => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: Constants.shadow,
            color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: Constants.shadow,
                  color: Colors.white),
              child: const Center(
                  child: Text(
                '07:30\nAM',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Raunak Pathak",
                    style: Constants.titleTextStyle,
                  ),
                  Text(
                    "Fusce sed congue leo. Praesent eleifend, ipsum a bibendum feugiat, massa arcuviverra urna,",
                    style: TextStyle(
                        color: Constants.fontColorLightGrey, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ));
    return Scaffold(
      appBar: appBar(title: 'Clients Query', context: context),
      body: ListView.builder(itemBuilder: (context, index) => listItem()),
    );
  }
}
