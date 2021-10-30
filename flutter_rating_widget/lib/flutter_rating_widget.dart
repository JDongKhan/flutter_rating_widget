library flutter_rating_widget;

import 'package:flutter/material.dart';

///五星 评价
class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({
    Key key,
    this.value = 0.0,
    this.maxValue = 5,
    this.iconSize = 16,
    this.icon = Icons.star,
  }) : super(key: key);

  final double value;
  final int maxValue;
  final double iconSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    List<Widget> maxChildren = List.generate(
      maxValue,
      (index) => Icon(
        icon,
        size: iconSize,
        color: Colors.grey,
      ),
    );

    int v = value > maxValue ? maxValue : value.toInt();

    List<Widget> children = List.generate(
      v,
      (index) => Icon(
        icon,
        size: iconSize,
        color: Colors.yellow,
      ),
    );

    if (value % 1 != 0) {
      children.add(ClipRect(
        child: Align(
          alignment: Alignment.topLeft,
          widthFactor: value % 1,
          child: Icon(
            icon,
            size: iconSize,
            color: Colors.yellow,
          ),
        ),
      ));
    }

    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: maxChildren,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        )
      ],
    );
  }
}
