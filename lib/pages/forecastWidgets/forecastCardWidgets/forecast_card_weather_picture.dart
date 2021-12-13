import 'package:cupertino_learning/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class WeatherPicture extends StatefulWidget {
  final int index;

  const WeatherPicture({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _WeatherPictureState createState() => _WeatherPictureState();
}

class _WeatherPictureState extends State<WeatherPicture> {
  @override
  Widget build(BuildContext context) {
    Map data = context.read<MainProvider>().forEachDay(widget.index);

    String asset = '';
    if(data["weather"].toLowerCase() == 'thunderstorm'){
      asset = 'assets/thunderstorm.png';
    }
    else if(data["weather"].toLowerCase() == 'drizzle' || data['weather'].toLowerCase() == 'rain'){
      asset = 'assets/rain.png';
    }
    else if(data["weather"].toLowerCase() == 'snow'){
      asset = 'assets/snow.png';
    }
    else if(data["weather"].toLowerCase() == 'clear'){
      asset = 'assets/clear.png';
    }
    else if(data["weather"].toLowerCase() == 'clouds' && data['description'] == 'few clouds'){
      asset = 'assets/partly_cloud.png';
    }
    else {
      asset = 'assets/clouds.png';
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Image.asset(
        asset,
        width: 76,
        height: 85,
      ),
    );
  }
}