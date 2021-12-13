import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  _SectionOneState createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(0);



    return Flexible(
      fit: FlexFit.tight,
      child: Neumorphic(
        margin: const EdgeInsets.fromLTRB(11, 20, 11, 0),
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
        style: NeumorphicStyle(
          color: Theme.of(context).cardColor,
            depth: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: SvgPicture.asset(
                ("assets/thermometer.svg"),
                color: Theme.of(context).indicatorColor,
              ),
            ),
            Visibility(
              replacement: Text(
                data['temp'].round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                ((data['temp'] - 32) * 5/9).round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              visible: context.watch<MainProvider>().toggleDegreesIndex == 0,
            ),
            Visibility(
              replacement: Text(
                '˚f',
                style: GoogleFonts.manrope(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 18,
                  letterSpacing: -2,
                ),
              ),
              child: Text(
                '˚c',
                style: GoogleFonts.manrope(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 18,
                  letterSpacing: -2,
                ),
              ),
              visible: context.watch<MainProvider>().toggleDegreesIndex == 0,
            ),
          ],
        ),
      ),
    );
  }
}
