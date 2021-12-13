import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SectionThree extends StatefulWidget {
  const SectionThree({Key? key}) : super(key: key);

  @override
  _SectionThreeState createState() => _SectionThreeState();
}

class _SectionThreeState extends State<SectionThree> {
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
                ("assets/breeze.svg"),
                color: Theme.of(context).indicatorColor,
              ),
            ),
            Visibility(
              replacement: Text(
                (context.watch<MainProvider>().windSpeed * 3.6)
                    .round()
                    .toString(),
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                context.watch<MainProvider>().windSpeed.round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              visible: context.watch<MainProvider>().toggleWindForceIndex == 0,
            ),
            Visibility(
              replacement: Text(
                'км/ч',
                style: GoogleFonts.manrope(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 18,
                ),
              ),
              child: Text(
                'м/с',
                style: GoogleFonts.manrope(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 18,
                ),
              ),
              visible: context.watch<MainProvider>().toggleWindForceIndex == 0,
            ),
          ],
        ),
      ),
    );
  }
}
