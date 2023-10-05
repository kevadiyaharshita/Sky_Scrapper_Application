import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/controller/Theme_Controller.dart';

import '../utils/ColorStyle.dart';
import '../utils/Color_utils.dart';
import '../views/modals/Wheather_Modal.dart';

class MinMaxTemprature extends StatelessWidget {
  double min_tem;
  double max_tem;
  int dt;
  String main;

  MinMaxTemprature(
      {super.key,
      required this.min_tem,
      required this.max_tem,
      required this.dt,
      required this.main});

  @override
  Widget build(BuildContext context) {
    DateTime d;

    d = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    print('${d.hour}:${d.minute}:${d.second} / ${d.day}/${d.month}/${d.year}');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlurryContainer(
          child: Container(
            height: 180,
            width: 180,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme1.withOpacity(0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.thermometer_sun,
                      color: IconTextColor(context),
                    ),
                    Gap(3),
                    Text(
                      'HIGH TEMPRATURE',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  '${((max_tem - 32) * (5 / 9)).toInt()}°C',
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                Text(
                  "Weather: $main on",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                ),
                Text(
                  "${d.day}/${d.month}/${d.year} ",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                )
              ],
            ),
          ),
        ),
        BlurryContainer(
          child: Container(
            height: 180,
            width: 180,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme1.withOpacity(0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.thermometer_snowflake,
                      color: IconTextColor(context),
                    ),
                    Gap(3),
                    Text(
                      'LOW TEMPRATURE',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  '${((min_tem - 32) * (5 / 9)).toInt()}°C',
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                Text(
                  "Weather: $main on",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                ),
                Text(
                  "${d.day}/${d.month}/${d.year} ",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
