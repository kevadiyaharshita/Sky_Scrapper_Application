import 'dart:math';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/components/FeelsLike_Humididty_Row.dart';
import 'package:sky_scrapper_app/components/Min_Max_TempartureRow.dart';
import 'package:sky_scrapper_app/components/Sunset_SunRiseRow.dart';
import 'package:sky_scrapper_app/components/Visibility_Pressure_Row.dart';
import 'package:sky_scrapper_app/components/Wind.dart';
import 'package:sky_scrapper_app/controller/Theme_Controller.dart';
import 'package:sky_scrapper_app/controller/Weather_Controller.dart';
import 'package:sky_scrapper_app/utils/BackGround_utils.dart';
import 'package:sky_scrapper_app/utils/MyRoutes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: Center(
          child: StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  if (snapShot.data == ConnectivityResult.none) {
                    return Column(
                      children: [
                        Spacer(),
                        Transform.scale(
                            scale: 0.8,
                            child: Image.asset('assets/images/not.png')),
                        Text(
                          "No Connection !",
                          style: TextStyle(fontSize: 22),
                        ),
                        Spacer(),
                      ],
                    );
                  } else {
                    return Consumer<WeatherController>(
                      builder: (context, p, _) {
                        return (p.weather != null)
                            ? Column(
                                children: [
                                  CarouselSlider(
                                    items: [
                                      Container(
                                        height: h - 70,
                                        width: w,
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
                                                    color: Color(0xff073683)
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                Container(
                                                  height: 250,
                                                  width: 250,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff113D87)
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                Container(
                                                  height: 200,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff255B9F)
                                                        .withOpacity(0.2),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        p.weather!.name,
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        '${((p.weather!.temp - 32) * (5 / 9)).toInt()}°C',
                                                        style: TextStyle(
                                                            fontSize: 60,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        "${p.weather!.main}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      // Text(
                                                      //   "H:${p.weather!.temp_max}° L:${p.weather!.temp_min}°",
                                                      //   style: TextStyle(
                                                      //       color: (Provider.of<ThemeController>(
                                                      //                   context,
                                                      //                   listen: false)
                                                      //               .getTheme)
                                                      //           ? Colors.white
                                                      //           : Colors.black),
                                                      // ),
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
                                                        max_tem:
                                                            p.weather!.temp_max,
                                                        min_tem:
                                                            p.weather!.temp_min,
                                                        dt: p.weather!.dt,
                                                        main: p.weather!.main,
                                                      ),
                                                      Wind(
                                                        degree: p.weather!
                                                            .wind_degree,
                                                        speed: p.weather!
                                                            .wind_speed,
                                                      ),
                                                      SunsetSunriseRow(
                                                        sunrise:
                                                            p.weather!.sunrise,
                                                        sunset:
                                                            p.weather!.sunset,
                                                      ),
                                                      FeelsLikeAndHumidityRow(
                                                        feels_like: p.weather!
                                                            .feels_like,
                                                        humidity:
                                                            p.weather!.humidity,
                                                      ),
                                                      VisibilityAndPressureRow(
                                                        visibility: p.weather!
                                                            .visibility,
                                                        pressure:
                                                            p.weather!.pressure,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: h - 70,
                                        width: w,
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
                                                    color: Color(0xff073683)
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                Container(
                                                  height: 250,
                                                  width: 250,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff113D87)
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                Container(
                                                  height: 200,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff255B9F)
                                                        .withOpacity(0.2),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Surat",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        '${((p.weather!.temp - 32) * (5 / 9)).toInt()}°C',
                                                        style: TextStyle(
                                                            fontSize: 60,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        "${p.weather!.main}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
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
                                                        max_tem:
                                                            p.weather!.temp_max,
                                                        min_tem:
                                                            p.weather!.temp_min,
                                                        dt: p.weather!.dt,
                                                        main: p.weather!.main,
                                                      ),
                                                      Wind(
                                                        degree: p.weather!
                                                            .wind_degree,
                                                        speed: p.weather!
                                                            .wind_speed,
                                                      ),
                                                      SunsetSunriseRow(
                                                        sunrise:
                                                            p.weather!.sunrise,
                                                        sunset:
                                                            p.weather!.sunset,
                                                      ),
                                                      FeelsLikeAndHumidityRow(
                                                        feels_like: p.weather!
                                                            .feels_like,
                                                        humidity:
                                                            p.weather!.humidity,
                                                      ),
                                                      VisibilityAndPressureRow(
                                                        visibility: p.weather!
                                                            .visibility,
                                                        pressure:
                                                            p.weather!.pressure,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: h - 70,
                                        width: w,
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
                                                    color: Color(0xff073683)
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                Container(
                                                  height: 250,
                                                  width: 250,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff113D87)
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                Container(
                                                  height: 200,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff255B9F)
                                                        .withOpacity(0.2),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Surat",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        '${((p.weather!.temp - 32) * (5 / 9)).toInt()}°C',
                                                        style: TextStyle(
                                                            fontSize: 60,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        "${p.weather!.main}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: (Provider.of<
                                                                            ThemeController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getTheme)
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      // Text(
                                                      //   "H:${p.weather!.temp_max}° L:${p.weather!.temp_min}°",
                                                      //   style: TextStyle(
                                                      //       color: (Provider.of<ThemeController>(
                                                      //                   context,
                                                      //                   listen: false)
                                                      //               .getTheme)
                                                      //           ? Colors.white
                                                      //           : Colors.black),
                                                      // ),
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
                                                        max_tem:
                                                            p.weather!.temp_max,
                                                        min_tem:
                                                            p.weather!.temp_min,
                                                        dt: p.weather!.dt,
                                                        main: p.weather!.main,
                                                      ),
                                                      Wind(
                                                        degree: p.weather!
                                                            .wind_degree,
                                                        speed: p.weather!
                                                            .wind_speed,
                                                      ),
                                                      SunsetSunriseRow(
                                                        sunrise:
                                                            p.weather!.sunrise,
                                                        sunset:
                                                            p.weather!.sunset,
                                                      ),
                                                      FeelsLikeAndHumidityRow(
                                                        feels_like: p.weather!
                                                            .feels_like,
                                                        humidity:
                                                            p.weather!.humidity,
                                                      ),
                                                      VisibilityAndPressureRow(
                                                        visibility: p.weather!
                                                            .visibility,
                                                        pressure:
                                                            p.weather!.pressure,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                        autoPlay: false,
                                        initialPage: 0,
                                        height: h - 70,
                                        viewportFraction: 1,
                                        enlargeCenterPage: false),
                                  ),
                                  Container(
                                    height: 70,
                                    width: w,
                                    decoration: BoxDecoration(
                                      // color: Colors.white.withOpacity(0.3),
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      color: Color(0xff446D9B).withOpacity(0.8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            Navigator.of(context)
                                                .pushNamed(MyRoutes.SearchPage);
                                          },
                                          icon: Icon(
                                            CupertinoIcons
                                                .list_bullet_below_rectangle,
                                            size: 35,
                                            color:
                                                (Provider.of<ThemeController>(
                                                            context,
                                                            listen: false)
                                                        .getTheme)
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                MyRoutes.SettingPage);
                                          },
                                          icon: Icon(CupertinoIcons.settings,
                                              size: 35,
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
                                  )
                                ],
                              )
                            : Transform.scale(
                                scale: 2, child: CupertinoActivityIndicator());
                      },
                    );
                  }
                } else {
                  return Text("No Connection found");
                }
              }),
        ),
      ),
    );
  }
}
