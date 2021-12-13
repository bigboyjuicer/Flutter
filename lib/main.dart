// ignore_for_file: prefer_const_constructors

import 'package:cupertino_learning/pages/loading.dart';
import 'package:cupertino_learning/provider/provider.dart';
import 'package:cupertino_learning/pages/themes/themes.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_learning/pages/home.dart';
import 'package:cupertino_learning/pages/settings.dart';
import 'package:cupertino_learning/pages/favorites.dart';
import 'package:cupertino_learning/pages/weekly_forecast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, _) {

        void getThemeIndexFromSharedPref() async{
          final prefs = await SharedPreferences.getInstance();
          final themeIndex = prefs.getInt('toggleThemeIndex');
          if(themeIndex == null){
            return context.read<MainProvider>().setToggleThemeIndex(0);
          }
          else{
            return context.read<MainProvider>().setToggleThemeIndex(themeIndex);
          }
        }

        getThemeIndexFromSharedPref();

        return MaterialApp(
          initialRoute: '/loading',
          routes: {
            '/loading': (context) => Loading(),
            '/home': (context) => Home(),
            '/settings': (context) => Settings(),
            '/favorites': (context) => Favorites(),
            '/weekly-forecast': (context) => WeeklyForecast(),
          },
          themeMode: context.watch<MainProvider>().toggleThemeIndex == 1 ? ThemeMode.dark : ThemeMode.light,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
        );
      },
    );
  }
}
