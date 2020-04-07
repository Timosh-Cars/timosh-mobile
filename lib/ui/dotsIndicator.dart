import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  // 487.0,696.0
  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;
  Color mainColor = Color(0xffffff).withOpacity(0.3);

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;
  Widget _buildDot(int index) {
    double selectedness = max(
      0.0,
      1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
    );

    if (selectedness > 0.5)
      mainColor = Color(0xffffff).withOpacity(1);
    else
      mainColor = Color(0xffffff).withOpacity(0.3);

    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;

    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(
              left: 2,
              right: 2,
            ),
            child: new Container(
              width: _kDotSpacing,
              child: new Center(
                child: new Material(
                  color: mainColor,
                  type: MaterialType.card,
                  child: new Container(
                    height: 3,
                    child: new InkWell(
                      onTap: () => onPageSelected(index),
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}