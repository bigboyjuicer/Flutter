import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'addtionalSections/section_four.dart';
import 'addtionalSections/section_one.dart';
import 'addtionalSections/section_three.dart';
import 'addtionalSections/section_two.dart';

class AdditionalInfo extends StatelessWidget {
  final AnimationController animationController;
  final Animation<Offset> additionalInfoOffset;
  const AdditionalInfo({Key? key, required this.animationController, required this.additionalInfoOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Row(
              children: const [
                SectionOne(),
                SectionTwo(),
              ],
            ),
            Row(
              children: const [
                SectionThree(),
                SectionFour(),
              ],
            ),
          ],
        ),
      ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: additionalInfoOffset,
          child: child,
        );
      },
    );
  }
}
