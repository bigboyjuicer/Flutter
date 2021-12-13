import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cupertino_learning/pages/settingsWidgets/settings_main_container.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('Настройки',
                        style: GoogleFonts.manrope(
                            fontSize: 23,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Единицы измерения',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: const Color(0xff828282),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SettingsMainContainer(),
          ],
        ),
      ),
    );
  }
}
