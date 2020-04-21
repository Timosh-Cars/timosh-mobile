import 'package:flutter/material.dart';
import 'package:timosh_app/providers/Sort.dart';

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbRadius;
  final thumbHeight;
  final int min;
  final int max;

  const CustomSliderThumbRect({
    this.thumbRadius,
    this.thumbHeight,
    this.min,
    this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    
  }) {
    
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: center, width: 80, height: 45),
      Radius.circular(12),
    );

    final paint = Paint()
      ..color = rng > 0 ? Color(0xff82bb20) : Color(0xff27415b)
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      
        style: new TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: libre == true ? rng > 0 ? Color(0xff82bb20) : Color(0xff27415b) : Colors.white,
          
            height: 0.9),
        text: priceConvert(rng));
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawRRect(rRect, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return ((max) * (value)*1000).round().toString();
  }
}