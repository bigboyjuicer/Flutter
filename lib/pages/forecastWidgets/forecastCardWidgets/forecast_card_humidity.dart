import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class Humidity extends StatefulWidget {
  final int index;

  const Humidity({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  _HumidityState createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(widget.index);
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 30, 0, 0),
      child: Row(
        children: [
          SvgPicture.asset(
            ("assets/humidity.svg"),
            height: 24,
            width: 24,
            color: Theme.of(context).indicatorColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              data['humidity'].round().toString(),
              style: GoogleFonts.manrope(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Text(
            '%',
            style: GoogleFonts.manrope(
              color: Theme.of(context).indicatorColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
