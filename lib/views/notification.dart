import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        'Notification',
        style: TextStyle(color: Colors.black),
      ),
    );

    header() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Today’s'),
                Text('Mark as all read '),
              ]),
        );

    listItem() => Column(children: [
          header(),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: Constants.shadow,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 5,
                  color: const Color(0xffF7BE00),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: Constants.shadow),
                  child: const Text(
                    '07.30\nAM',
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Raunak Pathak",
                        style: Constants.titleTextStyle,
                      ),
                      const Text(
                        'Fusce sed congue leo. Praesent eleifend,',
                        style: TextStyle(color: Constants.fontColorLightGrey),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: const [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                  'assets/images/person_default.png'),
                            ),
                            Positioned(
                              left: 18,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage(
                                    'assets/images/person_default.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/person_default.png'),
                )
              ],
            ),
          )
        ]);

    return Scaffold(
        appBar: appBar,
        body: ListView.builder(
            itemCount: 10, itemBuilder: (context, index) => listItem()));
  }
}
