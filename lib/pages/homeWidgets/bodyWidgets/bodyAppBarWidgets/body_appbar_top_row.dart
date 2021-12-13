import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// WIDGETS IMPORTS //
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodyAppBarWidgets/body_appbar_drawer_button.dart';
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodyAppBarWidgets/body_appbar_add_button.dart';
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodyAppBarWidgets/body_appbar_texts.dart';
import 'package:provider/src/provider.dart';

class AppBarTopRow extends StatefulWidget {
  const AppBarTopRow({
    Key? key,
  }) : super(key: key);

  @override
  _AppBarTopRowState createState() => _AppBarTopRowState();
}

class _AppBarTopRowState extends State<AppBarTopRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrawerButton(),
          Visibility(
            replacement: Container(
              padding: const EdgeInsets.only(top: 5),
                child: const City(),
            ),
            child: const Temperature(),
            visible: context.watch<MainProvider>().isVisible,
          ),
          const AddButton(),
        ],
      ),
    );
  }
}
