import 'package:bloc/bloc.dart';
import 'package:cham_city_center/shared/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc_observer.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';
import 'generated/l10n.dart';
import 'modules/home/home.dart';

void main() async {
  await GetStorage.init();
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..indicatorType = EasyLoadingIndicatorType.circle;

  Bloc.observer = const SimpleBlocObserver();
  runApp(
    BlocProvider<AppCubit>(
      create: (_) => AppCubit()..openDataBase(),
      child: MyApp(),
    ),
  );
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // if (state is AppGetFromDataBaseLoadingState)
        //   EasyLoading.show(status: "");
      },
      builder: (BuildContext context, state) => MaterialApp(
        builder: EasyLoading.init(),
        locale: (box.read('lang') != null)
            ? Locale(box.read('lang'))
            : Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor:MyColors.dark_blue,
          fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.gold),
        ),
        home: Home(),
      ),
    );
  }
}
