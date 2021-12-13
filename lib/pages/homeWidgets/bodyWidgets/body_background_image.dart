import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: context.watch<MainProvider>().toggleThemeIndex == 1 ? const AssetImage('assets/night.png') : const AssetImage('assets/day.jpg'),
        ),
      ),
    );
  }
}
