import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/src/provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({Key? key}) : super(key: key);

  @override
  _DarkThemeState createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Тема',
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
                      'Светлая',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  foreground: Center(
                    child: Text(
                      'Светлая',
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
                    'Темная',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                foreground: Center(
                  child: Text(
                    'Темная',
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
            selectedIndex: context.watch<MainProvider>().toggleThemeIndex,
            onChanged: (index) {
              setState(() {
                context.read<MainProvider>().setToggleThemeIndex(index);
              });
            },
          ),
        ),
      ],
    );
  }
}

