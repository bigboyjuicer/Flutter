import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class DrawerFavoritesRow extends StatefulWidget {
  const DrawerFavoritesRow({Key? key}) : super(key: key);

  @override
  _DrawerFavoritesRowState createState() => _DrawerFavoritesRowState();
}

class _DrawerFavoritesRowState extends State<DrawerFavoritesRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 15, left: 23),
            child: SvgPicture.asset(
              ("assets/favorite.svg"),
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            'Избранные',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
