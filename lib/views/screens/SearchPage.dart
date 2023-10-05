import 'dart:developer';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
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
      // decoration: BoxDecoration(
      //     image:
      //         DecorationImage(image: NetworkImage(bgImage), fit: BoxFit.fill)),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
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
          child: Consumer<WeatherController>(builder: (context, pro, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: TextField(
                      onSubmitted: (val) async {
                        pro.setQuery(q: val.toString());
                        await pro.getData(
                          query: val.toString(),
                        );
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Consumer<WeatherController>(
                              builder: (context, p, _) {
                            // log("CITY: ${p.weather!.name}");
                            return (p.weather != null)
                                ? Container(
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
                                    child: (p.weather != null)
                                        ? Stack(
                                            children: [
                                              Row(
                                                children: [
                                                  Spacer(),
                                                  TextButton(
                                                    onPressed: () {
                                                      p.addCities(
                                                          cityname: p.query);
                                                      p.initCities();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "Add",
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                                  0xff073683)
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 250,
                                                        width: 250,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                                  0xff113D87)
                                                              .withOpacity(0.3),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 200,
                                                        width: 200,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                                  0xff255B9F)
                                                              .withOpacity(0.2),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              "${p.weather!.name}",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: (Provider.of<ThemeController>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .getTheme)
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black),
                                                            ),
                                                            Text(
                                                              '${((p.weather!.temp - 32) * (5 / 9)).toInt()}°C',
                                                              style: TextStyle(
                                                                  fontSize: 60,
                                                                  color: (Provider.of<ThemeController>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .getTheme)
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black),
                                                            ),
                                                            Text(
                                                              "${p.weather!.main}",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: (Provider.of<ThemeController>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .getTheme)
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
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
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            MinMaxTemprature(
                                                              max_tem: p
                                                                  .weather!
                                                                  .temp_max,
                                                              min_tem: p
                                                                  .weather!
                                                                  .temp_min,
                                                              dt: p.weather!.dt,
                                                              main: p.weather!
                                                                  .main,
                                                            ),
                                                            Wind(
                                                              degree: p.weather!
                                                                  .wind_degree,
                                                              speed: p.weather!
                                                                  .wind_speed,
                                                            ),
                                                            SunsetSunriseRow(
                                                              sunrise: p
                                                                  .weather!
                                                                  .sunrise,
                                                              sunset: p.weather!
                                                                  .sunset,
                                                            ),
                                                            FeelsLikeAndHumidityRow(
                                                              feels_like: p
                                                                  .weather!
                                                                  .feels_like,
                                                              humidity: p
                                                                  .weather!
                                                                  .humidity,
                                                            ),
                                                            VisibilityAndPressureRow(
                                                              visibility: p
                                                                  .weather!
                                                                  .visibility,
                                                              pressure: p
                                                                  .weather!
                                                                  .pressure,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                  )
                                : Text("NO Data Found");
                          }),
                        );
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        hintText: "Search for a city.",
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
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
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 18),
                    child: (pro.allWeather.isNotEmpty)
                        ? SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                pro.city.length,
                                (index) {
                                  DateTime d;
                                  print('$index');
                                  d = DateTime.fromMillisecondsSinceEpoch(
                                      pro.allWeather[index]!.dt * 1000);

                                  return Container(
                                    width: w,
                                    height: 110,
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://i.pinimg.com/564x/68/08/1e/68081e7b9547970200ab1f7cdba369a5.jpg'),
                                          fit: BoxFit.cover),
                                      // color: Colors.pink,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  pro.allWeather[index]!.name,
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Feel like ${((pro.allWeather[index]!.feels_like - 32) * (5 / 9)).toInt()}°',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Text(
                                              '${((pro.allWeather[index]!.temp - 32) * (5 / 9)).toInt()}°C',
                                              style: TextStyle(
                                                  fontSize: 34,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              '${pro.allWeather[index]!.main}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              'H:${((pro.allWeather[index]!.temp_max - 32) * (5 / 9)).toInt()}° L:${((pro.allWeather[index]!.temp_min - 32) * (5 / 9)).toInt()}°',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(
                            height: h,
                            width: w,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Spacer(),
                                Transform.scale(
                                  scale: 3,
                                  child: CupertinoActivityIndicator(),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
