import 'package:flutter/material.dart';
import 'package:app_shop/resources/widgets/title_widget.dart';
import 'package:app_shop/resources/views/home/tab_customer.dart';
import 'package:app_shop/resources/widgets/button_widget.dart';

class Shape_ImageRotate_Customer extends StatefulWidget {
  @override
  _Shape_ImageRotate_CustomerState createState() => new _Shape_ImageRotate_CustomerState();
}

class _Shape_ImageRotate_CustomerState extends State<Shape_ImageRotate_Customer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late VoidCallback? onPress;

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

     // alignment: Alignment.center,
      child:Column(

        children: [
        Container(
        width: double.maxFinite,
        height: 900,
          child:Stack(

            children: [
              Container(
                height: 217,
                alignment: Alignment.topRight,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget? child) {
                    return new Transform.rotate(angle: animationController.value * 3,
                      child: child,
                    );
                  },
                  child: new Container(
                    alignment: Alignment.topRight,
                    height: 217,
                    width: 217,
                    child: new Image.asset('images/shape11.png'),
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 80,
                child: Column(
                  children: [
                    TitleWidget(nameTitle: "KHÁCH HÀNG THIẾT KẾ WEBSITE TẠI NINA",lineIndex: CrossAxisAlignment.center),
                    Container(
                      margin: EdgeInsets.all(15),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    TabView_Customer(),
                  ],
                ),
              ),

            ],

          ),
        ),

          Container(
            padding: EdgeInsets.all(25),
            child:  Row(
              children: <Widget>[
                Expanded(
                  child: ButtonWidget(
                    label: "Xem thêm mẫu mới",
                    widthButton: 300,
                    heightIcon: 57,
                    paddingTop: 15,
                    paddingLeft: 5,
                    paddingRight: 5,
                    paddingBottom: 15,
                    textColor: Colors.white,
                    backgroundColor: Color(0XFFc5122a),
                    fontSize: 18,
                    borderColor: Color(0XFFc5122a),
                    borderRadius: 25.0,
                    //onPress: onPress,
                  ),
                ),
              ],
            ),
          ),

        ],


      ),



    );
  }
}


