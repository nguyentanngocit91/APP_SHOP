import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double? widthButton;
  final String? label;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final bool? isBold;
  final Color? borderColor;
  final double? borderRadius;

  final Widget? iconWidget;
  final double? heightIcon;

  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  final List<BoxShadow>? listBoxShadow;

  final VoidCallback? onPress;

  const ButtonWidget(
      {Key? key,
        this.backgroundColor,
        this.textColor,
        this.onPress,
        this.label,
        this.fontSize = 16,
        this.borderRadius = 0,
        this.borderColor = Colors.white,
        this.isBold = false,
        this.widthButton,
        this.paddingTop = 12,
        this.paddingBottom = 12,
        this.paddingLeft = 12,
        this.paddingRight = 12,
        this.listBoxShadow,
        this.iconWidget,
        this.heightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(

          width: widthButton,
          padding: EdgeInsets.only(
              top: paddingTop!,
              bottom: paddingBottom!,
              left: paddingLeft!,
              right: paddingRight!),
          child: Row(
              children: [

            if (iconWidget != null) ...[
              Container(height: heightIcon, child: iconWidget)
            ],
            Expanded(
                child: Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight:
                      isBold == true ? FontWeight.bold : FontWeight.normal),
                ))
          ]),
          decoration: BoxDecoration(
              boxShadow: listBoxShadow,
              color: backgroundColor,
              border: Border.all(
                  color: borderColor!, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(borderRadius!)),
        ));
  }
}
