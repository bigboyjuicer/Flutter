import 'package:cupertino_learning/pages/searchWidgets/search_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
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
        Navigator.push(context, searchTransition());
      },
      child: const Icon(
        CupertinoIcons.add_circled,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
