import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc_event.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/globals.dart';
import 'package:saletrackhing/globals/widgets/custom_appbar.dart';
import 'package:saletrackhing/globals/widgets/custom_btn.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';
import 'package:saletrackhing/models/cart_model.dart';
import 'package:saletrackhing/models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listItem(
            {required ProductModel product,
            required int index,
            required CartModel cart}) =>
        Dismissible(
          onDismissed: (DismissDirection direction) {
            // cart.cartItems.removeAt(index);
            cartBloc.add(RemoveItem(product, index));
          },
          background: const Icon(Icons.delete),
          key: UniqueKey(),
          child: Container(
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
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(product.image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
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
                  children: [
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
                        const Text("25"),
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
                    const Text(
                      '\$22',
                      style: Constants.titleTextStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        );

    billingDetail() => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: Constants.shadow),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Sub Total",
                          style: Constants.subtitleTextStyle,
                        ),
                        Text(
                          "\$87.00",
                          style: Constants.subtitleTextStyle,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Delivery Charge",
                          style: Constants.subtitleTextStyle,
                        ),
                        Text(
                          "\$5.00",
                          style: Constants.subtitleTextStyle,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Company Discount",
                          style: Constants.subtitleTextStyle,
                        ),
                        Text(
                          "\$0.00",
                          style: Constants.subtitleTextStyle,
                        ),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffCD9E00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$92.00",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffCD9E00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            customBtn(
                onTap: () {
                  // cartBloc.add(AddToCart(product));
                },
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                text: 'Checkout')
          ],
        );

    emptyCart() => const Center(
          child: Text('Looking like you have not added items in the cart',
              textAlign: TextAlign.center),
        );

    return Scaffold(
      appBar: appBar(title: 'Cart', context: context),
      body: BlocBuilder(
          bloc: cartBloc,
          builder: (context, state) {
            if (state is AddedToCart) {
              if (state.cart.cartItems.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.cart.cartItems.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      listItem(
                          product: state.cart.cartItems[index],
                          index: index,
                          cart: state.cart),
                      if (index == state.cart.cartItems.length - 1)
                        billingDetail()
                    ],
                  ),
                );
              }
              return emptyCart();
            }
            return loader();
          }),
    );
  }
}
