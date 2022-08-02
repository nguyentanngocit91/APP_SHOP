import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StringText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double line_height;
  final int? maxline;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final VoidCallback? onPress;


  StringText({
    Key? key,
    this.color =const Color(0xFF333333),
    required this.text,
    this.size = 16,
    this.textAlign=TextAlign.center,
    this.onPress,
    this.maxline,
    this.fontWeight=FontWeight.normal, this.line_height=1.3,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress ,
      child: Text(
        text,
        textAlign:textAlign,
        maxLines:maxline,

        style: TextStyle(
          fontSize: size,
          height:line_height,
          color: color,
          fontFamily:'Roboto',
          fontWeight:fontWeight,

        ),
      ),
    );
  }
}
