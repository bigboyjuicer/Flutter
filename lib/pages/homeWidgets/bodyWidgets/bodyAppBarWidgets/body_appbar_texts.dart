import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Text(
        context.watch<MainProvider>().fahrenheit.round().toString() + '˚f',
        style: Theme.of(context).textTheme.headline1,
      ),
      child: Text(
        context.watch<MainProvider>().celsius.round().toString() + '˚c',
        style: Theme.of(context).textTheme.headline1,
      ),
      visible: context.watch<MainProvider>().toggleDegreesIndex == 0,
    );
  }
}

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<MainProvider>().areaName.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('ru_RU', null);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMd('ru_RU').format(context.watch<MainProvider>().date).toString(),
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: Colors.white),
    );
  }
}


