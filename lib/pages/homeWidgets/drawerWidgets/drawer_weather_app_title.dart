import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WeatherAppTitle extends StatefulWidget {
  const WeatherAppTitle({Key? key}) : super(key: key);

  @override
  _WeatherAppTitleState createState() => _WeatherAppTitleState();
}

class _WeatherAppTitleState extends State<WeatherAppTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(23, 15, 0, 0),
      child: Text(
        'Weather app',
        style: Theme.of(context).textTheme.headline2
      ),
    );
  }
}
