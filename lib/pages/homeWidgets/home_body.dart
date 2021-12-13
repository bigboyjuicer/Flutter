import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// WIDGETS IMPORTS //
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/body_background_image.dart';
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/body_appbar.dart';
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/body_sliding_up_panel.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin{

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<Offset> additionInfoOffset = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(
      parent: animationController, curve: Curves.decelerate));

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroundImage(),
        BodyAppBar(),
        BodySlidingUpPanel(),
      ],
    );
  }
}
