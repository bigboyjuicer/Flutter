import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/src/provider.dart';
import 'package:weather/weather.dart';

import 'loading.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, right: 3),
                      child: TextField(
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Введите название города...',
                          hintStyle: TextStyle(
                            color: Theme.of(context).selectedRowColor,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.cancel),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              _controller.clear();
                            },
                            splashRadius: 0.1,
                          ),
                        ),
                        onSubmitted: (String value) async {
                          try {
                            WeatherFactory wf = WeatherFactory(
                                "4c482b2b39876867234fef1aa96b628d",
                                language: Language.RUSSIAN);
                            Weather w =
                                await wf.currentWeatherByCityName(value);
                            context.read<MainProvider>().addValueHistory(value);
                            context.read<MainProvider>().setPrimaryCity(value);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Loading()),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: Theme.of(context).cardColor,
                                content: Text(
                                  'Неверно введен город',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                title: Text(
                                  'Ошибка',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              barrierDismissible: true,
                            );
                            print('ERROR: $e');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: (context.watch<MainProvider>().historyList).length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 15, left: 20, bottom: 5),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Text(
                                (context
                                    .watch<MainProvider>()
                                    .historyList)[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                context.read<MainProvider>().setPrimaryCity(
                                    context
                                        .read<MainProvider>()
                                        .historyList[index]);
                                context.read<MainProvider>().panelOpen();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Loading(),
                                  ),
                                );
                              },
                            ),
                            AnimatedCrossFade(
                                firstChild: GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.star_border,
                                        color: Theme.of(context).primaryColor),
                                    margin: const EdgeInsets.only(right: 15),
                                  ),
                                  onTap: () {
                                    context
                                        .read<MainProvider>()
                                        .addValueFavorites(context
                                            .read<MainProvider>()
                                            .historyList[index]);
                                  },
                                ),
                                secondChild: GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.star,
                                        color: Theme.of(context).primaryColor),
                                    margin: const EdgeInsets.only(right: 15),
                                  ),
                                  onTap: () {
                                    context
                                        .read<MainProvider>()
                                        .deleteValueFavorites(context
                                            .read<MainProvider>()
                                            .historyList[index]);
                                  },
                                ),
                                crossFadeState: (context
                                            .watch<MainProvider>()
                                            .favoritesList)
                                        .contains(context
                                            .read<MainProvider>()
                                            .historyList[index])
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 300))
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                    child: Divider(
                      color: Theme.of(context).primaryColor,
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
