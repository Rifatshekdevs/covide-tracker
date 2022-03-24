import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  final FontWeight? fontWeight;
  final int? maxLines;

  KText({
    required this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: fontSize != null ? fontSize : 14,
        fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
        color: color != null ? color : Colors.black54,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    );
  }
}
