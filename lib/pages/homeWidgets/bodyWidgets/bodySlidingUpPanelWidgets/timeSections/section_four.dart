import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class SectionFour extends StatefulWidget {
  const SectionFour({Key? key}) : super(key: key);

  @override
  _SectionFourState createState() => _SectionFourState();
}

class _SectionFourState extends State<SectionFour> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().time[3];
    String asset = '';
    if(data["weather"][0]["main"].toLowerCase() == 'thunderstorm'){
      asset = 'assets/thunderstorm.png';
    }
    else if(data["weather"][0]["main"].toLowerCase() == 'drizzle' || data["weather"][0]["main"].toLowerCase() == 'rain'){
      asset = 'assets/rain.png';
    }
    else if(data["weather"][0]["main"].toLowerCase() == 'snow'){
      asset = 'assets/snow.png';
    }
    else if(data["weather"][0]["main"].toLowerCase() == 'clear'){
      asset = 'assets/clear.png';
    }
    else if(data["weather"][0]["main"].toLowerCase() == 'clouds' && data["weather"][0]['description'] == 'few clouds'){
      asset = 'assets/partly_cloud.png';
    }
    else {
      asset = 'assets/clouds.png';
    }

    return Flexible(
      fit: FlexFit.tight,
      child: Neumorphic(
        style: NeumorphicStyle(
            color: Theme.of(context).cardColor,
            depth: 2
        ),
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          children: [
            Text(
              DateFormat.Hm('ru_RU').format(DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000)),
              style: Theme.of(context).textTheme.headline5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 11, 0, 13),
              child: Image.asset(
                asset,
                width: 40,
                height: 40,
              ),
            ),
            Visibility(
              replacement: Text(
                data['temp'].round().toString() + '˚f',
                style: Theme.of(context).textTheme.headline5,
              ),
              child: Text(
                ((data['temp'] - 32) * (5/9)).round().toString() + '˚c',
                style: Theme.of(context).textTheme.headline5,
              ),
              visible: context.watch<MainProvider>().toggleDegreesIndex == 0,
            ),
          ],
        ),
      ),
    );
  }
}
