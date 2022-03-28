import 'package:covid_trackers/src/config/hexColors.dart';
import 'package:covid_trackers/src/controller/api_controller.dart';
import 'package:covid_trackers/src/model/all_data.dart';
import 'package:covid_trackers/src/pages/countries_page.dart';
import 'package:covid_trackers/src/widget/rowItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final allDataC = Get.put(ApiController());
  late final AnimationController container =
      AnimationController(duration: Duration(seconds: 2), vsync: this)
        ..repeat();

  @override
  void dispose() {
    container.dispose();
    super.dispose();
  }

  final colorList = [
    Colors.black,
    Colors.red,
    Colors.greenAccent,
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: hexToColor('#303030'),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          FutureBuilder(
              future: allDataC.getRecords(),
              builder: ((context, AsyncSnapshot<AllData> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    child: Center(
                      child: SpinKitCubeGrid(
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      PieChart(
                        chartRadius: 130,
                        legendOptions: LegendOptions(
                            legendPosition: LegendPosition.left,
                            legendTextStyle: TextStyle(color: Colors.white)),
                        dataMap: {
                          'Total':
                              double.parse(snapshot.data!.cases.toString()),
                          'Recovered':
                              double.parse(snapshot.data!.recovered.toString()),
                          'Deaths':
                              double.parse(snapshot.data!.deaths.toString()),
                        },
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        animationDuration: Duration(milliseconds: 2000),
                        chartType: ChartType.disc,
                        colorList: colorList,
                      ),
                      // SizedBox(
                      //   height: size.height * 0.03,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Card(
                          color: Colors.grey.shade700,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              RowItem(
                                  title: 'Total',
                                  value: snapshot.data!.cases.toString()),
                              RowItem(
                                  title: 'Deaths',
                                  value: snapshot.data!.deaths.toString()),
                              RowItem(
                                  title: 'Recovered',
                                  value: snapshot.data!.recovered.toString()),
                              RowItem(
                                  title: 'Active',
                                  value: snapshot.data!.active.toString()),
                              RowItem(
                                  title: 'Critical',
                                  value: snapshot.data!.critical.toString()),
                              RowItem(
                                  title: 'TodayCases',
                                  value: snapshot.data!.todayCases.toString()),
                              RowItem(
                                  title: 'TodayDeaths',
                                  value: snapshot.data!.todayDeaths.toString()),
                              RowItem(
                                  title: 'TodayRecovered',
                                  value:
                                      snapshot.data!.todayRecovered.toString()),
                              RowItem(
                                  title: 'TodayDeaths',
                                  value: snapshot.data!.todayDeaths.toString()),
                              RowItem(
                                  title: 'Tests',
                                  value: snapshot.data!.tests.toString()),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      SizedBox(
                        width: size.width * 0.90,
                        height: 45,
                        child: ElevatedButton(
                          child: Text('Track Countries'),
                          onPressed: () {
                            Get.to(CountriesPage());
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  hexToColor('#285D99'))),
                        ),
                      ),
                    ],
                  );
                }
              })),
        ],
      ),
    );
  }
}
