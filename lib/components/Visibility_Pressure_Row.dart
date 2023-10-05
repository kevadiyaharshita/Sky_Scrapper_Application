import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/ColorStyle.dart';
import '../utils/Color_utils.dart';

class VisibilityAndPressureRow extends StatelessWidget {
  int pressure;
  int visibility;
  VisibilityAndPressureRow(
      {super.key, required this.visibility, required this.pressure});

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
                      CupertinoIcons.eye_fill,
                      color: IconTextColor(context),
                    ),
                    Gap(3),
                    Text(
                      'VISIBILITY',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  '${visibility ~/ 1000} Km',
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                Text(
                  "Perfectly Clear view",
                  style: TextStyle(
                    fontSize: 16,
                    color: IconTextColor(context),
                  ),
                ),
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
                      CupertinoIcons.gauge,
                      color: IconTextColor(context),
                    ),
                    Gap(3),
                    Text(
                      'PRESSURE',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: IconTextColor(context)),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Text("Low"),
                              Spacer(),
                              Text("Hegh"),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/pressure.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      Column(
                        children: [
                          Spacer(),
                          Gap(40),
                          Text(
                            "$pressure",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "hPa",
                          ),
                          Gap(10),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
