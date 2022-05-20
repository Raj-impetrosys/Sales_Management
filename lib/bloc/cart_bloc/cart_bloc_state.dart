import 'package:equatable/equatable.dart';
import 'package:saletrackhing/models/cart_model.dart';

class CartBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddedToCart extends CartBlocState {
  final CartModel cart;
  AddedToCart(this.cart);
  @override
  List<Object?> get props => [cart];
}

class ItemRemoved extends CartBlocState {
  final CartModel cart;
  ItemRemoved(this.cart);
  @override
  List<Object?> get props => [cart];
}

// class AddedToCart extends CartBlocState {
//   final List<ProductModel> cartItems;
//   final ProductModel product;
//   AddedToCart(this.product, this.cartItems);
//   @override
//   List<Object?> get props => [product, cartItems];
// }
