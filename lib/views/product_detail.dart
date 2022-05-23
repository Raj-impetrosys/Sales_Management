import 'package:flutter/material.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc_event.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/globals.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';
import 'package:saletrackhing/globals/widgets/custom_btn.dart';
import 'package:saletrackhing/globals/widgets/loading_builder.dart';
import 'package:saletrackhing/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    // cartBloc.stream.listen((state) {
    //   if (state is AddedToCart) {
    //     showFlushBar(context: context, message: 'Added  to Cart');
    //   }
    // });
    // if (cartBloc.state is AddedToCart) {
    //   showFlushBar(context: context, message: 'Added  to Cart');
    // }

    _colorSelector() => Row(
          children: [
            const Text(
              'Color: ',
              style: Constants.subtitleTextStyle,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: const Color(0xffB9002C),
                  borderRadius: BorderRadius.circular(2)),
            )
          ],
        );

    _sizeSelector() => Row(
          children: const [
            Text(
              'Size: ',
              style: Constants.subtitleTextStyle,
            ),
            Text(
              'XL, ',
              style: Constants.subtitleTextStyle,
            ),
            Text(
              'XXL',
              style: Constants.subtitleTextStyle,
            ),
          ],
        );

    _price() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '\$8.00',
              style: TextStyle(
                  color: Color(0xffEDB703),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            customBtn(
                text: 'Add to Cart',
                width: 200,
                onTap: () {
                  cartBloc.add(AddToCart(product));
                })
          ],
        );

    return Scaffold(
      appBar: appBar(title: '', context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                height: 400,
                child: Image.network(
                  product.image,
                  loadingBuilder: loadingBuilder,
                  fit: BoxFit.fitHeight,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name, style: Constants.titleTextStyle),
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.add_circle_outline_rounded,
                          color: Constants.fontColorLightGrey,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("1"),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.remove_circle_outline,
                          color: Constants.fontColorLightGrey,
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(product.description,
                style: const TextStyle(color: Constants.fontColorLightGrey)),
            const SizedBox(
              height: 20,
            ),
            _colorSelector(),
            const SizedBox(
              height: 20,
            ),
            _sizeSelector(),
            const SizedBox(
              height: 20,
            ),
            _price()
          ],
        ),
      ),
    );
  }
}
