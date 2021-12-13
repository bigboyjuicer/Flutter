import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SectionTwo extends StatefulWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  _SectionTwoState createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
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
                ("assets/humidity.svg"),
                color: Theme.of(context).indicatorColor,
              ),
            ),
            Text(
              context.watch<MainProvider>().humidity.round().toString(),
              style: GoogleFonts.manrope(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              '%',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 18,
                letterSpacing: -2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



