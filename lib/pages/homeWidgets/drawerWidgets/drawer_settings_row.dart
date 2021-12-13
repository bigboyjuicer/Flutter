import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


class DrawerSettingsRow extends StatefulWidget {
  const DrawerSettingsRow({Key? key}) : super(key: key);

  @override
  _DrawerSettingsRowState createState() => _DrawerSettingsRowState();
}

class _DrawerSettingsRowState extends State<DrawerSettingsRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 15, left: 23),
            child: SvgPicture.asset(
            ("assets/settings.svg"),
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            'Настройки',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
