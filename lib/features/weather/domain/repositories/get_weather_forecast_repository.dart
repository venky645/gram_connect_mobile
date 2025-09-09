import 'package:gram_connect/features/weather/domain/entities/weather.dart'
    show Weather;

abstract class WeatherRepository {
  Future<Weather> getWeatherForecast(double lat, double lon);
}
