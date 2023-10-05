import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/controller/Weather_Controller.dart';

import '../../components/FeelsLike_Humididty_Row.dart';
import '../../components/Min_Max_TempartureRow.dart';
import '../../components/Sunset_SunRiseRow.dart';
import '../../components/Visibility_Pressure_Row.dart';
import '../../components/Wind.dart';
import '../../controller/Theme_Controller.dart';
import '../../utils/BackGround_utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(bgImage), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Weather",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Consumer<WeatherController>(builder: (context, p, _) {
            return Column(
              children: [
                Container(
                  height: 50,
                  child: TextField(
                    onSubmitted: (val) {
                      p.setQuery(q: val.toString());
                      p.getData(
                        query: val.toString(),
                      );
                      showModalBottomSheet(
                        // useSafeArea: true,
                        isScrollControlled: true,
                        context: context,

                        builder: (context) => Container(
                          height: h - 70,
                          width: w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(bgImage),
                                fit: BoxFit.cover),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 300,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff073683).withOpacity(0.5),
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff113D87).withOpacity(0.3),
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff255B9F).withOpacity(0.2),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "${p.query}",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color:
                                                  (Provider.of<ThemeController>(
                                                              context,
                                                              listen: false)
                                                          .getTheme)
                                                      ? Colors.white
                                                      : Colors.black),
                                        ),
                                        Text(
                                          '${((p.weather!.temp - 32) * (5 / 9)).toInt()}°C',
                                          style: TextStyle(
                                              fontSize: 60,
                                              color:
                                                  (Provider.of<ThemeController>(
                                                              context,
                                                              listen: false)
                                                          .getTheme)
                                                      ? Colors.white
                                                      : Colors.black),
                                        ),
                                        Text(
                                          "${p.weather!.main}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color:
                                                  (Provider.of<ThemeController>(
                                                              context,
                                                              listen: false)
                                                          .getTheme)
                                                      ? Colors.white
                                                      : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        MinMaxTemprature(
                                          max_tem: p.weather!.temp_max,
                                          min_tem: p.weather!.temp_min,
                                          dt: p.weather!.dt,
                                          main: p.weather!.main,
                                        ),
                                        Wind(
                                          degree: p.weather!.wind_degree,
                                          speed: p.weather!.wind_speed,
                                        ),
                                        SunsetSunriseRow(
                                          sunrise: p.weather!.sunrise,
                                          sunset: p.weather!.sunset,
                                        ),
                                        FeelsLikeAndHumidityRow(
                                          feels_like: p.weather!.feels_like,
                                          humidity: p.weather!.humidity,
                                        ),
                                        VisibilityAndPressureRow(
                                          visibility: p.weather!.visibility,
                                          pressure: p.weather!.pressure,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      hintText: "Search for a city.",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.5))),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
