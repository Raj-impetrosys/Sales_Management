import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/menu_item.dart';
import 'package:saletrackhing/globals/widgets/notification_btn.dart';
import 'package:saletrackhing/globals/widgets/shopping_btn.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    appBar() => AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Product',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            notificationBtn(context),
            const SizedBox(
              width: 5,
            ),
            shoppingBtn(context)
          ],
        );

    categories() => Table(
          children: [
            TableRow(children: [
              menuItem(image: 'grocery', text: 'Grocery', onTap: () {}),
              menuItem(image: 'electronic', text: 'Electronic', onTap: () {}),
              menuItem(
                  image: 'person_heart_categories',
                  text: 'Fashion',
                  onTap: () {
                    Navigator.of(context).pushNamed('/selected_category');
                  }),
            ]),
            TableRow(children: [
              menuItem(image: 'furniture', text: 'Furniture', onTap: () {}),
              menuItem(image: 'crockery', text: 'Crockery', onTap: () {}),
              menuItem(image: 'sports', text: 'Sports', onTap: () {}),
            ]),
            TableRow(children: [
              menuItem(image: 'toys', text: 'Toys', onTap: () {}),
              menuItem(image: 'electrical', text: 'Electrical', onTap: () {}),
              menuItem(image: 'jwellery', text: 'Jwellery', onTap: () {}),
            ]),
          ],
        );

    totalProjects() => Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: Constants.shadow,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text(
                    'Total Projects',
                    style: Constants.subtitleTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '2500',
                    style: Constants.titleTextStyle,
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Total Items',
                    style: Constants.subtitleTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '22545',
                    style: Constants.titleTextStyle,
                  ),
                ],
              ),
            ],
          ),
        );

    Widget body() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  // keyboardType: TextInputType.number,
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    hintStyle: const TextStyle(color: Color(0xffC4C4C4)),
                    // contentPadding: EdgeInsets.all(10),
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/search.png',
                        scale: 2,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color(0xffE5E5E5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Categories',
                  style: Constants.titleTextStyle,
                ),
                categories(),
                const SizedBox(
                  height: 40,
                ),
                totalProjects()
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}
