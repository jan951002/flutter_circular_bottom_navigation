import 'package:flutter/material.dart';
class DisplayContainer extends StatelessWidget{

  final Widget currentWidget;

  DisplayContainer(this.currentWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: currentWidget,
    );
  }

}