import 'dart:html';

import 'package:flutter/material.dart';
import 'package:app_shop/resources/views/home/imageRotate.dart';
import 'package:app_shop/resources/views/home/collapse_expanstionTile.dart';
import 'package:app_shop/resources/views/home/mb_contact_form.dart';
import 'package:app_shop/resources/widgets/shape_ImageRotate_Customer.dart';
import 'package:app_shop/resources/views/home/exGetSizeImage.dart';


import 'package:app_shop/resources/views/home/blocExample.dart';


class HomeScreen extends StatelessWidget{

  const HomeScreen({Key? key}):super(key: key);



  @override
  Widget build (BuildContext context){

    return SafeArea(

        child: Scaffold(
          body: SingleChildScrollView(
              //padding: const EdgeInsets.all(10),
            child: Column(
              children: [



                Padding(padding: EdgeInsets.all(30),
                   child:  ImageRotate(),
                ),

                Padding(padding: EdgeInsets.all(15)),

                Shape_ImageRotate_Customer(),

                Padding(padding: EdgeInsets.all(15)),

                ExpanstionTitle(),

                //ImageSize(),

                Padding(padding: EdgeInsets.all(15)),
                MBContactForm(key: null,destinationEmail: "tanit91.nina@gmail.com",withIcons: true,hasHeading: true),

              ],
            ),
          ),

        )

    );

  }
}