import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/src/provider.dart';

import 'loading.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('Избранные',
                        style: GoogleFonts.manrope(
                            fontSize: 23,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: (context.watch<MainProvider>().favoritesList).length,
                itemBuilder: (BuildContext context, int index){
                  return Neumorphic(
                    style: NeumorphicStyle(
                        color: Theme.of(context).cardColor,
                        depth: -3,
                        boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(14))),
                    margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.watch<MainProvider>().favoritesList[index],
                            style: GoogleFonts.manrope(
                              fontSize: 17,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(left: Radius.circular(14)),
                                color: Theme.of(context).buttonColor,
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            ),
                            onTap: () {
                              context.read<MainProvider>().deleteValueFavorites(context.read<MainProvider>().favoritesList[index]);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        context.read<MainProvider>().setPrimaryCity(context.read<MainProvider>().favoritesList[index]);
                        context.read<MainProvider>().panelOpen();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loading(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}