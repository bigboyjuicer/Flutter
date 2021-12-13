import 'package:cupertino_learning/pages/search.dart';
import 'package:flutter/material.dart';

Route searchTransition(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Search(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}