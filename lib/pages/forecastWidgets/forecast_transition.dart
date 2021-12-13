import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:cupertino_learning/pages/weekly_forecast.dart';

Route forecastTransition(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const WeeklyForecast(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}