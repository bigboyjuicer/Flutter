import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ForecastTitle extends StatefulWidget {
  const ForecastTitle({Key? key}) : super(key: key);

  @override
  _ForecastTitleState createState() => _ForecastTitleState();
}

class _ForecastTitleState extends State<ForecastTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Прогноз на неделю',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
