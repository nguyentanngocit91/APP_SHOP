import 'package:flutter/material.dart';
class AnimatedAlign_Image extends StatefulWidget {
  const AnimatedAlign_Image({Key? key}) : super(key: key);

  @override
  State<AnimatedAlign_Image> createState() => _AnimatedAlign_ImageState();
}

class _AnimatedAlign_ImageState extends State<AnimatedAlign_Image> {


  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },

    child: Container(
      width: 300.0,
      height:350.0,
      color: Colors.white,
      child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.all(0),
              child: Center(
                child: Container(
                  width: 300.0,
                  height:840.0,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              child: AnimatedAlign(
                alignment: selected ? Alignment.topCenter : Alignment.bottomCenter,
                duration: const Duration(seconds: 3),
                curve: Curves.fastOutSlowIn,
                child: ImageList(),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class ImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        width: 360,
        height: 740,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('images/demo-36-2337.jpg'),
    fit: BoxFit.fitHeight,
    alignment: Alignment(0, 0),
    ),
    ),
    );

  }

}
