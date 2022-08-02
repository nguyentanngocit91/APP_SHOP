import 'package:flutter/material.dart';


class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() => new _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: Stack(
     children: [
      Padding(padding: EdgeInsets.all(0),
      child: AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return new Transform.rotate(angle: animationController.value * 3,
          child: child,
        );
      },
      child: new Container(
        height: 370,
        width: 476,
        child: new Image.asset('images/cercle-shape.png'),
      ),
    ),

    ),


    Positioned(
    left: 0,
    right: 0,
    top: 0,
    bottom: 25,
    child: Container(
    width: 330,
    height: 382,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/main-pic.png'),
    fit: BoxFit.fill,
    alignment: Alignment(0, 0),
    ),
    ),
    ),

    ),
    ],
    ),
    );
  }
}


