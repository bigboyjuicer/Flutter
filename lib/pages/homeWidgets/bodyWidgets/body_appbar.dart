import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// WIDGETS IMPORTS //
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodyAppBarWidgets/body_appbar_bottom_row.dart';
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodyAppBarWidgets/body_appbar_top_row.dart';

class BodyAppBar extends StatefulWidget {
  const BodyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _BodyAppBarState createState() => _BodyAppBarState();
}

class _BodyAppBarState extends State<BodyAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          AppBarTopRow(),
          AppBarBottomRow(),
        ],
      ),
    );
  }
}
