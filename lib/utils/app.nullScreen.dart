
import 'package:flutter/material.dart';
import 'package:weatherapp/utils/colors.dart';

class NullUI extends StatelessWidget {
  const NullUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
