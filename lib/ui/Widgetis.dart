
import 'package:flutter/material.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'SliderWidget.dart';

 class Widgetis extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
   child:
   Image.network('https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/53F3BEB252DC18EDE9CD0307BDAF8B3191E08A8ED60E5359F71C5DA1D804FEBF/scale?aspectRatio=1.78&format=jpeg'),
      );
    
  }

 }