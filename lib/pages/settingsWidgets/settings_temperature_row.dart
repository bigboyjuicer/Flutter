import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/src/provider.dart';

class TemperatureRow extends StatefulWidget {
  const TemperatureRow({Key? key}) : super(key: key);

  @override
  _TemperatureRowState createState() => _TemperatureRowState();
}

class _TemperatureRowState extends State<TemperatureRow> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Температура',
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
            intensity: 0.5,
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
                      '˚C',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  foreground: Center(
                    child: Text(
                      '˚C',
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
                    '˚F',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                foreground: Center(
                  child: Text(
                    '˚F',
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
            selectedIndex: context.watch<MainProvider>().toggleDegreesIndex,
            onChanged: (index) {
              setState(() {
                context.read<MainProvider>().setToggleDegreesIndex(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
