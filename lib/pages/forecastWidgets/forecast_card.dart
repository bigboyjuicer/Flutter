import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'forecastCardWidgets/forecast_card_date_string.dart';
import 'forecastCardWidgets/forecast_card_humidity.dart';
import 'forecastCardWidgets/forecast_card_pressure.dart';
import 'forecastCardWidgets/forecast_card_thermometer.dart';
import 'forecastCardWidgets/forecast_card_weather_picture.dart';
import 'package:card_swiper/card_swiper.dart';

import 'forecastCardWidgets/forecast_card_wind.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  _ForecastCardState createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemHeight: 450,
      itemWidth: 450,
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).splashColor,
                  Theme.of(context).highlightColor,
                ]),
          ),
          margin: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.fromLTRB(15, 15, 0, 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateString(index: index),
                  WeatherPicture(index: index),
                  Thermometer(index: index),
                  Wind(index: index),
                  Humidity(index: index),
                  Pressure(index: index),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
