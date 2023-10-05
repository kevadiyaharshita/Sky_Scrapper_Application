import 'package:flutter/material.dart';
import '../views/helpers/Api_Helper.dart';
import '../views/modals/Wheather_Modal.dart';

class WeatherController extends ChangeNotifier {
  Weather? weather;
  List<String> city = ['surat'];
  String query = '';

  addCities({required String cityname}) {
    city.add(cityname);
    notifyListeners();
  }

  setQuery({required String q}) {
    query = q;
    notifyListeners();
  }

  WeatherController() {
    getData();
  }

  getData({String query = 'surat'}) async {
    weather = await ApiHelper.apiHelper.getWeatherData(query: query);
    notifyListeners();
  }
}
