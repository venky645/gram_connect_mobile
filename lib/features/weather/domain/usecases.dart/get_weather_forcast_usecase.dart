import 'package:gram_connect/features/weather/domain/entities/weather.dart';
import 'package:gram_connect/features/weather/domain/repositories/get_weather_forecast_repository.dart'
    show WeatherRepository;

import '../../../../core/usecases/usecase.dart';

class GetWeatherForeCastUseCase extends Usecase<Weather, WeatherParams> {
  final WeatherRepository repository;

  GetWeatherForeCastUseCase({required this.repository});
  @override
  Future<Weather> call(WeatherParams params) {
    return repository.getWeatherForecast(params.latitude, params.longitude);
  }
}

class WeatherParams {
  final double longitude;
  final double latitude;

  WeatherParams({required this.latitude, required this.longitude});
}
