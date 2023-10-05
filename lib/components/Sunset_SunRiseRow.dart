import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/ColorStyle.dart';
import '../utils/Color_utils.dart';

class SunsetSunriseRow extends StatelessWidget {
  int sunrise;
  int sunset;
  SunsetSunriseRow({super.key, required this.sunrise, required this.sunset});

  @override
  Widget build(BuildContext context) {
    DateTime sunriseD;

    sunriseD = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);

    DateTime sunsetD = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);

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
                      CupertinoIcons.sunrise_fill,
                      color: IconTextColor(context),
                    ),
                    Gap(5),
                    Text(
                      'SUNRISE',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Container(
                  height: 83,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sunrise.png'),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "0${sunriseD.hour}:${sunriseD.minute}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Gap(3),
                    Column(
                      children: [
                        Gap(4),
                        Text(
                          "AM",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                      CupertinoIcons.sunset_fill,
                      color: IconTextColor(context),
                    ),
                    Gap(5),
                    Text(
                      'SUNSET',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Container(
                  height: 83,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sunset.png'),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "0${sunsetD.hour % 12}:${sunsetD.minute}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Gap(3),
                    Column(
                      children: [
                        Gap(4),
                        Text(
                          "PM",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
