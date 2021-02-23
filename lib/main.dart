import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true; // Set to true for visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Center(child: _buildStack(context)),
      ),
    );
  }

  // #docregion Stack
  Widget _buildStack(BuildContext context) => Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      Image.asset(
        "assets/field.png",
        fit: BoxFit.fill,
        height: double.maxFinite,
      ),
      MoveableStackItem(0, 0, Colors.red),
      MoveableStackItem(0, 0, Colors.amber)
    ],
  );
// #enddocregion Stack
}

class MoveableStackItem extends StatefulWidget {

  double xPosition = 0;
  double yPosition = 0;
  Color color = Colors.blue;

  MoveableStackItem(this.xPosition, this.yPosition, this.color);

  @override State<StatefulWidget> createState() {
    return _MoveableStackItemState(this.xPosition, this.yPosition, this.color);
  }
}
class _MoveableStackItemState extends State<MoveableStackItem> {

  double xPosition = 0;
  double yPosition = 0;
  Color color = Colors.blue;

  _MoveableStackItemState(this.xPosition, this.yPosition, this.color);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: Container(
          width: 50,
          height: 50,
          color: color,
        ),
      ),
    );
  }
}