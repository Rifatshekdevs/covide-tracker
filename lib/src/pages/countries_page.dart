import 'package:covid_trackers/src/config/ktext.dart';
import 'package:covid_trackers/src/controller/api_controller.dart';
import 'package:covid_trackers/src/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CountriesPage extends StatefulWidget {
  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  TextEditingController searchController = TextEditingController();
  final allDataC = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    allDataC.getCountries();
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Search country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: allDataC.getCountries(),
                builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return shimmarLoad();
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(DetailsPage());
                                  },
                                  child: ListTile(
                                    title: KText(
                                      text: snapshot.data![index]['country'],
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    subtitle: KText(
                                      text: snapshot.data![index]['cases']
                                          .toString(),
                                      color: Colors.white,
                                    ),
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                  ),
                                )
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                ListTile(
                                  title: KText(
                                    text: snapshot.data![index]['country'],
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  subtitle: KText(
                                    text: snapshot.data![index]['cases']
                                        .toString(),
                                    color: Colors.white,
                                  ),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                })),
          )
        ],
      ),
    );
  }

  ListView shimmarLoad() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                ListTile(
                  title: Container(
                    height: 10,
                    width: 89,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    height: 10,
                    width: 89,
                    color: Colors.white,
                  ),
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        });
  }
}
