import 'dart:async';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:app_shop/resources/widgets/button_widget.dart';

class SlideTransition_Image extends StatefulWidget {
  @override
  _SlideTransition_ImageState createState() => _SlideTransition_ImageState();
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

class AppCubit extends Cubit<int>{

    AppCubit():super(1);

  void abc()=> emit(state+1);

  void loaDD()  {
      emit(state+1);
  }

  void loadData() {
    emit(state+1);
  }

}



class _SlideTransition_ImageState extends State<SlideTransition_Image>
    with SingleTickerProviderStateMixin {
  late Size imageSize = const Size(0.00, 0.00);
  late AnimationController controller;
  late Animation<Offset> offset;
  late Animation<Offset> offset_button;



  void _getImageDimension() {
    Image image = Image.asset("images/img1.jpg");
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          setState(() {
            imageSize =
                Size(myImage.width.toDouble(), myImage.height.toDouble());
          });
        },
      ),
    );
  }

  void ExStreamController() async{
    var streamController= StreamController();
    streamController.stream.listen(print);
    streamController.sink.add("Tui là tân");
    streamController.sink.add(100);
    await Future.delayed(Duration(seconds: 2));
    await streamController.close();
    //streamController.isClosed;
  }

  void ExBradCastStream() async{

    var broadcastStreamController = StreamController.broadcast();

    broadcastStreamController.stream.listen((event) {
      print("đoạn thứ 1,$event");
    });

    broadcastStreamController.stream.listen((event) {
      print("doan thứ 2,${event+event}");
    });


    broadcastStreamController.stream.listen((event) {
      print("doan thứ 3,${event+event+event}");
    });
    broadcastStreamController.sink.add("tui la tân add");
    broadcastStreamController.sink.add(30);

    var future= await testStream().elementAt(1);
    print("elementAt:$future");

    print("lenght:${await testStream().length}");


    print("> 11 là: ${await testStream().firstWhere((element) => (element>12))}");
    
    print("< 16 là: ${await testStream().firstWhere((element) => (element <16))}");

    print("join char: ${await testStream().join(",")} ");

    var sum=0;
    await for (final val in testStream()){
      sum+=val;
    }
    print("Total: $sum");

    var outputstream= testStream().map((event) => (event/5));
    //  outputstream.listen(print);
   // print(outputstream);


    var outputstream1= testStream().where((event) => event>25);
    //outputstream1.listen(print);

   //testStream().where((event) => event>13).listen(print);
   
   //testStream().takeWhile((event) => event>10).listen(print, onDone: () => "Prin done");

   //testStream().takeWhile((event) => event > 3).listen(print, onDone: () => print('Done!'));

    //testStream().skipWhile((element) => element>10).listen(print);

    testcatchStream().handleError(print).listen(print);
    await Future.delayed(Duration(seconds: 2));
    await broadcastStreamController.close();
}

Stream<int> testcatchStream() async*{
    yield 5;
    yield 10;
    throw FormatException('lỗi rồi');
}

Stream<int> testStream() async*{

    yield 5;
    yield 10;
    yield 15;
    yield 20;
    yield 25;
    yield 28;
}

  @override
  void initState()  {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 4));
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.3)).animate(controller);

    offset_button = Tween<Offset>(begin: const Offset(0.0, 10.0), end: Offset(0.0, 8.0))
        .animate(controller);
  }

  @override
    void dispose() {
    controller.dispose();
    super.dispose();
  }
  double roundDouble(double value, int places){
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
          _getImageDimension();
        } else if (controller.status == AnimationStatus.dismissed) {
          controller.forward();
          _getImageDimension();
          var khunghinh= MediaQuery.of(context).size.height;
          print('Image Height khung : ${khunghinh} px');
          print('Image Height img : ${imageSize.height.toString()} px');
          var calimg=imageSize.height;
          //var imgcl= ((calimg-240)/240)*0.08;
          var imgscroll= ((calimg-khunghinh)/(calimg+200));
         // print(imgscroll);
          double possetimg_Scroll = roundDouble(-imgscroll, 2);
         // print(num4);
          if (possetimg_Scroll!=""){
            offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, possetimg_Scroll)).animate(controller);
          }
          else{
            offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.3)).animate(controller);
          }
          print(possetimg_Scroll);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
     padding: EdgeInsets.all(0),
     margin: EdgeInsets.all(5),
     decoration: BoxDecoration(
      color: Color(0xFFFFFFFF),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 15,
          blurRadius: 17,
          offset: Offset(0, 4 ), // changes position of shadow
        ),
      ],

    ),

        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Stack(
            children: [
             SlideTransition(
                position: offset,
                child: ImageList(),
              ),

              Align(
                //alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: offset_button,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: ButtonWidget(
                      label: "Bất động sản - Xây dựng",
                      paddingTop: 6,
                      paddingLeft: 5,
                      paddingRight: 5,
                      paddingBottom: 6,
                      textColor: Color(0XFF333333),
                      backgroundColor: Color(0XFFFFFFFF),
                      fontSize: 13,
                      borderColor: Color(0XFFFFFFFF),
                      borderRadius: 25.0,
                      listBoxShadow: [
                          BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 0 ), // changes position of shadow
                        ),
                        ],

                    ),
                  ),
                ),
              ),

              /*Align(
                alignment: Alignment.bottomCenter,
                child:  TextButton(
                  child: Text("CLick Me"),
                  onPressed: ExStreamController,
                ),
              ),*/

              Align(
                child: TextButton(
                  child: Text("Test Broad cast"),
                  onPressed: ExBradCastStream,
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
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/img1.jpg'),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      ),

    );
  }
}