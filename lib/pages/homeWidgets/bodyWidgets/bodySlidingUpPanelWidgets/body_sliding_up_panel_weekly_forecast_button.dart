import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:cupertino_learning/pages/forecastWidgets/forecast_transition.dart';


class WeeklyForecastButton extends StatefulWidget {
  const WeeklyForecastButton({Key? key}) : super(key: key);

  @override
  _WeeklyForecastButtonState createState() => _WeeklyForecastButtonState();
}

class _WeeklyForecastButtonState extends State<WeeklyForecastButton> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeumorphicButton(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            style: NeumorphicStyle(
              color: Theme.of(context).cardColor,
              border: NeumorphicBorder(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
              disableDepth: true,
            ),
            child: Text(
              "Прогноз на неделю",
              style: Theme.of(context).textTheme.headline6,
            ),
            onPressed: () {
              Navigator.push(context, forecastTransition());
            },
          ),
        ],
      ),
    );
  }
}
