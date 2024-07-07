import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/provider/app.weatherProvider.dart';

import 'package:weatherapp/routes/app.routeNames.dart';
import 'package:weatherapp/routes/app.routes.dart';

import 'controller/provider/app.SearchScreenprovider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherDataProvider>(
            create: (context) => WeatherDataProvider()),
        ChangeNotifierProvider<SearchScreenProvider>(
            create: (context) => SearchScreenProvider())
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        // home: const HomeScreen(),

        initialRoute: RoutesName.onboarding,
        onGenerateRoute: (settings) => AppRoutes.generatedRoute(settings),
      ),
    );
  }
}
