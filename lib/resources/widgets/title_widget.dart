import 'package:flutter/material.dart';
import 'line_animation_widget.dart';
import 'string_text_widget.dart';

class TitleWidget extends StatelessWidget {
  final String nameTitle;
  final CrossAxisAlignment lineIndex;

  const TitleWidget(
      {Key? key,
        required this.nameTitle,
        this.lineIndex = CrossAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: lineIndex,
        children: [
          StringText(
              text: this.nameTitle,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.bold,
              size: 17),
          SizedBox(
            height: 5,
          ),
          LineAninmationWidget(),
        ],
      ),
    );
  }
}
