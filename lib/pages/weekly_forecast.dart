import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'forecastWidgets/forecastCardWidgets/forecast_card_back_to_home.dart';
import 'forecastWidgets/forecast_card.dart';
import 'forecastWidgets/forecast_title.dart';

class WeeklyForecast extends StatefulWidget {
  const WeeklyForecast({Key? key}) : super(key: key);

  @override
  _WeeklyForecastState createState() => _WeeklyForecastState();
}

class _WeeklyForecastState extends State<WeeklyForecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Column(
                children: const [
                  ForecastTitle(),
                  ForecastCard(),
                  BackToHome(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
