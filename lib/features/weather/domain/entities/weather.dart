class Weather {
  final List<double> temperatureMax;
  final List<double> temperatureMin;
  final List<double> rainSum;
  final List<double> windSpeedMax;
  final List<int> windDirectionDominant;

  const Weather({
    required this.temperatureMax,
    required this.temperatureMin,
    required this.rainSum,
    required this.windSpeedMax,
    required this.windDirectionDominant,
  });
}
