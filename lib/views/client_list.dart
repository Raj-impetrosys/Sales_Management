import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/notification_btn.dart';
import 'package:saletrackhing/globals/widgets/search_btn.dart';
import 'package:saletrackhing/views/add_new_client.dart';

class ClientListScreen extends StatelessWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar() => AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Clients List',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed('/add_new_client');
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    content: AddNewClient(),
                  ),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    boxShadow: Constants.shadow,
                    shape: BoxShape.circle,
                    color: Colors.white),
                child: Image.asset(
                  'assets/images/person_add.png',
                  scale: 2.5,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            searchBtn(),
            const SizedBox(
              width: 10,
            ),
            notificationBtn(context)
          ],
        );

    listItem() => InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/client_details');
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: Constants.shadow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/person_default.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Raunak Pathak',
                      style: Constants.titleTextStyle,
                    ),
                    Text('Foodjunction'),
                    Text('+91 6565656565'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(Icons.arrow_forward),
                    Text('Distributor'),
                  ],
                )
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
          itemCount: 5, itemBuilder: (context, index) => listItem()),
    );
  }
}
