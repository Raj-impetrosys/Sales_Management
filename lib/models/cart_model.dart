import 'package:saletrackhing/models/product_model.dart';

class CartModel {
  List<ProductModel> cartItems = [];
  int quantity;
  double totalPrice;
  CartModel({
    required this.cartItems,
    required this.quantity,
    required this.totalPrice,
  });
}
