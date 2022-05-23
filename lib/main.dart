import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:saletrackhing/bloc/bloc_observer.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_bloc.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/globals.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';
import 'package:saletrackhing/views/add_new_client.dart';
import 'package:saletrackhing/views/bottom_navigation_bar.dart';
import 'package:saletrackhing/views/cart.dart';
import 'package:saletrackhing/views/categories.dart';
import 'package:saletrackhing/views/chat_screen.dart';
import 'package:saletrackhing/views/client_details.dart';
import 'package:saletrackhing/views/client_list.dart';
import 'package:saletrackhing/views/clients_query.dart';
import 'package:saletrackhing/views/collect_payment.dart';
import 'package:saletrackhing/views/dashboard.dart';
import 'package:saletrackhing/views/follow_up.dart';
import 'package:saletrackhing/views/login.dart';
import 'package:saletrackhing/views/my_account.dart';
import 'package:saletrackhing/views/my_orders.dart';
import 'package:saletrackhing/views/notification.dart';
import 'package:saletrackhing/views/order_details.dart';
import 'package:saletrackhing/views/otp.dart';
import 'package:saletrackhing/views/product_detail.dart';
import 'package:saletrackhing/views/selected_category.dart';
import 'package:saletrackhing/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationBloc>(
            create: (BuildContext context) => LocalizationBloc('en'),
          ),
        ],
        child: const MyApp(),
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return BlocBuilder(
        bloc: localizationBloc,
        builder: (context, state) {
          if (state is LanguageChanged) {
            return MaterialApp(
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => const Splash(),
                '/login': (BuildContext context) => LoginScreen(),
                '/otp': (BuildContext context) => OtpScreen(
                      mobileNumber: '',
                      verificationId: '',
                    ),
                '/bottom_bar': (BuildContext context) =>
                    const CustomBottomNavigationBar(),
                '/clients_query': (BuildContext context) =>
                    const ClientsQueryScreen(),
                '/chat': (BuildContext context) => const ChatScreen(),
                '/my_account': (BuildContext context) => const MyAccount(),
                '/dashboard': (BuildContext context) => const DashboardScreen(),
                '/cart': (BuildContext context) => const CartScreen(),
                '/notification': (BuildContext context) =>
                    const NotificationScreen(),
                '/orders': (BuildContext context) => const MyOrdersScreen(),
                '/order_details': (BuildContext context) =>
                    const OrderDetails(),
                '/follow_up': (BuildContext context) => const FollowUp(),
                '/categories': (BuildContext context) =>
                    const CategoriesScreen(),
                '/selected_category': (BuildContext context) =>
                    const SelectedCategory(
                      title: 'Fashion',
                    ),
                '/product_detail': (BuildContext context) =>
                    const ProductDetail(),
                '/client_list': (BuildContext context) =>
                    const ClientListScreen(),
                '/add_new_client': (BuildContext context) =>
                    const AddNewClient(),
                '/client_details': (BuildContext context) =>
                    const ClientDetails(),
                '/collect_payment': (BuildContext context) =>
                    const CollectPayment(),
              },
              // onGenerateRoute: (settings) {
              //   if (settings.name == PassArgumentsScreen.routeName) {
              //     final Arguments args = settings.arguments;
              //     return MaterialPageRoute(
              //       builder: (context) {
              //         return PassArgumentsScreen(
              //           title: args.title,
              //           message: args.message,
              //         );
              //       },
              //     );
              //   }
              //   assert(false, 'Implementation ${settings.name}');
              //   return null;
              // },
              // onGenerateRoute: (RouteSettings settings) {
              //   final List<String> pathElements = settings.name!.split('/');
              //   if (pathElements[0] != '') {
              //     return null;
              //   }
              //   return null;
              // },
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                // delegate from localization package.
                LocalJsonLocalization.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('es', 'ES'),
                Locale('pt', 'BR'),
              ],
              locale: Locale.fromSubtags(languageCode: state.languageCode),
              debugShowCheckedModeBanner: false,
              title: Constants.projectName,
              theme: ThemeData(
                  primarySwatch: Colors.blue, fontFamily: Constants.fontFamily),
              // home: const Splash(),
            );
          }
          return loader();
        });
  }
}
