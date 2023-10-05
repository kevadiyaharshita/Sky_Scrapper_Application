import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/helpers/Api_Helper.dart';
import '../views/modals/Wheather_Modal.dart';

class WeatherController extends ChangeNotifier {
  Weather? weather;
  List<Weather?> allWeather = [];
  List<String> city = [];
  String query = '';
  SharedPreferences preferences;

  addCities({required String cityname}) {
    city.add(cityname);
    preferences.setStringList('city', city);
    notifyListeners();
  }

  setQuery({required String q}) {
    query = q;
    notifyListeners();
  }

  initCities() {
    allWeather.clear();
    city.forEach((element) async {
      Weather? w = await ApiHelper.apiHelper.getWeatherData(query: element);
      allWeather.add(w);
      print("Gated");
    });
    notifyListeners();
    return true;
  }

  WeatherController({required this.preferences}) {
    getData();
    city = preferences.getStringList('city') ?? ['surat'];
    city.forEach((element) async {
      Weather? w = await ApiHelper.apiHelper.getWeatherData(query: element);
      allWeather.add(w);
    });
  }

  getData({String query = 'surat'}) async {
    weather = await ApiHelper.apiHelper.getWeatherData(query: query);
    notifyListeners();
  }
}
