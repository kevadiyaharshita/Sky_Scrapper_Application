import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/ColorStyle.dart';
import '../utils/Color_utils.dart';

class FeelsLikeAndHumidityRow extends StatelessWidget {
  int humidity;
  double feels_like;
  FeelsLikeAndHumidityRow(
      {super.key, required this.humidity, required this.feels_like});

  @override
  Widget build(BuildContext context) {
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
                      CupertinoIcons.thermometer,
                      color: IconTextColor(context),
                    ),
                    Gap(5),
                    Text(
                      'FEELS LIKE',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  '${((feels_like - 32) * (5 / 9)).toInt()}°C',
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                Text(
                  "Humidity is making",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                ),
                Text(
                  "it feel hotter ",
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
                      CupertinoIcons.cloud_fog,
                      color: IconTextColor(context),
                    ),
                    Gap(5),
                    Text(
                      'HUMIDITY',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  '$humidity%',
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                Text(
                  "The dew point is",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                ),
                Text(
                  "23° right now ",
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
    ;
  }
}
