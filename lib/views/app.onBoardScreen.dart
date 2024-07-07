import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weatherapp/routes/app.routeNames.dart';
import 'package:weatherapp/utils/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeOnboarding();
    // Navigate to the HomeScreen after a delay
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(RoutesName.homeScreen);
    });
  }

  Future<void> initializeOnboarding() async {
    // Request location permission
    await Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen background image
          Positioned.fill(
            child: Image.asset(
              "assets/weathers_images/cloudy.png",
              fit: BoxFit.cover,
            ),
          ),
          // Centered text
          const Center(
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures column size fits its children
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.background,
                  size: 80,
                ),
                SizedBox(height: 15), // Space between the icon and text
                Text(
                  'WEATHER PLUS',
                  style: TextStyle(
                    fontFamily: 'ReadexPro',
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10), // Space between the texts
                Text(
                  'Advanced Weather Forecast Application',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: AppColors.background,
                    fontSize: 16, // Adjusted font size for better readability
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
