import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';

class MainProvider with ChangeNotifier{
  bool isVisible = true;
  int toggleDegreesIndex = 0;
  int toggleWindForceIndex = 0;
  int togglePressureIndex = 0;
  int toggleThemeIndex = 0;
  List<String> historyList = [];
  List<String> favoritesList = [];
  Map forecast = {};
  List time = [];
  String primaryCity = '';
  String areaName = '';
  double fahrenheit = 0;
  double celsius = 0;
  late DateTime date;
  double humidity = 0;
  double windSpeed = 0;
  double pressure = 0;
  double thermometerCelsius = 0;
  double thermometerFahrenheit = 0;


  void panelOpen(){
    isVisible = true;
    notifyListeners();
  }

  void panelClose(){
    isVisible = false;
    notifyListeners();
  }

  void setToggleDegreesIndex(int index) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('toggleDegreesIndex', index);
    toggleDegreesIndex = index;
    notifyListeners();
  }

  void setToggleWindForceIndex(int index) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('toggleWindForceIndex', index);
    toggleWindForceIndex = index;
    notifyListeners();
  }

  void setTogglePressureIndex(int index) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('togglePressureIndex', index);
    togglePressureIndex = index;
    notifyListeners();
  }

  void setToggleThemeIndex(int index) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('toggleThemeIndex', index);
    toggleThemeIndex = index;
    notifyListeners();
  }

  void setHistoryList(List<String> history) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('historyList', history);
    historyList = history.reversed.toList();
    notifyListeners();
  }

  void setFavoritesList(List<String> favorites) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoritesList', favorites);
    favoritesList = favorites;
  }

  void addValueHistory(String str) async{
    if(!historyList.contains(str)){
      historyList = historyList.reversed.toList();
      historyList.add(str);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('historyList', historyList);
      historyList = historyList.reversed.toList();
      notifyListeners();
    }
  }

  void addValueFavorites(String str) async{
      favoritesList.add(str);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('favoritesList', favoritesList);
      notifyListeners();
  }

  void deleteValueFavorites(String str) async{
    favoritesList.remove(str);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoritesList', favoritesList);
    notifyListeners();
  }

  void setPrimaryCity(String city) async{
    primaryCity = city;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('primaryCity', city);
  }

  void weather(Weather weather){
    areaName = weather.areaName!;
    fahrenheit = weather.temperature!.fahrenheit!;
    celsius = weather.temperature!.celsius!;
    date = weather.date!;
    humidity = weather.humidity!;
    windSpeed = weather.windSpeed!;
    pressure = weather.pressure!;
    thermometerCelsius = weather.tempFeelsLike!.celsius!;
    thermometerFahrenheit = weather.tempFeelsLike!.fahrenheit!;
  }

  void fiveDayForeCast(Map dailyForecast){
    forecast = dailyForecast;
  }

  Map forEachDay(int index){
    Map data = {
      "date": DateTime.fromMillisecondsSinceEpoch(forecast['daily'][index]['dt'] * 1000),
      "temp": (forecast['daily'][index]['temp']['max'] + forecast['daily'][index]['temp']['min']) / 2,
      "wind": forecast['daily'][index]['wind_speed'],
      "humidity": forecast['daily'][index]['humidity'],
      "pressure": forecast['daily'][index]['pressure'],
      "weather": forecast['daily'][index]['weather'][0]['main'].toLowerCase(),
      "description": forecast['daily'][index]['weather'][0]['description'],
    };
    return data;
  }

  void getTimeList(List list){
    time = list;
  }
}