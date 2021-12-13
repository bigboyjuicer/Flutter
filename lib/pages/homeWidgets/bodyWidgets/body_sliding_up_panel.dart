import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// WIDGETS IMPORTS //
import 'package:cupertino_learning/pages/homeWidgets/bodyWidgets/bodySlidingUpPanelWidgets/body_sliding_up_panel_build_drag_handle.dart';
import 'bodySlidingUpPanelWidgets/body_sliding_up_panel_additional_info.dart';
import 'bodySlidingUpPanelWidgets/body_sliding_up_panel_time_temp.dart';
import 'bodySlidingUpPanelWidgets/body_sliding_up_panel_weekly_forecast_button.dart';
import 'package:cupertino_learning/provider/provider.dart';

class BodySlidingUpPanel extends StatefulWidget {

  const BodySlidingUpPanel({
    Key? key,
  }) : super(key: key);

  @override
  _BodySlidingUpPanelState createState() => _BodySlidingUpPanelState();
}

class _BodySlidingUpPanelState extends State<BodySlidingUpPanel>
    with SingleTickerProviderStateMixin {

  PanelController panelController = PanelController();

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<Offset> additionInfoOffset = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(
      parent: animationController, curve: Curves.easeInOut));

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SlidingUpPanel(
      minHeight: height * 0.39,
      maxHeight: height * 0.7,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      color: Theme.of(context).bottomAppBarColor,
      controller: panelController,
      panelBuilder: (controller) => PanelWidget(
        panelController: panelController,
        animationController: animationController,
        additionalInfoOffset: additionInfoOffset,
      ),
      onPanelClosed: () {
        context.read<MainProvider>().panelOpen();
        animationController.reverse();
      },
      onPanelOpened: () {
        context.read<MainProvider>().panelClose();
        animationController.forward();
      },
    );
  }
}

class PanelWidget extends StatelessWidget {
  final PanelController panelController;
  final AnimationController animationController;
  final Animation<Offset> additionalInfoOffset;

  const PanelWidget({
    Key? key,
    required this.panelController,
    required this.animationController,
    required this.additionalInfoOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
      children: [
        const BuildDragHandle(),
        const DateTimeTemperature(),
        Visibility(
          visible: context.watch<MainProvider>().isVisible,
          replacement: AdditionalInfo(animationController: animationController, additionalInfoOffset: additionalInfoOffset,),
          child: const WeeklyForecastButton(),
        ),
      ],
    );
  }
}
