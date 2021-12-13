import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/src/provider.dart';

class Pressure extends StatefulWidget {
  const Pressure({Key? key}) : super(key: key);

  @override
  _PressureState createState() => _PressureState();
}

class _PressureState extends State<Pressure> {
  int toggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Давление',
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
                      'мм.рт.ст.',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  foreground: Center(
                    child: Text(
                      'мм.рт.ст.',
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
                    'гПа',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                foreground: Center(
                  child: Text(
                    'гПа',
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
            thumb: Neumorphic(
              style: NeumorphicStyle(
                color: Theme.of(context).canvasColor,
                boxShape: const NeumorphicBoxShape.stadium(),
                depth: 5,
              ),
              child: Container(),
            ),
            selectedIndex: context.watch<MainProvider>().togglePressureIndex,
            onChanged: (index) {
              setState(() {
                context.read<MainProvider>().setTogglePressureIndex(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
