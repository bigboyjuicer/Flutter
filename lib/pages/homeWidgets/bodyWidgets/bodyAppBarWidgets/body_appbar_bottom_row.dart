import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// WIDGETS IMPORTS //
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodyAppBarWidgets/body_appbar_texts.dart';
import 'package:provider/src/provider.dart';

class AppBarBottomRow extends StatefulWidget {

  const AppBarBottomRow({Key? key}) : super(key: key);

  @override
  _AppBarBottomRowState createState() => _AppBarBottomRowState();
}

class _AppBarBottomRowState extends State<AppBarBottomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          replacement: Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Temperature()),
          child: const Date(),
          visible: context.watch<MainProvider>().isVisible,
        ),
      ],
    );
  }
}
