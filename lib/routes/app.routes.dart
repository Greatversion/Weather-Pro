import 'package:flutter/material.dart';
import 'package:weatherapp/routes/app.routeNames.dart';
import 'package:weatherapp/views/app.detailsScreens.dart';
import 'package:weatherapp/views/app.homeScreen.dart';
import 'package:weatherapp/views/app.onBoardScreen.dart';
import 'package:weatherapp/views/app.searchScreen.dart';

class AppRoutes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case RoutesName.detailScreen:
        Map<String, dynamic> arguments = settings.arguments  as Map<String , dynamic>;
        return MaterialPageRoute(
          builder: (context) =>  WeatherDetailsScreen(city: arguments['cityName']),
        );
      case RoutesName.citySearchScreen:
        return MaterialPageRoute(
          builder: (context) => const CitySearchPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
    }
  }
}
