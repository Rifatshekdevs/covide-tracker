// import 'package:json_annotation/json_annotation.dart';

// part 'data.g.dart';

// @JsonSerializable()
// class Data {
//   int? updated;
//   int? cases;
//   int? todayCases;
//   int? deaths;
//   int? todayDeaths;
//   int? recovered;
//   int? todayRecovered;
//   int? active;
//   int? critical;
//   int? casesPerOneMillion;
//   double? deathsPerOneMillion;
//   int? tests;
//   double? testsPerOneMillion;
//   int? population;
//   int? oneCasePerPeople;
//   int? oneDeathPerPeople;
//   int? oneTestPerPeople;
//   double? activePerOneMillion;
//   double? recoveredPerOneMillion;
//   double? criticalPerOneMillion;
//   int? affectedCountries;
//   Data({
//     required this.updated,
//     required this.active,
//     this.activePerOneMillion,
//     required this.affectedCountries,
//     required this.cases,
//     required this.casesPerOneMillion,
//     required this.critical,
//     required this.criticalPerOneMillion,
//     required this.deaths,
//     required this.deathsPerOneMillion,
//     required this.oneCasePerPeople,
//     required this.oneDeathPerPeople,
//     required this.oneTestPerPeople,
//     required this.population,
//     required this.recovered,
//     required this.recoveredPerOneMillion,
//     required this.tests,
//     required this.testsPerOneMillion,
//     required this.todayCases,
//     required this.todayDeaths,
//     required this.todayRecovered,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
//   Map<String, dynamic> toJson() => _$DataToJson(this);
// }
