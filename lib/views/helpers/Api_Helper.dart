import 'dart:convert';

import '../modals/Wheather_Modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String Api =
      "https://api.openweathermap.org/data/2.5/weather?q=surat&appid=217d9466fcece181f108ef7574f237b4&units=imperial";

  Future<Weather?> getWeatherData({String query = 'surat'}) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=217d9466fcece181f108ef7574f237b4&units=imperial'));
    print('query = $query');
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      Weather weather = Weather.fromMap(data: data);

      return weather;
    } else {
      return null;
    }
  }
}
