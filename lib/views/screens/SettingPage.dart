import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/controller/Theme_Controller.dart';
import 'package:sky_scrapper_app/utils/BackGround_utils.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: NetworkImage(
      //             'https://i.pinimg.com/564x/ef/0e/0c/ef0e0c39a7dda3e3077faaf052c1edc2.jpg'),
      //         fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("SettingPage"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Consumer<ThemeController>(builder: (context, p, _) {
              return Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 290,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(bgImage),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(color: Color(0xff5E86B2)),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20 + 10,
                                ),
                                Text(
                                  '10:30',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BlurryContainer(
                                  child: Container(
                                    height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  blur: 10,
                                  width: 180,
                                  height: 50,
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                BlurryContainer(
                                  child: Container(
                                    height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  blur: 10,
                                  width: 180,
                                  height: 50,
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Light",
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              activeColor: Colors.black54,
                              value: 'light',
                              groupValue: p.GroupValue,
                              onChanged: (val) {
                                p.setGroupValue(val: val.toString());
                                p.changeTheme(val: false);
                              },
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 290,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(bgImage),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(color: Color(0xff5E86B2)),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20 + 10,
                                ),
                                Text(
                                  '10:30',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BlurryContainer(
                                  child: Container(
                                    height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  blur: 10,
                                  width: 180,
                                  height: 50,
                                  color: Colors.black54.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                BlurryContainer(
                                  child: Container(
                                    height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  blur: 10,
                                  width: 180,
                                  height: 50,
                                  color: Colors.black54.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Dark",
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              activeColor: Colors.white,
                              value: 'dark',
                              groupValue: p.GroupValue,
                              onChanged: (val) {
                                p.setGroupValue(val: val.toString());
                                p.changeTheme(val: true);
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
