import 'package:saletrackhing/bloc/auth_bloc/auth_bloc.dart';
import 'package:saletrackhing/bloc/auth_bloc/auth_state.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc.dart';
import 'package:saletrackhing/bloc/cart_bloc/cart_bloc_state.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_bloc.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_state.dart';
import 'package:saletrackhing/models/cart_model.dart';

LocalizationBloc localizationBloc = LocalizationBloc(LanguageChanged('en'));
AuthBloc authBloc = AuthBloc(LoginWithMobileFormInitial());
CartBloc cartBloc =
    CartBloc(AddedToCart(CartModel(cartItems: [], quantity: 0, totalPrice: 0)));
// final List<ProductModel> cartItems = [];
