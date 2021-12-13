import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/src/provider.dart';

class WindForce extends StatefulWidget {
  const WindForce({Key? key}) : super(key: key);

  @override
  _WindForceState createState() => _WindForceState();
}

class _WindForceState extends State<WindForce> {
  int toggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Сила ветра',
          style: GoogleFonts.manrope(
            color: Theme.of(context).selectedRowColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Neumorphic(
          style: NeumorphicStyle(
            lightSource: LightSource.top,
            depth: context.watch<MainProvider>().toggleThemeIndex == 1 ? 3 : 5,
            boxShape: const NeumorphicBoxShape.stadium(),
          ),
          child: NeumorphicToggle(
            style: NeumorphicToggleStyle(
              disableDepth: true,
              backgroundColor: Theme.of(context).hoverColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: 130,
            height: 30,
            children: [
              ToggleElement(
                  background: Center(
                    child: Text(
                      'м/с',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  foreground: Center(
                    child: Text(
                      'м/с',
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  )),
              ToggleElement(
                background: Center(
                  child: Text(
                    'км/ч',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                foreground: Center(
                  child: Text(
                    'км/ч',
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
            thumb: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
            ),
            selectedIndex: context.watch<MainProvider>().toggleWindForceIndex,
            onChanged: (index) {
              setState(() {
                context.read<MainProvider>().setToggleWindForceIndex(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
