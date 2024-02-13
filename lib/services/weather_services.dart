import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'ec199ee73ade48ee8a7231016231211';
  final dio = Dio();

  WeatherServices(Dio dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      final Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('oops there was an error, try later');
    }
  }
}
