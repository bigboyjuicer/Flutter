import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
                    child: Text('О разработчике',
                        style: GoogleFonts.manrope(
                            fontSize: 23,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Center(
              child: Neumorphic(
                style: NeumorphicStyle(
                  color: Theme.of(context).dialogBackgroundColor,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  depth: -5,
                ),
                margin: const EdgeInsets.only(top: 80),
                padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
                child: Text(
                  'Weather App',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Expanded(
              child: Neumorphic(
                style: NeumorphicStyle(
                  color: Theme.of(context).dialogBackgroundColor,
                  boxShape: NeumorphicBoxShape.roundRect(
                      const BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  depth: 10,
                  intensity: 0.7,
                  oppositeShadowLightSource: true,
                ),
                margin: const EdgeInsets.only(top: 110),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 28),
                            child: Text(
                              'by ITMO University',
                              style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Версия 1.0',
                              style: GoogleFonts.manrope(
                                color: Theme.of(context).selectedRowColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'от 28 ноября 2021',
                              style: GoogleFonts.manrope(
                                color: Theme.of(context).selectedRowColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          '2021',
                          style: GoogleFonts.manrope(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
