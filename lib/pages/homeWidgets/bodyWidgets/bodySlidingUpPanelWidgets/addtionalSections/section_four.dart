import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SectionFour extends StatefulWidget {
  const SectionFour({Key? key}) : super(key: key);

  @override
  _SectionFourState createState() => _SectionFourState();
}

class _SectionFourState extends State<SectionFour> {
  @override
  Widget build(BuildContext context) {
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
                ("assets/barometer.svg"),
                color: Theme.of(context).indicatorColor,
              ),
            ),
            Visibility(
              replacement: Text(
                (context.watch<MainProvider>().pressure)
                    .round()
                    .toString(),
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                (context.watch<MainProvider>().pressure / 1.333).round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              visible: context.watch<MainProvider>().togglePressureIndex == 0,
            ),
            Visibility(
              replacement: Text(
                'гПа',
                style: GoogleFonts.manrope(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 18,
                ),
              ),
              child: Text(
                'мм.рт.ст',
                style: GoogleFonts.manrope(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 18,
                ),
              ),
              visible: context.watch<MainProvider>().togglePressureIndex == 0,
            ),
          ],
        ),
      ),
    );
  }
}
