import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc_event.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc_state.dart';
import 'package:saletrackhing/models/cart_model.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc(CartBlocState initialState) : super(initialState) {
    on(eventHandler);
  }

  CartModel cart = CartModel(cartItems: [], quantity: 0, totalPrice: 0);

  FutureOr<void> eventHandler(
      CartBlocEvent event, Emitter<CartBlocState> emit) {
    if (event is AddToCart) {
      cart.cartItems.add(event.product);
      emit(AddedToCart(cart));
    }
    if (event is RemoveItem) {
      cart.cartItems.removeAt(event.indexAt);
      // emit(ItemRemoved(cart));
      emit(AddedToCart(cart));
    }
  }
}
