import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class DateString extends StatefulWidget {
  final int index;

  const DateString({Key? key, required this.index}) : super(key: key);

  @override
  _DateStringState createState() => _DateStringState();
}

class _DateStringState extends State<DateString> {

  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(widget.index);
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Text(
        DateFormat.MMMMd('ru_RU').format(data['date']).toString(),
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
