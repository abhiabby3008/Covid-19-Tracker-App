import 'dart:convert';

import 'package:covidtracker/model/world_stats_model.dart';

import 'package:covidtracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldstatesApi> FetchWorldStatsapi() async {
    final response = await http.get(Uri.parse(AppUrl.worldstatesapi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldstatesApi.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> CountiresListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countrieslist));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
