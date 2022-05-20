import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_event.dart';
import 'package:saletrackhing/bloc/localization_bloc/localization_state.dart';
import 'package:saletrackhing/globals/globals.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LocalizationBloc localizationBloc = LocalizationBloc(LanguageChanged('en'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(text),
          BlocConsumer(
              listener: (context, s) {
                String text = 'welcome-text'.i18n();
              },
              bloc: localizationBloc,
              builder: (context, state) {
                if (state is Loading) {
                  return loader();
                }
                if (state is LanguageChanged) {
                  String text = 'welcome-text'.i18n();
                  return Text("$text ${state.languageCode}");
                }
                return loader();
              }),
          ElevatedButton(
              onPressed: () {
                localizationBloc.add(ChangeLanguage("en"));
              },
              child: const Text('English')),
          ElevatedButton(
              onPressed: () {
                localizationBloc.add(ChangeLanguage("pt"));
              },
              child: const Text('pt')),
          ElevatedButton(
              onPressed: () {
                localizationBloc.add(ChangeLanguage("es"));
              },
              child: const Text('es')),
        ],
      ),
    );
  }
}
