import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper_app/controller/Theme_Controller.dart';
import 'package:sky_scrapper_app/controller/Weather_Controller.dart';
import 'package:sky_scrapper_app/utils/MyRoutes.dart';
import 'package:sky_scrapper_app/views/screens/SearchPage.dart';
import 'package:sky_scrapper_app/views/screens/SettingPage.dart';
import 'package:sky_scrapper_app/views/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(preferences: preferences),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: Provider.of<ThemeController>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.SettingPage: (context) => SettingPage(),
        MyRoutes.SearchPage: (context) => SearchPage(),
      },
    );
  }
}
