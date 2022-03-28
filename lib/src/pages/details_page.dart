import 'package:covid_trackers/src/config/hexColors.dart';
import 'package:covid_trackers/src/config/ktext.dart';
import 'package:covid_trackers/src/widget/rowItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String image;
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;
  final int active;
  final int critical;
  final int todayRecovered;
  final int test;
  DetailsPage(
      {required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: hexToColor('#303030'),
      appBar: AppBar(
        backgroundColor: hexToColor('#303030'),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: KText(
          text: widget.name,
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * .07),
                child: Card(
                  color: Colors.grey.shade700,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      RowItem(
                        title: 'Cases',
                        value: widget.totalCases.toString(),
                      ),
                      RowItem(
                        title: 'Recovered',
                        value: widget.totalRecovered.toString(),
                      ),
                      RowItem(
                        title: 'Deaths',
                        value: widget.totalDeaths.toString(),
                      ),
                      RowItem(
                        title: 'Active',
                        value: widget.active.toString(),
                      ),
                      RowItem(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                      RowItem(
                        title: 'TodayRecovered',
                        value: widget.todayRecovered.toString(),
                      ),
                      RowItem(
                        title: 'Test',
                        value: widget.test.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
