class Weather {
  String main;
  String description;
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int humidity;
  int visibility;
  double wind_speed;
  int wind_degree;
  String country;
  int sunrise;
  int sunset;
  int dt;
  String name;

  Weather({
    required this.main,
    required this.description,
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.wind_speed,
    required this.wind_degree,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.dt,
    required this.name,
  });

  factory Weather.fromMap({required Map data}) {
    return Weather(
      main: data["weather"][0]["main"],
      description: data["weather"][0]["description"],
      temp: data["main"]["temp"],
      feels_like: data["main"]["feels_like"].toDouble(),
      temp_min: data["main"]["temp_min"],
      temp_max: data["main"]["temp_max"],
      pressure: data["main"]["pressure"],
      humidity: data["main"]["humidity"],
      visibility: data["visibility"],
      wind_speed: data["wind"]["speed"],
      wind_degree: data["wind"]["deg"],
      country: data['sys']['country'],
      sunrise: data['sys']['sunrise'],
      sunset: data['sys']['sunset'],
      dt: data['dt'],
      name: data['name'],
    );
  }
}
