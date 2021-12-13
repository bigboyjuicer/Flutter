import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class Pressure extends StatefulWidget {
  final int index;

  const Pressure({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  _PressureState createState() => _PressureState();
}

class _PressureState extends State<Pressure> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(widget.index);
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 30, 0, 0),
      child: Row(
        children: [
          SvgPicture.asset(
            ("assets/barometer.svg"),
            height: 24,
            width: 24,
            color: Theme.of(context).indicatorColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Visibility(
              replacement: Text(
                (data['pressure'] / 1.333)
                    .round()
                    .toString(),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                data['pressure'].round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              visible: context.watch<MainProvider>().togglePressureIndex == 0,
            ),
          ),
          Visibility(
            replacement: Text(
              'гПа',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
              ),
            ),
            child: Text(
              'мм.рт.ст',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
              ),
            ),
            visible: context.watch<MainProvider>().togglePressureIndex == 0,
          ),
        ],
      ),
    );
  }
}
