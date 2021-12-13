import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class Thermometer extends StatefulWidget {
  final int index;
  const Thermometer({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  _ThermometerState createState() => _ThermometerState();
}

class _ThermometerState extends State<Thermometer> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(widget.index);
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
      child: Row(
        children: [
          SvgPicture.asset(
            ("assets/thermometer.svg"),
            height: 24,
            width: 24,
            color: Theme.of(context).indicatorColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Visibility(
              replacement: Text(
                data['temp'].round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                ((data['temp'] - 32) * (5/9)).round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              visible: context
                  .watch<MainProvider>()
                  .toggleDegreesIndex == 0,
            ),
          ),
          Visibility(
            replacement: Text(
              '˚f',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
                letterSpacing: -1,
              ),
            ),
            child: Text(
              '˚c',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
                letterSpacing: -1,
              ),
            ),
            visible: context
                .watch<MainProvider>()
                .toggleDegreesIndex == 0,
          ),
        ],
      ),
    );
  }
}
