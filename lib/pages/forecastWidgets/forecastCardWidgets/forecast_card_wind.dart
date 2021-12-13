import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class Wind extends StatefulWidget {
  final int index;

  const Wind({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  _WindState createState() => _WindState();
}

class _WindState extends State<Wind> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(widget.index);
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 30, 0, 0),
      child: Row(
        children: [
          SvgPicture.asset(
            ("assets/breeze.svg"),
            height: 24,
            width: 24,
            color: Theme.of(context).indicatorColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Visibility(
              replacement: Text(
                data['wind'].round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Text(
                (data['wind'] / 3.6).round().toString(),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              visible: context.watch<MainProvider>().toggleWindForceIndex == 0,
            ),
          ),
          Visibility(
            replacement: Text(
              'км/ч',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
              ),
            ),
            child: Text(
              'м/с',
              style: GoogleFonts.manrope(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
              ),
            ),
            visible: context.watch<MainProvider>().toggleWindForceIndex == 0,
          ),
        ],
      ),
    );
  }
}
