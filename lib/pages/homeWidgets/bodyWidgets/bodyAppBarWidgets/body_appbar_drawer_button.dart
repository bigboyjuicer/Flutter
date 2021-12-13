import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DrawerButton extends StatefulWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(3),
      style: const NeumorphicStyle(
        lightSource: LightSource.topLeft,
        intensity: 0.5,
        depth: 2,
        color: Colors.transparent,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      child: const Icon(
        CupertinoIcons.bars,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
