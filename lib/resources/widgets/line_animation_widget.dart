import 'package:flutter/material.dart';
import 'package:app_shop/resources/utils/app_colors.dart';
class LineAninmationWidget extends StatefulWidget {
  const LineAninmationWidget({Key? key}) : super(key: key);

  @override
  State<LineAninmationWidget> createState() => _LineAninmationWidgetState();
}

class _LineAninmationWidgetState extends State<LineAninmationWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller=AnimationController(
    vsync:this,
    duration:const Duration(seconds:3),
  )..repeat(min:0 );
  late Animation<Offset>_animation=Tween(begin:Offset.zero,end:Offset(5,0)).animate(_controller);

  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  //   begin: Offset.zero,
  //   end: const Offset(10.0, 0.0),
  // ).animate(CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.linear,
  // ));



  @override
  Widget build(BuildContext context) {


    return Container(

      child:Stack(
        alignment:Alignment.topLeft,
        children: [
          Container(
            width:150,
            height:2,
            decoration:BoxDecoration(
                color:AppColors.mainColor
            ),
          ),
          SlideTransition(
            position:_animation,
            child: Container(
              width:30,
              height:3,
              decoration:BoxDecoration(
                  border:Border(
                      left:BorderSide(
                          width:5,
                          color:AppColors.bgWhite
                      ),
                      right:BorderSide(
                          width:5,
                          color:AppColors.bgWhite
                      )
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
