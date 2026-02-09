import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gram_connect/features/weather/data/repositories/weather_repository_impl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        title: Text(
          'GramConnect',
          style: TextStyle(
            color: Color(0xFF166534),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leadingWidth: 120,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                "assets/icons/Vector.png",
                color: Color(0xFF15803D),
                height: 25,
              ),
            ),
            GestureDetector(
              onTap: () {
                final weatherRepsotory = WeatherRepositoryImpl(dio: Dio());
                weatherRepsotory.getWeatherForecast(12.9591, 77.7000);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'location',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down_outlined, size: 12),
                ],
              ),
            ),
          ],
        ),
        actions: [Icon(Icons.notifications_outlined, size: 25)],
      ),
      backgroundColor: Color(0xFFF9FAFB),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome,',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Venkatesh',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              height: 120,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFFBFDBFE),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '28°C',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sunny',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'H: 32°C L: 25°C',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/sun.png', height: 40),
                      Column(
                        children: [
                          Text(
                            'Mon',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset('assets/icons/cloudy.png', height: 40),
                          Text('30°', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Tue',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset('assets/icons/cloud.png', height: 40),
                          Text('29°', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Wed',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset(
                            'assets/icons/rainy_weather.png',
                            height: 40,
                          ),
                          Text('27°', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
