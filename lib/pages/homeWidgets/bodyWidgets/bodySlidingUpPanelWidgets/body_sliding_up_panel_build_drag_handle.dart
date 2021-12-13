import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class BuildDragHandle extends StatefulWidget {
  const BuildDragHandle({Key? key}) : super(key: key);

  @override
  _BuildDragHandleState createState() => _BuildDragHandleState();
}

class _BuildDragHandleState extends State<BuildDragHandle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}

