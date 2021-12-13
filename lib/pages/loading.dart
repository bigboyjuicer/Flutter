import 'dart:convert';

import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {

  void getDegreesIndexFromSharedPref() async{
    final prefs = await SharedPreferences.getInstance();
    final degreesIndex = prefs.getInt('toggleDegreesIndex');
    if(degreesIndex == null){
      return context.read<MainProvider>().setToggleDegreesIndex(0);
    }
    else{
      return context.read<MainProvider>().setToggleDegreesIndex(degreesIndex);
    }
  }

  void getWindForceIndexFromSharedPref() async{
    final prefs = await SharedPreferences.getInstance();
    final windForceIndex = prefs.getInt('toggleWindForceIndex');
    if(windForceIndex == null){
      return context.read<MainProvider>().setToggleDegreesIndex(0);
    }
    else{
      return context.read<MainProvider>().setToggleWindForceIndex(windForceIndex);
    }
  }

  void getPressureIndexFromSharedPref() async{
    final prefs = await SharedPreferences.getInstance();
    final pressureIndex = prefs.getInt('togglePressureIndex');
    if(pressureIndex == null){
      return context.read<MainProvider>().setToggleDegreesIndex(0);
    }
    else{
      return context.read<MainProvider>().setTogglePressureIndex(pressureIndex);
    }
  }

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

  void getHistoryListFromSharedPref() async{
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('historyList');
    if(history == null){
      return context.read<MainProvider>().setHistoryList([]);
    }
    else{
      return context.read<MainProvider>().setHistoryList(history);
    }
  }

  void getFavoritesListFromSharedPref() async{
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favoritesList');
    if(favorites == null){
      return context.read<MainProvider>().setFavoritesList([]);
    }
    else{
      return context.read<MainProvider>().setFavoritesList(favorites);
    }
  }

  Future<void> getPrimaryCity() async{
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString('primaryCity');
    if(city == null){
      return context.read<MainProvider>().setPrimaryCity('Москва');
    }
    else{
      return context.read<MainProvider>().setPrimaryCity(city);
    }
  }

  void setUpAllData() async{
    try{
      await getPrimaryCity();
      String city = context.read<MainProvider>().primaryCity;
      WeatherFactory wf = WeatherFactory("4c482b2b39876867234fef1aa96b628d", language: Language.RUSSIAN);
      Weather w = await wf.currentWeatherByCityName(city);

      Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=${w.latitude}&lon=${w.longitude}&exclude=minutely,current,alerts&units=imperial&appid=4c482b2b39876867234fef1aa96b628d'));
      Map data = jsonDecode(response.body);

      initializeDateFormatting();

      List list = [];
      for(int i = 0; i < data['hourly'].length; i++){
        if(list.length == 4) break;
        if(DateFormat.j('ru_RU').format(DateTime.fromMillisecondsSinceEpoch(data['hourly'][i]['dt'] * 1000)).toString() == '06'){
          list.add(data['hourly'][i]);
        }
        else if(DateFormat.j('ru_RU').format(DateTime.fromMillisecondsSinceEpoch(data['hourly'][i]['dt'] * 1000)).toString() == '12'){
          list.add(data['hourly'][i]);
        }
        else if(DateFormat.j('ru_RU').format(DateTime.fromMillisecondsSinceEpoch(data['hourly'][i]['dt'] * 1000)).toString() == '18'){
          list.add(data['hourly'][i]);
        }
        else if(DateFormat.j('ru_RU').format(DateTime.fromMillisecondsSinceEpoch(data['hourly'][i]['dt'] * 1000)).toString() == '00'){
          list.add(data['hourly'][i]);
        }
      }

      setState(() {
        context.read<MainProvider>().fiveDayForeCast(data);
        context.read<MainProvider>().weather(w);
        context.read<MainProvider>().getTimeList(list);
      });

      Navigator.pushReplacementNamed(context, '/home');
    }
    catch(e){
      print('ERROR: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDegreesIndexFromSharedPref();
    getWindForceIndexFromSharedPref();
    getPressureIndexFromSharedPref();
    getThemeIndexFromSharedPref();
    getHistoryListFromSharedPref();
    getFavoritesListFromSharedPref();
    setUpAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 140, 0, 140),
            child: Text(
              'Weather',
              style: GoogleFonts.manrope(
                color: Theme.of(context).primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: SpinKitRing(
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
