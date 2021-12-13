import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cupertino_learning/pages/settingsWidgets/settings_temperature_row.dart';
import 'package:cupertino_learning/pages/settingsWidgets/settings_windforce_row.dart';
import 'package:cupertino_learning/pages/settingsWidgets/settings_pressure_row.dart';

import 'package:cupertino_learning/pages/settingsWidgets/settings_theme_row.dart';

class SettingsMainContainer extends StatefulWidget {
  const SettingsMainContainer({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsMainContainerState createState() => _SettingsMainContainerState();
}

class _SettingsMainContainerState extends State<SettingsMainContainer> {

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
        color: Theme.of(context).backgroundColor,
        lightSource: LightSource.top,
        depth: 2,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const TemperatureRow(),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Divider(
              height: 30,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const WindForce(),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Divider(
              height: 30,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Pressure(),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Divider(
              height: 30,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: const DarkTheme(),
          ),
        ],
      ),
    );
  }
}
