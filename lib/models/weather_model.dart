class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String weatherCondition;
  WeatherModel(
      {required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherCondition,
      required this.cityName,
      required this.date});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
