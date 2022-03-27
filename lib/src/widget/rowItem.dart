import 'package:covid_trackers/src/config/ktext.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String title;
  final String value;
  RowItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(
                text: title,
                color: Colors.white70,
              ),
              KText(
                text: value,
                color: Colors.white70,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(
          height: 2,
        ),
      ],
    );
  }
}
