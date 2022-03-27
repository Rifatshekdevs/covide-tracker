import 'dart:convert';

import 'package:covid_trackers/src/model/all_data.dart';
import 'package:covid_trackers/src/ults/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  Future<AllData> getRecords() async {
    final res = await http.get(Uri.parse(ApiUrl.fetchApi));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return AllData.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> getCountries() async {
    var data;
    final res = await http.get(Uri.parse(ApiUrl.fetchCountires));

    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
      print(data);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
