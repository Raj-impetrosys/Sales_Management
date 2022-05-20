import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';
import 'package:saletrackhing/globals/widgets/loading_builder.dart';
import 'package:saletrackhing/globals/widgets/notification_btn.dart';
import 'package:saletrackhing/globals/widgets/search_btn.dart';
import 'package:saletrackhing/globals/widgets/shopping_btn.dart';
import 'package:saletrackhing/models/product_model.dart';

class SelectedCategory extends StatelessWidget {
  final String title;
  const SelectedCategory({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Faker _faker = Faker();
    List image = List.generate(20,
        (index) => _faker.image.image(random: true, height: 180, width: 120));
    List name = List.generate(20, (index) => _faker.food.dish());
    List<ProductModel> productList = List.generate(
        20,
        (index) => ProductModel(
            name: _faker.food.dish(),
            image: _faker.image.image(random: true, height: 900, width: 600),
            description: _faker.lorem.sentence()));

    category(_image, _name) => Column(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 3,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      _image,
                    ),
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: Constants.shadow),
            ),
            Text(_name)
          ],
        );

    categoryScroller() => SizedBox(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: image.length,
              itemBuilder: ((context, index) =>
                  category(image[index], name[index]))),
        );

    Widget listItem() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("New Men's  Collection",
                      style: Constants.titleTextStyle),
                  Text("See All"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: image.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/product_detail',
                                arguments: productList[index]);
                          },
                          child: Container(
                            // height: 150,
                            width: 120,
                            margin: const EdgeInsets.all(10),
                            child: Image.network(image[index],
                                loadingBuilder: loadingBuilder),
                          ),
                        )),
              )
            ],
          ),
        );

    Widget body() => Column(
          children: [
            categoryScroller(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => listItem()),
            ),
          ],
        );

    return Scaffold(
      appBar: appBar(title: title, context: context, actions: [
        searchBtn(),
        const SizedBox(
          width: 5,
        ),
        notificationBtn(context),
        const SizedBox(
          width: 5,
        ),
        shoppingBtn(context)
      ]),
      body: body(),
    );
  }
}
