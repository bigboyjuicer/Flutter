import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


// WIDGET IMPORTS //
import 'package:cupertino_learning/pages/homeWidgets/drawerWidgets/drawer_weather_app_title.dart';
import 'package:cupertino_learning/pages/homeWidgets/drawerWidgets/drawer_settings_row.dart';
import 'package:cupertino_learning/pages/homeWidgets/drawerWidgets/drawer_favorites_row.dart';
import 'package:cupertino_learning/pages/homeWidgets/drawerWidgets/drawer_info_row.dart';
import '../favorites.dart';
import '../info.dart';
import '../settings.dart';
import 'drawerWidgets/drawer_transition.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(top: 45),
          color: Theme.of(context).dialogBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WeatherAppTitle(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, drawerTransition(const Settings())).then((value) => setState(() {}));
                },
                child: const DrawerSettingsRow(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, drawerTransition(const Favorites()));
                },
                child: const DrawerFavoritesRow(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, drawerTransition(const Info()));
                },
                child: const DrawerInfoRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

