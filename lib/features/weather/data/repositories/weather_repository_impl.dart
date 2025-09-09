import 'package:dio/dio.dart';
import 'package:gram_connect/core/network/api_constants.dart';
import 'package:gram_connect/features/weather/data/models/weather_model.dart';
import 'package:gram_connect/features/weather/domain/entities/weather.dart';
import 'package:gram_connect/features/weather/domain/repositories/get_weather_forecast_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio dio;
  WeatherRepositoryImpl({required this.dio});
  @override
  Future<Weather> getWeatherForecast(double lat, double lon) async {
    final url = ApiConstants.getWeather;
    final response = await dio.get('$url?latitude=$lat&longitude=$lon');
    print(response);
    return WeatherModel.fromJson(response.data);
  }
}
