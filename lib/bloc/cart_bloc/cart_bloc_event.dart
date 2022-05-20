import 'package:equatable/equatable.dart';
import 'package:saletrackhing/models/product_model.dart';

class CartBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartBlocEvent {
  final ProductModel product;
  AddToCart(this.product);
  @override
  List<Object?> get props => [product];
}

class RemoveItem extends CartBlocEvent {
  final ProductModel product;
  final int indexAt;
  RemoveItem(this.product, this.indexAt);
  @override
  List<Object?> get props => [product, indexAt];
}
