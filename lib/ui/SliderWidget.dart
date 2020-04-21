import 'package:flutter/material.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/ui/CustomSliderThumbRect.dart';

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  SliderWidget(
      {this.sliderHeight = 48,
      this.max = 500,
      this.min = 0,
      this.fullWidth = false});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {


  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Stack(
        children: <Widget>[
         Padding(
              padding: EdgeInsets.only(top:50),
              child:
          ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                  color: Color(0xff82cc00),
                  width: 80,
                  margin: const EdgeInsets.only(top: 0.0),
                  height: 45))),
                    Padding(
              padding: EdgeInsets.only(top:50),
              child:
          Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                      color: Color(0xff183047),
                      width: 80,
                      margin: const EdgeInsets.only(top: 0.0),
                      height: 45)))),


                
          Padding(
              padding: EdgeInsets.only(right: 21.0, left: 21, top:50),
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color(0xff82cc00),
                    
                    inactiveTrackColor: Color(0xff183047),

                    trackHeight: 45.0,
                    thumbShape: CustomSliderThumbRect(
                      thumbHeight: 55,
                      thumbRadius: this.widget.sliderHeight * .4,
                      min: this.widget.min,
                      max: this.widget.max,
                    ),
                    overlayShape: CustomSliderThumbRect(
                      thumbHeight: 50,
                      thumbRadius: this.widget.sliderHeight * .4,
                      min: this.widget.min,
                      max: this.widget.max,
                    ),
                    overlayColor: Colors.red.withOpacity(.4),
                    //valueIndicatorColor: Colors.white,
                    activeTickMarkColor: Colors.green,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                   min: 0,
                      max: 5000000,
                      value: rng,
                      onChangeStart: (value) {
                          setState(() {
                        libre = true;
                        print(libre);
                        });
                      },
                       onChangeEnd: (value) {
                         setState(() {
                        libre = false;
                        print(libre);
                        });
                      },
                      onChanged: (value) {



                        setState(() {
                            libre = true;
                          
                          rng = value;
                          toggleprice(value);
                        });
                        
                        print(value);
                      }),
                ),
              )),
      
          /*Text(
              '${this.widget.max}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            */
            Visibility(
  child: Positioned(
               top:0,
           width:80,
              left:((MediaQuery.of(context).size.width-104)* (rng/5000000)),
              
              child: 
                ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child:
              Container(
                width:70,
                height:45,
                color:rng > 0 ? Color(0xff82bb20) : Color(0xff27415b),


                                child:
              Center( child: 
              Text(priceConvert(rng),   style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 13),))
            ))),
  visible: libre,
),
                 
        ],
      ),
    );
  }
}
