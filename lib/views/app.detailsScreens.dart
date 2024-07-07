import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/controller/provider/app.weatherProvider.dart';
import 'package:weatherapp/models/currentModel.dart';
import 'package:weatherapp/models/weatherDataModel.dart';
// import 'package:weatherapp/routes/app.routeNames.dart';
import 'package:weatherapp/utils/app.nullScreen.dart';
import 'package:weatherapp/utils/colors.dart';
import 'package:weatherapp/utils/glassEffect.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String? city;
  const WeatherDetailsScreen({required this.city, super.key});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    // Request location permission
    WeatherDataProvider weatherDataProvider =
        Provider.of<WeatherDataProvider>(context, listen: false);
    weatherDataProvider.getWeatherData(widget.city!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherDataProvider>(
          builder: (context, dataProvider, child) {
        NetworkModel? networkCityModel = dataProvider.weatherModel;

        // NetworkModel? networkCityModel = dataProvider.weatherModel;
        return Stack(
          children: [
            networkCityModel == null
                ? const NullUI()
                : Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: networkCityModel.current!.isDay == 0
                            ? Image.asset(
                                'assets/weathers_images/night.png',
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/weathers_images/windy.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "📍",
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                        '${networkCityModel.location!.name}, ${networkCityModel.location!.country}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Outfit",
                                            fontSize: 18,
                                            color: AppColors.background)),
                                  ],
                                ),
                                Text(
                                    DateFormat('MMM dd, hh:mm a')
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Outfit",
                                        fontSize: 14,
                                        color: AppColors.background)),
                              ],
                            ),
                            const SizedBox(height: 13),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.pushNamed(
                            //         context, RoutesName.citySearchScreen);
                            //   },
                            //   child: const GlassMorphic(
                            //     widget: Padding(
                            //       padding: EdgeInsets.all(8.0),
                            //       child: Row(
                            //         children: [
                            //           Icon(Icons.search,
                            //               color: AppColors.background),
                            //           SizedBox(width: 15),
                            //           Text(
                            //             'Search Your Location..',
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.w600,
                            //                 fontFamily: "Outfit",
                            //                 fontSize: 18,
                            //                 color: AppColors.background),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     height: 46,
                            //     width: double.infinity,
                            //     radius: 10,
                            //   ),
                            // ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${networkCityModel.current!.tempC}ºC',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Outfit",
                                        fontSize: 80,
                                        color: AppColors.background),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${networkCityModel.current!.condition!.text}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Outfit",
                                            fontSize: 16,
                                            color: AppColors.background),
                                      ),
                                      Image.network(
                                        'https:${networkCityModel.current!.condition!.icon.toString()}',
                                        height: 20,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "${networkCityModel.location!.tzId}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Outfit",
                                        fontSize: 25,
                                        color: AppColors.background),
                                  ),
                                  Text(
                                    "Feels like ${networkCityModel.current!.feelslikeC}ºC",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Outfit",
                                        fontSize: 22,
                                        color: AppColors.background),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GlassMorphic(
                              width: double.infinity,
                              height: 120,
                              radius: 18,
                              widget: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 80,
                                            child: Image.asset(
                                                'assets/icons/11.png')),
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 14,
                                              color: AppColors.background),
                                        ),
                                        Text(
                                          "${networkCityModel.forecast!.forecastday.first.astro!.sunrise}",
                                          style: const TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 12,
                                              color: AppColors.background),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 80,
                                            child: Image.asset(
                                                'assets/icons/12.png')),
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 14,
                                              color: AppColors.background),
                                        ),
                                        Text(
                                          "${networkCityModel.forecast!.forecastday.first.astro!.sunset}",
                                          style: const TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 12,
                                              color: AppColors.background),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 80,
                                            child: Image.asset(
                                                'assets/icons/13.png')),
                                        const Text(
                                          'Temp Max.',
                                          style: TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 14,
                                              color: AppColors.background),
                                        ),
                                        Center(
                                          child: Text(
                                            "${networkCityModel.forecast!.forecastday.first.day!.maxtempC}ºC",
                                            style: const TextStyle(
                                                fontFamily: "ReadexPro",
                                                fontSize: 12,
                                                color: AppColors.background),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 80,
                                            child: Image.asset(
                                                'assets/icons/14.png')),
                                        const Text(
                                          'Temp Min.',
                                          style: TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 14,
                                              color: AppColors.background),
                                        ),
                                        Text(
                                          "${networkCityModel.forecast!.forecastday.first.day!.mintempC}ºC",
                                          style: const TextStyle(
                                              fontFamily: "ReadexPro",
                                              fontSize: 12,
                                              color: AppColors.background),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            const Text(
                              'Today',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Outfit",
                                  fontSize: 22,
                                  color: AppColors.background),
                            ),
                            const SizedBox(height: 15),
                            // Using SizedBox instead of Expanded to avoid RenderBox error

                            // networkCityModel
                            //           .forecast!.forecastday.first.hour.length
                            SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 24,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: GlassMorphic(
                                        height: 180,
                                        width: 110,
                                        radius: 15,
                                        widget: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                DateFormat('hh:mm a').format(
                                                    DateTime.parse(
                                                        networkCityModel
                                                            .forecast!
                                                            .forecastday
                                                            .first
                                                            .hour[index]
                                                            .time
                                                            .toString())),
                                                style: const TextStyle(
                                                    fontFamily: "ReadexPro",
                                                    fontSize: 15,
                                                    color:
                                                        AppColors.background),
                                              ),
                                              Image.network(
                                                'https:${networkCityModel.forecast!.forecastday.first.hour[index].condition!.icon.toString()}',
                                              ),
                                              Text(
                                                "${networkCityModel.forecast!.forecastday.first.hour[index].tempC}ºC",
                                                style: const TextStyle(
                                                    fontFamily: "ReadexPro",
                                                    fontSize: 23,
                                                    color:
                                                        AppColors.background),
                                              ),
                                              Text(
                                                "Feels like ${networkCityModel.forecast!.forecastday.first.hour[index].feelslikeC}ºC",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Outfit",
                                                    fontSize: 11,
                                                    color:
                                                        AppColors.background),
                                              ),
                                              Text(
                                                "Wind : ${networkCityModel.forecast!.forecastday.first.hour[index].windKph}Km/h",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Outfit",
                                                    fontSize: 11,
                                                    color:
                                                        AppColors.background),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        );
      }),
    );
  }
}
