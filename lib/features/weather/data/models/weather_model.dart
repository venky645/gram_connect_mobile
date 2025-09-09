import 'package:gram_connect/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temperatureMax,
    required super.temperatureMin,
    required super.rainSum,
    required super.windSpeedMax,
    required super.windDirectionDominant,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return WeatherModel(
      temperatureMax: List<double>.from(data['temperature_max'] ?? []),
      temperatureMin: List<double>.from(data['temperature_min'] ?? []),
      rainSum: List<double>.from(data['rain_sum'] ?? []),
      windSpeedMax: List<double>.from(data['wind_speed_max'] ?? []),
      windDirectionDominant: List<int>.from(
        data['wind_direction_dominant'] ?? [],
      ),
    );
  }
}
