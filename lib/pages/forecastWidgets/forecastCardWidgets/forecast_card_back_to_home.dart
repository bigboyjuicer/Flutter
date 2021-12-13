import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BackToHome extends StatefulWidget {
  const BackToHome({Key? key}) : super(key: key);

  @override
  _BackToHomeState createState() => _BackToHomeState();
}

class _BackToHomeState extends State<BackToHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: NeumorphicButton(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        style: NeumorphicStyle(
          color: Theme.of(context).cardColor,
          border: NeumorphicBorder(
            color: Theme.of(context).hintColor,
            width: 1,
          ),
          disableDepth: true,
        ),
        child: Text(
          "Вернуться на главную",
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).primaryColor),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
