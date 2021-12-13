import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class DrawerInfoRow extends StatefulWidget {
  const DrawerInfoRow({Key? key}) : super(key: key);

  @override
  _DrawerInfoRowState createState() => _DrawerInfoRowState();
}

class _DrawerInfoRowState extends State<DrawerInfoRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 15, left: 23),
            child: SvgPicture.asset(
              ("assets/account_circle.svg"),
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            'О разработчике',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
