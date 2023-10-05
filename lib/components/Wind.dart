import 'dart:math';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/controller/Theme_Controller.dart';

import '../utils/ColorStyle.dart';
import '../utils/Color_utils.dart';

class Wind extends StatelessWidget {
  int degree;
  double speed;
  Wind({super.key, required this.degree, required this.speed});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return BlurryContainer(
      child: Container(
        width: w,
        height: 180,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme1.withOpacity(0.6),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.wind,
                    color: IconTextColor(context),
                  ),
                  Gap(3),
                  Text(
                    'WIND',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: IconTextColor(context)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '$speed',
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "KPH",
                                    style: TextStyle(
                                      color: IconTextColor(context),
                                    ),
                                  ),
                                  Text("Wind"),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            color: Provider.of<ThemeController>(context,
                                        listen: false)
                                    .getTheme
                                ? Colors.white54
                                : Colors.black54,
                          ),
                          Row(
                            children: [
                              Text(
                                '$degree',
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DEG",
                                    style: TextStyle(
                                      color: IconTextColor(context),
                                    ),
                                  ),
                                  Text("Degree"),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        // color: Colors.grey,
                        alignment: Alignment.center,
                        child: Stack(
                          children: List.generate(
                            60,
                            (index) => Transform.rotate(
                              angle: (index * (pi * 2)) / 60,
                              child: Divider(
                                // thickness: (index % 5 == 0) ? 3 : 1,
                                color: (index % 5 == 0)
                                    ? Colors.red
                                    : Provider.of<ThemeController>(context,
                                                listen: false)
                                            .getTheme
                                        ? Colors.white
                                        : Colors.black,
                                endIndent:
                                    (index % 5 == 0) ? 150 * 0.8 : 150 * 0.8,
                                indent: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 70,
                        child: Text(
                          'N',
                        ),
                      ),
                      Positioned(
                        top: 65,
                        left: 35,
                        child: Text(
                          'W',
                        ),
                      ),
                      Positioned(
                        top: 65,
                        right: 35,
                        child: Text(
                          'E',
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 70,
                        child: Text(
                          'S',
                        ),
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 2,
                        // indent: 2,
                        // endIndent: w / 2,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
