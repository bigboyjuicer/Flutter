import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// WIDGETS IMPORTS //
import 'timeSections/section_four.dart';
import 'timeSections/section_one.dart';
import 'timeSections/section_three.dart';
import 'timeSections/section_two.dart';

class DateTimeTemperature extends StatefulWidget {
  const DateTimeTemperature({Key? key}) : super(key: key);

  @override
  _DateTimeTemperatureState createState() => _DateTimeTemperatureState();
}

class _DateTimeTemperatureState extends State<DateTimeTemperature> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SectionOne(),
        SectionTwo(),
        SectionThree(),
        SectionFour(),
      ],
    );
  }
}
